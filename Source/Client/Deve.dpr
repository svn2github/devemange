program Deve;

uses
  Forms,
  Mainfrm in 'Mainfrm.pas' {MainDlg},
  ClinetSystemUnits in 'ClinetSystemUnits.pas',
  DmUints in 'DmUints.pas' {DM: TDataModule},
  Loginfrm in 'Loginfrm.pas' {LoginDlg},
  BaseChildfrm in 'BaseChildfrm.pas' {BaseChildDlg},
  BaseDialogfrm in 'BaseDialogfrm.pas' {BaseDialog},
  ExcelUnits in 'ExcelUnits.pas',
  DesignDocumentClientfrm in 'DesignDocumentClientfrm.pas' {DesignDocumentClientDlg},
  ProjectManageClientfrm in 'ProjectManageClientfrm.pas' {ProjectManageClientDlg},
  NewTaskfrm in 'NewTaskfrm.pas' {NewTaskDlg},
  SelectUsersfrm in 'SelectUsersfrm.pas' {SelectUsersDlg},
  TaskScorefrm in 'TaskScorefrm.pas' {TaskScoreDlg},
  WriteToDaySayfrm in 'WriteToDaySayfrm.pas' {WriteToDaySayDlg};

{$R *.res}

begin
  Application.Initialize;
  if not ShowLoginDlg then Exit;
  Application.Title := 'DeveManage';
  Application.CreateForm(TMainDlg, MainDlg);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TWriteToDaySayDlg, WriteToDaySayDlg);
  Application.Run;
end.
