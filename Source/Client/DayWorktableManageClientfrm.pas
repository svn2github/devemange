////////////////////////////////////////////////////////////////////////////////
//
// 项目:
// 模块: 工作台
// 作者: 龙仕云 创建时间: 2008-12-20
//
//
// 修改:       
//
//
//
////////////////////////////////////////////////////////////////////////////////
unit DayWorktableManageClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseChildfrm, ComCtrls, ExtCtrls, ActnList, StdCtrls, Buttons,
  DB, DBClient, Grids, DBGrids,ClientTypeUnits, DBCtrls;

type

  TRowType = (rtBug,rtCreateBug,rtTest,rtCreateTest,rtPlan,
    rtRelease,rtCreateRelease,
    rtOther);
  TWorkColumn=(wcNo,wcTitle,wcLeve,wcID);

  TDayWorktableManageClientDlg = class(TBaseChildDlg)
    pnlnovisible: TPanel;
    actlst1: TActionList;
    act_mework: TAction;
    cdswork: TClientDataSet;
    dswork: TDataSource;
    pnlworkTop: TPanel;
    btnmework: TBitBtn;
    btnmework_Refresh: TBitBtn;
    dbgrdwork: TDBGrid;
    act_goto: TAction;
    dbtxtZROWNAME: TDBText;
    cdsUser: TClientDataSet;
    dsUser: TDataSource;
    dblkcbb1: TDBLookupComboBox;
    btnmework1: TBitBtn;
    act_hiswork: TAction;
    lblName: TLabel;
    dbnvgr1: TDBNavigator;
    procedure act_meworkExecute(Sender: TObject);
    procedure dbgrdworkDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure act_gotoUpdate(Sender: TObject);
    procedure act_gotoExecute(Sender: TObject);
    procedure act_hisworkUpdate(Sender: TObject);
    procedure act_hisworkExecute(Sender: TObject);
  private
    { Private declarations }
    procedure LoadWork(AUseID:Integer;AUseType:Integer);
  public
    { Public declarations }
    procedure initBase; override;
    procedure freeBase; override;
    procedure Showfrm ; override;  //显示后发生的事件
    procedure Closefrm; override;  //关闭显示发生的事件

    class function GetModuleID : integer;override; //取出模块ID
  end;


implementation
uses
  ClinetSystemUnits, DmUints;

{$R *.dfm}

procedure TDayWorktableManageClientDlg.act_meworkExecute(Sender: TObject);
begin
  LoadWork(ClientSystem.fEditer_id,Ord(ClientSystem.fEditerType));
  lblName.Caption := ClientSystem.fEditer;
end;

procedure TDayWorktableManageClientDlg.Closefrm;
begin
  inherited;
  
end;

procedure TDayWorktableManageClientDlg.dbgrdworkDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  myBrushColor : TColor;
  myFontColor : TColor;
  mystr : string;
  myfontsize : Integer;
  myh,mywidth : Integer;
begin
  myBrushColor := clwhite;
  myFontColor  := clblack;

  case cdswork.FieldByName('ZROWTYPE').AsInteger of
    Ord(rtBug),Ord(rtCreateBug)  :
      begin
        myBrushColor := clGray;
        myFontColor := clwhite;
      end;
    Ord(rtTest),Ord(rtCreateTest) :
      begin
        myBrushColor := clTeal;
        myFontColor := clwhite;
      end;
    Ord(rtPlan) :
      begin
        myBrushColor := clNavy;
        myFontColor := clwhite;
      end;
    Ord(rtRelease),Ord(rtCreateRelease):
      begin
        myBrushColor := clOlive;
        myFontColor  := clBlack;
      end;
    Ord(rtOther):
      begin
        //myBrushColor := clGray;
        //myFontColor := clwhite;
      end;
  end;

  //是分部
  if (cdswork.FieldByName('ZROWPART').AsBoolean)  then
  begin
    dbgrdwork.Canvas.Brush.Color := myBrushColor;
    dbgrdwork.Canvas.Font.Color  := myFontColor;
    dbgrdwork.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end
  else begin
    //如是关闭的
    if cdswork.FieldByName('ZCLOSE').AsBoolean then
      dbgrdwork.Canvas.Font.Color := clBlue;
    {
    if Column.Index = Ord(wcNo) then
    begin
      dbgrdwork.Canvas.Brush.Color := myBrushColor;
      dbgrdwork.Canvas.Font.Color  := myFontColor;
    end;
    }
    dbgrdwork.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    if (Column.Index = Ord(wcTitle)) and
        (cdswork.FieldByName('ZTAGNAME').AsString <> '') then
    begin
      dbgrdwork.Canvas.FillRect(Rect);
      mystr := cdswork.FieldByName('ZTAGNAME').AsString;
      myfontsize := dbgrdwork.Canvas.Font.Size;
      myfontcolor := dbgrdwork.Canvas.Font.Color;
      mybrushcolor := dbgrdwork.Canvas.Brush.Color;
      dbgrdwork.Canvas.Font.Size   := 8;
      dbgrdwork.Canvas.Font.Color  := clBtnFace;
      dbgrdwork.Canvas.Brush.Color := clNavy;
      myh := dbgrdwork.Canvas.TextHeight(mystr);
      mywidth := dbgrdwork.Canvas.TextWidth(mystr);
      dbgrdwork.Canvas.TextOut(Rect.Left+1,
        rect.Top + (rect.Bottom-rect.Top-myh) div 2,mystr);

      dbgrdwork.Canvas.Font.Size := myfontsize;
      dbgrdwork.Canvas.Font.Color := myfontcolor;
      dbgrdwork.Canvas.Brush.Color := mybrushcolor;
      myh := dbgrdwork.Canvas.TextHeight('测');
      dbgrdwork.Canvas.TextOut(Rect.Left+mywidth+5,
      Rect.Top + (Rect.Bottom-Rect.Top-myh) div 2,
      cdswork.FieldByName('ZROWNAME').AsString);

      dbgrdwork.Canvas.FrameRect(Rect);

    end;
  end;
end;

procedure TDayWorktableManageClientDlg.freeBase;
begin
  inherited;

end;

class function TDayWorktableManageClientDlg.GetModuleID: integer;
begin
  Result := Ord(mtdayworktable);
end;

procedure TDayWorktableManageClientDlg.initBase;
begin
  inherited;
  cdsUser.CloneCursor(DM.cdsUser,True);
  act_mework.Execute;
end;

procedure TDayWorktableManageClientDlg.Showfrm;
begin
  inherited;

end;

procedure TDayWorktableManageClientDlg.act_gotoUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdswork.Active
  and (cdswork.FieldByName('ZROWTYPE').AsInteger in [Ord(rtBug),Ord(rtCreateBug),
    Ord(rtTest),Ord(rtCreateTest),Ord(rtRelease),Ord(rtCreateRelease)])
  and (not cdswork.FieldByName('ZROWPART').AsBoolean);
end;

procedure TDayWorktableManageClientDlg.act_gotoExecute(Sender: TObject);
begin
  if cdswork.FieldByName('ZROWTYPE').AsInteger in [Ord(rtBug),
    Ord(rtCreateBug)] then
    SendMessage(Application.MainForm.Handle,gcMSG_GetBugItem,
      cdswork.FieldByName('ZCONTENTID').AsInteger,0)
  else if cdswork.FieldByName('ZROWTYPE').AsInteger in [Ord(rtTest),
    Ord(rtCreatetest)] then
    SendMessage(Application.MainForm.Handle,gcMSG_GetTestItem,
      cdswork.FieldByName('ZCONTENTID').AsInteger,0)
  else if cdswork.FieldByName('ZROWTYPE').AsInteger in [Ord(rtRelease),
    Ord(rtCreateRelease)] then
    SendMessage(Application.MainForm.Handle,gcMSG_GetReleaseItem,
      cdswork.FieldByName('ZCONTENTID').AsInteger,0)

end;

procedure TDayWorktableManageClientDlg.LoadWork(AUseID, AUseType: Integer);
var
  mySQL : string;
const
  glSQL = 'exec pt_UserDayWork %d,%d';
begin
  //统计
  ShowProgress('请稍候...',0);
  try
    mySQL := format(glSQL,[
      AUseID,
      AUseType]);
    cdswork.Data := ClientSystem.fDbOpr.ReadDataSet(pchar(mySQL));

  finally
    HideProgress;
  end;
end;

procedure TDayWorktableManageClientDlg.act_hisworkUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not cdsUser.IsEmpty
  and (cdsUser.RecNo >0);
end;

procedure TDayWorktableManageClientDlg.act_hisworkExecute(Sender: TObject);
begin
  LoadWork(cdsUser.FieldByName('ZID').AsInteger,
    cdsUser.FieldByName('ZTYPE').AsInteger);
  lblName.Caption := cdsUser.FieldByName('ZNAME').AsString;
end;

end.
