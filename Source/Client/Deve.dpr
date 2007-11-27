program Deve;

uses
  Forms,
  Mainfrm in 'Mainfrm.pas' {MainDlg},
  ClinetSystemUnits in 'ClinetSystemUnits.pas',
  DmUints in 'DmUints.pas' {DM: TDataModule},
  Loginfrm in 'Loginfrm.pas' {LoginDlg};

{$R *.res}

begin
  Application.Initialize;
  if not ShowLoginDlg then Exit;
  Application.CreateForm(TMainDlg, MainDlg);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
