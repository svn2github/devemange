unit SvnManageClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WebClientfrm, ActnList, Menus, OleCtrls, SHDocVw, ComCtrls,
  StdCtrls, Buttons, ExtCtrls;

type
  TSVNManagerDlg = class(TWebClientDlg)
    procedure btnHomeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses DmUints,DB;

{$R *.dfm}

procedure TSVNManagerDlg.btnHomeClick(Sender: TObject);
begin
  if DM.cdsSysParams.Locate('ZNAME','USVN',[loPartialKey]) then
  begin
    HomeURL := DM.cdsSysParams.FieldByName('ZVALUE').AsString;
    wbwiki.Navigate(HomeURL);
  end;
end;

end.
