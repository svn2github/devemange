unit DesignDocumentClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseChildfrm, ComCtrls, ExtCtrls, StdCtrls, Buttons, ActnList,
  Grids, Menus,

  ExcelUnits,            
  ClientTypeUnits, DB, DBClient;

type
  TDesignDocumentClientDlg = class(TBaseChildDlg)
    tvProject: TTreeView;
    Splitter1: TSplitter;
    plClient: TPanel;
    plTool: TPanel;
    lbDocName: TLabel;
    BitBtn1: TBitBtn;
    ActionList1: TActionList;
    actEditor_Save: TAction;
    dgExcel: TDrawGrid;
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
    actEditor_FrontCol: TAction;
    actEditor_BlackCol: TAction;
    cdsData: TClientDataSet;
    actProject_AddDir: TAction;
    pmProject: TPopupMenu;
    N8: TMenuItem;
    actProject_DelDir: TAction;
    N9: TMenuItem;
    actProject_AddExcel: TAction;
    N10: TMenuItem;
    BitBtn2: TBitBtn;
    actProject_OpenFile: TAction;
    cbAction: TComboBox;
    Bevel1: TBevel;
    cbFontColor: TColorBox;
    cbbgColor: TColorBox;
    btbnOK: TBitBtn;
    actEdit_SetCells: TAction;
    actEdit_savecolwidth: TAction;
    N12: TMenuItem;
    actEdit_SaveRowHgith: TAction;
    N13: TMenuItem;
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
    procedure actProject_OpenFileUpdate(Sender: TObject);
    procedure actProject_OpenFileExecute(Sender: TObject);
    procedure actEditor_SaveExecute(Sender: TObject);
    procedure actEditor_SaveUpdate(Sender: TObject);
    procedure dgExcelDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure dgExcelSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure dgExcelGetEditText(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure actEdit_SetCellsUpdate(Sender: TObject);
    procedure actEdit_SetCellsExecute(Sender: TObject);
    procedure actEdit_savecolwidthUpdate(Sender: TObject);
    procedure actEdit_savecolwidthExecute(Sender: TObject);
    procedure actEdit_SaveRowHgithExecute(Sender: TObject);
    procedure actEdit_SaveRowHgithUpdate(Sender: TObject);
  private
    fCurrentDoc : PProjectDoc; //当前文件
    function GetCurrentExcel: TExcelFile;

    procedure LoadProject(ANode:TTreeNode;APID:integer);
    procedure LoadExcel(AExcelFile:TExcelFile);
    procedure ClearNode(ANode:TTreeNode);  //清空
  private
    procedure initBase; override;
    procedure freeBase; override;
    property CurrentExcel : TExcelFile read GetCurrentExcel;
  public
    { Public declarations }
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
  dgExcel.FixedRows := myCount;
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
  dgExcel.FixedCols := myCount;
  CurrentExcel.fFixedCols := myCount -1;
  CurrentExcel.fmodify := True;
end;

procedure TDesignDocumentClientDlg.LoadExcel(AExcelFile: TExcelFile);
var
  i : integer;
begin
  dgExcel.Visible   := True;
  dgExcel.ColCount  := AExcelFile.ColCount+1;
  dgExcel.RowCount  := AExcelFile.RowCount+1;
  dgExcel.FixedCols := AExcelFile.fFixedCols + 1;
  dgExcel.FixedRows := AExcelFile.fFixedRow  + 1;

  for i :=1 to dgExcel.ColCount -1 do
    dgExcel.ColWidths[i] := AExcelFile.fCols[i-1].fWidht;

  for i:=1 to dgExcel.RowCount -1 do
    dgExcel.RowHeights[i] := AExcelFile.Rows[i-1].fHight;
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
      myData^.fFile_id := cdsData.FieldByName('ZFILE_ID').AsInteger;
      myData^.fFile_ver := cdsData.FieldByName('ZFILE_VER').AsInteger;
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
  dgExcel.ColWidths[0] := 40;
  dgExcel.FixedRows := 4;
  dgExcel.DefaultRowHeight := 21;
  
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
  myName := InputBox('新建目录','目录名称','');
  myName := Trim(myName);
  if myName = '' then Exit;

  myData := tvProject.Selected.data;
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
  myms : TMemoryStream;
  myfilename : string;
  mySQL : string;
const
  glSQL  = 'insert TB_PRO_DOCUMENT (ZPID,ZNAME,ZSTYLE,ZFILE_ID,ZFILE_VER, ' +
           ' ZHASCHILD,ZDOCTYPE) ' +
           'values(%d,''%s'',1,%d,1,0,0)';
  glSQL1 = 'update TB_PRO_DOCUMENT set ZHASCHILD=1 where ZID=%d';
begin
  myName := InputBox('新建电子表格文档','名称:','');
  myName := Trim(myName);
  if myName = '' then Exit;

  myNodeData := tvProject.Selected.data;

  myExcelFile := TExcelFile.Create;
  myms := TMemoryStream.Create;
  try
    myfilename := ClientSystem.fTempDir + '\' + myname + '.prodoc';

    myExcelFile.SaveToStream(myms);
    myms.SaveToFile(myfilename);

    myfileid := -1;
    if not ClientSystem.UpFile(fsDoc,myNodeData^.fID,myfilename,myfileid,1) then
    begin
      MessageBox(Handle,'新建出错','提示',MB_ICONERROR+MB_OK);
      Exit;
    end;

    ClientSystem.fDbOpr.BeginTrans;
    try
      mySQL := format(glSQL,[myNodeData^.fID,myName,myfileid]);
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));

      if not myNodeData^.fhasChild then
      begin
        mySQL := format(glSQL1,[myNodeData^.fID]);
        ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
        myNodeData^.fhasChild := True;
      end;
      ClientSystem.fDbOpr.CommitTrans;

      LoadProject(tvProject.Selected,myNodeData^.fID);
      deletefile(myfilename);
    except
      ClientSystem.fDbOpr.RollbackTrans;
      if myfileid >=0 then
        ClientSystem.fDbOpr.DeleteFile(myfileid);
    end;

  finally
    myExcelFile.Free;
    myms.Free;
  end;
end;

procedure TDesignDocumentClientDlg.actProject_OpenFileUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(tvProject.Selected)
  and Assigned(tvProject.Selected.data)
  and (PProjectDoc(tvProject.Selected.data)^.fStyle=1);
end;

procedure TDesignDocumentClientDlg.actProject_OpenFileExecute(
  Sender: TObject);
var
  myNodeData : PProjectDoc;
  myfilename : string;
  myms : TMemoryStream;
begin
  //打开

  myNodeData := tvProject.Selected.data;

  if Assigned(fCurrentDoc) and Assigned(fCurrentDoc^.fExcelFile)
     and fCurrentDoc^.fExcelFile.fmodify
     and (myNodeData^.fID <>fCurrentDoc^.fID) then
  begin
    if MessageBox(Handle,'当前打开的文档已修改了，是否要保存?',
      '提示保存',MB_ICONWARNING+MB_YESNO)=IDYES then
      actEditor_Save.Execute;
  end;



  if not Assigned(myNodeData^.fExcelFile) then
  begin
    myNodeData^.fExcelFile := TExcelFile.Create;
    myfilename := myNodeData^.fName;
    if not ClientSystem.DonwFileToFileName(myNodeData^.fFile_id,myfilename) then
    begin
      MessageBox(Handle,'文件打开出错','提示',MB_ICONERROR+MB_OK);
      myNodeData^.fExcelFile.Free;
      myNodeData^.fExcelFile := nil;
      Exit;
    end;

    myms := TMemoryStream.Create;
    try
      myms.LoadFromFile(myfilename);
      deletefile(myfilename);
      myms.Position := 0;
      myNodeData^.fExcelFile.LoadfromStream(myms);
    finally
      myms.Free;
    end;
  end;

  lbDocName.Caption := myNodeData^.fName;
  fCurrentDoc := myNodeData;
  LoadExcel(myNodeData^.fExcelFile);

end;

procedure TDesignDocumentClientDlg.actEditor_SaveExecute(Sender: TObject);
var
  myms : TMemoryStream;
  mySQL : string;
  myfilename : string;
  myTreeID : integer;
  myver : integer;
const
  glSQL  = 'select ZFILE_VER from TB_PRO_DOCUMENT where ZID=%d';
  glSQL2 = 'update TB_PRO_DOCUMENT set ZFILE_VER=%d where ZID=%d';
begin

  mySQL := format(glSQL,[fCurrentDoc^.fID]);

  if ClientSystem.fDbOpr.ReadInt(PChar(mySQL)) <>
     fCurrentDoc^.fFile_ver then
  begin
    MessageBox(Handle,'文件已被别人修改过并保存了，你不能再保存。','保存',
      MB_ICONERROR+MB_OK);
    Exit;
  end;

  myms := TMemoryStream.Create;
  try
    myfilename := ClientSystem.fTempDir + '\' + fCurrentDoc^.fName + '.prodoc';
    fCurrentDoc^.fExcelFile.SaveToStream(myms);
    myms.SaveToFile(myfilename);
    myTreeID := -1;
    if Assigned(fCurrentDoc^.fParent) then
      myTreeID := fCurrentDoc^.fParent^.fID;
    myver := fCurrentDoc^.fFile_ver + 1;

    if not ClientSystem.UpFile(fsDoc,myTreeID,myfilename,fCurrentDoc^.fFile_id,myver) then
    begin
      MessageBox(Handle,'保存出错','提示',MB_ICONERROR+MB_OK);
      Exit;
    end;

    fCurrentDoc^.fFile_ver := myver;

    ClientSystem.fDbOpr.BeginTrans;
    try
      mySQL := format(glSQL2,[myver,fCurrentDoc^.fID]);
      ClientSystem.fDbOpr.ExeSQL(pChar(mySQL));
      ClientSystem.fDbOpr.CommitTrans;
      fCurrentDoc^.fExcelFile.fmodify := False;
    except
      ClientSystem.fDbOpr.RollbackTrans;
    end;
    deletefile(myfilename);
  finally
    myms.Free;
  end;
end;

procedure TDesignDocumentClientDlg.actEditor_SaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(Self.fCurrentDoc);
end;

procedure TDesignDocumentClientDlg.dgExcelDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  myRect : TRect;
  myStr : String;
  myAlignent : TAlignment; //
  myCell : TExcelCell;
const
  gcColumnTitle : array[0..25] of string = ('A','B','C','D','E','F','G',
    'H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
begin
  if fLoading then Exit;
  myRect := Rect;
  InflateRect(myRect,-1,-1);
  //1.列
  if (ARow = 0) and (ACol>0) then
  begin
    myStr := gcColumnTitle[ACol-1];
    myAlignent := taCenter; //居中
  end
  //2.行
  else if (ACol=0) and (ARow>0) then begin
    myStr := inttostr(ARow);
    myAlignent := taCenter;
  end
  //单元格内容
  else if (ACol>0) and (ARow>0) then begin
    if Assigned(fCurrentDoc) and Assigned(fCurrentDoc^.fExcelFile) then
    begin
     // if (ACol-1 = 1) and (ARow-1=0) then
     //   showmessage('ttt');
      myCell := fCurrentDoc^.fExcelFile.Cells[ACol-1,ARow-1];
      if Assigned(myCell) then
      begin
        myStr := myCell.fText;
        //if myStr = '' then Exit;
        //if mystr <> '' then showmessage(mystr);
        dgExcel.Canvas.Pen.Color :=myCell.fColor;
        dgExcel.Canvas.Brush.Color := myCell.fbgColor;
        dgExcel.Canvas.Font.Assign(myCell.fFont);
        dgExcel.Canvas.FillRect(Rect);
      end;
    end;
  end
  else Exit;

  with dgExcel do
  begin
    case myAlignent of
      taLeftJustify :
        Canvas.TextOut(myRect.Left,
          myRect.Top+ (Rect.Bottom - Rect.Top - Canvas.TextHeight(myStr)) div 2,
          myStr);
      taRightJustify:
        Canvas.TextOut(myRect.Right - Canvas.TextWidth(myStr),
          myRect.Top+ (Rect.Bottom - Rect.Top - Canvas.TextHeight(myStr)) div 2,
          myStr);
      taCenter:
          Canvas.TextOut(myRect.Left + (myRect.Right-myRect.Left - Canvas.TextWidth(myStr)) div 2,
           myRect.Top+ (Rect.Bottom - Rect.Top - Canvas.TextHeight(myStr)) div 2,
           myStr);
    end;
  end;

end;

procedure TDesignDocumentClientDlg.dgExcelSetEditText(Sender: TObject;
  ACol, ARow: Integer; const Value: String);
var
  mycell : TExcelCell;
begin
  if fLoading then Exit;
  if (ACol >=1) and (ARow >=1) and
     Assigned(fCurrentDoc) and Assigned(fCurrentDoc^.fExcelFile) then
  begin
    mycell := fCurrentDoc^.fExcelFile.Cells[ACol-1,ARow-1];
    if Assigned(mycell) and
       (CompareText(mycell.fText,Value)<>0) then
    begin
      mycell.fText := Value;
      fCurrentDoc^.fExcelFile.fmodify := True;
    end;
  end;
end;

procedure TDesignDocumentClientDlg.dgExcelGetEditText(Sender: TObject;
  ACol, ARow: Integer; var Value: String);
begin
  if fLoading then Exit;
  if (ACol >=1) and (ARow >=1) and
     Assigned(fCurrentDoc) and Assigned(fCurrentDoc^.fExcelFile) then
  begin
    Value := fCurrentDoc^.fExcelFile.Cells[ACol-1,ARow-1].fText;
  end;
end;

procedure TDesignDocumentClientDlg.actEdit_SetCellsUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(fCurrentDoc) and
  Assigned(fCurrentDoc^.fExcelFile) and
  (cbAction.ItemIndex>=0) and (dgExcel.Row>=1) and (dgExcel.Col>=1) ;
end;

procedure TDesignDocumentClientDlg.actEdit_SetCellsExecute(
  Sender: TObject);
var
  i : integer;
  myCell : TExcelCell;
  myRowData  : TExcelRow;
  myRow,myCol : integer;
begin
  //
  //
  //
  myRow := dgExcel.Row -1 ;
  myCol := dgExcel.Col -1;
  case cbAction.ItemIndex of
    0: {cell}
      begin
        myCell := fCurrentDoc^.fExcelFile.Cells[myCol,myRow];
        if Assigned(myCell) then
        begin
          myCell.fColor   := cbFontColor.Selected;
          myCell.fbgColor := cbbgColor.Selected;
          fCurrentDoc.fExcelFile.fmodify := True;
        end;
      end;
    1: {row}
      begin
        myRowData := fCurrentDoc^.fExcelFile.Rows[myRow];
        for i:=0 to High(myRowData.fCells) do
        begin
          myCell := myRowData.fCells[i];
          myCell.fColor   := cbFontColor.Selected;
          myCell.fbgColor := cbbgColor.Selected;
        end;
        fCurrentDoc.fExcelFile.fmodify := True;
      end;
    2: {col}
      begin

      end;
  end;

  dgExcel.Repaint;
end;

procedure TDesignDocumentClientDlg.actEdit_savecolwidthUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(fCurrentDoc) and
  Assigned(fCurrentDoc^.fExcelFile) and
   (dgExcel.Row>=1) and (dgExcel.Col>=1) ;
end;

procedure TDesignDocumentClientDlg.actEdit_savecolwidthExecute(
  Sender: TObject);
var
  i : integer;
begin
  for i:=1 to dgExcel.ColCount - 1 do
    fCurrentDoc^.fExcelFile.fCols[i-1].fWidht :=
    dgExcel.ColWidths[i];
  fCurrentDoc^.fExcelFile.fmodify := True;
end;

procedure TDesignDocumentClientDlg.actEdit_SaveRowHgithExecute(
  Sender: TObject);
var
  i : integer;
begin
  for i:= 1 to dgExcel.RowCount -1 do
  begin
    fCurrentDoc^.fExcelFile.Rows[i-1].fHight :=
    dgExcel.RowHeights[i];
  end;
  fCurrentDoc^.fExcelFile.fmodify := True;
end;

procedure TDesignDocumentClientDlg.actEdit_SaveRowHgithUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(fCurrentDoc) and
  Assigned(fCurrentDoc^.fExcelFile) and
   (dgExcel.Row>=1) and (dgExcel.Col>=1) ;
end;

end.
