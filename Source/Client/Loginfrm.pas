///////////////////////////////////////////////////////////////////////////////
//
//    用户登录
//
//  修改:
//     1. 增加了对保存当前的用户名 2008-3-26
//
//
///////////////////////////////////////////////////////////////////////////////
unit Loginfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg;

type
  TLoginDlg = class(TForm)
    lbStutas: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    cbServerIP: TComboBox;
    Label4: TLabel;
    edName: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edPass: TEdit;
    btOK: TBitBtn;
    btCancel: TBitBtn;
    pnlImage: TPanel;
    imgLogin: TImage;
    imgDef: TImage;
    procedure btOKClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadContextByReg();
    procedure SaveContextToReg();
    procedure LoadLoginImage();    //加载启动的图片

  public
    { Public declarations }
  end;

  function ShowLoginDlg():Boolean;

implementation

uses
  ClinetSystemUnits,DBClient,IniFiles;

{$R *.dfm}

  function ShowLoginDlg():Boolean;
  begin
    with TLoginDlg.Create(nil) do
    try
      with ClientSystem do
        Caption := Format('登录 版本=%d.%d.%d(build%d)',
        [fVer[0],fVer[1],fVer[2],fVer[3]]);
      LoadContextByReg;
      LoadLoginImage;

      Result := ShowModal = mrOK;
      if Result then  SaveContextToReg;
    finally
      free;
    end;
  end;


procedure TLoginDlg.btOKClick(Sender: TObject);
var
  myid : integer;
  myhost : String;
  myPost : integer;
  mycds  : TClientDataSet;
const
  glSQL  = 'select ZTYPE,ZCHECKTASK from  TB_USER_ITEM where ZID=%d ';
begin
  //
  // 合法性处理
  //
  if cbServerIP.Text = '' then
  begin
    MessageBox(Handle,'请输入服务器IP','提示',MB_ICONWARNING+MB_OK);
    Exit;
  end;
  if edName.Text = '' then
  begin
    MessageBox(Handle,'请输入用户名','提示',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  lbStutas.Font.Color := clblue;
  lbStutas.Caption := '连接服务器...';
  try
    if Pos(':',cbServerIP.Text) > 0 then
    begin
      myhost := Copy(cbServerIP.Text,1,Pos(':',cbServerIP.Text)-1);
      myPost := strtoint(Copy(cbServerIP.Text,Pos(':',cbServerIP.Text)+1,Maxint));
      ClientSystem.fDbOpr.Connect(1,PChar(myhost),myPost);
    end
    else
      ClientSystem.fDbOpr.Connect(1,PChar(cbServerIP.Text),211);

    if ClientSystem.fDbOpr.Connected then
    begin
      myid := ClientSystem.fDbOpr.Login(edName.Text,edPass.Text);
      if myid >= 0 then
      begin
        mycds  := TClientDataSet.Create(nil);
        ClientSystem.fEditer_id  := myid;
        ClientSystem.fEditer     := edName.Text;
        ClientSystem.fEditer_mm  := edPass.text;
        mycds.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(format(glSQL,[myid])));
        ClientSystem.fEditer_CheckTask :=mycds.FieldByName('ZCHECKTASK').AsBoolean;
        ClientSystem.fEditerType := TEditerType(
          mycds.FieldByName('ZTYPE').AsInteger);
        mycds.Free;
        ClientSystem.fHost       := cbServerIP.Text;
        ClientSystem.GetUserPriv; //取出用户的权限
        ModalResult := mrOK;
      end
      else begin
        lbStutas.Visible := True;
        if myid = -2 then
          lbStutas.Caption := '用户被禁用。'
        else
          lbStutas.Caption := '用户或密码错误。';
        lbStutas.Font.Color := clred;
      end;
    end
    else begin
      lbStutas.Caption := '连接服务器失败。';
      lbStutas.Font.Color := clred;
    end;
  finally

  end;

end;

procedure TLoginDlg.LoadContextByReg;
var
  myini : TIniFile;
  mysl : TStringList;
  myfilename : String;
  i : integer;
begin
  myfilename := ClientSystem.fAppDir + '\deve.ini';

  myini := TIniFile.Create(myfilename);
  mysl  := TStringList.Create;
  if FileExists(myfilename) then
  begin
    myini.ReadSection('login',mysl);
    for i:=0 to mysl.Count -1 do
    begin
      if mysl.Strings[i] <> 'user' then
        cbServerIP.Items.Add(mysl[i]);
    end;
    if cbServerIP.Items.Count > 0 then
      cbServerIP.ItemIndex := 0;
    edName.Text := myini.ReadString('login','user','');
  end;
  mysl.Free;
  myini.Free;
end;

procedure TLoginDlg.LoadLoginImage;
var
  myfilename : string;
begin
  //1.没有，则去掉图片
  if ClientSystem.fLoginImageIndex = -1 then
  begin
    imgLogin.Picture.Assign(imgDef.Picture);
  end
  else begin
    myfilename := ClientSystem.LoginImageFileName;
    if FileExists(myfilename) then
      imgLogin.Picture.LoadFromFile(myfilename)
    else
      imgLogin.Picture.Assign(imgDef.Picture);
  end;
end;

procedure TLoginDlg.SaveContextToReg;
var
  mysl : TStringList;
  myini : TIniFile;
  myfilename : String;
  i : Integer;
begin
  myfilename := ClientSystem.fAppDir + '\deve.ini';
  mysl := TStringList.Create;
  myini := TIniFile.Create(myfilename);

  myini.ReadSection('login',mysl);
  for i:=0 to mysl.Count -1 do
    myini.DeleteKey('login',mysl.Strings[i]);

  mysl.Assign(cbServerIP.Items);
  if mysl.IndexOf(cbServerIP.Text)<0 then
    mysl.Insert(0,cbServerIP.Text)
  else begin
    mysl.Move(mysl.IndexOf(cbServerIP.Text),0);
  end;

  for i:=0 to mysl.Count -1 do
    myini.WriteString('login',mysl.Strings[i],'');

  myini.WriteString('login','user',edName.Text);

  myini.Free;
  mysl.Free;
end;

end.
