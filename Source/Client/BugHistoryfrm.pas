unit BugHistoryfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, StdCtrls, Buttons, dbcgrids, DBCtrls, DB,
  DBClient;

type
  TBugHistoryDlg = class(TBaseDialog)
    dbctrlgrd1: TDBCtrlGrid;
    btn1: TBitBtn;
    btn2: TBitBtn;
    cds1: TClientDataSet;
    ds1: TDataSource;
    dbmmoZCONTEXT: TDBMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;



  function ShowBugHistoryDlg(ABugID:Integer;var Atxt:string):Boolean;

implementation

uses ClinetSystemUnits;


{$R *.dfm}

  function ShowBugHistoryDlg(ABugID:Integer;var Atxt:string):Boolean;
  begin
    with TBugHistoryDlg.Create(nil) do
    try
      cds1.Data := ClientSystem.fDbOpr.ReadDataSet(
        PChar(format('select ZCONTEXT from TB_BUG_HISTORY where ZBUG_ID=%d',[ABugID])));
      Result := ShowModal = mrOk;
      if Result and not cds1.IsEmpty then
      begin
        Atxt := cds1.fieldByname('ZCONTEXT').AsString;
      end;
    finally
      Free;
    end;
  end;

end.
