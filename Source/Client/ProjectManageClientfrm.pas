///////////////////////////////////////////////////////////////////////////////
//
//  项目的管理模块
//
//  创建时间:2007-11-20  作者:龙仕云
//
//
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

  ClientTypeUnits,
  ExcelUnits;

type
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
    tsProDocmuent: TTabSheet;
    dgExcel: TDrawGrid;
    plExcelTool: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    StatusBarDocList: TStatusBar;
    TabSetProDocList: TTabSet;
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
    actExcel_Save: TAction;
    BitBtn10: TBitBtn;
    miFixedRow: TMenuItem;
    N5: TMenuItem;
    miFixedCol: TMenuItem;
    N11: TMenuItem;
    N22: TMenuItem;
    N32: TMenuItem;
    N42: TMenuItem;
    N52: TMenuItem;
    actExcel_new: TAction;
    BitBtn11: TBitBtn;
    actExcle_ColFront: TAction;
    actExcel_ColBack: TAction;
    N6: TMenuItem;
    N7: TMenuItem;
    cdsDocs: TClientDataSet;
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
    procedure TabSetProDocListDrawTab(Sender: TObject; TabCanvas: TCanvas;
      R: TRect; Index: Integer; Selected: Boolean);
    procedure TabSetProDocListMeasureTab(Sender: TObject; Index: Integer;
      var TabWidth: Integer);
    procedure dgExcelDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StatusBarDocListDrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure miFixedRowClick(Sender: TObject);
    procedure miFixedColClick(Sender: TObject);
    procedure actExcel_newExecute(Sender: TObject);
    procedure actExcel_SaveUpdate(Sender: TObject);
    procedure TabSetProDocListChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
  private
    { Private declarations }
    procedure LoadProjectItem();
    procedure initExcelGrid();
    procedure LoadExcel(AExcelFile:TExcelFile);
    function GetCurrentExcel: PProjectDoc;
    procedure SaveDoc(ADoc : PProjectDoc;AIsNew:Boolean=False); //保存文档
    function LoadDoc(ADoc:PProjectDoc):Boolean; //加载文档
    procedure ClearDocs;
  public
    procedure initBase; override;
    procedure freeBase; override;
    procedure Showfrm ; override;  //显示后发生的事件
    procedure Closefrm; override;  //关闭显示发生的事件
    class function GetModuleID : integer;override;

    property CurrentDoc : PProjectDoc read GetCurrentExcel;
  end;

var
  ProjectManageClientDlg: TProjectManageClientDlg;

implementation
uses
  ClinetSystemUnits, DmUints;


{$R *.dfm}

{ TProjectManageClientDlg }

procedure TProjectManageClientDlg.Closefrm;
begin
  inherited;

end;

procedure TProjectManageClientDlg.freeBase;
begin
  ClearDocs;
  inherited;
end;

procedure TProjectManageClientDlg.initBase;
begin
  inherited;
  LoadProjectItem();
  initExcelGrid();
  TabSetProDocList.TabIndex := -1;
end;

procedure TProjectManageClientDlg.Showfrm;
begin
  inherited;

end;

procedure TProjectManageClientDlg.actPro_AddExecute(Sender: TObject);
begin
  cdsProjectItem.Append;
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
  DataSet.FieldByName('ZOPENDATE').AsDateTime := Now();
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
  cdsProjectItem.Post;
end;

procedure TProjectManageClientDlg.actPro_DelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cbEditProItem.Checked and
   not (cdsProjectItem.State in [dsEdit,dsInsert]) and
   not cdsProjectItem.IsEmpty;
end;

procedure TProjectManageClientDlg.actPro_DelExecute(Sender: TObject);
begin
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
  mycds : TClientDataSet;
  myb : Boolean;
  mydoc : PProjectDoc;
const
  glSQL  = 'select * from TB_PRO_VERSION where ZPRO_ID=%d Order by ZID desc';
  glSQL2 = 'select * from TB_PRO_DOCUMENT where ZPRO_ID=%d';
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

    mycds := TClientDataSet.Create(nil);
    myb := fLoading;
    fLoading := True;
    try
      mycds.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(
        Format(glSQL,[
          cdsProjectItem.FieldByName('ZID').Asinteger])));
      //增加序号的列名
      if cdsProVersion.Active then cdsProVersion.Close;
      cdsProVersion.FieldDefs.Clear;
      cdsProVersion.FieldDefs.Assign(mycds.FieldDefs);
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
      mycds.First;
      while not mycds.Eof do
      begin
        cdsProVersion.Append;
        cdsProVersion.FieldByName('ZNO').AsInteger := c;
        cdsProVersion.FieldByName('ZISNEW').AsBoolean := False;
        for i := 0 to mycds.FieldDefs.Count -1 do
          cdsProVersion.FieldByName(mycds.FieldDefs[i].Name).AsVariant :=
            mycds.FieldByName(mycds.FieldDefs[i].Name).AsVariant;
        inc(c);
        cdsProVersion.Post;
        mycds.Next;
      end;
      cdsProVersion.First;
    finally
      mycds.Free;
      fLoading := myb;
    end;
  end;

  //2.项目文档
  if pcProject.ActivePage = tsProDocmuent  then
  begin
    cdsDocs.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(Format(glSQL2,[
      cdsProjectItem.FieldByName('ZID').Asinteger])));

    //清空列表
    ClearDocs;
    cdsDocs.First;
    while not cdsDocs.Eof do
    begin
      new(mydoc);
      myDoc^.fID := cdsDocs.FieldByName('ZID').AsInteger;
      myDoc^.fName := cdsDocs.FieldByName('ZNAME').AsString;
      myDoc^.fFile_id := cdsDocs.FieldByName('ZFILE_ID').AsInteger;
      myDoc^.fExcelFile := nil;
      TabSetProDocList.Tabs.AddObject(myDoc^.fName,TObject(myDoc));

      cdsDocs.Next;
    end;
    dgExcel.Visible := False;

  end;
end;

procedure TProjectManageClientDlg.cdsProVersionNewRecord(
  DataSet: TDataSet);
begin
  if fLoading then Exit;
  DataSet.FieldByName('ZPRO_ID').AsInteger :=
    cdsProjectItem.FieldByName('ZID').AsInteger;
  DataSet.FieldByName('ZUPDATEDATE').AsDateTime := now();
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

procedure TProjectManageClientDlg.TabSetProDocListDrawTab(Sender: TObject;
  TabCanvas: TCanvas; R: TRect; Index: Integer; Selected: Boolean);
var
  mystr : String;
begin
  TabCanvas.FillRect(R);
  mystr := TabSetProDocList.Tabs[Index];
  //当前选择
  if Index = TabSetProDocList.TabIndex then
  begin
    TabCanvas.TextOut(R.Left+4,R.Top+2,myStr);
    TabCanvas.Pen.Width := 2;
    TabCanvas.Pen.Color := clRed;
    TabCanvas.MoveTo(R.Left,R.Bottom-4);
    TabCanvas.LineTo(R.Right,R.Bottom-4);
  end
  else
    TabCanvas.TextOut(R.Left+4,R.Top+2,myStr);

end;

procedure TProjectManageClientDlg.TabSetProDocListMeasureTab(
  Sender: TObject; Index: Integer; var TabWidth: Integer);
var
  mystr : string;
begin
  mystr := TabSetProDocList.Tabs[Index];
  TabWidth := TabSetProDocList.Canvas.TextWidth(mystr) + 8;
end;

procedure TProjectManageClientDlg.dgExcelDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  myRect : TRect;
  myStr : String;
  myAlignent : TAlignment; //
const
  gcColumnTitle : array[0..25] of string = ('A','B','C','D','E','F','G',
    'H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
begin
  myRect := Rect;
  InflateRect(myRect,-1,-1);
  //1.列
  if (ARow = 0) and (ACol>0) then
  begin
    myStr := gcColumnTitle[ACol-1];
    myAlignent := taCenter; //居中
  end
  //2.行
  else if (ACol=0) and (ARow>0) then begin
    myStr := inttostr(ARow);
    myAlignent := taCenter;
  end
  //单元格内容
  else begin
    //
  end;

  with dgExcel do
  begin
    case myAlignent of
      taLeftJustify :
        Canvas.TextOut(myRect.Left,
          myRect.Top+ (Rect.Bottom - Rect.Top - Canvas.TextHeight(myStr)) div 2,
          myStr);
      taRightJustify:
        Canvas.TextOut(myRect.Right - Canvas.TextWidth(myStr),
          myRect.Top+ (Rect.Bottom - Rect.Top - Canvas.TextHeight(myStr)) div 2,
          myStr);
      taCenter:
          Canvas.TextOut(myRect.Left + (myRect.Right-myRect.Left - Canvas.TextWidth(myStr)) div 2,
           myRect.Top+ (Rect.Bottom - Rect.Top - Canvas.TextHeight(myStr)) div 2,
           myStr);
    end;
  end;

end;

procedure TProjectManageClientDlg.initExcelGrid;
begin
  dgExcel.ColWidths[0] := 40;
  dgExcel.FixedRows := 4;
  dgExcel.DefaultRowHeight := 21;
end;

procedure TProjectManageClientDlg.StatusBarDocListDrawPanel(
  StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
begin
  with TabSetProDocList do
  begin
    Parent   :=   StatusBar;
    Left     :=   Rect.Left;
    Top      :=   Rect.Top ;
    Width    :=   Panel.Width;
    Height   :=   Rect.Bottom;
    Visible  :=   True;
  end;
end;

procedure TProjectManageClientDlg.miFixedRowClick(Sender: TObject);
var
  myCount : integer;
begin
  if not Assigned(CurrentDoc) then Exit;
  if CurrentDoc^.fExcelFile.fFixedRow = (Sender as TMenuItem).Tag then Exit;
  myCount := (Sender as TMenuItem).Tag + 1;
  dgExcel.FixedRows := myCount;
  CurrentDoc^.fExcelFile.fFixedRow := myCount -1;
  CurrentDoc^.fExcelFile.fmodify := True;
end;

procedure TProjectManageClientDlg.miFixedColClick(Sender: TObject);
var
  myCount : integer;
begin
  if not Assigned(CurrentDoc) then Exit;
  if CurrentDoc^.fExcelFile.fFixedCols = (Sender as TMenuItem).Tag then Exit;
  myCount := (Sender as TMenuItem).Tag + 1;
  dgExcel.FixedCols := myCount;
  CurrentDoc^.fExcelFile.fFixedCols := myCount -1;
  CurrentDoc^.fExcelFile.fmodify := True;
end;

procedure TProjectManageClientDlg.actExcel_newExecute(Sender: TObject);
var
  mystr : string;
  myindex : integer;
  myDocData : PProjectDoc;
begin
  //新建文档
  mystr := inputBox('新建文档','文档名称:','');
  mystr := Trim(mystr);
  if mystr ='' then Exit;

  new(myDocData);
  myDocData^.fName := mystr;
  myDocData^.fPro_id := cdsProjectItem.FieldByName('ZID').AsInteger;
  myDocData^.fExcelFile := TExcelFile.Create;
  myDocData^.fFile_ver  := 1;
  TabSetProDocList.TabIndex :=
    TabSetProDocList.Tabs.AddObject(mystr,TObject(myDocData));
  TabSetProDocList.Refresh;
  SaveDoc(myDocData,True);
end;

procedure TProjectManageClientDlg.actExcel_SaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (TabSetProDocList.TabIndex >=0)
  and Assigned(TabSetProDocList.Tabs.Objects[TabSetProDocList.TabIndex])
  and PProjectDoc(TabSetProDocList.Tabs.Objects[TabSetProDocList.TabIndex])^.fExcelFile.fmodify;
end;

procedure TProjectManageClientDlg.TabSetProDocListChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
var
  myDoc : PProjectDoc;
  myfilename : string;
begin
  if fLoading then Exit;
  myDoc := PProjectDoc(TabSetProDocList.Tabs.Objects[NewTab]);

  //哪没有文档时，则要下载加载了
  if not Assigned(myDoc^.fExcelFile) then
  begin
    myDoc^.fExcelFile := TExcelFile.Create;
    if not LoadDoc(myDoc) then
    begin
      MessageBox(Handle,'文件出错，无法打开。','打开',MB_ICONERROR+MB_OK);
      Exit;
    end;
  end;
  LoadExcel(myDoc^.fExcelFile);
end;

procedure TProjectManageClientDlg.LoadExcel(AExcelFile: TExcelFile);
var
  i : integer;
begin
  dgExcel.Visible   := True;
  dgExcel.ColCount  := AExcelFile.ColCount+1;
  dgExcel.RowCount  := AExcelFile.RowCount+1;
  dgExcel.FixedCols := AExcelFile.fFixedCols + 1;
  dgExcel.FixedRows := AExcelFile.fFixedRow  + 1;

  for i :=1 to dgExcel.ColCount -1 do
    dgExcel.ColWidths[i] := AExcelFile.fCols[i-1].fWidht;

  for i:=1 to dgExcel.RowCount -1 do
    dgExcel.RowHeights[i] := AExcelFile.Rows[i-1].fHight;
end;

function TProjectManageClientDlg.GetCurrentExcel: PProjectDoc;
begin
  Result:= nil;
  if (TabSetProDocList.Tabs.Count > 0) and
     (TabSetProDocList.TabIndex>=0) and
     Assigned(TabSetProDocList.Tabs.Objects[TabSetProDocList.TabIndex]) then
    Result := PProjectDoc(TabSetProDocList.Tabs.Objects[TabSetProDocList.TabIndex]);
end;

procedure TProjectManageClientDlg.SaveDoc(ADoc: PProjectDoc;
  AIsNew:Boolean);
var
  myver : integer;
  mySQL : String;
  myFileid : integer;
  myms : TMemoryStream;
  myfilename : string;
const
  glSQL = 'insert TB_PRO_DOCUMENT (ZPRO_ID,ZNAME,ZFILE_ID) ' +
          'values(%d,''%s'',%d)';
  glSQL2 = 'select isnull(max(ZVER),0)+1 from TB_FILE_CONTEXT where ZFILE_ID=%d';
begin
  // 1.先上传文件

  myFileid := -1;
  if AIsNew then
    myver := 1
  else begin
    mySQL := format(glSQL2,[ADoc^.fFile_id]);
    myver := ClientSystem.fDbOpr.ReadInt(pChar(mySQL));
  end;

  myms := TMemoryStream.Create;
  try
    myfilename :=  ClientSystem.fTempDir + ADoc^.fName + '.prodoc';
    ADoc^.fExcelFile.SaveToStream(myms);
    myms.SaveToFile(myfilename);
    if not ClientSystem.UpFile(ftProject,myfilename,myFileid,myver) then
    begin
      Exit;
    end;
    ADoc^.fFile_ver := myver;

    //写入库
    if AIsNew then
    begin
      ClientSystem.fDbOpr.BeginTrans;
      try
        mySQL := format(glSQL,[
          ADoc^.fPro_id,
          ADoc^.fName,
          myFileid]);
        ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
        ClientSystem.fDbOpr.CommitTrans;
      except
        ClientSystem.fDbOpr.RollbackTrans;
      end;
    end;

  finally
    myms.Free;
  end;

end;

procedure TProjectManageClientDlg.ClearDocs;
var
  i : integer;
  myDoc : PProjectDoc;
begin
  for i:=0 to TabSetProDocList.Tabs.Count -1 do
  begin
    if Assigned(TabSetProDocList.Tabs.Objects[i]) then
    begin
      myDoc := PProjectDoc(TabSetProDocList.Tabs.Objects[i]);
      myDoc^.fExcelFile.Free;
      Dispose(myDoc);
    end;
  end;
  TabSetProDocList.Tabs.Clear;
end;

function TProjectManageClientDlg.LoadDoc(ADoc: PProjectDoc): Boolean;
var
  myfilename : String;
  myms : TMemoryStream;
begin
  Result := False;
  myfilename := ADoc^.fName + '.prodoc';
  if ClientSystem.DonwFileToFileName(ADoc^.fFile_id,myfilename) then
  begin
    myms := TMemoryStream.Create;
    try
      myms.LoadFromFile(myfilename);
      myms.Position := 0;
      Result := ADoc.fExcelFile.LoadfromStream(myms);
    finally
      myms.Free;
    end;
  end;
end;

end.
