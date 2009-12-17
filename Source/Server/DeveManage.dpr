program DeveManage;

uses
  {$ifdef FASTXX}
  FastMM4,
  FastCode,
  FastMove,
  {$endif}
  SysUtils,
  Windows,
  WinSvc,
  ScktCnst,
  SvcMgr,
  Forms,
  S_Mainfrm in 'S_Mainfrm.pas' {MainDlg},
  BFSSClassUnits in 'BFSSClassUnits.pas',
  S_DataModuleUnits in 'S_DataModuleUnits.pas' {DM: TDataModule},
  BFSS_TLB in 'BFSS_TLB.pas',
  DeveRdmUnits in 'DeveRdmUnits.pas' {BFSSRDM: TRemoteDataModule};

{$R *.TLB}

{$R *.res}

begin
  Forms.Application.ShowMainForm := False;
  Forms.Application.Initialize;
  Forms.Application.CreateForm(TMainDlg, MainDlg);
  Forms.Application.CreateForm(TDM, DM);
  MainDlg.Initialize(); //这地方初期化
  Forms.Application.Run;
end.
