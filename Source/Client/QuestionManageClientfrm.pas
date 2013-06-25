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

  PPageTypeRec = ^TPageTypeRec;

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
    ts1: TTabSheet;
    pnl7: TPanel;
    dbgrdLeve: TDBGrid;
    spl2: TSplitter;
    pnl8: TPanel;
    dsDeveLeve: TDataSource;
    cdsDeveLeve: TClientDataSet;
    grp1: TGroupBox;
    grp2: TGroupBox;
    grp3: TGroupBox;
    grp4: TGroupBox;
    grp5: TGroupBox;
    GroupBox1: TGroupBox;
    grp6: TGroupBox;
    grp7: TGroupBox;
    grp8: TGroupBox;
    grp9: TGroupBox;
    dblkcbbZQUCLASS_CODE_NAME_1: TDBLookupComboBox;
    lbl5: TLabel;
    dbedtZQUCLASS_NUM_1: TDBEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    dbedtZQUCLASS_SCORE_1: TDBEdit;
    pnl9: TPanel;
    btnDeveLeve_Add: TBitBtn;
    btnDeveLeve_Save: TBitBtn;
    cdsQuestionClass_bak: TClientDataSet;
    dbedtZDEVENAME: TDBEdit;
    dbedtZSORT: TDBEdit;
    lbl8: TLabel;
    lbl9: TLabel;
    btnDeveLeve_Cancel: TBitBtn;
    act_DeveLeve_Add: TAction;
    act_DeveLeve_Save: TAction;
    act_DeveLeve_Cancel: TAction;
    chkEditDeveLeve: TCheckBox;
    act_DeveLeve_ReLoad: TAction;
    btnDeveLeve_ReLoad: TBitBtn;
    btnDeveLeve_Build: TBitBtn;
    lbl10: TLabel;
    dblkcbbZQUCLASS_CODE_NAME_2: TDBLookupComboBox;
    lbl11: TLabel;
    dbedtZQUCLASS_NUM_2: TDBEdit;
    lbl12: TLabel;
    dbedtZQUCLASS_SCORE_2: TDBEdit;
    Label1: TLabel;
    dblkcbbZQUCLASS_CODE_NAME_3: TDBLookupComboBox;
    Label2: TLabel;
    dbedtZQUCLASS_NUM_3: TDBEdit;
    Label3: TLabel;
    dbedtZQUCLASS_SCORE_3: TDBEdit;
    Label4: TLabel;
    dblkcbbZQUCLASS_CODE_NAME_4: TDBLookupComboBox;
    Label5: TLabel;
    dbedtZQUCLASS_NUM_4: TDBEdit;
    Label6: TLabel;
    dbedtZQUCLASS_SCORE_4: TDBEdit;
    Label7: TLabel;
    dblkcbbZQUCLASS_CODE_NAME_5: TDBLookupComboBox;
    Label8: TLabel;
    dbedtZQUCLASS_NUM_5: TDBEdit;
    Label9: TLabel;
    dbedtZQUCLASS_SCORE_5: TDBEdit;
    Label10: TLabel;
    dblkcbbZQUCLASS_CODE_NAME_6: TDBLookupComboBox;
    Label11: TLabel;
    dbedtZQUCLASS_NUM_6: TDBEdit;
    Label12: TLabel;
    dbedtZQUCLASS_SCORE_6: TDBEdit;
    Label13: TLabel;
    dblkcbbZQUCLASS_CODE_NAME_7: TDBLookupComboBox;
    Label14: TLabel;
    dbedtZQUCLASS_NUM_7: TDBEdit;
    Label15: TLabel;
    dbedtZQUCLASS_SCORE_7: TDBEdit;
    Label16: TLabel;
    dblkcbbZQUCLASS_CODE_NAME_8: TDBLookupComboBox;
    Label17: TLabel;
    dbedtZQUCLASS_NUM_8: TDBEdit;
    Label18: TLabel;
    dbedtZQUCLASS_SCORE_8: TDBEdit;
    Label19: TLabel;
    dblkcbbZQUCLASS_CODE_NAME_9: TDBLookupComboBox;
    Label20: TLabel;
    dbedtZQUCLASS_NUM_9: TDBEdit;
    Label21: TLabel;
    dbedtZQUCLASS_SCORE_9: TDBEdit;
    Label22: TLabel;
    dblkcbbZQUCLASS_CODE_NAME_10: TDBLookupComboBox;
    Label23: TLabel;
    dbedtZQUCLASS_NUM_10: TDBEdit;
    Label24: TLabel;
    dbedtZQUCLASS_SCORE_10: TDBEdit;
    act_DeveLeve_Build: TAction;
    dlgSave1: TSaveDialog;
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
    procedure act_DeveLeve_AddUpdate(Sender: TObject);
    procedure act_DeveLeve_AddExecute(Sender: TObject);
    procedure act_DeveLeve_SaveExecute(Sender: TObject);
    procedure cdsDeveLeveNewRecord(DataSet: TDataSet);
    procedure act_DeveLeve_SaveUpdate(Sender: TObject);
    procedure act_DeveLeve_CancelUpdate(Sender: TObject);
    procedure act_DeveLeve_CancelExecute(Sender: TObject);
    procedure dbgrdLeveDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure act_DeveLeve_ReLoadExecute(Sender: TObject);
    procedure act_DeveLeve_ReLoadUpdate(Sender: TObject);
    procedure chkEditDeveLeveClick(Sender: TObject);
    procedure act_DeveLeve_BuildExecute(Sender: TObject);
  private
    { Private declarations }

    fPageTypeList : TList;
    fCurPageType : PPageTypeRec;

    procedure ClearPageTypeList(); //清空
    procedure LoadQustionClass();
    procedure LoadDeveLeve();
    function GetPageType(ACode: string): PPageTypeRec;  //加载题库目录


  public
    { Public declarations }
    procedure initBase; override;
    procedure freeBase; override;
    procedure Showfrm ; override;  //显示后发生的事件
    procedure Closefrm; override;  //关闭显示发生的事件

    class function GetModuleID : integer;override;

    function  GetQuestionCount(AWhereStr:String):integer; //取出页总数
    procedure LoadQuestionList(APageIndex:integer;AWhereStr:String);
    property PageType[ACode:string]: PPageTypeRec read GetPageType;
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
  ClearPageTypeList();
  fPageTypeList.Free;
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
  gc_SQLTXT3 = 'select * from TB_QUESTION_DEVELEVEL where 1=0';
begin

  fPageTypeList := TList.Create;
  //cdsDeveLeve
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



    myField := cdsQuestionClass_bak.FieldDefs.AddFieldDef;
    myfield.Name := 'ZCODE';
    myfield.DataType := ftString;
    myfield.Size := 50;

    myField := cdsQuestionClass_bak.FieldDefs.AddFieldDef;
    myfield.Name := 'ZTITLE';
    myfield.DataType := ftString;
    myfield.Size := 100;
    cdsQuestionClass_bak.CreateDataSet;


    //能力等级
    mycds.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(gc_SQLTXT3));
    if cdsDeveLeve.Fields.Count = 0 then
    begin
      if cdsDeveLeve.Active then
        cdsDeveLeve.Close;
      cdsDeveLeve.FieldDefs.Clear;
      cdsDeveLeve.FieldDefs.Assign(mycds.FieldDefs);
      with cdsDeveLeve.FieldDefs do
      begin
        myField := AddFieldDef;
        myField.Name := 'ZAUTOID';   //是否是新增
        myField.DataType := ftInteger;

        myField := AddFieldDef;
        myField.Name := 'ZISNEW';   //是否是新增
        myField.DataType := ftBoolean;

        myField := AddFieldDef;
        myField.Name := 'ZINDEX';
        myField.DataType := ftString;
      end;

      for i:=0 to cdsDeveLeve.FieldDefs.Count -1 do
      begin
        cdsDeveLeve.FieldDefs[i].CreateField(cdsDeveLeve).Alignment := taLeftJustify;
      end;


      //定名称
      //ZQUCLASS_CODE_1
      for i:=1 to 10 do
      begin
        //由谁创建
        with cdsDeveLeve do
        begin
          myfield := FieldDefs.AddFieldDef;
          myfield.Name := Format('ZQUCLASS_CODE_NAME_%d',[i]);
          myfield.DataType := ftString;
          myfield.Size := 50;
          with myfield.CreateField(cdsDeveLeve) do
          begin
            FieldKind := fkLookup;
            KeyFields := Format('ZQUCLASS_CODE_%d',[i]);
            LookupDataSet := cdsQuestionClass_bak;
            LookupKeyFields := 'ZCODE';
            LookupResultField := 'ZTITLE';
          end;
        end;
      end;


      cdsDeveLeve.CreateDataSet;

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
  myPageType : PPageTypeRec;
const
  glSQL1 = 'select * from TB_QUESTION_CLASS order by ZSORT ';
begin
  inherited;

  ClearPageTypeList();

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

    while not mycds.Eof do
    begin
      Inc(c);
      New(myPageType);
      fPageTypeList.Add(myPageType);
      myPageType^.fClassCode := mycds.fieldByName('ZCODE').AsString;
      myPageType^.fIndex     := 1;
      myPageType^.fIndexCount := 1;
      myPageType^.fWhereStr  := Format('ZCLASS_GUID=''''%s''''',[mycds.FieldByName('ZGUID').AsString]);

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
var
  mysql : string;
  mycount : Integer;
const
  gc_SQLTXT2 = 'select isnull(count(ZQCODE),0) from TB_QUESTION';
begin
  LoadQustionClass();
  mycount := ClientSystem.fDbOpr.ReadInt(PChar(gc_SQLTXT2));
  lblQuestionCount.Caption := Format('总题目数:%d',[mycount]);
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
var
  myb : Boolean;
begin
  if fLoading then Exit;
  //权限
  if not HasModuleActionByShow(1,0,atInsert) then
  begin
    myb := fLoading;
    fLoading := True;
    chkEditor.Checked := False;
    fLoading := myb;
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
  mycds : TClientDataSet;
begin
  if fLoading then Exit;
  if pgcQuestion.ActivePageIndex = 1 then
  begin
    fCurPageType := PageType[cdsQuestionClass.FieldByName('ZCODE').AsString];
    fCurPageType.fIndexCount := GetQuestionCount(fCurPageType.fWhereStr);
    LoadQuestionList(fCurPageType.fIndex,fCurPageType.fWhereStr);
  end;

  if (pgcQuestion.ActivePageIndex = 2)  then
  begin
    mycds := TClientDataSet.Create(nil);
    try
    //cdsQuestionClass_bak
      while cdsQuestionClass_bak.RecordCount > 0 do
        cdsQuestionClass_bak.Delete;

      mycds.CloneCursor(cdsQuestionClass,False,False);
      mycds.First;
      while not mycds.Eof do
      begin
        cdsQuestionClass_bak.Append;
        cdsQuestionClass_bak.FieldByName('ZCODE').AsString := mycds.FieldByName('ZCODE').AsString;
        cdsQuestionClass_bak.FieldByName('ZTITLE').AsString := mycds.FieldByName('ZCODE').AsString + ' ' +
          mycds.FieldByName('ZTITLE').AsString;
        cdsQuestionClass_bak.Post;

        mycds.Next;
      end;

    finally
      mycds.Free;
    end;
    if (cdsDeveLeve.RecordCount =0) then
      LoadDeveLeve();
  end;

end;

function TQuestionManageClientDlg.GetPageType(ACode: string): PPageTypeRec;
var
  i : Integer;
  myPageIndex : PPageTypeRec;
begin
  Result := nil;
  for i := 0 to fPageTypeList.Count -1 do
  begin
    myPageIndex := fPageTypeList.Items[i];
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
  myPageIndex : PPageTypeRec;
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
  gl_SQLTXT = 'select isnull(max(ZIDX)+1,1) from TB_QUESTION where ZQCODE like ''%%%s-%%'' ';
  gl_SQLTXT2 = 'insert into TB_QUESTION(ZCLASS_GUID,ZQCODE,ZQTITLE,ZQCENTENT,ZANSWER,'+
               ' ZUSER_ID,ZDATETIME,ZIDX) values(''%s'',''%s'',''%s'',''%s'',''%s'',%d,''%s'',%d) ';

  gl_SQLTXT3 = 'update TB_QUESTION set ZQTITLE=''%s'',ZQCENTENT=''%s'',ZANSWER=''%s'',ZSTOP=%d ' +
               ' where ZCLASS_GUID=''%s'' and ZQCODE=''%s''';
begin
  //

  if cdsQuestion.FieldByName('ZISNEW').AsBoolean then
  begin
    myIdx := ClientSystem.fDbOpr.ReadInt(PChar(Format(gl_SQLTXT,[cdsQuestionClass.FieldByName('ZCODE').AsString])));
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
var
  myb : Boolean;
begin
  if fLoading then Exit;

   //权限
  if  not HasModuleActionByShow(1,0,atInsert) then
  begin
    myb := fLoading;
    fLoading := True;
    chkEditQustion.Checked := False;
    fLoading := myb;
    Exit;
  end;


  dbedtZQTITLE.ReadOnly := not chkEditQustion.Checked;
  dbmmoZQCENTENT.ReadOnly := not chkEditQustion.Checked;
  dbmmoZANSWER.ReadOnly := not chkEditQustion.Checked;
  dbchkZSORT.ReadOnly := not chkEditQustion.Checked;
end;

procedure TQuestionManageClientDlg.LoadDeveLeve;
var
  mycds : TClientDataSet;
  myfield : TFieldDef;
  mywhere : string;
  i,c : Integer;
  myb : Boolean;
const
  glSQL1 = 'select * from TB_QUESTION_DEVELEVEL order by ZSORT ';
begin
  inherited;


  mycds := TClientDataSet.Create(nil);
  myb := fLoading;
  fLoading := True;
  try
    mycds.data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL1));

    cdsDeveLeve.First;
    while not cdsDeveLeve.Eof do
      cdsDeveLeve.Delete;

    //写入数据
    mycds.First;
    c := 0;


    while not mycds.Eof do
    begin
      Inc(c);

      cdsDeveLeve.Append;
      for i:=0 to mycds.Fields.Count -1 do
      begin
        if mycds.Fields[i].FieldName = 'ZID' then
        begin
          cdsDeveLeve.FieldByName('ZAUTOID').AsInteger :=
            mycds.fieldByName('ZID').AsInteger;
        end
        else begin
          cdsDeveLeve.FieldByName(mycds.Fields[i].FieldName).AsVariant :=
            mycds.fieldByName(mycds.Fields[i].FieldName).AsVariant;
        end;

      end;
      cdsDeveLeve.FieldByName('ZINDEX').AsString  := IntToStr(c);
      cdsDeveLeve.FieldByName('ZISNEW').AsBoolean := False;

      cdsDeveLeve.Post;
      mycds.Next;
    end;

    cdsDeveLeve.First;

  finally
    mycds.Free;
    fLoading := myb;
  end;
end;

procedure TQuestionManageClientDlg.ClearPageTypeList;
var
  i : Integer;
  myPageType : PPageTypeRec;
begin
  for i:=0 to fPageTypeList.Count -1 do
  begin
    myPageType := fPageTypeList.Items[i];
    Dispose(myPageType);
  end;
  fPageTypeList.Clear;
end;

procedure TQuestionManageClientDlg.act_DeveLeve_AddUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsDeveLeve.Active and
  (cdsDeveLeve.State in [dsBrowse]) and chkEditDeveLeve.Checked;
end;

procedure TQuestionManageClientDlg.act_DeveLeve_AddExecute(
  Sender: TObject);
begin
  cdsDeveLeve.Append;
end;

procedure TQuestionManageClientDlg.act_DeveLeve_SaveExecute(
  Sender: TObject);
var
  mySQL : string;
const
  gl_SQLTXT = 'insert into TB_QUESTION_DEVELEVEL (ZDEVENAME,ZSORT, ' +
    ' ZQUCLASS_CODE_1, ZQUCLASS_NUM_1, ZQUCLASS_SCORE_1, ' +
    ' ZQUCLASS_CODE_2, ZQUCLASS_NUM_2, ZQUCLASS_SCORE_2, ' +
    ' ZQUCLASS_CODE_3, ZQUCLASS_NUM_3, ZQUCLASS_SCORE_3, ' +
    ' ZQUCLASS_CODE_4, ZQUCLASS_NUM_4, ZQUCLASS_SCORE_4, ' +
    ' ZQUCLASS_CODE_5, ZQUCLASS_NUM_5, ZQUCLASS_SCORE_5, ' +
    ' ZQUCLASS_CODE_6, ZQUCLASS_NUM_6, ZQUCLASS_SCORE_6, ' +
    ' ZQUCLASS_CODE_7, ZQUCLASS_NUM_7, ZQUCLASS_SCORE_7, ' +
    ' ZQUCLASS_CODE_8, ZQUCLASS_NUM_8, ZQUCLASS_SCORE_8, ' +
    ' ZQUCLASS_CODE_9, ZQUCLASS_NUM_9, ZQUCLASS_SCORE_9, ' +
    ' ZQUCLASS_CODE_10,ZQUCLASS_NUM_10,ZQUCLASS_SCORE_10' +
    ' ) Values(''%s'',%d , ' +

    ' ''%s'', %d,%g, ' +  //1
    ' ''%s'', %d,%g, ' +  //2
    ' ''%s'', %d,%g, ' +  //3
    ' ''%s'', %d,%g, ' +  //4
    ' ''%s'', %d,%g, ' +  //5
    ' ''%s'', %d,%g, ' +  //6
    ' ''%s'', %d,%g, ' +  //7
    ' ''%s'', %d,%g, ' +  //8
    ' ''%s'', %d,%g, ' +  //9
    ' ''%s'', %d,%g  ' +  //10
    ' )';
  gl_SQLTXT2 =  'update TB_QUESTION_DEVELEVEL set ZDEVENAME=''%s'', ZSORT=%d, ' +
    'ZQUCLASS_CODE_1=''%s'', ZQUCLASS_NUM_1=%d, ZQUCLASS_SCORE_1=%g , '  +
    'ZQUCLASS_CODE_2=''%s'', ZQUCLASS_NUM_2=%d, ZQUCLASS_SCORE_2=%g , '  +
    'ZQUCLASS_CODE_3=''%s'', ZQUCLASS_NUM_3=%d, ZQUCLASS_SCORE_3=%g , '  +
    'ZQUCLASS_CODE_4=''%s'', ZQUCLASS_NUM_4=%d, ZQUCLASS_SCORE_4=%g , '  +
    'ZQUCLASS_CODE_5=''%s'', ZQUCLASS_NUM_5=%d, ZQUCLASS_SCORE_5=%g , '  +
    'ZQUCLASS_CODE_6=''%s'', ZQUCLASS_NUM_6=%d, ZQUCLASS_SCORE_6=%g , '  +
    'ZQUCLASS_CODE_7=''%s'', ZQUCLASS_NUM_7=%d, ZQUCLASS_SCORE_7=%g , '  +
    'ZQUCLASS_CODE_8=''%s'', ZQUCLASS_NUM_8=%d, ZQUCLASS_SCORE_8=%g , '  +
    'ZQUCLASS_CODE_9=''%s'', ZQUCLASS_NUM_9=%d, ZQUCLASS_SCORE_9=%g , '  +
    'ZQUCLASS_CODE_10=''%s'', ZQUCLASS_NUM_10=%d, ZQUCLASS_SCORE_10=%g  ' +
    'where ZID=%d';

  gl_SQLTXT3 = 'select ZID from TB_QUESTION_DEVELEVEL where ZDEVENAME=''%s'' and ZSORT=%d ';

begin
  //新增
  if cdsDeveLeve.FieldByName('ZISNEW').AsBoolean then
  begin
    mySQL := Format(gl_SQLTXT,[
      cdsDeveLeve.FieldByName('ZDEVENAME').AsString,
      cdsDeveLeve.FieldByName('ZSORT').AsInteger,
      cdsDeveLeve.FieldByName('ZQUCLASS_CODE_1').AsString,cdsDeveLeve.FieldByName('ZQUCLASS_NUM_1').AsInteger,cdsDeveLeve.FieldByName('ZQUCLASS_SCORE_1').AsFloat,
      cdsDeveLeve.FieldByName('ZQUCLASS_CODE_2').AsString,cdsDeveLeve.FieldByName('ZQUCLASS_NUM_2').AsInteger,cdsDeveLeve.FieldByName('ZQUCLASS_SCORE_2').AsFloat,
      cdsDeveLeve.FieldByName('ZQUCLASS_CODE_3').AsString,cdsDeveLeve.FieldByName('ZQUCLASS_NUM_3').AsInteger,cdsDeveLeve.FieldByName('ZQUCLASS_SCORE_3').AsFloat,
      cdsDeveLeve.FieldByName('ZQUCLASS_CODE_4').AsString,cdsDeveLeve.FieldByName('ZQUCLASS_NUM_4').AsInteger,cdsDeveLeve.FieldByName('ZQUCLASS_SCORE_4').AsFloat,
      cdsDeveLeve.FieldByName('ZQUCLASS_CODE_5').AsString,cdsDeveLeve.FieldByName('ZQUCLASS_NUM_5').AsInteger,cdsDeveLeve.FieldByName('ZQUCLASS_SCORE_5').AsFloat,
      cdsDeveLeve.FieldByName('ZQUCLASS_CODE_6').AsString,cdsDeveLeve.FieldByName('ZQUCLASS_NUM_6').AsInteger,cdsDeveLeve.FieldByName('ZQUCLASS_SCORE_6').AsFloat,
      cdsDeveLeve.FieldByName('ZQUCLASS_CODE_7').AsString,cdsDeveLeve.FieldByName('ZQUCLASS_NUM_7').AsInteger,cdsDeveLeve.FieldByName('ZQUCLASS_SCORE_7').AsFloat,
      cdsDeveLeve.FieldByName('ZQUCLASS_CODE_8').AsString,cdsDeveLeve.FieldByName('ZQUCLASS_NUM_8').AsInteger,cdsDeveLeve.FieldByName('ZQUCLASS_SCORE_8').AsFloat,
      cdsDeveLeve.FieldByName('ZQUCLASS_CODE_9').AsString,cdsDeveLeve.FieldByName('ZQUCLASS_NUM_9').AsInteger,cdsDeveLeve.FieldByName('ZQUCLASS_SCORE_9').AsFloat,
      cdsDeveLeve.FieldByName('ZQUCLASS_CODE_10').AsString,cdsDeveLeve.FieldByName('ZQUCLASS_NUM_10').AsInteger,cdsDeveLeve.FieldByName('ZQUCLASS_SCORE_10').AsFloat
    ]);
  end
  //修改
  else begin
    mySQL := Format(gl_SQLTXT2,[
      cdsDeveLeve.FieldByName('ZDEVENAME').AsString,
      cdsDeveLeve.FieldByName('ZSORT').AsInteger,
      cdsDeveLeve.FieldByName('ZQUCLASS_CODE_1').AsString,cdsDeveLeve.FieldByName('ZQUCLASS_NUM_1').AsInteger,cdsDeveLeve.FieldByName('ZQUCLASS_SCORE_1').AsFloat,
      cdsDeveLeve.FieldByName('ZQUCLASS_CODE_2').AsString,cdsDeveLeve.FieldByName('ZQUCLASS_NUM_2').AsInteger,cdsDeveLeve.FieldByName('ZQUCLASS_SCORE_2').AsFloat,
      cdsDeveLeve.FieldByName('ZQUCLASS_CODE_3').AsString,cdsDeveLeve.FieldByName('ZQUCLASS_NUM_3').AsInteger,cdsDeveLeve.FieldByName('ZQUCLASS_SCORE_3').AsFloat,
      cdsDeveLeve.FieldByName('ZQUCLASS_CODE_4').AsString,cdsDeveLeve.FieldByName('ZQUCLASS_NUM_4').AsInteger,cdsDeveLeve.FieldByName('ZQUCLASS_SCORE_4').AsFloat,
      cdsDeveLeve.FieldByName('ZQUCLASS_CODE_5').AsString,cdsDeveLeve.FieldByName('ZQUCLASS_NUM_5').AsInteger,cdsDeveLeve.FieldByName('ZQUCLASS_SCORE_5').AsFloat,
      cdsDeveLeve.FieldByName('ZQUCLASS_CODE_6').AsString,cdsDeveLeve.FieldByName('ZQUCLASS_NUM_6').AsInteger,cdsDeveLeve.FieldByName('ZQUCLASS_SCORE_6').AsFloat,
      cdsDeveLeve.FieldByName('ZQUCLASS_CODE_7').AsString,cdsDeveLeve.FieldByName('ZQUCLASS_NUM_7').AsInteger,cdsDeveLeve.FieldByName('ZQUCLASS_SCORE_7').AsFloat,
      cdsDeveLeve.FieldByName('ZQUCLASS_CODE_8').AsString,cdsDeveLeve.FieldByName('ZQUCLASS_NUM_8').AsInteger,cdsDeveLeve.FieldByName('ZQUCLASS_SCORE_8').AsFloat,
      cdsDeveLeve.FieldByName('ZQUCLASS_CODE_9').AsString,cdsDeveLeve.FieldByName('ZQUCLASS_NUM_9').AsInteger,cdsDeveLeve.FieldByName('ZQUCLASS_SCORE_9').AsFloat,
      cdsDeveLeve.FieldByName('ZQUCLASS_CODE_10').AsString,cdsDeveLeve.FieldByName('ZQUCLASS_NUM_10').AsInteger,cdsDeveLeve.FieldByName('ZQUCLASS_SCORE_10').AsFloat,
      cdsDeveLeve.FieldByName('ZAUTOID').AsInteger
    ]);

  end;

  if ClientSystem.fDbOpr.ExeSQL(PChar(mySQL)) then
  begin
    //取出主键，否则再修改无法保存
    if cdsDeveLeve.FieldByName('ZISNEW').AsBoolean then
    begin
      mySQL := Format(gl_SQLTXT3,[cdsDeveLeve.FieldByName('ZDEVENAME').AsString,
      cdsDeveLeve.FieldByName('ZSORT').AsInteger]);
      cdsDeveLeve.FieldByName('ZAUTOID').AsInteger := ClientSystem.fDbOpr.ReadInt(PChar(mySQL));
    end;
    cdsDeveLeve.FieldByName('ZISNEW').AsBoolean := False;
    cdsDeveLeve.Post;
  end;

end;

procedure TQuestionManageClientDlg.cdsDeveLeveNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
end;

procedure TQuestionManageClientDlg.act_DeveLeve_SaveUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsDeveLeve.Active and
  (cdsDeveLeve.State in [dsEdit,dsInsert]) and
  chkEditDeveLeve.Checked;
end;

procedure TQuestionManageClientDlg.act_DeveLeve_CancelUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsDeveLeve.Active and
  (cdsDeveLeve.State in [dsEdit,dsInsert]) and
  chkEditDeveLeve.Checked;
end;

procedure TQuestionManageClientDlg.act_DeveLeve_CancelExecute(
  Sender: TObject);
begin
  cdsDeveLeve.Cancel;
end;

procedure TQuestionManageClientDlg.dbgrdLeveDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (cdsDeveLeve.RecNo mod 2  = 0) and not ( gdSelected in State)  then
    dbgrdLeve.Canvas.Brush.Color := clSilver;
  dbgrdLeve.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TQuestionManageClientDlg.act_DeveLeve_ReLoadExecute(
  Sender: TObject);
begin
  LoadDeveLeve;
end;

procedure TQuestionManageClientDlg.act_DeveLeve_ReLoadUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsDeveLeve.Active and
  (cdsDeveLeve.State = dsBrowse);

end;

procedure TQuestionManageClientDlg.chkEditDeveLeveClick(Sender: TObject);
var
  myb : Boolean;
begin
  if fLoading then Exit;
   //权限
  if  not HasModuleActionByShow(1,0,atInsert) then
  begin

    myb := fLoading;
    fLoading := True;
    chkEditDeveLeve.Checked := False;
    fLoading := myb;
    Exit;
  end;


  dbedtZDEVENAME.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZSORT.ReadOnly := not chkEditDeveLeve.Checked;


  dblkcbbZQUCLASS_CODE_NAME_1.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZQUCLASS_NUM_1.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZQUCLASS_SCORE_1.ReadOnly := not chkEditDeveLeve.Checked;

  dblkcbbZQUCLASS_CODE_NAME_2.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZQUCLASS_NUM_2.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZQUCLASS_SCORE_2.ReadOnly := not chkEditDeveLeve.Checked;

  dblkcbbZQUCLASS_CODE_NAME_3.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZQUCLASS_NUM_3.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZQUCLASS_SCORE_3.ReadOnly := not chkEditDeveLeve.Checked;

  dblkcbbZQUCLASS_CODE_NAME_4.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZQUCLASS_NUM_4.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZQUCLASS_SCORE_4.ReadOnly := not chkEditDeveLeve.Checked;

  dblkcbbZQUCLASS_CODE_NAME_5.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZQUCLASS_NUM_5.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZQUCLASS_SCORE_5.ReadOnly := not chkEditDeveLeve.Checked;

  dblkcbbZQUCLASS_CODE_NAME_6.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZQUCLASS_NUM_6.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZQUCLASS_SCORE_6.ReadOnly := not chkEditDeveLeve.Checked;

  dblkcbbZQUCLASS_CODE_NAME_7.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZQUCLASS_NUM_7.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZQUCLASS_SCORE_7.ReadOnly := not chkEditDeveLeve.Checked;

  dblkcbbZQUCLASS_CODE_NAME_8.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZQUCLASS_NUM_8.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZQUCLASS_SCORE_8.ReadOnly := not chkEditDeveLeve.Checked;

  dblkcbbZQUCLASS_CODE_NAME_9.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZQUCLASS_NUM_9.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZQUCLASS_SCORE_9.ReadOnly := not chkEditDeveLeve.Checked;

  dblkcbbZQUCLASS_CODE_NAME_10.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZQUCLASS_NUM_10.ReadOnly := not chkEditDeveLeve.Checked;
  dbedtZQUCLASS_SCORE_10.ReadOnly := not chkEditDeveLeve.Checked;


end;

procedure TQuestionManageClientDlg.act_DeveLeve_BuildExecute(
  Sender: TObject);
var
  myfilename : string;
  myfilename2 : string;
  i,j,myc,mya : Integer;
  mycount : Integer;
  myCode : string;
  mycds : TClientDataSet;
  mysql : string;
  mysl  : TStringList;  //已取出来的编号
  myslQuistion : TStringList;
  myslAnswer : TStringList;
  myUserName : string;
  myindex : Integer;
const
  gl_SQLTXT = 'select count(*) from TB_QUESTION where ZQCODE Like ''%%%s-%%'' ';
  gc_SQLTXT2 = 'select * from TB_QUESTION where (ZQCODE Like ''%%%s-%%'') and (ZSTOP=0)';
begin
  //生成试题
  dlgSave1.FileName := cdsDeveLeve.FieldByName('ZDEVENAME').AsString;
  if not dlgSave1.Execute then
    Exit;

  myfilename := dlgSave1.FileName;
  myfilename2 := ChangeFileExt(myfilename,'.答案.txt');

  ShowProgress('生成试题',10);

  mysl  := TStringList.Create;  //已取出来的编号
  myslQuistion := TStringList.Create;
  myslAnswer := TStringList.Create;

  mycds := TClientDataSet.Create(nil);

  myindex := 1;

  Randomize;
  try
    for i:=1 to  10 do
    begin
      UpdateProgress(i);
      myCode := cdsDeveLeve.FieldByName(format('ZQUCLASS_CODE_%d',[i])).AsString;

      mysql := Format(gl_SQLTXT,[myCode]);
      mycount := ClientSystem.fDbOpr.ReadInt(PChar(mysql));
      mysql := Format(gc_SQLTXT2,[myCode]);


      for j:=0 to cdsDeveLeve.FieldByName(format('ZQUCLASS_NUM_%d',[i])).AsInteger -1 do
      begin
        //随机取文件
        myc := Random(mycount);
        while (mysl.IndexOf(IntToStr(myc)) >=0) and (mysl.Count<mycount) do
        begin
          myc := Random(mycount);
        end;


        mycds.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mysql));
        mycds.First;
        mya := 0;
        while not mycds.Eof do
        begin
          if mya = myc then
          begin
            myslQuistion.Add('=========================================================');
            myslQuistion.Add(IntToStr(myindex) +'、' +  mycds.FieldByName('ZQTITLE').AsString +

               format('(%g分)',[cdsDeveLeve.FieldByName(format('ZQUCLASS_SCORE_%d',[i])).AsFloat]) +  #13#10 +
               mycds.fieldByName('ZQCENTENT').AsString);

            DM.cdsUserAll.First;
            while not DM.cdsUserAll.Eof do
            begin
              if DM.cdsUserAll.FieldByName('ZID').AsInteger = mycds.FieldByName('ZUSER_ID').AsInteger then
              begin
                myUserName :=  DM.cdsUserAll.FieldByName('ZNAME').AsString;
                Break;
              end;
              DM.cdsUserAll.Next;
            end;
            myslAnswer.Add('=========================================================');
            myslAnswer.Add(IntToStr(myindex) +'、' + '作者:'+ myUserName +  #13#10 + mycds.FieldByName('ZANSWER').AsString);
            inc(myindex);
            mysl.Add(IntToStr(myc)); //记下编号
            Break;
          end;
          inc(mya);
          mycds.Next;
        end;

        if mysl.Count = mycount then
        begin
          ShowMessage('############试题不够了########');
          Exit;
        end;

      end;
    end;

    //写入到本地
    myslQuistion.SaveToFile(myfilename);
    myslAnswer.SaveToFile(myfilename2);
    HideProgress;
    ShowMessage('生成文件，会生成两个文件一个是试题，一个答案的txt文件');
  finally
    mycds.Free;
    HideProgress;

    mysl.Free;
    myslQuistion.Free;
    myslAnswer.Free;
  end;

end;

end.
