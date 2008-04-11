///////////////////////////////////////////////////////
//
// 开发项目管理 
// 创建时间:2007-11-19
// 作者: mrlong  web: http://devemange.googlecode.com
//
// 主窗口
//
//
//
// 修改:
//   增加只有管理员才能进入用户管理 2007-12-18
//
//
///////////////////////////////////////////////////////
unit Mainfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ToolWin, ComCtrls, Menus, ExtCtrls,
  DBApiIntf,
  ClientTypeUnits,
  BaseChildfrm, ImgList, StdCtrls, Buttons, AppEvnts, DB, DBClient;

type
  TMainDlg = class(TForm)
    ActionList1: TActionList;
    plForm: TPanel;
    actmod_Files: TAction;
    ImageList1: TImageList;
    actMod_Bug: TAction;
    actMod_Project: TAction;
    actManage_User: TAction;
    CoolBar1: TCoolBar;
    ToolBarmain: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    MainMenu1: TMainMenu;
    f1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Bug1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    plupgrade: TPanel;
    Label1: TLabel;
    btbnUpgrade: TBitBtn;
    btbnNoUpgrade: TBitBtn;
    Label2: TLabel;
    StatusBarMain: TStatusBar;
    ApplicationEvents1: TApplicationEvents;
    btbnCancelUp: TBitBtn;
    actMod_ProDoc: TAction;
    N5: TMenuItem;
    ToolButton4: TToolButton;
    actFile_Close: TAction;
    N6: TMenuItem;
    actFile_TodaySay: TAction;
    N7: TMenuItem;
    actFile_ChangPasswd: TAction;
    N8: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure actmod_FilesExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actMod_BugExecute(Sender: TObject);
    procedure actMod_ProjectExecute(Sender: TObject);
    procedure actManage_UserExecute(Sender: TObject);
    procedure btbnNoUpgradeClick(Sender: TObject);
    procedure StatusBarMainResize(Sender: TObject);
    procedure StatusBarMainDrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure ApplicationEvents1Hint(Sender: TObject);
    procedure btbnCancelUpClick(Sender: TObject);
    procedure actMod_ProDocExecute(Sender: TObject);
    procedure actFile_CloseExecute(Sender: TObject);
    procedure actFile_TodaySayExecute(Sender: TObject);
    procedure actFile_ChangPasswdExecute(Sender: TObject);
  private
    fChildform : TList; //所有子窗口的对象
    fCurrentChildform : TBaseChildDlg;

    procedure iniform;
    procedure freeform;
    procedure DoChangeClient(NewClient: TBaseChildClass);
    procedure ShowStatusBarText(AStr:String);
    procedure DelTempfile(); //删除临时文件
    procedure WMTickCount (var Msg: TMessage); message gcMSG_TickCount;

  public
    property CurrentChildform : TBaseChildDlg read fCurrentChildform;
  end;


var
  MainDlg: TMainDlg;

implementation
uses
  ClinetSystemUnits,
  DelTempFilefrm,          {删除临时文件}
  FileMangeClientUnits,    {文件管理}
  BugManageClientfrm,      {BUG管理}
  ProjectManageClientfrm,  {项目管理}
  UserManageClientfrm,     {用户管理}
  DesignDocumentClientfrm, {项目文档}
  WriteToDaySayfrm,        {每日一句}
  ChangPasswdfrm           {修改密码}

  ;

{$R *.dfm}


{ TMainDlg }

procedure TMainDlg.DoChangeClient(NewClient: TBaseChildClass);
var
  i : integer;
  myoldform : TBaseChildDlg;
  myBaseform,myform : TBaseChildDlg;
begin
  myBaseform := nil;
  //1.是否已存在了
  for i:=0 to fChildform.Count -1 do
  begin
    myform := fChildform.items[i];
    if myform is NewClient then
    begin
      myBaseform :=fChildform.items[i];
      break;
    end;
  end;

  if not Assigned(myBaseform) then
  begin
    myBaseform := NewClient.Create(nil);
    myBaseform.initBase;
    fChildform.Add(myBaseform);
  end;
  myoldform := fCurrentChildform;
  fCurrentChildform := myBaseform;
  fCurrentChildform.BorderStyle := bsNone;
  fCurrentChildform.Align := alClient;
  fCurrentChildform.Parent := plForm;
  fCurrentChildform.Show;
  myBaseform.Showfrm;
  Caption := Application.Title + '('+ ClientSystem.fHost + ')-' + fCurrentChildform.Caption;
  if Assigned(myoldform) then
    myoldform.Closefrm;
    
  //改变输入焦点
  ActiveControl := FindNextControl(ActiveControl, True, True, False);
end;

procedure TMainDlg.freeform;
var
  i : integer;
  myform : TBaseChildDlg;
begin
  DelTempfile; //删除临时文件
  for i:=0 to fChildform.Count -1 do
  begin
    myform :=fChildform.items[i];
    myform.freeBase;
    myform.Free;
  end;
  fChildform.Free;
  ClientSystem.fGauge.Parent := nil;
end;

procedure TMainDlg.iniform;
var
  mycds : TClientDataSet;
const
  glSQL = 'select ZNAME from TB_TODAYSAY ' +
          'where ZID=(select max(ZID) from TB_TODAYSAY where ZSTOP=0)';
begin
  if ClientSystem.fDbOpr.Version < cnCurDbOprVersion then
  begin
    MessageBox(Handle,'BfssDBOpr.dll版本太低，不能运行。',
      '错误',MB_ICONERROR+MB_OK);
    Exit;
  end;
  fChildform := TList.Create;
  StatusBarMain.Panels[1].Text := ' 用户=' + ClientSystem.fEditer;

  //每日一句
  mycds := TClientDataSet.Create(nil);
  try
    mycds.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL));
    if mycds.RecordCount > 0 then
      plForm.Caption := mycds.FieldByName('ZNAME').AsString
    else
      plForm.Caption := '';

  finally
    mycds.Free;
  end;

  //版本检查
  

end;

procedure TMainDlg.FormCreate(Sender: TObject);
begin
  iniform;
end;

procedure TMainDlg.actmod_FilesExecute(Sender: TObject);
begin
  DoChangeClient(TFileManageDlg);
end;

procedure TMainDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  freeform;
end;

procedure TMainDlg.actMod_BugExecute(Sender: TObject);
begin
  DoChangeClient(TBugManageDlg);
end;

procedure TMainDlg.actMod_ProjectExecute(Sender: TObject);
begin
  DoChangeClient(TProjectManageClientDlg);
end;

procedure TMainDlg.actManage_UserExecute(Sender: TObject);
begin
  if ClientSystem.fEditerType = etAdmin then
    DoChangeClient(TUserManageClientDlg)
  else
    MessageBox(Handle,'无权限','提示',MB_ICONWARNING+MB_OK);
end;

procedure TMainDlg.btbnNoUpgradeClick(Sender: TObject);
begin
  plupgrade.Visible := False;
end;

procedure TMainDlg.StatusBarMainResize(Sender: TObject);
var
  i : integer;
  w : integer;
begin
  w := 0;
  for i:= 0 to StatusBarMain.Panels.Count -1 do
  begin
    w := w + StatusBarMain.Panels[i].Width;
  end;
  StatusBarMain.Panels[5].Width := StatusBarMain.Panels[5].Width +
   (StatusBarMain.Width - w-5);
end;

procedure TMainDlg.StatusBarMainDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  with btbnCancelUp do
  begin
    Parent   :=   StatusBar;
    Left     :=   Rect.Right-width;
    Top      :=   Rect.Top ;
    Height   :=   Rect.Bottom - Rect.Top ;
    Visible  :=   True;
  end;
  with ClientSystem.fGauge do
  begin
    Parent   :=   StatusBar;
    Left     :=   Rect.Left;
    Top      :=   Rect.Top ;
    Width    :=   Panel.Width-btbnCancelUp.Width;
    Height   :=   Rect.Bottom - Rect.Top ;
    Visible  :=   True;
  end;
end;

procedure TMainDlg.ApplicationEvents1Hint(Sender: TObject);
begin
  ShowStatusBarText(Application.Hint);
end;

procedure TMainDlg.ShowStatusBarText(AStr: String);
begin
  StatusBarMain.Panels[0].Text := AStr;
end;

procedure TMainDlg.DelTempfile;
var
  i : integer;
begin
  if ClientSystem.fDeleteFiles.Count > 0 then
  begin
    with TDelTempFileDlg.Create(Application) do
    try
      clbfiles.Items.Assign(ClientSystem.fDeleteFiles);
      for i:=0 to clbfiles.Count -1 do
        clbfiles.Checked[i] := True;
      if ShowModal = mrOK then
      begin
        while clbfiles.Count > 0 do
        begin
          if (clbfiles.Checked[0]) and FileExists(clbfiles.Items[0]) then
          begin
            //将只读转化为读写
            SetFileAttributes(pchar(clbfiles.Items[0]),
              FILE_SHARE_WRITE );
            Deletefile(clbfiles.Items[0]);
          end;
          clbfiles.Items.Delete(0);
        end;
      end;
    finally
      free;
    end;
  end;
end;

procedure TMainDlg.WMTickCount(var Msg: TMessage);
begin
  StatusBarMain.Panels[4].Text :=
    floattostr(Msg.WParam/ 1000)+ 's';
end;

procedure TMainDlg.btbnCancelUpClick(Sender: TObject);
begin
  ClientSystem.fCancelUpFile := True;
end;

procedure TMainDlg.actMod_ProDocExecute(Sender: TObject);
begin
  DoChangeClient(TDesignDocumentClientDlg);
end;

procedure TMainDlg.actFile_CloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainDlg.actFile_TodaySayExecute(Sender: TObject);
var
  myfrom : TWriteToDaySayDlg;
begin
  //权限
  if ClientSystem.fEditerType <> etAdmin then
  begin
    MessageBox(Handle,'无权限','提示',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  myfrom := TWriteToDaySayDlg.Create(nil);
  try

    if myfrom.ShowModal=mrOK then
    begin

    end;
  finally
    myfrom.Free;
  end;



end;

procedure TMainDlg.actFile_ChangPasswdExecute(Sender: TObject);
var
  mysql : string;
const
  glSQL = 'update TB_USER_ITEM set ZPASS=''%s'' where ZID=%d';
begin
  //
  with TChangPasswdDlg.Create(nil) do
  try

    if ShowModal = mrOk then
    begin
      if edPasswd1.Text = '' then
      begin
        MessageBox(Handle,'密码不能为空','提示',MB_ICONWARNING+MB_OK);
        Exit;
      end;

      if edPasswd1.Text <> edPasswd2.Text then
      begin
        MessageBox(Handle,'两次密码不一样','提示',MB_ICONWARNING+MB_OK);
        Exit;
      end;

      //执行修改密码
      mysql := format(glSql,[edPasswd1.Text, ClientSystem.fEditer_id]);
      if not ClientSystem.fDbOpr.ExeSQL(PChar(mysql)) then
      begin
        MessageBox(Handle,'修改密码出错异常错误','提示',MB_ICONERROR+MB_OK);
        Exit;
      end
      else begin
        MessageBox(Handle,'修改密码成功','提示',MB_OK);
      end;
    end;

  finally
    free;
  end;
end;

end.
