////////////////////////////////////////////////////////////////////////////////
//
// 项目:
// 模块: 自动编译项目
// 作者: 龙仕云 创建时间: 2008-12-7
//
//
// 修改:
//   增加svn  的日志显示功能 作者:龙仕云 2009-1-18
//
//
//
////////////////////////////////////////////////////////////////////////////////
unit AntManageClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseChildfrm, StdCtrls, ExtCtrls, DBCtrls, Buttons, ActnList,
  ComCtrls, Grids, DBGrids, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, DB, DBClient,
  ClientTypeUnits, Mask;

type

  TSVNCommitPageRec = record
    findex,fcount : integer;
    fWhere : string;
  end;

  TAntManageClientDlg = class(TBaseChildDlg)
    actlst1: TActionList;
    act_BuildProject: TAction;
    pgcAnt: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    pnl1: TPanel;
    dbtxtZNAME: TDBText;
    pnl2: TPanel;
    dbgrd1: TDBGrid;
    scrlbx1: TScrollBox;
    spl1: TSplitter;
    pnl3: TPanel;
    btnBuildProject: TBitBtn;
    act_ProAdd: TAction;
    btnProAdd: TBitBtn;
    idtcpclnt1: TIdTCPClient;
    cdsAntList: TClientDataSet;
    dsAntList: TDataSource;
    lbl1: TLabel;
    dbedtZNAME: TDBEdit;
    lbl2: TLabel;
    dbedtZPRO_ID: TDBEdit;
    lbl3: TLabel;
    dbedtZIP: TDBEdit;
    lbl4: TLabel;
    dbedtZPYFILE: TDBEdit;
    btnProSave: TBitBtn;
    btnProCancel: TBitBtn;
    act_ProSave: TAction;
    act_ProCancel: TAction;
    cdstemp: TClientDataSet;
    dbmmoZREMARK: TDBMemo;
    lbl5: TLabel;
    act_BuildConnectIP: TAction;
    btnBuildConnectIP: TBitBtn;
    act1_BuildInfo: TAction;
    btn1_BuildInfo: TBitBtn;
    lbl6: TLabel;
    dbedtZDATE: TDBEdit;
    lbl7: TLabel;
    dbedtZVERSION: TDBEdit;
    lbl8: TLabel;
    dbedtZSVN: TDBEdit;
    lblError: TLabel;
    lstResult: TListBox;
    ani1: TAnimate;
    act_Svnlog: TAction;
    lbl9: TLabel;
    dbedtZSVN_LATEST_VERSION: TDBEdit;
    lbl10: TLabel;
    dbedtZSVN_URL: TDBEdit;
    tsLog: TTabSheet;
    pnl4: TPanel;
    dbgrdSvnChanges: TDBGrid;
    pnl5: TPanel;
    spl2: TSplitter;
    dbgrdSvnCommits: TDBGrid;
    dbmmoZMESSAGE: TDBMemo;
    spl3: TSplitter;
    cdsSvnCommits: TClientDataSet;
    dsSvnCommits: TDataSource;
    btnSvnLog_FirstPage: TBitBtn;
    btnSvnLog_ProPage: TBitBtn;
    btnSvnLog_NextPage: TBitBtn;
    btnSvnLog_ProPage1: TBitBtn;
    lblSvnPage: TLabel;
    cdsSvnChanges: TClientDataSet;
    dsSvnChanges: TDataSource;
    dbtxtZNAME1: TDBText;
    actSvnLog_FirstPage: TAction;
    actSvnLog_ProPage: TAction;
    actSvnLog_NextPage: TAction;
    actSvnLog_LastPage: TAction;
    btnSvnLog_PiroProject: TBitBtn;
    btnSvnLog_NetProject: TBitBtn;
    actSvnLog_PiroProject: TAction;
    actSvnLog_NetProject: TAction;
    actSvnLog_AllProject: TAction;
    btnSvnLog_AllProject: TBitBtn;
    btnEditSVNRUL: TBitBtn;
    btnReLoadAnt: TBitBtn;
    act_ReLoadAnt: TAction;
    cdsCloneAntList: TClientDataSet;
    procedure act_ProAddExecute(Sender: TObject);
    procedure cdsAntListNewRecord(DataSet: TDataSet);
    procedure act_ProSaveUpdate(Sender: TObject);
    procedure act_ProCancelUpdate(Sender: TObject);
    procedure act_ProSaveExecute(Sender: TObject);
    procedure act_ProCancelExecute(Sender: TObject);
    procedure cdsAntListBeforePost(DataSet: TDataSet);
    procedure act_BuildConnectIPExecute(Sender: TObject);
    procedure act_BuildProjectUpdate(Sender: TObject);
    procedure cdsAntListAfterScroll(DataSet: TDataSet);
    procedure act1_BuildInfoExecute(Sender: TObject);
    procedure act_BuildProjectExecute(Sender: TObject);
    procedure act1_BuildInfoUpdate(Sender: TObject);
    procedure dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure pgcAntChanging(Sender: TObject; var AllowChange: Boolean);
    procedure lstResultDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure pgcAntChange(Sender: TObject);
    procedure dbgrdSvnCommitsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsSvnCommitsAfterScroll(DataSet: TDataSet);
    procedure dbgrdSvnChangesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsSvnCommitsCalcFields(DataSet: TDataSet);
    procedure actSvnLog_FirstPageUpdate(Sender: TObject);
    procedure actSvnLog_FirstPageExecute(Sender: TObject);
    procedure actSvnLog_ProPageExecute(Sender: TObject);
    procedure actSvnLog_ProPageUpdate(Sender: TObject);
    procedure actSvnLog_NextPageUpdate(Sender: TObject);
    procedure actSvnLog_NextPageExecute(Sender: TObject);
    procedure actSvnLog_LastPageUpdate(Sender: TObject);
    procedure actSvnLog_LastPageExecute(Sender: TObject);
    procedure actSvnLog_PiroProjectUpdate(Sender: TObject);
    procedure actSvnLog_PiroProjectExecute(Sender: TObject);
    procedure actSvnLog_NetProjectExecute(Sender: TObject);
    procedure actSvnLog_NetProjectUpdate(Sender: TObject);
    procedure actSvnLog_AllProjectExecute(Sender: TObject);
    procedure btnEditSVNRULClick(Sender: TObject);
    procedure act_ReLoadAntExecute(Sender: TObject);
  private
    { Private declarations }
    fSVNCommitPageRec :TSVNCommitPageRec;
    function initconnection():Boolean; //连接服务器
    procedure LoadAnt();
    procedure LoadSvnCommit(Awhere:string;APageIndex:integer);
    function  GetSvnCommitPageCount(Awhere:string):integer;
    procedure LoadSvnChanges(AAntGUID:string;Aversion:integer);
  public
    { Public declarations }


    procedure initBase; override;
    procedure freeBase; override;
    procedure Showfrm ; override;  //显示后发生的事件
    procedure Closefrm; override;  //关闭显示发生的事件
    class function GetModuleID : integer;override;
  end;

  TPySvnThread = class(TThread)
  private
    fResultStr : string;
    fcds : TClientDataSet;
    fani : TAnimate;
    fMemo: TListBox;
    fIdTCP : TIdTCPClient;
    PyFileName : string;
    fAction : TAction;

    procedure BeginAnimate();
    procedure EndAnimate();
  public
    constructor Create(Acds:TClientDataSet;Aani: TAnimate;
      AMemo:TListBox;AIdTCP: TIdTCPClient;AAction:TAction);
  protected
    procedure Execute;override;
  end;


var
  fPySvning : Boolean;

implementation
uses
  ClinetSystemUnits, Mainfrm;

{$R *.dfm}

{ TAntManageClientDlg }

procedure TAntManageClientDlg.Closefrm;
begin
  inherited;

end;

procedure TAntManageClientDlg.freeBase;
begin
  inherited;

end;

class function TAntManageClientDlg.GetModuleID: integer;
begin
  Result := Ord(mtAnt);
end;

procedure TAntManageClientDlg.initBase;
var
  mycds : TClientDataSet;
  myfield : TFieldDef;
const
  glSQL1 = 'select * from TB_ANT where 1=0 ';
begin
  inherited;
  fPySvning := False;
  ani1.ResName := 'MOV';
  mycds := TClientDataSet.Create(nil);
  try
    mycds.data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL1));

    if cdsAntList.Active then
      cdsAntList.Close;
    cdsAntList.FieldDefs.Clear;
    cdsAntList.FieldDefs.Assign(mycds.FieldDefs);
    with cdsAntList.FieldDefs do
    begin
      myField := AddFieldDef;
      myField.Name := 'ZISNEW';   //是否是新增
      myField.DataType := ftBoolean;

      myField := AddFieldDef;
      myField.Name := 'ZAUTOID';   
      myField.DataType := ftInteger;

      myField := AddFieldDef;
      myField.Name := 'ZINDEX';
      myField.DataType := ftString;
    end;
    cdsAntList.CreateDataSet;

    LoadAnt();
    
  finally
    mycds.Free;
  end;
end;

function TAntManageClientDlg.initconnection:Boolean;
var
  myip : string;
  myport : Integer;
  mystr : string;
begin
  //
  Result := False;
  mystr := cdsAntList.FieldByName('ZIP').AsString;
  if Pos(':',mystr) = 0 then Exit;

  myip := Copy(mystr,1,Pos(':',mystr)-1);
  myport := StrToIntDef(Copy(mystr,Pos(':',mystr)+1,MaxInt),-1);
  if myport = -1 then Exit;

  if idtcpclnt1.Connected then
    idtcpclnt1.Disconnect;

  try
    idtcpclnt1.Host := myip;
    idtcpclnt1.Port := myport;
    idtcpclnt1.Connect();
    Result := idtcpclnt1.Connected;
  except
    Exit;
  end;
end;

procedure TAntManageClientDlg.Showfrm;
begin
  inherited;

end;

procedure TAntManageClientDlg.act_ProAddExecute(Sender: TObject);
begin
  //
  if cdsAntList.State in [dsEdit,dsInsert] then
    cdsAntList.Post;
  cdsAntList.Append;
  pgcAnt.ActivePageIndex := 1;

end;

procedure TAntManageClientDlg.cdsAntListNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ZGUID').AsString := NewGuid;
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
end;

procedure TAntManageClientDlg.act_ProSaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsAntList.State in [dsEdit,dsInsert];
end;

procedure TAntManageClientDlg.act_ProCancelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsAntList.State in [dsEdit,dsInsert];
end;

procedure TAntManageClientDlg.act_ProSaveExecute(Sender: TObject);
begin
  cdsAntList.Post;
end;

procedure TAntManageClientDlg.act_ProCancelExecute(Sender: TObject);
begin
  cdsAntList.Cancel;
end;

procedure TAntManageClientDlg.LoadAnt;
var
  i,myc : Integer;
  myb : Boolean;
const
  glSQL = 'select * from TB_ANT order by ZID desc';

begin
  //
  myb := fLoading;
  fLoading := True;
  cdsAntList.DisableControls;
  try
    while not cdsAntList.Eof do
      cdsAntList.Delete;
      
    cdstemp.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL));
    cdstemp.First;
    myc := 1;
    while not cdstemp.Eof do
    begin
      cdsAntList.Append;
      cdsAntList.FieldByName('ZISNEW').AsBoolean := False;
      cdsAntList.FieldByName('ZINDEX').AsString := inttostr(myc);Inc(myc);
      for i:=0 to cdstemp.Fields.Count -1 do
      begin
        if  cdstemp.Fields[i].FieldName = 'ZID' then
        begin
          cdsAntList.FieldByName('ZAUTOID').AsInteger :=
            cdstemp.FieldByName('ZID').AsInteger;
        end
        else begin
          cdsAntList.FieldByName(cdstemp.Fields[i].FieldName).AsVariant :=
            cdstemp.FieldByName(cdstemp.Fields[i].FieldName).AsVariant;
        end;
      end;
      cdstemp.Next;
      cdsAntList.Post;
    end;

    cdsAntList.First;
    cdsCloneAntList.CloneCursor(cdsAntList,True);
  finally
    cdsAntList.EnableControls;
    fLoading := myb;
  end;
end;


procedure TAntManageClientDlg.cdsAntListBeforePost(DataSet: TDataSet);
var
  mySQL : string;
const
  gl_SQL1 = 'insert TB_ANT(ZGUID,ZNAME,ZPRO_ID,ZIP,ZPYFILE,ZREMARK,ZDATE,ZSVN,ZVERSION,ZSVN_URL,ZSVN_LATEST_VERSION)' +
       ' values(''%s'',''%s'',%d,''%s'',''%s'',''%s'',''%s'',%d,''%s'',''%s'',%d)';
  gl_SQL2 = 'update TB_ANT set ZNAME=''%s'',ZPRO_ID=%d,ZIP=''%s'',ZPYFILE=''%s'', ' +
      'ZREMARK=''%s'',ZDATE=''%s'',ZSVN=%d,ZVERSION=''%s'',ZSVN_URL=''%s'',ZSVN_LATEST_VERSION=%d where ZGUID=''%s''';
begin
  if fLoading then Exit;
  
  if DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    mySQL := Format(gl_SQL1,[
      DataSet.FieldByName('ZGUID').AsString,
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZPRO_ID').AsInteger,
      DataSet.FieldByName('ZIP').AsString,
      DataSet.FieldByName('ZPYFILE').AsString,
      DataSet.FieldByName('ZREMARK').AsString,
      DataSet.FieldByName('ZDATE').AsString,
      DataSet.FieldByName('ZSVN').AsInteger,
      DataSet.FieldByName('ZVERSION').AsString,
      DataSet.FieldByName('ZSVN_URL').AsString,
      DataSet.FieldByName('ZSVN_LATEST_VERSION').AsInteger
      ]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));

    DataSet.FieldByName('ZISNEW').AsBoolean := False;
  end
  else begin
    mySQL := Format(gl_SQL2,[
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZPRO_ID').AsInteger,
      DataSet.FieldByName('ZIP').AsString,
      DataSet.FieldByName('ZPYFILE').AsString,
      DataSet.FieldByName('ZREMARK').AsString,
      DataSet.FieldByName('ZDATE').AsString,
      DataSet.FieldByName('ZSVN').AsInteger,
      DataSet.FieldByName('ZVERSION').AsString,
      DataSet.FieldByName('ZSVN_URL').AsString,
      DataSet.FieldByName('ZSVN_LATEST_VERSION').AsInteger,
      DataSet.FieldByName('ZGUID').AsString]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
  end;
end;

procedure TAntManageClientDlg.act_BuildConnectIPExecute(Sender: TObject);
begin
  //
  if not initconnection() then
  begin
    MessageBox(Handle,'连接编译服务器出错，请与管理员联系。','编译',
      MB_ICONWARNING+MB_OK);
  end;
end;

procedure TAntManageClientDlg.act_BuildProjectUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := idtcpclnt1.Connected;
end;

procedure TAntManageClientDlg.cdsAntListAfterScroll(DataSet: TDataSet);
begin
  if idtcpclnt1.Connected then
    idtcpclnt1.Disconnect;
end;

procedure TAntManageClientDlg.act1_BuildInfoExecute(Sender: TObject);
var
  i,j,count : integer;
  linenum :Integer; //要跳往的行号
  mystr : string;
  myverstr,mys : string;
  myver : Integer;
begin
  idtcpclnt1.WriteLn('A');
  count := idtcpclnt1.ReadInteger;
  if count = -1 then
  begin
    lstResult.Items.Add('还没有编译完成，请稍候...');
    Exit;
  end;

  lstResult.Items.Clear;

  linenum := 0;
  for i:=0 to count -1 do
  begin
    mystr := idtcpclnt1.ReadLn();
    if (Pos('FATA',UpperCase(mystr)) + Pos('ERROR',UpperCase(mystr)) > 0)  then
    begin
      lblError.Visible := True;
      lblError.Caption := Format('编译出错。第%d行',[i+1]);
      lblError.Hint := mystr;
      linenum := i;
    end
    else if Pos('[<Revision kind=number',mystr) > 0 then
    begin
      //[<Revision kind=number 5>]
      myverstr := Copy(mystr,Pos('=number',mystr)+length('=number'),Pos('>]',mystr));
      mys := '';
      myverstr := Trim(myverstr);
      for j:=1 to Length(myverstr) do
      begin
        if myverstr[j] in ['0','1','2','3','4','5','6','7','8','9'] then
          mys := mys + myverstr[j]
        else
          Break;
      end;
      myver := StrToIntdef(mys,-1);

      //更新svn 版本
      if cdsAntList.FieldByName('ZSVN').AsInteger <> myver then
      begin
        if not (cdsAntList.State in [dsEdit,dsInsert]) then
          cdsAntList.Edit;
        cdsAntList.FieldByName('ZSVN').AsInteger := myver;
        cdsAntList.Post;
      end;
    end;
    lstResult.Items.Add(mystr);

  end;
  lstResult.ItemIndex := linenum;
  lstResult.Tag := linenum;

end;

procedure TAntManageClientDlg.act_BuildProjectExecute(Sender: TObject);
var
  MyThread : TPySvnThread;
begin
  MyThread := TPySvnThread.Create(cdsAntList,ani1,lstResult,idtcpclnt1,
    MainDlg.actMod_Ant);
  MyThread.Resume;
end;

procedure TAntManageClientDlg.act1_BuildInfoUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := idtcpclnt1.Connected and
  not fPySvning;
end;

procedure TAntManageClientDlg.dbgrd1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (cdsAntList.RecNo mod 2  = 0) and not ( gdSelected in State)  then
    dbgrd1.Canvas.Brush.Color := clSilver;

  dbgrd1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TAntManageClientDlg.pgcAntChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if cdsAntList.State in [dsEdit,dsInsert] then
  begin
    AllowChange := False;
    MessageBox(Handle,'内容已修改，请点保存或取消。','提示',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  if fPySvning then
  begin
    AllowChange := False;
    MessageBox(Handle,'编译中，不能切换页面。','提示',MB_ICONWARNING+MB_OK);
    Exit;
  end;
end;

procedure TAntManageClientDlg.LoadSvnCommit(Awhere: string;APageIndex:integer);
var
  mySQL  : string;
  i : integer;
  myb : Boolean;
  mywhere : string;
  myField : TFieldDef;
const
    glSQL = 'exec pt_SplitPage ''TB_SVN_COMMITS'',' +
          '''ZID,ZSVN_GUID,ZVERSION,ZAUTHOR,ZDATE,ZMESSAGE'',' +
          '''%s'',20,%d,%d,1,''%s''';
begin

  mywhere := Awhere;
  mySQL := format(glSQL,[
      'ZID',
      APageIndex,
      0,mywhere]);

  myb := fLoading;
  fLoading := True;
  cdsSvnCommits.DisableControls;


  ShowProgress('读取数据...',0);

  try
    lblSvnPage.Caption := format('%d/%d',[fSVNCommitPageRec.findex,
      fSVNCommitPageRec.fCount]);
    if cdsTemp.Active then  cdsTemp.Close;
    cdsTemp.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));

    if cdsSvnCommits.FieldDefs.Count = 0 then
    begin
      cdsSvnCommits.FieldDefs.Assign(cdsTemp.FieldDefs);
      with cdsSvnCommits.FieldDefs do
      begin
        myField := AddFieldDef;
        myField.Name := 'ZVERSTR';
        myField.DataType := ftString;

        myField := AddFieldDef;
        myField.Name := 'ZAUTOID';
        myField.DataType := ftString;
      end;

      with cdsSvnCommits do
      begin
        for i:=0 to FieldDefs.Count -1 do
           FieldDefs[i].CreateField(cdsSvnCommits);
      end;

      //信息
      myField := cdsSvnCommits.FieldDefs.AddFieldDef ;
      myField.Name := 'ZMESSAGETEXT';
      myField.DataType := ftString;
      myField.Size := 4000;
      with myfield.CreateField(cdsSvnCommits) do
      begin
        FieldKind := fkCalculated;
      end;

      //项目名称
      myField := cdsSvnCommits.FieldDefs.AddFieldDef ;
      myField.Name := 'ZPRONAME';
      myField.DataType := ftString;
      myField.Size := 200;
      with myfield.CreateField(cdsSvnCommits) do
      begin
        FieldKind := fkCalculated;
      end;

      cdsSvnCommits.CreateDataSet;
    end;

    while not cdsSvnCommits.IsEmpty do
      cdsSvnCommits.Delete;


    //生成数据
    cdsTemp.First;
    while not cdsTemp.Eof do
    begin
      cdsSvnCommits.Append;                                   
      for i:=0 to cdsTemp.FieldDefs.Count -1 do
      begin
        if  cdsTemp.FieldDefs[i].Name = 'ZID' then
          cdsSvnCommits.FieldByName('ZAUTOID').AsString :=
            cdsTemp.FieldByName('ZID').AsString
        else
          cdsSvnCommits.FieldByName(cdsTemp.FieldDefs[i].Name).AsVariant :=
            cdsTemp.FieldByName(cdsTemp.FieldDefs[i].Name).AsVariant;
      end;

      cdsSvnCommits.FieldByName('ZVERSTR').AsString :=
        cdsTemp.FieldByName('ZVERSION').AsString;
      cdsSvnCommits.Post;
      cdsTemp.Next;
    end;
    cdsSvnCommits.First;

    if cdsSvnCommits.RecordCount > 0 then
      LoadSvnChanges(cdsSvnCommits.FieldByName('ZSVN_GUID').AsString,
        cdsSvnCommits.FieldByName('ZVERSION').AsInteger)
    else begin
      while not cdsSvnChanges.Eof do
        cdsSvnChanges.Delete;
    end;

  finally
    cdsSvnCommits.EnableControls;
    fLoading := myb;
    HideProgress;
  end;
end;


function TAntManageClientDlg.GetSvnCommitPageCount(
  Awhere: string): integer;
var
  mySQL  : string;
  myRowCount : integer;
  mywhere : string;
const
  glSQL = 'exec pt_SplitPage ''TB_SVN_COMMITS'',' +
          '''ZID'', ''%s'',20,%d,%d,1,''%s''';
  //               页码,以总数=1, 条件where
begin
  mywhere := Awhere;
  mySQL := format(glSQL,[
      '',
      1{APageIndex},
      1, //不是取总数
      mywhere]);
  myRowCount := ClientSystem.fDbOpr.ReadInt(PChar(mySQL));
  Result := myRowCount div 20;
  if (myRowCount mod 20) > 0 then
    Result := Result + 1;
end;

procedure TAntManageClientDlg.LoadSvnChanges(AAntGUID: string;
  Aversion: integer);
var
  i : integer;
  mySQL : string;
  myb : Boolean;
  myField : TFieldDef;
const
  gl_SQLTXT = 'select * from TB_SVN_CHANGES where ZSVN_GUID=''%s'' and ' +
     ' ZVERSION=%d';
begin
  //
  mySQL := format(gl_SQLTXT,[AAntGUID,Aversion]);
  cdstemp.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));

  myb := fLoading;
  fLoading := True;
  cdsSvnChanges.DisableControls;
  try

    if cdsSvnChanges.FieldDefs.Count = 0 then
    begin
      cdsSvnChanges.FieldDefs.Assign(cdstemp.FieldDefs);
      with cdsSvnChanges.FieldDefs do
      begin
        myField := AddFieldDef;
        myField.Name := 'ZAUTOID';
        myField.DataType := ftInteger;
      end;
      cdsSvnChanges.CreateDataSet;
    end;
    while not cdsSvnChanges.Eof do
      cdsSvnChanges.Delete;

    //生成数据
    cdsTemp.First;
    while not cdsTemp.Eof do
    begin
      cdsSvnChanges.Append;
      for i:=0 to cdsTemp.FieldDefs.Count -1 do
      begin
        if  cdsTemp.FieldDefs[i].Name='ZID' then
          cdsSvnChanges.FieldByName('ZAUTOID').AsInteger :=
            cdsTemp.FieldByName('ZID').AsInteger
        else
          cdsSvnChanges.FieldByName(cdsTemp.FieldDefs[i].Name).AsVariant :=
            cdsTemp.FieldByName(cdsTemp.FieldDefs[i].Name).AsVariant;
      end;
      cdsSvnChanges.Post;
      cdsTemp.Next;
    end;
    cdsSvnChanges.First;

  finally
    fLoading := myb;
    cdsSvnChanges.EnableControls;
  end;
  
  
end;

{ TPySvnThread }

procedure TPySvnThread.BeginAnimate;
begin
  fani.Visible := True;
  fani.Active := True;
  fPySvning := True;
  fMemo.Items.Clear;
  fMemo.Items.Add(#13#10);
  fMemo.Items.Add('  正在编译中...');
  PyFileName := Format('C%s',[fcds.FieldByName('ZPYFILE').AsString]);
  fAction.ImageIndex := 12;
  Application.ProcessMessages;
end;

constructor TPySvnThread.Create(Acds:TClientDataSet;Aani: TAnimate;
  AMemo:TListBox;AIdTCP: TIdTCPClient;AAction:TAction);
begin
  inherited Create(false);
  fcds := Acds;
  fani := Aani;
  fMemo := AMemo;
  fIdTCP := AIdTCP;
  fAction := AAction;
  Self.Priority := tpNormal;
  Self.FreeOnTerminate := True;
end;

procedure TPySvnThread.EndAnimate;
begin
  fMemo.Items.Clear;
  fMemo.Items.Add(fResultStr);
  if not (fcds.State in [dsEdit,dsInsert]) then
    fcds.Edit;
  fcds.FieldByName('ZDATE').AsDateTime := ClientSystem.fDbOpr.GetSysDateTime;
  fcds.Post;
  fani.Active  := False;
  fani.Visible := False;
  fPySvning    := False;
  fAction.ImageIndex := 11;
end;

procedure TPySvnThread.Execute;
begin
  if Terminated then Exit;
  try
    fResultStr := '';
    Synchronize(BeginAnimate);
    fIdTCP.WriteLn(PyFileName);
    fResultStr := fIdTCP.ReadLn();
  finally
    Synchronize(EndAnimate);
  end;
end;

procedure TAntManageClientDlg.lstResultDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  lstResult.Canvas.FillRect(Rect);
  lstResult.Canvas.TextOut(Rect.Left,Rect.Top ,IntToStr(index+1));
  lstResult.Canvas.Font.Color := clBlack;
  if (lstResult.Tag > 0) and (lstResult.ItemIndex = index) then
    lstResult.Canvas.Font.Color := clRed;
  lstResult.Canvas.TextOut(rect.Left+50,Rect.Top,lstResult.Items[index]);
end;

procedure TAntManageClientDlg.pgcAntChange(Sender: TObject);
var
  myAGUID : string;
begin
  //是日志
  if pgcAnt.ActivePageIndex = 2 then
  begin
    if cdsAntList.IsEmpty then Exit;
    myAGUID := cdsAntList.FieldByName('ZGUID').AsString;
    fSVNCommitPagerec.findex := 1;
    fSVNCommitPageRec.fWhere := format('ZSVN_GUID=''''%s''''',[myAGUID]);
    fSVNCommitPagerec.fcount := GetSvnCommitPageCount(fSVNCommitPageRec.fWhere);
    LoadSvnCommit(fSVNCommitPageRec.fWhere,1);
   
  end;
end;

procedure TAntManageClientDlg.dbgrdSvnCommitsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if (cdsSvnCommits.RecNo mod 2  = 0) and not ( gdSelected in State)  then
    dbgrdSvnCommits.Canvas.Brush.Color := clSilver;

  dbgrdSvnCommits.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TAntManageClientDlg.cdsSvnCommitsAfterScroll(DataSet: TDataSet);
begin
  if fLoading then Exit;
  LoadSvnChanges(DataSet.FieldByName('ZSVN_GUID').AsString,
    DataSet.FieldByName('ZVERSION').AsInteger);
end;

procedure TAntManageClientDlg.dbgrdSvnChangesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if (cdsSvnChanges.RecNo mod 2  = 0) and not ( gdSelected in State)  then
    dbgrdSvnChanges.Canvas.Brush.Color := clSilver;

  dbgrdSvnChanges.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TAntManageClientDlg.cdsSvnCommitsCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('ZMESSAGETEXT').AsString :=
  DataSet.FieldByName('ZMESSAGE').AsString;

  //增加这个是为了提高速度
  if cdsCloneAntList.FieldByName('ZGUID').AsString =
     DataSet.FieldByName('ZSVN_GUID').AsString then
    DataSet.FieldByName('ZPRONAME').AsString :=
      cdsCloneAntList.FieldByName('ZNAME').AsString

  else if cdsCloneAntList.Locate('ZGUID',DataSet.FieldByName('ZSVN_GUID').AsString,
    [loPartialKey]) then
    DataSet.FieldByName('ZPRONAME').AsString :=
      cdsCloneAntList.FieldByName('ZNAME').AsString;

end;

procedure TAntManageClientDlg.actSvnLog_FirstPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := fSVNCommitPageRec.findex<>1;
end;

procedure TAntManageClientDlg.actSvnLog_FirstPageExecute(Sender: TObject);
begin
  fSVNCommitPageRec.findex := 1;
  LoadSvnCommit(fSVNCommitPageRec.fWhere,
   fSVNCommitPageRec.findex);
end;

procedure TAntManageClientDlg.actSvnLog_ProPageExecute(Sender: TObject);
begin
  fSVNCommitPageRec.findex := fSVNCommitPageRec.findex -1;
  LoadSvnCommit(fSVNCommitPageRec.fWhere,
   fSVNCommitPageRec.findex);
end;

procedure TAntManageClientDlg.actSvnLog_ProPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (fSVNCommitPageRec.findex>1) ;
end;

procedure TAntManageClientDlg.actSvnLog_NextPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := fSvnCommitPageRec.findex <
    fSvnCommitPageRec.fcount;
end;

procedure TAntManageClientDlg.actSvnLog_NextPageExecute(Sender: TObject);
begin
  fSVNCommitPageRec.findex := fSVNCommitPageRec.findex +1;
  LoadSvnCommit(fSVNCommitPageRec.fWhere,
   fSVNCommitPageRec.findex);
end;

procedure TAntManageClientDlg.actSvnLog_LastPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := fSvnCommitPageRec.findex <>
    fSvnCommitPageRec.fcount;
end;

procedure TAntManageClientDlg.actSvnLog_LastPageExecute(Sender: TObject);
begin
  fSVNCommitPageRec.findex := fSVNCommitPageRec.fcount;
  LoadSvnCommit(fSVNCommitPageRec.fWhere,
   fSVNCommitPageRec.findex);
end;

procedure TAntManageClientDlg.actSvnLog_PiroProjectUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not cdsAntList.Bof;
end;

procedure TAntManageClientDlg.actSvnLog_PiroProjectExecute(
  Sender: TObject);
begin
  cdsAntList.Prior;
  fSVNCommitPagerec.findex := 1;
  fSVNCommitPagerec.fWhere := format('ZSVN_GUID=''''%s''''',
    [cdsAntList.FieldByName('ZGUID').AsString]);
  fSVNCommitPagerec.fcount := GetSvnCommitPageCount(fSVNCommitPagerec.fWhere);
  LoadSvnCommit(fSVNCommitPagerec.fWhere,1);
end;

procedure TAntManageClientDlg.actSvnLog_NetProjectExecute(Sender: TObject);
begin
  cdsAntList.Next;
  fSVNCommitPagerec.findex := 1;
    fSVNCommitPagerec.fWhere := format('ZSVN_GUID=''''%s''''',
    [cdsAntList.FieldByName('ZGUID').AsString]);
  fSVNCommitPagerec.fcount := GetSvnCommitPageCount(fSVNCommitPagerec.fWhere);
  LoadSvnCommit(fSVNCommitPagerec.fWhere,1);
end;

procedure TAntManageClientDlg.actSvnLog_NetProjectUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not cdsAntList.Eof;
end;

procedure TAntManageClientDlg.actSvnLog_AllProjectExecute(Sender: TObject);
begin
  fSVNCommitPagerec.findex := 1;
  fSVNCommitPagerec.fWhere := '1=1';
  fSVNCommitPagerec.fcount := GetSvnCommitPageCount(fSVNCommitPagerec.fWhere);
  LoadSvnCommit(fSVNCommitPagerec.fWhere,1);
end;

procedure TAntManageClientDlg.btnEditSVNRULClick(Sender: TObject);
begin
  if ClientSystem.fEditerType <> etAdmin then
  begin
    MessageBox(Handle,'你没有权限','提示',MB_ICONWARNING+MB_OK);
    Exit;
  end;
  dbedtZSVN_URL.Visible := True;
  btnEditSVNRUL.Visible := False;
end;

procedure TAntManageClientDlg.act_ReLoadAntExecute(Sender: TObject);
begin
  LoadAnt();
end;

end.
