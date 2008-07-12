///////////////////////////////////////////////////////////////////////////////
//
//  项目的管理模块
//
//  创建时间:2007-11-20  作者:龙仕云
//
//  修改:
//     1.增加任务单 2008-3-11
//
//
//
///////////////////////////////////////////////////////////////////////////////
unit ProjectManageClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseChildfrm, ExtCtrls, ComCtrls, DB, DBClient, StdCtrls,
  Buttons, Grids, DBGrids, ActnList, DBCtrls, Tabs, Menus,

  ClientTypeUnits, Mask;


type

  TTaskPageRec = record
    fCount : integer;
    fPageindex : integer;
    fwhere : string;
  end;


  TProjectManageClientDlg = class(TBaseChildDlg)
    plonvisible: TPanel;
    plcenter: TPanel;
    pcProject: TPageControl;
    tsProjectList: TTabSheet;
    tsProjectVer: TTabSheet;
    plProItemTop: TPanel;
    BitBtn1: TBitBtn;
    cdsProjectItem: TClientDataSet;
    dgProItem: TDBGrid;
    dsProjectItem: TDataSource;
    ActionList1: TActionList;
    actPro_Add: TAction;
    BitBtn2: TBitBtn;
    actPro_Save: TAction;
    cbEditProItem: TCheckBox;
    BitBtn3: TBitBtn;
    actPro_Cancel: TAction;
    actPro_Del: TAction;
    BitBtn4: TBitBtn;
    plProVersion: TPanel;
    dbmContext: TDBMemo;
    Splitter1: TSplitter;
    dgProVersion: TDBGrid;
    dsProVersion: TDataSource;
    cdsProVersion: TClientDataSet;
    cbVersionEdit: TCheckBox;
    actVer_Add: TAction;
    actVer_Del: TAction;
    actVer_Save: TAction;
    actvar_Cancel: TAction;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    dbProName: TDBText;
    actPro_RefreshData: TAction;
    BitBtn9: TBitBtn;
    pmExcel: TPopupMenu;
    N1: TMenuItem;
    miFixRow: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N51: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    miFixedRow: TMenuItem;
    N5: TMenuItem;
    miFixedCol: TMenuItem;
    N11: TMenuItem;
    N22: TMenuItem;
    N32: TMenuItem;
    N42: TMenuItem;
    N52: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    cdsDocs: TClientDataSet;
    tsTask: TTabSheet;
    plTaskTool: TPanel;
    plTitle: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    actTask_Creaet: TAction;
    BitBtn10: TBitBtn;
    plTaskList: TPanel;
    dgTaskList: TDBGrid;
    Splitter3: TSplitter;
    plTaskContext: TPanel;
    cdsTask: TClientDataSet;
    dsTask: TDataSource;
    BitBtn11: TBitBtn;
    actTask_ToMe: TAction;
    cdsTaskType: TClientDataSet;
    dsTaskType: TDataSource;
    cdsTemp: TClientDataSet;
    cdsStatus: TClientDataSet;
    dsStatus: TDataSource;
    actTask_Save: TAction;
    pcTasKUser: TPageControl;
    tsDesign: TTabSheet;
    Splitter4: TSplitter;
    DBMDesign: TDBMemo;
    DBMTestCase: TDBMemo;
    tsUser: TTabSheet;
    dgUser: TDBGrid;
    tsPlan: TTabSheet;
    actTask_to: TAction;
    BitBtn13: TBitBtn;
    cdsTaskUser: TClientDataSet;
    dsTaskUser: TDataSource;
    plUserRight: TPanel;
    plUserBottom: TPanel;
    BitBtn14: TBitBtn;
    plScore: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBText3: TDBText;
    Label5: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBGrid1: TDBGrid;
    Splitter2: TSplitter;
    dbmItemDeign: TDBMemo;
    cdsTaskItem: TClientDataSet;
    dsTaskItem: TDataSource;
    plTaskItemBottom: TPanel;
    BitBtn15: TBitBtn;
    actTask_AddItem: TAction;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    actTask_Finally: TAction;
    actTask_Close: TAction;
    actTask_Action: TAction;
    actTask_Score: TAction;
    actTask_CreateByme: TAction;
    BitBtn19: TBitBtn;
    tsPanl2: TTabSheet;
    plPlan: TPanel;
    Label14: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    Label8: TLabel;
    Label15: TLabel;
    DBEdit13: TDBEdit;
    cbEditDesing: TCheckBox;
    btnTask_Save: TBitBtn;
    pnlTaskListBottom: TPanel;
    actTask_FirstPage: TAction;
    actTask_NextPage: TAction;
    actTask_UpPage: TAction;
    actTask_Lastpage: TAction;
    btnTask_FirstPage: TBitBtn;
    btnTask_UpPage: TBitBtn;
    btnTask_NextPage: TBitBtn;
    btnTask_Lastpage: TBitBtn;
    lblPage: TLabel;
    procedure actPro_AddExecute(Sender: TObject);
    procedure cbEditProItemClick(Sender: TObject);
    procedure actPro_AddUpdate(Sender: TObject);
    procedure actPro_SaveUpdate(Sender: TObject);
    procedure cdsProjectItemBeforePost(DataSet: TDataSet);
    procedure cdsProjectItemNewRecord(DataSet: TDataSet);
    procedure actPro_CancelUpdate(Sender: TObject);
    procedure actPro_CancelExecute(Sender: TObject);
    procedure actPro_SaveExecute(Sender: TObject);
    procedure actPro_DelUpdate(Sender: TObject);
    procedure actPro_DelExecute(Sender: TObject);
    procedure cdsProjectItemBeforeDelete(DataSet: TDataSet);
    procedure pcProjectChanging(Sender: TObject; var AllowChange: Boolean);
    procedure pcProjectChange(Sender: TObject);
    procedure cdsProVersionNewRecord(DataSet: TDataSet);
    procedure actVer_AddUpdate(Sender: TObject);
    procedure actVer_AddExecute(Sender: TObject);
    procedure actVer_SaveUpdate(Sender: TObject);
    procedure actVer_SaveExecute(Sender: TObject);
    procedure cdsProVersionBeforePost(DataSet: TDataSet);
    procedure cbVersionEditClick(Sender: TObject);
    procedure actVer_DelUpdate(Sender: TObject);
    procedure actVer_DelExecute(Sender: TObject);
    procedure cdsProVersionBeforeDelete(DataSet: TDataSet);
    procedure actvar_CancelUpdate(Sender: TObject);
    procedure actvar_CancelExecute(Sender: TObject);
    procedure actPro_RefreshDataExecute(Sender: TObject);
    procedure cdsTaskCalcFields(DataSet: TDataSet);
    procedure actTask_CreaetExecute(Sender: TObject);
    procedure cdsTaskNewRecord(DataSet: TDataSet);
    procedure cdsTaskBeforePost(DataSet: TDataSet);
    procedure cbEditDesingClick(Sender: TObject);
    procedure actTask_SaveExecute(Sender: TObject);
    procedure actTask_SaveUpdate(Sender: TObject);
    procedure actTask_toUpdate(Sender: TObject);
    procedure actTask_toExecute(Sender: TObject);
    procedure cdsTaskAfterScroll(DataSet: TDataSet);
    procedure cdsTaskUserBeforePost(DataSet: TDataSet);
    procedure actTask_ToMeExecute(Sender: TObject);
    procedure actTask_AddItemExecute(Sender: TObject);
    procedure cdsTaskItemNewRecord(DataSet: TDataSet);
    procedure cdsTaskItemBeforePost(DataSet: TDataSet);
    procedure cdsTaskItemCalcFields(DataSet: TDataSet);
    procedure actTask_FinallyExecute(Sender: TObject);
    procedure actTask_FinallyUpdate(Sender: TObject);
    procedure actTask_CloseExecute(Sender: TObject);
    procedure actTask_CloseUpdate(Sender: TObject);
    procedure actTask_ActionExecute(Sender: TObject);
    procedure actTask_ActionUpdate(Sender: TObject);
    procedure actTask_ScoreUpdate(Sender: TObject);
    procedure actTask_ScoreExecute(Sender: TObject);
    procedure actTask_AddItemUpdate(Sender: TObject);
    procedure actTask_CreateBymeExecute(Sender: TObject);
    procedure dgTaskListDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure actTask_FirstPageUpdate(Sender: TObject);
    procedure actTask_FirstPageExecute(Sender: TObject);
    procedure actTask_LastpageUpdate(Sender: TObject);
    procedure actTask_LastpageExecute(Sender: TObject);
    procedure actTask_UpPageUpdate(Sender: TObject);
    procedure actTask_UpPageExecute(Sender: TObject);
    procedure actTask_NextPageUpdate(Sender: TObject);
    procedure actTask_NextPageExecute(Sender: TObject);
  private
    { Private declarations }
    fTaskPageRec : TTaskPageRec;
    
    procedure LoadProjectItem();
    function  GetTaskItemPageCount(APageIndex:integer;AWhereStr:String):integer; //取出页总数
    procedure LoadTaskItem(APageIndex:integer;Awhere:String); //加载任务单
    function BuildCode_Task():String; //生成任务单号
  public
    procedure initBase; override;
    procedure freeBase; override;
    procedure Showfrm ; override;  //显示后发生的事件
    procedure Closefrm; override;  //关闭显示发生的事件
    class function GetModuleID : integer;override;

  end;

var
  ProjectManageClientDlg: TProjectManageClientDlg;

implementation
uses
  ClinetSystemUnits,
  DmUints,
  TaskScorefrm,               {评分}
  SelectUsersfrm,             {选择用户}  
  NewTaskfrm                  {新建任务单}
  ;


{$R *.dfm}

{ TProjectManageClientDlg }

procedure TProjectManageClientDlg.Closefrm;
begin
  inherited;

end;

procedure TProjectManageClientDlg.freeBase;
begin
  inherited;
end;

procedure TProjectManageClientDlg.initBase;
var
  i : integer;
  mycds : TClientDataSet;
  myfield : TFieldDef;
const
  glSQL  = 'select ZID,ZNAME from TB_TASK_PARAMS where ZTYPE=%d';
  glSQL2 = 'select * from TB_TASK_USER where 1=0';
  glSQL3 = 'select * from TB_TASK_ITEM where 1=0';
begin
  with ClientSystem.fDbOpr do
  begin
    cdsStatus.Data   := ReadDataSet(PChar(format(glSQL,[1]))); //状态
    cdsTaskType.Data := ReadDataSet(PChar(format(glSQL,[2]))); //类型
  end;

  mycds := TClientDataSet.Create(nil);
  try
    mycds.data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL2));

    if cdsTaskUser.Active then
      cdsTaskUser.Close;
    cdsTaskUser.FieldDefs.Clear;
    cdsTaskUser.FieldDefs.Assign(mycds.FieldDefs);
    with cdsTaskUser.FieldDefs do
    begin
      myField := AddFieldDef;
      myField.Name := 'ZISNEW';   //是否是新增
      myField.DataType := ftBoolean;
      with cdsTaskUser do
      begin
        for i:=0 to FieldDefs.Count -1 do
           FieldDefs[i].CreateField(cdsTaskUser);
      end;

      myField := AddFieldDef;
      myField.Name := 'ZUSERNAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsTaskUser) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZUSER_ID';
        LookupDataSet := DM.cdsUser;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

    end;
    cdsTaskUser.CreateDataSet;
  finally
    mycds.Free;
  end;

  mycds := TClientDataSet.Create(nil);
  try
    mycds.data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL3));

    if cdsTaskItem.Active then
      cdsTaskItem.Close;
    cdsTaskItem.FieldDefs.Clear;
    cdsTaskItem.FieldDefs.Assign(mycds.FieldDefs);
    with cdsTaskItem.FieldDefs do
    begin
      myField := AddFieldDef;
      myField.Name := 'ZISNEW';   //是否是新增
      myField.DataType := ftBoolean;
      with cdsTaskItem do
      begin
        for i:=0 to FieldDefs.Count -1 do
           FieldDefs[i].CreateField(cdsTaskItem);
      end;

      myField := AddFieldDef;
      myField.Name := 'ZUSERNAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsTaskItem) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZUSER_ID';
        LookupDataSet := DM.cdsUser;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

      myField := AddFieldDef;
      myField.Name := 'ZNO';
      myField.DataType := ftInteger;
      with myField.CreateField(cdsTask) do FieldKind := fkCalculated;

      myField := AddFieldDef;
      myField.Name := 'ZMYID';   // 对应与库的ZID ，因为ZID是自动的
      myField.DataType := ftInteger;
      myField.CreateField(cdsTask);
    end;
    cdsTaskItem.CreateDataSet;
    
  finally
    mycds.Free;
  end;



  LoadProjectItem();
end;

procedure TProjectManageClientDlg.Showfrm;
begin
  inherited;

end;

procedure TProjectManageClientDlg.actPro_AddExecute(Sender: TObject);
begin
  if ClientSystem.fEditerType = etAdmin then
    cdsProjectItem.Append
  else
    MessageBox(Handle,'无权限','增加',MB_ICONWARNING+MB_OK);
end;

procedure TProjectManageClientDlg.cbEditProItemClick(Sender: TObject);
begin
  if cbEditProItem.Checked then
  begin
    dgProItem.Options := dgProItem.Options - [dgRowSelect];
    dgProItem.Options := dgProItem.Options + [dgEditing];
  end
  else begin
    dgProItem.Options := dgProItem.Options + [dgRowSelect];
    dgProItem.Options := dgProItem.Options - [dgEditing];
  end;
end;

procedure TProjectManageClientDlg.actPro_AddUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cbEditProItem.Checked and
   not (cdsProjectItem.State in [dsEdit,dsInsert]);
end;

procedure TProjectManageClientDlg.actPro_SaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cbEditProItem.Checked
  and (cdsProjectItem.State in [dsEdit,dsInsert]);
end;

procedure TProjectManageClientDlg.cdsProjectItemBeforePost(
  DataSet: TDataSet);
var
  mySQL : String;
const
  glSQL  = 'insert into TB_PRO_ITEM(ZNAME,ZOPENDATE,ZMANAGERID,ZUNITS) ' +
           ' values(''%s'',''%s'',%d,''%s'')';
  glSQL2 = 'update TB_PRO_ITEM set ZNAME=''%s'',ZOPENDATE=''%s'',ZMANAGERID=%d, ' +
           'ZUNITS=''%s'',ZHIGHVERID=%d where ZID=%d';
begin
  if fLoading then Exit;
  //usUnmodified, usModified, usInserted, usDeleted
  //1.是新增
  if not DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    mySQL := format(glSQL2,[
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZOPENDATE').AsString,
      DataSet.FieldByName('ZMANAGERID').AsInteger,
      DataSet.FieldByName('ZUNITS').AsString,
      DataSet.FieldByName('ZHIGHVERID').AsInteger,
      DataSet.FieldByName('ZID').AsInteger]);
    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      ClientSystem.fDbOpr.CommitTrans;
    except
      ClientSystem.fDbOpr.RollbackTrans;
      MessageBox(Handle,'保存失败','错误',MB_ICONERROR+MB_OK);
      Abort;
    end;
  end
  else begin
    mySQL := format(glSQL,[
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZOPENDATE').AsString,
      DataSet.FieldByName('ZMANAGERID').AsInteger,
      DataSet.FieldByName('ZUNITS').AsString]);
    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      ClientSystem.fDbOpr.CommitTrans;
      DataSet.FieldByName('ZISNEW').AsBoolean := False;
    except
      ClientSystem.fDbOpr.RollbackTrans;
      MessageBox(Handle,'保存失败','错误',MB_ICONERROR+MB_OK);
      Abort;
    end;
  end;
end;

procedure TProjectManageClientDlg.cdsProjectItemNewRecord(
  DataSet: TDataSet);
begin
  DataSet.FieldByName('ZOPENDATE').AsDateTime := ClientSystem.SysNow;
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
  DataSet.FieldByName('ZISLOAD').AsBoolean := False;
end;

procedure TProjectManageClientDlg.actPro_CancelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cbEditProItem.Checked and
  (cdsProjectItem.State in [dsEdit,dsInsert]);
end;

procedure TProjectManageClientDlg.actPro_CancelExecute(Sender: TObject);
begin
  cdsProjectItem.Cancel;
end;

procedure TProjectManageClientDlg.actPro_SaveExecute(Sender: TObject);
begin
  if ClientSystem.fEditerType = etAdmin then
    cdsProjectItem.Post
  else
    MessageBox(Handle,'无权限','增加',MB_ICONWARNING+MB_OK);
end;

procedure TProjectManageClientDlg.actPro_DelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cbEditProItem.Checked and
   not (cdsProjectItem.State in [dsEdit,dsInsert]) and
   not cdsProjectItem.IsEmpty;
end;

procedure TProjectManageClientDlg.actPro_DelExecute(Sender: TObject);
begin
  if not (ClientSystem.fEditerType = etAdmin) then
  begin
    MessageBox(Handle,'无权限','增加',MB_ICONWARNING+MB_OK);
    Exit;
  end;  

  if MessageBox(Handle,'确定删除项目?','询问',MB_ICONERROR+MB_YESNO)=IDNO then
    Exit;
  cdsProjectItem.Delete;
end;

procedure TProjectManageClientDlg.cdsProjectItemBeforeDelete(
  DataSet: TDataSet);
var
  mySQL : string;
const
  glSQL3 = 'delete TB_PRO_ITEM where ZID=%d';
  glSQL4 = 'delete TB_PRO_VERSION where ZPRO_ID=%d';
begin
  if fLoading then Exit;
  ClientSystem.fDbOpr.BeginTrans;
  try
    mySQL := format(glSQL4,[DataSet.FieldByName('ZID').AsInteger]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
    mySQL := format(glSQL3,[DataSet.FieldByName('ZID').AsInteger]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
    ClientSystem.fDbOpr.CommitTrans;
  except
    ClientSystem.fDbOpr.RollbackTrans;
  end;
end;

procedure TProjectManageClientDlg.pcProjectChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := not cdsProjectItem.IsEmpty;
  if AllowChange then
  begin
    if not cdsProjectItem.FieldByName('ZISLoad').AsBoolean then
    begin
      MessageBox(Handle,'新增的立项目项目不能立刻新建版本，必须先点[刷新数据]',
        '提示',MB_ICONWARNING+MB_OK);
      AllowChange := False;
      Exit;
    end;
  end;
end;

procedure TProjectManageClientDlg.pcProjectChange(Sender: TObject);
var
  c,i : integer;
  myField : TFieldDef;
  myb : Boolean;
  mywherestr : string;
const
  glSQL  = 'select * from TB_PRO_VERSION where ZPRO_ID=%d Order by ZID desc';
begin
  //1.项目版本
  if pcProject.ActivePage = tsProjectVer then
  begin
    //权限
    if  not HasModuleActionByShow(Ord(psVersion),
        cdsProjectItem.FieldByName('ZID').AsInteger,atView) then
    begin
      pcProject.ActivePageIndex := 0;
      Exit;
    end;

    myb := fLoading;
    fLoading := True;
    try
      cdsTemp.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(
        Format(glSQL,[
          cdsProjectItem.FieldByName('ZID').Asinteger])));
      //增加序号的列名
      if cdsProVersion.Active then cdsProVersion.Close;
      cdsProVersion.FieldDefs.Clear;
      cdsProVersion.FieldDefs.Assign(cdsTemp.FieldDefs);
      with cdsProVersion.FieldDefs do
      begin
        myField := AddFieldDef;
        myField.Name := 'ZNO';
        myField.DataType := ftInteger;
        myField := AddFieldDef;
        myField.Name := 'ZISNEW';   //是否是新增
        myField.DataType := ftBoolean;
      end;
      //因为 ZID只读有问题，所以去掉 ,并将自动计算去掉
      for i:=0 to cdsProVersion.FieldDefs.Count -1 do
      begin
        if faReadonly in cdsProVersion.FieldDefs[i].Attributes then
          cdsProVersion.FieldDefs[i].Attributes :=
            cdsProVersion.FieldDefs[i].Attributes - [faReadonly];
        if cdsProVersion.FieldDefs[i].DataType = ftAutoInc then
          cdsProVersion.FieldDefs[i].DataType := ftInteger;
      end;

      cdsProVersion.CreateDataSet;
      c := 1;
      cdsTemp.First;
      while not cdsTemp.Eof do
      begin
        cdsProVersion.Append;
        cdsProVersion.FieldByName('ZNO').AsInteger := c;
        cdsProVersion.FieldByName('ZISNEW').AsBoolean := False;
        for i := 0 to cdsTemp.FieldDefs.Count -1 do
          cdsProVersion.FieldByName(cdsTemp.FieldDefs[i].Name).AsVariant :=
            cdsTemp.FieldByName(cdsTemp.FieldDefs[i].Name).AsVariant;
        inc(c);
        cdsProVersion.Post;
        cdsTemp.Next;
      end;
      cdsProVersion.First;
    finally
      fLoading := myb;
    end;
  end
  //任务单
  else if pcProject.ActivePage = tsTask then
  begin
    //权限
    if  not HasModuleActionByShow(Ord(psTask),
        cdsProjectItem.FieldByName('ZID').AsInteger,atView) then
    begin
      pcProject.ActivePageIndex := 0;
      Exit;
    end;
    if (not cdsProVersion.Active) or (cdsProVersion.IsEmpty) then
    begin
      MessageBox(Handle,'请选择版本号','提示',MB_ICONWARNING+MB_OK);
      pcProject.ActivePageIndex := 0;
      Exit;
    end;

    myb := fLoading;
    fLoading := True;
    try
      mywherestr := format('ZPRO_ID=%d and ZPRO_VERSION_ID=%d',
        [cdsProjectItem.FieldByName('ZID').Asinteger,
        cdsProVersion.FieldByName('ZID').AsInteger]);

      fTaskPageRec.fCount := GetTaskItemPageCount(1,mywherestr);
      fTaskPageRec.fPageindex := 1;
      fTaskPageRec.fwhere :=mywherestr;
      LoadTaskItem(1,mywherestr);

    finally
      fLoading := myb;
    end;

  end;

end;

procedure TProjectManageClientDlg.cdsProVersionNewRecord(
  DataSet: TDataSet);
begin
  if fLoading then Exit;
  DataSet.FieldByName('ZPRO_ID').AsInteger :=
    cdsProjectItem.FieldByName('ZID').AsInteger;
  DataSet.FieldByName('ZUPDATEDATE').AsDateTime := ClientSystem.SysNow;
  DataSet.FieldByName('ZMUSTVER').AsBoolean := False;
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
end;

procedure TProjectManageClientDlg.actVer_AddUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cbVersionEdit.Checked and
  not (cdsProVersion.State in [dsEdit,dsInsert]);
end;

procedure TProjectManageClientDlg.actVer_AddExecute(Sender: TObject);
begin
  if not (ClientSystem.fEditerType=etAdmin) then
  begin
    MessageBox(Handle,'无权限','提示',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if  not HasModuleActionByShow(Ord(psVersion),
      cdsProjectItem.FieldByName('ZID').AsInteger,atInsert) then
    Exit;
  cdsProVersion.Append;
end;

procedure TProjectManageClientDlg.actVer_SaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cbVersionEdit.Checked and
  (cdsProVersion.State in [dsEdit,dsInsert]);
end;

procedure TProjectManageClientDlg.actVer_SaveExecute(Sender: TObject);
begin
  if not (ClientSystem.fEditerType=etAdmin) then
  begin
    MessageBox(Handle,'无权限','提示',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if  not HasModuleActionByShow(Ord(psVersion),
      cdsProjectItem.FieldByName('ZID').AsInteger,atUpdate) then
    Exit;

  cdsProVersion.Post;
end;

procedure TProjectManageClientDlg.cdsProVersionBeforePost(
  DataSet: TDataSet);
var
  mySQL : String;
const
  glSQL  = 'update TB_PRO_VERSION set ZVER=''%s'',ZUPDATEDATE=''%s'',' +
           'ZCONTEXT=''%s'',ZMUSTVER=%d where ZID=%d and ZPRO_ID=%d';
  glSQL2 = 'insert TB_PRO_VERSION (ZPRO_ID,ZVER,ZUPDATEDATE,ZCONTEXT,ZMUSTVER) ' +
           'values(%d,''%s'',''%s'',''%s'',%d)';
  glSQL3 = 'update TB_PRO_ITEM set ZLASTVER=''%s'',ZLASTDATE=''%s'',ZHIGHVERID=%d '+
           ' where ZID=%d';
begin
  if fLoading then Exit;

  if not DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    mySQL := format(glSQL,[
      DataSet.FieldByName('ZVER').AsString,
      DataSet.FieldByName('ZUPDATEDATE').AsString,
      DataSet.FieldByName('ZCONTEXT').AsString,
      Ord(DataSet.FieldByName('ZMUSTVER').AsBoolean),
      DataSet.FieldByName('ZID').Asinteger,
      DataSet.FieldByName('ZPRO_ID').Asinteger]);
    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      //如改了是当前的最高版本,则要处理
      if DataSet.FieldByName('ZID').AsInteger =
        cdsProjectItem.FieldByName('ZHIGHVERID').AsInteger then
      begin
        mySQL := format(glSQL3,[
        DataSet.FieldByName('ZVER').AsString,
        DataSet.FieldByName('ZUPDATEDATE').AsString,
        DataSet.FieldByName('ZID').AsInteger,
        cdsProjectItem.FieldByName('ZID').Asinteger]);
        ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      end;

      ClientSystem.fDbOpr.CommitTrans;
    except
      ClientSystem.fDbOpr.RollbackTrans;
    end;
  end
  else begin
    mySQL := format(glSQL2,[
      cdsProjectItem.FieldByName('ZID').Asinteger,
      DataSet.FieldByName('ZVER').AsString,
      DataSet.FieldByName('ZUPDATEDATE').AsString,
      DataSet.FieldByName('ZCONTEXT').AsString,
      Ord(DataSet.FieldByName('ZMUSTVER').AsBoolean)]);

    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      //更新项目的最高版本与日期
      mySQL := format(glSQL3,[
        DataSet.FieldByName('ZVER').AsString,
        DataSet.FieldByName('ZUPDATEDATE').AsString,
        DataSet.FieldByName('ZID').AsInteger,
        cdsProjectItem.FieldByName('ZID').Asinteger]);
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      ClientSystem.fDbOpr.CommitTrans;
      DataSet.FieldByName('ZISNEW').AsBoolean := False;
    except
      ClientSystem.fDbOpr.RollbackTrans;
    end;
  end;
end;

procedure TProjectManageClientDlg.cbVersionEditClick(Sender: TObject);
begin
  if cbVersionEdit.Checked then
  begin
    dgProVersion.Options := dgProVersion.Options - [dgRowSelect];
    dgProVersion.Options := dgProVersion.Options + [dgEditing];
  end
  else begin
    dgProVersion.Options := dgProVersion.Options + [dgRowSelect];
    dgProVersion.Options := dgProVersion.Options - [dgEditing];
  end;
  dbmContext.ReadOnly := not cbVersionEdit.Checked;
end;

class function TProjectManageClientDlg.GetModuleID: integer;
begin
  Result := Ord(mtProject);
end;

procedure TProjectManageClientDlg.actVer_DelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cbVersionEdit.Checked and
  not (cdsProVersion.State in [dsEdit,dsInsert]);
end;

procedure TProjectManageClientDlg.actVer_DelExecute(Sender: TObject);
begin
  if not (ClientSystem.fEditerType=etAdmin) then
  begin
    MessageBox(Handle,'无权限','提示',MB_ICONERROR+MB_OK);
    Exit;
  end;

  if  not HasModuleActionByShow(Ord(psVersion),
      cdsProjectItem.FieldByName('ZID').AsInteger,atDelete) then
    Exit;

  if MessageBox(Handle,'删除吗?','询问',MB_ICONQUESTION+MB_YESNO)=IDNO then Exit;
  cdsProVersion.Delete;
end;

procedure TProjectManageClientDlg.cdsProVersionBeforeDelete(
  DataSet: TDataSet);
var
  mySQL : string;
const
  glSQL = 'delete TB_PRO_VERSION where ZID=%d';
begin
  ClientSystem.fDbOpr.BeginTrans;
  try
    mySQL := format(glSQL,[DataSet.FieldByName('ZID').AsInteger]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
    ClientSystem.fDbOpr.CommitTrans;
  except
    ClientSystem.fDbOpr.RollbackTrans;
  end;
end;

procedure TProjectManageClientDlg.actvar_CancelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cbVersionEdit.Checked and
  (cdsProVersion.State in [dsEdit,dsInsert]);
end;

procedure TProjectManageClientDlg.actvar_CancelExecute(Sender: TObject);
begin
  cdsProVersion.Cancel;
end;

procedure TProjectManageClientDlg.LoadProjectItem;
var
  i : integer;
  mycds : TClientDataSet;
  myfield : TFieldDef;
  myb : Boolean;
const
  glSQL = 'select * from TB_PRO_ITEM';
begin
  ClientSystem.BeginTickCount;
  mycds := TClientDataSet.Create(nil);
  myb := fLoading ;
  fLoading := True;
  try
    mycds.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL));

    if cdsProjectItem.Fields.Count = 0 then
    begin
      with cdsProjectItem do
      begin
        FieldDefs.Assign(mycds.FieldDefs);
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZISNEW';
        myfield.DataType := ftBoolean;
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZISLOAD';
        myfield.DataType := ftBoolean;
        //因为 ZID只读有问题，所以去掉 ,并将自动计算去掉
        for i:=0 to FieldDefs.Count -1 do
        begin
          if faReadonly in FieldDefs[i].Attributes then
            FieldDefs[i].Attributes := FieldDefs[i].Attributes - [faReadonly];
          if FieldDefs[i].DataType = ftAutoInc then
            FieldDefs[i].DataType := ftInteger;
        end;
        for i:=0 to FieldDefs.Count -1 do
          FieldDefs[i].CreateField(cdsProjectItem).Alignment := taLeftJustify;

        //问题类型
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZUSERNAME';
        myfield.DataType := ftString;
        myfield.Size := 50;
        with myfield.CreateField(cdsProjectItem) do
        begin
          FieldKind := fkLookup;
          KeyFields := 'ZMANAGERID';
          LookupDataSet := DM.cdsUser;
          LookupKeyFields := 'ZID';
          LookupResultField := 'ZNAME';
        end;

        CreateDataSet;
      end;
    end
    else begin
      cdsProjectItem.DisableControls;
      try
        while not cdsProjectItem.IsEmpty do cdsProjectItem.Delete;
      finally
        cdsProjectItem.EnableControls;
      end;
    end;

    cdsProjectItem.DisableControls;
    try
      mycds.First;
      while not mycds.Eof do
      begin
        cdsProjectItem.Append;
        cdsProjectItem.FieldByName('ZISNEW').AsBoolean  := False;
        cdsProjectItem.FieldByName('ZISLOAD').AsBoolean := True;
        for i:=0 to mycds.FieldDefs.Count -1 do
          cdsProjectItem.FieldByName(mycds.FieldDefs[i].Name).AsVariant :=
            mycds.FieldByName(mycds.FieldDefs[i].Name).AsVariant;
        cdsProjectItem.Post;
        mycds.Next;
      end;
      cdsProjectItem.First;
    finally
      cdsProjectItem.EnableControls;
    end;
  finally
    mycds.Free;
    fLoading := myb;
    ClientSystem.EndTickCount;
  end;
end;

procedure TProjectManageClientDlg.actPro_RefreshDataExecute(Sender: TObject);
begin
  LoadProjectItem;
end;

procedure TProjectManageClientDlg.cdsTaskCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('ZNO').AsInteger := DataSet.RecNo;
end;

procedure TProjectManageClientDlg.actTask_CreaetExecute(Sender: TObject);
var
  myform : TNewTaskDlg;
begin
  //权限
  if not HasModuleActionByShow(Ord(psTask),
    cdsProjectItem.FieldByName('ZID').AsInteger,
    atInsert) then
    Exit;

  myform := TNewTaskDlg.Create(nil);
  try
    if cdsTask.State in [dsEdit,dsInsert] then
      cdsTask.Post;
    cdsTask.Append;
    if myform.ShowModal() = mrOK then
    begin
      cdsTask.Post;
    end
    else
      cdsTask.Cancel;
  finally
    myform.free;
  end;
end;

procedure TProjectManageClientDlg.cdsTaskNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ZDATE').AsDateTime := ClientSystem.SysNow;
  DataSet.FieldByName('ZCODE').AsString   := BuildCode_Task();
  DataSet.FieldByName('ZUSER_ID').AsInteger := ClientSystem.fEditer_id;
  DataSet.FieldByName('ZSTATUS').AsInteger := 0;
  DataSet.FieldByName('ZPRO_ID').AsInteger :=
    cdsProjectItem.FieldByName('ZID').AsInteger;
  DataSet.FieldByName('ZPRO_VERSION_ID').AsInteger :=
    cdsProVersion.FieldByName('ZID').AsInteger;
  DataSet.FieldByName('ZPALNDAY').AsInteger := 0;
  DataSet.FieldByName('ZDESIGN').AsString   := '#设计说明';
  DataSet.FieldByName('ZTESTCASE').AsString := '#测试用例';
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
end;

function TProjectManageClientDlg.BuildCode_Task: String;
begin
  Result := format('U%d_TASK_%S',[ClientSystem.fEditer_id,
    formatdatetime('yyyymmhhhhmmss',ClientSystem.SysNow)]);
end;

procedure TProjectManageClientDlg.cdsTaskBeforePost(DataSet: TDataSet);
var
  mySQL : String;
const
  glSQL = 'insert TB_TASK(ZCODE,ZTYPE,ZNAME,ZUSER_ID,ZPRO_ID, ' +
          'ZPRO_VERSION_ID,ZDESIGN,ZTESTCASE,ZSTATUS,ZDATE,ZPALNDAY) ' +
          'values(''%s'',%d,''%s'',%d,%d,%d,''%s'',''%s'',%d,''%s'',%d)';
  glSQL2 = 'update TB_TASK set ZSTATUS=%d,ZDESIGN=''%s'',ZTESTCASE=''%s'' ' +
           'where ZCODE=''%s''';
  glSQL3 = 'update TB_TASK set ZSTATUS=%d,ZDESIGN=''%s'',ZTESTCASE=''%s'', ' +
           'ZNAME=''%s'',ZPALNDAY=%d,ZBEGINDATE=''%s'',ZDAY=%d, ' +
           'ZSUCCESSDATE=''%s'',ZCLOSEDATE=''%s''' +
           'where ZCODE=''%s''';

begin
  if fLoading then Exit;
  //保存
  if DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    mySQL := format(glSQL,[
      DataSet.FieldByName('ZCODE').AsString,
      DataSet.FieldByName('ZTYPE').AsInteger,
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZUSER_ID').AsInteger,
      DataSet.FieldByName('ZPRO_ID').AsInteger,
      DataSet.FieldByName('ZPRO_VERSION_ID').AsInteger,
      DataSet.FieldByName('ZDESIGN').AsString,
      DataSet.FieldByName('ZTESTCASE').AsString,
      DataSet.FieldByName('ZSTATUS').AsInteger,
      DataSet.FieldByName('ZDATE').AsString,
      DataSet.FieldByName('ZPALNDAY').AsInteger]);

    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      DataSet.FieldByName('ZISNEW').AsBoolean := False;
      ClientSystem.fDbOpr.CommitTrans;
    except
      DataSet.Cancel;
      ClientSystem.fDbOpr.RollbackTrans;
    end;
  end
  else begin
    if DataSet.FieldByName('ZUSER_ID').AsInteger = ClientSystem.fEditer_id then
    begin
      mySQL := format(glSQL3,[
        DataSet.FieldByName('ZSTATUS').AsInteger,
        DataSet.FieldByName('ZDESIGN').AsString,
        DataSet.FieldByName('ZTESTCASE').AsString,
        DataSet.FieldByName('ZNAME').AsString,
        DataSet.FieldByName('ZPALNDAY').AsInteger,
        DataSet.FieldByName('ZBEGINDATE').AsString,
        DataSet.FieldByName('ZDAY').AsInteger,
        DataSet.FieldByName('ZSUCCESSDATE').AsString,
        DataSet.FieldByName('ZCLOSEDATE').AsString,
        DataSet.FieldByName('ZCODE').AsString]);
    end
    else begin
      mySQL := format(glSQL2,[
        DataSet.FieldByName('ZSTATUS').AsInteger,
        DataSet.FieldByName('ZDESIGN').AsString,
        DataSet.FieldByName('ZTESTCASE').AsString,
        DataSet.FieldByName('ZCODE').AsString]);
    end;
    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      ClientSystem.fDbOpr.CommitTrans;
    except
      DataSet.Cancel;
      ClientSystem.fDbOpr.RollbackTrans;
    end;
  end;
end;

procedure TProjectManageClientDlg.cbEditDesingClick(Sender: TObject);
begin
  DBMDesign.ReadOnly := not cbEditDesing.Checked;
  DBMTestCase.ReadOnly := not cbEditDesing.Checked;
  dbmItemDeign.ReadOnly := not cbEditDesing.Checked;
end;

procedure TProjectManageClientDlg.actTask_SaveExecute(Sender: TObject);
begin
  if cdsTask.State in [dsEdit,dsInsert] then
    cdsTask.Post;
  if cdsTaskUser.State in [dsEdit,dsInsert] then
  begin
    if cdsTask.FieldByName('ZUSER_ID').AsInteger <> ClientSystem.fEditer_id then
    begin
      MessageBox(Handle,'不是你创建的任务单，不能评分。','提示',
        MB_ICONWARNING+MB_OK);
      cdsTaskUser.Cancel;
    end
    else
      cdsTaskUser.Post;
  end;
  if cdsTaskItem.State in [dsEdit,dsInsert] then
    cdsTaskItem.Post;
end;

procedure TProjectManageClientDlg.actTask_SaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (cdsTask.State in [dsEdit,dsInsert])
    or (cdsTaskUser.State in [dsEdit,dsInsert])
    or (cdsTaskItem.State in [dsEdit,dsInsert]);
end;

procedure TProjectManageClientDlg.actTask_toUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (not cdsTask.IsEmpty) and
   not (cdsTask.FieldByName('ZSTATUS').AsInteger in [Ord(tsSccuess),Ord(tsClose)]);
end;

procedure TProjectManageClientDlg.actTask_toExecute(Sender: TObject);
var
  i : integer;
  myfrom : TSelectUsersDlg;
begin
  //只有我创建的任务才能分给别人
  if (cdsTask.FieldByName('ZUSER_ID').AsInteger <> ClientSystem.fEditer_id) then
  begin
    MessageBox(Handle,'不是你创建的任务，不能指派给别人。','提示',
      MB_ICONWARNING+MB_OK);
    Exit;
  end;

  myfrom := TSelectUsersDlg.Create(nil);
  try
    if myfrom.ShowModal = mrOK then
    begin
      for i:=0 to myfrom.lbUserCode.Count -1 do
      begin
        if not
          cdsTaskUser.Locate('ZUSER_ID',myfrom.lbUserCode.Items[i],
            [loPartialKey]) then
        begin
          //加入库内
          cdsTaskUser.Append;
          cdsTaskUser.FieldByName('ZISNEW').AsBoolean := True;
          cdsTaskUser.FieldByName('ZTASK_CODE').AsString :=
            cdsTask.FieldByName('ZCODE').AsString;
          cdsTaskUser.FieldByName('ZUSER_ID').AsInteger :=
            strtoint(myfrom.lbUserCode.Items[i]);
          cdsTaskUser.FieldByName('ZCANCEL').AsBoolean := False;
          cdsTaskUser.Post;

          if not(cdsTask.State in [dsEdit,dsInsert]) then
            cdsTask.Edit;
          cdsTask.FieldByName('ZSTATUS').AsInteger := Ord(tsing);
          cdsTask.FieldByName('ZBEGINDATE').AsString :=
            formatdatetime('yyyy-mm-dd hh:ss:mm',ClientSystem.SysNow);
          cdsTask.Post;
        end;
      end;
      //执行邮件通知
      ClientSystem.fDbOpr.MailTo(1,cdsTask.FieldByName('ZCODE').AsString,-1);
    end;
  finally
    myfrom.Free;
  end;

end;

procedure TProjectManageClientDlg.cdsTaskAfterScroll(DataSet: TDataSet);
var
  i : integer;
  mySQL : string;
  mycds : TClientDataSet;
  myb   : Boolean;
  myme  : Boolean;
const
  glSQL = 'select * from TB_TASK_USER where ZTASK_CODE=''%s''';
  glSQL2 = 'select * from TB_TASK_ITEM where ZTASK_CODE=''%s''';
begin
  //
  if fLoading then Exit;
  
  if cdsTaskUser.State in [dsEdit,dsInsert] then
    cdsTaskUser.Post;
  if cdsTaskItem.State in [dsEdit,dsInsert] then
    cdsTaskItem.Post;

  myme := False;
  myb := fLoading;
  fLoading := True;
  try
    cdsTaskUser.DisableConstraints;
    try
      while not cdsTaskUser.Eof do
        cdsTaskuser.Delete;
    finally
      cdsTaskUser.EnableConstraints;
    end;

    mySQL := format(glSQL,[DataSet.FieldByName('ZCODE').AsString]);
    mycds := TClientDataSet.Create(nil);
    cdsTaskUser.DisableConstraints;
    try
      mycds.data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));
      mycds.First;
      while not mycds.Eof do
      begin
        cdsTaskUser.Append;
        cdsTaskUser.FieldByName('ZISNEW').AsBoolean := False;
        for i:= 0 to mycds.FieldDefs.Count -1 do
          cdsTaskUser.FieldByName(mycds.FieldDefs[i].Name).AsVariant :=
            mycds.fieldByName(mycds.FieldDefs[i].Name).AsVariant;
        cdsTaskUser.Post;
        if not myme and
           (mycds.FieldByName('ZUSER_ID').AsInteger = ClientSystem.fEditer_id) then
          myme := True;
        mycds.Next;
      end;
      cdsTaskUser.First;
      plScore.Visible := myme or (cdsTask.FieldByName('ZUSER_ID').AsInteger=
        ClientSystem.fEditer_id);
    finally
      mycds.Free;
      cdsTaskUser.EnableConstraints;
    end;

    //2.任务进度
    cdsTaskItem.DisableConstraints;
    try
      while not cdsTaskItem.Eof do
        cdsTaskItem.Delete;
    finally
      cdsTaskItem.EnableConstraints;
    end;

    mySQL := format(glSQL2,[DataSet.FieldByName('ZCODE').AsString]);
    mycds := TClientDataSet.Create(nil);
    cdsTaskItem.DisableConstraints;
    try
      mycds.data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));
      mycds.First;
      while not mycds.Eof do
      begin
        cdsTaskItem.Append;
        cdsTaskItem.FieldByName('ZISNEW').AsBoolean := False;
        for i:= 0 to mycds.FieldDefs.Count -1 do
        begin
          if mycds.FieldDefs[i].Name = 'ZID' then
            cdsTaskItem.FieldByName('ZMYID').AsInteger :=
              mycds.FieldByName('ZID').AsInteger
          else
            cdsTaskItem.FieldByName(mycds.FieldDefs[i].Name).AsVariant :=
              mycds.fieldByName(mycds.FieldDefs[i].Name).AsVariant;
        end;
        cdsTaskItem.Post;
        mycds.Next;
      end;
      cdsTaskItem.First;
    finally
      mycds.Free;
      cdsTaskItem.EnableConstraints;
    end;

  finally
    fLoading := myb;
  end;
end;

procedure TProjectManageClientDlg.cdsTaskUserBeforePost(DataSet: TDataSet);
var
  myd : integer;
  mySQL : string;
const
  glSQL = 'insert into TB_TASK_USER (ZTASK_CODE,ZUSER_ID) values(''%s'',%d)';
  glSQL2 = 'update TB_TASK_USER set ZPERFACT=%d,ZSCORE=%d,ZREMASK=''%s'', ' +
           ' ZCANCEL=%d,ZSCOREDATE=''%s'' where ZTASK_CODE=''%s'' and ZUSER_ID=%d';
begin
  //
  if fLoading then Exit;
  if DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    mysql := format(glSQL,[dataSet.FieldByName('ZTASK_CODE').AsString,
      dataset.FieldByName('ZUSER_ID').AsInteger]);
    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      DataSet.FieldByName('ZISNEW').AsBoolean := False;
      ClientSystem.fDbOpr.CommitTrans;
    except
      DataSet.Cancel;
      ClientSystem.fDbOpr.RollbackTrans;
    end;
  end
  else begin
    if cdsTask.FieldByName('ZUSER_ID').AsInteger <> ClientSystem.fEditer_id then
    begin
      MessageBox(Handle,'你不是任务的创建人，不能修改。','提示',
        MB_ICONWARNING+MB_OK);
      DataSet.Cancel;
      Exit;
    end;

    myd := Ord(dataset.FieldByName('ZCANCEL').AsBoolean);
    mysql := format(glSQL2,[
      dataSet.FieldByName('ZPERFACT').AsInteger,
      dataSet.FieldByName('ZSCORE').AsInteger,
      dataset.FieldByName('ZREMASK').AsString,
      myd,
      dataset.FieldByName('ZSCOREDATE').AsString, //评分时间
      dataset.FieldByName('ZTASK_CODE').AsString,
      dataset.FieldByName('ZUSER_ID').AsInteger ]);
    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      ClientSystem.fDbOpr.CommitTrans;

    except
      DataSet.Cancel;
      ClientSystem.fDbOpr.RollbackTrans;
    end;
  end;
end;

procedure TProjectManageClientDlg.actTask_ToMeExecute(Sender: TObject);
var
  myb : Boolean;
begin
  //生成数据
  myb := fLoading;
  fLoading := True;
  cdsTask.DisableControls;
  try
    fTaskPageRec.fwhere := format('ZCODE in (Select  ZTASK_CODE from TB_TASK_USER as b ' +
        ' where ZCODE=b.ZTASK_CODE and b.ZCANCEL=0 and b.ZUSER_ID=%d)',[ClientSystem.fEditer_id]);
    fTaskPageRec.fPageindex := 1;
    fTaskPageRec.fCount := Self.GetTaskItemPageCount(1,fTaskPageRec.fwhere);
    LoadTaskItem(1,fTaskpageRec.fwhere);
  finally
    cdsTask.EnableControls;
    fLoading := myb;
  end;
end;

procedure TProjectManageClientDlg.actTask_AddItemExecute(Sender: TObject);
begin
  if cdsTaskItem.State in [dsEdit,dsInsert] then
    cdsTaskItem.Post;
  cdsTaskItem.Append;
end;

procedure TProjectManageClientDlg.cdsTaskItemNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ZTASK_CODE').AsString := cdsTask.FieldByName('ZCODE').AsString;
  DataSet.FieldByName('ZUSER_ID').AsInteger := ClientSystem.fEditer_id;
  dataSet.FieldByName('ZDATE').AsString :=
        formatdatetime('yyyy-mm-dd hh:ss:mm',ClientSystem.SysNow);
  dataSet.FieldByName('ZISNEW').AsBoolean := True;
end;

procedure TProjectManageClientDlg.cdsTaskItemBeforePost(DataSet: TDataSet);
var
  mySQL : String;
const
  glSQL = 'insert into TB_TASK_ITEM (ZTASK_CODE,ZDATE,ZDESIGN,ZUSER_ID) ' +
          'values(''%s'',''%s'',''%s'',%d)';
  glSQL2 = 'update TB_TASK_ITEM set ZDESIGN=''%s'' where ZID=%d ';

begin
  if fLoading then Exit;
  if dataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    mySQL := format(glSQL,[
      dataset.FieldByName('ZTASK_CODE').AsString,
      dataset.FieldByName('ZDATE').AsString,
      dataset.FieldByName('ZDESIGN').AsString,
      dataset.FieldByName('ZUSER_ID').AsInteger]);
    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      DataSet.FieldByName('ZISNEW').AsBoolean := False;
      ClientSystem.fDbOpr.CommitTrans;
    except
      DataSet.Cancel;
      ClientSystem.fDbOpr.RollbackTrans;
    end;
  end
  else begin
    if (dataset.FieldByName('ZUSER_ID').AsInteger <> ClientSystem.fEditer_id) then
    begin
      MessageBox(Handle,'不是你增加，不能编辑。','提示',
        MB_ICONWARNING+MB_OK);
      DataSet.Cancel;
      Exit;
    end;

    mysql := format(glSQL2,[
      dataset.FieldByName('ZDESIGN').AsString,
      dataset.FieldByName('ZMYID').AsInteger]);  //ZID
    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      ClientSystem.fDbOpr.CommitTrans;
    except
      DataSet.Cancel;
      ClientSystem.fDbOpr.RollbackTrans;
    end;
  end;
end;

procedure TProjectManageClientDlg.cdsTaskItemCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('ZNO').AsInteger := DataSet.RecNo;
end;

procedure TProjectManageClientDlg.actTask_FinallyExecute(Sender: TObject);
var
  mydate1,mydate2 : Tdate;
begin
  if cdsTaskUser.Locate('ZUSER_ID;ZCANCEL',VarArrayOf([ClientSystem.fEditer_id,0]),
    [loPartialKey]) then
  begin
    if not (cdsTask.State in [dsEdit,dsInsert]) then
      cdsTask.Edit;
    cdsTask.FieldByName('ZSTATUS').AsInteger := Ord(tsSccuess);
    cdsTask.FieldByName('ZSUCCESSDATE').AsString :=
      formatdatetime('yyyy-mm-dd hh:ss:mm',ClientSystem.SysNow);
    //计算完成的工期
    mydate1 := strtodate(formatdatetime('yyyy-mm-dd',strtodatetime(cdsTask.FieldByName('ZBEGINDATE').AsString)));
    mydate2 := strtodate(formatdatetime('yyyy-mm-dd',strtodatetime(cdsTask.FieldByName('ZSUCCESSDATE').AsString)));
    cdsTask.FieldByName('ZDAY').AsInteger := Trunc(mydate2-mydate1)+1;
    cdsTask.Post;
    //执行邮件通知
    ClientSystem.fDbOpr.MailTo(1,cdsTask.FieldByName('ZCODE').AsString,-1);
  end
  else begin
    MessageBox(Handle,'不是你的任务，不能提交完成。','提示',
      MB_ICONWARNING+MB_OK);
    Exit;
  end;
end;

procedure TProjectManageClientDlg.actTask_FinallyUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (not cdsTask.IsEmpty) and
   not (cdsTask.FieldByName('ZSTATUS').AsInteger in [Ord(tsSccuess),Ord(tsClose)]);
end;

procedure TProjectManageClientDlg.actTask_CloseExecute(Sender: TObject);
var
  mycds : TClientDataSet;
begin
  //关闭任务
  if MessageBox(Handle,'确定关闭任务吗?','提示',
    MB_ICONQUESTION+MB_YESNO)=IDNO then
    Exit;
  mycds := TClientDataSet.Create(nil);
  try
    mycds.CloneCursor(cdsTask,False);
    if mycds.Locate('ZUSER_ID',ClientSystem.fEditer_id,[loPartialKey]) then
    begin
      if not (cdsTask.State in [dsEdit,dsInsert]) then
        cdsTask.Edit;
      cdsTask.FieldByName('ZSTATUS').AsInteger := Ord(tsClose);
      cdsTask.FieldByName('ZCLOSEDATE').AsString :=
          formatdatetime('yyyy-mm-dd hh:ss:mm',ClientSystem.SysNow);
      cdsTask.Post;
      //执行邮件通知
      ClientSystem.fDbOpr.MailTo(1,cdsTask.FieldByName('ZCODE').AsString,-1);
    end
    else begin
      MessageBox(Handle,'不是你创建的任务，不能关闭。','提示',
        MB_ICONWARNING+MB_OK);
      Exit;
    end;
  finally
    mycds.Free;
  end;
end;

procedure TProjectManageClientDlg.actTask_CloseUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (not cdsTask.IsEmpty) and
   (cdsTask.FieldByName('ZSTATUS').AsInteger in [Ord(tsSccuess)]);
end;

procedure TProjectManageClientDlg.actTask_ActionExecute(Sender: TObject);
var
  mycsd : TClientDataSet;
begin
  if MessageBox(Handle,'你是不真要激活任务单吗,如有疑问先与任务单处理人联系.',
    '激活任务单',MB_ICONQUESTION+MB_YESNO)=IDNO then Exit;
    
  if cdsTaskUser.Locate('ZUSER_ID;ZCANCEL',VarArrayOf([ClientSystem.fEditer_id,0]),
    [loPartialKey]) then
  begin
    if not (cdsTask.State in [dsEdit,dsInsert]) then
      cdsTask.Edit;
    cdsTask.FieldByName('ZSTATUS').AsInteger := Ord(tsing);
    cdsTask.Post;
  end
  else begin
    mycsd := TClientDataSet.Create(nil);
    try
      mycsd.CloneCursor(cdsTask,False);
      if mycsd.Locate('ZUSER_ID',ClientSystem.fEditer_id,[loPartialKey]) then
      begin
        if not (cdsTask.State in [dsEdit,dsInsert]) then
          cdsTask.Edit;
        cdsTask.FieldByName('ZSTATUS').AsInteger := Ord(tsing);
        cdsTask.Post;
        //执行邮件通知
        ClientSystem.fDbOpr.MailTo(1,cdsTask.FieldByName('ZCODE').AsString,-1);
      end
      else begin
        MessageBox(Handle,'不是你执行任务或创建任务，不能提交激活。','提示',
          MB_ICONWARNING+MB_OK);
        Exit;
      end;
    finally
      mycsd.Free;
    end;
  end;
end;

procedure TProjectManageClientDlg.actTask_ActionUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (not cdsTask.IsEmpty) and
  (cdsTask.FieldByName('ZSTATUS').AsInteger in [Ord(tsSccuess),Ord(tsClose)]);
end;

procedure TProjectManageClientDlg.actTask_ScoreUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (not cdsTask.IsEmpty) and
  (cdsTask.FieldByName('ZSTATUS').AsInteger in [Ord(tsSccuess)]);
end;

procedure TProjectManageClientDlg.actTask_ScoreExecute(Sender: TObject);
var
  myfrom : TTaskScoreDlg;
  mycds : TClientDataSet;
begin
  mycds := TClientDataSet.Create(nil);
  mycds.CloneCursor(cdsTask,False);  //为了处理locate()方法定位问题。
  try
    if mycds.Locate('ZUSER_ID',ClientSystem.fEditer_id,[loPartialKey]) then
    begin
      myfrom := TTaskScoreDlg.Create(nil);
      try
        if not (cdsTaskUser.State in [dsEdit,dsInsert]) then
          cdsTaskUser.Edit;
          
        if myfrom.ShowModal() = mrOK then
        begin
          cdsTaskUser.FieldByName('ZSCOREDATE').AsString :=
            formatdatetime('yyyy-mm-dd hh:ss:mm',ClientSystem.SysNow);
          cdsTaskUser.Post;

        end
        else
          cdsTaskUser.Cancel;
      finally
        myfrom.Free;
      end;
    end;
  finally
    mycds.Free;
  end;
end;

procedure TProjectManageClientDlg.actTask_AddItemUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cbEditDesing.Checked;
end;

procedure TProjectManageClientDlg.actTask_CreateBymeExecute(
  Sender: TObject);
var
  myb : Boolean;
begin
  //生成数据
  myb := fLoading;
  fLoading := True;
  cdsTask.DisableControls;
  try
    fTaskPageRec.fwhere := format('ZUSER_ID=%d',[ClientSystem.fEditer_id]);
    fTaskPageRec.fPageindex := 1;
    fTaskPageRec.fCount := Self.GetTaskItemPageCount(1,fTaskPageRec.fwhere);
    LoadTaskItem(1,fTaskPageRec.fwhere);

    cdsTask.First;
  finally
    cdsTask.EnableControls;
    fLoading := myb;
  end;
end;

procedure TProjectManageClientDlg.dgTaskListDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (cdsTask.FieldByName('ZSTATUS').AsInteger = Ord(tsClose)) then
  begin
    dgTaskList.Canvas.Font.Color := clblue;
  end;
  dgTaskList.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TProjectManageClientDlg.LoadTaskItem(APageIndex: integer;
  Awhere: String);
var
  mySQL  : string;
  i : integer;
  myfield : TFieldDef;
  myb : Boolean;
const
    glSQL = 'exec pt_SplitPage ''TB_TASK'',' +
          '''ZCODE,ZTYPE,ZNAME,ZUSER_ID,ZPRO_ID,ZPRO_VERSION_ID,ZDESIGN,ZTESTCASE,' +
          'ZSTATUS,ZDATE,ZPALNDAY,ZBEGINDATE,ZDAY,ZSUCCESSDATE,ZCLOSEDATE'', ' +
          '''%s'',20,%d,%d,1,''%s''';
begin

  mySQL := format(glSQL,[
      'ZDATE',
      APageIndex,
      0,Awhere]);

  myb := fLoading;
  fLoading := True;
  cdsTask.DisableControls;
  ShowProgress('读取数据...',0);
  try
    lblPage.Caption := format('%d/%d',[fTaskPageRec.fPageindex,
      fTaskPageRec.fCount]);
    if cdsTemp.Active then  cdsTemp.Close;
      cdsTemp.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));
    if cdsTask.FieldDefs.Count = 0 then
    begin
      cdsTask.Fields.Clear;
      cdsTask.FieldDefs.Assign(cdsTemp.FieldDefs);
      for i:=0 to cdsTask.FieldDefs.Count -1 do
        cdsTask.FieldDefs[i].CreateField(cdsTask);

      with cdsTask.FieldDefs do
      begin
        myField := AddFieldDef;
        myField.Name := 'ZNO';
        myField.DataType := ftInteger;
        with myField.CreateField(cdsTask) do FieldKind := fkCalculated;

        myField := AddFieldDef;
        myField.Name := 'ZISNEW';   //是否是新增
        myField.DataType := ftBoolean;
        myField.CreateField(cdsTask);

        myField := AddFieldDef;
        myField.Name := 'ZSTATUSNAME';  //状态名称
        myField.DataType := ftString;
        with myField.CreateField(cdsTask) do
        begin
          FieldKind := fkLookup;
          KeyFields         := 'ZSTATUS';
          LookupDataSet     := cdsStatus;
          LookupKeyFields   := 'ZID';
          LookupResultField := 'ZNAME';
        end;

        myField := AddFieldDef;
        myField.Name := 'ZTYPENAME';    //类型名称
        myField.DataType := ftString;
        myfield.Size := 50;
        with myfield.CreateField(cdsTask) do
        begin
          FieldKind         := fkLookup;
          KeyFields         := 'ZTYPE';
          LookupDataSet     := cdsTaskType;
          LookupKeyFields   := 'ZID';
          LookupResultField := 'ZNAME';
        end;

        myField := AddFieldDef;
        myField.Name := 'ZUSERNAME';
        myField.DataType := ftString;
        myfield.Size := 50;
        with myfield.CreateField(cdsTask) do
        begin
          FieldKind         := fkLookup;
          KeyFields         := 'ZUSER_ID';
          LookupDataSet     := dm.cdsUser;
          LookupKeyFields   := 'ZID';
          LookupResultField := 'ZNAME';
        end;

      end;
      cdsTask.CreateDataSet;
    end//end count
    else begin
      while not cdsTask.IsEmpty do cdsTask.Delete;
    end;

    //生成数据
    cdsTemp.First;
    while not cdsTemp.Eof do
    begin
      cdsTask.Append;
      cdsTask.FieldByName('ZISNEW').AsBoolean := False;
      for i:=0 to cdsTemp.FieldDefs.Count -1 do
        cdsTask.FieldByName(cdsTemp.FieldDefs[i].Name).AsVariant :=
          cdsTemp.FieldByName(cdsTemp.FieldDefs[i].Name).AsVariant;
      cdsTask.Post;
      cdsTemp.Next;
    end;
    cdsTask.First;

  finally
    cdsTask.EnableControls;
    fLoading := myb;
    HideProgress;
  end;
end;

function TProjectManageClientDlg.GetTaskItemPageCount(APageIndex: integer;
  AWhereStr: String): integer;
var
  mySQL  : string;
  myRowCount : integer;
  mywhere : string;
const
  glSQL = 'exec pt_SplitPage ''TB_TASK'',' +
          '''ZCODE'', ''%s'',20,%d,%d,1,''%s''';
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


procedure TProjectManageClientDlg.actTask_FirstPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not fLoading
    and (fTaskPageRec.fPageindex<>1);
end;

procedure TProjectManageClientDlg.actTask_FirstPageExecute(
  Sender: TObject);
begin
  fTaskPageRec.fPageindex := 1;
  LoadTaskItem(1,fTaskPageRec.fwhere);
end;

procedure TProjectManageClientDlg.actTask_LastpageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not fLoading
  and (fTaskPageRec.fPageindex<>fTaskPageRec.fCount);
end;

procedure TProjectManageClientDlg.actTask_LastpageExecute(Sender: TObject);
begin
  fTaskPageRec.fPageindex := fTaskPageRec.fCount;
  LoadTaskItem(fTaskPageRec.fCount,fTaskPageRec.fwhere);
end;

procedure TProjectManageClientDlg.actTask_UpPageUpdate(Sender: TObject);
begin
  (sender as TAction).Enabled := not fLoading
  and (fTaskPageRec.fPageindex>1);
end;

procedure TProjectManageClientDlg.actTask_UpPageExecute(Sender: TObject);
begin
  fTaskPageRec.fPageindex := fTaskPageRec.fPageindex-1;
  LoadTaskItem(fTaskPageRec.fPageindex,fTaskPageRec.fwhere);
end;

procedure TProjectManageClientDlg.actTask_NextPageUpdate(Sender: TObject);
begin
  (sender as TAction).Enabled := not fLoading
  and (fTaskPageRec.fPageindex<fTaskPageRec.fCount);
end;

procedure TProjectManageClientDlg.actTask_NextPageExecute(Sender: TObject);
begin
  fTaskPageRec.fPageindex := fTaskPageRec.fPageindex+1;
  LoadTaskItem(fTaskPageRec.fPageindex,fTaskPageRec.fwhere);
end;

end.
