unit ProductDownLoadClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WebClientfrm, ActnList, Menus, AppEvnts, OleCtrls, SHDocVw,
  ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TProductDownLoadClientDlg = class(TWebClientDlg)
    lbl1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
      procedure initBase; override;
  end;

var
  ProductDownLoadClientDlg: TProductDownLoadClientDlg;

implementation

uses ClinetSystemUnits;

{$R *.dfm}

{ TProductDownLoadClientDlg }

procedure TProductDownLoadClientDlg.initBase;
const
  glSQL = 'select ZVALUE from TB_SYSPARAMS where ZNAME=''ProductDownload''';
begin
  HomeURL := ClientSystem.fDbOpr.ReadVariant(glSQL);
  inherited;
end;

end.
