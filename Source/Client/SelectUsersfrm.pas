unit SelectUsersfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, StdCtrls, Buttons, Grids, DBGrids,DB, DBClient;

type
  TSelectUsersDlg = class(TBaseDialog)
    DBGrid1: TDBGrid;
    lbUsers: TListBox;
    btbnAdd: TBitBtn;
    btbnDel: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lbUserCode: TListBox;
    lstSelectSelf: TListBox;
    btnAddBySelf: TBitBtn;
    btn2: TBitBtn;
    lblSelectSelfUser: TLabel;
    btnDelSelfSelect: TBitBtn;
    lbl2: TLabel;
    lbl3: TLabel;
    procedure btbnAddClick(Sender: TObject);
    procedure btbnDelClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure lbUsersDblClick(Sender: TObject);
    procedure btnAddBySelfClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnDelSelfSelectClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure lstSelectSelfDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure init();
    procedure freedlg();
  public
    { Public declarations }
  end;


  function ShowSelectSingleUser(var AUserID:Integer;var AUserName:string):Boolean;
  function SetSelfSelectUser():Boolean; //设置我的常用联系人。



implementation

uses DmUints,ClinetSystemUnits;



{$R *.dfm}

function ShowSelectSingleUser(var AUserID:Integer;var AUserName:string):Boolean;
var
  myDlg : TSelectUsersDlg;
begin
  myDlg := TSelectUsersDlg.Create(nil);
  try
    if AUserName <> '' then
    begin
      myDlg.lbUsers.Items.Add(AUserName);
      myDlg.lbUserCode.Items.Add(IntToStr(AUserID));
    end;

    myDlg.DBGrid1.DataSource := DM.dsUsers;
    Result := (myDlg.ShowModal = mrOk) and (myDlg.lbUsers.Count>0) ;
    if Result then
    begin
      AUserName := myDlg.lbUsers.Items[0];
      AUserID := StrToIntDef(myDlg.lbUserCode.Items[0],-1);
    end;
  finally
    myDlg.Free;
  end;
end;

function SetSelfSelectUser():Boolean; //设置我的常用联系人。
var
  myDlg : TSelectUsersDlg;
begin
  myDlg := TSelectUsersDlg.Create(nil);
  try
    myDlg.Caption := '设置经常联系人，可以在选择人员更新快捷，在【工具】菜单下。';
    myDlg.DBGrid1.DataSource := DM.dsUsers;
    myDlg.lstSelectSelf.Left := myDlg.lbUsers.Left;
    myDlg.btnDelSelfSelect.Left := myDlg.lbUsers.Left;
    myDlg.lblSelectSelfUser.Left := myDlg.lbUsers.Left;
    myDlg.lbl2.Visible := False;
    myDlg.btbnAdd.Visible := False;
    myDlg.btbnDel.Visible := False;
    myDlg.btnAddBySelf.Visible := False;
    myDlg.Width := myDlg.Width - myDlg.lstSelectSelf.Width;
    Result := (myDlg.ShowModal = mrOk);
  finally
    myDlg.Free;
  end;
end;

procedure TSelectUsersDlg.btbnAddClick(Sender: TObject);
var
  mycds : TDataSet;
begin
  with DM do
  begin
    mycds := DBGrid1.dataSource.DataSet;
    if mycds.IsEmpty then Exit;

    if lbUsers.Items.IndexOf(mycds.FieldByName('ZNAME').AsString) >=0 Then Exit;
    lbUsers.Items.Add(mycds.FieldByName('ZNAME').AsString);
    lbUserCode.Items.Add(mycds.FieldByName('ZID').AsString);
  end;
end;

procedure TSelectUsersDlg.btbnDelClick(Sender: TObject);
var
  myindex : integer;
begin
  myindex := lbUsers.ItemIndex;
  if myindex >=0 then
  begin
    lbUsers.Items.Delete(myindex);
    lbUserCode.Items.Delete(myindex);
  end;
end;

procedure TSelectUsersDlg.DBGrid1DblClick(Sender: TObject);
begin
  btbnAddClick(nil);
end;

procedure TSelectUsersDlg.lbUsersDblClick(Sender: TObject);
begin
  btbnDelClick(nil);
end;

procedure TSelectUsersDlg.btnAddBySelfClick(Sender: TObject);
var
  myname : string;
  myid : string;
  mystr : string;
begin
  if lstSelectSelf.ItemIndex >=0 then
  begin
    mystr := lstSelectSelf.Items[lstSelectSelf.ItemIndex];
    myname := Copy(mystr,1,Pos('(',mystr)-1);
    myid   := Copy(mystr,Pos('(',mystr)+1,Pos(')',mystr)-Pos('(',mystr)-1);
    if lbUsers.Items.IndexOf(myname) < 0 then
    begin
      lbUsers.Items.Add(myname);
      lbUserCode.Items.Add(myid);
    end;
  end;
end;

procedure TSelectUsersDlg.init;
var
  myfilename : string;
begin
  myfilename := ClientSystem.fAppDir  + '/' + gc_selectuser_file;
  if FileExists(myfilename) then
  begin
    lstSelectSelf.Items.LoadFromFile(myfilename);
  end;
end;

procedure TSelectUsersDlg.FormShow(Sender: TObject);
begin
  inherited;
  init();
end;

procedure TSelectUsersDlg.freedlg;
var
  myfilename : string;
begin
  myfilename := ClientSystem.fAppDir  + '/' + gc_selectuser_file;
  lstSelectSelf.Items.SaveToFile(myfilename);
end;

procedure TSelectUsersDlg.FormDestroy(Sender: TObject);
begin
  inherited;
  freedlg();
end;

procedure TSelectUsersDlg.btnDelSelfSelectClick(Sender: TObject);
begin
  if lstSelectSelf.ItemIndex >=0 then
  begin
    lstSelectSelf.Items.Delete(lstSelectSelf.ItemIndex);
  end;
end;

procedure TSelectUsersDlg.btn2Click(Sender: TObject);
var
  mycds : TDataSet;
  myName : string;
begin
  with DM do
  begin
    mycds := DBGrid1.dataSource.DataSet;
    if mycds.IsEmpty then Exit;

    myName := Format('%s(%d)',[mycds.FieldByName('ZNAME').AsString,
      mycds.FieldByName('ZID').AsInteger]);

    if lstSelectSelf.Items.IndexOf(myName) >=0 then Exit;

    lstSelectSelf.Items.Add(myName);

  end;
end;


procedure TSelectUsersDlg.lstSelectSelfDblClick(Sender: TObject);
begin
  //
  btnAddBySelfClick(nil);
end;

end.
