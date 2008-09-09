unit WebClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseChildfrm, ExtCtrls, OleCtrls, SHDocVw, StdCtrls, Buttons,
  ComCtrls, AppEvnts,ActiveX, ActnList, Menus;

type
  TWebClientDlg = class(TBaseChildDlg)
    pnlWebTool: TPanel;
    wbwiki: TWebBrowser;
    btnHome: TBitBtn;
    btnBack: TBitBtn;
    btnForward: TBitBtn;
    Animate1: TAnimate;
    btnStop: TBitBtn;
    pmWbCommand: TPopupMenu;
    actlstwb: TActionList;
    actwb_Copy: TAction;
    actwb_Cut: TAction;
    actwb_Paste: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    btnRefresh: TBitBtn;
    procedure btnHomeClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnForwardClick(Sender: TObject);
    procedure wbwikiCommandStateChange(Sender: TObject; Command: Integer;
      Enable: WordBool);
    procedure wbwikiDownloadBegin(Sender: TObject);
    procedure wbwikiDocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure btnStopClick(Sender: TObject);
    procedure aplctnvnts1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure actwb_CopyExecute(Sender: TObject);
    procedure actwb_CutExecute(Sender: TObject);
    procedure actwb_PasteExecute(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure wbwikiDownloadComplete(Sender: TObject);
  private
    { Private declarations }
    fOleInPlaceActiveObject:   IOleInPlaceActiveObject;
    fHomeURL : string;
  public
    { Public declarations }
    procedure initBase; override;

    property HomeURL : string read fHomeURL write fHomeURL;
    property OleInPlaceActiveObject:   IOleInPlaceActiveObject read fOleInPlaceActiveObject write fOleInPlaceActiveObject;
  end;


implementation

uses ClinetSystemUnits;

{$R *.dfm}

procedure TWebClientDlg.btnHomeClick(Sender: TObject);
var
  myurl : string;
const
  glSQL = 'select ZVALUE from TB_SYSPARAMS where ZNAME=''wiki''';
begin
  myurl := ClientSystem.fDbOpr.ReadVariant(glSQL);
  
  wbwiki.Navigate(fHomeURL);
end;

procedure TWebClientDlg.btnBackClick(Sender: TObject);
begin
  wbwiki.GoBack;
end;

procedure TWebClientDlg.btnForwardClick(Sender: TObject);
begin
  wbwiki.GoForward;
end;

procedure TWebClientDlg.wbwikiCommandStateChange(Sender: TObject;
  Command: Integer; Enable: WordBool);
begin
  case   Command   of
    CSC_NAVIGATEBACK:   btnBack.Enabled   :=   Enable;
    CSC_NAVIGATEFORWARD:   btnForward.Enabled   :=   Enable;
  end;
end;

procedure TWebClientDlg.wbwikiDownloadBegin(Sender: TObject);
begin
  Animate1.Active := True;
  btnStop.Enabled := True;
  btnRefresh.Enabled := False;
end;

procedure TWebClientDlg.wbwikiDocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  Animate1.Active    := False;
  btnStop.Enabled    := False;
  btnRefresh.Enabled := True;
end;

procedure TWebClientDlg.btnStopClick(Sender: TObject);
begin
  wbwiki.Stop;
  Animate1.Active := False;
end;

procedure TWebClientDlg.aplctnvnts1Message(var Msg: tagMSG;
  var Handled: Boolean);
var
  iOIPAO  :   IOleInPlaceActiveObject;
  Dispatch:   IDispatch;
  mouse   :   TPoint;
const
  DialogKeys : set of Byte =
    [VK_LEFT,VK_RIGHT,VK_BACK,$30..$39,   $41..$5A];
begin
  //1.去掉右键
  if (Msg.Message = WM_RBUTTONDOWN) or
     (Msg.Message = WM_RBUTTONDBLCLK) then
  begin
    if IsChild(wbwiki.Handle, Msg.hwnd) then
    begin
      getcursorpos(Mouse);
      pmWbCommand.popup(Mouse.x,Mouse.y);
      Handled := True;
      Exit;
    end;
  end;

  //2编辑回车换行功能
  Handled := IsDialogMessage(wbwiki.Handle,Msg);
  if (Handled)and (not wbwiki.Busy)then
  begin
    if  FOleInPlaceActiveObject = nil then
    begin
      Dispatch := wbwiki.Application;
      if Dispatch<>nil then
      begin
        Dispatch.QueryInterface(IOleInPlaceActiveObject,iOIPAO);
        if iOIPAO <> nil then
          FOleInPlaceActiveObject   :=   iOIPAO;
      end;
    end;

    if FOleInPlaceActiveObject <> nil then
    begin
      if ((Msg.message = WM_KEYDOWN) or (Msg.message = WM_KEYUP))and
          (Msg.wParam in DialogKeys)  then
          //   nothing   -   do   not   pass   on   the   DialogKeys
        else
          FOleInPlaceActiveObject.TranslateAccelerator(Msg);
    end;
  end;
end;

procedure TWebClientDlg.actwb_CopyExecute(Sender: TObject);
begin
  wbwiki.ExecWB(OLECMDID_COPY,0);
end;

procedure TWebClientDlg.actwb_CutExecute(Sender: TObject);
begin
  wbwiki.ExecWB(OLECMDID_CUT,0);
end;

procedure TWebClientDlg.actwb_PasteExecute(Sender: TObject);
begin
  wbwiki.ExecWB(OLECMDID_PASTE,0);
end;

procedure TWebClientDlg.btnRefreshClick(Sender: TObject);
begin
  if not wbwiki.Busy then wbwiki.Refresh;
end;

procedure TWebClientDlg.wbwikiDownloadComplete(Sender: TObject);
begin
  Animate1.Active    := False;
  btnStop.Enabled    := False;
  btnRefresh.Enabled := True;
end;

procedure TWebClientDlg.initBase;
begin
  //
  Animate1.ResName := 'MOV';
end;

initialization
  OleInitialize(nil);
finalization
  OleUninitialize;

end.
