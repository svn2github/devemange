unit BugManageClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseChildfrm, ExtCtrls, ComCtrls, DB, DBClient,

  ClientTypeUnits, ActnList, Menus, Grids, DBGrids, StdCtrls, Buttons,
  DBCtrls, Mask, dbcgrids;

type

  TBugColumns = (bcCode,bcTitle,bcType,bcWhoBuild,bcBuildDate,
    bcAssingeto,bcwhoReso,bcResoDate);

  TBugManageDlg = class(TBaseChildDlg)
    plCenter: TPanel;
    plnovisible: TPanel;
    cdsBugTree: TClientDataSet;
    ActionList1: TActionList;
    actBug_AddDir: TAction;
    pmBugTree: TPopupMenu;
    N1: TMenuItem;
    actBug_Del: TAction;
    N2: TMenuItem;
    actBug_Update: TAction;
    N3: TMenuItem;
    cdsBugItem: TClientDataSet;
    dsBugItem: TDataSource;
    actBug_NewPage: TAction;
    actBug_PrivPage: TAction;
    actBug_FirstPage: TAction;
    actBug_LastPage: TAction;
    pmBugItem: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    cdsBugType: TClientDataSet;
    cdsBugPlan: TClientDataSet;
    actBug_AddBug: TAction;
    cdsBugLevel: TClientDataSet;
    dsBugLevel: TDataSource;
    cdsProject: TClientDataSet;
    dsProject: TDataSource;
    pcBug: TPageControl;
    tsBugItem: TTabSheet;
    tsBugContext: TTabSheet;
    Splitter1: TSplitter;
    tvProject: TTreeView;
    plBugList: TPanel;
    dgBugItem: TDBGrid;
    plBugTop: TPanel;
    BitBtn3: TBitBtn;
    dsBugType: TDataSource;
    cdsBugHistory: TClientDataSet;
    dsBugBugHistory: TDataSource;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBLookupComboBox5: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    lbBugCaption: TLabel;
    actBugItem_Save: TAction;
    actBugItem_Cancel: TAction;
    actBugHistory_Add: TAction;
    plBugItemBottom: TPanel;
    BitBtn11: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn6: TBitBtn;
    lbPageCount: TLabel;
    N8: TMenuItem;
    N9: TMenuItem;
    actBugHistory_Save: TAction;
    actBugHistory_Resolu: TAction;
    actBugHistory_ReSet: TAction;
    actBugHistory_Cancel: TAction;
    Label14: TLabel;
    DBEdit4: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label18: TLabel;
    DBLookupComboBox6: TDBLookupComboBox;
    Splitter2: TSplitter;
    plBugHistory: TPanel;
    plBugHistoryTop: TPanel;
    Label13: TLabel;
    Bevel1: TBevel;
    BitBtn7: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn12: TBitBtn;
    Panel1: TPanel;
    dbcBugHistory: TDBCtrlGrid;
    DBText1: TDBText;
    DBText2: TDBText;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBText3: TDBText;
    Label12: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    DBMemo1: TDBMemo;
    dsBugPlan: TDataSource;
    lbProjectName: TLabel;
    actBugHistory_PrivBug: TAction;
    actBugHistory_NextBug: TAction;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    Label15: TLabel;
    DBEdit7: TDBEdit;
    cdsBugStatus: TClientDataSet;
    dsBugStatus: TDataSource;
    actBug_MeBuild: TAction;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    actBug_AssingToMe: TAction;
    actBug_ResoMe: TAction;
    cbFindVer: TComboBox;
    DBLookupComboBox7: TDBLookupComboBox;
    actBugHistory_OpenFile: TAction;
    actBug_RefreshData: TAction;
    N10: TMenuItem;
    dblcSelectUsermail: TDBLookupComboBox;
    Label19: TLabel;
    procedure actBug_AddDirExecute(Sender: TObject);
    procedure tvProjectExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure actBug_DelUpdate(Sender: TObject);
    procedure actBug_DelExecute(Sender: TObject);
    procedure actBug_UpdateUpdate(Sender: TObject);
    procedure actBug_UpdateExecute(Sender: TObject);
    procedure tvProjectChange(Sender: TObject; Node: TTreeNode);
    procedure actBug_NewPageExecute(Sender: TObject);
    procedure actBug_NewPageUpdate(Sender: TObject);
    procedure actBug_PrivPageUpdate(Sender: TObject);
    procedure actBug_PrivPageExecute(Sender: TObject);
    procedure actBug_FirstPageUpdate(Sender: TObject);
    procedure actBug_FirstPageExecute(Sender: TObject);
    procedure actBug_LastPageUpdate(Sender: TObject);
    procedure actBug_LastPageExecute(Sender: TObject);
    procedure pcBugChanging(Sender: TObject; var AllowChange: Boolean);
    procedure actBug_AddBugUpdate(Sender: TObject);
    procedure cdsBugItemNewRecord(DataSet: TDataSet);
    procedure actBug_AddBugExecute(Sender: TObject);
    procedure actBugItem_SaveUpdate(Sender: TObject);
    procedure actBugItem_CancelUpdate(Sender: TObject);
    procedure actBugItem_CancelExecute(Sender: TObject);
    procedure cdsBugItemBeforePost(DataSet: TDataSet);
    procedure actBugItem_SaveExecute(Sender: TObject);
    procedure actBugHistory_AddExecute(Sender: TObject);
    procedure actBugHistory_AddUpdate(Sender: TObject);
    procedure tvProjectChanging(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure actBugHistory_ResoluUpdate(Sender: TObject);
    procedure actBugHistory_ReSetUpdate(Sender: TObject);
    procedure actBugHistory_ResoluExecute(Sender: TObject);
    procedure actBugHistory_SaveUpdate(Sender: TObject);
    procedure actBugHistory_SaveExecute(Sender: TObject);
    procedure actBugHistory_CancelUpdate(Sender: TObject);
    procedure actBugHistory_CancelExecute(Sender: TObject);
    procedure actBugHistory_ReSetExecute(Sender: TObject);
    procedure cdsBugHistoryNewRecord(DataSet: TDataSet);
    procedure cdsBugHistoryBeforePost(DataSet: TDataSet);
    procedure actBugHistory_PrivBugUpdate(Sender: TObject);
    procedure actBugHistory_NextBugUpdate(Sender: TObject);
    procedure actBugHistory_PrivBugExecute(Sender: TObject);
    procedure actBugHistory_NextBugExecute(Sender: TObject);
    procedure dgBugItemDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure actBug_MeBuildExecute(Sender: TObject);
    procedure actBug_AssingToMeExecute(Sender: TObject);
    procedure actBug_ResoMeExecute(Sender: TObject);
    procedure DBText3DblClick(Sender: TObject);
    procedure actBugHistory_OpenFileExecute(Sender: TObject);
    procedure actBugHistory_OpenFileUpdate(Sender: TObject);
    procedure actBug_RefreshDataUpdate(Sender: TObject);
    procedure actBug_RefreshDataExecute(Sender: TObject);
    procedure dblcSelectUsermailCloseUp(Sender: TObject);
  private
    procedure ClearNode(AParent:TTreeNode);
    function  GetBugItemPageCount(APageIndex:integer;AWhereStr:String):integer; //取出页总数
    procedure LoadBugItem(APageIndex:integer;AWhereStr:String);
    procedure LoadBugHistory(ABugID:integer); //加载bug的回复
    function  UpBugFile(AFileName:String;var AFileID:integer):Boolean; //上传文件并返回文件的ID号
    procedure Mailto(AEmailto:String); //发送到邮箱
  public
    { Public declarations }
    procedure initBase; override;
    procedure LoadBugTree(APID:integer;APNode:TTreeNode);
    class function GetModuleID : integer;override;
  end;

var
  BugManageDlg: TBugManageDlg;

implementation
uses
  ShellAPI,
  AddBugTreeNodefrm,          {增加BUG项目}
  ClinetSystemUnits,
  SelectBugStatusfrm,
  BugAeplyfrm,
  DmUints;

{$R *.dfm}

{ TBugManageDlg }

procedure TBugManageDlg.ClearNode(AParent: TTreeNode);
  procedure DofreeChild(APNode:TTreeNode);
  var
    i : integer;
    myBugData : PBugTreeNode;
  begin
    for i:=0 to APNode.Count -1 do
    begin
      if Assigned(APNode.Item[i]) and
         Assigned(APNode.Item[i].data) then
      begin
        myBugData := APNode.Item[i].data;
        Dispose(myBugData);
      end;
      if APNode.Item[i].HasChildren then
        DofreeChild(APNode.Item[i]);
    end;
  end;
var
  myChild   : TTreeNode;
  myBugData : PBugTreeNode;
begin
  if Assigned(AParent) then
  begin
    DofreeChild(AParent);
    AParent.DeleteChildren;
  end
  else begin
    myChild := tvProject.TopItem;
    while Assigned(myChild) do
    begin
      if Assigned(myChild.Data) then
      begin
        myBugData := myChild.Data;
        Dispose(myBugData);
      end;
      myChild := myChild.GetNext;
    end;
    tvProject.Items.Clear;
  end;
end;

class function TBugManageDlg.GetModuleID: integer;
begin
  Result := Ord(mtBug);
end;

procedure TBugManageDlg.initBase;
const
  glSQL  = 'select ZID,ZNAME from TB_BUG_PARAMS where ZTYPE=%d';
begin
  with ClientSystem.fDbOpr do
  begin
    cdsBugStatus.Data := ReadDataSet(PChar(format(glSQL,[1])));
    cdsBugType.Data := ReadDataSet(PChar(format(glSQL,[4])));
    cdsBugPlan.Data := ReadDataSet(PChar(format(glSQL,[2])));
    cdsBugLEVEL.Data := ReadDataSet(PChar(format(glSQL,[5])));
  end;

  LoadBugTree(-1,nil);
end;

procedure TBugManageDlg.LoadBugTree(APID: integer; APNode: TTreeNode);
var
  mySQL : string;
  myNode : TTreeNode;
  myData,myPData : PBugTreeNode;
  myb : Boolean;
const
  glSQL  = 'select * from TB_BUG_TREE where ZPID=%d Order by ZSORT';
begin
  myb := fLoading;
  fLoading := True;
  try
    mySQL := format(glSQL,[APID]);
    cdsBugTree.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));
    cdsBugTree.First;
    ClearNode(APNode); //清空项目
    while not cdsBugTree.Eof do
    begin
      new(myData);
      myData^.fName := cdsBugTree.FieldByName('ZNAME').AsString;
      if Assigned(APNode) and Assigned(APNode.data) then
      begin
        myPData := APNode.data;
        myData^.fParent := myPData;
        myPData^.fhasLoad := True; //已加载过了
      end
      else
        myData^.fParent := nil;
      myData^.fID  := cdsBugTree.FieldByName('ZID').AsInteger;
      myData^.fPID := cdsBugTree.FieldByName('ZPID').AsInteger;
      myData^.fPRO_ID := cdsBugTree.FieldByName('ZPRO_ID').AsInteger;
      myData^.fAddDate := cdsBugTree.FieldByName('ZADDDATE').AsDateTime;
      myData^.fSort    := cdsBugTree.FieldByName('ZSORT').AsInteger;
      myData^.fhasChild := cdsBugTree.FieldByName('ZHASCHILD').AsBoolean;
      myData^.fPageIndex := 1;
      myData^.fPageCount := 1;
      myNode := tvProject.Items.AddChild(APNode,myData^.fName);
      myNode.Data := myData;
      if myData^.fhasChild then
      begin
        tvProject.Items.AddChildFirst(myNode,'读取数据...');
        myData^.fhasLoad := False;
      end
      else
        myData^.fhasLoad := True;
      if myNode.Level = 0 then
      begin
        myNode.ImageIndex := 0;
        myNode.SelectedIndex := 0;
      end
      else begin
        myNode.ImageIndex := 1;
        myNode.SelectedIndex := 1;
      end;
      cdsBugTree.Next;
    end;

  finally
    fLoading := myb;
  end;

end;

procedure TBugManageDlg.actBug_AddDirExecute(Sender: TObject);
var
  myPID : integer;
  myPData : PBugTreeNode;
  mySQL : String;
const
  glSQL  = 'insert TB_BUG_TREE (ZPID,ZPRO_ID,ZNAME,ZADDDATE,ZSORT,ZHASCHILD) '+
           'values(%d,%d,''%s'',''%s'',%d,0)';
  glSQL2 = 'update TB_BUG_TREE set ZHASCHILD=1 where ZID=%d';
begin
  with TAddBugTreeNodeDlg.Create(nil) do
  try
    if ShowModal = mrOK then
    begin
      myPData := nil;
      ClientSystem.fDbOpr.BeginTrans;
      try
        if rbRoot.Checked then
          myPID := -1
        else if rbSelectNode.Checked then
        begin
          if not Assigned(tvProject.Selected) or
             not Assigned(tvProject.Selected.data) then
          begin
            MessageBox(Handle,'请选择当前的项目','提示',MB_ICONERROR+MB_OK);
            ClientSystem.fDbOpr.RollbackTrans;
            Exit;
          end;
          myPData := tvProject.Selected.data;
          myPID := myPData^.fID;
        end
        else begin
          ClientSystem.fDbOpr.RollbackTrans;
          Exit;
        end;

        //权限
        if not HasModuleActionByShow(Ord(bsBugTree),myPID,atInsert) then
          Exit;
          
        mySQL := format(glSQL,[myPID,
          strtoint(edProID.Text),
          edName.Text,
          datetimetostr(dpAddDate.DateTime),
          strtoint(edSort.Text)]);
        ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
        if myPID = -1 then
          LoadBugTree(-1,nil)
        else begin
          if Assigned(myPData) and not myPData^.fhasChild then
          begin
            mySQL := format(glSQL2,[myPData^.fID]);
            ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
            myPData^.fhasChild := True;
          end;
          LoadBugTree(myPID,tvProject.Selected);
        end;
        ClientSystem.fDbOpr.CommitTrans;
      except
        ClientSystem.fDbOpr.RollbackTrans;
      end;
    end;
  finally
    free;
  end;
end;

procedure TBugManageDlg.tvProjectExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
var
  myNodeData : PBugTreeNode;
  myb : Boolean;
begin
  if Assigned(Node) and Assigned(Node.data) then
  begin
    myb := fLoading;
    fLoading := True;
    try
      myNodeData := Node.data;
      if (not myNodeData^.fhasLoad) and myNodeData^.fhasChild then
        LoadBugTree(myNodeData^.fID ,Node);
    finally
      fLoading := myb;
    end;
  end;
  AllowExpansion := True;
end;

procedure TBugManageDlg.actBug_DelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(tvProject.Selected)
  and Assigned(tvProject.Selected.data);
end;

procedure TBugManageDlg.actBug_DelExecute(Sender: TObject);
var
  myData : PBugTreeNode;
begin
  myData := tvProject.Selected.data;
  if not HasModuleActionByShow(Ord(bsBugTree),myData^.fID,atDelete) then
    Exit;
  if MessageBox(Handle,PChar(format('删除 %s',[myData^.fName])),
    '询问',MB_ICONQUESTION+MB_YESNO)=IDNO then Exit;

  //执行删除
  
end;

procedure TBugManageDlg.actBug_UpdateUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(tvProject.Selected)
  and Assigned(tvProject.Selected.data);
end;

procedure TBugManageDlg.actBug_UpdateExecute(Sender: TObject);
var
  myData : PBugTreeNode;
  mySQL  : string;
const
  glSQL  = 'update TB_BUG_TREE set ZNAME=''%s'',ZPRO_ID=%d,ZSORT=%d,ZADDDATE=''%s'' '+
           'where ZID=%d';
begin
  myData := tvProject.Selected.data;
  if not HasModuleActionByShow(Ord(bsBugTree),myData^.fID,atUpdate) then
    Exit;
  with TAddBugTreeNodeDlg.Create(nil) do
  try
    GroupBox1.Visible := False;
    edName.Text := myData^.fName;
    edPROID.Text := inttostr(myData^.fPRO_ID);
    edSort.Text  := inttostr(myData^.fSort);
    dpAddDate.DateTime := myData^.fAddDate;

    if ShowModal = mrOK then
    begin
      ClientSystem.fDbOpr.BeginTrans;
      try
        mySQL := format(glSQL,[
          edName.Text,
          strtoint(edPROID.text),
          strtoint(edSort.text),
          datetimetostr(dpAddDate.DateTime),
          myData^.fID]);
        ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
        mydata^.fName := edName.Text;
        mydata^.fPRO_ID := strtoint(edPROID.Text);
        mydata^.fSort := strtoint(edSort.Text);
        mydata^.fAddDate := dpAddDate.DateTime;
        tvProject.Selected.Text := mydata^.fName;

        ClientSystem.fDbOpr.CommitTrans;
      except
        ClientSystem.fDbOpr.RollbackTrans;
      end;
    end;

  finally
    free;
  end;
end;

procedure TBugManageDlg.tvProjectChange(Sender: TObject; Node: TTreeNode);
var
  myPageIndex:integer;
  mywhere : String;
  myData : PBugTreeNode;
  mySQL : string;
const
  glSQL  = 'select ZID,ZVER from TB_PRO_VERSION where ZPRO_ID=%d Order by ZID DESC';
begin
  //
  //加载问题列表
  // 加载时，必须注意不要全部加载，因为以后的
  // 问题是会很多，这个地方很关键。
  //
  if fLoading then Exit;
  if not Assigned(Node.data) then Exit;
  myData := Node.data;

  myPageIndex := myData^.fPageIndex;
  mywhere := 'ZTREE_ID=' + inttostr(myData^.fID);
  myData^.fPageCount := GetBugItemPageCount(myPageindex,myWhere);
  lbPageCount.Caption := format('%d/%d',[
    myData^.fPageIndex,
    myData^.fPageCount]);
  LoadBugItem(myPageindex,myWhere);
  lbProjectName.Caption := format('%s  =>第%d共%d页',[
    myData^.fName,myData^.fPageIndex,myData^.fPageCount]);


  //读取项目
  if cdsProject.Tag <> myData^.fPRO_ID then
  begin
    cdsProject.Tag := myData^.fPRO_ID;
    mySQL := format(glSQL,[myData^.fPRO_ID]);
    cdsProject.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));
  end;
end;

procedure TBugManageDlg.LoadBugItem(APageIndex: integer;
  AWhereStr: String);
var
  mySQL  : string;
  i : integer;
  myfield : TFieldDef;
  myDataSet : TClientDataSet;
  myb : Boolean;
  mywhere : String;
const
  glSQL = 'exec pt_SplitPage ''TB_BUG_ITEM'',' +
          '''ZID,ZTYPE,ZTITLE,ZOPENEDBY,ZOPENEDDATE,ZASSIGNEDTO,ZRESOLVEDBY,' +
          'ZRESOLUTION,ZRESOLVEDDATE,ZOS,ZLEVEL,ZSTATUS,ZMAILTO,ZOPENVER, ' +
          'ZRESOLVEDVER,ZTREEPATH,ZTREE_ID,ZASSIGNEDTO,ZASSIGNEDDATE'',' +
          '''ZLASTEDITEDDATE'',20,%d,%d,1,''%s''';
  //                                             页码,以总数=1, 条件where
begin

  mywhere := AWhereStr;
  case cbFindVer.ItemIndex of
    1: mywhere := mywhere + ' and ZOPENVER=' + inttostr(cdsProject.FieldByName('ZID').AsInteger);
    2: mywhere := mywhere + ' and ZRESOLVEDVER=' + inttostr(cdsProject.FieldByName('ZID').AsInteger);
  end;

  mySQL := format(glSQL,[
    APageIndex,
    0, //不是取总数
    mywhere]);
  if fLoading then Exit;

  ClientSystem.BeginTickCount;
  myb := fLoading;
  fLoading := True;
  myDataSet := TClientDataSet.Create(nil);
  try
    myDataSet.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));
    if cdsBugItem.Fields.Count=0 then
      with cdsBugItem do
      begin
        Fields.Clear;
        FieldDefs.Assign(myDataSet.FieldDefs);
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZISNEW';
        myfield.DataType := ftBoolean;
        for i:=0 to FieldDefs.Count -1 do
        begin
          FieldDefs[i].CreateField(cdsBugItem).Alignment := taLeftJustify;
        end;

        //问题类型
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZBUGTYPE';
        myfield.DataType := ftString;
        myfield.Size := 50;
        with myfield.CreateField(cdsBugItem) do
        begin
          FieldKind := fkLookup;
          KeyFields := 'ZTYPE';
          LookupDataSet := cdsBugType;
          LookupKeyFields := 'ZID';
          LookupResultField := 'ZNAME';
        end;

        //由谁创建
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZOPENEDNAME';
        myfield.DataType := ftString;
        myfield.Size := 50;
        with myfield.CreateField(cdsBugItem) do
        begin
          FieldKind := fkLookup;
          KeyFields := 'ZOPENEDBY';
          LookupDataSet := DM.cdsUser;
          LookupKeyFields := 'ZID';
          LookupResultField := 'ZNAME';
        end;

        //指派给
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZASSIGNEDNAME';
        myfield.DataType := ftString;
        myfield.Size := 50;
        with myfield.CreateField(cdsBugItem) do
        begin
          FieldKind := fkLookup;
          KeyFields := 'ZASSIGNEDTO';
          LookupDataSet := DM.cdsUser;
          LookupKeyFields := 'ZID';
          LookupResultField := 'ZNAME';
        end;

        //解决人
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZRESOLVEDNAME';
        myfield.DataType := ftString;
        myfield.Size := 50;
        with myfield.CreateField(cdsBugItem) do
        begin
          FieldKind := fkLookup;
          KeyFields := 'ZRESOLVEDBY';
          LookupDataSet := DM.cdsUser;
          LookupKeyFields := 'ZID';
          LookupResultField := 'ZNAME';
        end;

        //解决方案
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZRESOLUTIONNAME';
        myfield.DataType := ftString;
        myfield.Size := 50;
        with myfield.CreateField(cdsBugItem) do
        begin
          FieldKind := fkLookup;
          KeyFields := 'ZRESOLUTION';
          LookupDataSet := cdsBugPlan;
          LookupKeyFields := 'ZID';
          LookupResultField := 'ZNAME';
        end;

        CreateDataSet;
      end
    else begin
      cdsBugItem.DisableControls;
      try
        while not cdsBugItem.IsEmpty do cdsBugItem.Delete;
      finally
        cdsBugItem.EnableControls;
      end;
    end;

    cdsBugItem.DisableControls;
    try
      myDataSet.First;
      while not myDataSet.Eof do
      begin
        cdsBugItem.Append;
        cdsBugItem.FieldByName('ZISNEW').AsBoolean := False;
        for i:=0 to myDataSet.FieldDefs.Count -1 do
          cdsBugItem.FieldByName(myDataSet.FieldDefs[i].Name).AsVariant :=
            myDataSet.FieldByName(myDataSet.FieldDefs[i].Name).AsVariant;
        cdsBugItem.Post;
        myDataSet.Next;
      end;
      cdsBugItem.First;
    finally
      cdsBugItem.EnableControls;
    end;

  finally
    myDataSet.Free;
    fLoading :=myb;
    ClientSystem.EndTickCount;
  end;
end;

procedure TBugManageDlg.actBug_NewPageExecute(Sender: TObject);
var
  myPageIndex:integer;
  mywhere : String;
  myData : PBugTreeNode;
begin
  if fLoading then Exit;
  mydata := tvProject.Selected.data;
  mydata^.fPageIndex := mydata^.fPageIndex + 1;
  myPageIndex := myData^.fPageIndex;
  mywhere := 'ZTREE_ID=' + inttostr(myData^.fID);
  LoadBugItem(myPageindex,myWhere);
  lbPageCount.Caption := format('%d/%d',[
    myData^.fPageIndex,
   myData^.fPageCount]);
 lbProjectName.Caption := format('%s  =>第%d共%d页',[
    myData^.fName,myData^.fPageIndex,myData^.fPageCount]);
end;

procedure TBugManageDlg.actBug_NewPageUpdate(Sender: TObject);
begin
  (sender as TAction).Enabled := not fLoading
  and Assigned(tvProject.Selected)
  and Assigned(tvProject.Selected.data)
  and (PBugTreeNode(tvProject.Selected.data)^.fPageIndex<
    PBugTreeNode(tvProject.Selected.data).fPageCount);
end;

procedure TBugManageDlg.actBug_PrivPageUpdate(Sender: TObject);
begin
  (sender as TAction).Enabled := not fLoading
  and Assigned(tvProject.Selected)
  and Assigned(tvProject.Selected.data)
  and (PBugTreeNode(tvProject.Selected.data)^.fPageIndex>1);
end;

procedure TBugManageDlg.actBug_PrivPageExecute(Sender: TObject);
var
  myPageIndex:integer;
  mywhere : String;
  myData : PBugTreeNode;
begin
  mydata := tvProject.Selected.data;
  mydata^.fPageIndex := mydata^.fPageIndex - 1;
  myPageIndex := myData^.fPageIndex;
  mywhere := 'ZTREE_ID=' + inttostr(myData^.fID);
  LoadBugItem(myPageindex,myWhere);
  lbPageCount.Caption := format('%d/%d',[
    myData^.fPageIndex,
    myData^.fPageCount]);
  lbProjectName.Caption := format('%s  =>第%d共%d页',[
    myData^.fName,myData^.fPageIndex,myData^.fPageCount]);
end;

function TBugManageDlg.GetBugItemPageCount(APageIndex: integer;
  AWhereStr: String): integer;
var
  mySQL  : string;
  myRowCount : integer;
  mywhere : string;
const
  glSQL = 'exec pt_SplitPage ''TB_BUG_ITEM'',' +
          '''ZID,ZTITLE,ZOPENEDBY,ZOPENEDDATE,ZASSIGNEDTO,ZRESOLVEDBY,' +
          'ZRESOLUTION,ZRESOLVEDDATE'', ''ZLASTEDITEDDATE'',20,%d,%d,1,''%s''';
  //                                             页码,以总数=1, 条件where
begin
  mywhere := AWhereStr;
  case cbFindVer.ItemIndex of
    1: mywhere := mywhere + ' and ZOPENVER=' + inttostr(cdsProject.FieldByName('ZID').AsInteger);
    2: mywhere := mywhere + ' and ZRESOLVEDVER=' + inttostr(cdsProject.FieldByName('ZID').AsInteger);
  end;

  mySQL := format(glSQL,[
    APageIndex,
    1, //不是取总数
    AWhereStr]);

  myRowCount := ClientSystem.fDbOpr.ReadInt(PChar(mySQL));
  Result := myRowCount div 20;
  if (myRowCount mod 20) > 0 then
    Result := Result + 1;

end;


procedure TBugManageDlg.actBug_FirstPageUpdate(Sender: TObject);
begin
  (sender as TAction).Enabled := not fLoading
  and Assigned(tvProject.Selected)
  and Assigned(tvProject.Selected.data)
  and (PBugTreeNode(tvProject.Selected.data)^.fPageIndex<>1);
end;

procedure TBugManageDlg.actBug_FirstPageExecute(Sender: TObject);
var
  myPageIndex:integer;
  mywhere : String;
  myData : PBugTreeNode;
begin
  mydata := tvProject.Selected.data;
  mydata^.fPageIndex := 1;
  myPageIndex := myData^.fPageIndex;
  mywhere := 'ZTREE_ID=' + inttostr(myData^.fID);
  LoadBugItem(myPageindex,myWhere);
  lbPageCount.Caption := format('%d/%d',[
    myData^.fPageIndex,
    myData^.fPageCount]);
  lbProjectName.Caption := format('%s  =>第%d共%d页',[
    myData^.fName,myData^.fPageIndex,myData^.fPageCount]);
end;

procedure TBugManageDlg.actBug_LastPageUpdate(Sender: TObject);
begin
  (sender as TAction).Enabled := not fLoading
  and Assigned(tvProject.Selected)
  and Assigned(tvProject.Selected.data)
  and (PBugTreeNode(tvProject.Selected.data)^.fPageIndex<>
    PBugTreeNode(tvProject.Selected.data).fPageCount);
end;

procedure TBugManageDlg.actBug_LastPageExecute(Sender: TObject);
var
  myPageIndex:integer;
  mywhere : String;
  myData : PBugTreeNode;
begin
  mydata := tvProject.Selected.data;
  mydata^.fPageIndex := mydata^.fPageCount;
  myPageIndex := myData^.fPageIndex;
  mywhere := 'ZTREE_ID=' + inttostr(myData^.fID);
  LoadBugItem(myPageindex,myWhere);
  lbPageCount.Caption := format('%d/%d',[
    myData^.fPageIndex,
    myData^.fPageCount]);
  lbProjectName.Caption := format('%s  =>第%d共%d页',[
    myData^.fName,myData^.fPageIndex,myData^.fPageCount]);
end;

procedure TBugManageDlg.pcBugChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := (not cdsBugItem.IsEmpty) or (pcBug.ActivePageIndex = 1);
  if not AllowChange then Exit;
  
  if pcBug.ActivePageIndex = 0 then
  begin
    if cdsBugItem.FieldByName('ZISNEW').AsBoolean then
    begin
      //LoadBugHistory(-1); //
    end
    else begin
      lbBugCaption.Caption := cdsBugItem.FieldByName('ZTITLE').AsString;
      LoadBugHistory(cdsBugItem.FieldByName('ZID').Asinteger);
    end;
  end
  else if pcBug.ActivePageIndex = 1 then
  begin
    if (cdsBugItem.State in [dsInsert,dsEdit]) or
       (cdsBugHistory.State in [dsInsert,dsEdit]) then
    begin
      MessageBox(Handle,'内容已修改','提示',MB_ICONERROR+MB_OK);
      AllowChange := False;
      Exit;
    end;
  end;

end;

procedure TBugManageDlg.actBug_AddBugUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(tvProject.Selected)
  and Assigned(tvProject.Selected.Data);
end;

procedure TBugManageDlg.cdsBugItemNewRecord(DataSet: TDataSet);
var
  myPath : string;
  myBugData,myPBugData : PBugTreeNode;
begin
  if fLoading then Exit;

  if not Assigned(tvProject.Selected) or
     not Assigned(tvProject.Selected.Data) then Exit;

  myBugData := tvProject.Selected.Data;
  mypath := myBugData^.fName;
  myPBugData := myBugData^.fParent;
  while Assigned(myPBugData) do
  begin
    if myPBugData^.fPRO_ID = myBugData^.fPRO_ID then
      mypath := myPBugData^.fName + '/' + mypath;
    myPBugData := myPBugData^.fParent;
  end;

  DataSet.FieldByName('ZTREEPATH').AsString := myPath;
  DataSet.FieldByName('ZTREE_ID').AsInteger := myBugData^.fID;
  DataSet.FieldByName('ZSTATUS').AsInteger   := 0; //0=要修改的
  DataSet.FieldByName('ZOPENEDBY').AsInteger := ClientSystem.fEditer_id;
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
  DataSet.FieldByName('ZRESOLUTION').AsInteger := -1; //解决方案
end;

procedure TBugManageDlg.actBug_AddBugExecute(Sender: TObject);
var
  myBugData : PBugTreeNode;
begin
  myBugData := tvProject.Selected.data;

  //权限
  if not HasModuleActionByShow(Ord(bsBugTree),myBugData.fID,atInsert) then
    Exit;

  lbBugCaption.Caption := '发现新问题 by ' + ClientSystem.fEditer;
  pcBug.ActivePage := tsBugContext;
  if cdsBugItem.State in [dsEdit,dsInsert] then
    cdsBugItem.Post;
  LoadBugHistory(-1); //因为OnpageChange没有处理
  cdsBugItem.First;
  cdsBugItem.Insert;
end;

procedure TBugManageDlg.actBugItem_SaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(tvProject.Selected)
  and Assigned(tvProject.Selected.data)
  and (cdsBugItem.State in [dsEdit,dsInsert]);
end;

procedure TBugManageDlg.actBugItem_CancelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(tvProject.Selected)
  and Assigned(tvProject.Selected.data)
  and (cdsBugItem.State in [dsEdit,dsInsert]);
end;

procedure TBugManageDlg.actBugItem_CancelExecute(Sender: TObject);
begin
  cdsBugItem.Cancel;
end;

procedure TBugManageDlg.cdsBugItemBeforePost(DataSet: TDataSet);
var
  mySQL : String;
  myZID : integer;
  myBugData : PBugTreeNode;
  myAssingdate : string; //指派的时间，哪是没有指派，则是null
const
  glSQL   = 'select isNull(max(ZID),0)+1 from TB_BUG_ITEM';
  glSQL2  = 'insert TB_BUG_ITEM (ZID,ZTREE_ID,ZPRO_ID,ZTREEPATH,ZTITLE,' +
             ' ZOS,ZTYPE,ZLEVEL,ZSTATUS,ZMAILTO,ZOPENEDBY, ' +
             ' ZOPENEDDATE,ZOPENVER,ZASSIGNEDTO,ZASSIGNEDDATE,ZRESOLUTION,' +
             ' ZLASTEDITEDBY,ZLASTEDITEDDATE) ' +
             'values(%d,%d,%d,''%s'',''%s'',%d,%d,%d,%d,''%s'',%d,' +
             ' %s,%d,%d,%s,%d,%d,%s)' ;
             
  glSQL3  = 'update TB_BUG_ITEM set ' +
            'ZTITLE=''%s'', ' +
            'ZOS=%d, ' +
            'ZTYPE=%d ,' +
            'ZLEVEL=%d, ' +
            'ZMAILTO=''%s'','+
            'ZOPENVER=%d, ' +
            'ZASSIGNEDTO=%d, '+
            'ZASSIGNEDDATE=%s, '+
            'ZLASTEDITEDBY=%d , ' +
            'ZLASTEDITEDDATE=getdate()' +
            'where ZID=%d';
begin
  //
  if fLoading then Exit;

  myBugData := tvProject.Selected.data;
  if not DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    if DataSet.FieldByName('ZASSIGNEDTO').AsInteger >=0 then
      myAssingdate := 'getdate()'
    else
      myAssingdate := 'NULL';
    mySQL := format(glSQL3,[
      DataSet.FieldByName('ZTITLE').AsString,
      DataSet.FieldByName('ZOS').AsInteger,
      DataSet.FieldByName('ZTYPE').AsInteger,
      DataSet.FieldByName('ZLEVEL').AsInteger,
      DataSet.FieldByName('ZMAILTO').AsString,
      DataSet.FieldByName('ZOPENVER').AsInteger,
      DataSet.FieldByName('ZASSIGNEDTO').AsInteger,
      myAssingdate,
      ClientSystem.fEditer_id,
      DataSet.FieldByName('ZID').AsInteger]);

    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      ClientSystem.fDbOpr.CommitTrans;
    except
      ClientSystem.fDbOpr.RollbackTrans;
    end;
  end
  else begin
    myZID := ClientSystem.fDbOpr.ReadInt(PChar(glSQL));
    if DataSet.FieldByName('ZASSIGNEDTO').AsInteger >=0 then
      myAssingdate := 'getdate()'
    else
      myAssingdate := 'NULL';

    mySQL := Format(glSQL2,[myZID,
      myBugData^.fID,
      myBugData^.fPRO_ID,
      DataSet.FieldByName('ZTREEPATH').AsString,
      DataSet.FieldByName('ZTITLE').AsString,
      DataSet.FieldByName('ZOS').AsInteger,
      DataSet.FieldByName('ZTYPE').AsInteger,
      DataSet.FieldByName('ZLEVEL').AsInteger,
      DataSet.FieldByName('ZSTATUS').AsInteger,
      DataSet.FieldByName('ZMAILTO').AsString,
      DataSet.FieldByName('ZOPENEDBY').AsInteger,
      'getdate()',
      DataSet.FieldByName('ZOPENVER').AsInteger,
      DataSet.FieldByName('ZASSIGNEDTO').AsInteger,  //指派给
      myAssingdate, //指派时间
      DataSet.FieldByName('ZRESOLUTION').AsInteger,
      DataSet.FieldByName('ZOPENEDBY').AsInteger,
      'getdate()']);
    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      DataSet.FieldByName('ZID').AsInteger := myZID;
      DataSet.FieldByName('ZISNEW').AsBoolean := False;
      ClientSystem.fDbOpr.CommitTrans;
    except
      ClientSystem.fDbOpr.RollbackTrans;
    end;

  end;
end;

procedure TBugManageDlg.actBugItem_SaveExecute(Sender: TObject);
begin
  cdsBugItem.Post;
end;

procedure TBugManageDlg.actBugHistory_AddExecute(Sender: TObject);
var
  myRecNo : integer;
begin
  cdsBugHistory.DisableControls;
  try
    myRecNo := cdsBugHistory.RecNo;
    cdsBugHistory.Append; //增加
    cdsBugHistory.FieldByName('ZSTATUS').AsInteger := Ord(bgsAction);
    with TBugAeplyDlg.Create(nil) do
    try
      dblcQustionType.Enabled := False;
      dblcQustionVer.Enabled  := False;
      if ShowModal <> mrOK then
      begin
        cdsBugHistory.EnableControls;
        cdsBugHistory.Cancel;
        cdsBugHistory.DisableControls;
        cdsBugHistory.RecNo := myRecNo;
        Exit;
      end;
      cdsBugHistory.FieldByName('ZFILEPATH').AsString := edPath.Text;
    finally
      free;
    end;
  finally
    cdsBugHistory.EnableControls;
  end;
end;

procedure TBugManageDlg.actBugHistory_AddUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled :=
    not cdsBugItem.FieldByName('ZISNEW').AsBoolean
    and not (cdsBugHistory.State in [dsEdit,dsInsert]);
end;

procedure TBugManageDlg.tvProjectChanging(Sender: TObject; Node: TTreeNode;
  var AllowChange: Boolean);
var
  myBugData : PBugTreeNode;
begin
  if not Assigned(Node.data) then
  begin
    AllowChange := False;
    Exit;
  end;
  myBugData := Node.data;
  //权限
  if not HasModuleActionByShow(Ord(psVersion),myBugData.fID,atView) then
  begin
    AllowChange := False;
    Exit;
  end;
  AllowChange := True;
end;

procedure TBugManageDlg.actBugHistory_ResoluUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled :=
    not cdsBugItem.FieldByName('ZISNEW').AsBoolean and
    (cdsBugItem.FieldByName('ZSTATUS').AsInteger = Ord(bgsAction))
    and not (cdsBugHistory.State in [dsEdit,dsInsert]);
end;

procedure TBugManageDlg.actBugHistory_ReSetUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled :=
    not cdsBugItem.FieldByName('ZISNEW').AsBoolean and
    (cdsBugItem.FieldByName('ZSTATUS').AsInteger = Ord(bgsDeath))
    and not (cdsBugHistory.State in [dsEdit,dsInsert]);
end;

procedure TBugManageDlg.actBugHistory_ResoluExecute(Sender: TObject);
var
  myRecNo : integer;
begin
  cdsBugHistory.DisableControls;
  try
    myRecNo := cdsBugHistory.RecNo;
    cdsBugHistory.Append; //增加
    cdsBugHistory.FieldByName('ZSTATUS').AsInteger := Ord(bgsDeath);
    with TBugAeplyDlg.Create(nil) do
    try
      if ShowModal <> mrOK then
      begin
        cdsBugHistory.EnableControls;
        cdsBugHistory.Cancel;
        cdsBugHistory.DisableControls;
        cdsBugHistory.RecNo := myRecNo;
        Exit;
      end;
      cdsBugHistory.FieldByName('ZFILEPATH').AsString := edPath.Text;
    finally
      free;
    end;
  finally
    cdsBugHistory.EnableControls;
  end;
end;

procedure TBugManageDlg.actBugHistory_SaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (cdsBugHistory.State in [dsEdit,
    dsInsert])
  and not cdsBugItem.FieldByName('ZISNEW').AsBoolean;
end;

procedure TBugManageDlg.actBugHistory_SaveExecute(Sender: TObject);
begin
  cdsBugHistory.Post;
end;

procedure TBugManageDlg.actBugHistory_CancelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsBugHistory.State in [dsEdit,
    dsInsert];
end;

procedure TBugManageDlg.actBugHistory_CancelExecute(Sender: TObject);
begin
  if MessageBox(Handle,'否是撤消你的回复?','询问',
    MB_ICONQUESTION+MB_YESNO)=IDNO then
    Exit;
  cdsBugHistory.Cancel;
end;

procedure TBugManageDlg.LoadBugHistory(ABugID: integer);
var
  mySQL : String;
  mycds : TClientDataSet;
  myfield : TFieldDef;
  i : integer;
  c : integer;
  myb : Boolean;
const
  glSQL  = 'select * from  TB_BUG_HISTORY where ZBUG_ID=%d Order by ZID';
begin
  //建表结构
  mycds := TClientDataSet.Create(nil);
  myb := fLoading;
  fLoading := True;
  try

    mySQL := format(glSQL,[ABugID]);
    mycds.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));

    if cdsBugHistory.Fields.Count = 0 then
    begin
      with cdsBugHistory do
      begin
        FieldDefs.Assign(mycds.FieldDefs);
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZNO';
        myfield.DataType := ftInteger;
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZISNEW';
        myfield.DataType := ftBoolean;
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZFILEPATH';
        myfield.DataType := ftString;
        myfield.Size := 100; //附件的路径

        //因为 ZID只读有问题，所以去掉 ,并将自动计算去掉
        for i:=0 to FieldDefs.Count -1 do
        begin
          if faReadonly in FieldDefs[i].Attributes then
            FieldDefs[i].Attributes := FieldDefs[i].Attributes - [faReadonly];
          if FieldDefs[i].DataType = ftAutoInc then
            FieldDefs[i].DataType := ftInteger;
        end;
        for i:=0 to FieldDefs.Count -1 do
          FieldDefs[i].CreateField(cdsBugHistory);

        //回复人
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZUSERNAME';
        myfield.DataType := ftString;
        myfield.Size := 50;
        with myfield.CreateField(cdsBugHistory) do
        begin
          FieldKind := fkLookup;
          KeyFields := 'ZUSER_ID';
          LookupDataSet := DM.cdsUser;
          LookupKeyFields := 'ZID';
          LookupResultField := 'ZNAME';
        end;

        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZSTATUSNAME';
        myfield.DataType := ftString;
        myfield.Size := 50;
        with myfield.CreateField(cdsBugHistory) do
        begin
          FieldKind := fkLookup;
          KeyFields := 'ZSTATUS';
          LookupDataSet := cdsBugStatus;
          LookupKeyFields := 'ZID';
          LookupResultField := 'ZNAME';
        end;

      end;

      cdsBugHistory.CreateDataSet;
    end
    else begin
      cdsBugHistory.DisableControls;
      try
        while not cdsBugHistory.IsEmpty do cdsBugHistory.Delete;
      finally
        cdsBugHistory.EnableControls;
      end;
    end;

    //写值
    cdsBugHistory.DisableControls;
    try
      mycds.First;
      c := 1;
      while not mycds.Eof do
      begin
        cdsBugHistory.Append;
        cdsBugHistory.FieldByName('ZISNEW').AsBoolean := False;
        cdsBugHistory.FieldByName('ZNO').AsInteger := c; inc(c);
        for i:=0 to mycds.FieldDefs.Count -1 do
          cdsBugHistory.FieldByName(mycds.FieldDefs[i].Name).AsVariant :=
            mycds.FieldByName(mycds.FieldDefs[i].Name).AsVariant;
        cdsBugHistory.Post;
        mycds.Next;
      end;
      //cdsBugHistory.Last;  //这位到最后
    finally
      cdsBugHistory.EnableControls;
    end;

  finally
    mycds.Free;
    fLoading := myb;
  end;
end;

procedure TBugManageDlg.actBugHistory_ReSetExecute(Sender: TObject);
var
  myRecNO : integer;
begin
  cdsBugHistory.DisableControls;
  try
    myRecNo := cdsBugHistory.RecNo;
    cdsBugHistory.Append;
    cdsBugHistory.FieldByName('ZSTATUS').AsInteger := Ord(bgsAction);
    with TBugAeplyDlg.Create(nil) do
    try
      dblcQustionType.Enabled := False;
      dblcQustionVer.Enabled  := False;
      if ShowModal <> mrOK then
      begin
        cdsBugHistory.EnableControls;
        cdsBugHistory.Cancel;
        cdsBugHistory.DisableControls;
        cdsBugHistory.RecNo := myRecNo;
        Exit;
      end;
      cdsBugHistory.FieldByName('ZFILEPATH').AsString := edPath.Text;
    finally
      free;
    end;
  finally
    cdsBugHistory.EnableControls;
  end;
end;

procedure TBugManageDlg.cdsBugHistoryNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ZISNEW').AsBoolean  := True;
  DataSet.FieldByName('ZBUG_ID').AsInteger :=
    cdsBugItem.FieldByName('ZID').AsInteger;
  DataSet.FieldByName('ZUSER_ID').AsInteger := ClientSystem.fEditer_id;
  DataSet.FieldByName('ZACTIONDATE').AsDateTime := now();
  DataSet.FieldByName('ZSTATUS').AsInteger := -1;
  DataSet.FieldByName('ZNO').AsInteger := DataSet.RecordCount+1;
end;

procedure TBugManageDlg.cdsBugHistoryBeforePost(DataSet: TDataSet);
var
  myFileName : String;
  myFileID : integer;
  mySQL : string;
const
  glSQL  =  'insert TB_BUG_HISTORY (ZBUG_ID,ZUSER_ID,ZSTATUS,ZCONTEXT,' +
            'ZACTIONDATE,ZANNEXFILE_ID,ZANNEXFILENAME) ' +
            'values(%d,%d,%d,''%s'',''%s'',%d,''%s'')';
  glSQL2 = 'update TB_BUG_HISTORY set ZCONTEXT=''%s'',ZACTIONDATE=getdate() '+
           'where ZID=%d';

  glSQL3 = 'update TB_BUG_ITEM set ZLASTEDITEDBY=%d,ZLASTEDITEDDATE=getdate(), '+
           'ZSTATUS=%d,ZRESOLVEDBY=%d,ZRESOLUTION=%d,ZRESOLVEDVER=%d, ' +
           'ZRESOLVEDDATE=getdate()' + 
           'where ZID=%d';
begin
  if fLoading then Exit;
  if not DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    if DataSet.FieldByName('ZUSER_ID').AsInteger <> ClientSystem.fEditer_id then
    begin
      MessageBox(Handle,'不是你的回复内容，不能编辑。',
        '提示',MB_ICONWARNING+MB_OK);
      Exit;
    end;
    mySQL := format(glSQL2,[
      DataSet.FieldByName('ZCONTEXT').AsString,
      DataSet.FieldByName('ZID').AsInteger]);

    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      mySQL := format(glSQL3,[
        DataSet.FieldByName('ZUSER_ID').Asinteger,
        DataSet.FieldByName('ZSTATUS').Asinteger,
        cdsBugItem.FieldByName('ZRESOLVEDBY').Asinteger,
        cdsBugItem.FieldByName('ZRESOLUTION').Asinteger,
        cdsBugItem.FieldByName('ZRESOLVEDVER').Asinteger,
        DataSet.FieldByName('ZBUG_ID').Asinteger]);

      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      ClientSystem.fDbOpr.CommitTrans;
    except
      ClientSystem.fDbOpr.RollbackTrans;
    end;
    
  end
  else begin

    if DataSet.FieldByName('ZSTATUS').AsInteger < 0 then
    begin
      with TSelectBugStatusDlg.Create(nil) do
      try
        if ShowModal <> mrOk then  Exit;
        if rbAdd.Checked then
          DataSet.FieldByName('ZSTATUS').AsInteger := Ord(bgsAction)
        else if rbMeReso.Checked then
          DataSet.FieldByName('ZSTATUS').AsInteger := Ord(bgsDeath)
        else Exit;
      finally
        free;
      end;
    end;

    myFileID := -1;
    //要上传附件文件,如存在则上传
    if FileExists(DataSet.FieldByName('ZFILEPATH').AsString) then
    begin
      myFileName := DataSet.FieldByName('ZFILEPATH').AsString;
      if not UpBugFile(myFileName,myFileID) then
      begin
        MessageBox(Handle,'上传附件有问题。','提示',MB_ICONERROR+MB_OK);
        Exit;
      end;
      DataSet.FieldByName('ZANNEXFILENAME').AsString :=ExtractFileName(myfileName);
      DataSet.FieldByName('ZANNEXFILE_ID').AsInteger := myFileID;
    end;

    mySQL := format(glSQL,[
      DataSet.FieldByName('ZBUG_ID').AsInteger,
      DataSet.FieldByName('ZUSER_ID').AsInteger,
      DataSet.FieldByName('ZSTATUS').AsInteger,
      DataSet.FieldByName('ZCONTEXT').AsString,
      DataSet.FieldByName('ZACTIONDATE').AsString,
      DataSet.FieldByName('ZANNEXFILE_ID').AsInteger,
      DataSet.FieldByName('ZANNEXFILENAME').AsString]);

    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      if DataSet.FieldByName('ZSTATUS').AsInteger = Ord(bgsDeath) then
      begin
        mySQL := format(glSQL3,[
          DataSet.FieldByName('ZUSER_ID').Asinteger,
          DataSet.FieldByName('ZSTATUS').Asinteger,
          ClientSystem.fEditer_id,
          cdsBugPlan.FieldByName('ZID').AsInteger,
          cdsProject.FieldByName('ZID').AsInteger,
          DataSet.FieldByName('ZBUG_ID').Asinteger]);

      end
      else begin
        mySQL := format(glSQL3,[
          DataSet.FieldByName('ZUSER_ID').Asinteger,
          DataSet.FieldByName('ZSTATUS').Asinteger,
          -1,
          -1,
          -1,
          DataSet.FieldByName('ZBUG_ID').Asinteger]);
      end;

      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      DataSet.FieldByName('ZISNEW').AsBoolean := False;
      ClientSystem.fDbOpr.CommitTrans;


      //如处理了，则更新Bug的信息内容
      if DataSet.FieldByName('ZSTATUS').AsInteger = Ord(bgsDeath) then
      begin
        if cdsBugItem.State in [dsEdit,dsInsert] then
          cdsBugItem.Post;
        cdsBugItem.Edit;
        cdsBugItem.FieldByName('ZRESOLVEDBY').AsInteger := ClientSystem.fEditer_id;
        cdsBugItem.FieldByName('ZRESOLUTION').AsInteger := cdsBugPlan.FieldByName('ZID').AsInteger;
        cdsBugItem.FieldByName('ZRESOLVEDVER').AsInteger := cdsProject.FieldByName('ZID').AsInteger;
        cdsBugItem.FieldByName('ZRESOLVEDDATE').AsDateTime := now();
        cdsBugItem.FieldByName('ZSTATUS').asInteger := DataSet.FieldByName('ZSTATUS').Asinteger;
        cdsBugItem.Post;
      end
      else begin
        if cdsBugItem.State in [dsEdit,dsInsert] then
          cdsBugItem.Post;
        cdsBugItem.Edit;
        cdsBugItem.FieldByName('ZRESOLVEDBY').AsInteger    := -1;
        cdsBugItem.FieldByName('ZRESOLUTION').AsInteger    := -1;
        cdsBugItem.FieldByName('ZRESOLVEDVER').AsInteger   := -1;
        cdsBugItem.FieldByName('ZRESOLVEDDATE').AsVariant  := NULL;
        cdsBugItem.FieldByName('ZSTATUS').asInteger := DataSet.FieldByName('ZSTATUS').Asinteger;
        cdsBugItem.Post;
      end;

      //邮件通知
      Mailto(cdsBugItem.FieldByName('ZMAILTO').AsString);
    except
      if myFileID >=0 then  //如已上传了附件，则要删除掉。
        ClientSystem.fdbOpr.DeleteFile(myFileID);
      ClientSystem.fDbOpr.RollbackTrans;
    end;
  end;


end;

procedure TBugManageDlg.actBugHistory_PrivBugUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (cdsBugItem.State in [dsBrowse])
  and (cdsBugHistory.State in [dsBrowse])
  and not cdsBugItem.Bof;
end;

procedure TBugManageDlg.actBugHistory_NextBugUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (cdsBugItem.State in [dsBrowse])
  and (cdsBugHistory.State in [dsBrowse])
  and not cdsBugItem.Eof;
end;

procedure TBugManageDlg.actBugHistory_PrivBugExecute(Sender: TObject);
begin
  cdsBugItem.Prior;
  lbBugCaption.Caption := cdsBugItem.FieldByName('ZTITLE').AsString;
  LoadBugHistory(cdsBugItem.FieldByName('ZID').Asinteger);
end;

procedure TBugManageDlg.actBugHistory_NextBugExecute(Sender: TObject);
begin
  cdsBugItem.Next;
  lbBugCaption.Caption := cdsBugItem.FieldByName('ZTITLE').AsString;
  LoadBugHistory(cdsBugItem.FieldByName('ZID').Asinteger);
end;

procedure TBugManageDlg.dgBugItemDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (cdsBugItem.FieldByName('ZSTATUS').AsInteger = Ord(bgsDeath)) then
  begin
    dgBugItem.Canvas.Font.Color := clblue;
  end;
  
  case Column.Index of
    Ord(bcWhoBuild) :
      if cdsBugItem.FieldByName('ZOPENEDBY').AsInteger =
         ClientSystem.fEditer_id then
      begin
        dgBugItem.Canvas.Brush.Color := clAqua;
      end;
    Ord(bcAssingeto):
      if cdsBugItem.FieldByName('ZASSIGNEDTO').AsInteger =
         ClientSystem.fEditer_id then
      begin
        dgBugItem.Canvas.Brush.Color := clYellow;
      end;
    Ord(bcwhoReso)  :
      if cdsBugItem.FieldByName('ZRESOLVEDBY').AsInteger =
         ClientSystem.fEditer_id then
      begin
        dgBugItem.Canvas.Brush.Color := clLime;
      end;
  end;
  dgBugItem.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TBugManageDlg.actBug_MeBuildExecute(Sender: TObject);
var
  myPageIndex:integer;
  mywhere : String;
  myData : PBugTreeNode;
begin
  mydata := tvProject.Selected.data;
  mydata^.fPageIndex := 1;
  myPageIndex := myData^.fPageIndex;
  mywhere := format('ZOPENEDBY=%d',[ClientSystem.fEditer_id]);
  myData^.fPageCount := GetBugItemPageCount(myPageindex,myWhere);
  LoadBugItem(myPageindex,myWhere);
  lbPageCount.Caption := format('%d/%d',[
    myData^.fPageIndex,
    myData^.fPageCount]);
  lbProjectName.Caption := format('%s  =>第%d共%d页',[
    myData^.fName,myData^.fPageIndex,myData^.fPageCount]);
end;

procedure TBugManageDlg.actBug_AssingToMeExecute(Sender: TObject);
var
  myPageIndex:integer;
  mywhere : String;
  myData : PBugTreeNode;
begin
  mydata := tvProject.Selected.data;
  mydata^.fPageIndex := 1;
  myPageIndex := myData^.fPageIndex;
  mywhere := format('ZASSIGNEDTO=%d',[ClientSystem.fEditer_id]);
  myData^.fPageCount := GetBugItemPageCount(myPageindex,myWhere);
  LoadBugItem(myPageindex,myWhere);
  lbPageCount.Caption := format('%d/%d',[
    myData^.fPageIndex,
    myData^.fPageCount]);
  lbProjectName.Caption := format('%s  =>第%d共%d页',[
    myData^.fName,myData^.fPageIndex,myData^.fPageCount]);
end;

procedure TBugManageDlg.actBug_ResoMeExecute(Sender: TObject);
var
  myPageIndex:integer;
  mywhere : String;
  myData : PBugTreeNode;
begin
  mydata := tvProject.Selected.data;
  mydata^.fPageIndex := 1;
  myPageIndex := myData^.fPageIndex;
  mywhere := format('ZRESOLVEDBY=%d',[ClientSystem.fEditer_id]);
  myData^.fPageCount := GetBugItemPageCount(myPageindex,myWhere);
  LoadBugItem(myPageindex,myWhere);
  lbPageCount.Caption := format('%d/%d',[
    myData^.fPageIndex,
    myData^.fPageCount]);
  lbProjectName.Caption := format('%s  =>第%d共%d页',[
    myData^.fName,myData^.fPageIndex,myData^.fPageCount]);
end;

function TBugManageDlg.UpBugFile(AFileName: String;
  var AFileID: integer): Boolean;
begin
  Result :=ClientSystem.UpFile(ftdBug,AFileName,AfileID);
end;

procedure TBugManageDlg.DBText3DblClick(Sender: TObject);
begin
  if actBugHistory_OpenFile.Enabled then
    actBugHistory_OpenFile.Execute;
end;

procedure TBugManageDlg.actBugHistory_OpenFileExecute(Sender: TObject);
var
  myfileid : integer;
  myfilename : string;
  r    : HINST;
begin
  myfileid := cdsBugHistory.FieldByName('ZANNEXFILE_ID').AsInteger;
  myfilename := cdsBugHistory.FieldByName('ZANNEXFILEName').AsString;
  if ClientSystem.DonwFileToFileName(myfileid,myfilename) then
  begin
    //打开文件
    r:=ShellExecute(Handle,'open',PChar(myfilename),
      nil,PChar(ExtractFileDir(myfilename)),SW_SHOW);

    //调用打开方式对话框
    if r =SE_ERR_NOASSOC then//如果没有关联的打开方式
      ShellExecute(Handle, 'open', 'Rundll32.exe',
        PChar('shell32.dll,OpenAs_RunDLL ' + myfilename), nil, SW_SHOWNORMAL);
  end;
end;

procedure TBugManageDlg.actBugHistory_OpenFileUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not cdsBugHistory.IsEmpty
  and (cdsBugHistory.FieldByName('ZANNEXFILE_ID').AsInteger >=0);
end;

procedure TBugManageDlg.actBug_RefreshDataUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(tvProject.Selected)
  and Assigned(tvProject.Selected.data);
end;

procedure TBugManageDlg.actBug_RefreshDataExecute(Sender: TObject);
var
  myBugData : PBugTreeNode;
  myPageindex : integer;
  mywhere : String;
begin
  myBugData := tvProject.Selected.data;
  myPageIndex := myBugData^.fPageIndex;
  mywhere := 'ZTREE_ID=' + inttostr(myBugData^.fID);
  myBugData^.fPageCount := GetBugItemPageCount(myPageindex,myWhere);
  lbPageCount.Caption := format('%d/%d',[
    myBugData^.fPageIndex,
    myBugData^.fPageCount]);
  LoadBugItem(myPageindex,myWhere);
  lbProjectName.Caption := format('%s  =>第%d共%d页',[
    myBugData^.fName,myBugData^.fPageIndex,myBugData^.fPageCount]);
end;

procedure TBugManageDlg.dblcSelectUsermailCloseUp(Sender: TObject);
var
  mystr : String;
begin
  if dblcSelectUsermail.Text = '' then Exit;
  
  if cdsBugItem.State in [dsBrowse] then
    cdsBugItem.Edit;

  myStr := cdsBugItem.FieldByName('ZMAILTO').AsString;
  if mystr <> '' then
    myStr := myStr + format(';%s(%d)',[
      DM.cdsUser.FieldByName('ZNAME').AsString,
      DM.cdsUser.FieldByName('ZID').AsInteger])
  else
    myStr := myStr + format('%s(%d)',[
      DM.cdsUser.FieldByName('ZNAME').AsString,
      DM.cdsUser.FieldByName('ZID').AsInteger]);
  cdsBugItem.FieldByName('ZMAILTO').AsString := myStr;
end;

procedure TBugManageDlg.Mailto(AEmailto: String);
var
  i     : integer;
  mysl  : TStringList;
  myStr : String;
  mysv  : TStringList;
  myMails : TStringList;
  myBugID  : integer; //Bug的ID值;
begin
  mysl := TStringList.Create;
  mysv := TStringList.Create;
  myMails := TStringlist.Create;
  try
    myBugID := cdsBugItem.FieldByName('ZID').AsInteger;
    //先加入创建人
    DM.cdsUser.ControlsDisabled;
    try
      if (cdsBugItem.FieldByName('ZOPENEDBY').AsInteger <> ClientSystem.fEditer_id)
         and  DM.cdsUser.Locate('ZID',
           cdsBugItem.FieldByName('ZOPENEDBY').AsInteger,[loPartialKey]) then
      begin
        mysl.Add(format('%s(%d)',[DM.cdsUser.FieldByName('ZNAME').AsString,
          DM.cdsUser.FieldByName('ZID').AsInteger]));
        myMails.Add(DM.cdsUser.FieldByName('ZEMAIL').AsString);
      end;

      if (cdsBugItem.FieldByName('ZRESOLVEDBY').AsInteger <> ClientSystem.fEditer_id)
         and DM.cdsUser.Locate('ZID',
          cdsBugItem.FieldByName('ZRESOLVEDBY').AsInteger,[loPartialKey]) then
      begin
        myStr := format('%s(%d)',[DM.cdsUser.FieldByName('ZNAME').AsString,
          DM.cdsUser.FieldByName('ZID').AsInteger]);
        if mysl.IndexOf(myStr) < 0 then
          mysl.Add(myStr);
        myMails.Add(DM.cdsUser.FieldByName('ZEMAIL').AsString);
      end;

      ClientSystem.SplitStr(AEmailto,mysv,';');
      for i:=0 to  mysv.Count -1 do
      begin
        if mysl.IndexOf(mysv[i]) < 0 then
        begin
          mysl.Add(mysv[i]);
          DM.cdsUser.First;
          while not DM.cdsUser.Eof do
          begin
            myStr := format('%s(%d)',[DM.cdsUser.FieldByName('ZNAME').AsString,
              DM.cdsUser.FieldByName('ZID').AsInteger]);
            if CompareText(myStr,mysv[i]) = 0 then
            begin
              myMails.Add(DM.cdsUser.FieldByName('ZEMAIL').AsString);
              break;
            end;
            DM.cdsUser.Next;
          end;
        end;
      end;

    finally
      DM.cdsUser.EnableControls;
    end;

    //调用接口发送
    mystr := '';
    for i:=0 to myMails.Count -1 do
    begin
      if Trim(myMails[i])='' then Continue;
      if mystr = '' then
        mystr := myMails[i]
      else
        mystr := mystr + ';' + myMails[i];
    end;

    if mystr <> '' then
      ClientSystem.fDbOpr.MailTo(0,myStr,myBugID);
  finally
    mysl.Free;
    mysv.Free;
    myMails.Free;
  end;
end;

end.
