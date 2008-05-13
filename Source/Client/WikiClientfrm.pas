unit WikiClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseChildfrm, ExtCtrls, OleCtrls, SHDocVw, StdCtrls, Buttons,
  ComCtrls, AppEvnts;

type
  TWikiClientDlg = class(TBaseChildDlg)
    pnlWebTool: TPanel;
    wbwiki: TWebBrowser;
    btnHome: TBitBtn;
    btnBack: TBitBtn;
    btnForward: TBitBtn;
    Animate1: TAnimate;
    btnStop: TBitBtn;
    aplctnvnts1: TApplicationEvents;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses ClinetSystemUnits;

{$R *.dfm}

procedure TWikiClientDlg.btnHomeClick(Sender: TObject);
var
  myurl : string;
const
  glSQL = 'select ZVALUE from TB_SYSPARAMS where ZNAME=''wiki''';
begin
  myurl := ClientSystem.fDbOpr.ReadVariant(glSQL);
  wbwiki.Navigate(myurl);
end;

procedure TWikiClientDlg.btnBackClick(Sender: TObject);
begin
  wbwiki.GoBack;
end;

procedure TWikiClientDlg.btnForwardClick(Sender: TObject);
begin
  wbwiki.GoForward;
end;

procedure TWikiClientDlg.wbwikiCommandStateChange(Sender: TObject;
  Command: Integer; Enable: WordBool);
begin
  case   Command   of
    CSC_NAVIGATEBACK:   btnBack.Enabled   :=   Enable;
    CSC_NAVIGATEFORWARD:   btnForward.Enabled   :=   Enable;
  end;
end;

procedure TWikiClientDlg.wbwikiDownloadBegin(Sender: TObject);
begin
  Animate1.Active := True;
  btnStop.Enabled := True;
end;

procedure TWikiClientDlg.wbwikiDocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  Animate1.Active := False;
  btnStop.Enabled := False;
end;

procedure TWikiClientDlg.btnStopClick(Sender: TObject);
begin
  wbwiki.Stop;
  Animate1.Active := False;
end;

procedure TWikiClientDlg.aplctnvnts1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  //È¥µôwebµÄÓÒ¼ü²Ëµ¥
  if (Msg.Message = WM_RBUTTONDOWN) or
    (Msg.Message = WM_RBUTTONDBLCLK) then
  begin
    if IsChild(wbwiki.Handle, Msg.hwnd) then
      Handled := True;
  end;
end;

end.
