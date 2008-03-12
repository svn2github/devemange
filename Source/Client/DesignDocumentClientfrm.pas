unit DesignDocumentClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseChildfrm, ComCtrls, ExtCtrls, StdCtrls, Buttons, ActnList,
  Grids, Menus,

  ExcelUnits,            
  ClientTypeUnits, DB, DBClient, CheckLst, DBCtrls;

type
  TDesignDocumentClientDlg = class(TBaseChildDlg)
    tvProject: TTreeView;
    Splitter1: TSplitter;
    ActionList1: TActionList;
    pmExcel: TPopupMenu;
    N4: TMenuItem;
    N2: TMenuItem;
    N1: TMenuItem;
    miFixedRow: TMenuItem;
    miFixRow: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N51: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    miFixedCol: TMenuItem;
    N11: TMenuItem;
    N22: TMenuItem;
    N32: TMenuItem;
    N42: TMenuItem;
    N52: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    cdsData: TClientDataSet;
    actProject_AddDir: TAction;
    pmProject: TPopupMenu;
    N8: TMenuItem;
    actProject_DelDir: TAction;
    N9: TMenuItem;
    actProject_AddExcel: TAction;
    N10: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    cdsText: TClientDataSet;
    dsText: TDataSource;
    pltxt: TPanel;
    DBMemo1: TDBMemo;
    DBText1: TDBText;
    plDocTool: TPanel;
    BitBtn1: TBitBtn;
    act_SaveDoc: TAction;
    act_CancelDoc: TAction;
    BitBtn2: TBitBtn;
    procedure miFixedRowClick(Sender: TObject);
    procedure miFixedColClick(Sender: TObject);
    procedure actProject_AddDirUpdate(Sender: TObject);
    procedure actProject_AddDirExecute(Sender: TObject);
    procedure tvProjectExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure actProject_DelDirUpdate(Sender: TObject);
    procedure actProject_DelDirExecute(Sender: TObject);
    procedure actProject_AddExcelUpdate(Sender: TObject);
    procedure actProject_AddExcelExecute(Sender: TObject);
    procedure tvProjectChange(Sender: TObject; Node: TTreeNode);
    procedure act_SaveDocExecute(Sender: TObject);
    procedure act_SaveDocUpdate(Sender: TObject);
    procedure act_CancelDocUpdate(Sender: TObject);
    procedure act_CancelDocExecute(Sender: TObject);
    procedure tvProjectEdited(Sender: TObject; Node: TTreeNode;
      var S: String);
    procedure tvProjectEditing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
  private
    fCurrentDoc : PProjectDoc; //当前文件
    function GetCurrentExcel: TExcelFile;

    procedure LoadProject(ANode:TTreeNode;APID:integer);
    procedure ClearNode(ANode:TTreeNode);  //清空
  private
    property CurrentExcel : TExcelFile read GetCurrentExcel;
  public
    { Public declarations }
    procedure initBase; override;
    procedure freeBase; override;
    class function GetModuleID : integer;override;
  end;


implementation

uses
  ClinetSystemUnits,
  DmUints;

{$R *.dfm}

function TDesignDocumentClientDlg.GetCurrentExcel: TExcelFile;
begin
  Result := fCurrentDoc^.fExcelfile;
end;

procedure TDesignDocumentClientDlg.miFixedRowClick(Sender: TObject);
var
  myCount : integer;
begin
  if not Assigned(CurrentExcel) then Exit;
  if CurrentExcel.fFixedRow = (Sender as TMenuItem).Tag then Exit;
  myCount := (Sender as TMenuItem).Tag + 1;
  CurrentExcel.fFixedRow := myCount -1;
  CurrentExcel.fmodify := True;
end;

procedure TDesignDocumentClientDlg.miFixedColClick(Sender: TObject);
var
  myCount : integer;
begin
  if not Assigned(CurrentExcel) then Exit;
  if CurrentExcel.fFixedCols = (Sender as TMenuItem).Tag then Exit;
  myCount := (Sender as TMenuItem).Tag + 1;
  CurrentExcel.fFixedCols := myCount -1;
  CurrentExcel.fmodify := True;
end;

procedure TDesignDocumentClientDlg.LoadProject(ANode: TTreeNode;
  APID: integer);
var
  mySQL : string;
  myNode : TTreeNode;
  myData,myParent : PProjectDoc;
  myb : Boolean;

const
  glSQL  = 'select * from TB_PRO_DOCUMENT where ZPID=%d Order by ZSORT';
begin
  //
  mySQL := format(glSQL,[APID]);
  cdsData.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));

  myb := fLoading;
  fLoading := True;
  tvProject.Items.BeginUpdate;
  try
    ClearNode(ANode);
    if ANode = nil then
      myParent := nil
    else
      myParent := ANode.data;

    cdsData.First;
    while not cdsData.Eof do
    begin
      new(myData);
      myData^.fParent := myParent;
      myData^.fID  := cdsData.FieldByName('ZID').AsInteger;
      myData^.fPid := cdsData.FieldByName('ZPID').AsInteger;
      myData^.fStyle := cdsData.FieldByName('ZSTYLE').AsInteger;
      myData^.fName := cdsData.FieldByName('ZNAME').AsString;
      myData^.fSort := cdsData.FieldByName('ZSORT').AsInteger;
      myData^.fhasChild := cdsData.FieldByName('ZHASCHILD').AsBoolean;
      myData^.fExcelFile := nil;
      myNode := tvProject.Items.AddChild(ANode,myData^.fName);
      myNode.Data := myData;

      if myData^.fhasChild then
      begin
        myData^.fIsLoad := False;
        tvProject.Items.AddChildFirst(myNode,'加载数据...');
      end
      else
        myData^.fIsLoad := True; //没有子级，当做已加载了


      if myData^.fStyle = 0 then
      begin
        if myData^.fPid = -1 then
        begin
          mynode.ImageIndex := 0;
          mynode.SelectedIndex := 0;
        end
        else begin
          mynode.ImageIndex := 1;
          mynode.SelectedIndex := 2;
        end;
      end
      else begin
        myNode.ImageIndex := 3;
        myNode.SelectedIndex := 4;
      end;
      cdsData.Next;
    end;
    if Assigned(myParent) then
      myParent^.fIsLoad := True; 
  finally
    tvProject.Items.EndUpdate;
    fLoading := myb;
  end;
end;

procedure TDesignDocumentClientDlg.initBase;
begin
  inherited;
  LoadProject(nil,-1); //加载根目录
  fCurrentDoc := nil;
end;

procedure TDesignDocumentClientDlg.freeBase;
begin
  ClearNode(nil);
  inherited;
end;

procedure TDesignDocumentClientDlg.ClearNode(ANode: TTreeNode);
var
  myChild ,myBorther : TTreeNode;
  myData : PProjectDoc;
begin
  if Assigned(ANode) then
  begin
    myChild := ANode.getFirstChild;
    myBorther := ANode.getNextSibling;
    while Assigned(myChild) and (myBorther <>myChild)  do
    begin
      if Assigned(myChild.Data) then
      begin
        myData := myChild.Data;
        if Assigned(myData^.fExcelFile) then
          myData^.fExcelFile.Free;
        Dispose(myData);
      end;
      myChild := myChild.GetNext;
    end;
    ANode.DeleteChildren;
  end
  else begin
    myChild := tvProject.TopItem;
    while Assigned(myChild) do
    begin
      if Assigned(myChild.Data) then
      begin
        myData := myChild.Data;
        if Assigned(myData^.fExcelFile) then
          myData^.fExcelFile.Free;
        Dispose(myData);
      end;
      myChild := myChild.GetNext;
    end;
  end;
end;

procedure TDesignDocumentClientDlg.actProject_AddDirUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(tvProject.Selected)
  and Assigned(tvProject.Selected.data);
end;

procedure TDesignDocumentClientDlg.actProject_AddDirExecute(
  Sender: TObject);
var
  myData : PProjectDoc;
  myName : string;
  mySQL  : string;
const
  glSQL  = 'insert TB_PRO_DOCUMENT (ZPID,ZNAME,ZSTYLE,ZHASCHILD) ' +
           'values(%d,''%s'',0,0)';
  glSQL2 = 'update TB_PRO_DOCUMENT set ZHASCHILD=1 where ZID=%d';
begin
  myData := tvProject.Selected.data;
  //权限
  if not HasModuleActionByShow(Ord(bsDocTree),myData.fID,atInsert) then
    Exit;

  myName := InputBox('新建目录','目录名称','');
  myName := Trim(myName);
  if myName = '' then Exit;


  mySQL := format(glSQL,[myData^.fID,myName]);

  ClientSystem.fDbOpr.BeginTrans;
  try
    ClientSystem.fDbOpr.ExeSQL(pChar(mySQL));
    mySQL := format(glSQL2,[myData^.fID]);
    ClientSystem.fDbOpr.ExeSQL(pChar(mySQL));
    ClientSystem.fDbOpr.CommitTrans;
    LoadProject(tvProject.Selected,myData^.fID);
  except
    ClientSystem.fDbOpr.RollbackTrans;
  end;


end;

procedure TDesignDocumentClientDlg.tvProjectExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
var
  myNodeData : PProjectDoc;
begin
  myNodeData := Node.Data;
  if myNodeData^.fhasChild and
     not myNodeData^.fIsLoad then
    LoadProject(Node,myNodeData^.fID);
end;

procedure TDesignDocumentClientDlg.actProject_DelDirUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(tvProject.Selected)
  and Assigned(tvProject.Selected.data)
  and Assigned(tvProject.Selected.Parent);
end;

procedure TDesignDocumentClientDlg.actProject_DelDirExecute(
  Sender: TObject);
var
  myPData : PProjectDoc; //上级的ID
  myNodeData : PProjectDoc;
  mySQL : string;
const
  glSQL   = 'delete TB_PRO_DOCUMENT where ZID=%d';
  glSQL2  = 'select count(*) from TB_PRO_DOCUMENT where ZPID=%d';
  glSQL3  = 'update TB_PRO_DOCUMENT set ZHASCHILD=0 where ZID=%d';
begin
  myNodeData := tvProject.Selected.data;
  //权限
  if not HasModuleActionByShow(Ord(bsDocTree),myNodeData.fID,atInsert) then
    Exit;

  if myNodeData^.fhasChild then
  begin
    MessageBox(Handle,'分部下有内容，不能删除。','删除',MB_ICONERROR+MB_OK);
    Exit;
  end;
  myPData := myNodeData^.fParent;

  if MessageBox(Handle,'确定删除分部?','删除',
    MB_ICONQUESTION+MB_YESNO)=IDNO then
    Exit;

  mySQL := format(glSQL,[myNodeData^.fID]);

  ClientSystem.fDbOpr.BeginTrans;
  try
    mySQL := format(glSQL,[myNodeData^.fID]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
    mySQL := format(glSQL2,[myPData^.fID]);
    if ClientSystem.fDbOpr.ReadInt(PChar(mySQL)) = 0 then
    begin
      mySQL := format(glSQL3,[myPData^.fID]);
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      myPData^.fhasChild := False;
      myPData^.fIsLoad   := False;
    end;
    ClientSystem.fDbOpr.CommitTrans;
    tvProject.Selected.Delete;
    Dispose(myNodeData);
    //LoadProject(tvProject.Selected.Parent,myPdata^.fID);
  except
    ClientSystem.fDbOpr.RollbackTrans;
  end;
end;

procedure TDesignDocumentClientDlg.actProject_AddExcelUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(tvProject.Selected)
  and Assigned(tvProject.Selected.data)
  and (PProjectDoc(tvProject.Selected.data)^.fStyle=0);
end;

procedure TDesignDocumentClientDlg.actProject_AddExcelExecute(
  Sender: TObject);
var
  myName : string;
  myNodeData : PProjectDoc;
  myfileid : integer;
  myExcelFile : TExcelFile;
  mySQL : string;
const
  glSQL  = 'insert TB_PRO_DOCUMENT (ZPID,ZNAME,ZSTYLE, ' +
           ' ZHASCHILD,ZDOCTYPE) ' +
           'values(%d,''%s'',1,0,0)';
  glSQL1 = 'update TB_PRO_DOCUMENT set ZHASCHILD=1 where ZID=%d';
begin
  myNodeData := tvProject.Selected.data;
  //权限
  if not HasModuleActionByShow(Ord(bsDocTree),myNodeData.fID,atInsert) then
    Exit;

  myName := InputBox('新建文档','名称:','');
  myName := Trim(myName);
  if myName = '' then Exit;

  myExcelFile := TExcelFile.Create;
  try
     myfileid := -1;

    ClientSystem.fDbOpr.BeginTrans;
    try
      mySQL := format(glSQL,[myNodeData^.fID,myName]);
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));

      if not myNodeData^.fhasChild then
      begin
        mySQL := format(glSQL1,[myNodeData^.fID]);
        ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
        myNodeData^.fhasChild := True;
      end;
      ClientSystem.fDbOpr.CommitTrans;

      LoadProject(tvProject.Selected,myNodeData^.fID);
    except
      ClientSystem.fDbOpr.RollbackTrans;
      if myfileid >=0 then
        ClientSystem.fDbOpr.DeleteFile(myfileid);
    end;

  finally
    myExcelFile.Free;
  end;
end;

procedure TDesignDocumentClientDlg.tvProjectChange(Sender: TObject;
  Node: TTreeNode);
var
  myData : PProjectDoc;
const
  mySQL = 'select ZID,ZCONTEXT,ZNAME from TB_PRO_DOCUMENT where ZID=%d  ';
begin
  if fLoading then Exit;
  if not Assigned(Node) or not Assigned(Node.data) then Exit;
  myData := Node.data;

  if myData.fStyle = 0 then
    Self.ShowStatusBarText(2,format('分部号=%d',[myData^.fid]))
  else
    Self.ShowStatusBarText(3,format('文件号=%d',[myData^.fid]));

  //权限
  if not HasModuleActionByShow(Ord(bsDocTree),myData.fID,atView) then
  begin
    Exit;
  end;

  //修改了，要更新
  if act_SaveDoc.Enabled then
    act_SaveDocExecute(nil);

  if myData.fStyle = 0 then
  begin
    cdsText.Close;
    Exit;
  end;

  cdsText.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(Format(mySQL,[
    myData.fID])));



end;

procedure TDesignDocumentClientDlg.act_SaveDocExecute(Sender: TObject);
var
  myData : PProjectDoc;
const
  mySQL = 'update TB_PRO_DOCUMENT set ZCONTEXT=''%s'' where ZID=%d ';
begin
  if fLoading then Exit;
  if not Assigned(tvProject.Selected) or
     not Assigned(tvProject.Selected.data) then Exit;
  myData := tvProject.Selected.data;

  //权限
  if not HasModuleActionByShow(Ord(bsDocTree),myData.fID,atUpdate) then
    Exit;

  if cdsText.State in [dsEdit, dsInsert] then
  begin
    cdsText.Post;
    ClientSystem.fDbOpr.ExeSQL(PChar(Format(mySQL,[
      cdsText.FieldByName('ZCONTEXT').AsString,
      cdsText.FieldByName('ZID').AsInteger])));
  end;
end;

procedure TDesignDocumentClientDlg.act_SaveDocUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled :=
    cdsText.State in [dsEdit, dsInsert];
end;

procedure TDesignDocumentClientDlg.act_CancelDocUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled :=
    cdsText.State in [dsEdit, dsInsert];
end;

procedure TDesignDocumentClientDlg.act_CancelDocExecute(Sender: TObject);
begin
  if MessageBox(Handle,'撤消到上次保存的内容，是否要撤消？','提示',
    MB_ICONQUESTION+MB_YESNO)=IDYES then
  cdsText.Cancel;
end;

procedure TDesignDocumentClientDlg.tvProjectEdited(Sender: TObject;
  Node: TTreeNode; var S: String);
var
  myData : PProjectDoc;
const
  glSQL = 'update TB_PRO_DOCUMENT set ZNAME=''%s'' where ZID=%d';
begin
  if fLoading then Exit;
  if not Assigned(Node) or not Assigned(Node.data) then Exit;

  myData := Node.data;

  //权限
  if not HasModuleActionByShow(Ord(bsDocTree),myData.fID,atUpdate) then
    Exit;

  if myData^.fPid = -1 then Exit; //说明根结点，不能编辑
  if CompareText(S,mydata^.fName) <>0 then
  begin
    mydata^.fName := S;
    ClientSystem.fDbOpr.ExeSQL(PChar(Format(glSQL,[mydata^.fName,
      mydata^.fID])));
  end;
end;

procedure TDesignDocumentClientDlg.tvProjectEditing(Sender: TObject;
  Node: TTreeNode; var AllowEdit: Boolean);
begin
  AllowEdit := Assigned(Node.Parent);
end;

class function TDesignDocumentClientDlg.GetModuleID: integer;
begin
  Result := Ord(mtDoc);
end;

end.
