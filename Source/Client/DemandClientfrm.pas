unit DemandClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseChildfrm, ComCtrls, ExtCtrls, Grids, DBGrids, DB, DBClient,
  ActnList, StdCtrls, Buttons, DBCtrls, Mask,ClientTypeUnits;

type

  TPageTypeRec = record
    fIndex : Integer;
    fIndexCount : Integer;
    fWhereStr : string; //分页的where条件
  end;

  TDemandColumn=(dec_ID,dec_Name,dec_User,dec_Builddate,
    dec_Pro,dec_CheckName,dec_Status);

  TDemandClientDlg = class(TBaseChildDlg)
    pgc1: TPageControl;
    pnlNoVisible: TPanel;
    ts1: TTabSheet;
    ts2: TTabSheet;
    pnlTool: TPanel;
    pnlBottom: TPanel;
    dbgrd1: TDBGrid;
    cdsDemandList: TClientDataSet;
    dsDemandList: TDataSource;
    actlst1: TActionList;
    cdsParams: TClientDataSet;
    lblPageCount: TLabel;
    cdsProject: TClientDataSet;
    act_FirstPage: TAction;
    act_PrivPage: TAction;
    act_NextPage: TAction;
    act_LastPage: TAction;
    act_RefreshData: TAction;
    btnFirstPage: TBitBtn;
    btnPrivPage: TBitBtn;
    btnNextPage: TBitBtn;
    btnLastPage: TBitBtn;
    btnRefreshData: TBitBtn;
    act_AddDemand: TAction;
    btnAddDemand: TBitBtn;
    ScrollBox1: TScrollBox;
    dbtxtZNAME: TDBText;
    lbl1: TLabel;
    dbmmoZCONTENT: TDBMemo;
    spl1: TSplitter;
    lbl2: TLabel;
    dbedtZNAME: TDBEdit;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnPriv: TBitBtn;
    btnNext: TBitBtn;
    act_Save: TAction;
    act_Cancel: TAction;
    act_Priv: TAction;
    act_Next: TAction;
    lbl3: TLabel;
    dbedtZNEEDDATE: TDBEdit;
    lbl4: TLabel;
    dblkcbbZPROJECTNAME: TDBLookupComboBox;
    lbl5: TLabel;
    dbmmoZCUSTOMER: TDBMemo;
    lbl6: TLabel;
    dbedtZMAILTO: TDBEdit;
    lbl7: TLabel;
    dblkcbbSelectUsermail: TDBLookupComboBox;
    lbl8: TLabel;
    dbmmoZREMARK: TDBMemo;
    pnlFile: TPanel;
    lbl9: TLabel;
    dbedtZSTATUSNAME: TDBEdit;
    lbl10: TLabel;
    dbtxtZANNEXFILENAME: TDBText;
    act_OpenFIle: TAction;
    btnOpenFIle: TBitBtn;
    act_Accept: TAction;
    act_refuse: TAction;
    btnAccept: TBitBtn;
    btnrefuse: TBitBtn;
    dbchkZISRESET: TDBCheckBox;
    dlgOpen1: TOpenDialog;
    dlgSave1: TSaveDialog;
    act_downfile: TAction;
    btndownfile: TBitBtn;
    act_toMe: TAction;
    btntoMe: TBitBtn;
    act_AllData: TAction;
    btnAllData: TBitBtn;
    lbl11: TLabel;
    dtp1: TDateTimePicker;
    lbl12: TLabel;
    procedure act_FirstPageUpdate(Sender: TObject);
    procedure act_FirstPageExecute(Sender: TObject);
    procedure act_PrivPageUpdate(Sender: TObject);
    procedure act_PrivPageExecute(Sender: TObject);
    procedure act_NextPageUpdate(Sender: TObject);
    procedure act_NextPageExecute(Sender: TObject);
    procedure act_LastPageUpdate(Sender: TObject);
    procedure act_LastPageExecute(Sender: TObject);
    procedure act_RefreshDataExecute(Sender: TObject);
    procedure cdsDemandListNewRecord(DataSet: TDataSet);
    procedure act_AddDemandExecute(Sender: TObject);
    procedure pgc1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure act_SaveUpdate(Sender: TObject);
    procedure act_CancelUpdate(Sender: TObject);
    procedure act_SaveExecute(Sender: TObject);
    procedure act_CancelExecute(Sender: TObject);
    procedure act_PrivUpdate(Sender: TObject);
    procedure act_PrivExecute(Sender: TObject);
    procedure act_NextUpdate(Sender: TObject);
    procedure act_NextExecute(Sender: TObject);
    procedure dblkcbbSelectUsermailCloseUp(Sender: TObject);
    procedure cdsDemandListBeforePost(DataSet: TDataSet);
    procedure dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure act_AcceptExecute(Sender: TObject);
    procedure act_refuseExecute(Sender: TObject);
    procedure cdsDemandListCalcFields(DataSet: TDataSet);
    procedure act_OpenFIleExecute(Sender: TObject);
    procedure act_downfileExecute(Sender: TObject);
    procedure act_downfileUpdate(Sender: TObject);
    procedure act_toMeExecute(Sender: TObject);
    procedure act_AllDataExecute(Sender: TObject);
    procedure dtp1Change(Sender: TObject);
  private
    { Private declarations }
    fPageType : TPageTypeRec;
    function  GetDemandListPageCount(AWhereStr:String):integer;
    procedure LoadDemandList(APageIndex:integer;AWhereStr:String);
    procedure WMShowDemandItem(var msg:TMessage); message gcMSG_GetDemandItem; //直接显示bug,用于测试用例内

  public
    { Public declarations }
    procedure initBase; override;
    procedure freeBase; override;
  end;


implementation

uses DmUints,ClinetSystemUnits;

{$R *.dfm}

{ TDemandClientDlg }

procedure TDemandClientDlg.freeBase;
begin
  inherited;
  //
end;

function TDemandClientDlg.GetDemandListPageCount(
  AWhereStr: String): integer;
var
  mySQL  : string;
  myRowCount : integer;
  mywhere : string;
const
  glSQL = 'exec pt_SplitPage ''TB_DEMAND'',''' +
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

procedure TDemandClientDlg.initBase;
const
  gl_SQLTXT = 'select * from TB_DEMAND_PARAMS where ZTYPE=0';
  gl_SQLTXT2 = 'select ZID,ZNAME from TB_PRO_ITEM ';
begin
  inherited;
  ShowProgress('读取数据',0);
  try
    cdsParams.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(gl_SQLTXT));
    cdsProject.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(gl_SQLTXT2));

    fPageType.fIndex := 1;
    fPageType.fIndexCount := GetDemandListPageCount('');
    LoadDemandList(1,'');
    lblPageCount.Caption := format('%d/%d',[
        fPageType.fIndex,
        fPageType.fIndexCount]);

  finally
    HideProgress;
  end;
end;

procedure TDemandClientDlg.LoadDemandList(APageIndex: integer;
  AWhereStr: String);
var
  mySQL  : string;
  i : integer;
  myfield : TFieldDef;
  myDataSet : TClientDataSet;
  myb : Boolean;
  mywhere : String;
const
  glSQL = 'exec pt_SplitPage ''TB_DEMAND'',' +
          '''ZID,ZNAME,ZUSER_ID,ZBUILDDATE,ZCONTENT,ZPRO_ID,ZCUSTOMER, ' +
          'ZANNEXFILE_ID,ZANNEXFILENAME,ZSTATUS,ZREMARK,ZCHECK_USER_ID,ZNEEDDATE,ZMAILTO,ZISRESET'',' +
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
    if cdsDemandList.Fields.Count=0 then
      with cdsDemandList do
      begin
        Fields.Clear;
        FieldDefs.Assign(myDataSet.FieldDefs);
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZISNEW';
        myfield.DataType := ftBoolean;

        for i:=0 to FieldDefs.Count -1 do
        begin
          FieldDefs[i].CreateField(cdsDemandList).Alignment := taLeftJustify;
        end;

        //由谁制单
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZUSERNAME';
        myfield.DataType := ftString;
        myfield.Size := 50;
        with myfield.CreateField(cdsDemandList) do
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
        with myfield.CreateField(cdsDemandList) do
        begin
          FieldKind := fkLookup;
          KeyFields := 'ZCHECK_USER_ID';
          LookupDataSet := DM.cdsUserAll;
          LookupKeyFields := 'ZID';
          LookupResultField := 'ZNAME';
        end;


        //状态名
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZSTATUSNAME';
        myfield.DataType := ftString;
        myfield.Size := 50;
        with myfield.CreateField(cdsDemandList) do
        begin
          FieldKind := fkLookup;
          KeyFields := 'ZSTATUS';
          LookupDataSet := cdsParams;
          LookupKeyFields := 'ZID';
          LookupResultField := 'ZNAME';
        end;

        //项目名称
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZPROJECTNAME';
        myfield.DataType := ftString;
        myfield.Size := 50;
        with myfield.CreateField(cdsDemandList) do
        begin
          FieldKind := fkLookup;
          KeyFields := 'ZPRO_ID';
          LookupDataSet := cdsProject;
          LookupKeyFields := 'ZID';
          LookupResultField := 'ZNAME';
        end;

        //是否变更了
        myField := FieldDefs.AddFieldDef ;
        myField.Name := 'ZRESETNAME';
        myField.DataType := ftString;
        myField.Size := 10;
        with myfield.CreateField(cdsDemandList) do
        begin
          FieldKind := fkCalculated;
        end;

        CreateDataSet;
      end
    else begin
      cdsDemandList.DisableControls;
      try
        while not cdsDemandList.IsEmpty do cdsDemandList.Delete;
      finally
        cdsDemandList.EnableControls;
      end;
    end;

    cdsDemandList.DisableControls;
    try
      myDataSet.First;
      while not myDataSet.Eof do
      begin
        cdsDemandList.Append;
        cdsDemandList.FieldByName('ZISNEW').AsBoolean := False;
        for i:=0 to myDataSet.FieldDefs.Count -1 do
        begin
          cdsDemandList.FieldByName(myDataSet.FieldDefs[i].Name).AsVariant :=
              myDataSet.FieldByName(myDataSet.FieldDefs[i].Name).AsVariant;
        end;
        cdsDemandList.Post;
        myDataSet.Next;
      end;
      cdsDemandList.First;
    finally
      cdsDemandList.EnableControls;
    end;

  finally
    myDataSet.Free;
    fLoading :=myb;
    ClientSystem.EndTickCount;
    HideProgress;
  end;
end;

procedure TDemandClientDlg.act_FirstPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsDemandList.Active and
   (fPageType.fIndex <> 1) and (fPageType.fIndexCount>1);
end;

procedure TDemandClientDlg.act_FirstPageExecute(Sender: TObject);
begin
  fPageType.fIndex := 1;
  LoadDemandList(1,fPageType.fWhereStr);
  lblPageCount.Caption := format('%d/%d',[
        fPageType.fIndex,
        fPageType.fIndexCount]);
end;

procedure TDemandClientDlg.act_PrivPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsDemandList.Active and
   (fPageType.fIndex > 1) and (fPageType.fIndexCount>1);
end;

procedure TDemandClientDlg.act_PrivPageExecute(Sender: TObject);
begin
  fPageType.fIndex := fPageType.fIndex-1;
  LoadDemandList(fPageType.fIndex,fPageType.fWhereStr);
  lblPageCount.Caption := format('%d/%d',[
        fPageType.fIndex,
        fPageType.fIndexCount]);

end;

procedure TDemandClientDlg.act_NextPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsDemandList.Active and
   (fPageType.fIndex < fPageType.fIndexCount) and (fPageType.fIndexCount>0);

end;

procedure TDemandClientDlg.act_NextPageExecute(Sender: TObject);
begin
  fPageType.fIndex := fPageType.fIndex+1;
  LoadDemandList(fPageType.fIndex,fPageType.fWhereStr);
  lblPageCount.Caption := format('%d/%d',[
        fPageType.fIndex,
        fPageType.fIndexCount]);
end;

procedure TDemandClientDlg.act_LastPageUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsDemandList.Active and
   (fPageType.fIndex <> fPageType.fIndexCount) and (fPageType.fIndexCount>0);
end;

procedure TDemandClientDlg.act_LastPageExecute(Sender: TObject);
begin
  fPageType.fIndex := fPageType.fIndexCount;
  LoadDemandList(fPageType.fIndex,fPageType.fWhereStr);
  lblPageCount.Caption := format('%d/%d',[
        fPageType.fIndex,
        fPageType.fIndexCount]);

end;

procedure TDemandClientDlg.act_RefreshDataExecute(Sender: TObject);
begin
  LoadDemandList(fPageType.fIndex,fPageType.fWhereStr);
  lblPageCount.Caption := format('%d/%d',[
        fPageType.fIndex,
        fPageType.fIndexCount]);
end;

procedure TDemandClientDlg.cdsDemandListNewRecord(DataSet: TDataSet);
begin
  if fLoading then Exit;

  DataSet.FieldByName('ZUSER_ID').AsInteger := ClientSystem.fEditer_id;
  DataSet.FieldByName('ZBUILDDATE').AsDateTime := ClientSystem.fDbOpr.GetSysDateTime;
  DataSet.FieldByName('ZCUSTOMER').AsString := '客户单位:' + #13#10 + '联 系 人:' + #13#10 + '联系电话:';
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
  DataSet.FieldByName('ZISRESET').AsBoolean := False;
  DataSet.FieldByName('ZANNEXFILE_ID').AsInteger := -1;
  DataSet.FieldByName('ZMAILTO').AsString := Format('%s(%d)',[
    ClientSystem.fEditer,ClientSystem.fEditer_id]);
end;

procedure TDemandClientDlg.act_AddDemandExecute(Sender: TObject);
begin
  //
  cdsDemandList.Append;
  pgc1.ActivePageIndex := 1;
  
end;

procedure TDemandClientDlg.pgc1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if pgc1.ActivePageIndex = 0 then
    AllowChange := (cdsDemandList.RecordCount > 0);

  if pgc1.ActivePageIndex = 1 then
  begin
    AllowChange := not (cdsDemandList.State in [dsEdit,dsInsert]);
    if not AllowChange then
      MessageBox(Handle,'编辑状态，不能切换页面','提示',MB_ICONWARNING+MB_OK);
  end;
end;

procedure TDemandClientDlg.act_SaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled :=  (cdsDemandList.State in [dsEdit,dsInsert]);
end;

procedure TDemandClientDlg.act_CancelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (cdsDemandList.State in [dsEdit,dsInsert]);
end;

procedure TDemandClientDlg.act_SaveExecute(Sender: TObject);
begin
  cdsDemandList.Post;
end;

procedure TDemandClientDlg.act_CancelExecute(Sender: TObject);
begin
  cdsDemandList.Cancel;
end;

procedure TDemandClientDlg.act_PrivUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not (cdsDemandList.State in [dsEdit,dsInsert])
  and not (cdsDemandList.Bof);
end;

procedure TDemandClientDlg.act_PrivExecute(Sender: TObject);
begin
  cdsDemandList.Prior;
end;

procedure TDemandClientDlg.act_NextUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not (cdsDemandList.State in [dsEdit,dsInsert])
  and not (cdsDemandList.Eof);
end;

procedure TDemandClientDlg.act_NextExecute(Sender: TObject);
begin
  cdsDemandList.Next;
end;

procedure TDemandClientDlg.dblkcbbSelectUsermailCloseUp(Sender: TObject);
var
  mystr : String;
  myaddstr : string;
begin
  if (Sender as TDBLookupComboBox).Text = '' then Exit;

  if cdsDemandList.State in [dsBrowse] then
    cdsDemandList.Edit;

  myaddstr := format('%s(%d)',[
      DM.cdsUser.FieldByName('ZNAME').AsString,
      DM.cdsUser.FieldByName('ZID').AsInteger]);

  myStr := cdsDemandList.FieldByName('ZMAILTO').AsString;
  if mystr <> '' then
  begin
    if Pos(myaddstr,mystr) <= 0 then
      myStr := myStr + ';' + myaddstr;
  end
  else
    myStr := myStr + myaddstr;

  cdsDemandList.FieldByName('ZMAILTO').AsString := myStr;
end;

procedure TDemandClientDlg.cdsDemandListBeforePost(DataSet: TDataSet);
var
  myMaxID : Integer;
  mySQL : string;
const
  gl_SQLTXT  = 'select isNull(max(ZID),0)+1 from TB_DEMAND';
  gl_SQLTXT2 = 'insert TB_DEMAND (ZID,ZNAME,ZUSER_ID,ZBUILDDATE,ZCONTENT,' +
             ' ZNEEDDATE,ZPRO_ID,ZCUSTOMER,ZSTATUS,ZCHECK_USER_ID, ' +
             ' ZMAILTO,ZREMARK,ZISRESET,ZANNEXFILE_ID,ZANNEXFILENAME) ' +
             ' values(%d,''%s'',%d,''%s'',''%s'',''%s'',%d,''%s'',%d,%d,''%s'',' +
             ' ''%s'',%d,%d,''%s'')' ;
  gl_SQLTXT3 = ' update TB_DEMAND set ' +
               ' ZNAME=''%s'', ' +
               ' ZCONTENT=''%s'', ' +
               ' ZNEEDDATE=''%s'', ' +
               ' ZPRO_ID=%d, '       +
               ' ZCUSTOMER=''%s'', ' +
               ' ZSTATUS=%d, '       +
               ' ZCHECK_USER_ID=%d, '+
               ' ZMAILTO=''%s'', '   +
               ' ZISRESET=%d , '     +
               ' ZANNEXFILE_ID=%d, ' +
               ' ZANNEXFILENAME=''%s'', ' +
               ' ZREMARK=''%s'' where ZID=%d ';
begin
  if fLoading then Exit;

  if DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    myMaxID := ClientSystem.fDbOpr.ReadInt(PChar(gl_SQLTXT));
    mySQL := Format(gl_SQLTXT2,[
      myMaxID,
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZUSER_ID').AsInteger,
      DataSet.FieldByName('ZBUILDDATE').AsString,
      DataSet.FieldByName('ZCONTENT').AsString,
      DataSet.FieldByName('ZNEEDDATE').AsString,
      DataSet.FieldByName('ZPRO_ID').AsInteger,
      DataSet.FieldByName('ZCUSTOMER').AsString,
      DataSet.FieldByName('ZSTATUS').AsInteger,
      DataSet.FieldByName('ZCHECK_USER_ID').AsInteger,
      DataSet.FieldByName('ZMAILTO').AsString,
      DataSet.FieldByName('ZREMARK').AsString,
      Ord(DataSet.FieldByName('ZISRESET').AsBoolean),
      DataSet.FieldByName('ZANNEXFILE_ID').AsInteger,
      DataSet.FieldByName('ZANNEXFILENAME').AsString]);

    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      ClientSystem.fDbOpr.CommitTrans;
      DataSet.FieldByName('ZID').AsInteger := myMaxID;

      //邮件通知
      ShowProgress('邮件通知...',0);
      try
        Application.ProcessMessages;
        SendMail(DataSet.FieldByName('ZMAILTO').AsString,
          4,DataSet.FieldByName('ZID').AsInteger);
      finally
        HideProgress();
      end;

    except
      ClientSystem.fDbOpr.RollbackTrans;
    end;

    DataSet.FieldByName('ZISNEW').AsBoolean := False;
  end
  else begin
    mySQL := Format(gl_SQLTXT3,[
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZCONTENT').AsString,
      DataSet.FieldByName('ZNEEDDATE').AsString,
      DataSet.FieldByName('ZPRO_ID').AsInteger,
      DataSet.FieldByName('ZCUSTOMER').AsString,
      DataSet.FieldByName('ZSTATUS').AsInteger,
      DataSet.FieldByName('ZCHECK_USER_ID').AsInteger,
      DataSet.FieldByName('ZMAILTO').AsString,
      Ord(DataSet.FieldByName('ZISRESET').AsBoolean),
      DataSet.FieldByName('ZANNEXFILE_ID').AsInteger,
      DataSet.FieldByName('ZANNEXFILENAME').AsString,
      DataSet.FieldByName('ZREMARK').AsString,
      DataSet.FieldByName('ZID').AsInteger]);

    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      ClientSystem.fDbOpr.CommitTrans;
    except
      ClientSystem.fDbOpr.RollbackTrans;
    end;

    //邮件通知
    ShowProgress('邮件通知...',0);
    try
      Application.ProcessMessages;
      SendMail(DataSet.FieldByName('ZMAILTO').AsString,
        4,DataSet.FieldByName('ZID').AsInteger);
    finally
      HideProgress();
    end;

  end;
end;

procedure TDemandClientDlg.dbgrd1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (cdsDemandList.RecNo mod 2  = 0) and not ( gdSelected in State)  then
    dbgrd1.Canvas.Brush.Color := clSilver;

  if (cdsDemandList.FieldByName('ZSTATUS').AsInteger =1) then
  begin
    dbgrd1.Canvas.Font.Color := clblue;
  end;

  case Column.Index of
    Ord(dec_User):
      if cdsDemandList.FieldByName('ZUSER_ID').AsInteger =
         ClientSystem.fEditer_id then
      begin
        dbgrd1.Canvas.Brush.Color := clAqua;
      end;
    Ord(dec_CheckName):
      if cdsDemandList.FieldByName('ZCHECK_USER_ID').AsInteger =
         ClientSystem.fEditer_id then
      begin
        dbgrd1.Canvas.Brush.Color := clLime;
      end;

  end;

  dbgrd1.DefaultDrawColumnCell(Rect,DataCol,Column,State);

end;

procedure TDemandClientDlg.act_AcceptExecute(Sender: TObject);
begin
  if not (cdsDemandList.State in [dsEdit,dsInsert]) then
    cdsDemandList.Edit;
  cdsDemandList.FieldByName('ZSTATUS').AsInteger := 1;
  cdsDemandList.FieldByName('ZCHECK_USER_ID').AsInteger := ClientSystem.fEditer_id;

end;

procedure TDemandClientDlg.act_refuseExecute(Sender: TObject);
begin
  if not (cdsDemandList.State in [dsEdit,dsInsert]) then
    cdsDemandList.Edit;
  cdsDemandList.FieldByName('ZCHECK_USER_ID').AsInteger := ClientSystem.fEditer_id;
  cdsDemandList.FieldByName('ZSTATUS').AsInteger := 2;
end;

procedure TDemandClientDlg.cdsDemandListCalcFields(DataSet: TDataSet);
begin
  if cdsDemandList.FieldByName('ZISRESET').AsBoolean then
    cdsDemandList.FieldByName('ZRESETNAME').AsString := '是'
  else
    cdsDemandList.FieldByName('ZRESETNAME').AsString := '否';
end;

procedure TDemandClientDlg.act_OpenFIleExecute(Sender: TObject);
var
  myFileID : Integer;
  myProID : Integer;
  myFileName : string;
begin
  //如已存在了文件怎么办
  myProID:= cdsDemandList.FieldByName('ZPRO_ID').AsInteger;
  if dlgOpen1.Execute then
  begin
    myFileID := -1;
    myFileName := dlgOpen1.FileName;
    //取出文件大小太大的文件不能上传
    if not ClientSystem.AllowFileSize(myfilename) then
    begin
      MessageBox(Handle,'文件太大，只能上传500KB的文件。',
        '提示',MB_ICONWARNING+MB_OK);
        Exit;
    end;
    if ClientSystem.UpFile(fsDemand,myProID,
      myFileName,myFileID) then
    begin
      //保存完成，则提成内容
      if not (cdsDemandList.State in [dsEdit,dsInsert]) then
        cdsDemandList.Edit;
      cdsDemandList.FieldByName('ZANNEXFILE_ID').AsInteger := myFileID;
      cdsDemandList.FieldByName('ZANNEXFILENAME').AsString := ExtractFileName(myFileName);
    end;
  end;
end;

procedure TDemandClientDlg.act_downfileExecute(Sender: TObject);
var
  myfileid : integer;
  myfilename : string;
  myname : string;
  myver : integer;
const
  glSQL  = 'select isnull(max(ZVER),-1) from TB_FILE_ITEM where ZID=%d';
begin
  myfileid   := cdsDemandList.FieldByName('ZANNEXFILE_ID').AsInteger;
  myfilename := cdsDemandList.FieldByName('ZANNEXFILEName').AsString;
  dlgSave1.FileName := myfilename;
  if Pos('.',myfilename) > 0 then
    dlgSave1.DefaultExt := Copy(myfilename,Pos('.',myfilename)+1,Maxint);

  if dlgSave1.Execute then
  begin
    Application.ProcessMessages;
    myver := ClientSystem.fDbOpr.ReadInt(PChar(Format(glSQL,[myfileid])));
    if myver < 0 then
    begin
      MessageBox(Handle,'文件在服务器已不存在,另存文件失败','提示',MB_ICONERROR+MB_OK);
      Exit;
    end;

    myname := dlgSave1.FileName;
    if ClientSystem.DonwFileToFileName(myfileid,myver,myname) then
    begin
      ShowMessage('另存文件成功')
    end
    else
      MessageBox(Handle,'另存文件失败','提示',MB_ICONERROR+MB_OK);
  end;
end;

procedure TDemandClientDlg.act_downfileUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (cdsDemandList.RecordCount>0) and
  (cdsDemandList.FieldByName('ZANNEXFILE_ID').AsInteger>0);
end;

procedure TDemandClientDlg.act_toMeExecute(Sender: TObject);
begin
  fPageType.fIndex := 1;
  fPageType.fWhereStr := Format('ZUSER_ID=%d',[ClientSystem.fEditer_id]);
  fPageType.fIndexCount := GetDemandListPageCount(fPageType.fWhereStr);
  LoadDemandList(1,fPageType.fWhereStr);
  lblPageCount.Caption := format('%d/%d',[
        fPageType.fIndex,
        fPageType.fIndexCount]);
end;

procedure TDemandClientDlg.act_AllDataExecute(Sender: TObject);
begin
  fPageType.fIndex := 1;
  fPageType.fIndexCount := GetDemandListPageCount('');
  LoadDemandList(1,'');
  lblPageCount.Caption := format('%d/%d',[
        fPageType.fIndex,
        fPageType.fIndexCount]);

end;

procedure TDemandClientDlg.dtp1Change(Sender: TObject);
begin
  //
  if not (cdsDemandList.State in [dsEdit,dsInsert]) then
    cdsDemandList.Edit;
  cdsDemandList.FieldByName('ZNEEDDATE').AsDateTime := dtp1.DateTime;
end;

procedure TDemandClientDlg.WMShowDemandItem(var msg: TMessage);
var
  myPageIndex : Integer;
  mywherestr : string;
  myindex : integer;
  mycount : integer;
begin
  //
  mywherestr := fPageType.fWhereStr;
  myindex := fpageType.fIndex;
  mycount := fpageType.fIndexCount;
  try

    fPageType.fWhereStr := Format('ZID=%d',[msg.WParam]);
    fPageType.fIndex := 1;
    myPageIndex := 1;
    fPageType.fIndexCount := 1;
    LoadDemandList(myPageindex,fPageType.fWhereStr);
    lblPageCount.Caption := format('%d/%d',[
      fPageType.fIndex,
      fPageType.fIndexCount]);

    if pgc1.ActivePageIndex=0 then
      pgc1.ActivePageIndex := 1;

  finally
    fPageType.fWhereStr := mywherestr;
    fpageType.fIndex := myindex;
    fpageType.fIndexCount := mycount;
  end;
end;

end.
