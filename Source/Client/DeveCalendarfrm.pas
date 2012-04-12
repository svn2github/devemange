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
  Buttons, Grids, DBGrids, DB, DBClient, ActnList, Menus;

type
  TDeveCalendarDlg = class(TBaseDialog)
    tmr1: TTimer;
    pnl1: TPanel;
    dbgrd1: TDBGrid;
    cds1: TClientDataSet;
    ds1: TDataSource;
    pm1: TPopupMenu;
    actlst1: TActionList;
    act_read: TAction;
    mniread: TMenuItem;
    ani1: TAnimate;
    procedure FormShow(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure act_readExecute(Sender: TObject);
    procedure act_readUpdate(Sender: TObject);
    procedure dbgrd1DblClick(Sender: TObject);
  private
    { Private declarations }
    fhasopen : Boolean;


  public
    { Public declarations }
    procedure init;
  end;

  TCalendarThread = class(TThread)
  private
    fResultStr : string;
    fani : TAnimate;
    fhtmlfilename : string;
    fDataSet : TClientDataSet;
    fTimer : TTimer;
    fReadDataSet : TClientDataSet;

    procedure BeginAnimate();
    procedure EndAnimate();
    procedure ReadData(); //加载数据
  public
    constructor Create(Aani: TAnimate;ADataSet:TClientDataSet;
      ATimer:TTimer);
    destructor Destroy; override;
  protected
    procedure Execute;override;
  end;


var
  DeveCalendarDlg: TDeveCalendarDlg;

implementation
uses
  ClientTypeUnits,
  DmUints,ClinetSystemUnits;

var
  freadDataTime : TDateTime;
  fhasFirstRead : Boolean;


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

constructor TCalendarThread.Create(Aani: TAnimate;
  ADataSet:TClientDataSet;ATimer:TTimer);
begin
  inherited Create(false);
  fani := Aani;
  Self.Priority := tpNormal;
  Self.FreeOnTerminate := True;
  fDataSet := ADataSet;
  fTimer := ATimer;
  fReadDataSet := TClientDataSet.Create(nil);
end;

destructor TCalendarThread.Destroy;
begin
  fReadDataSet.Free;
  inherited;
end;

procedure TCalendarThread.EndAnimate;
begin
  fani.Active  := False;
  fani.Visible := False;
end;

procedure TCalendarThread.Execute;
var
  mysl : TStringList;
  mysql : string;
  myfield : TFieldDef;
  i : Integer;
const
  glSQLTXT = ' SELECT ZUSER_ID, ZDATETIME, ZCODE, ZCONTENT, ZTYPE' +
             ' FROM TB_MSG ' +
             ' WHERE (ZSEND_ID LIKE ''%%%d|%%'') and ZDATETIME > ''%s''' +
             ' ORDER BY ZDATETIME DESC';

 glSQLTXT2 = ' SELECT top 20 ZUSER_ID, ZDATETIME, ZCODE, ZCONTENT, ZTYPE' +
             ' FROM TB_MSG ' +
             ' WHERE (ZSEND_ID LIKE ''%%%d|%%'') ' +
             ' ORDER BY ZDATETIME DESC';

begin
  if Terminated then Exit;
  mysl := TStringList.Create;
  fDataSet.EnableConstraints;
  try
    fResultStr := '';
    Synchronize(BeginAnimate);
    //读取内容

    if fhasFirstRead then
    begin
      mysql := Format(glSQLTXT2,
        [ClientSystem.fEditer_id ]);
      fhasFirstRead := False;
    end
    else begin
      mysql := Format(glSQLTXT,
        [ClientSystem.fEditer_id,
         DateTimeToStr(freadDataTime)]);
    end;
    fReadDataSet.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mysql));

    Synchronize(ReadData);

    freadDataTime := ClientSystem.fDbOpr.GetSysDateTime;
    fTimer.Enabled := True;

    {
    if DM.cdsSysParams.Locate('ZNAME','Calendar',[loPartialKey]) then
    begin
      fResultStr := DM.cdsSysParams.FieldByName('ZVALUE').AsString;
      mysl.Text := fResultStr;
      fhtmlfilename := ClientSystem.fAppDir + '\c.html';
      mysl.SaveToFile(fhtmlfilename);
      Synchronize(LoadHtml);
    end;
    }

  finally
    Synchronize(EndAnimate);
    fDataSet.DisableConstraints;
  end;
end;

procedure TDeveCalendarDlg.tmr1Timer(Sender: TObject);
var
  MyThread : TCalendarThread;
begin
  if not fhasFirstRead then
    tmr1.Interval := 5000; //不是第一次时
  tmr1.Enabled := False;
  MyThread := TCalendarThread.Create(ani1,cds1,tmr1);
  MyThread.Resume;

end;

procedure TDeveCalendarDlg.FormCreate(Sender: TObject);
begin
  fhasopen := False;
end;



procedure TDeveCalendarDlg.act_readExecute(Sender: TObject);
var
  MyThread : TCalendarThread;
begin
  tmr1.Enabled := False;
  MyThread := TCalendarThread.Create(ani1,cds1,tmr1);
  MyThread.Execute;
 // MyThread.Free;
end;

procedure TDeveCalendarDlg.act_readUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := tmr1.Enabled;
end;



procedure TDeveCalendarDlg.init;
var
  mysl : TStringList;
  mysql : string;
  myDataSet : TClientDataSet;
  myfield : TFieldDef;
  i : Integer;
const
  glSQLTXT = ' SELECT ZUSER_ID, ZDATETIME, ZCODE, ZCONTENT, ZTYPE' +
             ' FROM TB_MSG ' +
             ' WHERE 1=0' +
             ' ORDER BY ZDATETIME DESC';


begin
  myDataSet := TClientDataSet.Create(nil);
  cds1.EnableConstraints;
  try
    //读取内容
    try
      if  cds1.Fields.Count =0 then
      begin
        mysql := glSQLTXT;
        myDataSet.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mysql));

        with cds1 do
        begin
          Fields.Clear;
          FieldDefs.Assign(myDataSet.FieldDefs);
          myfield := FieldDefs.AddFieldDef;
          myfield.Name :='ZCODENAME';
          myfield.DataType := ftString;

          for i:=0 to FieldDefs.Count -1 do
          begin
            FieldDefs[i].CreateField(cds1).Alignment := taLeftJustify;
          end;
          CreateDataSet;
        end;
        //cds1.Append;
        //fDataSet.CloneCursor(myDataSet,True);
      end;

    finally
      myDataSet.Free;
    end;
  finally
    cds1.DisableConstraints;
  end;
end;

procedure TDeveCalendarDlg.dbgrd1DblClick(Sender: TObject);
var
  myBugId : Integer;
begin
  if cds1.FieldByName('ZTYPE').AsInteger = 0 then
  begin
    myBugId := StrToIntdef(cds1.FieldByName('ZCODE').AsString,-1);
    if myBugId = -1 then Exit;
    SendMessage(Application.MainForm.Handle,gcMSG_GetBugItem,myBugId,0);
  end
  else if cds1.FieldByName('ZTYPE').AsInteger = 1 then
  begin
    myBugId := StrToIntdef(cds1.FieldByName('ZCODE').AsString,-1);
    if myBugId = -1 then Exit;
    SendMessage(Application.MainForm.Handle,gcMSG_GetTestItem,myBugId,0);
  end;
  //zhangkai
end;


procedure TCalendarThread.ReadData;
begin
  if fReadDataSet.RecordCount > 0 then
  begin

    //写入表内
    fDataSet.First;
    fReadDataSet.Last;
    while not fReadDataSet.Bof do
    begin
      if not fDataSet.Active then
        fDataSet.Open;

      fDataSet.Insert;
      if  fReadDataSet.FieldByName('ZTYPE').AsInteger = 0 then
        fDataSet.FieldByName('ZCODENAME').AsString := '#'+fReadDataSet.FieldByName('ZCODE').AsString
      else
        fDataSet.FieldByName('ZCODENAME').AsString := '$'+fReadDataSet.FieldByName('ZCODE').AsString;
      fDataSet.FieldByName('ZUSER_ID').AsInteger := fReadDataSet.FieldByName('ZUSER_ID').AsInteger;
      fDataSet.FieldByName('ZDATETIME').AsDateTime := fReadDataSet.FieldByName('ZDATETIME').AsDateTime;
      fDataSet.FieldByName('ZCODE').AsString := fReadDataSet.FieldByName('ZCODE').AsString;
      fDataSet.FieldByName('ZCONTENT').AsString := fReadDataSet.FieldByName('ZCONTENT').AsString;
      fDataSet.FieldByName('ZTYPE').AsInteger := fReadDataSet.FieldByName('ZTYPE').AsInteger;
      fDataSet.Post;

      fReadDataSet.Prior;
    end;
  end;
  fDataSet.First;
end;

initialization
  fhasFirstRead := True;

end.
