///////////////////////////////////////////////////////////////////////////////
//
//  Budget File Service System
//  模块: 主窗口
//  创建日期:2007-10-27 作者: 龙仕云
//  版本=1.0.0
//
//
//
//
//
///////////////////////////////////////////////////////////////////////////////
unit S_Mainfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  ShellAPI, Menus, ActnList, ExtCtrls, ComCtrls, StdCtrls, DBCtrls,
  Grids, DB,  DBGrids, Buttons,Registry, ImgList, Sockets;

const
  WM_MIDASICON    = WM_USER + 1;
  UI_INITIALIZE   = WM_MIDASICON + 1;

type

  TMainDlg = class(TForm)
    PopupMenu: TPopupMenu;
    miClose: TMenuItem;
    miProperties: TMenuItem;
    N1: TMenuItem;
    miabout: TMenuItem;
    ActionList1: TActionList;
    actSys_Properties: TAction;
    actSys_Clase: TAction;
    actSys_About: TAction;
    plMain: TPanel;
    StatusBar: TStatusBar;
    actSys_dbBackup: TAction;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    ImageList: TImageList;
    actSys_dbRestore: TAction;
    btn1: TBitBtn;
    btn2: TBitBtn;
    lbl1: TLabel;
    tcpsrvr1: TTcpServer;
    edtHost: TEdit;
    edtPort: TEdit;
    btnRun: TButton;
    btnClose: TButton;
    procedure actSys_PropertiesExecute(Sender: TObject);
    procedure actSys_ClaseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSys_dbBackupExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure actSys_dbRestoreExecute(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure tcpsrvr1Accept(Sender: TObject;
      ClientSocket: TCustomIpClient);
    procedure btnCloseClick(Sender: TObject);
  private
    fClosing: Boolean;
    fIconData: TNotifyIconData;
    fClientCount: Integer;   //客户端总数
    ficon  : TIcon;
  protected
    procedure UIInitialize(var Message: TMessage); message UI_INITIALIZE;
    procedure WMMIDASIcon(var Message: TMessage); message WM_MIDASICON;
  public

    procedure AddIcon;
    procedure ModifyIcon;
    //初期化
    procedure Initialize();
    procedure initform;
    procedure freeform;
  end;


var
  MainDlg: TMainDlg;

implementation
uses
  S_DataModuleUnits,    {数据源}
  BFSSClassUnits,
  CnMD5;

const
  gc_FileServerPost = '2121';




{$R *.dfm}

//-------------------------
//获取文件版本号
//-------------------------

  function GetVersionNumber: string;
  var
    FFileName: string;
    Handle: THandle;
    Size, Len: Cardinal;
    RezBuffer, P: PChar;
    sTemp: string;
    TransTable: PLongint;
  begin
    Result := '';
    FFileName := ParamStr(0);
    Size := GetFileVersionInfoSize(PChar(FFileName), Handle);
    if Size = 0 then Exit;
    GetMem(RezBuffer, Size);
    try
      if not GetFileVersionInfo(PChar(FFileName),
        Handle, Size, RezBuffer) then Exit;
      if not VerQueryValue(RezBuffer, '\VarFileInfo\Translation',
        Pointer(TransTable), Len) then Exit;
      sTemp := Format('%s%.4x%.4x\%s%s', ['\StringFileInfo\',
        LoWord(TransTable^), HiWord(TransTable^), 'FileVersion', #0]);
      if VerQueryValue(RezBuffer, PChar(sTemp), Pointer(P), Len) then
        Result := string(P);
    finally
      FreeMem(RezBuffer);
    end;
  end;


{ TMainDlg }

procedure TMainDlg.AddIcon;
begin
  if True then
  begin
    with FIconData do
    begin
      cbSize := SizeOf(FIconData);
      Wnd := Self.Handle;
      uID := $DEDB;
      uFlags := NIF_MESSAGE or NIF_ICON or NIF_TIP;
      ImageList.GetIcon(0,ficon);
      //hIcon := Forms.Application.Icon.Handle;
      hIcon := ficon.Handle;
      uCallbackMessage := WM_MIDASICON;
      StrCopy(szTip, PChar(CurrBFSSSystem.fAppCaption));
    end;
    Shell_NotifyIcon(NIM_Add, @FIconData);
  end;
end;

procedure TMainDlg.Initialize();
begin
  AddIcon;
end;

procedure TMainDlg.UIInitialize(var Message: TMessage);
begin
  Initialize();
end;

procedure TMainDlg.WMMIDASIcon(var Message: TMessage);
var
  pt: TPoint;
begin
  case Message.LParam of
    WM_RBUTTONUP:
    begin
      if not Visible then
      begin
        SetForegroundWindow(Handle);
        GetCursorPos(pt);
        PopupMenu.Popup(pt.x, pt.y);
      end else
        SetForegroundWindow(Handle);
    end;
    WM_LBUTTONDBLCLK:
      if Visible then
        SetForegroundWindow(Handle) else
        actSys_Properties.Execute;
  end;
end;

procedure TMainDlg.initform;
begin
  Caption := format('%s 版本=%s',[CurrBFSSSystem.fAppCaption,
  GetVersionNumber]);
end;

procedure TMainDlg.freeform;
begin
  Shell_NotifyIcon(NIM_DELETE, @FIconData);
end;

procedure TMainDlg.ModifyIcon;
begin
  if True then
  begin
    with FIconData do
    begin
      cbSize := SizeOf(FIconData);
      Wnd := Self.Handle;
      uID := $DEDB;
      uFlags := NIF_MESSAGE or NIF_ICON or NIF_TIP;
      ImageList.GetIcon(1,ficon);
      //hIcon := Forms.Application.Icon.Handle;
      hIcon := ficon.Handle;
      uCallbackMessage := WM_MIDASICON;
      StrCopy(szTip, PChar(CurrBFSSSystem.fAppCaption));
    end;
    Shell_NotifyIcon(NIM_MODIFY, @FIconData);
  end;
end;

procedure TMainDlg.actSys_PropertiesExecute(Sender: TObject);
begin
  ShowModal;
end;

procedure TMainDlg.actSys_ClaseExecute(Sender: TObject);
begin
  if MessageBox(Handle,'确定退出？','提示',
    MB_ICONQUESTION+MB_YESNO)=IDNO then Exit;
  fClosing := True;
  Close;
end;

procedure TMainDlg.FormCreate(Sender: TObject);
begin
  fClosing := False;
  ficon:= TIcon.Create;
  btnRunClick(nil);  //启动
end;

procedure TMainDlg.FormShow(Sender: TObject);
begin
  initform;
end;

procedure TMainDlg.actSys_dbBackupExecute(Sender: TObject);
begin
  //
  SaveDialog.Filter := '数据备份文件(*.bak)|*.bak';
  SaveDialog.DefaultExt := 'bak';
  SaveDialog.FileName := formatdatetime('yyyy-mm-dd hhmm',now());
  if SaveDialog.Execute then
  begin
    DM.DoBackDatabase(SaveDialog.FileName);
  end;
end;

procedure TMainDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  try
    CanClose := False;
    if FClosing and (fClientCount > 0) then
    begin
      FClosing := False;
      if MessageDlg('有客户端连接在服务器上，是否要关闭。', mtConfirmation, [mbYes, mbNo], 0) <> idYes then
        Exit;
    end;
    CanClose := True;
  finally

  end;
end;

procedure TMainDlg.FormDestroy(Sender: TObject);
begin
  freeform;
  ficon.Free;
  if tcpsrvr1.Active then
    tcpsrvr1.Close;
end;

procedure TMainDlg.actSys_dbRestoreExecute(Sender: TObject);
begin
  OpenDialog.Filter := '数据备份文件(*.bak)|*.bak';
  OpenDialog.DefaultExt := 'bak';
  if OpenDialog.Execute then
  begin
    if DM.DoRestoreDatabase(OpenDialog.FileName) then
    begin
      MessageBox(Handle,'数据恢复成功。','提示',MB_ICONHAND+MB_OK);
    end;
  end;
end;

procedure TMainDlg.btnRunClick(Sender: TObject);
begin
  //
  if tcpsrvr1.Active  then
  begin
    if Application.MessageBox('已是启动了,是否重启','提示',MB_ICONQUESTION+MB_YESNO)=IDNO then
      Exit;
  end;

  edtHost.Text := CurrBFSSSystem.fAttachHost;
  edtPort.Text := CurrBFSSSystem.fAttachPort;
  if tcpsrvr1.Active then
    tcpsrvr1.Close;
  tcpsrvr1.LocalHost := edtHost.Text;
  tcpsrvr1.LocalPort := edtPort.Text;
  tcpsrvr1.Open;
end;

procedure TMainDlg.tcpsrvr1Accept(Sender: TObject;
  ClientSocket: TCustomIpClient);
var
  myCommand : string;
  myFileName : string;
  mySize : Integer;
  myfm : TFileStream;
  myLocalFileName : string;
  myguid : string;
  mymd5 : string;
  myContentid : Integer;
  myStyle : Integer;

  pbuf  : Pointer;
  mycursize,iacRec : Integer;
  myfileid : Integer;
  myfileguid : string;

begin
  myCommand := ClientSocket.Receiveln();
  //上传
  if myCommand = 'UPFILE' then
  begin
    myStyle     := StrToIntDef(ClientSocket.Receiveln(),1);
    myContentid := StrToIntDef(ClientSocket.Receiveln(),-1);
    myFileName  := ClientSocket.Receiveln();
    mySize := StrToIntDef(ClientSocket.Receiveln(),0);
    //要写入库了
    myguid := NewGuid;
    myLocalFileName := CurrBFSSSystem.fAttachDir + '/' + myguid;
    myfm := TFileStream.Create(myLocalFileName,fmCreate);

    GetMem(pbuf,512);
    mycursize := 0;
    try
      while mycursize < mysize  do
      begin
        if mycursize + 512 < mysize then
          iacRec := ClientSocket.ReceiveBuf(pbuf^,512)
        else
          iacRec := ClientSocket.ReceiveBuf(pbuf^,mysize-mycursize);
        if iacRec = -1 then
          Break;
        myfm.Write(pbuf^,iacRec);
        Inc(mycursize,iacRec);
      end;
    finally
      FreeMem(pbuf);//释放内存
      myfm.Free; //释放流
    end;

    //md5检验
    mymd5 := ClientSocket.Receiveln();
    if CompareText(MD5Print(MD5File(myLocalFileName)),mymd5) = 0 then
    begin
      //将文件写入库内
      if DM.AddFile(
        myStyle,
        myContentid,myLocalFileName,myguid,myFileName,mySize) then
      begin
        ClientSocket.Sendln('0');
      end
      else begin
        ClientSocket.Sendln('2');
        DeleteFile(myLocalFileName);
      end;
    end
    else begin
      ClientSocket.Sendln('1');
      DeleteFile(myLocalFileName);
    end;
  end
  //下载
  else if myCommand = 'DOWNFLE' then
  begin
    myfileid := StrToIntDef(ClientSocket.Receiveln(),-1);
    if DM.GetDownFile(myfileid,myfileguid) then
    begin
      myLocalFileName := CurrBFSSSystem.fAttachDir + '/' + myfileguid;
      if not FileExists(myLocalFileName) then
      begin
        ClientSocket.Sendln('4');
        Exit;
      end;

      ClientSocket.Sendln('0');
      mymd5 := MD5Print(MD5File(myLocalFileName));
      myfm := TFileStream.Create(myLocalFileName,fmOpenRead);
      try
        ClientSocket.Sendln(IntToStr(myfm.Size));
        ClientSocket.SendStream(myfm);
      finally
        myfm.Free;
      end;
      ClientSocket.Sendln(mymd5);

    end
    else
      ClientSocket.Sendln('3');
  end;

end;

procedure TMainDlg.btnCloseClick(Sender: TObject);
begin
  if tcpsrvr1.Active then
    tcpsrvr1.Close;
end;

end.
