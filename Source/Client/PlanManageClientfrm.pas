////////////////////////////////////////////////////////////////////////////////
//
// 项目: 项目管理
// 模块: 项目计划
// 作者: 龙仕云 创建时间: 2008-11-30
//
//
// 修改:       
//
//
//
////////////////////////////////////////////////////////////////////////////////
unit PlanManageClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseChildfrm, ExtCtrls, Grids, DBGrids, ComCtrls, DB, DBClient,
  ActnList, StdCtrls, Buttons, DBCtrls, Mask, dbcgrids, ImgList,
  ClientTypeUnits;

type
  TPlanStatus = (ps_doing,ps_success,ps_over,ps_close,ps_waiting,ps_reaction);

  TPlanPageRec = record
    fCount : integer;
    fPageindex : integer;
    fwhere : string;
  end;

  TPlanItemPageRec = record
    fCount : integer;
    fPageindex : integer;
    fwhere : string;
  end;

  PPlanRec = ^TPlanRec;
  TPlanRec = record
    fName : string;
    fGUID : string;
  end;

  TPlanManageClientDlg = class(TBaseChildDlg)
    pnlonvisible: TPanel;
    spl1: TSplitter;
    pnl1: TPanel;
    pgcplan: TPageControl;
    tsPlanItem: TTabSheet;
    tsPlanDetial: TTabSheet;
    tsPlan: TTabSheet;
    pnlPlanBottom: TPanel;
    cdsPlan: TClientDataSet;
    dsPlan: TDataSource;
    actlst1: TActionList;
    actPan_Add: TAction;
    actPan_success: TAction;
    actPan_CLOSE: TAction;
    btnPan_Add: TBitBtn;
    btnPan_success: TBitBtn;
    btnPan_CLOSE: TBitBtn;
    cdsPlanStauts: TClientDataSet;
    actPan_Save: TAction;
    btnPan_Save: TBitBtn;
    pnl2: TPanel;
    cdsPlanItem: TClientDataSet;
    cdstemp: TClientDataSet;
    actPan_FirstPage: TAction;
    actPan_Propage: TAction;
    actPan_NextPage: TAction;
    actPan_LastPage: TAction;
    il1: TImageList;
    pnlPlanItemTop: TPanel;
    dbtxtZNAME: TDBText;
    dbgrdPlanItem: TDBGrid;
    btnItem_Add: TBitBtn;
    btnItem_Success: TBitBtn;
    btnItem_Close: TBitBtn;
    btnItem_Action: TBitBtn;
    dsPlanItem: TDataSource;
    dbtxtZNAME1: TDBText;
    scrlbx1: TScrollBox;
    spl2: TSplitter;
    pnlPlanDetail: TPanel;
    pnlPlanDetailTop: TPanel;
    lbl8: TLabel;
    dbedtZNAME1: TDBEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    dblkcbbZMAINDEVENAME: TDBLookupComboBox;
    dbedtZFBDATE: TDBEdit;
    dbedtZFBDATE1: TDBEdit;
    dbedtZFEDATE: TDBEdit;
    dbedtZFBDATE2: TDBEdit;
    lbl14: TLabel;
    dbedtZREMARK: TDBEdit;
    lbl15: TLabel;
    dbedtZSUCCESSRATE: TDBEdit;
    btnItem_Save: TBitBtn;
    btnItem_Cancel: TBitBtn;
    btnItem_Piro: TBitBtn;
    btnItem_Next: TBitBtn;
    actItem_Add: TAction;
    actItem_Success: TAction;
    actItem_Close: TAction;
    actItem_Save: TAction;
    actItem_Cancel: TAction;
    actItem_PiroPage: TAction;
    actItem_Next: TAction;
    actItem_Action: TAction;
    btnDetail_Add: TBitBtn;
    btnDetail_SUCCESS: TBitBtn;
    btnDetail_Colse: TBitBtn;
    cdsPlanDetail: TClientDataSet;
    dsPlanDetail: TDataSource;
    lbl17: TLabel;
    dbgrdDetail: TDBGrid;
    spl3: TSplitter;
    actDetail_Add: TAction;
    actDetail_SUCCESS: TAction;
    actDetail_Colse: TAction;
    actDetail_Action: TAction;
    btnDetail_Action: TBitBtn;
    btnDetail_Save: TBitBtn;
    actDetail_Save: TAction;
    pnl3: TPanel;
    dbmmoZCONTENT: TDBMemo;
    dbedtZSORT: TDBEdit;
    actPan_Action: TAction;
    btnPan_Action: TBitBtn;
    pnl4: TPanel;
    dbtxtZID: TDBText;
    lbl7: TLabel;
    lbl1: TLabel;
    dbedtZNAME: TDBEdit;
    lbl6: TLabel;
    dbedtZPRO_ID: TDBEdit;
    lbl3: TLabel;
    dbtxtZBUILDDATE: TDBText;
    dbtxtZSTATUSNAME: TDBText;
    lbl2: TLabel;
    dblkcbbZPMNAME: TDBLookupComboBox;
    lbl4: TLabel;
    lbl5: TLabel;
    dbmmoZSUMTEXT: TDBMemo;
    pnl5: TPanel;
    lbl18: TLabel;
    dblkcbbZSTATUSNAME: TDBLookupComboBox;
    lbl16: TLabel;
    dbedtZNAME2: TDBEdit;
    lbl20: TLabel;
    dbedtZSOCRE: TDBEdit;
    lbl19: TLabel;
    dbtxtZSTATUSNAME1: TDBText;
    lstPlanGUID: TListBox;
    pgc1: TPageControl;
    ts1: TTabSheet;
    tvPlan: TTreeView;
    pnlpageIndex: TPanel;
    btnPan_FirstPage: TSpeedButton;
    btnPan_Propage: TSpeedButton;
    btnPan_NextPage: TSpeedButton;
    btnPan_LastPage: TSpeedButton;
    lblPlanPage: TLabel;
    lbl21: TLabel;
    dbedtZMEMBER: TDBEdit;
    lbl22: TLabel;
    dblkcbb1: TDBLookupComboBox;
    pnlTestCase: TPanel;
    lbl23: TLabel;
    dbedtZTESTCASE: TDBEdit;
    btnGotoTest: TBitBtn;
    pnlPlanPage: TPanel;
    actItem_firstPage: TAction;
    actItme_ProvPage: TAction;
    actItem_NextPage: TAction;
    actItem_LastPage: TAction;
    btnItem_firstPage: TBitBtn;
    btnItem_PiroPage: TBitBtn;
    btnItem_NextPage: TBitBtn;
    btnItem_LastPage: TBitBtn;
    lblItemPage: TLabel;
    actItem_RefreshData: TAction;
    btnItem_RefreshData: TBitBtn;
    actItem_Starting: TAction;
    btnItem_Starting: TBitBtn;
    actItem_Waiting: TAction;
    btnItem_Waiting: TBitBtn;
    chkEdit: TCheckBox;
    lbl24: TLabel;
    dbedtZPROJECTT: TDBEdit;
    procedure cdsPlanNewRecord(DataSet: TDataSet);
    procedure actPan_SaveUpdate(Sender: TObject);
    procedure actPan_SaveExecute(Sender: TObject);
    procedure actPan_AddUpdate(Sender: TObject);
    procedure actPan_AddExecute(Sender: TObject);
    procedure cdsPlanBeforePost(DataSet: TDataSet);
    procedure actPan_FirstPageExecute(Sender: TObject);
    procedure actPan_FirstPageUpdate(Sender: TObject);
    procedure actPan_PropageExecute(Sender: TObject);
    procedure actPan_PropageUpdate(Sender: TObject);
    procedure actPan_NextPageExecute(Sender: TObject);
    procedure actPan_NextPageUpdate(Sender: TObject);
    procedure actPan_LastPageExecute(Sender: TObject);
    procedure actPan_LastPageUpdate(Sender: TObject);
    procedure cdsPlanItemCalcFields(DataSet: TDataSet);
    procedure cdsPlanItemNewRecord(DataSet: TDataSet);
    procedure actItem_AddUpdate(Sender: TObject);
    procedure actItem_AddExecute(Sender: TObject);
    procedure pgcplanChanging(Sender: TObject; var AllowChange: Boolean);
    procedure actItem_CancelUpdate(Sender: TObject);
    procedure actItem_SaveUpdate(Sender: TObject);
    procedure actItem_CancelExecute(Sender: TObject);
    procedure actItem_SaveExecute(Sender: TObject);
    procedure cdsPlanItemBeforePost(DataSet: TDataSet);
    procedure actItem_SuccessExecute(Sender: TObject);
    procedure actItem_ActionUpdate(Sender: TObject);
    procedure actItem_SuccessUpdate(Sender: TObject);
    procedure actItem_CloseUpdate(Sender: TObject);
    procedure actItem_CloseExecute(Sender: TObject);
    procedure actItem_ActionExecute(Sender: TObject);
    procedure dbgrdPlanItemDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure cdsPlanDetailNewRecord(DataSet: TDataSet);
    procedure actDetail_AddUpdate(Sender: TObject);
    procedure actDetail_SaveUpdate(Sender: TObject);
    procedure actDetail_SaveExecute(Sender: TObject);
    procedure dbgrdDetailDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure actDetail_AddExecute(Sender: TObject);
    procedure cdsPlanDetailBeforePost(DataSet: TDataSet);
    procedure pgcplanChange(Sender: TObject);
    procedure actItem_PiroPageExecute(Sender: TObject);
    procedure actItem_PiroPageUpdate(Sender: TObject);
    procedure actItem_NextUpdate(Sender: TObject);
    procedure actItem_NextExecute(Sender: TObject);
    procedure actDetail_SUCCESSExecute(Sender: TObject);
    procedure actDetail_SUCCESSUpdate(Sender: TObject);
    procedure actDetail_ColseUpdate(Sender: TObject);
    procedure actDetail_ColseExecute(Sender: TObject);
    procedure actDetail_ActionExecute(Sender: TObject);
    procedure actDetail_ActionUpdate(Sender: TObject);
    procedure actPan_successExecute(Sender: TObject);
    procedure actPan_successUpdate(Sender: TObject);
    procedure actPan_CLOSEUpdate(Sender: TObject);
    procedure actPan_CLOSEExecute(Sender: TObject);
    procedure actPan_ActionUpdate(Sender: TObject);
    procedure actPan_ActionExecute(Sender: TObject);
    procedure cdsPlanAfterScroll(DataSet: TDataSet);
    procedure tvPlanChange(Sender: TObject; Node: TTreeNode);
    procedure tvPlanChanging(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure tvPlanCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure dblkcbb1CloseUp(Sender: TObject);
    procedure actItem_firstPageExecute(Sender: TObject);
    procedure actItem_firstPageUpdate(Sender: TObject);
    procedure actItme_ProvPageUpdate(Sender: TObject);
    procedure actItme_ProvPageExecute(Sender: TObject);
    procedure actItem_NextPageUpdate(Sender: TObject);
    procedure actItem_NextPageExecute(Sender: TObject);
    procedure actItem_LastPageUpdate(Sender: TObject);
    procedure actItem_LastPageExecute(Sender: TObject);
    procedure actItem_RefreshDataExecute(Sender: TObject);
    procedure btnGotoTestClick(Sender: TObject);
    procedure actItem_RefreshDataUpdate(Sender: TObject);
    procedure actItem_StartingExecute(Sender: TObject);
    procedure actItem_StartingUpdate(Sender: TObject);
    procedure actItem_WaitingExecute(Sender: TObject);
    procedure actItem_WaitingUpdate(Sender: TObject);
    procedure chkEditClick(Sender: TObject);
  private
    { Private declarations }
    fPlanPageRec : TPlanPageRec;
    fPlanItemPageRec : TPlanItemPageRec;

    //加载项目
    procedure LoadPlan(APageIndex: integer; Awhere: String);
    function  GetPlanPageCount(APageIndex:integer;AWhereStr:String):integer;

    procedure LoadPlanItem(APageIndex: integer; Awhere: String);
    function  GetPlanItemPageCount(APageIndex:integer;AWhereStr:String):integer;
    procedure LoadPlanDetail(AGUID:string);

    //直接显示子任务用
    procedure WMShowPlanItem(var msg:TMessage); message gcMSG_GetPlanItem;
   

  public
    { Public declarations }
    procedure initBase; override;
    procedure freeBase; override;
    procedure Showfrm ; override;  //显示后发生的事件
    procedure Closefrm; override;  //关闭显示发生的事件
    class function GetModuleID : integer;override;
  end;


implementation
uses
  ClinetSystemUnits, DmUints;

{$R *.dfm}

{ TPlanManageClientDlg }

procedure TPlanManageClientDlg.Closefrm;
begin
  inherited;
  
end;

procedure TPlanManageClientDlg.freeBase;
begin
  inherited;

end;

class function TPlanManageClientDlg.GetModuleID: integer;
begin
  Result := Ord(mtPlan);
end;

procedure TPlanManageClientDlg.initBase;
var
  i : Integer;
  mycds,mycds2 : TClientDataSet;
  myfield : TFieldDef;
const
  glSQL2 = 'select * from TB_PLAN where 1=0 order by ZBUILDDATE desc';
  glSQL1 = 'select ZID,ZNAME from TB_PLAN_PARAMS where ZTYPE=%d';
  glSQL3 = 'select * from TB_PLAN_ITEM where 1=0 order by ZSORT';
  glSQL4 = 'select * from TB_PLAN_DETAIL where 1=0';
begin
  inherited;
  cdsPlanStauts.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(Format(glSQL1,[0])));

  mycds := TClientDataSet.Create(nil);
  try
    mycds.data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL2));

    if cdsPlan.Active then
      cdsPlan.Close;
    cdsPlan.FieldDefs.Clear;
    cdsPlan.FieldDefs.Assign(mycds.FieldDefs);
    with cdsPlan.FieldDefs do
    begin
      myField := AddFieldDef;
      myField.Name := 'ZISNEW';   //是否是新增
      myField.DataType := ftBoolean;

      myField := AddFieldDef;
      myField.Name := 'ZAUTOID';   //是否是新增
      myField.DataType := ftInteger;
      with cdsPlan do
      begin
        for i:=0 to FieldDefs.Count -1 do
           FieldDefs[i].CreateField(cdsPlan);
      end;

      //创建人
      myField := AddFieldDef;
      myField.Name := 'ZPMNAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsPlan) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZPM';
        LookupDataSet := DM.cdsUser;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

      //关闭的状态
      myField := AddFieldDef;
      myField.Name := 'ZSTATUSNAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsPlan) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZSTATUS';
        LookupDataSet := cdsPlanStauts;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

    end;
    cdsPlan.CreateDataSet;

    fPlanPageRec.fCount := GetPlanPageCount(1,'1=1');
    fPlanPageRec.fwhere := '1=1';
    fPlanPageRec.fPageindex := 1;
    LoadPlan(1,'1=1');
    
  finally
    mycds.Free;
  end;

  //
  // 项目任务
  //
  fPlanItemPageRec.fwhere := '1=1';
  mycds2 := TClientDataSet.Create(nil);
  try
    mycds2.data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL3));

    if cdsPlanItem.Active then
      cdsPlanItem.Close;
    cdsPlanItem.FieldDefs.Clear;
    cdsPlanItem.FieldDefs.Assign(mycds2.FieldDefs);
    with cdsPlanItem.FieldDefs do
    begin
      myField := AddFieldDef;
      myField.Name := 'ZISNEW';   //是否是新增
      myField.DataType := ftBoolean;
      with cdsPlanItem do
      begin
        for i:=0 to FieldDefs.Count -1 do
           FieldDefs[i].CreateField(cdsPlan);
      end;

      //主要负责人
      myField := AddFieldDef;
      myField.Name := 'ZMAINDEVENAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsPlanItem) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZMAINDEVE';
        LookupDataSet := DM.cdsUser;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

      //状态
      myField := AddFieldDef;
      myField.Name := 'ZSTATUSNAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsPlanItem) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZSTATUS';
        LookupDataSet := cdsPlanStauts;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

      //完成比例
      myField := AddFieldDef;
      myField.Name := 'ZSUCCESSRATE';
      myField.DataType := ftInteger;
      with myfield.CreateField(cdsPlanItem) do
      begin
        FieldKind := fkCalculated;
      end;
    end;
    cdsPlanItem.CreateDataSet;

    if cdsPlan.RecordCount > 0 then
    begin
      fPlanItemPageRec.fPageindex := 1;
      fPlanItemPageRec.fwhere  := format('ZPLAN_GUID=''''%s''''',[
        cdsPlan.FieldByName('ZGUID').AsString]);
      fPlanItemPageRec.fCount := GetPlanItemPageCount(fPlanItemPageRec.fPageindex,
        fPlanItemPageRec.fwhere);
      lblItemPage.Caption := format('%d/%d',[1,fPlanItemPageRec.fCount]);
      LoadPlanItem(fPlanItemPageRec.fPageindex,
        fPlanItemPageRec.fwhere);
    end;
    
  finally
    mycds2.Free;
  end;

  //
  //明细
  //
  mycds2 := TClientDataSet.Create(nil);
  try
    mycds2.data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL4));

    if cdsPlanDetail.Active then
      cdsPlanDetail.Close;
    cdsPlanDetail.FieldDefs.Clear;
    cdsPlanDetail.FieldDefs.Assign(mycds2.FieldDefs);
    with cdsPlanDetail.FieldDefs do
    begin
      myField := AddFieldDef;
      myField.Name := 'ZISNEW';   //是否是新增
      myField.DataType := ftBoolean;
      with cdsPlanDetail do
      begin
        for i:=0 to FieldDefs.Count -1 do
           FieldDefs[i].CreateField(cdsPlanDetail);
      end;

      //负责人
      myField := AddFieldDef;
      myField.Name := 'ZDEVENAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsPlanDetail) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZDEVE';
        LookupDataSet := DM.cdsUser;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

      //状态
      myField := AddFieldDef;
      myField.Name := 'ZSTATUSNAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsPlanDetail) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZSTATUS';
        LookupDataSet := cdsPlanStauts;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;
    end;
    cdsPlanDetail.CreateDataSet;
   
  finally
    mycds2.Free;
  end;
end;

procedure TPlanManageClientDlg.Showfrm;
begin
  inherited;

end;

procedure TPlanManageClientDlg.cdsPlanNewRecord(DataSet: TDataSet);
begin
  if fLoading then Exit;
  DataSet.FieldByName('ZGUID').AsString := NewGuid;
  DataSet.FieldByName('ZBUILDDATE').AsDateTime := ClientSystem.fDbOpr.GetSysDateTime;
  DataSet.FieldByName('ZSTATUS').AsInteger := Ord(ps_doing);
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
end;

procedure TPlanManageClientDlg.actPan_SaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsPlan.State in [dsEdit,dsInsert];
end;

procedure TPlanManageClientDlg.actPan_SaveExecute(Sender: TObject);
begin
  if (ClientSystem.fEditerType=etAdmin) or
     (ClientSystem.fEditer_id = cdsPlan.FieldByName('ZPM').AsInteger) then
    cdsPlan.Post
  else begin
    MessageBox(Handle,'你没有修改的权限','修改',MB_ICONWARNING+MB_OK);
    cdsPlan.Cancel;
  end;

end;

procedure TPlanManageClientDlg.actPan_AddUpdate(Sender: TObject);
begin
 (Sender as TAction).Enabled := not (cdsPlan.State in [dsEdit,dsInsert])
  and (ClientSystem.fEditerType=etAdmin);
end;

procedure TPlanManageClientDlg.actPan_AddExecute(Sender: TObject);
begin
  cdsPlan.Append;
end;

procedure TPlanManageClientDlg.cdsPlanBeforePost(DataSet: TDataSet);
var
  mySQL : string;
const
  gl_SQLTXT1 = 'insert TB_PLAN (ZGUID,ZNAME,ZSTATUS,ZPRO_ID,ZSUMTEXT,'
     +'ZPM,ZBUILDDATE,ZMEMBER) values(''%s'',''%s'',%d,%d,''%s'',%d,''%s'',''%s'')';
  gl_SQLTXT2  = 'update TB_PLAN set ZNAME=''%s'',ZSTATUS=%d,ZPRO_ID=%d, '
     + 'ZSUMTEXT=''%s'' where ZGUID=''%s''';

  //管理员提交
  gl_SQLTXT3  = 'update TB_PLAN set ZNAME=''%s'',ZSTATUS=%d,ZPRO_ID=%d, '
     + 'ZSUMTEXT=''%s'',ZPM=%d,ZMEMBER=''%s'' where ZGUID=''%s''';
begin
  if fLoading then Exit;
  //保存
  if DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    mySQL := Format(gl_SQLTXT1,[
      DataSet.FieldByName('ZGUID').AsString,
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZSTATUS').AsInteger,
      DataSet.FieldByName('ZPRO_ID').AsInteger,
      DataSet.FieldByName('ZSUMTEXT').AsString,
      DataSet.FieldByName('ZPM').AsInteger,
      DataSet.FieldByName('ZBUILDDATE').AsString,
      DataSet.FieldByName('ZMEMBER').AsString
      ]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
    DataSet.FieldByName('ZISNEW').AsBoolean := False;
    tvPlan.Items.AddChild(nil,DataSet.FieldByName('ZNAME').AsString);
    lstPlanGUID.Items.Add(DataSet.FieldByName('ZGUID').AsString);
  end
  else begin
    if ClientSystem.fEditerType = etAdmin then
    begin
      mySQL := Format(gl_SQLTXT3,[
        DataSet.FieldByName('ZNAME').AsString,
        DataSet.FieldByName('ZSTATUS').AsInteger,
        DataSet.FieldByName('ZPRO_ID').AsInteger,
        DataSet.FieldByName('ZSUMTEXT').AsString,
        DataSet.FieldByName('ZPM').AsInteger,
        DataSet.FieldByName('ZMEMBER').AsString,
        DataSet.FieldByName('ZGUID').AsString]);
    end
    else begin
      mySQL := Format(gl_SQLTXT2,[
        DataSet.FieldByName('ZNAME').AsString,
        DataSet.FieldByName('ZSTATUS').AsInteger,
        DataSet.FieldByName('ZPRO_ID').AsInteger,
        DataSet.FieldByName('ZSUMTEXT').AsString,
        DataSet.FieldByName('ZGUID').AsString]);
    end;

    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));

    if Assigned(tvPlan.Selected) then
      tvPlan.Selected.Text := DataSet.FieldByName('ZNAME').AsString;
  end;
end;

function TPlanManageClientDlg.GetPlanPageCount(APageIndex: integer;
  AWhereStr: String): integer;
var
  mySQL  : string;
  myRowCount : integer;
  mywhere : string;
const
  glSQL = 'exec pt_SplitPage ''TB_PLAN'',' +
          '''ZBUILDDATE'', ''%s'',20,%d,%d,1,''%s''';
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

procedure TPlanManageClientDlg.LoadPlan(APageIndex: integer;
  Awhere: String);
var
  mySQL  : string;
  i : integer;
  myb : Boolean;
  myNode : TTreeNode;
  myUserName : string;
const
    glSQL = 'exec pt_SplitPage ''TB_PLAN'',' +
          '''ZGUID,ZID,ZNAME,ZSTATUS,ZPRO_ID,ZSUMTEXT,ZPM,ZBUILDDATE,ZMEMBER'', ' +
          '''%s'',20,%d,%d,1,''%s''';
begin

  mySQL := format(glSQL,[
      'ZBUILDDATE',
      APageIndex,
      0,Awhere]);

  myb := fLoading;
  fLoading := True;
  cdsPlan.DisableControls;
  lstPlanGUID.Items.Clear;
  tvPlan.Items.BeginUpdate;


  ShowProgress('读取数据...',0);
  
  try
    tvPlan.Items.Clear;
    lblPlanPage.Caption := format('%d/%d',[fPlanPageRec.fPageindex,
      fPlanPageRec.fCount]);
      
    if cdsTemp.Active then cdsTemp.Close;
    cdsTemp.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));

    while not cdsPlan.IsEmpty do
      cdsPlan.Delete;

    //生成数据
    cdsTemp.First;
    while not cdsTemp.Eof do
    begin
      //
      // 处理权限,没有权限不能加载了
      //
      // 权限改为是否是成员,成员可以进来
      //
      myUserName := format('%s(%d)',[ClientSystem.fEditer,
        ClientSystem.fEditer_id]);
      if (ClientSystem.fEditerType <>etAdmin) and
         (Pos(myUserName,cdstemp.FieldByName('ZMEMBER').AsString)=0) then

      //if not HasModuleAction(Ord(psTree),
      //  cdstemp.FieldByName('ZID').AsInteger,atView) then
      begin
        cdstemp.Next;
        Continue;
      end;

      lstPlanGUID.Items.Add(cdstemp.FieldByName('ZGUID').AsString);
      myNode := tvPlan.Items.AddChild(nil,cdstemp.FieldByName('ZNAME').AsString);
      myNode.ImageIndex := 0;
      myNode.SelectedIndex := 7;
      myNode.Data := PInteger(cdstemp.FieldByName('ZSTATUS').AsInteger);

      cdsPlan.Append;
      cdsPlan.FieldByName('ZISNEW').AsBoolean := False;
      for i:=0 to cdsTemp.FieldDefs.Count -1 do
      begin
        if cdstemp.FieldDefs[i].Name = 'ZID' then
          cdsPlan.FieldByName('ZAUTOID').AsInteger :=
            cdsTemp.FieldByName(cdsTemp.FieldDefs[i].Name).AsInteger
        else
          cdsPlan.FieldByName(cdsTemp.FieldDefs[i].Name).AsVariant :=
            cdsTemp.FieldByName(cdsTemp.FieldDefs[i].Name).AsVariant;
      end;
      cdsPlan.Post;
      cdsTemp.Next;
    end;
    cdsPlan.First;

  finally
    cdsPlan.EnableControls;
    fLoading := myb;
    HideProgress;
    tvPlan.Items.EndUpdate;
  end;
end;

procedure TPlanManageClientDlg.actPan_FirstPageExecute(Sender: TObject);
begin
  fPlanPageRec.fPageindex :=  1;
  LoadPlan(fPlanPageRec.fPageindex,fPlanPageRec.fwhere);
end;

procedure TPlanManageClientDlg.actPan_FirstPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fPlanPageRec.fPageindex <> 1)
  and (fPlanPageRec.fCount>0);
end;

procedure TPlanManageClientDlg.actPan_PropageExecute(Sender: TObject);
begin
  fPlanPageRec.fPageindex :=  fPlanPageRec.fPageindex-1;
  LoadPlan(fPlanPageRec.fPageindex,fPlanPageRec.fwhere);
end;

procedure TPlanManageClientDlg.actPan_PropageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fPlanPageRec.fPageindex > 1)
  and (fPlanPageRec.fCount>0);
end;

procedure TPlanManageClientDlg.actPan_NextPageExecute(Sender: TObject);
begin
  fPlanPageRec.fPageindex :=  fPlanPageRec.fPageindex+1;
  LoadPlan(fPlanPageRec.fPageindex,fPlanPageRec.fwhere);
end;

procedure TPlanManageClientDlg.actPan_NextPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fPlanPageRec.fPageindex < fPlanPageRec.fCount )
  and (fPlanPageRec.fCount>0);
end;

procedure TPlanManageClientDlg.actPan_LastPageExecute(Sender: TObject);
begin
  fPlanPageRec.fPageindex :=  fPlanPageRec.fCount;
  LoadPlan(fPlanPageRec.fPageindex,fPlanPageRec.fwhere);
end;

procedure TPlanManageClientDlg.actPan_LastPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fPlanPageRec.fPageindex <> fPlanPageRec.fCount )
  and (fPlanPageRec.fCount>0);
end;

procedure TPlanManageClientDlg.LoadPlanItem(APageIndex: integer; Awhere: String);
var
  mySQL  : string;
  i : integer;
  myb : Boolean;
const
  glSQL = 'exec pt_SplitPage ''TB_PLAN_ITEM'',' +
          '''ZGUID,ZPLAN_GUID,ZNAME,ZSTATUS,ZPBDATE,ZPEDATE,ZFBDATE,ZFEDATE,'+
          'ZCHILDCOUNT,ZPASSCOUNT,ZMAINDEVE,ZSORT,ZREMARK,ZPROJECTTIME'', ' +
          '''%s'',20,%d,%d,0,''%s''';
begin

  mySQL := format(glSQL,[
      'ZSORT',
      APageIndex,
      0,Awhere]);

  myb := fLoading;
  fLoading := True;
  cdsPlanItem.DisableControls;
  ShowProgress('读取数据...',0);
  ClientSystem.BeginTickCount;
  try

    if cdsTemp.Active then cdsTemp.Close;
    cdsTemp.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));

    while not cdsPlanItem.IsEmpty do
      cdsPlanItem.Delete;

    //生成数据
    cdsTemp.First;
    while not cdsTemp.Eof do
    begin
      cdsPlanItem.Append;
      cdsPlanItem.FieldByName('ZISNEW').AsBoolean := False;
      for i:=0 to cdsTemp.FieldDefs.Count -1 do
      begin
        cdsPlanItem.FieldByName(cdsTemp.FieldDefs[i].Name).AsVariant :=
            cdsTemp.FieldByName(cdsTemp.FieldDefs[i].Name).AsVariant;
      end;
      cdsPlanItem.Post;
      cdsTemp.Next;
    end;
    cdsPlanItem.First;

  finally
    cdsPlanItem.EnableControls;
    fLoading := myb;
    HideProgress;
    ClientSystem.EndTickCount;
  end;
end;

procedure TPlanManageClientDlg.cdsPlanItemCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('ZCHILDCOUNT').AsInteger <> 0 then
  begin
    DataSet.FieldByName('ZSUCCESSRATE').AsInteger :=
      Round((DataSet.FieldByName('ZPASSCOUNT').AsInteger/DataSet.FieldByName('ZCHILDCOUNT').AsInteger) * 100);
    if DataSet.FieldByName('ZSUCCESSRATE').AsInteger > 100 then
      DataSet.FieldByName('ZSUCCESSRATE').AsInteger := 100;
  end;
end;

procedure TPlanManageClientDlg.cdsPlanItemNewRecord(DataSet: TDataSet);
begin
  if fLoading then Exit;
  DataSet.FieldByName('ZGUID').AsString := NewGuid;
  DataSet.FieldByName('ZPLAN_GUID').AsString := cdsPlan.FieldByName('ZGUID').AsString;
  DataSet.FieldByName('ZSTATUS').AsInteger := Ord(ps_waiting);
  DataSet.FieldByName('ZCHILDCOUNT').AsInteger := 0;
  DataSet.FieldByName('ZPASSCOUNT').AsInteger := 0;
  DataSet.FieldByName('ZPBDATE').AsDateTime := ClientSystem.fDbOpr.GetSysDateTime;
  DataSet.FieldByName('ZFBDATE').AsDateTime := DataSet.FieldByName('ZPBDATE').AsDateTime;
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
end;

procedure TPlanManageClientDlg.actItem_AddUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (cdsPlan.RecordCount>0) and
  (cdsPlanitem.State in [dsBrowse]);
end;

procedure TPlanManageClientDlg.actItem_AddExecute(Sender: TObject);
begin
  cdsPlanItem.Append;
  cdsPlanDetail.First;
  while not cdsPlanDetail.Eof do
    cdsPlanDetail.Delete;
  pgcplan.ActivePageIndex := 1;
end;

procedure TPlanManageClientDlg.pgcplanChanging(Sender: TObject;
  var AllowChange: Boolean);
begin

  if (pgcplan.ActivePageIndex = 0) and
     (cdsPlanItem.IsEmpty) and
     (cdsPlan.IsEmpty) then
  begin
    AllowChange := False;
    Exit;
  end;

  if (cdsPlanItem.State in [dsEdit,dsInsert]) or
     (cdsPlanDetail.State in [dsEdit,dsInsert]) then
  begin
    AllowChange := False;
    MessageBox(Handle,'内容已修改，请点保存或取消。','提示',MB_ICONWARNING+MB_OK);
    Exit;
  end;
  
end;

procedure TPlanManageClientDlg.actItem_CancelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (cdsPlanItem.State in [dsEdit,dsInsert]) or
  (cdsPlanDetail.State in [dsEdit,dsInsert]);
  
end;

procedure TPlanManageClientDlg.actItem_SaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsPlanItem.State in [dsEdit,dsInsert];
end;

procedure TPlanManageClientDlg.actItem_CancelExecute(Sender: TObject);
begin
  if MessageBox(Handle,'是否取消','提示',MB_ICONQUESTION+MB_YESNO)=IDNO then
    Exit;

  if cdsPlanItem.State in [dsEdit,dsInsert] then
    cdsPlanItem.Cancel;
  if cdsPlanDetail.State in [dsEdit,dsInsert] then
    cdsPlanDetail.Cancel;
end;

procedure TPlanManageClientDlg.actItem_SaveExecute(Sender: TObject);
begin
  cdsPlanItem.Post;
end;

procedure TPlanManageClientDlg.cdsPlanItemBeforePost(DataSet: TDataSet);
var
  mySQL : string;
const
  gl_SQLTXT1 = 'insert TB_PLAN_ITEM (ZGUID,ZPLAN_GUID,ZNAME,ZSTATUS,' +
    'ZPBDATE,ZPEDATE,ZFBDATE,ZFEDATE,ZCHILDCOUNT,ZPASSCOUNT,ZMAINDEVE,ZSORT,ZREMARK,ZPROJECTTIME ) '+
    'values(''%s'',''%s'',''%s'',%d,''%s'',''%s'',''%s'',''%s'',%d,%d,%d,%d,''%s'',%f)';
  gl_SQLTXT2 = 'update TB_PLAN_ITEM set ZPLAN_GUID=''%s'',ZNAME=''%s'',ZSTATUS=%d, ' +
    'ZPBDATE=''%s'',ZPEDATE=''%s'',ZFBDATE=''%s'',ZFEDATE=''%s'',ZCHILDCOUNT=%d, ' +
    'ZPASSCOUNT=%d,ZMAINDEVE=%d,ZSORT=%d,ZREMARK=''%s'',ZPROJECTTIME=%f where ZGUID=''%s''';
begin
  //
  if fLoading then Exit;

  if DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    mySQL := Format(gl_SQLTXT1,[
      DataSet.FieldByName('ZGUID').AsString,
      DataSet.FieldByName('ZPLAN_GUID').AsString,
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZSTATUS').AsInteger,
      DataSet.FieldByName('ZPBDATE').AsString,
      DataSet.FieldByName('ZPEDATE').AsString,
      DataSet.FieldByName('ZFBDATE').AsString,
      DataSet.FieldByName('ZFEDATE').AsString,
      DataSet.FieldByName('ZCHILDCOUNT').AsInteger,
      DataSet.FieldByName('ZPASSCOUNT').AsInteger,
      DataSet.FieldByName('ZMAINDEVE').AsInteger,
      DataSet.FieldByName('ZSORT').AsInteger,
      DataSet.FieldByName('ZREMARK').AsString,
      DataSet.FieldByName('ZPROJECTTIME').AsFloat]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
    DataSet.FieldByName('ZISNEW').AsBoolean := False;
  end
  else begin
    mySQL := Format(gl_SQLTXT2,[
      DataSet.FieldByName('ZPLAN_GUID').AsString,
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZSTATUS').AsInteger,
      DataSet.FieldByName('ZPBDATE').AsString,
      DataSet.FieldByName('ZPEDATE').AsString,
      DataSet.FieldByName('ZFBDATE').AsString,
      DataSet.FieldByName('ZFEDATE').AsString,
      DataSet.FieldByName('ZCHILDCOUNT').AsInteger,
      DataSet.FieldByName('ZPASSCOUNT').AsInteger,
      DataSet.FieldByName('ZMAINDEVE').AsInteger,
      DataSet.FieldByName('ZSORT').AsInteger,
      DataSet.FieldByName('ZREMARK').AsString,
      DataSet.FieldByName('ZPROJECTTIME').AsFloat,
      DataSet.FieldByName('ZGUID').AsString]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
  end;
end;

procedure TPlanManageClientDlg.actItem_SuccessExecute(Sender: TObject);
begin

  if not ((cdsPlanItem.FieldByName('ZMAINDEVE').AsInteger = ClientSystem.fEditer_id) or
     (cdsPlan.FieldByName('ZPM').AsInteger=ClientSystem.fEditer_id) or
     (ClientSystem.fEditerType = etAdmin)) then
  begin
    MessageBox(Handle,'不是你的任务，不能点提交完成。','提示',MB_ICONWARNING+
      MB_OK);
    Exit;
  end;

  if cdsPlanItem.FieldByName('ZCHILDCOUNT').AsInteger >
     cdsPlanItem.FieldByName('ZPASSCOUNT').AsInteger then
  begin
    MessageBox(Handle,'任务内容没有完成，不能点提交完成。','提示',MB_ICONWARNING+
      MB_OK);
    Exit;
  end;

  if not (cdsPlanItem.State in [dsEdit,dsInsert]) then
    cdsPlanItem.Edit;
  cdsPlanItem.FieldByName('ZSTATUS').AsInteger := Ord(ps_success);
  cdsPlanItem.Post;
end;

procedure TPlanManageClientDlg.actItem_ActionUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (cdsPlanItem.Active) and
  (cdsPlanItem.FieldByName('ZSTATUS').AsInteger in
    [Ord(ps_success),Ord(ps_close)]);
end;

procedure TPlanManageClientDlg.actItem_SuccessUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (cdsPlanItem.Active) and
  (cdsPlanItem.FieldByName('ZSTATUS').AsInteger in [Ord(ps_doing),
    Ord(ps_reaction)]);
end;

procedure TPlanManageClientDlg.actItem_CloseUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (cdsPlanItem.Active) and
  (cdsPlanItem.FieldByName('ZSTATUS').AsInteger in [Ord(ps_success)]);
end;

procedure TPlanManageClientDlg.actItem_CloseExecute(Sender: TObject);
begin
  if not (cdsPlanItem.State in [dsEdit,dsInsert]) then
    cdsPlanItem.Edit;
  cdsPlanItem.FieldByName('ZSTATUS').AsInteger := Ord(ps_close);
  cdsPlanItem.FieldByName('ZFEDATE').AsString := ClientSystem.fDbOpr.GetSysDateTime;
  cdsPlanItem.Post;
end;

procedure TPlanManageClientDlg.actItem_ActionExecute(Sender: TObject);
begin
  if not (cdsPlanItem.State in [dsEdit,dsInsert]) then
    cdsPlanItem.Edit;
  cdsPlanItem.FieldByName('ZSTATUS').AsInteger := Ord(ps_reaction);
  cdsPlanItem.Post;
end;

procedure TPlanManageClientDlg.dbgrdPlanItemDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (cdsPlanItem.RecNo mod 2  = 0) and not ( gdSelected in State)  then
    dbgrdPlanItem.Canvas.Brush.Color := clSilver;

  if (cdsPlanItem.FieldByName('ZSTATUS').AsInteger = Ord(ps_close)) then
  begin
    dbgrdPlanItem.Canvas.Font.Color := clblue;
  end
  else if (cdsPlanItem.FieldByName('ZSTATUS').AsInteger = Ord(ps_waiting)) then
    dbgrdPlanItem.Canvas.Font.Style := [fsItalic];


  case Column.Index of
    7  :
      if cdsPlanItem.FieldByName('ZMAINDEVE').AsInteger =
         ClientSystem.fEditer_id then
      begin
        dbgrdPlanItem.Canvas.Brush.Color := clLime;
      end;
    2:
      if cdsPlanItem.FieldByName('ZSTATUS').AsInteger = Ord(ps_waiting) then
      begin
        dbgrdPlanItem.Canvas.Brush.Color := clMaroon;
        dbgrdPlanItem.Canvas.Font.Color  := clwhite;
      end;
    3,4:
      if cdsPlanItem.FieldByName('ZSTATUS').AsInteger = Ord(ps_waiting) then
      begin
        if gdSelected in State then
        begin
          dbgrdPlanItem.Canvas.Brush.Color := clHighlight;
          dbgrdPlanItem.Canvas.Font.Color  := clHighlight;
          dbgrdPlanItem.Canvas.FillRect(Rect);
        end
        else begin
          //dbgrdPlanItem.Canvas.Brush.Color := clwhite;
          dbgrdPlanItem.Canvas.Font.Color := dbgrdPlanItem.Canvas.Brush.Color;
          dbgrdPlanItem.Canvas.FillRect(Rect);
        end;
      end;

  end;

  dbgrdPlanItem.DefaultDrawColumnCell(Rect,DataCol,Column,State);

end;

procedure TPlanManageClientDlg.LoadPlanDetail(AGUID: string);
var
  mySQL  : string;
  i : integer;
  myb : Boolean;
const
    glSQL ='Select * from TB_PLAN_DETAIL where ZITEM_GUID=''%s''';
begin

  mySQL := format(glSQL,[AGUID]);

  myb := fLoading;
  fLoading := True;
  cdsPlanDetail.DisableControls;
  try

    if cdsTemp.Active then cdsTemp.Close;
    cdsTemp.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));

    while not cdsPlanDetail.IsEmpty do
      cdsPlanDetail.Delete;

    //生成数据
    cdsTemp.First;
    while not cdsTemp.Eof do
    begin
      cdsPlanDetail.Append;
      cdsPlanDetail.FieldByName('ZISNEW').AsBoolean := False;
      for i:=0 to cdsTemp.FieldDefs.Count -1 do
      begin
        cdsPlanDetail.FieldByName(cdsTemp.FieldDefs[i].Name).AsVariant :=
            cdsTemp.FieldByName(cdsTemp.FieldDefs[i].Name).AsVariant;
      end;
      cdsPlanDetail.Post;
      cdsTemp.Next;
    end;
    cdsPlanDetail.First;

  finally
    cdsPlanDetail.EnableControls;
    fLoading := myb;
  end;
end;

procedure TPlanManageClientDlg.cdsPlanDetailNewRecord(DataSet: TDataSet);
begin
  if fLoading then Exit;
  DataSet.FieldByName('ZITEM_GUID').AsString := cdsPlanItem.FieldByName('ZGUID').AsString;
  DataSet.FieldByName('ZSTATUS').AsInteger := Ord(ps_doing);
  DataSet.FieldByName('ZSOCRE').AsInteger := 0;
  DataSet.FieldByName('ZCONTENT').AsString := '任务要求:' + #13#10;
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
end;

procedure TPlanManageClientDlg.actDetail_AddUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsPlanItem.Active and
  (cdsPlanItem.State in [dsBrowse]) and
  (cdsPlanItem.RecordCount>0);
end;

procedure TPlanManageClientDlg.actDetail_SaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsPlanDetail.State in [dsEdit,dsInsert];
end;

procedure TPlanManageClientDlg.actDetail_SaveExecute(Sender: TObject);
begin
  cdsPlanDetail.Post;
end;

procedure TPlanManageClientDlg.dbgrdDetailDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

  if (cdsPlanDetail.RecNo mod 2  = 0) and not ( gdSelected in State)  then
    dbgrdDetail.Canvas.Brush.Color := clSilver;

  if (cdsPlanDetail.FieldByName('ZSTATUS').AsInteger = Ord(ps_close)) then
  begin
     dbgrdDetail.Canvas.Font.Color  := clBlue;
  end;

  dbgrdDetail.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TPlanManageClientDlg.actDetail_AddExecute(Sender: TObject);
begin
  if (cdsPlanItem.FieldByName('ZMAINDEVE').AsInteger=ClientSystem.fEditer_id) or
     (cdsPlan.FieldByName('ZPM').AsInteger=ClientSystem.fEditer_id) or
     (ClientSystem.fEditerType=etAdmin) then
    cdsPlanDetail.Append
  else begin
    MessageBox(Handle,'你没有增加的权限','增加',MB_ICONWARNING+MB_OK);
    Exit;
  end;
end;

procedure TPlanManageClientDlg.cdsPlanDetailBeforePost(DataSet: TDataSet);
var
  mySQL : string;
  myID : Integer;
  myb : Boolean;
  mymailto : string;
  mytitle : string;
const
  gl_SQLTXT = 'insert TB_PLAN_DETAIL(ZID,ZITEM_GUID,ZNAME,ZSTATUS,ZDEVE,' +
   ' ZCONTENT,ZSOCRE,ZTESTCASE) values(%d,''%s'',''%s'',%d,%d,''%s'',%d,''%s'')';
  gl_SQLTXT2 = 'update TB_PLAN_DETAIL set ZITEM_GUID=''%s'',ZNAME=''%s'',' +
   ' ZSTATUS=%d,ZDEVE=%d,ZCONTENT=''%s'',ZSOCRE=%d ,ZTESTCASE=''%s'' where ZID=%d';

  gl_SQLTXT3 = 'select isNull(max(ZID),0)+1 from TB_PLAN_DETAIL';
  gl_SQLTXT4 = 'update TB_PLAN_ITEM set ZCHILDCOUNT=ZCHILDCOUNT+1 where ZGUID=''%s''';
  gl_SQLTXT5 = 'update TB_PLAN_ITEM set ZPASSCOUNT=ZPASSCOUNT+1 where ZGUID=''%s''';
begin
  //
  if fLoading then Exit;
  
  if DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    myID := ClientSystem.fDbOpr.ReadInt(PChar(gl_SQLTXT3));
    DataSet.FieldByName('ZID').AsInteger := myID;
    mySQL := Format(gl_SQLTXT,[
      DataSet.FieldByName('ZID').AsInteger,
      DataSet.FieldByName('ZITEM_GUID').AsString,
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZSTATUS').AsInteger,
      DataSet.FieldByName('ZDEVE').AsInteger,
      DataSet.FieldByName('ZCONTENT').AsString,
      DataSet.FieldByName('ZSOCRE').AsInteger,
      DataSet.FieldByName('ZTESTCASE').AsString]);

    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      mySQL := Format(gl_SQLTXT4,[DataSet.FieldByName('ZITEM_GUID').AsString]);
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      myb := fLoading;
      fLoading := True;
      try
        if not (cdsPlanItem.State in [dsEdit,dsInsert]) then
          cdsPlanitem.Edit;
        cdsPlanItem.FieldByName('ZCHILDCOUNT').AsInteger :=
          cdsPlanItem.FieldByName('ZCHILDCOUNT').AsInteger + 1;
        cdsPlanitem.Post;
      finally
        fLoading := myb;
      end;
      ClientSystem.fDbOpr.CommitTrans;

    except
      ClientSystem.fDbOpr.RollbackTrans;
    end;

    DataSet.FieldByName('ZISNEW').AsBoolean  := False;
  end
  else begin
    mySQL := Format(gl_SQLTXT2,[
      DataSet.FieldByName('ZITEM_GUID').AsString,
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZSTATUS').AsInteger,
      DataSet.FieldByName('ZDEVE').AsInteger,
      DataSet.FieldByName('ZCONTENT').AsString,
      DataSet.FieldByName('ZSOCRE').AsInteger,
      DataSet.FieldByName('ZTESTCASE').AsString,
      DataSet.FieldByName('ZID').AsInteger ]);

    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      if DataSet.FieldByName('ZSTATUS').AsInteger = Ord(ps_close) then
      begin
        mySQL := Format(gl_SQLTXT5,[DataSet.FieldByName('ZITEM_GUID').AsString]);
        ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));

        myb := fLoading;
        fLoading := True;
        try
          if not (cdsPlanItem.State in [dsEdit,dsInsert]) then
            cdsPlanitem.Edit;
          cdsPlanItem.FieldByName('ZPASSCOUNT').AsInteger :=
            cdsPlanItem.FieldByName('ZPASSCOUNT').AsInteger + 1;
          cdsPlanitem.Post;

        finally
          fLoading := myb;
        end;
      end;
      ClientSystem.fDbOpr.CommitTrans;

      //只有关闭或激活才处理
      //发邮件
      if DataSet.FieldByName('ZSTATUS').AsInteger in [Ord(ps_close),
        Ord(ps_reaction)] then
      begin
        ShowProgress('发送邮件...',0);
        try
          mymailto := GetMailAdder(cdsPlan.fieldByName('ZMEMBER').AsString);
          if mymailto <> '' then
          begin
            if DataSet.FieldByName('ZSTATUS').AsInteger=Ord(ps_close) then
              myTitle := format('@%d 关闭任务 ',[DataSet.FieldByName('ZID').AsInteger])
                 + DataSet.FieldByName('ZNAME').AsString
            else
              myTitle := format('@%d 激活任务 ',[DataSet.FieldByName('ZID').AsInteger])
                + DataSet.FieldByName('ZNAME').AsString;

            ClientSystem.fDbOpr.MailToEx(mymailto,myTitle,'');
          end;
        finally
          HideProgress();
        end;
      end;

    except
      ClientSystem.fDbOpr.RollbackTrans;
    end;

  end;
end;

procedure TPlanManageClientDlg.pgcplanChange(Sender: TObject);
begin
  if pgcplan.ActivePageIndex = 1 then
  begin
    if cdsPlanItem.IsEmpty then
    begin
      pgcplan.ActivePageIndex := 0;
      Exit;
    end;

    LoadPlanDetail(cdsPlanItem.FieldByName('ZGUID').AsString);
  end;
end;

procedure TPlanManageClientDlg.actItem_PiroPageExecute(Sender: TObject);
begin
  cdsPlanItem.Prior;
  LoadPlanDetail(cdsPlanItem.FieldByName('ZGUID').AsString);
end;

procedure TPlanManageClientDlg.actItem_PiroPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not cdsPlanItem.Bof;
end;

procedure TPlanManageClientDlg.actItem_NextUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not cdsPlanItem.Eof;

end;

procedure TPlanManageClientDlg.actItem_NextExecute(Sender: TObject);
begin
  cdsPlanItem.Next;
  LoadPlanDetail(cdsPlanItem.FieldByName('ZGUID').AsString);
end;

procedure TPlanManageClientDlg.actDetail_SUCCESSExecute(Sender: TObject);
begin
  //
  if not ((cdsPlanDetail.FieldByName('ZDEVE').AsInteger = ClientSystem.fEditer_id) or
     (cdsPlanItem.FieldByName('ZMAINDEVE').AsInteger=ClientSystem.fEditer_id) or
     (ClientSystem.fEditerType = etAdmin)) then
  begin
    MessageBox(Handle,'不是你的任务，不能点提交完成。','提示',MB_ICONWARNING+
      MB_OK);
    Exit;
  end;

  cdsPlanDetail.Edit;
  cdsPlanDetail.FieldByName('ZSTATUS').AsInteger := Ord(ps_success);
  cdsPlanDetail.Post;
end;

procedure TPlanManageClientDlg.actDetail_SUCCESSUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (cdsPlanDetail.State = dsBrowse)
  and (cdsPlanDetail.FieldByName('ZSTATUS').AsInteger in [Ord(ps_doing),
    Ord(ps_reaction)])
  and (cdsPlanItem.FieldByName('ZSTATUS').AsInteger<>Ord(ps_waiting));
end;

procedure TPlanManageClientDlg.actDetail_ColseUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (cdsPlanDetail.State = dsBrowse)
  and (cdsPlanDetail.FieldByName('ZSTATUS').AsInteger=Ord(ps_success));
end;

procedure TPlanManageClientDlg.actDetail_ColseExecute(Sender: TObject);
begin
  cdsPlanDetail.Edit;
  cdsPlanDetail.FieldByName('ZSTATUS').AsInteger := Ord(ps_close);
  cdsPlanDetail.Post;
end;

procedure TPlanManageClientDlg.actDetail_ActionExecute(Sender: TObject);
var
  mySQL : string;
  myb : Boolean;
const
  gl_SQLTXT5 = 'update TB_PLAN_ITEM set ZPASSCOUNT=ZPASSCOUNT-1 where ZGUID=''%s''';
begin

  if cdsPlanDetail.FieldByName('ZSTATUS').AsInteger = Ord(ps_close) then
  begin
    mySQL := Format(gl_SQLTXT5,[cdsPlanDetail.FieldByName('ZITEM_GUID').AsString]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
    myb := fLoading;
    fLoading := True;
    try
      if not( cdsPlanItem.State in [dsEdit,dsInsert]) then
        cdsPlanItem.Edit;
      cdsPlanItem.FieldByName('ZPASSCOUNT').AsInteger :=
        cdsPlanItem.FieldByName('ZPASSCOUNT').AsInteger - 1;
      if cdsPlanItem.FieldByName('ZSTATUS').AsInteger = Ord(ps_close) then
        cdsPlanItem.FieldByName('ZSTATUS').AsInteger := Ord(ps_reaction);
      cdsPlanItem.Post;
    finally
      fLoading := myb;
    end;
  end;

  cdsPlanDetail.Edit;
  cdsPlanDetail.FieldByName('ZSTATUS').AsInteger := Ord(ps_reaction);
  cdsPlanDetail.Post;
end;

procedure TPlanManageClientDlg.actDetail_ActionUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (cdsPlanDetail.State = dsBrowse)
  and (cdsPlanDetail.FieldByName('ZSTATUS').AsInteger in [Ord(ps_close),Ord(ps_success)]);
end;

procedure TPlanManageClientDlg.actPan_successExecute(Sender: TObject);
begin
  if cdsPlan.FieldByName('ZPM').AsInteger <> ClientSystem.fEditer_id then
  begin
    MessageBox(Handle,'你不是这个项目的项目经理,不能关闭','提示',
      MB_ICONERROR+MB_OK);
    Exit;
  end;

  cdsPlan.Edit;
  cdsPlan.FieldByName('ZSTATUS').AsInteger := Ord(ps_success);
  cdsPlan.Post;
end;

procedure TPlanManageClientDlg.actPan_successUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (cdsPlan.State = dsBrowse)
  and (cdsPlan.FieldByName('ZSTATUS').AsInteger=Ord(ps_doing));
end;

procedure TPlanManageClientDlg.actPan_CLOSEUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (cdsPlan.State = dsBrowse)
  and (cdsPlan.FieldByName('ZSTATUS').AsInteger=Ord(ps_success));
end;

procedure TPlanManageClientDlg.actPan_CLOSEExecute(Sender: TObject);
begin
  cdsPlan.Edit;
  cdsPlan.FieldByName('ZSTATUS').AsInteger := Ord(ps_close);
  cdsPlan.Post;
  if Assigned(tvPlan.Selected) then
    tvPlan.Selected.Data := PInteger(ord(ps_close));
end;

procedure TPlanManageClientDlg.actPan_ActionUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (cdsPlan.State = dsBrowse)
  and (cdsPlan.FieldByName('ZSTATUS').AsInteger in [Ord(ps_success),Ord(ps_close)]);
end;

procedure TPlanManageClientDlg.actPan_ActionExecute(Sender: TObject);
begin
  cdsPlan.Edit;
  cdsPlan.FieldByName('ZSTATUS').AsInteger := Ord(ps_doing);
  cdsPlan.Post;
  if Assigned(tvPlan.Selected) then
    tvPlan.Selected.Data := PInteger(ord(ps_doing));
end;

procedure TPlanManageClientDlg.cdsPlanAfterScroll(DataSet: TDataSet);
begin
  if fLoading then Exit;
  //先取出总数
  fPlanItemPageRec.fwhere := format('ZPLAN_GUID=''''%s''''',[
    DataSet.FieldByName('ZGUID').AsString]);
  fPlanItemPageRec.fPageindex := 1;
  fPlanItemPageRec.fCount := GetPlanItemPageCount(
    fPlanItemPageRec.fPageindex,
    fPlanItemPageRec.fwhere);
  lblItemPage.Caption := format('%d/%d',[1,fPlanItemPageRec.fCount]);
  LoadPlanItem(fPlanItemPageRec.fPageindex,
    fPlanItemPageRec.fwhere);
end;

procedure TPlanManageClientDlg.tvPlanChange(Sender: TObject;
  Node: TTreeNode);
var
  myGUID : string;
begin
  //
  if fLoading then Exit;

  if Node.Index >=0 then
  begin
    myGUID := lstPlanGUID.Items[Node.Index];
    cdsPlan.Locate('ZGUID',myGUID,[loPartialKey]);
  end;
end;

procedure TPlanManageClientDlg.tvPlanChanging(Sender: TObject;
  Node: TTreeNode; var AllowChange: Boolean);
begin
  if pgcplan.ActivePageIndex = 1 then
  begin
    AllowChange:= False;
    MessageBox(Handle,'任务内容不能选择。','提示',MB_ICONWARNING+MB_OK);
  end
  else
    AllowChange := True;
end;

procedure TPlanManageClientDlg.tvPlanCustomDrawItem(
  Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  var DefaultDraw: Boolean);
var
  BoundRect : TRect;
  mySTATUS : integer;
  mybmp : TBitmap;
begin
  inherited;
  BoundRect := Node.DisplayRect(False);
  mySTATUS := integer(Node.data);
  if mySTATUS=Ord(ps_close) then
    Sender.Canvas.Font.Color := clblue;

  mybmp := TBitmap.Create;
  if Node.Selected then
    DM.ImageListTree.GetBitmap(Node.SelectedIndex,mybmp)
  else
    DM.ImageListTree.GetBitmap(Node.ImageIndex,mybmp);
    
  Sender.Canvas.Draw(BoundRect.Left,BoundRect.Top,mybmp);
  Sender.Canvas.TextOut(BoundRect.Left+mybmp.Width,BoundRect.Top,Node.Text);
  DefaultDraw := False;
  mybmp.Free;
end;

procedure TPlanManageClientDlg.dblkcbb1CloseUp(Sender: TObject);
var
  mystr : String;
  myaddstr : string;
begin
  if (Sender as TDBLookupComboBox).Text = '' then Exit;
  if ClientSystem.fEditerType <> etAdmin then
  begin
    MessageBox(Handle,'你没有权限','提示',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  if cdsPlan.State in [dsBrowse] then
    cdsPlan.Edit;

  myaddstr := format('%s(%d)',[
      DM.cdsUser.FieldByName('ZNAME').AsString,
      DM.cdsUser.FieldByName('ZID').AsInteger]);

  myStr := cdsPlan.FieldByName('ZMEMBER').AsString;
  if mystr <> '' then
  begin
    if Pos(myaddstr,mystr) <= 0 then
      myStr := myStr + ';' + myaddstr;
  end
  else
    myStr := myStr + myaddstr;

  cdsPlan.FieldByName('ZMEMBER').AsString := myStr;
end;

function TPlanManageClientDlg.GetPlanItemPageCount(APageIndex: integer;
  AWhereStr: String): integer;
var
  mySQL  : string;
  myRowCount : integer;
  mywhere : string;
const
  glSQL = 'exec pt_SplitPage ''TB_PLAN_ITEM'',' +
          '''ZSORT'', ''%s'',20,%d,%d,1,''%s''';
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

procedure TPlanManageClientDlg.actItem_firstPageExecute(Sender: TObject);
begin
  fPlanItemPageRec.fPageindex :=  1;
  LoadPlanItem(fPlanItemPageRec.fPageindex,fPlanItemPageRec.fwhere);
  lblItemPage.Caption := format('%d/%d',[1,
    fPlanItemPageRec.fCount]);
end;

procedure TPlanManageClientDlg.actItem_firstPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fPlanItemPageRec.fPageindex>0) and
  (fPlanItemPageRec.fPageindex<>1);
end;

procedure TPlanManageClientDlg.actItme_ProvPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fPlanItemPageRec.fPageindex>0) and
  (fPlanItemPageRec.fPageindex<>1);
end;

procedure TPlanManageClientDlg.actItme_ProvPageExecute(Sender: TObject);
begin
  fPlanItemPageRec.fPageindex := fPlanItemPageRec.fPageindex - 1;
  LoadPlanItem(fPlanItemPageRec.fPageindex,fPlanItemPageRec.fwhere);
  lblItemPage.Caption := format('%d/%d',[fPlanItemPageRec.fPageindex,
    fPlanItemPageRec.fCount]);
end;

procedure TPlanManageClientDlg.actItem_NextPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fPlanItemPageRec.fPageindex<
    fPlanItemPageRec.fCount);
end;

procedure TPlanManageClientDlg.actItem_NextPageExecute(Sender: TObject);
begin
  fPlanItemPageRec.fPageindex := fPlanItemPageRec.fPageindex + 1;
  LoadPlanItem(fPlanItemPageRec.fPageindex,fPlanItemPageRec.fwhere);
  lblItemPage.Caption := format('%d/%d',[fPlanItemPageRec.fPageindex,
    fPlanItemPageRec.fCount]);
end;

procedure TPlanManageClientDlg.actItem_LastPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fPlanItemPageRec.fPageindex<>
    fPlanItemPageRec.fCount);
end;

procedure TPlanManageClientDlg.actItem_LastPageExecute(Sender: TObject);
begin
  fPlanItemPageRec.fPageindex := fPlanItemPageRec.fCount;
  LoadPlanItem(fPlanItemPageRec.fPageindex,fPlanItemPageRec.fwhere);
  lblItemPage.Caption := format('%d/%d',[fPlanItemPageRec.fPageindex,
    fPlanItemPageRec.fCount]);
end;

procedure TPlanManageClientDlg.actItem_RefreshDataExecute(Sender: TObject);
begin
  LoadPlanItem(fPlanItemPageRec.fPageindex,fPlanItemPageRec.fwhere);
end;

procedure TPlanManageClientDlg.btnGotoTestClick(Sender: TObject);
var
  mystr : string;
begin
  if cdsPlanDetail.FieldByName('ZTESTCASE').AsString <> '' then
  begin
    mystr := cdsPlanDetail.FieldByName('ZTESTCASE').AsString;

   SendMessage(Application.MainForm.Handle,gcMSG_GetTestItemByCode,
      0,Integer(PChar(mystr)));
  end;
end;

procedure TPlanManageClientDlg.WMShowPlanItem(var msg: TMessage);
var
  i : integer;
  myPlanID : integer;
  myGUID   : string;
  mySQL    : string;
  myPGUID  : string;
const
  gl_SQLTXT =  'select ZITEM_GUID from TB_PLAN_DETAIL where ZID=%d';
  gl_SQLTXT2 = 'select b.ZGUID from TB_PLAN_ITEM as a,TB_PLAN as b' +
               ' where a.ZPLAN_GUID=b.ZGUID and a.ZGUID=''%s''';
begin
  myPlanID := msg.WParam;
  mySQL := format(gl_SQLTXT,[myPlanID]);
  myGUID := ClientSystem.fDbOpr.ReadVariant(PChar(mySQL));
  if myGUID = '' then Exit;

  mySQL := format(gl_SQLTXT2,[myGUID]);
  myPGUID := ClientSystem.fDbOpr.ReadVariant(PChar(mySQL));
  if myPGUID = '' then Exit;

  //定位了.
  for i:=0 to  lstPlanGUID.Count -1 do
  begin
    if lstPlanGUID.Items[i] = myPGUID then
    begin
      pgcplan.ActivePageIndex := 0;
      tvPlan.Items[i].Selected := True;

      //子项目
      if cdsPlanItem.Locate('ZGUID',myGUID,[loPartialKey]) then
      begin
        pgcplan.ActivePageIndex := 1;
        LoadPlanDetail(myGUID);
        cdsPlanDetail.Locate('ZID',myPlanID,[loPartialKey]);
      end;
      break;
    end;
  end;
end;

procedure TPlanManageClientDlg.actItem_RefreshDataUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fPlanItemPageRec.fPageindex > 0)
end;

procedure TPlanManageClientDlg.actItem_StartingExecute(Sender: TObject);
begin
  if (cdsPlanItem.FieldByName('ZMAINDEVE').AsInteger <>
     ClientSystem.fEditer_id) then
  begin
    MessageBox(Handle,'不是你的任务不能点开始执行','提示',MB_ICONERROR);
    Exit;
  end;

  if MessageBox(Handle,'确定你要开始执行这个任务?','询问',
    MB_ICONQUESTION+MB_YESNO)=IDNO then
    Exit;

  if not (cdsPlanItem.State in [dsEdit,dsInsert]) then
    cdsPlanItem.Edit;
  cdsPlanItem.FieldByName('ZSTATUS').AsInteger := Ord(ps_doing);
  cdsPlanItem.FieldByName('ZFBDATE').AsString := ClientSystem.fDbOpr.GetSysDateTime;
  cdsPlanItem.Post;
end;

procedure TPlanManageClientDlg.actItem_StartingUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (not cdsPlanItem.IsEmpty) and
  (cdsPlanItem.FieldByName('ZSTATUS').AsInteger=Ord(ps_waiting));
end;

procedure TPlanManageClientDlg.actItem_WaitingExecute(Sender: TObject);
begin
  if (cdsPlanItem.FieldByName('ZMAINDEVE').AsInteger <>
     ClientSystem.fEditer_id) and
     (ClientSystem.fEditerType<>etAdmin) then
  begin
    MessageBox(Handle,'不是你的任务不能点','提示',MB_ICONERROR);
    Exit;
  end;

  if MessageBox(Handle,'确定你要任务设为等待中?','询问',
    MB_ICONQUESTION+MB_YESNO)=IDNO then
    Exit;

  if not (cdsPlanItem.State in [dsEdit,dsInsert]) then
    cdsPlanItem.Edit;
  cdsPlanItem.FieldByName('ZSTATUS').AsInteger := Ord(ps_waiting);
  cdsPlanItem.Post;
end;

procedure TPlanManageClientDlg.actItem_WaitingUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (not cdsPlanItem.IsEmpty) and
  (cdsPlanItem.FieldByName('ZSTATUS').AsInteger in [Ord(ps_doing)]);
end;

procedure TPlanManageClientDlg.chkEditClick(Sender: TObject);
var
  myEdit : Boolean;
begin
  //
  myEdit := chkEdit.Checked;

  dbedtZNAME1.ReadOnly := not myEdit;
  dbedtZFBDATE.ReadOnly := not myEdit;
  dbedtZFEDATE.ReadOnly := not myEdit;
  dblkcbbZMAINDEVENAME.ReadOnly := not myEdit;
  dbedtZREMARK.ReadOnly := not myEdit;
  dbedtZNAME2.ReadOnly := not myEdit;
  dblkcbbZSTATUSNAME.ReadOnly := not myEdit;
  dbmmoZCONTENT.ReadOnly := not myEdit;
  dbedtZTESTCASE.ReadOnly := not myEdit;
end;

end.
