///////////////////////////////////////////////////////////////////////////////
//
//  测试模块
//
//  创建时间:2008-10-5  作者:龙仕云
//
//  修改:
//    1.增加回复人 2009-1-1 元旦快乐
//    2.修改提交回复进只有开发人员与测试人员,管理员人.作者:龙仕云 2009-2-24
//
//
//
///////////////////////////////////////////////////////////////////////////////
unit TestManageClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseChildfrm, ExtCtrls, Grids, DBGrids, DB, DBClient,

  ClinetSystemUnits,
  ClientTypeUnits, StdCtrls, ComCtrls, Buttons, ActnList, Mask, DBCtrls,
  dbcgrids,
  TestHighQueryfrm {高级查询};

type

  TTestPageRec = record
    fCount : integer;
    fPageindex : integer;
    fwhere : string;
  end;

  TTestManageChildfrm = class(TBaseChildDlg)
    cdsTestItem: TClientDataSet;
    pnlOnVisible: TPanel;
    dsTestItem: TDataSource;
    cdsTemp: TClientDataSet;
    pgcTestMain: TPageControl;
    tsList: TTabSheet;
    tsConTent: TTabSheet;
    dbgrdTest: TDBGrid;
    pnlTestTool: TPanel;
    pnlTestBottom: TPanel;
    lblPage: TLabel;
    btnNewTest: TBitBtn;
    ActionList1: TActionList;
    act_New: TAction;
    pnlTestClient: TPanel;
    act_Save: TAction;
    act_Cancel: TAction;
    cdsProject: TClientDataSet;
    dsProject: TDataSource;
    cdsProVer: TClientDataSet;
    dsProVer: TDataSource;
    cdsLevel: TClientDataSet;
    dsLevel: TDataSource;
    cdsTesttype: TClientDataSet;
    dsTestType: TDataSource;
    cdsmethod: TClientDataSet;
    dsmethod: TDataSource;
    cdsTestSTATUS: TClientDataSet;
    dsTestSTATUS: TDataSource;
    scrlbx1: TScrollBox;
    Label2: TLabel;
    dbedtZNAME: TDBEdit;
    Label4: TLabel;
    dblkcbbZTYPE: TDBLookupComboBox;
    Label5: TLabel;
    dblkcbbZASSIGNEDTO: TDBLookupComboBox;
    Label10: TLabel;
    dbedtZCASEBUG: TDBEdit;
    Label12: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    dbedtZMAILTO: TDBEdit;
    dblcSelectUsermail: TDBLookupComboBox;
    Label19: TLabel;
    dbedtZRESULTDATE: TDBEdit;
    Label7: TLabel;
    Label13: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    Label9: TLabel;
    dblkcbbZTESTMETHOD: TDBLookupComboBox;
    dbedtZOPENEDDATE: TDBEdit;
    dbedtZCASETASK: TDBEdit;
    btnGetVer: TBitBtn;
    Label14: TLabel;
    dbedtZPRO_SVN: TDBEdit;
    dblkcbbZLEVEL: TDBLookupComboBox;
    Label3: TLabel;
    btnCancel: TBitBtn;
    btnSave: TBitBtn;
    dblkcbbZPRO_ID: TDBLookupComboBox;
    dblkcbbZPRO_VER: TDBLookupComboBox;
    spl1: TSplitter;
    dbctrlgrd1: TDBCtrlGrid;
    Label8: TLabel;
    Label16: TLabel;
    dbmmoZACTION: TDBMemo;
    dbedtZTRUEVALUE: TDBEdit;
    dbedtZINFACE: TDBEdit;
    act_Next: TAction;
    act_Prov: TAction;
    btnNext: TBitBtn;
    btnProv: TBitBtn;
    cdsResult: TClientDataSet;
    dsResult: TDataSource;
    lbl1: TLabel;
    dbedtZSTATUSNAME: TDBEdit;
    pnl1: TPanel;
    btnResult_Add: TBitBtn;
    actResult_Add: TAction;
    actResult_Save: TAction;
    btnResult_Save: TBitBtn;
    dbtxtZNO: TDBText;
    bvl2: TBevel;
    act_Success: TAction;
    btnSuccess: TBitBtn;
    act_Action: TAction;
    act_Colse: TAction;
    btnAction: TBitBtn;
    btnColse: TBitBtn;
    lbl2: TLabel;
    dbedtZREMORK: TDBEdit;
    act_FirstPage: TAction;
    act_NextPage: TAction;
    act_ProvPage: TAction;
    act_LastPage: TAction;
    btnFirstPage: TBitBtn;
    btnProvPage: TBitBtn;
    btnNextPage: TBitBtn;
    btnLastPage: TBitBtn;
    dbedtdbgrdTest: TDBEdit;
    act_toMe: TAction;
    btntoMe: TBitBtn;
    act_metest: TAction;
    btnmetest: TBitBtn;
    act_mebuild: TAction;
    btnmebuild: TBitBtn;
    act_NewByBugCode: TAction;
    btnNewByBugCode: TBitBtn;
    btnResult_AddByBug: TBitBtn;
    actResult_AddByBug: TAction;
    act_GetBugItem: TAction;
    btnGetBugItem: TBitBtn;
    dbnvgr1: TDBNavigator;
    act_RefreshData: TAction;
    btnRefreshData: TBitBtn;
    cdsTestCoseSTATUS: TClientDataSet;
    dsTestCoseSTATUS: TDataSource;
    dbedtZCLOSESTATUSNAME: TDBEdit;
    actHighQuery: TAction;
    btnResult_Add1: TBitBtn;
    dbtxtZUSERNAME: TDBText;
    cdsUser: TClientDataSet;
    pnlTitle: TPanel;
    lblTitle: TLabel;
    dbtxtZOPENEDBYNAME: TDBText;
    bvl1: TBevel;
    btnReQuery: TBitBtn;
    act_Subbim: TAction;
    btnResult_AddSVNVer: TSpeedButton;
    actResult_AddSVNVer: TAction;
    lbl3: TLabel;
    dbedtZSUBMISBYNAME: TDBEdit;
    act_newByPlanCode: TAction;
    btnnewByPlanCode: TBitBtn;
    act_GetPlanItem: TAction;
    btnGetBugItem1: TBitBtn;
    dbchkOK: TDBCheckBox;
    act_AddData: TAction;
    btnAddData: TBitBtn;
    lbl4: TLabel;
    dbedtZDEMAND_ID: TDBEdit;
    act_gotoDemand: TAction;
    btnGetPlanItem: TBitBtn;
    procedure act_NewExecute(Sender: TObject);
    procedure act_CancelUpdate(Sender: TObject);
    procedure act_CancelExecute(Sender: TObject);
    procedure act_SaveUpdate(Sender: TObject);
    procedure cdsTestItemNewRecord(DataSet: TDataSet);
    procedure cdsProjectAfterScroll(DataSet: TDataSet);
    procedure btnGetVerClick(Sender: TObject);
    procedure cdsTestItemBeforePost(DataSet: TDataSet);
    procedure pgcTestMainChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure act_SaveExecute(Sender: TObject);
    procedure dblcSelectUsermailCloseUp(Sender: TObject);
    procedure act_ProvUpdate(Sender: TObject);
    procedure act_ProvExecute(Sender: TObject);
    procedure act_NextUpdate(Sender: TObject);
    procedure act_NextExecute(Sender: TObject);
    procedure cdsTestItemAfterScroll(DataSet: TDataSet);
    procedure actResult_AddUpdate(Sender: TObject);
    procedure actResult_AddExecute(Sender: TObject);
    procedure pgcTestMainChange(Sender: TObject);
    procedure actResult_SaveExecute(Sender: TObject);
    procedure actResult_SaveUpdate(Sender: TObject);
    procedure cdsResultBeforePost(DataSet: TDataSet);
    procedure cdsResultNewRecord(DataSet: TDataSet);
    procedure act_SuccessExecute(Sender: TObject);
    procedure act_SuccessUpdate(Sender: TObject);
    procedure act_ActionUpdate(Sender: TObject);
    procedure act_ActionExecute(Sender: TObject);
    procedure act_ColseUpdate(Sender: TObject);
    procedure act_ColseExecute(Sender: TObject);
    procedure dbgrdTestDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure act_FirstPageUpdate(Sender: TObject);
    procedure act_FirstPageExecute(Sender: TObject);
    procedure act_NextPageUpdate(Sender: TObject);
    procedure act_NextPageExecute(Sender: TObject);
    procedure act_ProvPageUpdate(Sender: TObject);
    procedure act_ProvPageExecute(Sender: TObject);
    procedure act_LastPageExecute(Sender: TObject);
    procedure act_LastPageUpdate(Sender: TObject);
    procedure act_toMeExecute(Sender: TObject);
    procedure act_metestExecute(Sender: TObject);
    procedure act_mebuildExecute(Sender: TObject);
    procedure act_NewByBugCodeExecute(Sender: TObject);
    procedure actResult_AddByBugUpdate(Sender: TObject);
    procedure actResult_AddByBugExecute(Sender: TObject);
    procedure act_GetBugItemUpdate(Sender: TObject);
    procedure act_GetBugItemExecute(Sender: TObject);
    procedure act_RefreshDataExecute(Sender: TObject);
    procedure actHighQueryExecute(Sender: TObject);
    procedure dbctrlgrd1PaintPanel(DBCtrlGrid: TDBCtrlGrid;
      Index: Integer);
    procedure act_SubbimExecute(Sender: TObject);
    procedure act_SubbimUpdate(Sender: TObject);
    procedure actResult_AddSVNVerExecute(Sender: TObject);
    procedure act_newByPlanCodeExecute(Sender: TObject);
    procedure act_GetPlanItemExecute(Sender: TObject);
    procedure act_GetPlanItemUpdate(Sender: TObject);
    procedure cdsResultAfterEdit(DataSet: TDataSet);
    procedure act_AddDataExecute(Sender: TObject);
    procedure act_gotoDemandUpdate(Sender: TObject);
    procedure act_gotoDemandExecute(Sender: TObject);
  private
    { Private declarations }
    fTestPageRec : TTestPageRec;
    fHighQueryDlg : TTestHighQueryDlg;
    procedure Mailto(AEmailto:String); //发送到邮箱
    procedure WMShowTestItem(var msg:TMessage); message gcMSG_GetTestItem; //直接显示测试用
    procedure WMShowTestItemCode(var msg:TMessage);message gcMSG_GetTestItemByCode;
  public
    { Public declarations }
    procedure LoadTestItem(APageIndex: integer; Awhere: String);
    function  GetTestItemPageCount(APageIndex:integer;AWhereStr:String):integer; //取出页总数
    procedure LoadTestResult(AID:Integer);

    procedure initBase; override;
    procedure freeBase; override;
    procedure Showfrm ; override;  //显示后发生的事件
    procedure Closefrm; override;  //关闭显示发生的事件
    class function GetModuleID : integer;override;
  end;

var
  TestManageChildfrm: TTestManageChildfrm;

implementation

uses
  TestCaseSOCREfrm, {测试打分}
  Activationfrm,    {激活处量}
  GetSVNVerfrm,     {选择SVN的版本号}
  DmUints,BugHistoryfrm;

{$R *.dfm}

{ TTestManageChildfrm }

procedure TTestManageChildfrm.Closefrm;
begin
  inherited;

end;

procedure TTestManageChildfrm.freeBase;
begin
  if Assigned(fHighQueryDlg) then
    fHighQueryDlg.Free;
  inherited;
end;

class function TTestManageChildfrm.GetModuleID: integer;
begin
  Result := Ord(mtTest);
end;

function TTestManageChildfrm.GetTestItemPageCount(APageIndex: integer;
  AWhereStr: String): integer;
var
  mySQL  : string;
  myRowCount : integer;
  mywhere : string;
const
  glSQL = 'exec pt_SplitPage ''TB_TEST_ITEM'',' +
          '''ZID'', ''%s'',20,%d,%d,1,''%s''';
  //               页码,以总数=1, 条件where
begin
  mywhere := AWhereStr;
  mySQL := format(glSQL,[
      '',
      APageIndex,
      1, //不是取总数
      mywhere]);
  myRowCount := ClientSystem.fDbOpr.ReadInt(PChar(mySQL));
  Result := myRowCount div 20;
  if (myRowCount mod 20) > 0 then
    Result := Result + 1;
end;

procedure TTestManageChildfrm.initBase;
var
  i : Integer;
  mycds : TClientDataSet;
  myfield : TFieldDef;
const
  glSQL  = 'select * from TB_TEST_ITEM where ZID=-1';
  glSQL2 = 'select ZID,ZNAME from TB_PRO_ITEM';
  glSQL3 = 'select ZID,ZNAME from TB_TEST_PARAMS where ZTYPE=%d';
begin
  inherited;
  fHighQueryDlg := nil;
  cdsProject.Data  := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL2));
  cdsLevel.Data    := ClientSystem.fDbOpr.ReadDataSet(PChar(Format(glSQL3,[0])));
  cdsTesttype.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(Format(glSQL3,[1])));
  cdsmethod.Data   := ClientSystem.fDbOpr.ReadDataSet(PChar(Format(glSQL3,[2])));
  cdsTestSTATUS.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(Format(glSQL3,[3])));
  cdsTestCoseSTATUS.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(Format(glSQL3,[4])));
  cdsUser.CloneCursor(DM.cdsUser,True);

  mycds := TClientDataSet.Create(nil);
  try
    mycds.data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL));

    if cdsTestItem.Active then
      cdsTestItem.Close;
    cdsTestItem.FieldDefs.Clear;
    cdsTestItem.FieldDefs.Assign(mycds.FieldDefs);
    with cdsTestItem.FieldDefs do
    begin
      myField := AddFieldDef;
      myField.Name := 'ZISNEW';   //是否是新增
      myField.DataType := ftBoolean;
      with cdsTestItem do
      begin
        for i:=0 to FieldDefs.Count -1 do
           FieldDefs[i].CreateField(cdsTestItem);
      end;

      //创建人
      myField := AddFieldDef;
      myField.Name := 'ZOPENEDBYNAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsTestItem) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZOPENEDBY';
        LookupDataSet := DM.cdsUserAll;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

      //指派人
      myField := AddFieldDef;
      myField.Name := 'ZASSIGNEDTONAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsTestItem) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZASSIGNEDTO';
        LookupDataSet := DM.cdsUserAll;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

      //测试人
      myField := AddFieldDef;
      myField.Name := 'ZTESTRESULTBYNAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsTestItem) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZTESTRESULTBY';
        LookupDataSet := DM.cdsUserAll;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

      //提交,ZSUBMISBY
      myField := AddFieldDef;
      myField.Name := 'ZSUBMISBYNAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsTestItem) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZSUBMISBY';
        LookupDataSet := DM.cdsUserAll;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;


      //测试结果
      myField := AddFieldDef;
      myField.Name := 'ZSTATUSNAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsTestItem) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZSTATUS';
        LookupDataSet := cdsTestSTATUS;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

      //关闭的状态
      myField := AddFieldDef;
      myField.Name := 'ZCLOSESTATUSNAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsTestItem) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZCLOSESTATUS';
        LookupDataSet := cdsTestCoseSTATUS;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

      //等级
      myField := AddFieldDef;
      myField.Name := 'ZLEVELNAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsTestItem) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZLEVEL';
        LookupDataSet := cdsLevel;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

      //立项项目
      myField := AddFieldDef;
      myField.Name := 'ZPRONAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsTestItem) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZPRO_ID';
        LookupDataSet := cdsProject;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

     cdsTestItem.FieldByName('ZID').Alignment := taLeftJustify;
     cdsTestItem.FieldByName('ZCLOSESTATUSNAME').Alignment :=taCenter;

    end;
    cdsTestItem.CreateDataSet;
    
  finally
    mycds.Free;
  end;
  fTestPageRec.fPageindex := 1;
  fTestPageRec.fwhere := '1=1';
  fTestPageRec.fCount := GetTestItemPageCount(1,'1=1');
  LoadTestItem(fTestPageRec.fPageindex,fTestPageRec.fwhere);
end;

procedure TTestManageChildfrm.LoadTestItem(APageIndex: integer;
  Awhere: String);
var
  mySQL  : string;
  i : integer;
  myb : Boolean;
const
    glSQL = 'exec pt_SplitPage ''TB_TEST_ITEM'',' +
          '''ZID,ZNAME,ZSTATUS,ZOPENEDBY,ZOPENEDDATE,ZLEVEL,ZTYPE,ZASSIGNEDTO,' +
          'ZRESULT,ZTESTRESULTBY,ZRESULTDATE,ZTESTMETHOD,ZCASEBUG,'+
          'ZCASETASK,ZMAILTO,ZPRO_ID,ZPRO_VER,ZPRO_SVN,ZREMORK,ZCLOSESTATUS,ZCLOSESOCRE,ZSUBMISBY,ZDEMAND_ID'', ' +
          '''%s'',20,%d,%d,1,''%s''';
begin

  mySQL := format(glSQL,[
      'ZID',
      APageIndex,
      0,Awhere]);

  myb := fLoading;
  fLoading := True;
  cdsTestItem.DisableControls;

  ShowProgress('读取数据...',0);
  ClientSystem.BeginTickCount;
  try
    lblPage.Caption := format('%d/%d',[fTestPageRec.fPageindex,
      fTestPageRec.fCount]);
    if cdsTemp.Active then  cdsTemp.Close;
    cdsTemp.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));

    while not cdsTestItem.IsEmpty do
      cdsTestItem.Delete;


    //生成数据
    cdsTemp.First;
    while not cdsTemp.Eof do
    begin
      cdsTestItem.Append;
      cdsTestItem.FieldByName('ZISNEW').AsBoolean := False;
      for i:=0 to cdsTemp.FieldDefs.Count -1 do
        cdsTestItem.FieldByName(cdsTemp.FieldDefs[i].Name).AsVariant :=
          cdsTemp.FieldByName(cdsTemp.FieldDefs[i].Name).AsVariant;
      cdsTestItem.Post;
      cdsTemp.Next;
    end;
    cdsTestItem.First;

  finally
    cdsTestItem.EnableControls;
    fLoading := myb;
    HideProgress;
    ClientSystem.EndTickCount;
  end;
end;

procedure TTestManageChildfrm.Showfrm;
begin
  inherited;

end;

procedure TTestManageChildfrm.act_NewExecute(Sender: TObject);
begin
  if cdsTestItem.State in [dsEdit,dsinsert] then
    cdsTestItem.Post;
  cdsTestItem.First;
  cdsTestItem.Insert;
  //cdsTestItem.Append;
  lblTitle.Caption := '新建测试用例';
  pgcTestMain.ActivePageIndex := 1;

  cdsResult.DisableControls;
  try
  if cdsResult.Active then
    while not cdsResult.Eof do cdsResult.Delete;
  finally
    cdsResult.EnableControls;
  end;
end;

procedure TTestManageChildfrm.act_CancelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsTestItem.State in [dsEdit,dsInsert];
end;

procedure TTestManageChildfrm.act_CancelExecute(Sender: TObject);
begin
  cdsTestItem.Cancel;
end;

procedure TTestManageChildfrm.act_SaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsTestItem.State in [dsEdit,dsInsert];
end;

procedure TTestManageChildfrm.cdsTestItemNewRecord(DataSet: TDataSet);
begin
  if fLoading then Exit;
  DataSet.FieldByName('ZID').AsInteger := 0;
  DataSet.FieldByName('ZOPENEDBY').AsInteger := ClientSystem.fEditer_id;
  DataSet.FieldByName('ZOPENEDDATE').AsDateTime := ClientSystem.fDbOpr.GetSysDateTime;
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
  DataSet.FieldByName('ZSTATUS').AsInteger := Ord(bgsAction);
  DataSet.FieldByName('ZTESTMETHOD').AsInteger := 0;
  DataSet.FieldByName('ZTYPE').AsInteger := 0;
  DataSet.FieldByName('ZDEMAND_ID').AsInteger := -1;
  DataSet.FieldByName('ZMAILTO').AsString := Format('%s(%d)',[
    ClientSystem.fEditer,ClientSystem.fEditer_id]);

  if cdsResult.Active and (not cdsResult.IsEmpty) then
    while cdsResult.Eof do
        cdsResult.Delete;
end;

procedure TTestManageChildfrm.cdsProjectAfterScroll(DataSet: TDataSet);
begin
  //
  cdsProVer.Close;
end;

procedure TTestManageChildfrm.btnGetVerClick(Sender: TObject);
var
  myPID : Integer;
const
  glSQL = 'select ZID,ZVER from TB_PRO_VERSION where ZPRO_ID=%d order by ZID desc  ';
begin
  if cdsProject.IsEmpty then Exit;
  myPID := cdsProject.fieldByName('ZID').AsInteger;
  cdsProVer.Data := ClientSystem.fDbOpr.ReadDataSet(
    PChar(Format(glSQL,[myPID])));

end;

procedure TTestManageChildfrm.cdsTestItemBeforePost(DataSet: TDataSet);
var
  myID : Integer;
  mySQL : string;
  myform :TActivationDlg;
const
  glSQL   = 'select isNull(max(ZID),0)+1 from TB_TEST_ITEM';
  glSQL2  = 'insert TB_TEST_ITEM (ZID,ZNAME,ZSTATUS,ZOPENEDBY,ZOPENEDDATE,'+
            'ZLEVEL,ZTYPE,ZASSIGNEDTO,ZRESULT,ZTESTRESULTBY,ZRESULTDATE,' +
            'ZTESTMETHOD,ZCASEBUG,ZCASETASK,ZMAILTO,ZPRO_ID,'+
            'ZPRO_VER,ZPRO_SVN,ZREMORK,ZSUBMISBY,ZDEMAND_ID) ' +
             'values(%d,''%s'',%d,%d,getdate(),%d,%d,%d,%d,%d,''%s'',' +
             '%d,''%s'',''%s'',''%s'',%d,%d,%d,''%s'',''%s'',%d)' ;

  glSQL3  = 'update TB_TEST_ITEM set ' +
            'ZNAME=''%s'', ' +
            'ZSTATUS=%d, ' +
            'ZOPENEDBY=%d, '+
            'ZOPENEDDATE=''%s'','+
            'ZLEVEL=%d ,' +
            'ZTYPE=%d ,' +
            'ZASSIGNEDTO=%d, ' +
            'ZRESULT=%d, '+
            'ZTESTRESULTBY=%d, ' +
            'ZRESULTDATE=getdate(),'+
            'ZTESTMETHOD=%d, ' +
            'ZCASEBUG=''%s'', ' +
            'ZCASETASK=''%s'', '+
            'ZMAILTO=''%s'', '+
            'ZPRO_ID=%d, ' +
            'ZPRO_VER=%d, ' +
            'ZPRO_SVN=%d, ' +
            'ZREMORK=''%s'', '+
            'ZCLOSESTATUS=%d,'+
            'ZCLOSESOCRE=%d,' +
            'ZDEMAND_ID=%d, ' +
            'ZSUBMISBY=''%s''' +
            'where ZID=%d';
begin
  if fLoading then Exit;
  if not DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    mySQL := Format(glSQL3,[
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZSTATUS').AsInteger,
      DataSet.FieldByName('ZOPENEDBY').AsInteger,
      DataSet.FieldByName('ZOPENEDDATE').AsString,
      DataSet.FieldByName('ZLEVEL').AsInteger,
      DataSet.FieldByName('ZTYPE').AsInteger,
      DataSet.FieldByName('ZASSIGNEDTO').AsInteger,
      DataSet.FieldByName('ZRESULT').AsInteger,
      DataSet.FieldByName('ZTESTRESULTBY').AsInteger,
      //DataSet.FieldByName('ZRESULTDATE').AsString,
      DataSet.FieldByName('ZTESTMETHOD').AsInteger,
      DataSet.FieldByName('ZCASEBUG').AsString,
      DataSet.FieldByName('ZCASETASK').AsString,
      DataSet.FieldByName('ZMAILTO').AsString,
      DataSet.FieldByName('ZPRO_ID').AsInteger,
      DataSet.FieldByName('ZPRO_VER').AsInteger,
      DataSet.FieldByName('ZPRO_SVN').AsInteger,
      DataSet.FieldByName('ZREMORK').AsString,
      DataSet.FieldByName('ZCLOSESTATUS').AsInteger,
      DataSet.FieldByName('ZCLOSESOCRE').AsInteger,
      DataSet.FieldByName('ZDEMAND_ID').AsInteger,
      DataSet.FieldByName('ZSUBMISBY').AsString,
      DataSet.FieldByName('ZID').AsInteger
      ]);
    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));

      //保存到今日贡献内
      if DataSet.FieldByName('ZSTATUS').AsInteger in [Ord(bgsReAction)] then
      begin
        myform := TActivationDlg.Create(nil);
        try
          myform.edtID.Text   := inttostr(DataSet.FieldByName('ZID').AsInteger);
          myform.edtName.Text := DataSet.FieldByName('ZNAME').AsString;
          if myform.ShowModal = mrOk then
          begin
            //写入库内
            myform.fType := 0;
            myform.fAcivate_UserID := DataSet.FieldByName('ZSUBMISBY').AsInteger;
            myform.PostData;
          end;
        finally
          myform.Free;
        end;
      end;

      ClientSystem.fDbOpr.CommitTrans;
      if DataSet.FieldByName('ZSTATUS').AsInteger in [Ord(bgsReAction),
        Ord(bgsClose),Ord(bgsSubmi)] then
        //邮件通知
        Mailto(DataSet.FieldByName('ZMAILTO').AsString);
    except
      ClientSystem.fDbOpr.RollbackTrans;
    end;
  end
  else begin
    myID := ClientSystem.fDbOpr.ReadInt(PChar(glSQL));
    DataSet.FieldByName('ZID').AsInteger := myID;
    mySQL := Format(glSQL2,[
      DataSet.FieldByName('ZID').AsInteger,
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZSTATUS').AsInteger,
      DataSet.FieldByName('ZOPENEDBY').AsInteger,
      //DataSet.FieldByName('ZOPENEDDATE').AsString,
      DataSet.FieldByName('ZLEVEL').AsInteger,
      DataSet.FieldByName('ZTYPE').AsInteger,
      DataSet.FieldByName('ZASSIGNEDTO').AsInteger,
      DataSet.FieldByName('ZRESULT').AsInteger,
      DataSet.FieldByName('ZTESTRESULTBY').AsInteger,
      DataSet.FieldByName('ZRESULTDATE').AsString,
      DataSet.FieldByName('ZTESTMETHOD').AsInteger,
      DataSet.FieldByName('ZCASEBUG').AsString,
      DataSet.FieldByName('ZCASETASK').AsString,
      DataSet.FieldByName('ZMAILTO').AsString,
      DataSet.FieldByName('ZPRO_ID').AsInteger,
      DataSet.FieldByName('ZPRO_VER').AsInteger,
      DataSet.FieldByName('ZPRO_SVN').AsInteger,
      DataSet.FieldByName('ZREMORK').AsString,
      DataSet.FieldByName('ZSUBMISBY').AsString,
      DataSet.FieldByName('ZDEMAND_ID').AsInteger]);

    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      DataSet.FieldByName('ZISNEW').AsBoolean := False;
      ClientSystem.fDbOpr.CommitTrans;
      LoadTestResult(myID);
      //邮件通知,新建时不处理，只有提交测试用例时才处理
      //Mailto(DataSet.FieldByName('ZMAILTO').AsString);
    except
      ClientSystem.fDbOpr.RollbackTrans;
    end;
  end;

end;

procedure TTestManageChildfrm.pgcTestMainChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if (pgcTestMain.ActivePageIndex = 1) and
     (cdsTestItem.State in [dsEdit,dsInsert] ) then
  begin
    MessageBox(Handle,'在编辑状态不能切换页面，否则点取消。','提示',
      MB_ICONWARNING+MB_OK);
    AllowChange := False;
  end;
end;

procedure TTestManageChildfrm.act_SaveExecute(Sender: TObject);
begin
  if cdsTestItem.State in [dsEdit,dsInsert] then
    cdsTestItem.Post;
end;

procedure TTestManageChildfrm.dblcSelectUsermailCloseUp(Sender: TObject);
var
  mystr : String;
  myaddstr : string;
begin
  if (Sender as TDBLookupComboBox).Text = '' then Exit;

  if cdsTestItem.State in [dsBrowse] then
    cdsTestItem.Edit;

  myaddstr := format('%s(%d)',[
      DM.cdsUser.FieldByName('ZNAME').AsString,
      DM.cdsUser.FieldByName('ZID').AsInteger]);

  myStr := cdsTestItem.FieldByName('ZMAILTO').AsString;
  if mystr <> '' then
  begin
    if Pos(myaddstr,mystr) <= 0 then
      myStr := myStr + ';' + myaddstr;
  end
  else
    myStr := myStr + myaddstr;

  cdsTestItem.FieldByName('ZMAILTO').AsString := myStr;
end;

procedure TTestManageChildfrm.act_ProvUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not cdsTestItem.Bof;
end;

procedure TTestManageChildfrm.act_ProvExecute(Sender: TObject);
begin
  cdsTestItem.Prior;
end;

procedure TTestManageChildfrm.act_NextUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not cdsTestItem.Eof;
end;

procedure TTestManageChildfrm.act_NextExecute(Sender: TObject);
begin
  cdsTestItem.Next;
end;

procedure TTestManageChildfrm.cdsTestItemAfterScroll(DataSet: TDataSet);
var
  myID : Integer;
const
  glSQL = 'select ZID,ZVER from TB_PRO_VERSION where ZPRO_ID=%d';
begin
  if fLoading then Exit;
  if pgcTestMain.ActivePageIndex = 0 then Exit;
  if cdsTestItem.IsEmpty then Exit;

  myID := cdsTestItem.FieldByName('ZID').AsInteger;
  LoadTestResult(myID);

  if not cdsTestItem.FieldByName('ZISNEW').AsBoolean then
  begin

    lblTitle.Caption := Format('$%d %s',[
      cdsTestItem.FieldByName('ZID').AsInteger,
      cdsTestItem.FieldByName('ZNAME').AsString]);
    cdsProVer.Data   := ClientSystem.fDbOpr.ReadDataSet(PChar(Format(glSQL,[
      cdsTestItem.FieldByName('ZPRO_ID').AsInteger])));
  end;
end;

procedure TTestManageChildfrm.actResult_AddUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (not
    cdsTestItem.FieldByName('ZISNEW').AsBoolean) and
    cdsResult.Active;
end;

procedure TTestManageChildfrm.actResult_AddExecute(Sender: TObject);
begin
  //
  if not cdsResult.Active then Exit;
  if cdsResult.State in [dsEdit,dsInsert] then
    cdsResult.Post;
  cdsResult.Append;
end;

procedure TTestManageChildfrm.pgcTestMainChange(Sender: TObject);
begin
  cdsTestItemAfterScroll(nil);

end;

procedure TTestManageChildfrm.actResult_SaveExecute(Sender: TObject);
begin
  if cdsResult.State in [dsEdit,dsInsert] then
    cdsResult.Post;
end;

procedure TTestManageChildfrm.actResult_SaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsResult.State in [dsEdit,dsInsert];
end;

procedure TTestManageChildfrm.LoadTestResult(AID: Integer);
var
  i,c : Integer;
  mySQL : string;
  myID : Integer;
  mycds,mycds2 : TClientDataSet;
  myField : TFieldDef;

  myb : Boolean;
const
  glSQL = 'select * from TB_TEST_RESULT where ZTEST_ID=%d';
begin
  myb := fLoading;
  fLoading := True;
  cdsResult.DisableControls;
  try
    if cdsResult.Active then cdsResult.Close;
    cdsResult.Fields.Clear;
    if cdsResult.FieldDefs.Count = 0 then
    begin
      mycds := TClientDataSet.Create(nil);
      mycds.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(format(glSQL,[-1])));
      cdsResult.FieldDefs.Clear;
      cdsResult.FieldDefs.Assign(mycds.FieldDefs);
      with cdsResult.FieldDefs do
      begin
        myField := AddFieldDef;
        myField.Name := 'ZISNEW';   //是否是新增
        myField.DataType := ftBoolean;

        myField := AddFieldDef;
        myField.Name := 'ZMYID';   //ZID值
        myField.DataType := ftInteger;

        myField := AddFieldDef;
        myField.Name := 'ZNO';   //序号
        myField.DataType := ftInteger;

        //创建人
        myField := AddFieldDef;
        myField.Name := 'ZUSERNAME';
        myField.DataType := ftString;
        myField.Size := 30;

        with cdsResult do
        begin
          for i:=0 to FieldDefs.Count -1 do
             FieldDefs[i].CreateField(cdsResult);
        end;
      end;
      cdsResult.CreateDataSet;
      mycds.Free;
    end;
    cdsResult.Open;
    if cdsResult.Active and (not cdsResult.IsEmpty) then
      while not cdsResult.Eof do
        cdsResult.Delete;

    myID := cdsTestItem.FieldByName('ZID').AsInteger;
    mySQL := Format(glSQL,[myID]);

    mycds2 := TClientDataSet.Create(nil);
    mycds2.data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));
    //生成数据
    mycds2.First;
    c := 1;


    while not mycds2.Eof do
    begin

      cdsResult.Append;
      cdsResult.FieldByName('ZISNEW').AsBoolean := False;
      for i:=0 to mycds2.FieldDefs.Count -1 do
      begin
        if mycds2.FieldDefs[i].Name = 'ZID' then
        begin
          cdsResult.FieldByName('ZMYID').AsInteger :=
            mycds2.FieldByName(mycds2.FieldDefs[i].Name).AsVariant;
        end
        else
          cdsResult.FieldByName(mycds2.FieldDefs[i].Name).AsVariant :=
            mycds2.FieldByName(mycds2.FieldDefs[i].Name).AsVariant;
      end;
      cdsResult.FieldByName('ZNO').AsInteger := c ; Inc(c);

      //
      // 显示提交的人，如没有则是创建人自己的
      //
      if (cdsResult.FieldByName('ZUSER_ID').AsInteger <>
         cdsTestItem.FieldByName('ZOPENEDBY').AsInteger) and
        cdsUser.Locate('ZID',cdsResult.FieldByName('ZUSER_ID').AsInteger,
          [loPartialKey]) then
        cdsResult.FieldByName('ZUSERNAME').AsString := cdsUser.FieldByName('ZNAME').AsString;


      cdsResult.Post;
      mycds2.Next;
    end;
    if not cdsResult.IsEmpty then
      cdsResult.First;
    mycds2.Free;

  finally
    fLoading := myb;
    cdsResult.EnableControls;
  end;
end;

procedure TTestManageChildfrm.cdsResultBeforePost(DataSet: TDataSet);
var
  mySQL : string;
const
  glSQL = 'insert TB_TEST_RESULT(ZTEST_ID,ZACTION,ZTRUEVALUE,ZINFACE,ZUSER_ID,ZPASS) values '+
          '(%d,''%s'',''%s'',''%s'',%d,0)';
  glSQL2 = 'update TB_TEST_RESULT set ' +
           'ZACTION=''%s'', ' +
           'ZTRUEVALUE=''%s'', ' +
           'ZINFACE=''%s'', ' +
           'ZUSER_ID=%d,' +
           'ZPASS=%d ' +
           'where ZID=%d';
begin
  //
  if fLoading then Exit;
  if not DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
     mySQL := Format(glSQL2,[
      DataSet.FieldByName('ZACTION').AsString,
      DataSet.FieldByName('ZTRUEVALUE').AsString,
      DataSet.FieldByName('ZINFACE').AsString,
      DataSet.FieldByName('ZUSER_ID').AsInteger,
      Ord(DataSet.FieldByName('ZPASS').AsBoolean),
      DataSet.FieldByName('ZMYID').AsInteger

      ]);
    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      ClientSystem.fDbOpr.CommitTrans;
    except
      ClientSystem.fDbOpr.RollbackTrans;
    end;
  end
  else begin
    mySQL := Format(glSQL,[
      cdsTestItem.FieldByName('ZID').AsInteger,
      DataSet.FieldByName('ZACTION').AsString,
      DataSet.FieldByName('ZTRUEVALUE').AsString,
      DataSet.FieldByName('ZINFACE').AsString,
      DataSet.FieldByName('ZUSER_ID').AsInteger

      ]);

    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      DataSet.FieldByName('ZISNEW').AsBoolean := False;
      ClientSystem.fDbOpr.CommitTrans;
    except
      ClientSystem.fDbOpr.RollbackTrans;
    end;
  end;

end;
procedure TTestManageChildfrm.cdsResultNewRecord(DataSet: TDataSet);
begin
  if fLoading then Exit;

  DataSet.FieldByName('ZISNEW').AsBoolean := True;
  DataSet.FieldByName('ZMYID').AsInteger := -1;
  DataSet.FieldByName('ZNO').AsInteger := -1;
  DataSet.FieldByName('ZUSER_ID').AsInteger := ClientSystem.fEditer_id;
  if ClientSystem.fEditer_id <> cdstestItem.FieldByName('ZOPENEDBY').AsInteger then
    DataSet.FieldByName('ZUSERNAME').AsString := ClientSystem.fEditer;
  DataSet.FieldByName('ZPASS').AsBoolean := False;
end;

procedure TTestManageChildfrm.act_SuccessExecute(Sender: TObject);
begin
  if MessageBox(Handle,'确定测试完成了吗?','提示',
    MB_ICONQUESTION+MB_YESNO)=IDNO then
    Exit;

  if not (cdsTestItem.State in [dsEdit,dsinsert]) then
    cdsTestItem.Edit;
  cdsTestItem.FieldByName('ZSTATUS').AsInteger := Ord(bgsDeath);
  cdsTestItem.FieldByName('ZTESTRESULTBY').AsInteger := ClientSystem.fEditer_id;
  cdsTestItem.FieldByName('ZRESULTDATE').AsDateTime := ClientSystem.fDbOpr.GetSysDateTime;
  cdsTestItem.Post;
end;

procedure TTestManageChildfrm.act_SuccessUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsTestItem.FieldByName('ZSTATUS').AsInteger
    in [Ord(bgsSubmi)];
end;

procedure TTestManageChildfrm.act_ActionUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsTestItem.FieldByName('ZSTATUS').AsInteger
    in [Ord(bgsSubmi),Ord(bgsDeath),Ord(bgsClose)];
end;

procedure TTestManageChildfrm.act_ActionExecute(Sender: TObject);
begin
  if not (cdsTestItem.State in [dsEdit,dsinsert]) then
    cdsTestItem.Edit;
  cdsTestItem.FieldByName('ZSTATUS').AsInteger := Ord(bgsReAction);
  cdsTestItem.FieldByName('ZPRO_SVN').AsInteger := 0;
  cdsTestItem.Post;
end;

procedure TTestManageChildfrm.act_ColseUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsTestItem.FieldByName('ZSTATUS').AsInteger
    in [Ord(bgsDeath),Ord(bgsDeath)];
end;

procedure TTestManageChildfrm.act_ColseExecute(Sender: TObject);
begin
  with TTestCaseSOCREDlg.Create(nil) do
  begin
    cds1.CloneCursor(Self.cdsTestCoseSTATUS,True);
    if ShowModal = mrOk then
    begin
      if not (cdsTestItem.State in [dsEdit,dsinsert]) then
        cdsTestItem.Edit;
      cdsTestItem.FieldByName('ZSTATUS').AsInteger := Ord(bgsClose);
      cdsTestItem.FieldByName('ZCLOSESTATUS').AsInteger := cds1.FieldByName('ZID').AsInteger;
      cdsTestItem.FieldByName('ZCLOSESOCRE').AsInteger := StrToIntDef(edt1.Text,0);
      cdsTestItem.Post;
    end;
  end;
end;

procedure TTestManageChildfrm.dbgrdTestDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

  if (cdsTestItem.RecNo mod 2  = 0) and not ( gdSelected in State)  then
    dbgrdTest.Canvas.Brush.Color := clSilver;

  if (cdsTestItem.FieldByName('ZSTATUS').AsInteger = Ord(bgsClose)) then
  begin
    dbgrdTest.Canvas.Font.Color := clblue;
  end;

  if (cdsTestItem.FieldByName('ZSTATUS').AsInteger in
    [Ord(bgsAction),Ord(bgsReAction)]) then
  begin
    dbgrdTest.Canvas.Font.Style := [fsItalic];
  end;

  case Column.Index of
    2 : //提交人
      if cdsTestItem.FieldByName('ZSUBMISBY').AsInteger =
         ClientSystem.fEditer_id then
      begin
        dbgrdTest.Canvas.Brush.Color := clAqua;
      end;
    3:
      if cdsTestItem.FieldByName('ZASSIGNEDTO').AsInteger =
         ClientSystem.fEditer_id then
      begin
        dbgrdTest.Canvas.Brush.Color := clYellow;
      end;
    4: {等级}
      if (cdsTestItem.FieldByName('ZLEVEL').AsInteger=4) then
      begin
        dbgrdTest.Canvas.Brush.Color := clMaroon;
        dbgrdTest.Canvas.Font.Color  := clwhite;
      end;
    5  :
      if cdsTestItem.FieldByName('ZTESTRESULTBY').AsInteger =
         ClientSystem.fEditer_id then
      begin
        dbgrdTest.Canvas.Brush.Color := clLime;
      end;
  end;

  dbgrdTest.DefaultDrawColumnCell(Rect,DataCol,Column,State);

end;

procedure TTestManageChildfrm.act_FirstPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fTestPageRec.fPageindex <> 1)
  and (fTestPageRec.fCount>0);
end;

procedure TTestManageChildfrm.act_FirstPageExecute(Sender: TObject);
begin
  fTestPageRec.fPageindex :=  1;
  LoadTestItem(fTestPageRec.fPageindex,fTestPageRec.fwhere);
end;

procedure TTestManageChildfrm.act_NextPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fTestPageRec.fPageindex < fTestPageRec.fCount)
  and (fTestPageRec.fCount>0);

end;

procedure TTestManageChildfrm.act_NextPageExecute(Sender: TObject);
begin
  fTestPageRec.fPageindex := fTestPageRec.fPageindex + 1;
  LoadTestItem(fTestPageRec.fPageindex,fTestPageRec.fwhere);
end;

procedure TTestManageChildfrm.act_ProvPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fTestPageRec.fPageindex > 1)
  and (fTestPageRec.fCount>0);
end;

procedure TTestManageChildfrm.act_ProvPageExecute(Sender: TObject);
begin
  fTestPageRec.fPageindex := fTestPageRec.fPageindex - 1;
  LoadTestItem(fTestPageRec.fPageindex,fTestPageRec.fwhere);
end;

procedure TTestManageChildfrm.act_LastPageExecute(Sender: TObject);
begin
  fTestPageRec.fPageindex := fTestPageRec.fCount;
  LoadTestItem(fTestPageRec.fPageindex,fTestPageRec.fwhere);
end;

procedure TTestManageChildfrm.act_LastPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fTestPageRec.fPageindex < fTestPageRec.fCount)
  and (fTestPageRec.fCount>0);
end;

procedure TTestManageChildfrm.act_toMeExecute(Sender: TObject);
begin
  fTestPageRec.fPageindex := 1;
  fTestPageRec.fwhere := Format('ZASSIGNEDTO=%d and ZSTATUS=%d ',
    [ClientSystem.fEditer_id,Ord(bgsSubmi)]);
  fTestPageRec.fCount := GetTestItemPageCount(1,fTestPageRec.fwhere);
  LoadTestItem(fTestPageRec.fPageindex,fTestPageRec.fwhere);
end;

procedure TTestManageChildfrm.act_metestExecute(Sender: TObject);
begin
  fTestPageRec.fPageindex := 1;
  fTestPageRec.fwhere := Format('ZTESTRESULTBY=%d',[ClientSystem.fEditer_id]);
  fTestPageRec.fCount := GetTestItemPageCount(1,fTestPageRec.fwhere);
  LoadTestItem(fTestPageRec.fPageindex,fTestPageRec.fwhere);
end;

procedure TTestManageChildfrm.act_mebuildExecute(Sender: TObject);
begin
  fTestPageRec.fPageindex := 1;
  fTestPageRec.fwhere := Format('ZSUBMISBY=%d',[ClientSystem.fEditer_id]);
  fTestPageRec.fCount := GetTestItemPageCount(1,fTestPageRec.fwhere);
  LoadTestItem(fTestPageRec.fPageindex,fTestPageRec.fwhere);
end;

procedure TTestManageChildfrm.Mailto(AEmailto: String);
var
  i     : integer;
  mysl  : TStringList;
  myStr : String;
  mysv  : TStringList;
  myMails : TStringList;
  myBugID  : integer; //Bug的ID值;
begin
  mysl := TStringList.Create;
  mysv := TStringList.Create;
  myMails := TStringlist.Create;
  ShowProgress('邮件通知...',0);
  try
    myBugID := cdsTestItem.FieldByName('ZID').AsInteger;
    //先加入创建人
    DM.cdsUser.ControlsDisabled;
    try
     
      ClientSystem.SplitStr(AEmailto,mysv,';');
      for i:=0 to  mysv.Count -1 do
      begin
        //如是当前的编辑内都不必要发送了
        if (Trim(mysv.Strings[i])='') or
           (mysv.Strings[i]=Format('%s(%d)',[ClientSystem.fEditer,ClientSystem.fEditer_id])) then
          Continue;
        if mysl.IndexOf(mysv[i]) < 0 then
        begin
          mysl.Add(mysv[i]);
          DM.cdsUser.First;
          while not DM.cdsUser.Eof do
          begin
            myStr := format('%s(%d)',[DM.cdsUser.FieldByName('ZNAME').AsString,
              DM.cdsUser.FieldByName('ZID').AsInteger]);
            if CompareText(myStr,mysv[i]) = 0 then
            begin
              myMails.Add(DM.cdsUser.FieldByName('ZEMAIL').AsString);
              break;
            end;
            DM.cdsUser.Next;
          end;
        end;
      end;

    finally
      DM.cdsUser.EnableControls;
    end;

    //调用接口发送
    mystr := '';
    for i:=0 to myMails.Count -1 do
    begin
      if Trim(myMails[i])='' then Continue;
      if mystr = '' then
        mystr := myMails[i]
      else
        mystr := mystr + ';' + myMails[i];
    end;

    if mystr <> '' then
      ClientSystem.fDbOpr.MailTo(2,myStr,myBugID);
  finally
    mysl.Free;
    mysv.Free;
    myMails.Free;
    HideProgress();
  end;
end;


procedure TTestManageChildfrm.act_NewByBugCodeExecute(Sender: TObject);
var
  mystr : string;
  myBugid : Integer;
  mycds : TClientDataSet;
  mycdsPro : TClientDataSet;
  s,myname : string;
  myuserid : Integer;
const
  glSQL = 'select * from TB_BUG_ITEM where ZID=%d';
  glSQL2 = 'select ZTESTTEAM from TB_PRO_ITEM where ZID=%d';
begin
  //
  if not InputQuery('输入Bug编号','BUG号',mystr) then Exit;

  myBugid := StrToIntdef(mystr,0);
  if myBugid = 0 then
  begin
    MessageBox(Handle,'无效的bug号','提示',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  mycds := TClientDataSet.Create(nil);
  mycdsPro := TClientDataSet.Create(nil);
  try
    mycds.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(format(glSQL,[myBugid])));
    if mycds.RecordCount = 0 then
    begin
      MessageBox(Handle,pChar('查找无bug号 #'+inttostr(myBugid)),'提示',
        MB_ICONWARNING+MB_OK);
      Exit;
    end;

    mycdsPro.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(
      Format(glSQL2,[mycds.FieldByName('ZPRO_ID').AsInteger])));


    if cdsTestItem.State in [dsEdit,dsInsert] then
      cdsTestItem.Post;

    cdsTestItem.First;
    cdsTestItem.Insert;
    cdsTestItem.FieldByName('ZNAME').AsString := mycds.fieldByName('ZTITLE').AsString;
    cdsTestItem.FieldByName('ZDEMAND_ID').AsInteger := mycds.FieldByName('ZDEMAND_ID').AsInteger;
    cdsTestItem.FieldByName('ZTYPE').AsInteger := 0; //功能
    cdsTestItem.FieldByName('ZCASEBUG').AsString := IntToStr(myBugid);
    if mycdsPro.RecordCount > 0 then
    begin
      myuserid := -1;
      s := mycdsPro.fieldByName('ZTESTTEAM').AsString;
      if Pos(';',s) > 0 then
      begin
        myName := Copy(s,1,Pos(';',s)-1);
      end
      else
        myName := s;

      if (myname <> '') and (Pos('(',myname) > 0) and (Pos(')',myname)>0) and
         (Pos(')',myname)>Pos('(',myname) ) then
      begin
        myuserid := StrToIntDef(Copy(myname,
          Pos('(',myname)+1,
          Pos(')',myname)-Pos('(',myname)-1
          ),
          -1);
      end;

      cdsTestItem.FieldByName('ZMAILTO').AsString := s;
      if myuserid <> -1 then
        cdsTestItem.FieldByName('ZASSIGNEDTO').AsInteger := myuserid;
    end;
    cdsTestItem.FieldByName('ZPRO_ID').AsInteger := mycds.fieldByName('ZPRO_ID').AsInteger;
    cdsTestItem.FieldByName('ZPRO_VER').AsInteger := mycds.fieldByName('ZRESOLVEDVER').AsInteger;

    cdsResult.Close;
    pgcTestMain.ActivePageIndex := 1;
  finally
    mycds.Free;
    mycdsPro.Free;
  end;

end;

procedure TTestManageChildfrm.actResult_AddByBugUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not cdsTestItem.IsEmpty and
    (cdsTestItem.FieldByName('ZCASEBUG').AsString <>'')
     and (not cdsTestItem.FieldByName('ZISNEW').AsBoolean) and
    cdsResult.Active;
end;

procedure TTestManageChildfrm.actResult_AddByBugExecute(Sender: TObject);
var
  mybugid : Integer;
  mystr : string;
begin
  mybugid := StrToIntDef(
    cdsTestItem.fieldByName('ZCASEBUG').AsString,-1);
  if mybugid = -1 then Exit;

  if ShowBugHistoryDlg(mybugid,mystr) then
  begin
    if cdsResult.State in [dsEdit,dsinsert] then
      cdsResult.Post;
    cdsResult.Append;
    cdsResult.FieldByName('ZACTION').AsString := mystr;
  end;
end;

procedure TTestManageChildfrm.act_GetBugItemUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not cdsTestItem.IsEmpty and
    (cdsTestItem.FieldByName('ZCASEBUG').AsString <>'')
end;


procedure TTestManageChildfrm.act_GetBugItemExecute(Sender: TObject);
var
  myBugId : Integer;
begin
  myBugId := StrToIntdef(cdsTestItem.FieldByName('ZCASEBUG').AsString,-1);
  if myBugId = -1 then Exit;
  SendMessage(Application.MainForm.Handle,gcMSG_GetBugItem,myBugId,0);
end;

procedure TTestManageChildfrm.act_RefreshDataExecute(Sender: TObject);
var
  myPageindex : integer;
  mywhere : String;
begin
  ShowProgress('读取数据...',0);
  try
    myPageindex := fTestPageRec.fPageindex;
    mywhere := Format(fTestPageRec.fwhere,[ClientSystem.fEditer_id]);
    fTestPageRec.fCount := GetTestItemPageCount(myPageindex,myWhere);
    LoadTestItem(myPageindex,myWhere);
    lblPage.Caption := format('%d/%d',[
      fTestPageRec.fPageindex,
      fTestPageRec.fCount]);
  finally
    Self.HideProgress;
  end;
end;

procedure TTestManageChildfrm.actHighQueryExecute(Sender: TObject);
var
  mywhere : string;
begin
  if not Assigned(fHighQueryDlg) then
  begin
    fHighQueryDlg := TTestHighQueryDlg.Create(nil);
    fHighQueryDlg.cdsPros.CloneCursor(cdsProject,True);
    fHighQueryDlg.cdsCreateor.CloneCursor(DM.cdsUser,True);
    fHighQueryDlg.cdsCoser.CloneCursor(DM.cdsUser,True);
    fHighQueryDlg.cdssubmis.CloneCursor(DM.cdsUser,True);
  end;

  if fHighQueryDlg.ShowModal = mrOK then
  begin
    mywhere := fHighQueryDlg.GetwhereStr();
    if mywhere = '' then Exit;
    fHighQueryDlg.Hide;
    Application.ProcessMessages;
    ShowProgress('读取数据...',0);
    try


      fTestPageRec.fPageindex := 1;
      fTestPageRec.fwhere := mywhere;
      fTestPageRec.fCount := GetTestItemPageCount(fTestPageRec.fPageindex,
        fTestPageRec.fwhere);
      
      LoadTestItem(fTestPageRec.fPageindex,fTestPageRec.fwhere);
      lblPage.Caption := format('%d/%d',[
        fTestPageRec.fPageindex,
        fTestPageRec.fCount]);
    finally
      HideProgress;
    end;
  end;
end;

procedure TTestManageChildfrm.WMShowTestItem(var msg: TMessage);
var
  myPageIndex : Integer;
  myindex : integer;
  mywherestr : string;
  mycount : integer;
begin

  myindex := fTestpageRec.fPageindex;
  mycount := fTestpageRec.fCount;
  mywherestr := fTestpageRec.fwhere;

  try
    fTestPageRec.fwhere := Format('ZID=%d',[msg.WParam]);
    fTestPageRec.fPageindex := 1;
    myPageIndex := 1;
    fTestPageRec.fCount := 1;
    LoadTestItem(myPageindex,fTestPageRec.fwhere);
    lblPage.Caption := format('%d/%d',[
      1,1]);

    if pgcTestMain.ActivePageIndex=0 then
      pgcTestMain.ActivePageIndex := 1;
    LoadTestResult(msg.WParam);

  finally
    fTestpageRec.fPageindex := myindex;
    fTestpageRec.fCount := mycount;
    fTestpageRec.fwhere := mywherestr;
  end;
end;

procedure TTestManageChildfrm.dbctrlgrd1PaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin
  dbtxtZUSERNAME.Visible := cdsResult.FieldByName('ZUSERNAME').AsString <> '';
  if not dbtxtZUSERNAME.Visible and (Index = DBCtrlGrid.PanelIndex) then
  begin
    DBCtrlGrid.Canvas.Brush.Color := DBCtrlGrid.SelectedColor;
    DBCtrlGrid.Canvas.FillRect(DBCtrlGrid.ClientRect);
    DBCtrlGrid.Canvas.FrameRect(DBCtrlGrid.ClientRect);
  end;
end;

procedure TTestManageChildfrm.act_SubbimExecute(Sender: TObject);
var
  myver : string;
begin

  if not (ClientSystem.fEditerType in [etAdmin,etDeve,etTest]) then
  begin
    MessageBox(Handle,'你没有提交测试用例的权限,不能提交','测试',MB_ICONERROR+MB_OK);
    Exit;
  end;

  
  if not (cdsTestItem.State in [dsEdit,dsinsert]) then
    cdsTestItem.Edit;

  if cdsTestItem.FieldByName('ZPRO_SVN').AsInteger = 0 then
  begin
    myver := '0';
    if ShowGetSVNVer(myver) then
      cdsTestItem.FieldByName('ZPRO_SVN').AsInteger :=
        strtointdef(myver,0);
    Application.ProcessMessages;
  end;

  cdsTestItem.FieldByName('ZSUBMISBY').AsInteger := ClientSystem.fEditer_id;
  cdsTestItem.FieldByName('ZSTATUS').AsInteger := Ord(bgsSubmi);
  cdsTestItem.Post;
end;

procedure TTestManageChildfrm.act_SubbimUpdate(Sender: TObject);
begin
  //只有活动的测试用例才能提交
  (Sender as TAction).Enabled := not cdsTestitem.IsEmpty and
  (cdsTestitem.FieldByName('ZSTATUS').AsInteger in [Ord(bgsAction),Ord(bgsReAction)]);
end;

procedure TTestManageChildfrm.actResult_AddSVNVerExecute(Sender: TObject);
var
  mystr : string;
begin
  //
  mystr :=  cdsTestItem.FieldByName('ZPRO_SVN').AsString;
  if ShowGetSVNVer(mystr) then
  begin
    if not (cdsTestItem.State in [dsEdit,dsInsert]) then
      cdsTestItem.Edit;
    cdsTestItem.FieldByName('ZPRO_SVN').AsInteger :=
      strtointdef(mystr,0);
  end;
end;

procedure TTestManageChildfrm.WMShowTestItemCode(var msg: TMessage);
var
  mycodes : string;
  mysl : TStringList;
  i : integer;
  mystr : string;

  myPageIndex : Integer;
  myindex : integer;
  mywherestr : string;
  mycount : integer;
begin
  //
  // 转过来的是 $123;$4555
  //
  mysl := TStringList.Create;
  try
    mycodes := String(msg.LParam);
    mysl.Delimiter := ';';
    mysl.DelimitedText := mycodes;

    mystr := '';
    for i:=0 to mysl.Count -1 do
    begin
      if (Length(mysl[i])>0) and (mysl[i][1] = '$') then
      begin
        if mystr = '' then
          mystr := format('(ZID=%d)',[strtointdef(Copy(mysl.Strings[i],2,maxint),0)])
        else
          mystr := mystr + ' or ' + format('(ZID=%d)',[strtointdef(Copy(mysl.Strings[i],2,maxint),0)]);
      end;
    end;

    myindex := fTestpageRec.fPageindex;
    mycount := fTestpageRec.fCount;
    mywherestr := fTestpageRec.fwhere;

    try
      fTestPageRec.fwhere := mystr;
      fTestPageRec.fPageindex := 1;
      myPageIndex := 1;
      fTestPageRec.fCount := 1;
      LoadTestItem(myPageindex,fTestPageRec.fwhere);
      lblPage.Caption := format('%d/%d',[
        1,1]);

        
      if cdsTestItem.RecordCount > 0 then
      begin
        if pgcTestMain.ActivePageIndex=0 then
          pgcTestMain.ActivePageIndex := 1;
        LoadTestResult(msg.WParam);
      end;

    finally
      fTestpageRec.fPageindex := myindex;
      fTestpageRec.fCount := mycount;
      fTestpageRec.fwhere := mywherestr;
    end;

  finally
    mysl.Free;
  end;
end;

procedure TTestManageChildfrm.act_newByPlanCodeExecute(Sender: TObject);
var
  mystr : string;
  myPlanid : Integer;
  mycds : TClientDataSet;
  mycdsPro : TClientDataSet;
const
  glSQL  = 'select ZITEM_GUID,ZNAME from TB_PLAN_DETAIL where ZID=%d';
  glSQL2 = 'select b.ZPRO_ID,b.ZMEMBER from TB_PLAN_ITEM as a, TB_PLAN as b ' +
           ' where a.ZPLAN_GUID=b.ZGUID and a.ZGUID=''%s''';
begin
  //
  if not InputQuery('输入子任务编号','子任务号',mystr) then Exit;

  myPlanid := StrToIntdef(mystr,0);
  if myPlanid = 0 then
  begin
    MessageBox(Handle,'无效的子任务号','提示',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  mycds    := TClientDataSet.Create(nil);
  mycdsPro := TClientDataSet.Create(nil);
  try
    mycds.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(format(glSQL,[myPlanid])));
    if mycds.RecordCount = 0 then
    begin
      MessageBox(Handle,pChar('查找无子任务号 &'+inttostr(myPlanid)),'提示',
        MB_ICONWARNING+MB_OK);
      Exit;
    end;

    mycdsPro.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(
      Format(glSQL2,[mycds.FieldByName('ZITEM_GUID').AsString])));

    if cdsTestItem.State in [dsEdit,dsInsert] then
      cdsTestItem.Post;

    cdsTestItem.First;
    cdsTestItem.Insert;
    cdsTestItem.FieldByName('ZNAME').AsString := mycds.fieldByName('ZNAME').AsString;
    cdsTestItem.FieldByName('ZTYPE').AsInteger := 0; //功能
    cdsTestItem.FieldByName('ZCASETASK').AsString := IntToStr(myPlanid);
    if mycdsPro.RecordCount > 0 then
    begin
      cdsTestItem.FieldByName('ZMAILTO').AsString :=
        mycdsPro.fieldByName('ZMEMBER').AsString;;
    end;
    cdsTestItem.FieldByName('ZPRO_ID').AsInteger  := mycdsPro.fieldByName('ZPRO_ID').AsInteger;

    cdsResult.Close;
    pgcTestMain.ActivePageIndex := 1;
  finally
    mycds.Free;
    mycdsPro.Free;
  end;
end;


procedure TTestManageChildfrm.act_GetPlanItemExecute(Sender: TObject);
var
  myPlanId : Integer;
begin
  myPlanId := StrToIntdef(cdsTestItem.FieldByName('ZCASETASK').AsString,-1);
  if myPlanId = -1 then Exit;
  SendMessage(Application.MainForm.Handle,gcMSG_GetPlanItem,myPlanId,0);
end;

procedure TTestManageChildfrm.act_GetPlanItemUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not cdsTestItem.IsEmpty and
    (cdsTestItem.FieldByName('ZCASETASK').AsString <>'')
end;

procedure TTestManageChildfrm.cdsResultAfterEdit(DataSet: TDataSet);
begin
  if fLoading then Exit;
  
  if (not DataSet.FieldByName('ZPASS').AsBoolean) and
     (DataSet.FieldByName('ZINFACE').AsString='') then
  DataSet.FieldByName('ZINFACE').AsString :=
    DataSet.FieldByName('ZTRUEVALUE').AsString;
end;

procedure TTestManageChildfrm.act_AddDataExecute(Sender: TObject);
begin
  fTestPageRec.fPageindex := 1;
  fTestPageRec.fwhere := '1=1';
  fTestPageRec.fCount := GetTestItemPageCount(1,'1=1');
  LoadTestItem(fTestPageRec.fPageindex,fTestPageRec.fwhere);
end;

procedure TTestManageChildfrm.act_gotoDemandUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (cdsTestItem.FieldByName('ZDEMAND_ID').AsInteger>0);
end;

procedure TTestManageChildfrm.act_gotoDemandExecute(Sender: TObject);
var
  myZID : Integer;
begin
  myZID := cdsTestItem.FieldByName('ZDEMAND_ID').AsInteger;
  if myZID = -1 then Exit;
  SendMessage(Application.MainForm.Handle,gcMSG_GetDemandItem,myZID,0);
end;

end.
