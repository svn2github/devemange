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
  Grids, DB,  DBGrids, Buttons,Registry, ImgList;

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
    procedure actSys_PropertiesExecute(Sender: TObject);
    procedure actSys_ClaseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSys_dbBackupExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure actSys_dbRestoreExecute(Sender: TObject);
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
  BFSSClassUnits
  ;




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

end.
