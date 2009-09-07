unit WorkOverTimeClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseChildfrm, ComCtrls, ExtCtrls, Grids, DBGrids, StdCtrls,
  Buttons, ActnList, DB, DBClient, DBCtrls, Mask;

type

  TPageTypeRec = record
    fIndex : Integer;
    fIndexCount : Integer;
    fWhereStr : string; //分页的where条件
  end;

  TWorkOverTiemColumn=(wot_No,wot_Name,wot_Date,wot_Lost,wot_Minue,wot_Note,
    wot_Status,wot_CheckName);

  TWorkOverTimeClient = class(TBaseChildDlg)
    pgc1: TPageControl;
    tsWorkList: TTabSheet;
    tsWorkContent: TTabSheet;
    pnlTool: TPanel;
    dbgrd1: TDBGrid;
    pnl1: TPanel;
    actlst1: TActionList;
    act_AddToDay: TAction;
    act_AddToYesterday: TAction;
    btnAddToDay: TBitBtn;
    btnAddToYesterday: TBitBtn;
    cdsWrokList: TClientDataSet;
    dsWorkList: TDataSource;
    act_AddLoad: TAction;
    btnAddLoad: TBitBtn;
    pnlPage: TPanel;
    act_firstPage: TAction;
    lblPageCount: TLabel;
    btnfirstPage: TBitBtn;
    act_PrivPage: TAction;
    btnPrivPage: TBitBtn;
    act_NextPage: TAction;
    act_LastPage: TAction;
    btnNextPage: TBitBtn;
    btnLastPage: TBitBtn;
    dbmmoZCONTENT: TDBMemo;
    act_Save: TAction;
    act_cancel: TAction;
    pnl2: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl5: TLabel;
    dbedtZCHECKNAME: TDBEdit;
    dbedtZADDRESS: TDBEdit;
    dbedtZLASTDATETIME: TDBEdit;
    dbedtZUSERNAME: TDBEdit;
    lbl6: TLabel;
    dbedtZMINUTE: TDBEdit;
    btnNext: TBitBtn;
    btnPriv: TBitBtn;
    btncancel: TBitBtn;
    btnSave: TBitBtn;
    dbedtZDATE: TDBEdit;
    lbl7: TLabel;
    act_RefreshData: TAction;
    btnRefreshData: TBitBtn;
    lbl8: TLabel;
    dbedtZDATE1: TDBEdit;
    lbl9: TLabel;
    dtp1: TDateTimePicker;
    cdsParams: TClientDataSet;
    lbl10: TLabel;
    dbedtZSTATUSNAME: TDBEdit;
    lbl4: TLabel;
    act_Agree: TAction;
    act_NoAgree: TAction;
    act_Priv: TAction;
    act_Next: TAction;
    btnAgree: TBitBtn;
    btnNoAgree: TBitBtn;
    dbchkZWEEKEND: TDBCheckBox;
    lbl11: TLabel;
    dbtxtZBUILDDATE: TDBText;
    lbl12: TLabel;
    act_CancellBill: TAction;
    btnCancellBill: TBitBtn;
    act_CheckList: TAction;
    btnCheckList: TBitBtn;
    cdsUser: TClientDataSet;
    dsUser: TDataSource;
    dblkcbb1: TDBLookupComboBox;
    btnmework1: TBitBtn;
    act_OtherWork: TAction;
    act_All: TAction;
    btnAll: TBitBtn;
    lbl13: TLabel;
    dbedtZRATE: TDBEdit;
    procedure act_AddLoadExecute(Sender: TObject);
    procedure cdsWrokListCalcFields(DataSet: TDataSet);
    procedure act_firstPageExecute(Sender: TObject);
    procedure act_firstPageUpdate(Sender: TObject);
    procedure act_PrivPageUpdate(Sender: TObject);
    procedure act_PrivPageExecute(Sender: TObject);
    procedure act_NextPageUpdate(Sender: TObject);
    procedure act_NextPageExecute(Sender: TObject);
    procedure act_LastPageUpdate(Sender: TObject);
    procedure act_LastPageExecute(Sender: TObject);
    procedure act_SaveUpdate(Sender: TObject);
    procedure act_cancelUpdate(Sender: TObject);
    procedure act_SaveExecute(Sender: TObject);
    procedure act_cancelExecute(Sender: TObject);
    procedure act_AddToDayExecute(Sender: TObject);
    procedure cdsWrokListBeforePost(DataSet: TDataSet);
    procedure dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure act_RefreshDataExecute(Sender: TObject);
    procedure act_AddToYesterdayExecute(Sender: TObject);
    procedure dtp1Change(Sender: TObject);
    procedure cdsWrokListNewRecord(DataSet: TDataSet);
    procedure act_AgreeExecute(Sender: TObject);
    procedure act_NoAgreeExecute(Sender: TObject);
    procedure act_PrivUpdate(Sender: TObject);
    procedure act_NextUpdate(Sender: TObject);
    procedure act_PrivExecute(Sender: TObject);
    procedure act_NextExecute(Sender: TObject);
    procedure pgc1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure dbchkZWEEKENDClick(Sender: TObject);
    procedure act_CancellBillExecute(Sender: TObject);
    procedure act_CancellBillUpdate(Sender: TObject);
    procedure act_CheckListExecute(Sender: TObject);
    procedure act_OtherWorkExecute(Sender: TObject);
    procedure act_AllExecute(Sender: TObject);
  private
    { Private declarations }
    fPageType : TPageTypeRec;
    function  GetWorkListPageCount(AWhereStr:String):integer; //取出页总数
    procedure LoadWrokList(APageIndex:integer;AWhereStr:String); //加载某个人的加班单
    procedure CalcMinute();
  public
    { Public declarations }

    procedure initBase; override;
    procedure freeBase; override;
  end;

implementation
uses
  DateUtils,
  ClinetSystemUnits, DmUints;

const
  gc_Rate = 1.5;
  gc_weekRate = 2.0;  //周末加班系数

{$R *.dfm}

{ TWorkOverTimeClient }

function TWorkOverTimeClient.GetWorkListPageCount(
  AWhereStr: String): integer;
var
  mySQL  : string;
  myRowCount : integer;
  mywhere : string;
const
  glSQL = 'exec pt_SplitPage ''TB_WORKOVERTIME'',''' +
         'ZID'', ''%s'',20,%d,%d,1,''%s''';
  //                                             页码,以总数=1, 条件where
begin
  mywhere := AWhereStr;

  mySQL := format(glSQL,[
    'ZID',
    1,
    1, //不是取总数
    mywhere]);


  myRowCount := ClientSystem.fDbOpr.ReadInt(PChar(mySQL));
  Result := myRowCount div 20;
  if (myRowCount mod 20) > 0 then
    Result := Result + 1;

end;

procedure TWorkOverTimeClient.LoadWrokList(APageIndex:integer;AWhereStr:String);
var
  mySQL  : string;
  i : integer;
  myfield : TFieldDef;
  myDataSet : TClientDataSet;
  myb : Boolean;
  mywhere : String;
const
  glSQL = 'exec pt_SplitPage ''TB_WORKOVERTIME'',' +
          '''ZID,ZUSER_ID,ZDATETIME,ZLASTDATETIME,ZADDRESS,ZCONTENT,ZCHECK_USER_ID, ' +
          'ZDATE,ZSTATUS,ZWEEKEND,ZBUILDDATE,ZMINUTE,ZRATE'',' +
          '''%s'',20,%d,%d,1,''%s''';
          // 页码,以总数=1, 条件where
begin

  if fLoading then Exit;
  mywhere := AWhereStr;
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
    if cdsWrokList.Fields.Count=0 then
      with cdsWrokList do
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
          FieldDefs[i].CreateField(cdsWrokList).Alignment := taLeftJustify;
        end;

        //由谁加班单
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZUSERNAME';
        myfield.DataType := ftString;
        myfield.Size := 50;
        with myfield.CreateField(cdsWrokList) do
        begin
          FieldKind := fkLookup;
          KeyFields := 'ZUSER_ID';
          LookupDataSet := DM.cdsUserAll;
          LookupKeyFields := 'ZID';
          LookupResultField := 'ZNAME';
        end;

        //审核人
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZCHECKNAME';
        myfield.DataType := ftString;
        myfield.Size := 50;
        with myfield.CreateField(cdsWrokList) do
        begin
          FieldKind := fkLookup;
          KeyFields := 'ZCHECK_USER_ID';
          LookupDataSet := DM.cdsUserAll;
          LookupKeyFields := 'ZID';
          LookupResultField := 'ZNAME';
        end;

        //
        myField := cdsWrokList.FieldDefs.AddFieldDef ;
        myField.Name := 'ZCONTENTTEXT';
        myField.DataType := ftString;
        myField.Size := 4000;
        with myfield.CreateField(cdsWrokList) do
        begin
          FieldKind := fkCalculated;
        end;

        //状态名
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZSTATUSNAME';
        myfield.DataType := ftString;
        myfield.Size := 50;
        with myfield.CreateField(cdsWrokList) do
        begin
          FieldKind := fkLookup;
          KeyFields := 'ZSTATUS';
          LookupDataSet := cdsParams;
          LookupKeyFields := 'ZID';
          LookupResultField := 'ZNAME';
        end;


        CreateDataSet;
      end
    else begin
      cdsWrokList.DisableControls;
      try
        while not cdsWrokList.IsEmpty do cdsWrokList.Delete;
      finally
        cdsWrokList.EnableControls;
      end;
    end;

    cdsWrokList.DisableControls;
    try
      myDataSet.First;
      while not myDataSet.Eof do
      begin
        cdsWrokList.Append;
        cdsWrokList.FieldByName('ZISNEW').AsBoolean := False;
        for i:=0 to myDataSet.FieldDefs.Count -1 do
        begin
          if myDataSet.FieldDefs[i].Name = 'ZID' then
            cdsWrokList.FieldByName('ZMYID').asInteger :=
              myDataSet.FieldByName('ZID').asInteger
          else
            cdsWrokList.FieldByName(myDataSet.FieldDefs[i].Name).AsVariant :=
              myDataSet.FieldByName(myDataSet.FieldDefs[i].Name).AsVariant;
        end;
        cdsWrokList.Post;
        myDataSet.Next;
      end;
      cdsWrokList.First;
    finally
      cdsWrokList.EnableControls;
    end;

  finally
    myDataSet.Free;
    fLoading :=myb;
    ClientSystem.EndTickCount;
    HideProgress;
  end;
end;

procedure TWorkOverTimeClient.act_AddLoadExecute(Sender: TObject);
var
  mywhere : string;
begin
  fPageType.fIndex := 1;
  mywhere := Format('ZUSER_ID=%d',[ClientSystem.fEditer_id]);
  fPageType.fIndexCount := GetWorkListPageCount(mywhere);
  fPageType.fWhereStr := mywhere;
  LoadWrokList(fPageType.fIndex,fPageType.fWhereStr);
end;

procedure TWorkOverTimeClient.cdsWrokListCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('ZCONTENTTEXT').AsString :=
  DataSet.FieldByName('ZCONTENT').AsString;
end;

procedure TWorkOverTimeClient.act_firstPageExecute(Sender: TObject);
begin
  fPageType.fIndex := 1;
  LoadWrokList(fPageType.fIndex,fPageType.fWhereStr);
  lblPageCount.Caption := format('%d/%d',[
      1,
      fPageType.fIndexCount]);
end;

procedure TWorkOverTimeClient.freeBase;
begin
  inherited;
  
end;

procedure TWorkOverTimeClient.initBase;
const
  gl_SQLTXT = 'select * from TB_WORKOVERTIME_PARAMS where ZTYPE=0';
begin
  inherited;
  ShowProgress('读取数据',0);
  try
    cdsParams.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(gl_SQLTXT));
    cdsUser.CloneCursor(DM.cdsUser,True);
    
    fPageType.fIndex := 1;
    fPageType.fIndexCount := GetWorkListPageCount('');
    LoadWrokList(1,'');
    lblPageCount.Caption := format('%d/%d',[
        fPageType.fIndex,
        fPageType.fIndexCount]);
  finally
    HideProgress;
  end;
end;

procedure TWorkOverTimeClient.act_firstPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fPageType.fIndex <> 1) and
  (fPageType.fIndexCount > 1);
end;

procedure TWorkOverTimeClient.act_PrivPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fPageType.fIndex > 1) ;
end;

procedure TWorkOverTimeClient.act_PrivPageExecute(Sender: TObject);
begin
  fPageType.fIndex := fPageType.fIndex -1;
  LoadWrokList(fPageType.fIndex,fPageType.fWhereStr);
  lblPageCount.Caption := format('%d/%d',[
      fPageType.fIndex,
      fPageType.fIndexCount]);
end;

procedure TWorkOverTimeClient.act_NextPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fPageType.fIndex<fPageType.fIndexCount);
end;

procedure TWorkOverTimeClient.act_NextPageExecute(Sender: TObject);
begin
  fPageType.fIndex := fPageType.fIndex +1;
  LoadWrokList(fPageType.fIndex,fPageType.fWhereStr);
  lblPageCount.Caption := format('%d/%d',[
      fPageType.fIndex,
      fPageType.fIndexCount]);

end;

procedure TWorkOverTimeClient.act_LastPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fPageType.fIndex<fPageType.fIndexCount);
end;

procedure TWorkOverTimeClient.act_LastPageExecute(Sender: TObject);
begin
  fPageType.fIndex := fPageType.fIndexCount;
  LoadWrokList(fPageType.fIndex,fPageType.fWhereStr);
  lblPageCount.Caption := format('%d/%d',[
      fPageType.fIndex,
      fPageType.fIndexCount]);
end;

procedure TWorkOverTimeClient.act_SaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsWrokList.State in [dsEdit,dsInsert];
end;

procedure TWorkOverTimeClient.act_cancelUpdate(Sender: TObject);
begin
 (Sender as TAction).Enabled := cdsWrokList.State in [dsEdit,dsInsert];
end;

procedure TWorkOverTimeClient.act_SaveExecute(Sender: TObject);
begin
  cdsWrokList.Post;
end;

procedure TWorkOverTimeClient.act_cancelExecute(Sender: TObject);
begin
  cdsWrokList.Cancel;
end;

procedure TWorkOverTimeClient.act_AddToDayExecute(Sender: TObject);
var
  mydatetime : TDateTime;
  myy,mymo,myday : Word;
begin

  mydatetime := ClientSystem.fDbOpr.GetSysDateTime;
  myy  := YearOf(mydatetime);
  mymo := MonthOf(mydatetime);
  myday:= DayOf(mydatetime);
  

  //我今天加班了
  cdsWrokList.First;
  cdsWrokList.Insert;
  cdsWrokList.FieldByName('ZDATE').AsString := formatdatetime('yyyy-mm-dd',mydatetime);
  cdsWrokList.FieldByName('ZDATETIME').AsDateTime := StrToDateTime(Format('%d-%d-%d 17:00',
    [myy,mymo,myday]));
  cdsWrokList.FieldByName('ZLASTDATETIME').AsDateTime := mydatetime; //固定一个时间
  dtp1.DateTime := mydatetime;

  pgc1.ActivePageIndex := 1;
end;

procedure TWorkOverTimeClient.cdsWrokListBeforePost(DataSet: TDataSet);
var
  mySQL : string;
const
  gl_SQLTXT = 'insert TB_WORKOVERTIME (ZUSER_ID,ZDATE,ZDATETIME,ZLASTDATETIME, ' +
    'ZADDRESS,ZCONTENT,ZMINUTE,ZSTATUS,ZWEEKEND,ZBUILDDATE,ZRATE) values(%d,''%s'',''%s'',''%s'',''%s'',''%s'',%d,%d,%d,''%s'',%f)';
  gl_SQLTXT2 = 'update TB_WORKOVERTIME set ' +
               'ZDATETIME=''%s'',     ' +
               'ZLASTDATETIME=''%s'', ' +
               'ZADDRESS=''%s'', '  +
               'ZCONTENT=''%s'', '  +
               'ZMINUTE=%d ,  '    +
               'ZSTATUS=%d , '     +
               'ZWEEKEND=%d, '     +
               'ZBUILDDATE=''%s'', '   +
               'ZRATE=%f, '            +
               'ZCHECK_USER_ID=%d where ZID=%d ';
  gl_SQLTXT3 = 'select ZID from TB_WORKOVERTIME where ZDATE=''%s'' and ZUSER_ID=%d ';
  gl_SQLTXT4 = 'select isNull(max(ZID),1) from TB_WORKOVERTIME';
begin
  //
  if fLoading then Exit;

  CalcMinute();
  if DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    //校对一下,是否已有了加班单
    mySQL := Format(gl_SQLTXT3,[
      DataSet.FieldByName('ZDATE').AsString,
      DataSet.FieldByName('ZUSER_ID').AsInteger]);
    if ClientSystem.fDbOpr.ReadRecordCount(PChar(mySQL)) > 0 then
    begin
      MessageBox(Handle,'你的加班单已填过了','提示',MB_ICONWARNING+MB_OK);
      DataSet.Cancel;
      Exit;
    end;

    //只要真超过6点才能算时间
    if  not dbchkZWEEKEND.Checked and
        (HourOf(DataSet.FieldByName('ZLASTDATETIME').AsDateTime) < 18) then
    begin
      MessageBox(Handle,'你的加班单必须在下班6点之后才能填写','提示',MB_ICONWARNING+MB_OK);
      DataSet.Cancel;
      Exit;
    end;

    mySQL := Format(gl_SQLTXT,[
      DataSet.FieldByName('ZUSER_ID').AsInteger,
      DataSet.FieldByName('ZDATE').AsString,
      DataSet.FieldByName('ZDATETIME').AsString,
      DataSet.FieldByName('ZLASTDATETIME').AsString,
      DataSet.FieldByName('ZADDRESS').AsString,
      DataSet.FieldByName('ZCONTENT').AsString,
      DataSet.FieldByName('ZMINUTE').AsInteger,
      DataSet.FieldByName('ZSTATUS').AsInteger,
      Ord(DataSet.FieldByName('ZWEEKEND').AsBoolean),
      DataSet.FieldByName('ZBUILDDATE').AsString,
      DataSet.FieldByName('ZRATE').AsFloat]);

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

    if (DataSet.FieldByName('ZUSER_ID').AsInteger <>
       ClientSystem.fEditer_id) and (not ClientSystem.fEditer_CheckTask) then
    begin
      MessageBox(Handle,'不是你的加班单，不能修改','提示',MB_ICONWARNING+MB_OK);
      DataSet.Cancel;
      Exit;
    end;


    //只要真超过6点才能算时间
    if  not dbchkZWEEKEND.Checked and
        (HourOf(DataSet.FieldByName('ZLASTDATETIME').AsDateTime) < 18) then
    begin
      MessageBox(Handle,'你的加班单必须在下班6点之后才能填写','提示',MB_ICONWARNING+MB_OK);
      DataSet.Cancel;
      Exit;
    end;

    mySQL := Format(gl_SQLTXT2,[
      DataSet.FieldByName('ZDATETIME').AsString,
      DataSet.FieldByName('ZLASTDATETIME').AsString,
      DataSet.FieldByName('ZADDRESS').AsString,
      DataSet.FieldByName('ZCONTENT').AsString,
      DataSet.FieldByName('ZMINUTE').AsInteger,
      DataSet.FieldByName('ZSTATUS').AsInteger,
      Ord(DataSet.FieldByName('ZWEEKEND').AsBoolean),
      DataSet.FieldByName('ZBUILDDATE').AsString,
      DataSet.FieldByName('ZRATE').AsFloat,
      DataSet.FieldByName('ZCHECK_USER_ID').AsInteger,
      DataSet.FieldByName('ZMYID').AsInteger]);

    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      ClientSystem.fDbOpr.CommitTrans;
    except
      ClientSystem.fDbOpr.RollbackTrans;
    end;
  end;
end;

procedure TWorkOverTimeClient.dbgrd1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (cdsWrokList.RecNo mod 2  = 0) and not ( gdSelected in State)  then
    dbgrd1.Canvas.Brush.Color := clSilver;

  if (cdsWrokList.FieldByName('ZSTATUS').AsInteger =1) then
  begin
    dbgrd1.Canvas.Font.Color := clblue;
  end;

  case Column.Index of
    Ord(wot_Name):
      if cdsWrokList.FieldByName('ZUSER_ID').AsInteger =
         ClientSystem.fEditer_id then
      begin
        dbgrd1.Canvas.Brush.Color := clAqua;
      end;
    Ord(wot_CheckName):
      if cdsWrokList.FieldByName('ZCHECK_USER_ID').AsInteger =
         ClientSystem.fEditer_id then
      begin
        dbgrd1.Canvas.Brush.Color := clLime;
      end;

  end;


  dbgrd1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TWorkOverTimeClient.act_RefreshDataExecute(Sender: TObject);
begin
  LoadWrokList(fPageType.fIndex,fPageType.fWhereStr);
  lblPageCount.Caption := format('%d/%d',[
      fPageType.fIndex,
      fPageType.fIndexCount]);
end;

procedure TWorkOverTimeClient.act_AddToYesterdayExecute(Sender: TObject);
var
  mydatetime : TDateTime;
  myy,mymo,myday : Word;
begin
  mydatetime := ClientSystem.fDbOpr.GetSysDateTime;
  myy  := YearOf(mydatetime);
  mymo := MonthOf(mydatetime);
  myday:= DayOf(mydatetime);

  cdsWrokList.First;
  cdsWrokList.Insert;

  cdsWrokList.FieldByName('ZDATE').AsString := formatdatetime('yyyy-mm-dd',mydatetime-1);
  cdsWrokList.FieldByName('ZDATETIME').AsDateTime := StrToDateTime(Format('%d-%d-%d 17:00',
    [myy,mymo,myday-1]));
  cdsWrokList.FieldByName('ZLASTDATETIME').AsDateTime := mydatetime-1; //固定一个时间
  dtp1.DateTime := mydatetime;

  pgc1.ActivePageIndex := 1;
end;


procedure TWorkOverTimeClient.dtp1Change(Sender: TObject);
var
  mydatetime : TDateTime;
  myy,mymo,myday : Word;
begin
  mydatetime := dtp1.DateTime;
  myy  := YearOf(mydatetime);
  mymo := MonthOf(mydatetime);
  myday:= DayOf(mydatetime);

  if not (cdsWrokList.State in [dsEdit,dsInsert]) then
    cdsWrokList.Edit;
    
  cdsWrokList.FieldByName('ZDATE').AsString := formatdatetime('yyyy-mm-dd',mydatetime);
  cdsWrokList.FieldByName('ZDATETIME').AsDateTime := StrToDateTime(Format('%d-%d-%d 17:00',
    [myy,mymo,myday]));
  cdsWrokList.FieldByName('ZLASTDATETIME').AsDateTime := StrToDateTime(Format('%d-%d-%d 17:00',
    [myy,mymo,myday]));; //固定一个时间

end;

procedure TWorkOverTimeClient.cdsWrokListNewRecord(DataSet: TDataSet);
begin
  if fLoading then Exit;
  DataSet.FieldByName('ZSTATUS').AsInteger := 0;
  cdsWrokList.FieldByName('ZISNEW').AsBoolean := True;
  cdsWrokList.FieldByName('ZUSER_ID').AsInteger := ClientSystem.fEditer_id;
  cdsWrokList.FieldByName('ZCHECK_USER_ID').AsInteger := -1;
  cdsWrokList.FieldByName('ZWEEKEND').AsBoolean := False;
  cdsWrokList.FieldByName('ZRATE').AsFloat := gc_Rate;
  cdsWrokList.FieldByName('ZADDRESS').AsString := '开发办公室';
  cdsWrokList.FieldByName('ZBUILDDATE').AsDateTime := ClientSystem.fDbOpr.GetSysDateTime;
end;

procedure TWorkOverTimeClient.act_AgreeExecute(Sender: TObject);
begin
  //权限
  if (ClientSystem.fEditerType = etAdmin) or
     (ClientSystem.fEditer_CheckTask) then
  begin
    if not (cdsWrokList.State in [dsEdit,dsInsert]) then
      cdsWrokList.Edit;
    cdsWrokList.FieldByName('ZCHECK_USER_ID').AsInteger := ClientSystem.fEditer_id;  
    cdsWrokList.FieldByName('ZSTATUS').AsInteger := 1;
    cdsWrokList.Post;
  end
  else
    MessageBox(Handle,'你没有权限','提示',MB_ICONWARNING+MB_OK);

end;

procedure TWorkOverTimeClient.act_NoAgreeExecute(Sender: TObject);
begin
  //权限
  if (ClientSystem.fEditerType = etAdmin) or
     (ClientSystem.fEditer_CheckTask) then
  begin
    if not (cdsWrokList.State in [dsEdit,dsInsert]) then
      cdsWrokList.Edit;
    cdsWrokList.FieldByName('ZCHECK_USER_ID').AsInteger := ClientSystem.fEditer_id;
    cdsWrokList.FieldByName('ZSTATUS').AsInteger := 2;
    cdsWrokList.Post;
  end
  else
    MessageBox(Handle,'你没有权限','提示',MB_ICONWARNING+MB_OK);

end;

procedure TWorkOverTimeClient.act_PrivUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not (cdsWrokList.State in [dsEdit,dsInsert])
  and not (cdsWrokList.Bof);
end;

procedure TWorkOverTimeClient.act_NextUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not (cdsWrokList.State in [dsEdit,dsInsert])
  and not (cdsWrokList.Eof);
end;

procedure TWorkOverTimeClient.act_PrivExecute(Sender: TObject);
begin
  cdsWrokList.Prior;
end;

procedure TWorkOverTimeClient.act_NextExecute(Sender: TObject);
begin
  cdsWrokList.Next;
end;

procedure TWorkOverTimeClient.pgc1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if pgc1.ActivePageIndex  =0 then
    AllowChange := cdsWrokList.RecordCount>0;
  if pgc1.ActivePageIndex = 1 then
  begin
    AllowChange := not (cdsWrokList.State in [dsEdit,dsInsert]);
    if cdsWrokList.State in [dsEdit,dsInsert] then
    begin
      MessageBox(Handle,'在编编辑中，不能切换页面','提示',MB_ICONWARNING+MB_OK);
    end;
  end;
end;

procedure TWorkOverTimeClient.CalcMinute;
var
  myMinute : Integer;
begin
  
  myMinute := Round(HourOf(cdsWrokList.FieldByName('ZLASTDATETIME').AsDateTime)-
  HourOf(cdsWrokList.FieldByName('ZDATETIME').AsDateTime))*60 +
  MinuteOf(cdsWrokList.FieldByName('ZLASTDATETIME').AsDateTime)-
  MinuteOf(cdsWrokList.FieldByName('ZDATETIME').AsDateTime);

  if not (cdsWrokList.State in [dsEdit,dsInsert]) then
    cdsWrokList.Edit;

  if dbchkZWEEKEND.Checked then
  begin
    cdsWrokList.FieldByName('ZMINUTE').AsInteger := myMinute;
    cdsWrokList.FieldByName('ZRATE').AsFloat := gc_weekRate;
  end
  else begin
    cdsWrokList.FieldByName('ZMINUTE').AsInteger := myMinute;
    cdsWrokList.FieldByName('ZRATE').AsFloat := gc_Rate;
  end;

end;

procedure TWorkOverTimeClient.dbchkZWEEKENDClick(Sender: TObject);
begin
 
  if fLoading then Exit;

  if dbchkZWEEKEND.Checked then
  begin
    dbedtZDATE.ReadOnly := False;
    dbedtZDATE.Color := clWindow;
  end
  else begin
    dbedtZDATE.ReadOnly := True;
    dbedtZDATE.Color    := clBtnFace;
  end;

end;

procedure TWorkOverTimeClient.act_CancellBillExecute(Sender: TObject);
begin
   
  if not (cdsWrokList.State in [dsEdit,dsInsert]) then
    cdsWrokList.Edit;
  if cdsWrokList.FieldByName('ZSTATUS').AsInteger = 0 then
    cdsWrokList.FieldByName('ZSTATUS').AsInteger := 3
  else
    cdsWrokList.FieldByName('ZSTATUS').AsInteger := 0;
end;

procedure TWorkOverTimeClient.act_CancellBillUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (cdsWrokList.RecordCount > 0) and
  (cdsWrokList.FieldByName('ZUSER_ID').AsInteger=ClientSystem.fEditer_id) and
  (cdsWrokList.FieldByName('ZSTATUS').AsInteger in [0,3]);

end;

procedure TWorkOverTimeClient.act_CheckListExecute(Sender: TObject);
var
  mywhere : string;
begin
  fPageType.fIndex := 1;
  mywhere := 'ZSTATUS=0';
  fPageType.fIndexCount := GetWorkListPageCount(mywhere);
  fPageType.fWhereStr := mywhere;
  LoadWrokList(fPageType.fIndex,fPageType.fWhereStr);
end;

procedure TWorkOverTimeClient.act_OtherWorkExecute(Sender: TObject);
var
  mywhere : string;
begin
  fPageType.fIndex := 1;
  mywhere := Format('ZUSER_ID=%d',[cdsUser.FieldByName('ZID').AsInteger]);
  fPageType.fIndexCount := GetWorkListPageCount(mywhere);
  fPageType.fWhereStr := mywhere;
  LoadWrokList(fPageType.fIndex,fPageType.fWhereStr);
end;

procedure TWorkOverTimeClient.act_AllExecute(Sender: TObject);
begin
  fPageType.fIndex := 1;
  fPageType.fIndexCount := GetWorkListPageCount('');
  LoadWrokList(1,'');
  lblPageCount.Caption := format('%d/%d',[
        fPageType.fIndex,
        fPageType.fIndexCount]);
end;

end.
