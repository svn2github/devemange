unit WarnBuckleScoreClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseChildfrm, ComCtrls, ExtCtrls, Grids, DBGrids, DB, DBClient,
  StdCtrls, DBCtrls, Buttons, ActnList, Mask;

type

  TPageTypeRec = record
    fIndex : Integer;
    fIndexCount : Integer;
    fWhereStr : string; //分页的where条件
  end;

  TWarnBuckleScoreClientDlg = class(TBaseChildDlg)
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    pnl1: TPanel;
    dbgrdResult: TDBGrid;
    dsType: TDataSource;
    cdsTYPE: TClientDataSet;
    intgrfldcds1ZID: TIntegerField;
    strngfldcds1ZNAME: TStringField;
    dsToDayResult: TDataSource;
    cdsToDayResult: TClientDataSet;
    pnlnovisible: TPanel;
    dsUser: TDataSource;
    cdsUser: TClientDataSet;
    pnl2: TPanel;
    lblPageCount: TLabel;
    ds1: TDataSource;
    cds1: TClientDataSet;
    intgrfld1: TIntegerField;
    strngfld1: TStringField;
    dbmmoZNOTETEXT: TDBMemo;
    btnBtnFirstPage: TBitBtn;
    btnBtnProPage: TBitBtn;
    btnBtnNextPage: TBitBtn;
    btnBtnLastPage: TBitBtn;
    btnBtnRefreshData: TBitBtn;
    actlst1: TActionList;
    act_page_first: TAction;
    act_page_Provi: TAction;
    act_page_next: TAction;
    act_page_Last: TAction;
    act_page_reload: TAction;
    btnWarn_new: TBitBtn;
    act_Warn_new: TAction;
    lbl2: TLabel;
    dbedtZCONTENTID: TDBEdit;
    lbl3: TLabel;
    dbedtZCONTENT: TDBEdit;
    lbl4: TLabel;
    dblkcbbZUSER_NAME: TDBLookupComboBox;
    lbl5: TLabel;
    dbedtZDATETIME: TDBEdit;
    dtp2: TDateTimePicker;
    lbl9: TLabel;
    dbmmoZNOTE: TDBMemo;
    lbl6: TLabel;
    lbl7: TLabel;
    dblkcbbZTYPENAME: TDBLookupComboBox;
    lbl8: TLabel;
    dblkcbbZWRITERNAME: TDBLookupComboBox;
    btnBtnNextRow: TBitBtn;
    btnBtnProRow: TBitBtn;
    btnBtnCancel: TBitBtn;
    btnBtnSave: TBitBtn;
    act_Warn_Save: TAction;
    act_Warn_clane: TAction;
    act_warn_proiv: TAction;
    act_warn_next: TAction;
    act_warn_excel: TAction;
    btnwarn_excel: TBitBtn;
    lbl1: TLabel;
    dbedtZSCORE: TDBEdit;
    act_warn_del: TAction;
    btnwarn_del: TBitBtn;
    btnwarn_writeme: TBitBtn;
    btnwaren_tome: TBitBtn;
    act_warn_writeme: TAction;
    act_waren_tome: TAction;
    btnwarn_score: TBitBtn;
    act_warn_score: TAction;
    act_page_Alldata: TAction;
    btnpage_reload: TBitBtn;
    edtendpage: TEdit;
    procedure cdsToDayResultCalcFields(DataSet: TDataSet);
    procedure dbgrdResultDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure act_page_firstExecute(Sender: TObject);
    procedure act_page_firstUpdate(Sender: TObject);
    procedure act_page_ProviUpdate(Sender: TObject);
    procedure act_page_ProviExecute(Sender: TObject);
    procedure act_page_nextUpdate(Sender: TObject);
    procedure act_page_nextExecute(Sender: TObject);
    procedure act_page_LastUpdate(Sender: TObject);
    procedure act_page_LastExecute(Sender: TObject);
    procedure act_Warn_SaveUpdate(Sender: TObject);
    procedure act_Warn_SaveExecute(Sender: TObject);
    procedure act_Warn_claneUpdate(Sender: TObject);
    procedure act_Warn_claneExecute(Sender: TObject);
    procedure act_warn_proivExecute(Sender: TObject);
    procedure act_warn_nextExecute(Sender: TObject);
    procedure act_warn_nextUpdate(Sender: TObject);
    procedure act_warn_proivUpdate(Sender: TObject);
    procedure dtp2Change(Sender: TObject);
    procedure act_warn_excelExecute(Sender: TObject);
    procedure act_Warn_newExecute(Sender: TObject);
    procedure cdsToDayResultNewRecord(DataSet: TDataSet);
    procedure cdsToDayResultBeforePost(DataSet: TDataSet);
    procedure pgc1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure act_page_reloadExecute(Sender: TObject);
    procedure act_warn_delUpdate(Sender: TObject);
    procedure act_warn_delExecute(Sender: TObject);
    procedure act_warn_writemeExecute(Sender: TObject);
    procedure act_waren_tomeExecute(Sender: TObject);
    procedure act_warn_scoreExecute(Sender: TObject);
    procedure act_warn_scoreUpdate(Sender: TObject);
    procedure act_page_AlldataExecute(Sender: TObject);
  private
    { Private declarations }
    fLoading : Boolean;
    fPageType : TPageTypeRec;

  public
    { Public declarations }
    procedure initBase; override;
    procedure freeBase; override;
    procedure Showfrm ; override;  //显示后发生的事件
    procedure Closefrm; override;  //关闭显示发生的事件

    function  GetPageCount(AWhereStr:String):integer; //取出页总数
    procedure LoadToDayResult(APageIndex:integer;AWhereStr:String);

  end;


implementation

uses DmUints,ClinetSystemUnits,ComObj;

{$R *.dfm}

{ TWarnBuckleScoreClientDlg }

procedure TWarnBuckleScoreClientDlg.Closefrm;
begin
  inherited;
  
end;

procedure TWarnBuckleScoreClientDlg.freeBase;
begin
  inherited;

end;

function TWarnBuckleScoreClientDlg.GetPageCount(
  AWhereStr: String): integer;
var
  mySQL  : string;
  myRowCount : integer;
  mywhere : string;
const
  glSQL = 'exec pt_SplitPage ''TB_TODAYRESULT'',''' +
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


procedure TWarnBuckleScoreClientDlg.initBase;
begin
  inherited;

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


  dtp2.DateTime := Now;

  fPageType.fIndex := 1;
  fPageType.fWhereStr := '1=1';
  fPageType.fIndexCount := GetPageCount(fPageType.fWhereStr);
  LoadToDayResult(fPageType.fIndex,fPageType.fWhereStr);
  lblPageCount.Caption := format('%d/%d',[1,
      fPageType.fIndexCount]);
      
end;

procedure TWarnBuckleScoreClientDlg.LoadToDayResult(APageIndex: integer;
  AWhereStr:String);
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
          'ZWRITER,ZACTION,ZSCORE'',' +
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
        myField.Size := 500;
        with myfield.CreateField(cdsToDayResult) do
        begin
          FieldKind := fkCalculated;
        end;

        myField := cdsToDayResult.FieldDefs.AddFieldDef ;
        myField.Name := 'ZNOTE2';
        myField.DataType := ftString;
        myField.Size := 500;
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


procedure TWarnBuckleScoreClientDlg.Showfrm;
begin
  inherited;

end;

procedure TWarnBuckleScoreClientDlg.cdsToDayResultCalcFields(
  DataSet: TDataSet);
begin
  
  DataSet.FieldByName('ZNOTETEXT').AsString := '【标题】:' + DataSet.fieldByName('ZCONTENT').AsString + #13#10 +
   '【扣分理由】:' + DataSet.fieldByName('ZNOTE').AsString;
  DataSet.FieldByName('ZNOTE2').AsString := DataSet.fieldByName('ZNOTE').AsString;
end;

procedure TWarnBuckleScoreClientDlg.dbgrdResultDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if (cdsToDayResult.RecNo mod 2  = 0) and not ( gdSelected in State)  then
    dbgrdResult.Canvas.Brush.Color := clSilver;

  if (cdsToDayResult.FieldByName('ZACTION').AsInteger=0) then
  begin
    //dbgrdResult.Canvas.Font.Color := clred;
  end;
  dbgrdResult.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TWarnBuckleScoreClientDlg.act_page_firstExecute(Sender: TObject);
begin
  fPageType.fIndex := 1;
  LoadToDayResult(fPageType.fIndex,fPageType.fWhereStr);
  lblPageCount.Caption := format('%d/%d',[1,fPageType.fIndexCount]);
end;

procedure TWarnBuckleScoreClientDlg.act_page_firstUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := fPageType.fIndex <>1;
end;

procedure TWarnBuckleScoreClientDlg.act_page_ProviUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := fPageType.fIndex >1;
end;

procedure TWarnBuckleScoreClientDlg.act_page_ProviExecute(Sender: TObject);
begin
  fPageType.fIndex := fPageType.fIndex -1;
  LoadToDayResult(fPageType.fIndex,fPageType.fWhereStr);
  lblPageCount.Caption := format('%d/%d',[fPageType.fIndex,fPageType.fIndexCount]);
end;

procedure TWarnBuckleScoreClientDlg.act_page_nextUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := fPageType.fIndex < fPageType.fIndexCount;
end;

procedure TWarnBuckleScoreClientDlg.act_page_nextExecute(Sender: TObject);
begin
  fPageType.fIndex := fPageType.fIndex +1;
  LoadToDayResult(fPageType.fIndex,fPageType.fWhereStr);
  lblPageCount.Caption := format('%d/%d',[fPageType.fIndex,fPageType.fIndexCount]);
end;

procedure TWarnBuckleScoreClientDlg.act_page_LastUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := fPageType.fIndex <> fPageType.fIndexCount;
end;

procedure TWarnBuckleScoreClientDlg.act_page_LastExecute(Sender: TObject);
begin
  fPageType.fIndex := fPageType.fIndexCount;
  LoadToDayResult(fPageType.fIndex,fPageType.fWhereStr);
  lblPageCount.Caption := format('%d/%d',[fPageType.fIndex,fPageType.fIndexCount]);
end;

procedure TWarnBuckleScoreClientDlg.act_Warn_SaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsToDayResult.State in [ dsEdit, dsInsert];
end;

procedure TWarnBuckleScoreClientDlg.act_Warn_SaveExecute(Sender: TObject);
begin
  cdsToDayResult.Post;
end;

procedure TWarnBuckleScoreClientDlg.act_Warn_claneUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsToDayResult.State in [ dsEdit, dsInsert];
end;

procedure TWarnBuckleScoreClientDlg.act_Warn_claneExecute(Sender: TObject);
begin
  cdsToDayResult.Cancel;
end;

procedure TWarnBuckleScoreClientDlg.act_warn_proivExecute(Sender: TObject);
begin
  cdsToDayResult.Prior;
end;

procedure TWarnBuckleScoreClientDlg.act_warn_nextExecute(Sender: TObject);
begin
  cdsToDayResult.Next;
end;

procedure TWarnBuckleScoreClientDlg.act_warn_nextUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not cdsToDayResult.Eof and
   (cdsToDayResult.State = dsBrowse) ;
end;

procedure TWarnBuckleScoreClientDlg.act_warn_proivUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not cdsToDayResult.Bof and
  (cdsToDayResult.State =dsBrowse);
end;

procedure TWarnBuckleScoreClientDlg.dtp2Change(Sender: TObject);
begin
  if fLoading then Exit;
  if cdsToDayResult.State in [dsEdit,dsInsert] then
    cdsToDayResult.FieldByName('ZDATETIME').AsDateTime := dtp2.DateTime;
end;

procedure TWarnBuckleScoreClientDlg.act_warn_excelExecute(Sender: TObject);
var
  Eclapp:variant;
  i,j,n,c:integer;
  myoldindex : Integer;
  myindex,myindexcount : Integer;
  mystr : string;
begin

  //生成Excel文件

  Eclapp := createoleobject('Excel.Application');
  Eclapp.workbooks.add;
  eclapp.visible := true;

  n := 1;
  eclapp.cells[n,1]   := '开发管理系统 ' + DateTimeToStr(Now()) ;

  n := n+2;
  Eclapp.cells[n,1] := '序号';
  for i:=0 to dbgrdResult.FieldCount-1 do
  begin
    Eclapp.cells[n,i+1+1]:=dbgrdResult.Columns[i].Title.Caption;
  end;

  cdsToDayResult.DisableControls;
  try
    c := 1;
    n:=n+1;
    myoldindex := fPageType.fIndex;
    for myindex := fPageType.fIndex to fPageType.fIndexCount do
    begin

      cdsToDayResult.First;

      while not cdsToDayResult.Eof do
      begin
        eclapp.cells[n,1] := inttostr(c); c:=c+1;
        for j :=0 to dbgrdResult.FieldCount -1 do
        begin
           eclapp.cells[n,2+j] := cdsToDayResult.FieldByName(
              dbgrdResult.Columns.Items[j].FieldName).AsString;
        end;
        inc(n);
        cdsToDayResult.Next;
      end;

      act_page_next.Execute;  //处理下一页

      if fPageType.fIndex > StrToIntDef(edtendpage.Text,fPageType.fIndexCount) then
        Break;

    end;
    fPageType.fIndex := myoldindex;
    cdsToDayResult.First;
  finally
    cdsToDayResult.EnableControls;
  end;

  eclapp.cells[n+1,1] := '记录的总数为：'+inttostr(c-1)+'条';

end;


procedure TWarnBuckleScoreClientDlg.act_Warn_newExecute(Sender: TObject);
begin
  //
  cdsToDayResult.Append;
  pgc1.ActivePageIndex := 1;
end;

procedure TWarnBuckleScoreClientDlg.cdsToDayResultNewRecord(
  DataSet: TDataSet);
begin
  if fLoading then Exit;
  
  DataSet.FieldByName('ZDATETIME').AsDateTime := ClientSystem.fDbOpr.GetSysDateTime;
  DataSet.FieldByName('ZWRITER').AsInteger := ClientSystem.fEditer_id;
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
end;

procedure TWarnBuckleScoreClientDlg.cdsToDayResultBeforePost(
  DataSet: TDataSet);
var
  mySQL : string;
const
  gl_SQLTXT = 'insert TB_TODAYRESULT (ZTYPE,ZUSER_ID,ZDATETIME,ZCONTENTID, ' +
    'ZCONTENT,ZNOTE,ZWRITER,ZACTION,ZSCORE) values(%d,%d,''%s'',%d,''%s'',''%s'',%d,%d,%f)';
  gl_SQLTXT2 = 'update TB_TODAYRESULT set ' +
               'ZTYPE=%d,     ' +
               'ZUSER_ID=%d, ' +
               'ZDATETIME=''%s'', '  +
               'ZCONTENTID=%d, '  +
               'ZCONTENT=''%s'' ,  '    +
               'ZNOTE=''%s'' , '     +
               'ZWRITER=%d, '     +
               'ZACTION=%d, ZSCORE=%f where ZID=%d ';
  gl_SQLTXT4 = 'select isNull(max(ZID),1) from TB_TODAYRESULT';
begin
  //
  if fLoading then Exit;

  if cdsToDayResult.FieldByName('ZNOTE').AsString = '' then
  begin
    MessageBox(Handle,'扣分理由不能为空','提示',MB_ICONWARNING+MB_OK);
      Exit;
  end;

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
      DataSet.FieldByName('ZACTION').AsInteger,
      DataSet.FieldByName('ZSCORE').AsFloat]);

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
      DataSet.FieldByName('ZSCORE').AsFloat,
      DataSet.FieldByName('ZMYID').AsInteger]);

      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
  end;
end;


procedure TWarnBuckleScoreClientDlg.pgc1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if (pgc1.ActivePageIndex = 1) then
  begin
    AllowChange :=  not (cdsToDayResult.State in [dsEdit, dsInsert]);
    if not AllowChange then
      MessageBox(Handle,'编辑状态中，不能切换','提示',MB_ICONWARNING+MB_OK);
  end;
end;

procedure TWarnBuckleScoreClientDlg.act_page_reloadExecute(
  Sender: TObject);
begin
  LoadToDayResult(fPageType.fIndex,fPageType.fWhereStr);
end;

procedure TWarnBuckleScoreClientDlg.act_warn_delUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsToDayResult.FieldByName('ZWRITER').AsInteger =
    ClientSystem.fEditer_id;
end;

procedure TWarnBuckleScoreClientDlg.act_warn_delExecute(Sender: TObject);
var
  mySQL : string;
const
  gl_SQL = 'delete from TB_TODAYRESULT where ZID=%d ';
begin
  //
  if Application.MessageBox('是否要删除','提示',MB_ICONQUESTION+MB_YESNO)=IDNO then
    Exit;

  mySQL := Format(gl_SQL,[
    cdsToDayResult.FieldByName('ZMYID').AsInteger]);
  if ClientSystem.fDbOpr.ExeSQL(PChar(mySQL)) then
    cdsToDayResult.Delete;
end;

procedure TWarnBuckleScoreClientDlg.act_warn_writemeExecute(
  Sender: TObject);
begin
  fPageType.fIndex := 1;
  fPageType.fWhereStr := 'ZWRITER=' + IntToStr(ClientSystem.fEditer_id);
  fPageType.fIndexCount := GetPageCount(fPageType.fWhereStr);
  LoadToDayResult(fPageType.fIndex,
    fPageType.fWhereStr);
  lblPageCount.Caption := format('%d/%d',[1,fPageType.fIndexCount]);
end;

procedure TWarnBuckleScoreClientDlg.act_waren_tomeExecute(Sender: TObject);
begin
  fPageType.fIndex := 1;
  fPageType.fWhereStr := 'ZUSER_ID=' + IntToStr(ClientSystem.fEditer_id);
  fPageType.fIndexCount := GetPageCount(fPageType.fWhereStr);
  LoadToDayResult(fPageType.fIndex,
    fPageType.fWhereStr);
  lblPageCount.Caption := format('%d/%d',[1,fPageType.fIndexCount]);
end;

procedure TWarnBuckleScoreClientDlg.act_warn_scoreExecute(Sender: TObject);
var
  myb : Boolean;
  mySQL : string;
const
  gl_SQL = 'update TB_TODAYRESULT set ZSCORE=%f where ZID=%d';
begin

  myb := fLoading;
  fLoading := True;
  try
    cdsToDayResult.Post;

    //将值写入库内
    mySQL := Format(gl_SQL,[
      cdsToDayResult.FieldByName('ZSCORE').AsFloat,
      cdsToDayResult.FieldByName('ZMYID').AsInteger
    ]);

    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));

  finally
    fLoading := myb;
  end;

end;

procedure TWarnBuckleScoreClientDlg.act_warn_scoreUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsToDayResult.State in [ dsEdit, dsInsert];
end;

procedure TWarnBuckleScoreClientDlg.act_page_AlldataExecute(
  Sender: TObject);
begin
  fPageType.fIndex := 1;
  fPageType.fWhereStr := '1=1';
  fPageType.fIndexCount := GetPageCount(fPageType.fWhereStr);
  LoadToDayResult(fPageType.fIndex,
    fPageType.fWhereStr);
  lblPageCount.Caption := format('%d/%d',[1,fPageType.fIndexCount]);
end;

end.
