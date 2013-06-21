//提目的回答功能
//权限处理

unit QuestionManageClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseChildfrm, ComCtrls, DB, DBClient, Grids, DBGrids, ExtCtrls,
  ActnList, StdCtrls, Buttons, DBCtrls, Mask;

type

  TPageTypeRec = record
    fClassCode : string;   //题库号
    fIndex : Integer;
    fIndexCount : Integer;
    fWhereStr : string; //分页的where条件
  end;

  TQuestionManageClientDlg = class(TBaseChildDlg)
    pgcQuestion: TPageControl;
    tsQuestionClass: TTabSheet;
    tsQuest: TTabSheet;
    pnl1: TPanel;
    pnl2: TPanel;
    dbgrdQuestionClass: TDBGrid;
    pnl3: TPanel;
    cdsQuestionClass: TClientDataSet;
    dsQuestionClass: TDataSource;
    actlst1: TActionList;
    act_ReLoadClass: TAction;
    btnReLoadClass: TBitBtn;
    act_Class_Add: TAction;
    act_Class_Save: TAction;
    btnClass_Add: TBitBtn;
    btnClass_Save: TBitBtn;
    chkEditor: TCheckBox;
    dbgrdQuestion: TDBGrid;
    pnl4: TPanel;
    spl1: TSplitter;
    pnl5: TPanel;
    cdsQuestion: TClientDataSet;
    dsQuestion: TDataSource;
    pnl6: TPanel;
    btnQuestoin_Add: TBitBtn;
    act_Questoin_Add: TAction;
    act_Question_Save: TAction;
    btnQuestion_Save: TBitBtn;
    btnQuestion_firstpage: TBitBtn;
    btnQuestion_NextPage: TBitBtn;
    btnQuestion_ProvPage: TBitBtn;
    btnQuestion_LastPage: TBitBtn;
    act_Question_firstpage: TAction;
    act_Question_NextPage: TAction;
    act_Question_ProvPage: TAction;
    act_Question_LastPage: TAction;
    act_Question_ReLoad: TAction;
    btnQuestion_ReLoad: TBitBtn;
    lblPage: TLabel;
    act_Question_Cancel: TAction;
    btnQuestion_Cancel: TBitBtn;
    dbedtZQTITLE: TDBEdit;
    lb1: TLabel;
    dbmmoZQCENTENT: TDBMemo;
    lbl1: TLabel;
    lbl2: TLabel;
    dbmmoZANSWER: TDBMemo;
    dbtxtZDATETIME: TDBText;
    dblkcbbZNAME: TDBLookupComboBox;
    dbchkZSORT: TDBCheckBox;
    lbl3: TLabel;
    lbl4: TLabel;
    lblQuestionCount: TLabel;
    chkEditQustion: TCheckBox;
    dbmmoZNOTE: TDBMemo;
    procedure act_ReLoadClassExecute(Sender: TObject);
    procedure dbgrdQuestionClassDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure act_Class_AddUpdate(Sender: TObject);
    procedure act_Class_AddExecute(Sender: TObject);
    procedure cdsQuestionClassNewRecord(DataSet: TDataSet);
    procedure act_Class_SaveUpdate(Sender: TObject);
    procedure act_ReLoadClassUpdate(Sender: TObject);
    procedure act_Class_SaveExecute(Sender: TObject);
    procedure act_Class_DelUpdate(Sender: TObject);
    procedure act_Class_DelExecute(Sender: TObject);
    procedure chkEditorClick(Sender: TObject);
    procedure pgcQuestionChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgcQuestionChange(Sender: TObject);
    procedure act_Question_ReLoadExecute(Sender: TObject);
    procedure act_Question_firstpageExecute(Sender: TObject);
    procedure act_Question_firstpageUpdate(Sender: TObject);
    procedure act_Question_NextPageUpdate(Sender: TObject);
    procedure act_Question_NextPageExecute(Sender: TObject);
    procedure act_Question_ProvPageUpdate(Sender: TObject);
    procedure act_Question_ProvPageExecute(Sender: TObject);
    procedure act_Question_LastPageUpdate(Sender: TObject);
    procedure act_Question_LastPageExecute(Sender: TObject);
    procedure cdsQuestionNewRecord(DataSet: TDataSet);
    procedure act_Questoin_AddExecute(Sender: TObject);
    procedure act_Questoin_AddUpdate(Sender: TObject);
    procedure act_Question_SaveExecute(Sender: TObject);
    procedure act_Question_CancelUpdate(Sender: TObject);
    procedure act_Question_CancelExecute(Sender: TObject);
    procedure dbgrdQuestionDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure act_Question_SaveUpdate(Sender: TObject);
    procedure chkEditQustionClick(Sender: TObject);
  private
    { Private declarations }

    fPageTypeList : array of TPageTypeRec;
    fCurPageType : TPageTypeRec;
    
    procedure LoadQustionClass();
    function GetPageType(ACode: string): TPageTypeRec;  //加载题库目录


  public
    { Public declarations }
    procedure initBase; override;
    procedure freeBase; override;
    procedure Showfrm ; override;  //显示后发生的事件
    procedure Closefrm; override;  //关闭显示发生的事件

    class function GetModuleID : integer;override;

    function  GetQuestionCount(AWhereStr:String):integer; //取出页总数
    procedure LoadQuestionList(APageIndex:integer;AWhereStr:String);
    property PageType[ACode:string]: TPageTypeRec read GetPageType;
  end;


implementation
uses
  ClinetSystemUnits,
  ClientTypeUnits, DmUints;

{$R *.dfm}

{ TBaseChildDlg2 }

procedure TQuestionManageClientDlg.Closefrm;
begin
  inherited;

end;

procedure TQuestionManageClientDlg.freeBase;
begin
  inherited;
  SetLength(fPageTypeList,0);
end;

class function TQuestionManageClientDlg.GetModuleID: integer;
begin
  //mtQuestion
  Result := Ord(mtQuestion);
end;

procedure TQuestionManageClientDlg.initBase;
var
  i : Integer;
  mycds : TClientDataSet;
  myfield : TFieldDef;
  myb : Boolean;
  mycount : Integer;
const
  gc_SQLTXT = 'select * from TB_QUESTION where 1=0';
  gc_SQLTXT2 = 'select isnull(count(ZQCODE),0) from TB_QUESTION';
begin

  LoadQustionClass();

  mycount := ClientSystem.fDbOpr.ReadInt(PChar(gc_SQLTXT2));
  lblQuestionCount.Caption := Format('总题目数:%d',[mycount]);

  myb := fLoading;
  fLoading := True;
  mycds := TClientDataSet.Create(nil);
  try

    mycds.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(gc_SQLTXT));
    if cdsQuestion.Fields.Count = 0 then
    begin
      if cdsQuestion.Active then
        cdsQuestion.Close;
      cdsQuestion.FieldDefs.Clear;
      cdsQuestion.FieldDefs.Assign(mycds.FieldDefs);
      with cdsQuestion.FieldDefs do
      begin
        myField := AddFieldDef;
        myField.Name := 'ZISNEW';   //是否是新增
        myField.DataType := ftBoolean;

        myField := AddFieldDef;
        myField.Name := 'ZINDEX';
        myField.DataType := ftString;
      end;


      for i:=0 to cdsQuestion.FieldDefs.Count -1 do
      begin
        cdsQuestion.FieldDefs[i].CreateField(cdsQuestion).Alignment := taLeftJustify;
      end;

      //由谁创建
      with cdsQuestion do
      begin
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZNAME';
        myfield.DataType := ftString;
        myfield.Size := 50;
        with myfield.CreateField(cdsQuestion) do
        begin
          FieldKind := fkLookup;
          KeyFields := 'ZUSER_ID';
          LookupDataSet := DM.cdsUserAll;
          LookupKeyFields := 'ZID';
          LookupResultField := 'ZNAME';
        end;
      end;

      cdsQuestion.CreateDataSet;
    end;

  finally
    mycds.Free;
    fLoading := myb;
  end;
end;


procedure TQuestionManageClientDlg.LoadQustionClass;
var
  mycds : TClientDataSet;
  myfield : TFieldDef;
  mywhere : string;
  i,c : Integer;
  myb : Boolean;
const
  glSQL1 = 'select * from TB_QUESTION_CLASS order by ZSORT ';
begin
  inherited;

  SetLength(fPageTypeList,0);

  mycds := TClientDataSet.Create(nil);
  myb := fLoading;
  fLoading := True;
  try
    mycds.data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL1));

    if cdsQuestionClass.Fields.Count = 0 then
    begin
      if cdsQuestionClass.Active then
        cdsQuestionClass.Close;
      cdsQuestionClass.FieldDefs.Clear;
      cdsQuestionClass.FieldDefs.Assign(mycds.FieldDefs);
      with cdsQuestionClass.FieldDefs do
      begin
        myField := AddFieldDef;
        myField.Name := 'ZISNEW';   //是否是新增
        myField.DataType := ftBoolean;

        myField := AddFieldDef;
        myField.Name := 'ZINDEX';
        myField.DataType := ftString;

      end;
      cdsQuestionClass.CreateDataSet;
    end;

    cdsQuestionClass.First;
    while not cdsQuestionClass.Eof do
      cdsQuestionClass.Delete;

    //写入数据
    mycds.First;
    c := 0;

    //生成页索引的参数
    SetLength(fPageTypeList,mycds.RecordCount);

    while not mycds.Eof do
    begin
      Inc(c);
      fPageTypeList[c-1].fClassCode := mycds.fieldByName('ZCODE').AsString;
      fPageTypeList[c-1].fIndex     := 1;
      fPageTypeList[c-1].fIndexCount := 1;
      fPageTypeList[c-1].fWhereStr  := Format('ZCLASS_GUID=''''%s''''',[mycds.FieldByName('ZGUID').AsString]);

      cdsQuestionClass.Append;
      for i:=0 to mycds.Fields.Count -1 do
      begin
        cdsQuestionClass.FieldByName(mycds.Fields[i].FieldName).AsVariant :=
          mycds.fieldByName(mycds.Fields[i].FieldName).AsVariant;
        cdsQuestionClass.FieldByName('ZINDEX').AsString  := IntToStr(c);
      end;
      cdsQuestionClass.FieldByName('ZISNEW').AsBoolean := False;

      cdsQuestionClass.Post;
      mycds.Next;
    end;

    cdsQuestionClass.First;

  finally
    mycds.Free;
    fLoading := myb;
  end;
end;


procedure TQuestionManageClientDlg.Showfrm;
begin
  inherited;

end;

procedure TQuestionManageClientDlg.act_ReLoadClassExecute(Sender: TObject);
begin
  LoadQustionClass();
end;

procedure TQuestionManageClientDlg.dbgrdQuestionClassDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (cdsQuestionClass.RecNo mod 2  = 0) and not ( gdSelected in State)  then
    dbgrdQuestionClass.Canvas.Brush.Color := clSilver;
  dbgrdQuestionClass.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TQuestionManageClientDlg.act_Class_AddUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsQuestionClass.Active and
  (cdsQuestionClass.State in [dsBrowse]) and chkEditor.Checked;
end;

procedure TQuestionManageClientDlg.act_Class_AddExecute(Sender: TObject);
begin
  cdsQuestionClass.Append;
end;

procedure TQuestionManageClientDlg.cdsQuestionClassNewRecord(
  DataSet: TDataSet);
begin
  DataSet.FieldByName('ZGUID').AsString   := NewGuid;
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
end;

procedure TQuestionManageClientDlg.act_Class_SaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsQuestionClass.Active and
  (cdsQuestionClass.State in [dsEdit, dsInsert]);
end;

procedure TQuestionManageClientDlg.act_ReLoadClassUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsQuestionClass.Active and
  (cdsQuestionClass.State in [dsBrowse]);
end;

procedure TQuestionManageClientDlg.act_Class_SaveExecute(Sender: TObject);
var
  mySQL : string;
const
  gc_SQLTXT = 'insert into TB_QUESTION_CLASS(ZGUID,ZCODE,ZTITLE,ZNOTE,ZPOWER,ZSORT) ' +
              ' values(''%s'',''%s'',''%s'',''%s'',''%s'',%d)';
  gc_SQLTXT2 = 'update TB_QUESTION_CLASS set ZCODE=''%s'',ZTITLE=''%s'',ZNOTE=''%s'',ZPOWER=''%s'',ZSORT=%d ' +
               ' where ZGUID=''%s''';
begin
  //保存分类

  //写入到服务上
  //新建
  if cdsQuestionClass.FieldByName('ZISNEW').AsBoolean then
  begin
    if  cdsQuestionClass.FieldByName('ZCODE').AsString = '' then
    begin
      MessageBox(Handle,'题库号不能为空','提示',1);
      Exit;
    end;
    mySQL := Format(gc_SQLTXT,[
      cdsQuestionClass.FieldByName('ZGUID').AsString,
      cdsQuestionClass.FieldByName('ZCODE').AsString,
      cdsQuestionClass.FieldByName('ZTITLE').AsString,
      cdsQuestionClass.FieldByName('ZNOTE').AsString,
      cdsQuestionClass.FieldByName('ZPOWER').AsString,
      cdsQuestionClass.FieldByName('ZSORT').AsInteger
      ]);

  end
  //修改的
  else begin
    mySQL := Format(gc_SQLTXT2,[
      cdsQuestionClass.FieldByName('ZCODE').AsString,
      cdsQuestionClass.FieldByName('ZTITLE').AsString,
      cdsQuestionClass.FieldByName('ZNOTE').AsString,
      cdsQuestionClass.FieldByName('ZPOWER').AsString,
      cdsQuestionClass.FieldByName('ZSORT').AsInteger,
      cdsQuestionClass.FieldByName('ZGUID').AsString
      ]);

  end;

  if ClientSystem.fDbOpr.ExeSQL(PChar(mySQL)) then
  begin
    cdsQuestionClass.FieldByName('ZISNEW').AsBoolean := False;
    cdsQuestionClass.Post;
  end;

end;

procedure TQuestionManageClientDlg.act_Class_DelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsQuestionClass.Active and
  (cdsQuestionClass.State in [dsBrowse]);
end;

procedure TQuestionManageClientDlg.act_Class_DelExecute(
  Sender: TObject);
begin
  cdsQuestionClass.Edit;
end;

procedure TQuestionManageClientDlg.chkEditorClick(Sender: TObject);
begin
  //权限
  if not HasModuleActionByShow(1,0,atInsert) then
  begin
    chkEditor.Checked := False;
    Exit;
  end;

  if chkEditor.Checked then
  begin
   
    dbgrdQuestionClass.Options := dbgrdQuestionClass.Options - [dgRowSelect];
    dbgrdQuestionClass.Options := dbgrdQuestionClass.Options + [dgEditing];
    dbgrdQuestionClass.ReadOnly := False;

  end
  else begin
    dbgrdQuestionClass.Options := dbgrdQuestionClass.Options + [dgRowSelect];
    dbgrdQuestionClass.ReadOnly := True;
  end;
end;

procedure TQuestionManageClientDlg.LoadQuestionList(APageIndex: integer;
  AWhereStr: String);
var
  i,myc : Integer;
  myb : Boolean;
  mywhere : string;
  mySql : string;
  cdstemp : TClientDataSet;
const
  //glSQL = 'select * from TB_ANT order by ZDATE desc';  //ZID desc
  glSQL = 'exec pt_SplitPage ''TB_QUESTION '',' +
          '''ZQCODE,ZQTITLE,ZQCENTENT,ZANSWER,ZUSER_ID,ZDATETIME,ZSTOP,ZIDX'',' +
          '''%s'',20,%d,%d,0,''%s''';

begin
  //
  if fLoading then Exit;

  mywhere := AWhereStr;
  mySQL := format(glSQL,[
      'ZDATETIME',
      APageIndex,
      0, //不是取总数
      mywhere]);

  myb := fLoading;
  fLoading := True;
  cdsQuestion.DisableControls;
  ClientSystem.BeginTickCount;
  ShowProgress('读取数据...',0);
  cdstemp := TClientDataSet.Create(nil);
  try
    while not cdsQuestion.Eof do
      cdsQuestion.Delete;

    cdstemp.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));
    cdstemp.First;
    myc := (APageIndex-1) * 20 +1;
    while not cdstemp.Eof do
    begin
      cdsQuestion.Append;
      cdsQuestion.FieldByName('ZISNEW').AsBoolean := False;
      cdsQuestion.FieldByName('ZINDEX').AsString := inttostr(myc);
      Inc(myc);
      for i:=0 to cdstemp.Fields.Count -1 do
      begin
        cdsQuestion.FieldByName(cdstemp.Fields[i].FieldName).AsVariant :=
          cdstemp.FieldByName(cdstemp.Fields[i].FieldName).AsVariant;

      end;
      cdstemp.Next;
      cdsQuestion.Post;
    end;

    cdsQuestion.First;

    lblPage.Caption := Format('第 %d 页 共 %d 页',[APageIndex,fCurPageType.fIndexCount]);
  finally
    cdsQuestion.EnableControls;
    fLoading := myb;
    HideProgress;
    ClientSystem.EndTickCount;
    cdstemp.Free;
  end;
end;


procedure TQuestionManageClientDlg.pgcQuestionChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := (cdsQuestionClass.State = dsBrowse) and
  (cdsQuestion.State = dsBrowse);

  //权限
  if  not HasModuleActionByShow(1,0,atView) and
      (pgcQuestion.ActivePageIndex = 0)    then
  begin
    AllowChange := False;
    Exit;
  end;


  if not AllowChange then
  begin
    Application.MessageBox('正在编辑请保存','提示');
    Exit;
  end;
end;

procedure TQuestionManageClientDlg.pgcQuestionChange(Sender: TObject);
var
  i : Integer;
begin
  if fLoading then Exit;
  if pgcQuestion.ActivePageIndex = 1 then
  begin
    fCurPageType := PageType[cdsQuestionClass.FieldByName('ZCODE').AsString];
    fCurPageType.fIndexCount := GetQuestionCount(fCurPageType.fWhereStr);
    LoadQuestionList(fCurPageType.fIndex,fCurPageType.fWhereStr);
  end;
end;

function TQuestionManageClientDlg.GetPageType(ACode: string): TPageTypeRec;
var
  i : Integer;
  myPageIndex : TPageTypeRec;
begin
  for i := 0 to Length(fPageTypeList) -1 do
  begin
    myPageIndex := fPageTypeList[i];
    if CompareText(myPageIndex.fClassCode,ACode) = 0 then
    begin
      Result := myPageIndex;
      Exit;
    end;
  end;
end;

procedure TQuestionManageClientDlg.act_Question_ReLoadExecute(
  Sender: TObject);
var
  i : Integer;
  myPageIndex : TPageTypeRec;
begin
  myPageIndex := PageType[cdsQuestionClass.FieldByName('ZCODE').AsString];
  LoadQuestionList(myPageIndex.fIndex,myPageIndex.fWhereStr);
end;


function TQuestionManageClientDlg.GetQuestionCount(
  AWhereStr: String): integer;
var
  mySQL  : string;
  myRowCount : integer;
  mywhere : string;
const
  glSQL = 'exec pt_SplitPage ''TB_QUESTION'',''' +
         'ZDATETIME'', ''%s'',20,%d,%d,1,''%s''';
  //                                             页码,以总数=1, 条件where
begin
  mywhere := AWhereStr;

  mySQL := format(glSQL,[
    'ZDATETIME',
    1,
    1, //不是取总数
    mywhere]);


  myRowCount := ClientSystem.fDbOpr.ReadInt(PChar(mySQL));
  Result := myRowCount div 20;
  if (myRowCount mod 20) > 0 then
    Result := Result + 1;
end;


procedure TQuestionManageClientDlg.act_Question_firstpageExecute(
  Sender: TObject);
begin
  fCurPageType.fIndex := 1;
  LoadQuestionList(fCurPageType.fIndex,fCurPageType.fWhereStr);
end;

procedure TQuestionManageClientDlg.act_Question_firstpageUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled := (fCurPageType.fIndex <> 1) and
  (fCurPageType.fIndexCount > 0);
end;

procedure TQuestionManageClientDlg.act_Question_NextPageUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled := (fCurPageType.fIndex < fCurPageType.fIndexCount) and
  (fCurPageType.fIndexCount > 0);
end;

procedure TQuestionManageClientDlg.act_Question_NextPageExecute(
  Sender: TObject);
begin
  fCurPageType.fIndex := fCurPageType.fIndex + 1;
  LoadQuestionList(fCurPageType.fIndex,fCurPageType.fWhereStr);
end;

procedure TQuestionManageClientDlg.act_Question_ProvPageUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled := (fCurPageType.fIndex > 1) and
  (fCurPageType.fIndexCount > 0);
end;

procedure TQuestionManageClientDlg.act_Question_ProvPageExecute(
  Sender: TObject);
begin
  fCurPageType.fIndex := fCurPageType.fIndex - 1;
  LoadQuestionList(fCurPageType.fIndex,fCurPageType.fWhereStr);
end;

procedure TQuestionManageClientDlg.act_Question_LastPageUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled := (fCurPageType.fIndex <> fCurPageType.fIndexCount) and
  (fCurPageType.fIndexCount > 0);
end;

procedure TQuestionManageClientDlg.act_Question_LastPageExecute(
  Sender: TObject);
begin
  fCurPageType.fIndex := fCurPageType.fIndexCount;
  LoadQuestionList(fCurPageType.fIndex,fCurPageType.fWhereStr);
end;

procedure TQuestionManageClientDlg.cdsQuestionNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ZCLASS_GUID').AsString := cdsQuestionClass.FieldByName('ZGUID').AsString;
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
  DataSet.FieldByName('ZUSER_ID').AsInteger := ClientSystem.fEditer_id;
  DataSet.FieldByName('ZSTOP').AsBoolean := False;
end;

procedure TQuestionManageClientDlg.act_Questoin_AddExecute(
  Sender: TObject);
begin
  cdsQuestion.Append;
end;

procedure TQuestionManageClientDlg.act_Questoin_AddUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsQuestion.Active and
  (cdsQuestion.State = dsBrowse) and chkEditQustion.Checked;
end;

procedure TQuestionManageClientDlg.act_Question_SaveExecute(
  Sender: TObject);
var
  myIdx : Integer;  //要取出流水号出来
  mySQL : string;
  myCode : string;  //编号
const
  gl_SQLTXT = 'select isnull(max(ZIDX)+1,1) from TB_QUESTION';
  gl_SQLTXT2 = 'insert into TB_QUESTION(ZCLASS_GUID,ZQCODE,ZQTITLE,ZQCENTENT,ZANSWER,'+
               ' ZUSER_ID,ZDATETIME,ZIDX) values(''%s'',''%s'',''%s'',''%s'',''%s'',%d,''%s'',%d) ';

  gl_SQLTXT3 = 'update TB_QUESTION set ZQTITLE=''%s'',ZQCENTENT=''%s'',ZANSWER=''%s'',ZSTOP=%d ' +
               ' where ZCLASS_GUID=''%s'' and ZQCODE=''%s''';
begin
  //

  if cdsQuestion.FieldByName('ZISNEW').AsBoolean then
  begin
    myIdx := ClientSystem.fDbOpr.ReadInt(PChar(gl_SQLTXT));
    if myIdx < 10 then
      myCode := '00' + IntToStr(myIdx)
    else if  (myIdx >=10) and (myIdx <100) then
      myCode := '0' + IntToStr(myIdx)
    else
      myCode := IntToStr(myIdx);
    cdsQuestion.FieldByName('ZQCODE').AsString := myCode;
    cdsQuestion.FieldByName('ZDATETIME').AsDateTime := ClientSystem.fDbOpr.GetSysDateTime;
    myCode := Format('%s-%s',[cdsQuestionClass.FieldByName('ZCODE').AsString,myCode]);

    mySQL := Format(gl_SQLTXT2,[
      cdsQuestionClass.FieldByName('ZGUID').AsString,
      myCode,
      cdsQuestion.FieldByName('ZQTITLE').AsString,
      cdsQuestion.FieldByName('ZQCENTENT').AsString,
      cdsQuestion.FieldByName('ZANSWER').AsString,
      ClientSystem.fEditer_id,
      DateTimeToStr(cdsQuestion.FieldByName('ZDATETIME').AsDateTime),
      myIdx
      ]);
    
  end
  else begin
     mySQL := Format(gl_SQLTXT3,[
      cdsQuestion.FieldByName('ZQTITLE').AsString,
      cdsQuestion.FieldByName('ZQCENTENT').AsString,
      cdsQuestion.FieldByName('ZANSWER').AsString,
      Ord(cdsQuestion.FieldByName('ZSTOP').AsBoolean),
      cdsQuestionClass.FieldByName('ZGUID').AsString,
      cdsQuestion.FieldByName('ZQCODE').AsString
      ]);

  end;

  if ClientSystem.fDbOpr.ExeSQL(PChar(mySQL)) then
  begin
    cdsQuestion.FieldByName('ZISNEW').AsBoolean := False;
    cdsQuestion.Post;
  end
  else begin
    Application.MessageBox('保存出错,是否有特殊的字符','提示',MB_ICONERROR+MB_OK);
    Exit;
  end;

end;

procedure TQuestionManageClientDlg.act_Question_CancelUpdate(
  Sender: TObject);
begin
  //
  (Sender as TAction).Enabled := cdsQuestion.Active and
  (cdsQuestion.State in [dsEdit,dsInsert]);
end;

procedure TQuestionManageClientDlg.act_Question_CancelExecute(
  Sender: TObject);
begin
  cdsQuestion.Cancel;
end;

procedure TQuestionManageClientDlg.dbgrdQuestionDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (cdsQuestion.RecNo mod 2  = 0) and not ( gdSelected in State)  then
    dbgrdQuestion.Canvas.Brush.Color := clSilver;

  if cdsQuestion.FieldByName('ZSTOP').AsBoolean then
  begin
    dbgrdQuestion.Canvas.Font.Color := clRed;
  end;

  dbgrdQuestion.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TQuestionManageClientDlg.act_Question_SaveUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsQuestion.Active and
  (cdsQuestion.State in [dsEdit,dsInsert]) and chkEditQustion.Checked; 
end;

procedure TQuestionManageClientDlg.chkEditQustionClick(Sender: TObject);
begin

   //权限
  if  not HasModuleActionByShow(1,0,atInsert) then
  begin
    chkEditQustion.Checked := False;
    Exit;
  end;


  dbedtZQTITLE.ReadOnly := chkEditQustion.Checked;
  dbmmoZQCENTENT.ReadOnly := chkEditQustion.Checked;
  dbmmoZANSWER.ReadOnly := chkEditQustion.Checked;
  dbchkZSORT.ReadOnly := chkEditQustion.Checked;
end;

end.
