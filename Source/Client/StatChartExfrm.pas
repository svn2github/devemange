///////////////////////////////////////////////////////////////////////////////
//
//  作者:龙仕云  创建时间: 2009-10-01 中国建国60周年 
//  功能描述: 统计分析的图表
//
//  修改历史记录:              
//       编号  作者     修改日期   修改内容
//
//
///////////////////////////////////////////////////////////////////////////////
unit StatChartExfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, ExtCtrls, TeeProcs, TeEngine, Chart, DbChart,
  Series, TeeFunci, DB, DBClient, Grids, DBGrids, StdCtrls, Buttons;

type
  TStatChartDlg = class(TBaseDialog)
    pnlTool: TPanel;
    cds1: TClientDataSet;
    strngfldcds1ZUSERNAME: TStringField;
    intgrfldcds1ZAnswerBugCount: TIntegerField;
    intgrfldcds1ZSubmitBugCount: TIntegerField;
    intgrfldcds1ZReplyBugCount: TIntegerField;
    intgrfldcds1ZReActionBug: TIntegerField;
    intgrfldcds1ZBugFraction: TIntegerField;
    intgrfldcds1ZTaskCount: TIntegerField;
    intgrfldcds1ZTaskFraction: TIntegerField;
    intgrfldcds1ZWorkOverTime: TIntegerField;
    intgrfldcds1ZBuildTestCount: TIntegerField;
    intgrfldcds1ZAnswerTestCount: TIntegerField;
    intgrfldcds1ZSOCRE: TIntegerField;
    dbcht1: TDBChart;
    ds1: TDataSource;
    brsrsWorkOverTime: TBarSeries;
    fltfldcds1calcHour: TFloatField;
    brsrsSubmitBugCount: TBarSeries;
    brsrsAnswerBugCount: TBarSeries;
    brsrsBuildTestCount: TBarSeries;
    brsrsAnswerTestCount: TBarSeries;
    chkSubmitBugCount: TCheckBox;
    chkAnswerBugCount: TCheckBox;
    chkBuildTestCount: TCheckBox;
    chkAnswerTestCount: TCheckBox;
    chkWorkOverTime: TCheckBox;
    BitBtn1: TBitBtn;
    brsrsZTaskFraction: TBarSeries;
    chkTaskFraction: TCheckBox;
    bvl1: TBevel;
    chk3D: TCheckBox;
    edt1: TEdit;
    edt2: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    intgrfldcds1ZSvnSubimtCount: TIntegerField;
    brsrsZSvnSubimtCount: TBarSeries;
    chkZSvnSubimtCount: TCheckBox;
    intgrfldcds1ZSvnSubimt_M_Count: TIntegerField;
    intgrfldcds1ZSvnSubimt_D_Count: TIntegerField;
    intgrfldcds1ZSvnSubimt_A_Count: TIntegerField;
    btn1: TBitBtn;
    procedure cds1CalcFields(DataSet: TDataSet);
    procedure chkSubmitBugCountClick(Sender: TObject);
    procedure chkAnswerBugCountClick(Sender: TObject);
    procedure chkBuildTestCountClick(Sender: TObject);
    procedure chkAnswerTestCountClick(Sender: TObject);
    procedure chkWorkOverTimeClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure chkTaskFractionClick(Sender: TObject);
    procedure chk3DClick(Sender: TObject);
    procedure dbcht1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure chkZSvnSubimtCountClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;


implementation
uses
 TeePrevi;

{$R *.dfm}

{ TStatChartDlg }

procedure TStatChartDlg.cds1CalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('calcHour').AsFloat :=
    DataSet.FieldByName('ZWorkOverTime').AsInteger / 60;
end;

procedure TStatChartDlg.chkSubmitBugCountClick(Sender: TObject);
begin
  brsrsSubmitBugCount.Active := chkSubmitBugCount.Checked;
end;

procedure TStatChartDlg.chkAnswerBugCountClick(Sender: TObject);
begin
  brsrsAnswerBugCount.Active := chkAnswerBugCount.Checked;
end;

procedure TStatChartDlg.chkBuildTestCountClick(Sender: TObject);
begin
  brsrsBuildTestCount.Active := chkBuildTestCount.Checked;
end;

procedure TStatChartDlg.chkAnswerTestCountClick(Sender: TObject);
begin
  brsrsAnswerTestCount.Active := chkAnswerTestCount.Checked;

end;

procedure TStatChartDlg.chkWorkOverTimeClick(Sender: TObject);
begin
  brsrsWorkOverTime.Active := chkWorkOverTime.Checked;
end;

procedure TStatChartDlg.BitBtn1Click(Sender: TObject);
begin

  //删除得分为0
  cds1.First;
  while not cds1.Eof  do
  begin
    if cds1.FieldByName('ZWorkOverTime').AsInteger =0 then
      cds1.Delete
    else
      cds1.Next;
  end;

  dbcht1.RefreshData;

end;

procedure TStatChartDlg.chkTaskFractionClick(Sender: TObject);
begin
  brsrsZTaskFraction.Active := chkTaskFraction.Checked;
end;

procedure TStatChartDlg.chk3DClick(Sender: TObject);
begin
  dbcht1.View3D:=chk3D.Checked;
end;

procedure TStatChartDlg.dbcht1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  tmpTask:Longint;
  i : Integer;
begin
  edt1.Text := '';
  edt2.Text := '';
  for i:=0 to dbcht1.SeriesCount -1 do
  begin
    tmpTask:= dbcht1.Series[i].Clicked(x,y);
    if tmpTask<>-1 then
    begin
      edt1.Text := dbcht1.Series[i].XLabel[tmpTask];
      edt2.Text := FloatToStr(dbcht1.Series[i].YValues[tmpTask])+' '+dbcht1.Series[i].Title;
      Break;
    end;
  end;
end;

procedure TStatChartDlg.BitBtn2Click(Sender: TObject);
begin
  dbcht1.CopyToClipboardMetafile(True);
end;

procedure TStatChartDlg.BitBtn3Click(Sender: TObject);
begin
  ChartPreview(Self,dbcht1);
end;

procedure TStatChartDlg.chkZSvnSubimtCountClick(Sender: TObject);
begin
  brsrsZSvnSubimtCount.Active := chkZSvnSubimtCount.Checked;
end;

procedure TStatChartDlg.btn1Click(Sender: TObject);
begin
  //删除得分为0
  cds1.First;
  while not cds1.Eof  do
  begin
    if cds1.FieldByName('ZSvnSubimtCount').AsInteger =0 then
      cds1.Delete
    else
      cds1.Next;
  end;

  dbcht1.RefreshData;
end;

end.
