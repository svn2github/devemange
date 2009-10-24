///////////////////////////////////////////////////////////////////////////////
//
//  作者:龙仕云  创建时间: 2009-10-23
//  功能描述: 工作日程
//
//  修改历史记录:
//       编号  作者     修改日期   修改内容
//
//
///////////////////////////////////////////////////////////////////////////////
unit DeveCalendarfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, OleCtrls, SHDocVw, ComCtrls, ExtCtrls, StdCtrls,
  Buttons;

type
  TDeveCalendarDlg = class(TBaseDialog)
    tmr1: TTimer;
    wb1: TWebBrowser;
    ani1: TAnimate;
    procedure FormShow(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fhasopen : Boolean;
  public
    { Public declarations }
  end;

  TCalendarThread = class(TThread)
  private
    fResultStr : string;
    fwb: TWebBrowser;
    fani : TAnimate;

    procedure BeginAnimate();
    procedure EndAnimate();
  public
    constructor Create(Awb:TWebBrowser;Aani: TAnimate);
  protected
    procedure Execute;override;
  end;


var
  DeveCalendarDlg: TDeveCalendarDlg;

implementation
uses
  ClinetSystemUnits;


{$R *.dfm}

procedure TDeveCalendarDlg.FormShow(Sender: TObject);
begin
  Application.ProcessMessages;
  ani1.ResName := 'MOV';
  if not fhasopen then
  begin
    tmr1.Enabled := True;
    fhasopen := True;
  end;
end;


{ TCalendarThread }

procedure TCalendarThread.BeginAnimate;
begin
  fani.Active := True;
  fani.Visible := True;
end;

constructor TCalendarThread.Create(Awb: TWebBrowser; Aani: TAnimate);
begin
  inherited Create(false);
  fwb := Awb;
  fani := Aani;
  Self.Priority := tpNormal;
  Self.FreeOnTerminate := True;
end;

procedure TCalendarThread.EndAnimate;
begin
  fani.Active  := False;
  fani.Visible := False;
end;

procedure TCalendarThread.Execute;
var
  mysl : TStringList;
  myfilename : string;
const
  glSQL = 'select ZVALUE from TB_SYSPARAMS where ZNAME=''Calendar''';
begin
  if Terminated then Exit;
  mysl := TStringList.Create;
  try
    fResultStr := '';
    Synchronize(BeginAnimate);
    //读取内容
    try
      fResultStr := ClientSystem.fDbOpr.ReadVariant(glSQL);
      mysl.Text := fResultStr;
      myfilename := ClientSystem.fAppDir + '/c.html';
      mysl.SaveToFile(myfilename);
      fwb.Navigate(myfilename);
    finally
    end;
  finally
    Synchronize(EndAnimate);
  end;
end;

procedure TDeveCalendarDlg.tmr1Timer(Sender: TObject);
var
  MyThread : TCalendarThread;
begin
  tmr1.Enabled := False;
  MyThread := TCalendarThread.Create(wb1,ani1);
  MyThread.Resume;

end;

procedure TDeveCalendarDlg.FormCreate(Sender: TObject);
begin
  fhasopen := False;
end;

end.
