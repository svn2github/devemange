unit Loginfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TLoginDlg = class(TForm)
    Label1: TLabel;
    cbServerIP: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edName: TEdit;
    edPass: TEdit;
    btOK: TBitBtn;
    btCancel: TBitBtn;
    lbStutas: TLabel;
    Label4: TLabel;
    rbLocal: TRadioButton;
    rbRemoate: TRadioButton;
    procedure btOKClick(Sender: TObject);
    procedure rbLocalClick(Sender: TObject);
    procedure rbRemoateClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadContextByReg();
    procedure SaveContextToReg();
  public
    { Public declarations }
  end;

  function ShowLoginDlg():Boolean;

implementation

uses
  ClinetSystemUnits;

{$R *.dfm}

  function ShowLoginDlg():Boolean;
  begin
    with TLoginDlg.Create(nil) do
    try
      LoadContextByReg;
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
const
  glSQL  = 'select ZTYPE from  TB_USER_ITEM where ZID=%d ';
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

  lbStutas.Caption := '连接服务器...';
  try
    if Pos(':',cbServerIP.Text) > 0 then
    begin
      myhost := Copy(cbServerIP.Text,1,Pos(':',cbServerIP.Text)-1);
      myPost := strtoint(Copy(cbServerIP.Text,Pos(':',cbServerIP.Text)+1,Maxint));
      if rbLocal.Checked then
        ClientSystem.fDbOpr.Connect(0,PChar(myhost),myPost)
      else
        ClientSystem.fDbOpr.Connect(1,PChar(myhost),myPost);
    end
    else
      if rbLocal.Checked then
        ClientSystem.fDbOpr.Connect(0,PChar(cbServerIP.Text),211)
      else
        ClientSystem.fDbOpr.Connect(1,PChar(cbServerIP.Text),211);

    if ClientSystem.fDbOpr.Connected then
    begin
      myid := ClientSystem.fDbOpr.Login(edName.Text,edPass.Text);
      if myid >= 0 then
      begin
        ClientSystem.fEditer_id  := myid;
        ClientSystem.fEditer     := edName.Text;
        ClientSystem.fEditerType := TEditerType(
          ClientSystem.fDbOpr.ReadInt(PChar(format(glSQL,[myid]))));
        if rbLocal.Checked then
          ClientSystem.fHost     := '本地连接'
        else
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
      end;
    end
    else
      lbStutas.Caption := '连接服务器失败。';
  finally

  end;

end;

procedure TLoginDlg.LoadContextByReg;
var
  mysl : TStringList;
  myfilename : String;
  i : integer;
begin
  myfilename := ExtractFileDir(System.ParamStr(0)) + '\host.txt';
  mysl := TStringList.Create;
  if FileExists(myfilename) then
  begin
    mysl.LoadFromFile(myfilename);

    for i:=0 to mysl.Count -1 do
    begin
      if mysl.Names[i] = 'connection' then
      begin
        if mysl.Values['connection'] = '0' then
          rbLocal.Checked := True
        else
          rbRemoate.Checked := True;
        rbLocalClick(nil);
      end
      else
        cbServerIP.Items.Add(mysl[i]);
    end;
    if cbServerIP.Items.Count > 0 then
      cbServerIP.ItemIndex := 0;
  end;
  mysl.Free;
end;

procedure TLoginDlg.SaveContextToReg;
var
  mysl : TStringList;
  myfilename : String;
begin
  myfilename := ExtractFileDir(System.ParamStr(0)) + '\host.txt';
  mysl := TStringList.Create;
  mysl.Assign(cbServerIP.Items);
  if mysl.IndexOf(cbServerIP.Text)<0 then
    mysl.Insert(0,cbServerIP.Text)
  else begin
    mysl.Move(mysl.IndexOf(cbServerIP.Text),0);
  end;

  if rbLocal.Checked then
    mysl.Add('connection=0')
  else
    mysl.Add('connection=1');

  mysl.SaveToFile(myfilename);
  mysl.Free;
end;

procedure TLoginDlg.rbLocalClick(Sender: TObject);
begin
  cbServerIP.Enabled := rbRemoate.Checked;
  if rbRemoate.Checked then
    cbServerIP.Color   := clWindow
  else
    cbServerIP.Color   := clBtnFace;
end;

procedure TLoginDlg.rbRemoateClick(Sender: TObject);
begin
  cbServerIP.Enabled := rbRemoate.Checked;
  if rbRemoate.Checked then
    cbServerIP.Color   := clWindow
  else
    cbServerIP.Color   := clBtnFace;
end;

end.
