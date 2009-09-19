///////////////////////////////////////////////////////////////////////////////
//
//  用户管理
// 1.增加任务审核的设置 作者:龙仕云 2008-8-2
//
//
//
///////////////////////////////////////////////////////////////////////////////
unit UserManageClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseChildfrm, ComCtrls, StdCtrls, ExtCtrls, DB, DBClient, Grids,
  DBGrids, Buttons, ActnList, Mask, DBCtrls;

type
  TUserManageClientDlg = class(TBaseChildDlg)
    plCenter: TPanel;
    plnoVisible: TPanel;
    cdsUsers: TClientDataSet;
    dsUsers: TDataSource;
    cdsUserPriv: TClientDataSet;
    dsUserPriv: TDataSource;
    ActionList1: TActionList;
    actUser_Add: TAction;
    actUser_Del: TAction;
    actUser_Save: TAction;
    actUser_Cancel: TAction;
    accPriv_Add: TAction;
    actPriv_Del: TAction;
    actPriv_Save: TAction;
    actPriv_Cancel: TAction;
    PageControl1: TPageControl;
    tsUser: TTabSheet;
    tsUserPriv: TTabSheet;
    dgUsers: TDBGrid;
    plUserTop: TPanel;
    cbEditUser: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    plUserProvTool: TPanel;
    ckEditUserPriv: TCheckBox;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    dgUserPriv: TDBGrid;
    plUserPrivEdit: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    btbnCalcPriv: TBitBtn;
    cbView: TCheckBox;
    cbUpdate: TCheckBox;
    cbDel: TCheckBox;
    cbAdd: TCheckBox;
    DBText1: TDBText;
    actUser_RefreshData: TAction;
    BitBtn9: TBitBtn;
    Memo1: TMemo;
    Splitter1: TSplitter;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    actPriv_CopyByName: TAction;
    procedure cbEditUserClick(Sender: TObject);
    procedure actUser_AddUpdate(Sender: TObject);
    procedure actUser_DelUpdate(Sender: TObject);
    procedure actUser_AddExecute(Sender: TObject);
    procedure actUser_SaveUpdate(Sender: TObject);
    procedure actUser_SaveExecute(Sender: TObject);
    procedure cdsUsersBeforePost(DataSet: TDataSet);
    procedure cdsUsersNewRecord(DataSet: TDataSet);
    procedure actUser_DelExecute(Sender: TObject);
    procedure cdsUsersBeforeDelete(DataSet: TDataSet);
    procedure actUser_CancelUpdate(Sender: TObject);
    procedure actUser_CancelExecute(Sender: TObject);
    procedure ckEditUserPrivClick(Sender: TObject);
    procedure btbnCalcPrivClick(Sender: TObject);
    procedure accPriv_AddUpdate(Sender: TObject);
    procedure actPriv_DelUpdate(Sender: TObject);
    procedure actPriv_SaveUpdate(Sender: TObject);
    procedure actPriv_CancelUpdate(Sender: TObject);
    procedure accPriv_AddExecute(Sender: TObject);
    procedure cdsUserPrivNewRecord(DataSet: TDataSet);
    procedure actPriv_DelExecute(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure cdsUserPrivBeforePost(DataSet: TDataSet);
    procedure cdsUserPrivBeforeDelete(DataSet: TDataSet);
    procedure actPriv_SaveExecute(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure actUser_RefreshDataExecute(Sender: TObject);
    procedure actPriv_CopyByNameExecute(Sender: TObject);
    procedure actPriv_CopyByNameUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure initBase; override;
    procedure LoadUser();
    class function GetModuleID : integer;override;
  end;

var
  UserManageClientDlg: TUserManageClientDlg;

implementation
uses
  ClinetSystemUnits,
  SelectUsersfrm,
  ClientTypeUnits;

{$R *.dfm}

{ TUserManageClientDlg }

class function TUserManageClientDlg.GetModuleID: integer;
begin
  Result := Ord(mtUser);
end;

procedure TUserManageClientDlg.initBase;
begin
  LoadUser;
end;

procedure TUserManageClientDlg.cbEditUserClick(Sender: TObject);
begin
  if cbEditUser.Checked then
  begin
    dgUsers.Options := dgUsers.Options - [dgRowSelect];
    dgUsers.Options := dgUsers.Options + [dgEditing];
    dgUserPriv.Options := dgUserPriv.Options - [dgRowSelect];
    dgUserPriv.Options := dgUserPriv.Options + [dgEditing];
  end
  else begin
    dgUsers.Options := dgUsers.Options + [dgRowSelect];
    dgUsers.Options := dgUsers.Options - [dgEditing];
    dgUserPriv.Options := dgUserPriv.Options + [dgRowSelect];
    dgUserPriv.Options := dgUserPriv.Options - [dgEditing];
  end;
end;



procedure TUserManageClientDlg.actUser_AddUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cbEditUser.Checked and
  not (cdsUsers.State in [dsEdit,dsInsert]);
end;

procedure TUserManageClientDlg.actUser_DelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cbEditUser.Checked and
  not (cdsUsers.State in [dsEdit,dsInsert]);
end;

procedure TUserManageClientDlg.actUser_AddExecute(Sender: TObject);
begin
  cdsUsers.Append;
end;

procedure TUserManageClientDlg.actUser_SaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cbEditUser.Checked and
  (cdsUsers.State in [dsEdit,dsInsert]);
end;

procedure TUserManageClientDlg.actUser_SaveExecute(Sender: TObject);
begin
  cdsUsers.Post;
end;

procedure TUserManageClientDlg.cdsUsersBeforePost(DataSet: TDataSet);
var
  mySQL : string;
const
  glSQL  = 'update TB_USER_ITEM set ZNAME=''%s'',ZPASS=''%s'',ZSTOP=%d,ZTYPE=%d,'+
           'ZEMAIL=''%s'',ZGROUP_ID=%d,ZPRIVGROUP=%d,ZCHECKTASK=%d ' +
           'where ZID=%d';
  glSQL2 = 'insert TB_USER_ITEM(ZNAME,ZPASS,ZSTOP,ZTYPE,ZEMAIL,ZGROUP_ID,'+
           'ZPRIVGROUP,ZCHECKTASK) ' +
           'values(''%s'',''%s'',%d,%d,''%s'',%d,%d,%d)';
begin
  if fLoading then Exit;
  if not DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    mySQL := format(glSQL,[
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZPASS').AsString,
      Ord(DataSet.FieldByName('ZSTOP').AsBoolean),
      DataSet.FieldByName('ZTYPE').AsInteger,
      DataSet.FieldByName('ZEMAIL').AsString,
      DataSet.FieldByName('ZGROUP_ID').AsInteger,
      DataSet.FieldByName('ZPRIVGROUP').AsInteger,
      Ord(DataSet.FieldByName('ZCHECKTASK').AsBoolean),
      DataSet.FieldByName('ZID').Asinteger]);
    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      ClientSystem.fDbOpr.CommitTrans;
    except
      ClientSystem.fDbOpr.RollbackTrans;
    end;
  end
  else begin
    mySQL := format(glSQL2,[
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZPASS').AsString,
      Ord(DataSet.FieldByName('ZSTOP').AsBoolean),
      DataSet.FieldByName('ZTYPE').AsInteger,
      DataSet.FieldByName('ZEMAIL').AsString,
      DataSet.FieldByName('ZGROUP_ID').AsInteger,
      DataSet.FieldByName('ZPRIVGROUP').AsInteger,
      Ord(DataSet.FieldByName('ZCHECKTASK').AsBoolean)]);
    ClientSystem.fDbOpr.BeginTrans;
    try
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
      ClientSystem.fDbOpr.CommitTrans;
      DataSet.FieldByName('ZISNEW').AsBoolean := False;
    except
      ClientSystem.fDbOpr.RollbackTrans;
    end;
  end;
end;

procedure TUserManageClientDlg.cdsUsersNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ZSTOP').AsBoolean := False;
  DataSet.FieldByName('ZTYPE').AsInteger := 1;
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
  DataSet.FieldByName('ZISLOAD').AsBoolean := False;
  DataSet.FieldByName('ZCHECKTASK').AsBoolean := False;
  DataSet.FieldByName('ZPASS').AsString := '123456';
end;

procedure TUserManageClientDlg.actUser_DelExecute(Sender: TObject);
begin
  cdsUsers.Delete;
end;

procedure TUserManageClientDlg.cdsUsersBeforeDelete(DataSet: TDataSet);
var
  mySQL : String;
const
  glSQL  = 'delete TB_USER_ITEM where ZID=%d and ZTYPE<>0';
  glSQL2 = 'delete  TB_USER_PRIVILEGE where ZUSER_ID=%d';
begin
  if fLoading then Exit;
  
  if DataSet.FieldByName('ZTYPE').AsInteger = 0 then
  begin
    MessageBox(Handle,'系统用户不能删除','删除',MB_ICONWARNING+MB_OK);
    Abort;
    Exit;
  end;

  if MessageBox(Handle,'是否要删除用户?','询问',MB_ICONQUESTION+MB_YESNO)=IDNO then
    Exit;

  ClientSystem.fDbOpr.BeginTrans;
  try
    //1.删除权限
    mySQL := format(glSQL2,[DataSet.FieldByName('ZID').AsInteger]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
    //2.删除用户
    mySQL := format(glSQL,[DataSet.FieldByName('ZID').AsInteger]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));

    ClientSystem.fDbOpr.CommitTrans;
  except
    ClientSystem.fDbOpr.RollbackTrans;
  end;
end;

procedure TUserManageClientDlg.actUser_CancelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cbEditUser.Checked and
  (cdsUsers.State in [dsEdit,dsInsert]);
end;

procedure TUserManageClientDlg.actUser_CancelExecute(Sender: TObject);
begin
  cdsUsers.Cancel;
end;

procedure TUserManageClientDlg.ckEditUserPrivClick(Sender: TObject);
begin
  if ckEditUserPriv.Checked then
  begin
    dgUserPriv.Options := dgUserPriv.Options - [dgRowSelect];
    dgUserPriv.Options := dgUserPriv.Options + [dgEditing];
  end
  else begin
    dgUserPriv.Options := dgUserPriv.Options + [dgRowSelect];
    dgUserPriv.Options := dgUserPriv.Options - [dgEditing];
  end;
  DBEdit1.ReadOnly := not ckEditUserPriv.Checked;
  DBEdit2.ReadOnly := not ckEditUserPriv.Checked;
  DBEdit3.ReadOnly := not ckEditUserPriv.Checked;
  DBEdit4.ReadOnly := not ckEditUserPriv.Checked;
end;

procedure TUserManageClientDlg.btbnCalcPrivClick(Sender: TObject);
var
  myv : integer;
begin
  if not ckEditUserPriv.Checked then Exit;
  if not (cdsUserPriv.State in [dsEdit,dsInsert]) then
    cdsUserPriv.Edit;

  if (cdsUserPriv.State in [dsEdit,dsInsert]) then
  begin
    myv := 0;
    if cbView.Checked   then myv := myv + 1;
    if cbUpdate.Checked then myv := myv + 2;
    if cbDel.Checked    then myv := myv + 4;
    if cbAdd.Checked    then myv := myv + 8;
    cdsUserPriv.FieldByName('ZRIGHTMASK').AsInteger := myv;
  end;
end;

procedure TUserManageClientDlg.accPriv_AddUpdate(Sender: TObject);
begin
  (Sender As TAction).Enabled := ckEditUserPriv.Checked and
   not (cdsUserPriv.State in [dsEdit,dsInsert]) and
   (not cdsUsers.IsEmpty);
end;

procedure TUserManageClientDlg.actPriv_DelUpdate(Sender: TObject);
begin
  (Sender As TAction).Enabled := ckEditUserPriv.Checked and
   not (cdsUserPriv.State in [dsEdit,dsInsert]) and
   not (cdsUsers.IsEmpty) and
   not (cdsUserPriv.IsEmpty);
end;

procedure TUserManageClientDlg.actPriv_SaveUpdate(Sender: TObject);
begin
  (Sender As TAction).Enabled := ckEditUserPriv.Checked and
  (cdsUserPriv.State in [dsEdit,dsInsert]);
end;

procedure TUserManageClientDlg.actPriv_CancelUpdate(Sender: TObject);
begin
  (Sender As TAction).Enabled := ckEditUserPriv.Checked and
  (cdsUserPriv.State in [dsEdit,dsInsert]) ;
end;

procedure TUserManageClientDlg.accPriv_AddExecute(Sender: TObject);
begin
  if cdsUserPriv.Active then
    cdsUserPriv.Append;
end;

procedure TUserManageClientDlg.cdsUserPrivNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ZUSER_ID').AsInteger :=
    cdsUsers.FieldByName('ZID').AsInteger;
  DataSet.FieldByName('ZRIGHTMASK').AsInteger := 0;
end;

procedure TUserManageClientDlg.actPriv_DelExecute(Sender: TObject);
begin
  if cdsUserPriv.Active then
    cdsUserPriv.Delete;
end;

procedure TUserManageClientDlg.BitBtn8Click(Sender: TObject);
begin
  cdsUserPriv.Cancel;
end;

procedure TUserManageClientDlg.cdsUserPrivBeforePost(DataSet: TDataSet);
var
  mySQL : String;
const
  glSQL  = 'update TB_USER_PRIVILEGE set ZSTYLE=%d,ZSUBSTYLE=%d,ZMODULEID=%d, ' +
           'ZRIGHTMASK=%d where ZID=%d';
  glSQL2 = 'insert TB_USER_PRIVILEGE (ZUSER_ID,ZSTYLE,ZSUBSTYLE,ZMODULEID,ZRIGHTMASK) ' +
           'values(%d,%d,%d,%d,%d)';
begin
  case DataSet.UpdateStatus of
    usUnmodified, usModified:
      begin
        ClientSystem.fDbOpr.BeginTrans;
        try
          mySQL := format(glSQL,[
            DataSet.FieldByName('ZSTYLE').Asinteger,
            DataSet.FieldByName('ZSUBSTYLE').Asinteger,
            DataSet.FieldByName('ZMODULEID').Asinteger,
            DataSet.FieldByName('ZRIGHTMASK').Asinteger,
            DataSet.FieldByName('ZID').Asinteger]);
          ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
          ClientSystem.fDbOpr.CommitTrans;
        except
          ClientSystem.fDbOpr.RollbackTrans;
        end;
      end;
    usInserted:
      begin
        ClientSystem.fDbOpr.BeginTrans;
        try
          mySQL := format(glSQL2,[
            cdsUsers.FieldByName('ZID').Asinteger,
            DataSet.FieldByName('ZSTYLE').Asinteger,
            DataSet.FieldByName('ZSUBSTYLE').Asinteger,
            DataSet.FieldByName('ZMODULEID').Asinteger,
            DataSet.FieldByName('ZRIGHTMASK').Asinteger]);
          ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
          ClientSystem.fDbOpr.CommitTrans;
        except
          ClientSystem.fDbOpr.RollbackTrans;
        end;
      end;
    usDeleted:;
  end;
end;

procedure TUserManageClientDlg.cdsUserPrivBeforeDelete(DataSet: TDataSet);
var
  mySQL : string;
const
  glSQL  = 'delete TB_USER_PRIVILEGE where ZID=%d';
begin
  ClientSystem.fDbOpr.BeginTrans;
  try
    mySQL := format(glSQL,[DataSet.FieldByName('ZID').Asinteger]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
    ClientSystem.fDbOpr.CommitTrans;
  except
    ClientSystem.fDbOpr.RollbackTrans;
  end;
end;

procedure TUserManageClientDlg.actPriv_SaveExecute(Sender: TObject);
begin
  cdsUserPriv.Post;
end;



procedure TUserManageClientDlg.PageControl1Change(Sender: TObject);
var
  mySQL : string;
const
  glSQL  = 'select * from TB_USER_PRIVILEGE where ZUSER_ID=%d';
begin
  mySQL := format(glSQL,[cdsUsers.FieldByName('ZID').Asinteger]);
  cdsUserPriv.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));
end;


procedure TUserManageClientDlg.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := (not cdsUsers.IsEmpty)
  and cdsUsers.FieldByName('ZISLoad').AsBoolean;
end;

procedure TUserManageClientDlg.actUser_RefreshDataExecute(Sender: TObject);
begin
  LoadUser;
end;

procedure TUserManageClientDlg.LoadUser;
var
  i : integer;
  mycds : TClientDataSet;
  myfield : TFieldDef;
  myb : Boolean;
const
  glSQL  ='select * from TB_USER_ITEM';
begin
  //
  ClientSystem.BeginTickCount;
  mycds := TClientDataSet.Create(nil);
  myb := fLoading;
  fLoading := True;
  try
    mycds.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL));
    if cdsUsers.Fields.Count = 0 then
    begin
      with cdsUsers do
      begin
        FieldDefs.Assign(mycds.FieldDefs);
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZISNEW';
        myfield.DataType := ftBoolean;
        myfield := FieldDefs.AddFieldDef;
        myfield.Name :='ZISLoad';
        myfield.DataType := ftBoolean;
       //因为 ZID只读有问题，所以去掉 ,并将自动计算去掉
        for i:=0 to FieldDefs.Count -1 do
        begin
          if faReadonly in FieldDefs[i].Attributes then
            FieldDefs[i].Attributes := FieldDefs[i].Attributes - [faReadonly];
          if FieldDefs[i].DataType = ftAutoInc then
            FieldDefs[i].DataType := ftInteger;
        end;
        CreateDataSet;
      end;
    end
    else begin
      cdsUsers.DisableConstraints;
      try
        while not cdsUsers.IsEmpty do cdsUsers.Delete;
      finally
        cdsUsers.EnableConstraints;
      end;
    end;

    cdsUsers.DisableControls;
    try
      mycds.First;
      while not mycds.Eof do
      begin
        cdsUsers.Append;
        cdsUsers.FieldByName('ZISNEW').AsBoolean  := False;
        cdsUsers.FieldByName('ZISLoad').AsBoolean := True;
        for i:=0 to mycds.FieldDefs.Count -1 do
          cdsUsers.FieldByName(mycds.FieldDefs[i].Name).AsVariant :=
            mycds.FieldByName(mycds.FieldDefs[i].Name).AsVariant;
        cdsUsers.Post;
        mycds.Next;
      end;
      cdsUsers.First;
    finally
      cdsUsers.EnableControls;
    end;

  finally
    mycds.Free;
    fLoading := myb;
    ClientSystem.EndTickCount;
  end;
end;


procedure TUserManageClientDlg.actPriv_CopyByNameExecute(Sender: TObject);
var
  myDataSet : TClientDataSet;
  myStr : string;
const
  glSQLTXT  = 'select * from TB_USER_PRIVILEGE where ZUSER_ID=%d';
  glSQLTXT2 = 'Delete TB_USER_PRIVILEGE where ZUSER_ID=%d';
begin
  with TSelectUsersDlg.Create(nil) do
  try
    if ShowModal= mrok then
    begin
      if lbUserCode.Count > 0 then
      begin
        //ClientSystem.fDbOpr.BeginTrans;
        try
          myStr := Format(glSQLTXT,[StrToInt(lbUserCode.Items[0])]);
          myDataSet := TClientDataSet.Create(nil);
          myDataSet.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(myStr));
          if myDataSet.IsEmpty then Exit;

          //先删除所有的
          //myStr := Format(glSQLTXT2,[cdsUsers.FieldByName('ZID').AsInteger]);
          //ClientSystem.fDbOpr.ExeSQL(PChar(myStr));
          cdsUserPriv.First;
          while cdsUserPriv.RecordCount >0 do
            cdsUserPriv.Delete;


          myDataSet.First;
          while not myDataSet.Eof do
          begin
            cdsUserPriv.Append;
            cdsUserPriv.FieldByName('ZSTYLE').AsInteger     := myDataSet.FieldByName('ZSTYLE').AsInteger;
            cdsUserPriv.FieldByName('ZSUBSTYLE').AsInteger  := myDataSet.FieldByName('ZSUBSTYLE').AsInteger;
            cdsUserPriv.FieldByName('ZMODULEID').AsInteger  := myDataSet.FieldByName('ZMODULEID').AsInteger;
            cdsUserPriv.FieldByName('ZRIGHTMASK').AsInteger := myDataSet.FieldByName('ZRIGHTMASK').AsInteger;
            cdsUserPriv.Post;
            myDataSet.Next;
          end;
          myDataSet.Free;

          //ClientSystem.fDbOpr.CommitTrans;
        except
          //ClientSystem.fDbOpr.RollbackTrans;
        end;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TUserManageClientDlg.actPriv_CopyByNameUpdate(Sender: TObject);
begin
  (Sender As TAction).Enabled := ckEditUserPriv.Checked and
   (not cdsUsers.IsEmpty);
end;

end.
