unit Mainfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ShellAPI, ImgList, Menus;

const
  WM_MIDASICON    = WM_USER + 1;
  UI_INITIALIZE   = WM_MIDASICON + 1;

type
  TMain = class(TForm)
    ImageList: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    fTaskMessage: DWord;
    ficon  : TIcon;
    fIconData: TNotifyIconData;
  protected
    procedure UIInitialize(var Message: TMessage); message UI_INITIALIZE;
    procedure WMMIDASIcon(var Message: TMessage); message WM_MIDASICON;
    procedure WndProc(var Message: TMessage); override;
  public
    { Public declarations }
    procedure AddIcon;
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

{ TMain }



procedure TMain.FormCreate(Sender: TObject);
begin
  ficon:= TIcon.Create;
end;

procedure TMain.FormDestroy(Sender: TObject);
begin
  Shell_NotifyIcon(NIM_DELETE, @FIconData);
  ficon.Free;
end;


procedure TMain.WMMIDASIcon(var Message: TMessage);
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
      if Visible then SetForegroundWindow(Handle)
  end;
end;


procedure TMain.WndProc(var Message: TMessage);
begin
  if Message.Msg = FTaskMessage then
  begin
    AddIcon;
    Refresh;
  end;
  inherited WndProc(Message);
end;

procedure TMain.AddIcon;
begin
  with FIconData do
  begin
    cbSize := SizeOf(FIconData);
    Wnd := Self.Handle;
    uID := $DEDB;
    uFlags := NIF_MESSAGE or NIF_ICON or NIF_TIP;
    ImageList.GetIcon(0,ficon);
    hIcon := ficon.Handle;
    uCallbackMessage := WM_MIDASICON;
    StrCopy(szTip, PChar('BFSS'));
  end;
  Shell_NotifyIcon(NIM_Add, @FIconData);
end;

procedure TMain.FormShow(Sender: TObject);
begin
  fTaskMessage := RegisterWindowMessage('TaskbarCreated');
  BorderIcons := BorderIcons + [biMinimize];
  //BorderStyle := bsSingle;
  AddIcon;
end;


procedure TMain.UIInitialize(var Message: TMessage);
begin
  Exit;
  fTaskMessage := RegisterWindowMessage('TaskbarCreated');
  BorderIcons := BorderIcons + [biMinimize];
  BorderStyle := bsSingle;
  AddIcon;
  //Initialize(Message.WParam <> 0);
end;


end.
