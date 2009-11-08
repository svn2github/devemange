unit ProductDownLoadClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WebClientfrm, ActnList, Menus, AppEvnts, OleCtrls, SHDocVw,
  ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TProductDownLoadClientDlg = class(TWebClientDlg)
    lbl1: TLabel;
    procedure btnHomeClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  ProductDownLoadClientDlg: TProductDownLoadClientDlg;

implementation

uses  DmUints,DB;

{$R *.dfm}

{ TProductDownLoadClientDlg }


procedure TProductDownLoadClientDlg.btnHomeClick(Sender: TObject);
begin
  if DM.cdsSysParams.Locate('ZNAME','ProductDownload',[loPartialKey]) then
  begin
    HomeURL := DM.cdsSysParams.FieldByName('ZVALUE').AsString;
    wbwiki.Navigate(HomeURL);
  end;
end;

end.
