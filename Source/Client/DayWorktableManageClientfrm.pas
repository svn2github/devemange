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
  DB, DBClient, Grids, DBGrids,ClientTypeUnits, DBCtrls, Mask;

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
    act_goto: TAction;
    cdsUser: TClientDataSet;
    dsUser: TDataSource;
    act_hiswork: TAction;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    pnlworkTop: TPanel;
    lblName: TLabel;
    Btnmework2: TBitBtn;
    Btngoto: TBitBtn;
    dblkcbb1: TDBLookupComboBox;
    Btnhiswork: TBitBtn;
    dbnvgr1: TDBNavigator;
    dbgrdwork: TDBGrid;
    actlst2: TActionList;
    act1_ReadToDay: TAction;
    act_MeWrite: TAction;
    act_Save: TAction;
    act_Cancel: TAction;
    act_NextRow: TAction;
    act_ProRow: TAction;
    cdsToDayResult: TClientDataSet;
    dsToDayResult: TDataSource;
    cdsTYPE: TClientDataSet;
    intgrfldcds1ZID: TIntegerField;
    strngfldcds1ZNAME: TStringField;
    pnlTool: TPanel;
    BtnReader: TBitBtn;
    dtp1: TDateTimePicker;
    BtnMeWrite: TBitBtn;
    dbgrdResult: TDBGrid;
    dbedtZCONTENTID: TDBEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    dbedtZCONTENT: TDBEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    dtp2: TDateTimePicker;
    dbmmoZNOTE: TDBMemo;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    BtnProRow: TBitBtn;
    BtnNextRow: TBitBtn;
    dbedtZDATETIME: TDBEdit;
    lbl9: TLabel;
    dblkcbbZUSER_NAME: TDBLookupComboBox;
    dblkcbbZWRITERNAME: TDBLookupComboBox;
    dblkcbb2: TDBLookupComboBox;
    act_OtherResultToDay: TAction;
    lblName1: TLabel;
    BtnOtherResultToDay: TBitBtn;
    dblkcbbZTYPENAME: TDBLookupComboBox;
    dsType: TDataSource;
    act_GotoContent: TAction;
    BtnGotoContent: TBitBtn;
    dbtxtZROWNAME: TDBText;
    act1_Readyesterday: TAction;
    Btn1_Readyesterday: TBitBtn;
    act_ReadAll: TAction;
    BtnReadAll: TBitBtn;
    pnl1: TPanel;
    dbtxtZCONTENT: TDBText;
    pnl2: TPanel;
    lbl1: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    procedure act_meworkExecute(Sender: TObject);
    procedure dbgrdworkDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure act_gotoUpdate(Sender: TObject);
    procedure act_gotoExecute(Sender: TObject);
    procedure act_hisworkUpdate(Sender: TObject);
    procedure act_hisworkExecute(Sender: TObject);
    procedure act1_ReadToDayExecute(Sender: TObject);
    procedure act_CancelExecute(Sender: TObject);
    procedure act_SaveUpdate(Sender: TObject);
    procedure act_CancelUpdate(Sender: TObject);
    procedure act_SaveExecute(Sender: TObject);
    procedure act_NextRowUpdate(Sender: TObject);
    procedure act_ProRowUpdate(Sender: TObject);
    procedure act_NextRowExecute(Sender: TObject);
    procedure act_ProRowExecute(Sender: TObject);
    procedure act_MeWriteExecute(Sender: TObject);
    procedure pgc1Change(Sender: TObject);
    procedure pgc1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure cdsToDayResultCalcFields(DataSet: TDataSet);
    procedure cdsToDayResultBeforePost(DataSet: TDataSet);
    procedure cdsToDayResultNewRecord(DataSet: TDataSet);
    procedure dtp2Change(Sender: TObject);
    procedure dbgrdResultDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure act_OtherResultToDayExecute(Sender: TObject);
    procedure act_GotoContentExecute(Sender: TObject);
    procedure act1_ReadyesterdayExecute(Sender: TObject);
    procedure act_ReadAllExecute(Sender: TObject);
  private
    { Private declarations }
    procedure LoadWork(AUseID:Integer;AUseType:Integer);

  public
    { Public declarations }
    procedure initBase; override;
    procedure freeBase; override;
    procedure Showfrm ; override;  //显示后发生的事件
    procedure Closefrm; override;  //关闭显示发生的事件

    procedure LoadToDayResult(APageIndex:integer;AAll:Boolean;AUserID:Integer;
      ADateTime:TDateTime);

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
        myFontColor  := clwhite;
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

  //如测试用例,没有提交时
  if (cdswork.FieldByName('ZROWTYPE').AsInteger in [Ord(rtTest),Ord(rtCreateTest)])
    and (cdswork.FieldByName('ZSTATUS').AsInteger in [Ord(bgsAction),Ord(bgsReAction)]) then
  begin
    dbgrdwork.Canvas.Font.Style := [fsItalic];
    if Column.Index = 3 then
    begin
      dbgrdwork.Canvas.Brush.Color := clMaroon;
      dbgrdwork.Canvas.Font.Color := clwhite;
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

  cdsTYPE.Append;
  cdsTYPE.FieldByName('ZID').AsInteger := 0;
  cdsTYPE.FieldByName('ZNAME').AsString := '测试用例';
  cdsTYPE.Post;

  cdsTYPE.Append;
  cdsTYPE.FieldByName('ZID').AsInteger := 1;
  cdsTYPE.FieldByName('ZNAME').AsString := 'BUG';
  cdsTYPE.Post;

  cdsTYPE.Append;
  cdsTYPE.FieldByName('ZID').AsInteger := 2;
  cdsTYPE.FieldByName('ZNAME').AsString := 'SVN';
  cdsTYPE.Post;

  cdsTYPE.Append;
  cdsTYPE.FieldByName('ZID').AsInteger := 3;
  cdsTYPE.FieldByName('ZNAME').AsString := '报功';
  cdsTYPE.Post;

  cdsTYPE.Append;
  cdsTYPE.FieldByName('ZID').AsInteger := 4;
  cdsTYPE.FieldByName('ZNAME').AsString := '举报';
  cdsTYPE.Post;

  dtp1.DateTime := ClientSystem.fDbOpr.GetSysDateTime;
end;

procedure TDayWorktableManageClientDlg.Showfrm;
begin
  inherited;

end;

procedure TDayWorktableManageClientDlg.act_gotoUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdswork.Active
  and (cdswork.FieldByName('ZROWTYPE').AsInteger in [Ord(rtBug),Ord(rtCreateBug),
    Ord(rtTest),Ord(rtCreateTest),Ord(rtRelease),Ord(rtCreateRelease),Ord(rtPlan)])
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
  else if cdswork.FieldByName('ZROWTYPE').AsInteger in [Ord(rtPlan)] then
    SendMessage(Application.MainForm.Handle,gcMSG_GetPlanItem,
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
  ClientSystem.BeginTickCount;
  try
    mySQL := format(glSQL,[
      AUseID,
      AUseType]);
    cdswork.Data := ClientSystem.fDbOpr.ReadDataSet(pchar(mySQL));

  finally
    ClientSystem.EndTickCount;
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

procedure TDayWorktableManageClientDlg.LoadToDayResult(APageIndex: integer;
  AAll:Boolean;AUserID:Integer;ADateTime:TDateTime);
var
  mySQL  : string;
  i : integer;
  myfield : TFieldDef;
  myDataSet : TClientDataSet;
  myb : Boolean;
  mywhere : String;
  mykind : Integer;
  myUserType : Integer;

  mycount14,mycount15,mycount16,mycount17,mycount18 : Integer;

const
  glSQL = 'exec pt_SplitPage ''TB_TODAYRESULT'',' +
          '''ZID,ZTYPE,ZUSER_ID,ZDATETIME,ZCONTENTID,ZCONTENT,ZNOTE, ' +
          'ZWRITER,ZACTION'',' +
          '''%s'',200,%d,%d,1,''%s''';
          // 页码,以总数=1, 条件where
  glSQL2 = 'exec pt_ToDayResult %d,%d,''%s''';
begin

  if fLoading then Exit;
  if not AAll then
    mywhere :=  Format('ZUSER_ID=%d and ZDATETIME=''''%s''''',
      [AUserID,DateToStr(ADateTime)])
  else
    mywhere := Format('ZDATETIME=''''%s''''',[DateToStr(ADateTime)]);
  mySQL := format(glSQL,[
      'ZID',
      APageIndex,
      0, //不是取总数
      mywhere]);

  ClientSystem.BeginTickCount;
  ShowProgress('读取数据',0);
  myb := fLoading;
  fLoading := True;
  myDataSet := TClientDataSet.Create(nil);
  try
    myDataSet.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));

    if cdsToDayResult.Fields.Count=0 then
      with cdsToDayResult do
      begin
        Fields.Clear;
        FieldDefs.Assign(myDataSet.FieldDefs);
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZISNEW';
        myfield.DataType := ftBoolean;

        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZMYID';
        myfield.DataType := ftInteger;

        for i:=0 to FieldDefs.Count -1 do
        begin
          FieldDefs[i].CreateField(cdsToDayResult).Alignment := taLeftJustify;
        end;

        //谁贡献的
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZUSER_NAME';
        myfield.DataType := ftString;
        myfield.Size := 50;
        with myfield.CreateField(cdsToDayResult) do
        begin
          FieldKind := fkLookup;
          KeyFields := 'ZUSER_ID';
          LookupDataSet := DM.cdsUserAll;
          LookupKeyFields := 'ZID';
          LookupResultField := 'ZNAME';
        end;

        //谁加功的
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZWRITERNAME';
        myfield.DataType := ftString;
        myfield.Size := 50;
        with myfield.CreateField(cdsToDayResult) do
        begin
          FieldKind := fkLookup;
          KeyFields := 'ZWRITER';
          LookupDataSet := DM.cdsUserAll;
          LookupKeyFields := 'ZID';
          LookupResultField := 'ZNAME';
        end;

        //类型
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZTYPENAME';
        myfield.DataType := ftString;
        myfield.Size := 50;
        with myfield.CreateField(cdsToDayResult) do
        begin
          FieldKind := fkLookup;
          KeyFields := 'ZTYPE';
          LookupDataSet := cdsTYPE;
          LookupKeyFields := 'ZID';
          LookupResultField := 'ZNAME';
        end;

        //
        myField := cdsToDayResult.FieldDefs.AddFieldDef ;
        myField.Name := 'ZNOTETEXT';
        myField.DataType := ftString;
        myField.Size := 4000;
        with myfield.CreateField(cdsToDayResult) do
        begin
          FieldKind := fkCalculated;
        end;

        CreateDataSet;
      end
    else begin
      cdsToDayResult.DisableControls;
      try
        while not cdsToDayResult.IsEmpty do cdsToDayResult.Delete;
      finally
        cdsToDayResult.EnableControls;
      end;
    end;

    //统计各内容
    cdsToDayResult.DisableControls;
    try
      myDataSet.First;
      while not myDataSet.Eof do
      begin
        cdsToDayResult.Append;
        cdsToDayResult.FieldByName('ZISNEW').AsBoolean := False;
        for i:=0 to myDataSet.FieldDefs.Count -1 do
        begin
          if myDataSet.FieldDefs[i].Name = 'ZID' then
            cdsToDayResult.FieldByName('ZMYID').asInteger :=
              myDataSet.FieldByName('ZID').asInteger
          else
            cdsToDayResult.FieldByName(myDataSet.FieldDefs[i].Name).AsVariant :=
              myDataSet.FieldByName(myDataSet.FieldDefs[i].Name).AsVariant;
        end;
        cdsToDayResult.Post;
        myDataSet.Next;
      end;

      //
      // 执行统计其他贡献
      //
      if AAll then mykind := 0 else mykind := 1;
      mySQL := Format(glSQL2,[AUserID,
        mykind,
        DateToStr(ADateTime)]);

      if DM.cdsUserAll.Locate('ZID',AUserID,[loPartialKey]) then
        myUserType := DM.cdsUserAll.FieldByName('ZTYPE').AsInteger
      else
        myUserType := 3;

      myDataSet.Data := ClientSystem.fDbOpr.ReadDataSet(pchar(mySQL));
      myDataSet.First;
      while not myDataSet.Eof do
      begin
        cdsToDayResult.Append;
        cdsToDayResult.FieldByName('ZISNEW').AsBoolean := False;
        cdsToDayResult.FieldByName('ZMYID').asInteger := -1;
        cdsToDayResult.FieldByName('ZWRITER').AsInteger := -1;
        cdsToDayResult.FieldByName('ZTYPE').AsInteger := myDataSet.FieldByName('ZTYPE').AsInteger;
        //类型 0=测试用例 1=bug 2=svn 3=报功 4=举报
        case myDataSet.FieldByName('ZTYPE').AsInteger of
          0:
            if TEditerType(myUserType) in [etAdmin,etDeve] then
              cdsToDayResult.FieldByName('ZUSER_ID').AsInteger := myDataSet.FieldByName('ZOPEN_USER_ID').AsInteger
            else
              cdsToDayResult.FieldByName('ZUSER_ID').AsInteger := myDataSet.FieldByName('ZCLOSE_USER_ID').AsInteger;
          1:
           if TEditerType(myUserType) in [etAdmin,etDeve] then
              cdsToDayResult.FieldByName('ZUSER_ID').AsInteger := myDataSet.FieldByName('ZCLOSE_USER_ID').AsInteger
            else
              cdsToDayResult.FieldByName('ZUSER_ID').AsInteger := myDataSet.FieldByName('ZOPEN_USER_ID').AsInteger;

          2:cdsToDayResult.FieldByName('ZUSER_ID').AsInteger := myDataSet.FieldByName('ZOPEN_USER_ID').AsInteger;
        end;

        cdsToDayResult.FieldByName('ZCONTENTID').AsInteger := myDataSet.FieldByName('ZCONTENTID').AsInteger;
        cdsToDayResult.FieldByName('ZCONTENT').AsString := myDataSet.FieldByName('ZCONTENT').AsString;
        cdsToDayResult.FieldByName('ZACTION').AsInteger := myDataSet.FieldByName('ZACTION').AsInteger;
        cdsToDayResult.FieldByName('ZDATETIME').AsDateTime := dtp1.Date;

        if cdsToDayResult.FieldByName('ZUSER_ID').AsInteger >=0 then
          cdsToDayResult.Post
        else
          cdsToDayResult.Cancel;
        myDataSet.Next;
      end;

      //统计
      mycount14 := 0;mycount15:=0;mycount16:=0;mycount17:=0;mycount18:=0;
      cdsToDayResult.First;
      while not cdsToDayResult.Eof do
      begin
        if cdsToDayResult.FieldByName('ZACTION').AsInteger = 0 then
        begin
          if cdsToDayResult.FieldByName('ZTYPE').AsInteger = 0 then  //用例
            inc(mycount15)
          else
            inc(mycount16);
        end
        else begin
          //0=测试用例 1=bug 2=svn 3=报功 4=举报
          case cdsToDayResult.FieldByName('ZTYPE').AsInteger of
            0: Inc(mycount14);
            1: Inc(mycount17);
            2: Inc(mycount18);
          end;
        end;
        cdsToDayResult.Next;
      end;
      lbl14.Caption := IntToStr(mycount14);
      lbl15.Caption := IntToStr(mycount15);
      lbl16.Caption := IntToStr(mycount16);
      lbl17.Caption := IntToStr(mycount17);
      lbl18.Caption := IntToStr(mycount18);


      cdsToDayResult.First;
    finally
      cdsToDayResult.EnableControls;
    end;

  finally
    myDataSet.Free;
    fLoading :=myb;
    ClientSystem.EndTickCount;
    HideProgress;
  end;
end;

procedure TDayWorktableManageClientDlg.act1_ReadToDayExecute(
  Sender: TObject);
var
  mywhere : string;
  mydatetime : TDateTime;
begin
  mydatetime := ClientSystem.fDbOpr.GetSysDateTime;
  mywhere := Format('ZUSER_ID=%d and ZDATETIME=''''%s''''',
    [ClientSystem.fEditer_id,DateToStr(mydatetime)]);
  LoadToDayResult(1,False,ClientSystem.fEditer_id,mydatetime);
end;

procedure TDayWorktableManageClientDlg.act_CancelExecute(Sender: TObject);
begin
  cdsToDayResult.Cancel;

end;

procedure TDayWorktableManageClientDlg.act_SaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsToDayResult.State in [dsEdit, dsInsert];
end;

procedure TDayWorktableManageClientDlg.act_CancelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsToDayResult.State in [dsEdit, dsInsert];
end;

procedure TDayWorktableManageClientDlg.act_SaveExecute(Sender: TObject);
begin
  cdsToDayResult.Post;
end;

procedure TDayWorktableManageClientDlg.act_NextRowUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled :=
    not (cdsToDayResult.State in [dsEdit, dsInsert]) and
    not cdsToDayResult.Eof;
end;

procedure TDayWorktableManageClientDlg.act_ProRowUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled :=
    not (cdsToDayResult.State in [dsEdit, dsInsert]) and
    not cdsToDayResult.Bof;
end;

procedure TDayWorktableManageClientDlg.act_NextRowExecute(Sender: TObject);
begin
  cdsToDayResult.Next;
end;

procedure TDayWorktableManageClientDlg.act_ProRowExecute(Sender: TObject);
begin
  cdsToDayResult.Prior;
end;

procedure TDayWorktableManageClientDlg.act_MeWriteExecute(Sender: TObject);
begin
  cdsToDayResult.Append;
  cdsToDayResult.FieldByName('ZWRITER').AsInteger :=
    ClientSystem.fEditer_id;
  pgc1.ActivePageIndex := 2;
end;

procedure TDayWorktableManageClientDlg.pgc1Change(Sender: TObject);
begin
  if (pgc1.ActivePageIndex = 1) and not cdsToDayResult.Active then
    act1_ReadToDay.Execute;
end;

procedure TDayWorktableManageClientDlg.pgc1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if (pgc1.ActivePageIndex = 2) then
  begin
    AllowChange :=  not (cdsToDayResult.State in [dsEdit, dsInsert]);
    if not AllowChange then
      MessageBox(Handle,'编辑状态中，不能切换','提示',MB_ICONWARNING+MB_OK);
  end;
end;

procedure TDayWorktableManageClientDlg.cdsToDayResultCalcFields(
  DataSet: TDataSet);
begin
  DataSet.FieldByName('ZNOTETEXT').AsString :=
   DataSet.FieldByName('ZNOTE').AsString;
end;

procedure TDayWorktableManageClientDlg.cdsToDayResultBeforePost(
  DataSet: TDataSet);
var
  mySQL : string;
const
  gl_SQLTXT = 'insert TB_TODAYRESULT (ZTYPE,ZUSER_ID,ZDATETIME,ZCONTENTID, ' +
    'ZCONTENT,ZNOTE,ZWRITER,ZACTION) values(%d,%d,''%s'',%d,''%s'',''%s'',%d,%d)';
  gl_SQLTXT2 = 'update TB_TODAYRESULT set ' +
               'ZTYPE=%d,     ' +
               'ZUSER_ID=%d, ' +
               'ZDATETIME=''%s'', '  +
               'ZCONTENTID=%d, '  +
               'ZCONTENT=''%s'' ,  '    +
               'ZNOTE=''%s'' , '     +
               'ZWRITER=%d, '     +
               'ZACTION=%d where ZID=%d ';
  gl_SQLTXT4 = 'select isNull(max(ZID),1) from TB_TODAYRESULT';
begin
  //
  if fLoading then Exit;

  //类型 0=测试用例 1=bug 2=svn 3=报功 4=举报
  if DataSet.FieldByName('ZTYPE').AsInteger in [0,1,2,4] then
    DataSet.FieldByName('ZACTION').AsInteger := 0
  else
    DataSet.FieldByName('ZACTION').AsInteger := 1;
    
  if DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    mySQL := Format(gl_SQLTXT,[
      DataSet.FieldByName('ZTYPE').AsInteger,
      DataSet.FieldByName('ZUSER_ID').AsInteger,
      DateToStr(DataSet.FieldByName('ZDATETIME').AsDateTime),
      DataSet.FieldByName('ZCONTENTID').AsInteger,
      DataSet.FieldByName('ZCONTENT').AsString,
      DataSet.FieldByName('ZNOTE').AsString,
      DataSet.FieldByName('ZWRITER').AsInteger,
      DataSet.FieldByName('ZACTION').AsInteger]);

    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      ClientSystem.fDbOpr.CommitTrans;
      DataSet.FieldByName('ZISNEW').AsBoolean := False;
      DataSet.FieldByName('ZMYID').AsInteger := ClientSystem.fDbOpr.ReadInt(PChar(gl_SQLTXT4));
    except
      ClientSystem.fDbOpr.RollbackTrans;
    end;

  end
  else begin

    if ClientSystem.fEditer_id <> DataSet.FieldByName('ZWRITER').AsInteger then
    begin
      MessageBox(Handle,'不是你增加的，不能修改','提示',MB_ICONWARNING+MB_OK);
      Exit;
    end;

    mySQL := Format(gl_SQLTXT2,[
      DataSet.FieldByName('ZTYPE').AsInteger,
      DataSet.FieldByName('ZUSER_ID').AsInteger,
      DateToStr(DataSet.FieldByName('ZDATETIME').AsDateTime),
      DataSet.FieldByName('ZCONTENTID').AsInteger,
      DataSet.FieldByName('ZCONTENT').AsString,
      DataSet.FieldByName('ZNOTE').AsString,
      DataSet.FieldByName('ZWRITER').AsInteger,
      DataSet.FieldByName('ZACTION').AsInteger,
      DataSet.FieldByName('ZMYID').AsInteger]);

      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
  end;
end;

procedure TDayWorktableManageClientDlg.cdsToDayResultNewRecord(
  DataSet: TDataSet);
begin
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
  DataSet.FieldByName('ZDATETIME').AsDateTime := ClientSystem.fDbOpr.GetSysDateTime;
  DataSet.FieldByName('ZTYPE').AsInteger := 3;
  DataSet.FieldByName('ZCONTENTID').AsInteger := -1;
  DataSet.FieldByName('ZACTION').AsInteger := 1;
end;

procedure TDayWorktableManageClientDlg.dtp2Change(Sender: TObject);
begin
  if cdsToDayResult.State in [dsEdit,dsInsert] then
    cdsToDayResult.FieldByName('ZDATETIME').AsDateTime := dtp2.DateTime;
end;

procedure TDayWorktableManageClientDlg.dbgrdResultDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (cdsToDayResult.RecNo mod 2  = 0) and not ( gdSelected in State)  then
    dbgrdResult.Canvas.Brush.Color := clSilver;

  if (cdsToDayResult.FieldByName('ZACTION').AsInteger=0) then
  begin
    dbgrdResult.Canvas.Font.Color := clred;
  end;
  dbgrdResult.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TDayWorktableManageClientDlg.act_OtherResultToDayExecute(
  Sender: TObject);
var
  mydatetime : TDateTime;
begin
  mydatetime := dtp1.DateTime;

  LoadToDayResult(1,False,cdsUser.FieldByName('ZID').AsInteger,
    mydatetime);
  lblName1.Caption := cdsUser.FieldByName('ZNAME').AsString;
end;

procedure TDayWorktableManageClientDlg.act_GotoContentExecute(
  Sender: TObject);
begin
  if cdsToDayResult.IsEmpty then Exit;
  if  cdsToDayResult.FieldByName('ZCONTENTID').AsInteger < 0 then
    Exit;
  
  //测试用例
  if cdsToDayResult.FieldByName('ZTYPE').AsInteger  = 0 then
  begin
    SendMessage(Application.MainForm.Handle,gcMSG_GetTestItem,
      cdsToDayResult.FieldByName('ZCONTENTID').AsInteger,0);
    Exit;
  end;

  //Bug
  if cdsToDayResult.FieldByName('ZTYPE').AsInteger  = 1 then
  begin
    SendMessage(Application.MainForm.Handle,gcMSG_GetBugItem,
      cdsToDayResult.FieldByName('ZCONTENTID').AsInteger,0);
    Exit;
  end;

end;

procedure TDayWorktableManageClientDlg.act1_ReadyesterdayExecute(
  Sender: TObject);
var
  mydatetime : TDateTime;
begin
  mydatetime := ClientSystem.fDbOpr.GetSysDateTime;
  mydatetime := mydatetime -1;
  LoadToDayResult(1,False,ClientSystem.fEditer_id,mydatetime);
end;

procedure TDayWorktableManageClientDlg.act_ReadAllExecute(Sender: TObject);
var
  mydatetime : TDateTime;
begin
  mydatetime := dtp1.DateTime;
  LoadToDayResult(1,True,cdsUser.FieldByName('ZID').AsInteger,
    mydatetime);
  lblName1.Caption := '团队';
end;

end.
