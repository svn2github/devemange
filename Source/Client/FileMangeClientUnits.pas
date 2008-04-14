unit FileMangeClientUnits;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, MConnect, StdCtrls, ExtCtrls, ComCtrls, Gauges,
  ImgList,ClientTypeUnits,
  BaseChildfrm,
  Buttons, ActnList, Menus, AppEvnts;

type

  TFileListColumn = (
    flcName,
    flcVer,
    flcEditDateTime,
    flcSize,
    flcEditor,
    flcPath);

const
   FileListColumnCaption : array[flcName..flcPath] of String =(
      '名称',
      '版本',
      '日期',
      '大小',
      '编辑',
      '路径' );

type
  TFileManageDlg = class(TBaseChildDlg)
    OpenDialog1: TOpenDialog;
    SaveDialog: TSaveDialog;
    cdsQuery: TClientDataSet;
    Splitter1: TSplitter;
    plfilelist: TPanel;
    lvFileItem: TListView;
    ActionList1: TActionList;
    actFile_DeleteFIle: TAction;
    actTree_DeleteDir: TAction;
    pmTree: TPopupMenu;
    pmFile: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    actFile_AddFile: TAction;
    actFile_DownLoadFIle: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    actTree_AddDir: TAction;
    N5: TMenuItem;
    actFile_HistoryFile: TAction;
    actFile_Updatefile: TAction;
    acFile_ShowNote: TAction;
    N6: TMenuItem;
    plFileTop: TPanel;
    actTree_ReName: TAction;
    N7: TMenuItem;
    actFile_ReName: TAction;
    N8: TMenuItem;
    plTree: TPanel;
    tvFileTree: TTreeView;
    plMainBottom: TPanel;
    Button7: TButton;
    Button8: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    plNoVisible: TPanel;
    actFile_Openfile: TAction;
    actFile_SaveFile: TAction;
    actFile_UndoOpen: TAction;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    actTree_OpenModlue: TAction;
    N9: TMenuItem;
    cdsOpenMode: TClientDataSet;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    actFile_Viewfile: TAction;
    BitBtn6: TBitBtn;
    actFile_SendMail: TAction;
    N14: TMenuItem;
    actFile_CopyAndPaste: TAction;
    N15: TMenuItem;
    ImageListFileIcon: TImageList;
    N16: TMenuItem;
    N17: TMenuItem;
    BitBtn7: TBitBtn;
    actFile_Newfile: TAction;
    procedure FormDestroy(Sender: TObject);
    procedure tvFileTreeExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure tvFileTreeChange(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actTree_DeleteDirUpdate(Sender: TObject);
    procedure actTree_DeleteDirExecute(Sender: TObject);
    procedure actFile_AddFileExecute(Sender: TObject);
    procedure actFile_DownLoadFIleExecute(Sender: TObject);
    procedure actTree_AddDirExecute(Sender: TObject);
    procedure actFile_DeleteFIleExecute(Sender: TObject);
    procedure actFile_DeleteFIleUpdate(Sender: TObject);
    procedure acFile_ShowNoteExecute(Sender: TObject);
    procedure acFile_ShowNoteUpdate(Sender: TObject);
    procedure actFile_UpdatefileUpdate(Sender: TObject);
    procedure actFile_UpdatefileExecute(Sender: TObject);
    procedure actFile_HistoryFileExecute(Sender: TObject);
    procedure actFile_HistoryFileUpdate(Sender: TObject);
    procedure actFile_DownLoadFIleUpdate(Sender: TObject);
    procedure actTree_ReNameExecute(Sender: TObject);
    procedure actTree_ReNameUpdate(Sender: TObject);
    procedure actFile_ReNameExecute(Sender: TObject);
    procedure actFile_ReNameUpdate(Sender: TObject);
    procedure lvFileItemCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure lvFileItemColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvFileItemClick(Sender: TObject);
    procedure actTree_OpenModlueUpdate(Sender: TObject);
    procedure actTree_OpenModlueExecute(Sender: TObject);
    procedure actFile_OpenfileUpdate(Sender: TObject);
    procedure actFile_OpenfileExecute(Sender: TObject);
    procedure actFile_UndoOpenUpdate(Sender: TObject);
    procedure actFile_UndoOpenExecute(Sender: TObject);
    procedure actFile_SaveFileExecute(Sender: TObject);
    procedure actFile_SaveFileUpdate(Sender: TObject);
    procedure lvFileItemCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure actFile_ViewfileUpdate(Sender: TObject);
    procedure actFile_ViewfileExecute(Sender: TObject);
    procedure actFile_SendMailUpdate(Sender: TObject);
    procedure actFile_SendMailExecute(Sender: TObject);
    procedure actFile_CopyAndPasteUpdate(Sender: TObject);
    procedure actFile_CopyAndPasteExecute(Sender: TObject);
    procedure lvFileItemCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure actFile_NewfileUpdate(Sender: TObject);
    procedure actFile_NewfileExecute(Sender: TObject);
  private
    fLoading  : Boolean;
    fColumnToSort : integer; //列的排序索引
    fbSort : Boolean;        //=True 表示升序

    procedure initform;
    procedure freeform;
    procedure initLocalDataSet; //创建本地库


    function HasNodeChild(AParentID:integer):Boolean; // 确定是否有下级
    procedure ClearNodes(AParentNode:TTreeNode); //清空下级的内容
    procedure LoadFileTreeNode(AParentNode:TTreeNode;APID:integer); //加载节点内容
    procedure ExecSQL(ASQL:String); //执行SQL
    procedure GetOpenFileExe(ANodeData:PFileTreeNode;var AExt, AExe:String); //找到文件的打开方式，这个可以继承向上取的


    procedure ClearItem;
    procedure LoadFileItem(ATreeID:integer); //加载文件列表
    procedure LoadFileListItem(AItem:TListItem;AItemData:PFileItem); //加载行
    procedure ListView_SetItemImageIndex(Item: TListItem);

  public
    fIconList:TStringList;   //有于保存文件图标
    //重载方法
    class function GetModuleID : integer;override;
  end;

implementation

uses
  ClinetSystemUnits,
  FileHistoryListfrm,
  FileEditNotefrm,
  SetFileOpenModefrm,
  SendMailUnits,        //发送邮件
  NewFilefrm,           //新建
  ShellAPI,
  ZLibEx, DmUints, BugManageClientfrm, Loginfrm;


{$R *.dfm}

type
   TByteArray = array of byte;

  procedure OleVariantToStream(var Input: OleVariant; Stream: TStream);
  var
    pBuf: Pointer;
  begin
     pBuf := VarArrayLock(Input);
     Stream.Write(TByteArray(pBuf^), Length(TByteArray(Input)));
    VarArrayUnlock(Input);
  end;

  function StreamToOleVariant(Stream: TStream; Count: Integer): OleVariant;
  var
    pBuf: Pointer;
  begin
    Result := VarArrayCreate([0, Count-1], varByte);
    pBuf := VarArrayLock(Result);
    Stream.Read(TByteArray(pBuf^), Length(TByteArray(Result)));
    VarArrayUnlock(Result);
  end;
  

procedure TFileManageDlg.initform;
var
  i : TFileListColumn;
const
  glSQL = 'select ZSTYLE,ZMODULEID,ZRIGHTMASK from TB_USER_PRIVILEGE ' +
          'where ZUSER_ID=%d';
begin

  fIconList:= TStringList.Create;
  fLoading := False;
  fbSort := True;
  fColumnToSort := -1;
  for i:= flcName to flcPath do
  begin
    lvFileItem.Columns[Ord(i)].Caption :=
      FileListColumnCaption[i];
  end;

  initLocalDataSet;
end;

function TFileManageDlg.HasNodeChild(AParentID: integer):Boolean;
const
  glSQL = 'select count(*) as mycount from TB_FILE_TREE where ZPID=%d';
begin
  Result := False;
  if not ClientSystem.fDBOpr.Connected then Exit;
  Result := ClientSystem.fDBOpr.ReadInt(PChar(Format(glSQL,[AParentID])))>0;
end;

procedure TFileManageDlg.ClearNodes(AParentNode: TTreeNode);
var
  myChild : TTreeNode;
  myBorther : TTreeNode;
  myNodeData : PFileTreeNode;
begin
  myChild := AParentNode.getFirstChild;
  myBorther := AParentNode.getNextSibling;
  while (myChild <> nil) and (myBorther<>myChild) do
  begin
    if Assigned(myChild.data) then
    begin
      myNodeData := myChild.data;
      Dispose(myNodeData);
      myChild.data := nil;
    end;
    myChild := myChild.GetNext;
  end;
  AParentNode.DeleteChildren;
end;

procedure TFileManageDlg.freeform;
var
  myNodeData : PFileTreeNode;
begin
  //
  if tvFileTree.TopItem <> nil then
  begin
    ClearNodes(tvFileTree.TopItem);
    if Assigned(tvFileTree.TopItem.Data) then
    begin
      myNodeData := tvFileTree.TopItem.Data;
      Dispose(myNodeData);
    end;
  end;
  fIconList.Free;
  //清空列表内的
  ClearItem;
end;

procedure TFileManageDlg.FormDestroy(Sender: TObject);
begin
  freeform;
end;

procedure TFileManageDlg.LoadFileTreeNode(AParentNode: TTreeNode; APID: integer);
var
  myNode : TTreeNode;
  myNodeData : PFileTreeNode;
  myb : Boolean;
const
  glSQL = 'select * from TB_FILE_TREE where ZPID=%d';
begin
  if not ClientSystem.fDBOpr.Connected then Exit;

  cdsQuery.Data := ClientSystem.fDBOpr.ReadDataSet(PChar(format(glSQL,[APID])));

  myb := fLoading;
  fLoading := True;
  tvFileTree.Items.BeginUpdate;
  try
    if AParentNode = nil then
      tvFileTree.Items.Clear
    else
      AParentNode.DeleteChildren;

    while not cdsQuery.Eof do
    begin

      //
      // 没有权限不加载
      //
      if not HasModuleAction(Ord(fsmDir),
        cdsQuery.FieldByName('ZID').AsInteger,atView) and (APID<>-1) then
      begin
        cdsQuery.Next;
        Continue;
      end;

      new(myNodeData);
      if AParentNode <> nil then
        myNodeData^.fParent := AParentNode.data
      else
        myNodeData^.fParent := nil;
      myNodeData^.fID   := cdsQuery.FieldByName('ZID').AsInteger;
      myNodeData^.fPID  := cdsQuery.FieldByName('ZPID').AsInteger;
      myNodeData^.fName := cdsQuery.FieldByName('ZNAME').AsString;
      myNodeData^.fNote := cdsQuery.FieldByName('ZNOTE').AsString;
      myNodeData^.fhasChild := cdsQuery.FieldByName('ZHASCHILD').AsBoolean;
      myNode := tvFileTree.Items.AddChild(AParentNode,myNodeData^.fName);
      myNode.Data := myNodeData;
      if myNodeData^.fhasChild then
        tvFileTree.Items.AddChildFirst(myNode,'读取数据...');
      cdsQuery.Next;
      if myNodeData^.fPID = -1 then
      begin
        myNode.SelectedIndex := 0;
        myNode.ImageIndex := 0;
      end
      else begin
        myNode.SelectedIndex := 2;
        myNode.ImageIndex := 1;
      end;
    end;
  finally
    tvFileTree.Items.EndUpdate;
    fLoading := myb;
  end;
end;

procedure TFileManageDlg.ExecSQL(ASQL: String);
begin
  if not ClientSystem.fDBOpr.Connected then Exit;
  ClientSystem.fDBOpr.ExeSQL(PChar(ASQL));
end;

procedure TFileManageDlg.tvFileTreeExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
var
  myNodeData : PFileTreeNode;
begin
  if Node.Count = 1 then
  begin
    if not Assigned(Node.Item[0].data) then
    begin
      myNodeData := Node.data;
      LoadFileTreeNode(Node,myNodeData^.fID);
    end;
  end;
  AllowExpansion := True;

end;

procedure TFileManageDlg.LoadFileItem(ATreeID: integer);
var
  myItem : TListItem;
  myItemData : PFileItem;
const
  glSQL = 'select a.*,b.ZNAME as UserName from TB_FILE_ITEM as a  '         +
          'left join TB_USER_ITEM as b on a.ZEDITER_ID = b.ZID '            +
          'where a.ZTREE_ID=%d and a.ZNEWVER=1 and a.ZSTYPE=%d ';  //其中ZNEWVER=TRUE在MSSQL2000有问题
begin
  ClientSystem.BeginTickCount;
  lvFileItem.Items.BeginUpdate;
  try
    ClearItem;
    if not ClientSystem.fDBOpr.Connected then Exit;

    cdsQuery.Data := ClientSystem.fDBOpr.ReadDataSet(PChar(format(glSQL,[ATreeID,
      Ord(fsFile)])));

    cdsQuery.First;
    while not cdsQuery.Eof do
    begin

      //
      // 没有权限不加载
      //
      if not HasModuleAction(Ord(fsmfile),
        cdsQuery.FieldByName('ZID').AsInteger,atView) then
      begin
        cdsQuery.Next;
        Continue;
      end;

      new(myItemData);
      myItemData^.fTreeID := ATreeID;
      myItemData^.fID := cdsQuery.FieldByName('ZID').AsInteger;
      myItemData^.fVer := cdsQuery.FieldByName('ZVer').AsInteger;
      myItemData^.fName := cdsQuery.FieldByName('ZNAME').AsString;
      myItemData^.fEDITER_ID := cdsQuery.FieldByName('ZEDITER_ID').AsInteger;
      myItemData^.fEDITER := cdsQuery.FieldByName('UserName').AsString;
      myItemData^.fSTATUS := cdsQuery.FieldByName('ZSTATUS').AsInteger;
      myItemdata^.fEXT    := cdsQuery.FieldByName('ZEXT').AsString;
      myItemdata^.fEDITDATETIME := cdsQuery.FieldByName('ZEDITDATETIME').AsDateTime;
      myItemdata^.fSTRUCTVER := cdsQuery.FieldByName('ZSTRUCTVER').AsInteger;
      myItemdata^.fTYPE := cdsQuery.FieldByName('ZTYPE').AsInteger;
      myItemdata^.fFilePath := cdsQuery.FieldByName('ZFILEPATH').AsString;
      myItemdata^.fSzie := cdsQuery.FieldByName('ZSIZE').AsInteger;

      myItem := lvFileItem.Items.Add;
      myItem.data := myItemData;
      LoadFileListItem(myItem,myItemData);
      cdsQuery.Next;
    end;

    if fColumnToSort >=0 then lvFileItem.AlphaSort;

  finally
    lvFileItem.Items.EndUpdate;
    ClientSystem.EndTickCount;
  end;
end;

procedure TFileManageDlg.ClearItem;
var
  i : integer;
  myItemData : PFileItem;
begin
  for i:=0 to lvFileItem.Items.Count -1 do
  begin
    myItemData := lvFileItem.Items[i].data;
    Dispose(myItemData);
  end;
  lvFileItem.Clear;
end;

procedure TFileManageDlg.LoadFileListItem(AItem: TListItem; AItemData: PFileItem);
var
  i : TFileListColumn;
begin
  AItem.SubItems.Clear;
  for i:= flcName to flcPath do
  begin
    case i of
      flcName: AItem.Caption := AItemData^.fName;
      flcVer : AItem.SubItems.Add(inttostr(AItemData^.fVer));
      flcEditDateTime:
        AItem.SubItems.Add(formatdatetime('yyyy-mm-dd hh:mm:ss',
          AItemData^.fEDITDATETIME));
      flcSize :
        AItem.SubItems.Add(inttostr(AItemData^.fSzie)+'KB');
      flcEditor:
        begin
          if AItemData^.fStatus = 1 then
            AItem.SubItems.Add(AItemData^.fEDITER)
          else
            AItem.SubItems.Add('');
        end;
      flcPath:
        begin
          if AItemData^.fStatus = 1 then
            AItem.SubItems.Add(AItemData^.fFILEPATH)
          else
            AItem.SubItems.Add('');
        end;
    end;
  end; // end i
  ListView_SetItemImageIndex(AItem);
end;

procedure TFileManageDlg.tvFileTreeChange(Sender: TObject; Node: TTreeNode);
var
  myNodeData : PFileTreeNode;
begin
  myNodeData := Node.Data;
  ShowStatusBarText(2,format('分部号=%d',[myNodeData^.fid]));
  if not HasModuleActionByShow(Ord(fsmDir),myNodeData^.fID,atView) then
    Exit;
  LoadFileItem(myNodeData^.fID);
end;

procedure TFileManageDlg.FormCreate(Sender: TObject);
begin
  initform;
end;

procedure TFileManageDlg.FormShow(Sender: TObject);
begin
  Application.ProcessMessages;
  if ClientSystem.fDBOpr.Connected then
    LoadFileTreeNode(nil,-1);
end;

procedure TFileManageDlg.actTree_DeleteDirUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(tvFileTree.Selected)
   and Assigned(tvFileTree.Selected.data)
   and Assigned(tvFileTree.Selected.Parent)
   and Assigned(tvFileTree.Selected.Parent.data);
end;

procedure TFileManageDlg.actTree_DeleteDirExecute(Sender: TObject);
const
  glSQL  = 'delete TB_FILE_TREE where ZID=%d';
  glSQL2 = 'delete TB_FILE_ITEM where ZTREE_ID=%d';
  glSQL3 = 'select * from TB_FILE_ITEM where ZTREE_ID=%d';
  glSQL4 = 'delete TB_FILE_CONTEXT where ZFILE_ID=%d';
  glSQL5 = 'select * from TB_FILE_TREE where ZPID=%d';
  glSQL6 = 'update TB_FILE_TREE set ZHASCHILD=1 where ZID=%d';
  glSQL7 = 'update TB_FILE_TREE set ZHASCHILD=0 where ZID=%d';

  //删除目录下的文件及子目录
  function DoDeleteDir(AID:integer):Boolean;
  var
    myDataSet : TClientDataSet;
    myc : integer;
  begin
    myDataSet := TClientDataSet.Create(nil);
    try
      try
        myDataSet.Data := ClientSystem.fDBOpr.ReadDataSet(PChar(format(glSQL3,[AID])));
        myDataSet.First;
        ClientSystem.fGauge.MaxValue := myDataSet.RecordCount;
        myc := 0;
        while not myDataSet.Eof do
        begin
          ClientSystem.fDBOpr.ExeSQL(PChar(format(glSQL4,[mydataSet.FieldByName('ZID').AsInteger])));
          myDataSet.Next;
          inc(myc);
          ClientSystem.fGauge.Progress := myc;
        end;
        ClientSystem.fDBOpr.ExeSQL(PChar(format(glSQL2,[AID])));

        //子目录
        myDataSet.Data := ClientSystem.fDBOpr.ReadDataSet(PChar(format(glSQL5,[AID])));
        myDataSet.First;
        while not myDataSet.Eof do
        begin
          if not DoDeleteDir(myDataSet.FieldByName('ZID').AsInteger) then
          begin
            Result := False;
            Exit;
          end;
          myDataSet.Next;
        end;

        ClientSystem.fDBOpr.ExeSQL(PChar(format(glSQL,[AID])));
        Result := True;

      except
        Result := False;
      end;
    finally
      myDataSet.Free;
    end;
  end;

var
  myNodeData,myChildNodeData : PFileTreeNode;
  myNodeParent : PFileTreeNode;
  myhasChild : Boolean;
  myChildNode,myBrother : TTreeNode;
begin
  //删除分部

  if not Assigned(tvFileTree.Selected) or
     not Assigned(tvFileTree.Selected.data) then Exit;

  if not Assigned(tvFileTree.Selected.Parent) or
     not Assigned(tvFileTree.Selected.Parent.data) then
  begin
    MessageBox(Handle,'根目录不能删除','删除',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  myNodeData := tvFileTree.Selected.data;
  myNodeParent := tvFileTree.Selected.Parent.data;

  if not HasModuleAction(Ord(fsmDir),myNodeData.fID,atDelete) then
  begin
    MessageBox(Handle,'没有操作权限','权限',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  if MessageBox(Handle,pChar(format('删除 %s',[myNodeData^.fName])),'删除',
    MB_ICONQUESTION+MB_YESNO)=IDNO then Exit;

  ClientSystem.BeginTickCount;
  ClientSystem.fDBOpr.BeginTrans;
  try
    Screen.Cursor := crHourGlass;
    try

      //1.先删除内容
      if not DoDeleteDir(myNodeData^.fID) then
      begin
        ClientSystem.fDBOpr.RollbackTrans;
        Exit;
      end;

      //2.更新是否有下级内容
      myhasChild := HasNodeChild(myNodeParent^.fID);
      if myNodeParent^.fhasChild <> myhasChild then
      begin
        myNodeParent^.fhasChild := myhasChild;
        if myhasChild then
          ClientSystem.fDBOpr.ExeSQL(PChar(format(glSQL6,[myNodeParent^.fID])))
        else
          ClientSystem.fDBOpr.ExeSQL(PChar(format(glSQL7,[myNodeParent^.fID])));
      end;

      myChildNode := tvFileTree.Selected.getFirstChild;
      myBrother   := tvFileTree.Selected.getNextSibling;
      while (myChildNode<>nil) and (myChildNode <> myBrother) do
      begin
        if Assigned(myChildNode.data) then
        begin
          myChildNodeData := myChildNode.data;
          Dispose(myChildNodeData);
        end;
        myChildNode := myChildNode.GetNext;
      end;
      tvFileTree.Selected.Delete;
      Dispose(myNodeData);

      ClientSystem.fDBOpr.CommitTrans;
    finally
      Screen.Cursor := crDefault;
    end;
  except
    ClientSystem.fDBOpr.RollbackTrans;
  end;
  ClientSystem.EndTickCount;
end;


procedure TFileManageDlg.actFile_AddFileExecute(Sender: TObject);
var
  myfilename : string;
  myNodeData : PFileTreeNode;
  myfileid : integer;
  myfilenote : String;
const
  glSQL =  'insert into TB_FILE_ITEM (ZTREE_ID,ZSTYPE,ZID,ZVER,ZNAME,ZEDITER_ID,ZFILEPATH, '+
           'ZSTATUS,ZEXT,ZEDITDATETIME,ZSTRUCTVER,ZTYPE,ZNEWVER,ZNOTE,ZSIZE) ' +
           'values (%d,%d,%d,%d,''%s'',%d,''%s'',%d,''%s'',''%s'',%d,%d,1,''%s'',%d)';
  glSQL2 = 'select max(ZID)+1 as mymax from TB_FILE_ITEM ';
begin
  //
  //增加文件
  //
  // 这地方必须做回滚操作. 目前暂时没有。
  //
  if not Assigned(tvFileTree.Selected) or
     not Assigned(tvFileTree.Selected.Data) then Exit;

  myNodeData := tvFileTree.Selected.Data;
  if not HasModuleAction(Ord(fsmDir),myNodeData^.fID,atInsert) then
  begin
    MessageBox(Handle,'没有操作权限','权限',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  if not OpenDialog1.Execute then Exit;
  myfilename := OpenDialog1.FileName;

  cdsQuery.Data := ClientSystem.fDBOpr.ReadDataSet(PChar(glSQL2));
  myfileid := cdsQuery.fieldByName('mymax').AsInteger;

  if not ShowFileEditNote(myfilename,myfilenote) then
    Exit;

  ClientSystem.fDBOpr.BeginTrans;
  try
    ClientSystem.fDBOpr.ExeSQL(PChar(
      format(glSQL,[
      myNodeData^.fID,
      Ord(fsFile), //类型
      myfileid,
      1,  //文件版本号
      ExtractFileName(myfilename),
      ClientSystem.fEditer_id,
      myfilename,
      0,
      ExtractFileExt(myfilename),
      datetimetostr(ClientSystem.SysNow), //?这地方mssql是不是一样的
      0,
      1,
      myfilenote,
      ClientSystem.GetFileSize(myfilename)])));

    if not ClientSystem.UpFile(myfileid,1,myfilename) then
    begin
      MessageBox(Handle,'增加文件发现异常出错。','增加文件',MB_ICONERROR+MB_OK);
      ClientSystem.fDBOpr.RollbackTrans;
      Exit;
    end;

    ClientSystem.fDBOpr.CommitTrans;
    LoadFileItem(myNodeData^.fID);   //刷新
  except
    ClientSystem.fDBOpr.RollbackTrans;
  end;
end;

procedure TFileManageDlg.actFile_DownLoadFIleExecute(Sender: TObject);
var
  myfilename : String;
  myItemData : PFileItem;
begin
  //另存文件
  myItemData := lvFileItem.Selected.Data;
  if not Self.HasModuleAction(Ord(fsmfile),myItemData^.fID,atView) then
  begin
    MessageBox(Handle,'没有文件操作权限','权限',MB_ICONWARNING+MB_OK);
    Exit;
  end;
  SaveDialog.DefaultExt := myItemData^.fExt;
  SaveDialog.FileName := myItemData^.fName;
  if not SaveDialog.Execute then Exit;
  myfilename := SaveDialog.FileName;
  if not ClientSystem.DonwFileToFileName(myItemData^.fID,myItemData^.fVer,myfilename) then
     MessageBox(Handle,'另存文件出错','提示',MB_ICONERROR+MB_OK);
end;

procedure TFileManageDlg.actTree_AddDirExecute(Sender: TObject);
var
  myNode : TTreeNode;
  myNodeData : PFileTreeNode;
  myName : String;
const
  glSQL  = 'insert into TB_FILE_TREE (ZPID,ZNAME,ZHASCHILD) values(%d,''%s'',0)';
  glSQL2 = 'update TB_FILE_TREE set ZHASCHILD=1 where ZID=%d';
begin
  myNode := tvFileTree.Selected;
  if not Assigned(myNode) or
     not Assigned(myNode.data) then Exit;

  myNodeData := myNode.data;

  if not HasModuleAction(Ord(fsmDir),myNodeData^.fID,atInsert) then
  begin
    MessageBox(Handle,'没有操作权限','权限',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  myName := InputBox('增加分部','分部名称','');
  if myName = '' then Exit;
  ExecSQL(format(glSQL,[myNodeData^.fID,myName]));

  if not myNodeData.fhasChild and
     HasNodeChild(myNodeData^.fID) then
  begin
    ExecSQL(format(glSQL2,[myNodeData^.fid]));
    myNodeData^.fhasChild := True;
  end;

  //重新加载
  LoadFileTreeNode(myNode,myNodeData^.fid);
  myNode.Expand(False);

end;

procedure TFileManageDlg.actFile_DeleteFIleExecute(Sender: TObject);
var
  myItemData : PFileItem;
begin
  //删除文件
  ClientSystem.BeginTickCount;
  myItemData := lvFileItem.Selected.data;
  if MessageBox(Handle,PChar(format('删除-%s',[myItemData^.fName])),'删除',
    MB_ICONQUESTION+MB_YESNO)=IDNO then Exit;

  if ClientSystem.fdbOpr.DeleteFile(myitemdata^.fID)>=0 then
  begin
    lvFileItem.Selected.Delete;
    Dispose(myItemData);
  end;
  ClientSystem.EndTickCount;
end;

procedure TFileManageDlg.actFile_DeleteFIleUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(lvFileItem.Selected)
  and Assigned(lvFileItem.Selected.data);
end;

procedure TFileManageDlg.acFile_ShowNoteExecute(Sender: TObject);
var
  myItemData : PFileItem;
  myfileNote : String;
  myName : String;
const
  glSQL  = 'select ZNOTE from TB_FILE_ITEM where ZID=%d and ZVER=%d';
  glSQL2 = 'update TB_FILE_ITEM set ZNOTE=''%s'' where ZID=%d and ZVER=%d';
begin
  //文件说明
  myItemData := lvFileItem.Selected.data;

  cdsQuery.data := ClientSystem.fDBOpr.ReadDataSet(PChar(format(glSQL,[myItemData^.fID,
      myItemData^.fVer])));
  if cdsQuery.RecordCount > 0 then
  begin
    myName := '文件名= ' + myItemData^.fName + #13#10 +
              '版  本= ' + inttostr(myItemData^.fVer) + #13#10 +
              '文件号= ' + inttostr(myItemData^.fID);

    myfileNote := cdsQuery.FieldByName('ZNOTE').AsString;
    if not ShowFileEditNote(myName,myfileNote) then
      Exit;

    if not HasModuleAction(Ord(fsmFile),myItemData^.fID,atUpdate) then
    begin
      MessageBox(Handle,'没有文件操作权限','权限',MB_ICONWARNING+MB_OK);
      Exit;
    end;
    ClientSystem.fDBOpr.ExeSQL(PChar(format(glSQL2,[myfileNote,
      myItemData^.fID,myItemData^.fVer])));
  end;
end;

procedure TFileManageDlg.acFile_ShowNoteUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(lvFileItem.Selected)
  and Assigned(lvFileItem.Selected.data);
end;

procedure TFileManageDlg.actFile_UpdatefileUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(lvFileItem.Selected)
  and Assigned(lvFileItem.Selected.data);
end;

procedure TFileManageDlg.actFile_UpdatefileExecute(Sender: TObject);
var
  myItemData : PFileItem;
  myfileNote : String;
  myfilename : String;
  myver,mysize : integer;
const
  glSQL  = 'Update TB_FILE_ITEM set ZNEWVER=0 where ZNEWVER=1 and ZID=%d';
  glSQL1 = 'insert into TB_FILE_ITEM (ZTREE_ID,ZSTYPE,ZID,ZVER,ZNAME,ZEDITER_ID,ZFILEPATH, '+
          'ZSTATUS,ZEXT,ZEDITDATETIME,ZSTRUCTVER,ZTYPE,ZNEWVER,ZNOTE,ZSIZE)  ' +
          'values (%d,%d,%d,%d,''%s'',%d,''%s'',%d,''%s'',''%s'',%d,%d,1,''%s'',%d)';
  glSQL2 = 'select max(ZVER)+1 as myver from TB_FILE_ITEM where ZID=%d';
begin

  myItemData := lvFileItem.Selected.data;

  if not HasModuleAction(Ord(fsmDir),myItemData^.fTreeID,atUpdate) then
  begin
    MessageBox(Handle,'没有操作权限','权限',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  if not HasModuleAction(Ord(fsmFile),myItemData^.fID,atUpdate) then
  begin
    MessageBox(Handle,'没有文件操作权限','权限',MB_ICONWARNING+MB_OK);
    Exit;
  end;


  if not OpenDialog1.Execute then Exit;
  myfilename := OpenDialog1.FileName;

  if CompareText(ExtractFileName(myfilename),myItemData^.fName) <> 0 then
  begin
    MessageBox(Handle,'文件名不相同，不能更新。','更新',
      MB_ICONERROR+MB_OK);
    Exit;
  end;

  if not ShowFileEditNote(myfilename,myfilenote) then
    Exit;

  ClientSystem.fDBOpr.BeginTrans;
  try
    //1.去掉最新的标志
    ClientSystem.fDBOpr.ExeSQL(PChar(format(glSQL,[myItemData^.fID])));

    //2.增加新行
    myver := ClientSystem.fDBOpr.ReadInt(PChar(format(glSQL2,[myItemData^.fID])));
    mysize := ClientSystem.GetFileSize(myfilename);
    ClientSystem.fDBOpr.ExeSQL(PChar(
      format(glSQL1,[
      myItemData^.fTreeID,
      Ord(fsFile),
      myItemData^.fID,
      myver,  //文件版本号
      myItemData^.fName,
      ClientSystem.fEditer_id,
      myfilename,
      0,
      myItemData^.fExt,
      datetimetostr(ClientSystem.SysNow),
      0,
      1,
      myfilenote,
      mysize])));

    //3.增加文件内容
    if not ClientSystem.UpFile(myItemData^.fID,myver,myfilename) then
    begin
      ClientSystem.fDBOpr.RollbackTrans;
      Exit;
    end;
    ClientSystem.fDBOpr.CommitTrans;
    //刷新
    myItemData^.fSzie := mysize;
    myItemData^.fVer  := myver;
    LoadFileListItem(lvFileItem.Selected,myItemData);
  except
    ClientSystem.fDBOpr.RollbackTrans;
  end;
end;

procedure TFileManageDlg.actFile_HistoryFileExecute(Sender: TObject);
var
  myfilename : String;
  myItemData : PFileItem;
  myver : integer;
begin
  myItemData := lvFileItem.Selected.data;
  if ShowFileHistoryList(myItemData^.fID,myver) then
  begin
    if not Self.HasModuleAction(Ord(fsmFile),myItemData^.fID,atView) then
    begin
      MessageBox(Handle,'没有文件操作权限','权限',MB_ICONWARNING+MB_OK);
      Exit;
    end;
    SaveDialog.DefaultExt := myItemData^.fExt;
    SaveDialog.FileName := myItemdata^.fName;
    if not SaveDialog.Execute then Exit;
    myfilename := SaveDialog.FileName;
    if not ClientSystem.DonwFileToFileName(myItemData^.fID,myver,myfilename) then
      MessageBox(Handle,'另存文件出错','提示',MB_ICONERROR+MB_OK);
  end;
end;

procedure TFileManageDlg.actFile_HistoryFileUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(lvFileItem.Selected)
  and Assigned(lvFileItem.Selected.data);
end;

procedure TFileManageDlg.actFile_DownLoadFIleUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(lvFileItem.Selected)
  and Assigned(lvFileItem.Selected.data);
end;

procedure TFileManageDlg.actTree_ReNameExecute(Sender: TObject);
var
  myName,mynewName : String;
  myNodeData : PFileTreeNode;
const
  glSQL  = 'update TB_FILE_TREE set ZNAME=''%s'' where ZID=%d';
begin
  myNodeData := tvFileTree.Selected.data;
  if not HasModuleAction(Ord(fsmDir),myNodeData^.fID,atUpdate) then
  begin
    MessageBox(Handle,'没有操作权限','权限',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  myName := myNodeData^.fName;
  mynewName := inputBox('重命名','分部名称',myName);
  if CompareText(myName,mynewName) <> 0 then
  begin
    if ClientSystem.fDBOpr.ExeSQL(PChar(format(glSQL,[mynewName,myNodeData^.fid]))) then
      tvFileTree.Selected.Text := mynewName;
  end;
end;

procedure TFileManageDlg.actTree_ReNameUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(tvFileTree.Selected)
  and Assigned(tvFileTree.Selected.data);
end;

procedure TFileManageDlg.actFile_ReNameExecute(Sender: TObject);
var
  myName,mynewName : String;
  myItemData : PFileItem;
const
  glSQL  = 'update TB_FILE_ITEM set ZNAME=''%s'' where ZID=%d and ZVER=%d';
begin
  myItemData := lvFileItem.Selected.data;
  if not HasModuleAction(Ord(fsmFile),myItemData^.fID,atUpdate) then
  begin
    MessageBox(Handle,'没有文件操作权限','权限',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  //注意扩展名的处理
  myName := Copy(myItemData^.fName,1,Pos(myItemData^.fExt,myItemData^.fName)-1);
  mynewName := inputBox('重命名','文件名称',myName);
  if CompareText(myName,mynewName) <> 0 then
  begin
    //没有后缀时增加
    if Pos(uppercase(myItemData^.fext),uppercase(mynewName))=0 then
      mynewName := mynewName + myItemData^.fext;
    if ClientSystem.fDBOpr.ExeSQL(PChar(format(glSQL,[mynewName,myItemData^.fid,
      myItemData^.fVer]))) then
    begin
      myItemData^.fName := mynewName;
      LoadFileListItem(lvFileItem.Selected,myItemData);
    end;
  end;
end;


procedure TFileManageDlg.actFile_ReNameUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(lvFileItem.Selected)
  and Assigned(lvFileItem.Selected.data);
end;

procedure TFileManageDlg.lvFileItemCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
  function GetStrNum(AStr:String):integer;
  var
    i : integer;
    mystr : string;
    c : integer;
  begin
    Result := 0;
    c := 1;
    mystr := uppercase(AStr);
    for i:=1 to Length(mystr) do
    begin
      Result := Result + Ord(mystr[i])*c;
      c := c*10;
    end;
  end;
var
  myItmeData1,myItemData2 : PFileItem;
begin
  if (fColumnToSort >= 0) and Assigned(Item1.data)
     and Assigned(Item2.data) then
  begin
    myItmeData1 := item1.data;
    myItemData2 := item2.data;
    case TFileListColumn(fColumnToSort) of
      //名称
      flcName:
        Compare := GetStrNum(Item1.Caption ) -
             GetStrNum(Item2.Caption);
      //版本
      flcVer:
        Compare := strtointdef(Item1.SubItems[Ord(flcVer)-1],0) -
              strtointdef(Item2.SubItems[Ord(flcVer)-1],0);
      //编辑时间
      flcEditDateTime:
        Compare := Trunc(myItmeData1^.fEditDateTime*1000000 -
              myItemData2^.fEditDateTime*1000000);
      flcSize:
        Compare := myItmeData1^.fSzie - myItemData2^.fSzie;
      //编辑人
      flcEditor:
        Compare := GetStrNum(Item1.SubItems[Ord(flcEditor)-1])-
             GetStrNum(Item2.SubItems[Ord(flcEditor)-1]);
      //路径
      flcPath:
        Compare := strtointdef(Item1.SubItems[Ord(flcPath)-1] ,0) -
          strtointdef(Item2.SubItems[Ord(flcPath)-1],0);
    end;
    if not fbSort then  Compare := - Compare;
  end;
end;

procedure TFileManageDlg.lvFileItemColumnClick(Sender: TObject;
  Column: TListColumn);

  function DoSoftChar():String;
  begin
    if fbSort then
      Result := gcSoftChar
    else
      Result := gcDecSoftChar;
  end;

begin
  if Column.Index >=0 then
  begin
    if fColumnToSort <> Column.Index then
    begin
      if fColumnToSort >= 0 then
        lvFileItem.Column[fColumnToSort].Caption :=
          FileListColumnCaption[TFileListColumn(fColumnToSort)];

      fColumnToSort := Column.Index;
      lvFileItem.Columns[fColumnToSort].Caption :=
         FileListColumnCaption[TFileListColumn(fColumnToSort)] + DoSoftChar ;
    end
    else if fColumnToSort = Column.Index then
    begin
      fbSort := not fbSort;
      lvFileItem.Columns[fColumnToSort].Caption :=
        FileListColumnCaption[TFileListColumn(fColumnToSort)] + DoSoftChar;
    end;

    lvFileItem.AlphaSort;
  end;
end;

procedure TFileManageDlg.lvFileItemClick(Sender: TObject);
var
  myItemData : PFileItem;
begin

  if not Assigned(lvFileItem.Selected) or
     not Assigned(lvFileItem.Selected.data) then Exit;

  myItemData := lvFileItem.Selected.data;
  Self.ShowStatusBarText(3,format('文件号=%d',[myItemData^.fid]));
end;

procedure TFileManageDlg.actTree_OpenModlueUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(tvFileTree.Selected)
   and Assigned(tvFileTree.Selected.data);
end;

procedure TFileManageDlg.actTree_OpenModlueExecute(Sender: TObject);
var
  myNodeData : PFileTreeNode;
  myfind : Boolean;
begin
  myNodeData := tvFileTree.Selected.data;
  with TSetFileOpenModeDlg.Create(nil) do
  try
    myfind := False;
    cdsOpenMode.First;
    while not cdsOpenMode.Eof do
    begin
      if cdsOpenMode.FieldByName('ZID').AsInteger = myNodeData^.fID then
      begin
        cbInherit.Checked := cdsOpenMode.FieldByName('ZINHERIT').AsBoolean;
        edExt.Text := cdsOpenMode.FieldByName('ZEXT').AsString;
        edExe.Text := cdsOpenMode.FieldByName('ZEXE').AsString;
        myfind := True;
        break;
      end;
      cdsOpenMode.Next;
    end;

    if ShowModal = mrOK then
    begin
      if myfind then
      begin
        cdsOpenMode.Edit;
        cdsOpenMode.FieldByName('ZINHERIT').AsBoolean := cbInherit.Checked;
        cdsOpenMode.FieldByName('ZEXT').AsString := edExt.Text;
        cdsOpenMode.FieldByName('ZEXE').AsString := edExe.Text;
        cdsOpenMode.Post;
      end
      else begin
        cdsOpenMode.Append;
        cdsOpenMode.FieldByName('ZID').AsInteger := myNodeData^.fID;
        cdsOpenMode.FieldByName('ZINHERIT').AsBoolean := cbInherit.Checked;
        cdsOpenMode.FieldByName('ZEXT').AsString := edExt.Text;
        cdsOpenMode.FieldByName('ZEXE').AsString := edExe.Text;
        cdsOpenMode.Post;
      end;
    end;
    
  finally
    free;
  end;
end;


procedure TFileManageDlg.initLocalDataSet;
const
  gcOpenModefileNmae = 'OpenMode';
begin
  //分部的打开方式
  with cdsOpenMode.FieldDefs do
  begin
    add('ZID',ftInteger,0,False);
    add('ZEXT',ftString,100,False);
    add('ZEXE',ftString,255,False);
    add('ZINHERIT',ftBoolean,0,False);
  end;
  cdsOpenMode.CreateDataSet;

  if FileExists(ClientSystem.fAppDir+'\'+gcOpenModefileNmae) then
    cdsOpenMode.LoadFromFile(ClientSystem.fAppDir+'\'+gcOpenModefileNmae);

  cdsOpenMode.FileName := ClientSystem.fAppDir+'\'+gcOpenModefileNmae;
  cdsOpenMode.Open;
end;

procedure TFileManageDlg.GetOpenFileExe(ANodeData:PFileTreeNode; var AExt, AExe: String);
begin
  cdsOpenMode.First;
  while not cdsOpenMode.Eof do
  begin
    if cdsOpenMode.FieldByName('ZID').AsInteger = ANodedata^.fID then
    begin
      if cdsOpenMode.FieldByName('ZINHERIT').AsBoolean and
         Assigned(ANodedata^.fParent) then
      begin
        GetOpenFileExe(ANodedata^.fParent,AExt,AExe);
      end
      else begin
        AExt := cdsOpenMode.FieldByName('ZExt').AsString;
        AExe := cdsOpenMode.FieldByName('ZExe').AsString;
      end;
      break;
    end;
    cdsOpenMode.Next;
  end;
end;

procedure TFileManageDlg.actFile_OpenfileUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(tvFileTree.Selected)
  and Assigned(tvFileTree.Selected.data)
  and Assigned(lvFileItem.Selected)
  and Assigned(lvFileItem.Selected.data);
end;

procedure TFileManageDlg.actFile_OpenfileExecute(Sender: TObject);
var
  myNodeData : PFileTreeNode;
  myItemData : PFileItem;
  myfilename : String; //文件名
  i,c : integer;
  mystr : String;
  myExt,myExe : String;
  mysl : TStringList;
  r    : HINST;
  myreopen : Boolean; //是否重新打开
const
  glSQL  = 'update TB_FILE_ITEM set ZSTATUS=1,ZEDITER_ID=%d,ZFILEPATH=''%s'' ' +
           'where ZID=%d and ZVER=%d';
  glSQL1 = 'select ZSTATUS from TB_FILE_ITEM where  ZID=%d and ZVER=%d';
  glSQL2 = 'select ZEDITER_ID from TB_FILE_ITEM where  ZID=%d and ZVER=%d';
begin
  //
  //打开文件
  //
  // 1 .校验是不已编辑了
  // 2. 下载到本地
  // 3. 用程序打开文件
  // 4. 更新服务器的标志
  //

  myNodeData := tvFileTree.Selected.data;
  myItemData := lvFileItem.Selected.data;

  myreopen := False;

  if not HasModuleAction(Ord(fsmFile),myItemData^.fID,atUpdate) then
  begin
    MessageBox(Handle,'没有文件操作权限','权限',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  //1.是否已编辑了
  if ClientSystem.fDBOpr.ReadInt(PChar(format(glSQL1,[
    myItemData^.fID,myItemData^.fVer]))) = 1 then
  begin
    if ClientSystem.fDBOpr.ReadInt(PChar(format(glSQL2,[
      myItemData^.fID,myItemData^.fVer])))  = ClientSystem.fEditer_id then
      myreopen := True
    else begin
      MessageBox(Handle,'文件已被别人打开你不能打开。','打开文件',MB_ICONWARNING+MB_OK);
      Exit;
    end;
  end;

  //1.下载
  if myreopen then
  begin
    if FileExists(myItemData^.ffilepath) then
      myfilename := myItemData^.ffilepath
    else
      if MessageBox(Handle,'你上次编辑的内容文件已不存在，是否继续打开。','打开文件',
        MB_ICONWARNING+MB_YESNO)=IDNO then Exit;
  end;

  if not myreopen or not FileExists(myItemData^.ffilepath) then
  begin
    if not DirectoryExists(ClientSystem.fAppDir + '\' +gcfiledir) then
    begin
      if not CreateDir(ClientSystem.fAppDir + '\' +gcfiledir) then Exit;
    end;

    myfilename := format('%s\%s\%s',[ClientSystem.fAppDir,gcfiledir,myItemData^.fName]);
    c := 0;
    while FileExists(myfilename) do
    begin
      inc(c);
      if Pos('.',myItemData^.fName)> 0 then
        mystr := Copy(myItemData^.fName,1,Pos('.',myItemData^.fName)-1)
      else
        mystr := myItemData^.fName;

      myfilename := format('%s\%s\%s(%d)%s',[ClientSystem.fAppDir,gcfiledir,
        mystr,c,
        Copy(myItemData^.fName,Pos('.',myItemData^.fName),maxint)]);

      if not FileExists(myfilename) then break;
    end;

    if not ClientSystem.DonwFileToFileName(myItemData^.fID,myItemData^.fVer,myfilename) then
    begin
      MessageBox(Handle,'文件发生错误，引起无法打开文件。',
        '错误',MB_ICONERROR+MB_OK);
      Exit;
    end;
  end;

  //2.打开
  GetOpenFileExe(myNodeData,myExt,myExe);
  if (Trim(myExt) <> '') and (Trim(myExe)<>'') then
  begin
    mysl := TStringList.Create;
    ClientSystem.SplitStr(myExt,mysl);
    for i:= 0 to mysl.Count -1 do
    begin
      if CompareText(mysl[i],'*'+myItemData^.fExt) = 0 then
      begin
        ShellExecute(Handle,'open',
          PChar(myExe), PChar(myfilename), '', SW_SHOW);
        break;
      end;
      mysl.Free;
    end;
  end
  else begin
    r:=ShellExecute(Handle,'open',PChar(myfilename),
      nil,PChar(ExtractFileDir(myfilename)),SW_SHOW);

    //调用打开方式对话框
    if r =SE_ERR_NOASSOC then//如果没有关联的打开方式
      ShellExecute(Handle, 'open', 'Rundll32.exe',
        PChar('shell32.dll,OpenAs_RunDLL ' + myfilename), nil, SW_SHOWNORMAL);
  end;


  //3.更新标志
  if ClientSystem.fDBOpr.ExeSQL(PChar(format(glSQL,[
    ClientSystem.fEditer_id,myfilename,myItemData^.fID,
    myItemData^.fVer]))) then
  begin
    myItemData^.fEditer_id := ClientSystem.fEditer_id;
    myItemData^.fEditer    := ClientSystem.fEditer;
    myItemData^.fFilePath  := myfilename;
    myItemData^.fStatus    := 1; //1=编辑
    LoadFileListItem(lvFileItem.Selected,myItemData);
  end;

  //最小化
  SendMessage(Self.Handle,SW_MINIMIZE,0,0);
end;


procedure TFileManageDlg.actFile_UndoOpenUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(tvFileTree.Selected)
  and Assigned(tvFileTree.Selected.data)
  and Assigned(lvFileItem.Selected)
  and Assigned(lvFileItem.Selected.data);
end;

procedure TFileManageDlg.actFile_UndoOpenExecute(Sender: TObject);
var
  myItemData : PFileItem;
const
  glSQL = 'update TB_FILE_ITEM set ZEDITER_ID=-1,ZSTATUS=0 ' +
          'where ZID=%d and ZVER=%d';
  glSQL1 = 'select ZSTATUS,ZEDITER_ID from TB_FILE_ITEM where ZID=%d and ZVER=%d';
begin

  myItemData := lvFileItem.Selected.data;
  cdsQuery.Data := ClientSystem.fDBOpr.ReadDataSet(PChar(format(glSQL1,[
    myItemData^.fid,myItemData^.fver])));

  if cdsQuery.RecordCount > 0 then
  begin
    if cdsQuery.FieldByName('ZSTATUS').AsInteger = 0 then
    begin
      MessageBox(Handle,'没有打开文件，不能撤消打开。','撤消打开',
        MB_ICONWARNING+MB_OK);
      Exit;
    end;

    if cdsQuery.FieldByName('ZEDITER_ID').AsInteger <> ClientSystem.fEditer_id then
    begin
      MessageBox(Handle,'打开文件与撤消打开必须是同一个人。','撤消打开',
        MB_ICONWARNING+MB_OK);
      Exit;
    end;
  end
  else Exit;

  if MessageBox(Handle,'撤消打开?','询问',MB_ICONQUESTION+MB_YESNO)=IDNO then Exit;

  if ClientSystem.fDBOpr.ExeSQL(PChar(format(glSQL,[myItemData^.fid,
      myItemData^.fver]))) then
  begin
    myItemData^.fStatus := 0;
    myItemData^.fEditer_id := -1;
    LoadFileListItem(lvFileItem.Selected,myItemData);
    //删除本地文件
    Deletefile(myItemData^.ffilepath);
  end;

end;

procedure TFileManageDlg.actFile_SaveFileExecute(Sender: TObject);
var
  myItemData : PFileItem;
  myfilenote : String;
  myfilename : String;
const
  glSQL  = 'update TB_FILE_ITEM set ZEDITER_ID=-1,ZSTATUS=0 ' +
           'where ZID=%d and ZVER=%d';
  glSQL1 = 'select ZSTATUS,ZEDITER_ID from TB_FILE_ITEM where ZID=%d and ZVER=%d';
  glSQL2 = 'Update TB_FILE_ITEM set ZNEWVER=0 where ZNEWVER=1 and ZID=%d';
  glSQL3 = 'insert into TB_FILE_ITEM (ZTREE_ID,ZSTYPE,ZID,ZVER,ZNAME,ZEDITER_ID,ZFILEPATH, '+
           'ZSTATUS,ZEXT,ZEDITDATETIME,ZSTRUCTVER,ZTYPE,ZNEWVER,ZNOTE,ZSIZE)  ' +
           'values (%d,%d,%d,%d,''%s'',%d,''%s'',%d,''%s'',''%s'',%d,%d,1,''%s'',%d)';
  glSQL4 = 'select isnull(max(ZVER),0)+1 as myver from TB_FILE_ITEM where ZID=%d';
begin
  //保存文件
  myItemData := lvFileItem.Selected.data;
  cdsQuery.Data := ClientSystem.fDBOpr.ReadDataSet(PChar(format(glSQL1,[
    myItemData^.fid,myItemData^.fver])));

  if cdsQuery.RecordCount > 0 then
  begin
    if cdsQuery.FieldByName('ZSTATUS').AsInteger = 0 then
    begin
      MessageBox(Handle,'没有打开文件，不能保存。','保存文件',
        MB_ICONWARNING+MB_OK);
      Exit;
    end;

    if cdsQuery.FieldByName('ZEDITER_ID').AsInteger <> ClientSystem.fEditer_id then
    begin
      MessageBox(Handle,'打开文件与保存文件必须是同一个人。','保存文件',
        MB_ICONWARNING+MB_OK);
      Exit;
    end;
  end
  else Exit;

 
  myfilename := myItemData^.ffilepath;

  if not FileExists(myfilename) then
  begin
    MessageBox(Handle,PChar(format('打开并修改文件-%s不存在，无法保存。',[myfilename])),
       '保存文件',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  if not ShowFileEditNote(myfilename,myfilenote) then
    Exit;

  ClientSystem.fDBOpr.BeginTrans;
  try
    //1.去掉最新的标志
    ClientSystem.fDBOpr.ExeSQL(PChar(format(glSQL2,[myItemData^.fID])));

    //2.增加新行
    myItemData^.fVer := ClientSystem.fDBOpr.ReadInt(PChar(format(glSQL4,[myItemData^.fID])));
    ClientSystem.fDBOpr.ExeSQL(PChar(
      format(glSQL3,[
      myItemData^.fTreeID,
      Ord(fsFile),
      myItemData^.fID,
      myItemData^.fVer,  //文件版本号
      myItemData^.fName,
      ClientSystem.fEditer_id,
      myfilename,
      0,
      myItemData^.fExt,
      datetimetostr(ClientSystem.SysNow),
      0,
      1,
      myfilenote,
      ClientSystem.GetFileSize(myfilename)])));

    //3.增加文件内容
    if not ClientSystem.UpFile(myItemData^.fID,myItemData^.fVer,myfilename) then
    begin
      ClientSystem.fDBOpr.RollbackTrans;
      Exit;
    end;

    if ClientSystem.fDBOpr.ExeSQL(PChar(format(glSQL,[myItemData^.fid,
      myItemData^.fver]))) then
    begin
      myItemData^.fStatus := 0;
      myItemData^.fEditer_id := -1;
      myItemData^.fSzie   := ClientSystem.GetFileSize(myfilename); 
      LoadFileListItem(lvFileItem.Selected,myItemData);
    end;

    ClientSystem.fDBOpr.CommitTrans;
    //刷新
    LoadFileListItem(lvFileItem.Selected,myItemData);
    //删除本地文件
    Deletefile(myfilename);
  except
    ClientSystem.fDBOpr.RollbackTrans;
  end;

end;

procedure TFileManageDlg.actFile_SaveFileUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(tvFileTree.Selected)
  and Assigned(tvFileTree.Selected.data)
  and Assigned(lvFileItem.Selected)
  and Assigned(lvFileItem.Selected.data);
end;


procedure TFileManageDlg.lvFileItemCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
var
  myItemdata : PFileItem;
begin
  if Assigned(Item.data) then
  begin
    myitemdata := Item.data;
    if myitemdata^.fStatus = 1 then
      Sender.Canvas.Font.Color := clblue;
  end;
  if fColumnToSort = 0 then
    Sender.Canvas.Brush.Color := cl3DLight
  else
    Sender.Canvas.Brush.Color := clWindow;
end;

procedure TFileManageDlg.actFile_ViewfileUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(tvFileTree.Selected)
  and Assigned(tvFileTree.Selected.data)
  and Assigned(lvFileItem.Selected)
  and Assigned(lvFileItem.Selected.data);
end;

procedure TFileManageDlg.actFile_ViewfileExecute(Sender: TObject);
var
  myNodeData : PFileTreeNode;
  myItemData : PFileItem;
  myfilename : String;
  c,i : integer;
  mystr      : String;
  myExt,myExe: String;
  mysl       : TStringList;
  r    : HINST;
begin
  myNodeData := tvFileTree.Selected.data;
  myItemData := lvFileItem.Selected.data;

  if not HasModuleAction(Ord(fsmFile),myItemData^.fID,atView) then
  begin
    MessageBox(Handle,'没有文件操作权限','权限',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  //1.下载
  if not DirectoryExists(ClientSystem.fAppDir + '\' +gcfiledir) then
  begin
    if not CreateDir(ClientSystem.fAppDir + '\' +gcfiledir) then Exit;
  end;

  myfilename := format('%s\%s\%s',[ClientSystem.fAppDir,gcfiledir,myItemData^.fName]);
  c := 0;
  while FileExists(myfilename) do
  begin
    inc(c);
    if Pos('.',myItemData^.fName)> 0 then
      mystr := Copy(myItemData^.fName,1,Pos('.',myItemData^.fName)-1)
    else
      mystr := myItemData^.fName;

    myfilename := format('%s\%s\%s(%d)%s',[ClientSystem.fAppDir,gcfiledir,
      mystr,c,
      Copy(myItemData^.fName,Pos('.',myItemData^.fName),maxint)]);

    if not FileExists(myfilename) then break;
  end;

  if not ClientSystem.DonwFileToFileName(myItemData^.fID,myItemData^.fVer,myfilename) then
  begin
    MessageBox(Handle,'文件发生错误，引起无法打开文件。',
      '错误',MB_ICONERROR+MB_OK);
    Exit;
  end;

  SetFileAttributes(pchar(myfilename),FILE_ATTRIBUTE_READONLY); //设置只读

  //2.打开
  GetOpenFileExe(myNodeData,myExt,myExe);
  if (Trim(myExt) <> '') and (Trim(myExe)<>'') then
  begin
    mysl := TStringList.Create;
    ClientSystem.SplitStr(myExt,mysl);
    for i:= 0 to mysl.Count -1 do
    begin
      if CompareText(mysl[i],'*'+myItemData^.fExt) = 0 then
      begin
        ShellExecute(Handle,'open',
          PChar(myExe), PChar(myfilename), '', SW_SHOW);
        break;
      end;
      mysl.Free;
    end;
  end
  else begin
    r:=ShellExecute(Handle,'open',PChar(myfilename),
      nil,PChar(ExtractFileDir(myfilename)),SW_SHOW);

    //调用打开方式对话框
    if r =SE_ERR_NOASSOC then//如果没有关联的打开方式
      ShellExecute(Handle, 'open', 'Rundll32.exe',
        PChar('shell32.dll,OpenAs_RunDLL ' + myfilename), nil, SW_SHOWNORMAL);
  end;

  //Deletefile(myfilename);
  ClientSystem.fDeleteFiles.Add(myfilename);

end;

procedure TFileManageDlg.actFile_SendMailUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(tvFileTree.Selected)
  and Assigned(tvFileTree.Selected.data)
  and Assigned(lvFileItem.Selected)
  and Assigned(lvFileItem.Selected.data);
end;

procedure TFileManageDlg.actFile_SendMailExecute(Sender: TObject);
var
  c : integer;
  myMail : TStringList;
  myItemData : PFileItem;
  myfilename : String;
  mystr : String;
begin
  //
  //1.先下载内容到本地
  //
  myItemData := lvFileItem.Selected.data;
  if not HasModuleAction(Ord(fsmFile),myItemData^.fID,atView) then
  begin
    MessageBox(Handle,'没有文件操作权限','权限',MB_ICONWARNING+MB_OK);
    Exit;
  end;
  
  if not DirectoryExists(ClientSystem.fAppDir + '\' +gcfiledir) then
  begin
    if not CreateDir(ClientSystem.fAppDir + '\' +gcfiledir) then Exit;
  end;

  myfilename := format('%s\%s\%s',[ClientSystem.fAppDir,gcfiledir,myItemData^.fName]);
  c := 0;
  while FileExists(myfilename) do
  begin
    inc(c);
    if Pos('.',myItemData^.fName)> 0 then
      mystr := Copy(myItemData^.fName,1,Pos('.',myItemData^.fName)-1)
    else
      mystr := myItemData^.fName;

    myfilename := format('%s\%s\%s(%d)%s',[ClientSystem.fAppDir,gcfiledir,
      mystr,c,
      Copy(myItemData^.fName,Pos('.',myItemData^.fName),maxint)]);

    if not FileExists(myfilename) then break;
  end;

  if not ClientSystem.DonwFileToFileName(myItemData^.fID,myItemData^.fVer,myfilename) then
  begin
    MessageBox(Handle,'文件发生错误，引起无法打开文件。',
      '错误',MB_ICONERROR+MB_OK);
    Exit;
  end;

  //
  //2.发送
  //
  myMail := TStringList.Create;
  try
    myMail.Values['subject'] := Copy(myItemData^.fName,1,
      Pos(myItemData^.fExt,myItemData^.fName)-1);
    myMail.Values['attachment0'] := myfilename;
    if SendEmail(Application.Handle,myMail) <> 0 then
      MessageDlg('文件发送到邮件出错。', mtError, [mbOK], 0);
  finally
    myMail.Free;
  end;
  
  ClientSystem.fDeleteFiles.Add(myfilename);

end;

procedure TFileManageDlg.actFile_CopyAndPasteUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(tvFileTree.Selected)
  and Assigned(tvFileTree.Selected.data)
  and Assigned(lvFileItem.Selected)
  and Assigned(lvFileItem.Selected.data);
end;

procedure TFileManageDlg.actFile_CopyAndPasteExecute(Sender: TObject);
var
  myItemData : PFileItem;
  myfileid : integer;
  i : integer;
begin
  ClientSystem.BeginTickCount;
  myItemData := lvFileItem.Selected.data;
  myfileid := ClientSystem.fDBOpr.CopyFile(myItemData^.fID,myItemData^.fVer,myItemData^.fTreeID);
  if myfileid >=0 then
  begin
    LoadFileItem(myItemData^.fTreeID);
    //定位
    for i:=0 to lvFileItem.Items.Count -1 do
    begin
      myItemData := lvFileItem.Items[i].data;
      if Assigned(myItemData) and (myItemData^.fID = myfileid) then
      begin
        lvFileItem.Items[i].Selected := True;
        break;
      end;
    end;
  end
  else
    MessageDlg('复制并粘贴出错。', mtError, [mbOK], 0);
  ClientSystem.EndTickCount;
end;

procedure TFileManageDlg.ListView_SetItemImageIndex(Item: TListItem);
var
  myItemData : PFileItem;
  nIndex:Integer;
  myIcon:TIcon;
  extName:string;
  sinfo:SHFILEINFO;
begin
  if not Assigned(Item.data) then Exit;
  myItemData := Item.data;

  extName:= myItemData^.fExt;
  nIndex:=fIconList.IndexOf(extName);
  if nIndex>=0 then
  begin
    nIndex:=Integer(fIconList.Objects[nIndex]);
    Item.ImageIndex:=nIndex;
  end else
  begin
    FillChar(sinfo, SizeOf(sinfo),0);
    SHGetFileInfo(PChar(extName),FILE_ATTRIBUTE_NORMAL,sinfo,SizeOf(sInfo),
      SHGFI_USEFILEATTRIBUTES or SHGFI_ICON or SHGFI_SMALLICON);
    if sinfo.hIcon>0 then
    begin
      myIcon:=TIcon.Create;
      myIcon.Handle:=sinfo.hIcon;
      nIndex:=TListView(Item.ListView).SmallImages.AddIcon(myIcon);
      myIcon.Free;
      Item.ImageIndex:=nIndex;
      fIconList.AddObject(extName,TObject(nIndex));
    end;
  end;
end;

procedure TFileManageDlg.lvFileItemCustomDrawSubItem(Sender: TCustomListView;
  Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if SubItem = fColumnToSort then
    Sender.Canvas.Brush.Color := cl3DLight
  else
    Sender.Canvas.Brush.Color := clWhite; //取clWindow这个值有问题
end;

procedure TFileManageDlg.actFile_NewfileUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(tvFileTree.Selected)
  and Assigned(tvFileTree.Selected.data)
  and Assigned(tvFileTree.Selected.Parent)
  and Assigned(tvFileTree.TopItem)
  and Assigned(tvFileTree.TopItem.data);
end;

procedure TFileManageDlg.actFile_NewfileExecute(Sender: TObject);
var
  myRootData : PFileTreeNode;
  myNodeData : PFileTreeNode;
  myItemData : PFileItem;
  myfileid ,myver : integer;
  mynewfileid : integer;
  i : integer;
begin

  myNodeData := tvFileTree.Selected.data;
  myRootData := tvFileTree.TopItem.Data;
  if not HasModuleAction(Ord(fsmDir),myNodeData^.fID,atInsert) then
  begin
    MessageBox(Handle,'没有操作权限','权限',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  if ShowNewFileDlg(myRootData^.fID,myfileid,myver) then
  begin
    mynewfileid := ClientSystem.fDBOpr.CopyFile(myfileid,myver,myNodeData^.fID);
    if mynewfileid >=0 then
    begin
      LoadFileItem(myNodeData^.fID);
      if lvFileItem.CanFocus then lvFileItem.SetFocus;
      //定位
      for i:=0 to lvFileItem.Items.Count -1 do
      begin
        myItemData := lvFileItem.Items[i].data;
        if Assigned(myItemData) and (myItemData^.fID = mynewfileid) then
        begin
          lvFileItem.Items[i].Selected := True;
          break;
        end;
      end;
    end
    else
      MessageBox(Handle,'新建文件出现错误。','错误',MB_ICONERROR+MB_OK);
  end;
end;


class function TFileManageDlg.GetModuleID: integer;
begin
  Result := Ord(mtFile);
end;

end.


