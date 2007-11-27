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
  Buttons, Grids, DBGrids, ActnList, DBCtrls;

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
  private
    { Private declarations }
    procedure LoadProjectItem();
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
  ClientTypeUnits,
  ClinetSystemUnits, DmUints;


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
begin
  inherited;
  LoadProjectItem();
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
    if cdsProjectItem.FieldByName('ZISNEW').AsBoolean then
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
const
  glSQL = 'select * from TB_PRO_VERSION where ZPRO_ID=%d Order by ZID desc';
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
        cdsProjectItem.FieldByName('ZISNEW').AsBoolean := False;
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
  end;
end;

procedure TProjectManageClientDlg.actPro_RefreshDataExecute(Sender: TObject);
begin
  LoadProjectItem;
end;

end.
