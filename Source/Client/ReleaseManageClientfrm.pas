////////////////////////////////////////////////////////////////////////////////
//
// 项目:
// 模块: 发布管理
// 作者: 龙仕云 创建时间: 2008-12-20
//
//
// 修改:       
//
//
//
////////////////////////////////////////////////////////////////////////////////
unit ReleaseManageClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseChildfrm, ComCtrls,ClientTypeUnits, ExtCtrls, ActnList,
  StdCtrls, Buttons, Grids, DBGrids, DB, DBClient, DBCtrls, Mask;

type

  TReleasePageRec = record
    fCount : integer;
    fPageindex : integer;
    fwhere : string;
  end;

  TReleaseManageClientDlg = class(TBaseChildDlg)
    pgcMain: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    pnlListTop: TPanel;
    pnlNovisible: TPanel;
    actlst1: TActionList;
    act_AddRelease: TAction;
    btnAddRelease: TBitBtn;
    act_MeResult: TAction;
    act_MeUp: TAction;
    btnMeResult: TBitBtn;
    btnMeUp: TBitBtn;
    pnlListBottom: TPanel;
    dbgrdRelease: TDBGrid;
    act_FirstPage: TAction;
    act_Proipage: TAction;
    act_NextPage: TAction;
    act_LastPage: TAction;
    btnFirstPage: TBitBtn;
    btnProipage: TBitBtn;
    btnNextPage: TBitBtn;
    btnLastPage: TBitBtn;
    cdsRelease: TClientDataSet;
    dsRelease: TDataSource;
    cdsNeedTerm: TClientDataSet;
    cdsUrlType: TClientDataSet;
    lblPage: TLabel;
    cdstemp: TClientDataSet;
    scrlbx1: TScrollBox;
    dbtxtZNAME: TDBText;
    spl1: TSplitter;
    pnlContent: TPanel;
    dbmmoZPROCONTENT: TDBMemo;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnProi: TBitBtn;
    btnNext: TBitBtn;
    act_Save: TAction;
    act_Cancel: TAction;
    act_Proi: TAction;
    act_Next: TAction;
    lbl1: TLabel;
    lbl2: TLabel;
    dblkcbbZNEEDTERMNAME: TDBLookupComboBox;
    lbl3: TLabel;
    dbedtZNAME: TDBEdit;
    dblkcbbZPRO_NAME: TDBLookupComboBox;
    lbl4: TLabel;
    dblkcbbZASSIGNEDTONAME: TDBLookupComboBox;
    lbl5: TLabel;
    dbedtZRELEASEDATE: TDBEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    dbedtZOPENDATE: TDBEdit;
    dblkcbbZOPENEDBYNAME: TDBLookupComboBox;
    lbl8: TLabel;
    dblkcbbZURLTYPENAME: TDBLookupComboBox;
    dbedtZURL: TDBEdit;
    dblkcbb6: TDBLookupComboBox;
    lbl9: TLabel;
    lbl10: TLabel;
    dbedtZMAILTO: TDBEdit;
    lbl11: TLabel;
    dblkcbb7: TDBLookupComboBox;
    cdsProject: TClientDataSet;
    lbl12: TLabel;
    cdsUser: TClientDataSet;
    dsUser: TDataSource;
    act_Success: TAction;
    btnSuccess: TBitBtn;
    act_Falat: TAction;
    btnFalat: TBitBtn;
    lbl13: TLabel;
    dbedtZPRODUCTURL: TDBEdit;
    lbl14: TLabel;
    dbedtZVERSION: TDBEdit;
    act_PageRefresh: TAction;
    btnPageRefresh: TBitBtn;
    lbl15: TLabel;
    dbedtZRELEASERNAME: TDBEdit;
    lbl16: TLabel;
    dblkcbbZBACKUPNAME: TDBLookupComboBox;
    cdsBoolean: TClientDataSet;
    procedure cdsReleaseNewRecord(DataSet: TDataSet);
    procedure cdsReleaseBeforePost(DataSet: TDataSet);
    procedure act_AddReleaseExecute(Sender: TObject);
    procedure pgcMainChanging(Sender: TObject; var AllowChange: Boolean);
    procedure act_SaveUpdate(Sender: TObject);
    procedure act_CancelUpdate(Sender: TObject);
    procedure act_SaveExecute(Sender: TObject);
    procedure act_CancelExecute(Sender: TObject);
    procedure act_ProiUpdate(Sender: TObject);
    procedure act_NextUpdate(Sender: TObject);
    procedure dbgrdReleaseDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure act_ProiExecute(Sender: TObject);
    procedure act_NextExecute(Sender: TObject);
    procedure act_SuccessExecute(Sender: TObject);
    procedure act_FalatExecute(Sender: TObject);
    procedure act_SuccessUpdate(Sender: TObject);
    procedure act_FalatUpdate(Sender: TObject);
    procedure dblkcbb6CloseUp(Sender: TObject);
    procedure dblkcbb7CloseUp(Sender: TObject);
    procedure act_FirstPageUpdate(Sender: TObject);
    procedure act_FirstPageExecute(Sender: TObject);
    procedure act_ProipageUpdate(Sender: TObject);
    procedure act_ProipageExecute(Sender: TObject);
    procedure act_NextPageUpdate(Sender: TObject);
    procedure act_NextPageExecute(Sender: TObject);
    procedure act_LastPageUpdate(Sender: TObject);
    procedure act_LastPageExecute(Sender: TObject);
    procedure act_PageRefreshExecute(Sender: TObject);
  private
    { Private declarations }
    fReleasePageRec : TReleasePageRec;
    procedure WMShowTestItem(var msg:TMessage); message gcMSG_GetReleaseItem;
    procedure Mailto(AEmailto:String); //发送到邮箱
  public
    { Public declarations }
    procedure initBase; override;
    procedure freeBase; override;
    procedure Showfrm ; override;  //显示后发生的事件
    procedure Closefrm; override;  //关闭显示发生的事件

    procedure LoadRelease(APageIndex: integer; Awhere: String);       //加载
    function GetReleasePageCount(APageIndex:integer;AWhereStr:String):integer; //取出页总数

    class function GetModuleID : integer;override; //取出模块ID
  end;


implementation
uses
  ClinetSystemUnits, DmUints;

{$R *.dfm}

{ TReleaseManageClientDlg }

procedure TReleaseManageClientDlg.Closefrm;
begin
  inherited;
  
end;

procedure TReleaseManageClientDlg.freeBase;
begin
  inherited;

end;

class function TReleaseManageClientDlg.GetModuleID: integer;
begin
  Result := Ord(mtRelease);
end;

function TReleaseManageClientDlg.GetReleasePageCount(APageIndex: integer;
  AWhereStr: String): integer;
var
  mySQL  : string;
  myRowCount : integer;
  mywhere : string;
const
  glSQL = 'exec pt_SplitPage ''TB_RELEASE_ITEM'',' +
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

procedure TReleaseManageClientDlg.initBase;
var
  i : Integer;
  mycds : TClientDataSet;
  myField : TFieldDef;
const
  gl_SQLTXT  = 'select ZID,ZNAME from TB_RELEASE_PARAMS where ZTYPE=%d ';
  gl_SQLTXT2 = 'select * from TB_RELEASE_ITEM where 1=0';
  gl_SQLTXT3 = 'select ZID,ZNAME from TB_PRO_ITEM';
begin
  inherited;
  cdsNeedTerm.data := ClientSystem.fDbOpr.ReadDataSet(PChar(Format(gl_SQLTXT,[0])));
  cdsUrlType.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(Format(gl_SQLTXT,[1])));
  cdsProject.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(gl_SQLTXT3));
  cdsUser.CloneCursor(DM.cdsUser,True);
  cdsBoolean.Data :=  ClientSystem.fDbOpr.ReadDataSet(PChar(Format(gl_SQLTXT,[3])));

  //创建表结构
  mycds := TClientDataSet.Create(nil);
  try
    mycds.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(gl_SQLTXT2));
    cdsRelease.FieldDefs.Assign(mycds.FieldDefs);


    with cdsRelease.FieldDefs do
    begin
      myField := AddFieldDef;
      myField.Name := 'ZISNEW';   //是否是新增
      myField.DataType := ftBoolean;
      with cdsRelease do
      begin
        for i:=0 to FieldDefs.Count -1 do
           FieldDefs[i].CreateField(cdsRelease);
      end;

      //创建人
      myField := AddFieldDef;
      myField.Name := 'ZOPENEDBYNAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsRelease) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZOPENEDBY';
        LookupDataSet := cdsUser;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

      //指派给
      myField := AddFieldDef;
      myField.Name := 'ZASSIGNEDTONAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsRelease) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZASSIGNEDTO';
        LookupDataSet := cdsUser;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

      //上传人
      myField := AddFieldDef;
      myField.Name := 'ZRELEASERNAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsRelease) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZRELEASER';
        LookupDataSet := cdsUser;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

      //发布期限 ZNEEDTERM
      myField := AddFieldDef;
      myField.Name := 'ZNEEDTERMNAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsRelease) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZNEEDTERM';
        LookupDataSet := cdsNeedTerm;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

      //发布的类型 ZURLTYPE
      myField := AddFieldDef;
      myField.Name := 'ZURLTYPENAME';
      myField.DataType := ftString;
      myField.Size := 30;
      with myfield.CreateField(cdsRelease) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZURLTYPE';
        LookupDataSet := cdsUrlType;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

      //立项项目
      myField := AddFieldDef;
      myField.Name := 'ZPRO_NAME';
      myField.DataType := ftString;
      myField.Size := 200;
      with myfield.CreateField(cdsRelease) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZPRO_ID';
        LookupDataSet := cdsProject;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

      //是否备份
      myField := AddFieldDef;
      myField.Name := 'ZBACKUPNAME';
      myField.DataType := ftString;
      myField.Size := 5;
      with myfield.CreateField(cdsRelease) do
      begin
        FieldKind := fkLookup;
        KeyFields := 'ZBACKUP';
        LookupDataSet := cdsBoolean;
        LookupKeyFields := 'ZID';
        LookupResultField := 'ZNAME';
      end;

    end;
    cdsRelease.CreateDataSet;

    //加载内容
    fReleasePageRec.fCount := GetReleasePageCount(1,'1=1');
    fReleasePageRec.fPageindex := 1;
    fReleasePageRec.fwhere := '1=1';
    LoadRelease(1,'1=1');

  finally
    mycds.Free;
  end;
end;



procedure TReleaseManageClientDlg.LoadRelease(APageIndex: integer;
  Awhere: String);
var
  mySQL  : string;
  i : integer;
  myb : Boolean;
const
    glSQL = 'exec pt_SplitPage ''TB_RELEASE_ITEM'',' +
          '''ZID,ZNAME,ZVERSION,ZPRO_ID,ZASSIGNEDTO,ZOPENEDBY,ZOPENDATE,ZRELEASEDATE,ZNEEDTERM,' +
          'ZURLTYPE,ZURL,ZPRODUCTURL,ZPROCONTENT,ZMAILTO,'+
          'ZSTATUS,ZRELEASER,ZBACKUP'', ' +
          '''%s'',20,%d,%d,1,''%s''';
begin

  mySQL := format(glSQL,[
      'ZID',
      APageIndex,
      0,Awhere]);

  myb := fLoading;
  fLoading := True;
  cdsRelease.DisableControls;


  ShowProgress('读取数据...',0);

  try
    lblPage.Caption := format('%d/%d',[fReleasePageRec.fPageindex,
      fReleasePageRec.fCount]);
    if cdsTemp.Active then  cdsTemp.Close;
    cdsTemp.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));

    while not cdsRelease.IsEmpty do
      cdsRelease.Delete;


    //生成数据
    cdsTemp.First;
    while not cdsTemp.Eof do
    begin
      cdsRelease.Append;
      cdsRelease.FieldByName('ZISNEW').AsBoolean := False;
      for i:=0 to cdsTemp.FieldDefs.Count -1 do
        cdsRelease.FieldByName(cdsTemp.FieldDefs[i].Name).AsVariant :=
          cdsTemp.FieldByName(cdsTemp.FieldDefs[i].Name).AsVariant;
      cdsRelease.Post;
      cdsTemp.Next;
    end;
    cdsRelease.First;

  finally
    cdsRelease.EnableControls;
    fLoading := myb;
    HideProgress;
  end;
end;

procedure TReleaseManageClientDlg.Showfrm;
begin
  inherited;

end;

procedure TReleaseManageClientDlg.cdsReleaseNewRecord(DataSet: TDataSet);
begin
  if fLoading then Exit;
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
  DataSet.FieldByName('ZOPENDATE').AsDateTime := ClientSystem.fDbOpr.GetSysDateTime;
  DataSet.FieldByName('ZOPENEDBY').AsInteger := ClientSystem.fEditer_id;
  DataSet.FieldByName('ZMAILTO').AsString := Format('%s(%d)',[
    ClientSystem.fEditer,ClientSystem.fEditer_id]);
  DataSet.FieldByName('ZSTATUS').AsInteger := Ord(rsCreate);
  DataSet.FieldByName('ZBACKUP').AsBoolean := False;
end;

procedure TReleaseManageClientDlg.cdsReleaseBeforePost(DataSet: TDataSet);
var
  mySQL : string;
  myMaxid : Integer;
const
  gl_SQLTXT = 'insert into TB_RELEASE_ITEM (ZID,ZNAME,ZVERSION,ZPRO_ID,ZASSIGNEDTO, ' +
    'ZRELEASEDATE,ZOPENEDBY,ZOPENDATE,ZNEEDTERM,ZURLTYPE,ZURL,ZPRODUCTURL,' +
    'ZPROCONTENT,ZMAILTO,ZSTATUS,ZRELEASER,ZBACKUP) values(%d,''%s'',''%s'',%d,%d,'+
    '''%s'',%d,''%s'',%d,%d,''%s'',''%s'','+
    '''%s'',''%s'',%d,%d,%d )';
  gl_SQLTXT2 = 'update TB_RELEASE_ITEM set ZNAME=''%s'',ZVERSION=''%s'',ZPRO_ID=%d,ZASSIGNEDTO=%d,' +
    'ZRELEASEDATE=''%s'',ZOPENEDBY=%d,ZOPENDATE=''%s'',ZNEEDTERM=%d,ZURLTYPE=%d,ZURL=''%s'',ZPRODUCTURL=''%s'','+
    'ZPROCONTENT=''%s'',ZMAILTO=''%s'',ZSTATUS=%d,ZRELEASER=%d,ZBACKUP=%d where ZID=%d';
  gl_SQLTXT3 = 'select isNull(max(ZID),0)+1 from TB_RELEASE_ITEM';
begin
  if fLoading then Exit;
  if DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    myMaxid := ClientSystem.fDbOpr.ReadInt(PChar(gl_SQLTXT3));
    mySQL := Format(gl_SQLTXT,[
      myMaxid,
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZVERSION').AsString,
      DataSet.FieldByName('ZPRO_ID').AsInteger,
      DataSet.FieldByName('ZASSIGNEDTO').AsInteger,

      DataSet.FieldByName('ZRELEASEDATE').AsString,
      DataSet.FieldByName('ZOPENEDBY').AsInteger,
      DataSet.FieldByName('ZOPENDATE').AsString,
      DataSet.FieldByName('ZNEEDTERM').AsInteger,
      DataSet.FieldByName('ZURLTYPE').AsInteger,
      DataSet.FieldByName('ZURL').AsString,
      DataSet.FieldByName('ZPRODUCTURL').AsString,
      DataSet.FieldByName('ZPROCONTENT').AsString,
      DataSet.FieldByName('ZMAILTO').AsString,
      DataSet.FieldByName('ZSTATUS').AsInteger,
      DataSet.FieldByName('ZRELEASER').AsInteger,
      Ord(DataSet.FieldByName('ZBACKUP').AsBoolean)]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
    DataSet.FieldByName('ZISNEW').AsBoolean := False;
    DataSet.FieldByName('ZID').AsInteger := myMaxid;
    //邮件发送
    Mailto(DataSet.FieldByName('ZMAILTO').AsString);
  end
  else begin
    mySQL := Format(gl_SQLTXT2,[
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZVERSION').AsString,
      DataSet.FieldByName('ZPRO_ID').AsInteger,
      DataSet.FieldByName('ZASSIGNEDTO').AsInteger,
      DataSet.FieldByName('ZRELEASEDATE').AsString,
      DataSet.FieldByName('ZOPENEDBY').AsInteger,
      DataSet.FieldByName('ZOPENDATE').AsString,
      DataSet.FieldByName('ZNEEDTERM').AsInteger,
      DataSet.FieldByName('ZURLTYPE').AsInteger,
      DataSet.FieldByName('ZURL').AsString,
      DataSet.FieldByName('ZPRODUCTURL').AsString,
      DataSet.FieldByName('ZPROCONTENT').AsString,
      DataSet.FieldByName('ZMAILTO').AsString,
      DataSet.FieldByName('ZSTATUS').AsInteger,
      DataSet.FieldByName('ZRELEASER').AsInteger,
      Ord(DataSet.FieldByName('ZBACKUP').AsBoolean),
      DataSet.FieldByName('ZID').AsInteger]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
  end;
end;

procedure TReleaseManageClientDlg.act_AddReleaseExecute(Sender: TObject);
begin
  cdsRelease.Append;
  pgcMain.ActivePageIndex := 1;
end;

procedure TReleaseManageClientDlg.pgcMainChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := True;
  if cdsRelease.State in [dsEdit,dsInsert] then
  begin
    MessageBox(Handle,'内容已修改，请点保存或取消。','提示',MB_ICONWARNING+
      MB_OK);
    AllowChange := False;
  end;
end;

procedure TReleaseManageClientDlg.act_SaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsRelease.State in [dsEdit,dsInsert];
end;

procedure TReleaseManageClientDlg.act_CancelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsRelease.State in [dsEdit,dsInsert];
end;

procedure TReleaseManageClientDlg.act_SaveExecute(Sender: TObject);
begin
  cdsRelease.Post;
end;

procedure TReleaseManageClientDlg.act_CancelExecute(Sender: TObject);
begin
  cdsRelease.Cancel;
end;

procedure TReleaseManageClientDlg.act_ProiUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (not cdsRelease.Bof) and
  (cdsRelease.State = dsBrowse);
end;

procedure TReleaseManageClientDlg.act_NextUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not cdsRelease.Eof and
  (cdsRelease.State = dsBrowse);
end;

procedure TReleaseManageClientDlg.dbgrdReleaseDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (cdsRelease.RecNo mod 2  = 0) and not ( gdSelected in State)  then
    dbgrdRelease.Canvas.Brush.Color := clSilver;

  if (cdsRelease.FieldByName('ZSTATUS').AsInteger = Ord(rsClose)) then
  begin
    dbgrdRelease.Canvas.Font.Color := clblue;
  end;

  dbgrdRelease.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TReleaseManageClientDlg.act_ProiExecute(Sender: TObject);
begin
  cdsRelease.Prior;
end;

procedure TReleaseManageClientDlg.act_NextExecute(Sender: TObject);
begin
  cdsRelease.Next;
end;

procedure TReleaseManageClientDlg.act_SuccessExecute(Sender: TObject);
begin
  if not (cdsRelease.State in [dsEdit,dsInsert]) then
    cdsRelease.Edit;
  cdsRelease.FieldByName('ZSTATUS').AsInteger := Ord(rsClose);
  cdsRelease.FieldByName('ZRELEASEDATE').AsDateTime := ClientSystem.fDbOpr.GetSysDateTime;
  cdsRelease.FieldByName('ZRELEASER').AsInteger := ClientSystem.fEditer_id;
  cdsRelease.Post;
  Mailto(cdsRelease.FieldByName('ZMAILTO').AsString);
end;

procedure TReleaseManageClientDlg.act_FalatExecute(Sender: TObject);
begin
  if not (cdsRelease.State in [dsEdit,dsInsert]) then
    cdsRelease.Edit;
  cdsRelease.FieldByName('ZSTATUS').AsInteger := Ord(rsCreate);
  cdsRelease.Post;
end;

procedure TReleaseManageClientDlg.act_SuccessUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not cdsRelease.IsEmpty and
  (cdsRelease.FieldByName('ZSTATUS').AsInteger=Ord(rsCreate));
end;

procedure TReleaseManageClientDlg.act_FalatUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not cdsRelease.IsEmpty and
  (cdsRelease.FieldByName('ZSTATUS').AsInteger=Ord(rsClose));
end;

procedure TReleaseManageClientDlg.dblkcbb6CloseUp(Sender: TObject);
var
  mystr : String;
  myaddstr : string;
begin
  if (Sender as TDBLookupComboBox).Text = '' then Exit;

  if cdsRelease.State in [dsBrowse] then
    cdsRelease.Edit;

  myaddstr := format('%s(%d)',[
      cdsUser.FieldByName('ZNAME').AsString,
      cdsUser.FieldByName('ZID').AsInteger]);

  myStr := cdsRelease.FieldByName('ZURL').AsString;
  if mystr <> '' then
  begin
    if Pos(myaddstr,mystr) <= 0 then
      myStr := myStr + ';' + myaddstr;
  end
  else
    myStr := myStr + myaddstr;

  cdsRelease.FieldByName('ZURL').AsString := myStr;
end;

procedure TReleaseManageClientDlg.dblkcbb7CloseUp(Sender: TObject);
var
  mystr : String;
  myaddstr : string;
begin
  if (Sender as TDBLookupComboBox).Text = '' then Exit;

  if cdsRelease.State in [dsBrowse] then
    cdsRelease.Edit;

  myaddstr := format('%s(%d)',[
      cdsUser.FieldByName('ZNAME').AsString,
      cdsUser.FieldByName('ZID').AsInteger]);

  myStr := cdsRelease.FieldByName('ZMAILTO').AsString;
  if mystr <> '' then
  begin
    if Pos(myaddstr,mystr) <= 0 then
      myStr := myStr + ';' + myaddstr;
  end
  else
    myStr := myStr + myaddstr;

  cdsRelease.FieldByName('ZMAILTO').AsString := myStr;
end;

procedure TReleaseManageClientDlg.WMShowTestItem(var msg: TMessage);
var
  myPageIndex : Integer;
  mystr : string;
  myindex : integer;
  mycount : integer;
begin
  mystr := fReleasePageRec.fwhere;
  myindex :=  fReleasePageRec.fPageindex;
  mycount := fReleasePageRec.fCount;
  try
    fReleasePageRec.fwhere := Format('ZID=%d',[msg.WParam]);
    fReleasePageRec.fPageindex := 1;
    myPageIndex := 1;
    fReleasePageRec.fCount := 1;
    LoadRelease(myPageindex,fReleasePageRec.fwhere);
    lblPage.Caption := format('%d/%d',[
      1,1]);

    if pgcMain.ActivePageIndex=0 then
      pgcMain.ActivePageIndex := 1;

  finally
    fReleasePageRec.fwhere := mystr;
    fReleasePageRec.fPageindex := myindex;
    fReleasePageRec.fCount := mycount;
  end;

end;

procedure TReleaseManageClientDlg.Mailto(AEmailto: String);
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
    myBugID := cdsRelease.FieldByName('ZID').AsInteger;
    //先加入创建人
    cdsUser.ControlsDisabled;
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
          cdsUser.First;
          while not cdsUser.Eof do
          begin
            myStr := format('%s(%d)',[cdsUser.FieldByName('ZNAME').AsString,
              cdsUser.FieldByName('ZID').AsInteger]);
            if CompareText(myStr,mysv[i]) = 0 then
            begin
              myMails.Add(cdsUser.FieldByName('ZEMAIL').AsString);
              break;
            end;
            cdsUser.Next;
          end;
        end;
      end;

    finally
      cdsUser.EnableControls;
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
      ClientSystem.fDbOpr.MailTo(3,myStr,myBugID);
  finally
    mysl.Free;
    mysv.Free;
    myMails.Free;
    HideProgress();
  end;
end;

procedure TReleaseManageClientDlg.act_FirstPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fReleasePageRec.fPageindex <> 1)
  and (fReleasePageRec.fCount > 1);
end;

procedure TReleaseManageClientDlg.act_FirstPageExecute(Sender: TObject);
begin
  fReleasePageRec.fPageindex := 1;
  LoadRelease(1,fReleasePageRec.fwhere);
end;

procedure TReleaseManageClientDlg.act_ProipageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fReleasePageRec.fPageindex > 1)
  and (fReleasePageRec.fCount > 1);
end;

procedure TReleaseManageClientDlg.act_ProipageExecute(Sender: TObject);
begin
  fReleasePageRec.fPageindex := fReleasePageRec.fPageindex-1;
  LoadRelease(fReleasePageRec.fPageindex,fReleasePageRec.fwhere);
end;

procedure TReleaseManageClientDlg.act_NextPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fReleasePageRec.fPageindex < fReleasePageRec.fCount)
  and (fReleasePageRec.fCount > 1);
end;

procedure TReleaseManageClientDlg.act_NextPageExecute(Sender: TObject);
begin
  fReleasePageRec.fPageindex := fReleasePageRec.fPageindex+1;
  LoadRelease(fReleasePageRec.fPageindex,fReleasePageRec.fwhere);
end;

procedure TReleaseManageClientDlg.act_LastPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fReleasePageRec.fPageindex <> fReleasePageRec.fCount)
  and (fReleasePageRec.fCount > 1);
end;

procedure TReleaseManageClientDlg.act_LastPageExecute(Sender: TObject);
begin
  fReleasePageRec.fPageindex := fReleasePageRec.fCount;
  LoadRelease(fReleasePageRec.fPageindex,fReleasePageRec.fwhere);
  
end;

procedure TReleaseManageClientDlg.act_PageRefreshExecute(Sender: TObject);
begin
  LoadRelease(fReleasePageRec.fPageindex,fReleasePageRec.fwhere);
end;

end.
