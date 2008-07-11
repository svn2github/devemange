unit StatManageClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseChildfrm, ExtCtrls, ComCtrls, StdCtrls, Buttons, DB,
  DBClient, Grids, DBGrids, ActnList;

type
  TStatManageClientDlg = class(TBaseChildDlg)
    pnlTool: TPanel;
    lbl1: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    lbl2: TLabel;
    btnStat: TBitBtn;
    cdsData: TClientDataSet;
    dsData: TDataSource;
    dbgrdData: TDBGrid;
    actlst1: TActionList;
    actStat: TAction;
    actExportExcel: TAction;
    btnExportExcel: TBitBtn;
    procedure actStatExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses ClinetSystemUnits;

{$R *.dfm}

procedure TStatManageClientDlg.actStatExecute(Sender: TObject);
var
  mySQL : string;
  i : integer;
const
  glSQL = 'exec pt_StatBugTaskCount ''%s'',''%s''';
begin
  //统计
  mySQL := format(glSQL,[
    formatdatetime('yyyy-mm-dd',dtp1.Date),
    formatdatetime('yyyy-mm-dd',dtp2.Date)]);
  cdsData.Data := ClientSystem.fDbOpr.ReadDataSet(pchar(mySQL));
  for i :=0 to cdsData.Fields.Count -1 do
  begin
    case i of
      0:cdsData.Fields[i].DisplayLabel := '姓名';
      1:cdsData.Fields[i].DisplayLabel := '解决问题';
      2:cdsData.Fields[i].DisplayLabel := '发现问题';
      3:cdsData.Fields[i].DisplayLabel := '回复问题';
      4:cdsData.Fields[i].DisplayLabel := '问题激活';
      5:cdsData.Fields[i].DisplayLabel := '问题得分';
      6:cdsData.Fields[i].DisplayLabel := '任务完成';
      7:cdsData.Fields[i].DisplayLabel := '任务得分';
      8:cdsData.Fields[i].DisplayLabel := '总分';
    end;
  end;
end;

end.
