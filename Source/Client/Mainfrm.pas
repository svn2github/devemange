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
    btnMod_Demand: TToolButton;
    actFile_Close: TAction;
    N6: TMenuItem;
    actFile_TodaySay: TAction;
    N7: TMenuItem;
    actFile_ChangPasswd: TAction;
    N8: TMenuItem;
    actMod_WebBrowes: TAction;
    btnMod_WebBrowes: TToolButton;
    actFile_SysParams: TAction;
    N9: TMenuItem;
    actMod_Stat: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    actTool_CheckFileContext: TAction;
    N12: TMenuItem;
    btnMod_ProductDown: TToolButton;
    actMod_ProductDown: TAction;
    Wiki1: TMenuItem;
    N13: TMenuItem;
    actMod_Test: TAction;
    btnMod_Test: TToolButton;
    actCalendar: TAction;
    actMod_PLAN: TAction;
    btnMod_PLAN: TToolButton;
    N14: TMenuItem;
    N15: TMenuItem;
    actMod_Ant: TAction;
    N16: TMenuItem;
    btnMod_Ant: TToolButton;
    actMod_Dayworktable: TAction;
    btnMod_Dayworktable: TToolButton;
    N17: TMenuItem;
    actMod_Release: TAction;
    btnMod_Release: TToolButton;
    N18: TMenuItem;
    actPw_GetPw: TAction;
    P1: TMenuItem;
    N19: TMenuItem;
    actwork_overtime: TAction;
    N20: TMenuItem;
    actMod_Demand: TAction;
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
    procedure actMod_WebBrowesExecute(Sender: TObject);
    procedure actFile_SysParamsExecute(Sender: TObject);
    procedure actMod_StatExecute(Sender: TObject);
    procedure actTool_CheckFileContextExecute(Sender: TObject);
    procedure actMod_ProductDownExecute(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure actMod_TestExecute(Sender: TObject);
    procedure actCalendarExecute(Sender: TObject);
    procedure actMod_PLANExecute(Sender: TObject);
    procedure actMod_AntExecute(Sender: TObject);
    procedure actMod_DayworktableExecute(Sender: TObject);
    procedure actMod_ReleaseExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actPw_GetPwExecute(Sender: TObject);
    procedure actwork_overtimeExecute(Sender: TObject);
    procedure actMod_DemandExecute(Sender: TObject);
  private
    fChildform : TList; //所有子窗口的对象
    fCurrentChildform : TBaseChildDlg;

    procedure iniform;
    procedure freeform;
    procedure DoChangeClient(NewClient: TBaseChildClass);
    procedure ShowStatusBarText(AStr:String);
    procedure DelTempfile(); //删除临时文件
    procedure WMTickCount (var Msg: TMessage); message gcMSG_TickCount;
    procedure WMShowBugItem(var msg:TMessage); message gcMSG_GetBugItem;
    procedure WMShowTestItem(var msg:TMessage); message gcMSG_GetTestItem;
    procedure WMShowTestItemCode(var msg:TMessage); message gcMSG_GetTestItemByCode;
    procedure WMShowReleaseItem(var msg:TMessage);message gcMSG_GetReleaseItem;
    procedure WMShowPlanItem(var msg:TMessage); message gcMSG_GetPlanItem;
    procedure WMShowDemandItem(var msg:TMessage); message gcMSG_GetDemandItem;

  public
    property CurrentChildform : TBaseChildDlg read fCurrentChildform;
  end;


var
  MainDlg: TMainDlg;

implementation
uses
  ActiveX,
  TimeEncrypt,
  ClinetSystemUnits,
  DelTempFilefrm,          {删除临时文件}
  FileMangeClientUnits,    {文件管理}
  BugManageClientfrm,      {BUG管理}
  ProjectManageClientfrm,  {项目管理}
  UserManageClientfrm,     {用户管理}
  DesignDocumentClientfrm, {项目文档}
  StatManageClientfrm,     {统计}
  WikiClientfrm,           {wiki}
  ProductDownLoadClientfrm,{产品池}
  WriteToDaySayfrm,        {每日一句}
  ChangPasswdfrm,          {修改密码}
  CnProgressFrm ,
  CalendarChildfrm,        {开发计划表}
  TestManageClient,        {测试管理}
  PlanManageClientfrm,     {项目计划}
  AntManageClientfrm,      {自动构建}
  DayWorktableManageClientfrm, {我的工作台}
  ReleaseManageClientfrm,  {发布管理}
  WorkOverTimeClientfrm,   {加班单}
  DemandClientfrm,         {需求管理}
  WebClientfrm

  , SetSysParamsfrm;

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

  myBaseform.ShowProgress('打开...',0);

  if not Assigned(myBaseform) then
  begin
    myBaseform := NewClient.Create(nil);
    myBaseform.initBase;
    fChildform.Add(myBaseform);
  end;

  try
    myoldform := fCurrentChildform;
    fCurrentChildform := myBaseform;
    fCurrentChildform.BorderStyle := bsNone;
    fCurrentChildform.Align := alClient;
    fCurrentChildform.Parent := plForm;
    fCurrentChildform.Show;
    myBaseform.Showfrm;
    with ClientSystem do
      Caption := Format('%s 版本=%d.%d.%d(build%d) IP=%s -%s',
        [Application.Title,fVer[0],fVer[1],fVer[2],fVer[3],ClientSystem.fHost,
        fCurrentChildform.Caption]);
    if Assigned(myoldform) then
      myoldform.Closefrm;
  finally
    myBaseform.HideProgress;
  end;

  //改变输入焦点
  ActiveControl := FindNextControl(ActiveControl, True, True, False);
end;

procedure TMainDlg.freeform;
var
  i : integer;
  myform : TBaseChildDlg;
begin
  DelTempfile; //删除临时文件
  fCurrentChildform := nil;
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

  with ClientSystem do
    Caption := Format('%s 版本=%d.%d.%d(build%d)',
        [Application.Title,fVer[0],fVer[1],fVer[2],fVer[3]]);

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

      if Length(edPasswd1.Text) < 6 then
      begin
        MessageBox(Handle,'密码必须大于5位','提示',MB_ICONWARNING+MB_OK);
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
        ClientSystem.fEditer_mm := edPasswd1.Text;
      end;
    end;

  finally
    free;
  end;
end;

procedure TMainDlg.actMod_WebBrowesExecute(Sender: TObject);
begin
  DoChangeClient(TWikiClientDlg);
end;

procedure TMainDlg.actFile_SysParamsExecute(Sender: TObject);
begin
  //权限
  if ClientSystem.fEditerType <> etAdmin then
  begin
    MessageBox(Handle,'无权限','提示',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  with TSetParamsDlg.Create(nil) do
  try
    ShowModal;                                  
  finally
    Free;
  end;
end;

procedure TMainDlg.actMod_StatExecute(Sender: TObject);
begin
  DoChangeClient(TStatManageClientDlg);
end;

procedure TMainDlg.actTool_CheckFileContextExecute(Sender: TObject);
var
  myfid : integer;
  myfcid : integer;
  mySQL : string;
const
  glSQL1 = 'select max(ZID) from TB_FILE_ITEM';
  glSQL2 = 'select max(ZFILE_ID) from TB_FILE_CONTEXT';
  glSQL3 = 'delete TB_FILE_CONTEXT where ZFILE_ID=%d';
begin
  //
  CnProgressFrm.ShowProgress('检查修复...',0);
  try

    myfid := ClientSystem.fDbOpr.ReadInt(glSQL1);
    myfcid := ClientSystem.fDbOpr.ReadInt(glSQL2);
    if myfcid > myfid then
    begin
      CnProgressFrm.HideProgress;
      if MessageBox(Handle,'发现文件的确无法上传,是否要修复?','修复',
        MB_ICONQUESTION+MB_YESNO)=IDNO then Exit;
      CnProgressFrm.ShowProgress('修复中...',0);

      mySQL := format(glSQL3,[myfcid]);
      ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
    end
    else begin
      CnProgressFrm.HideProgress;
      MessageBox(Handle,'检查完成,没有发现问题','修复',
        MB_USERICON+MB_OK);
    end;

  finally
    CnProgressFrm.HideProgress;
  end;
end;

procedure TMainDlg.actMod_ProductDownExecute(Sender: TObject);
begin
  DoChangeClient(TProductDownLoadClientDlg);
end;

procedure TMainDlg.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
var
  iOIPAO  :   IOleInPlaceActiveObject;
  Dispatch:   IDispatch;
  mouse   :   TPoint;
  mywebform :  TWebClientDlg;
const
  DialogKeys : set of Byte =
    [VK_LEFT,VK_RIGHT,VK_BACK,$30..$39,   $41..$5A];
begin

  if not Assigned(fCurrentChildform) then Exit;
  if not (fCurrentChildform is TWebClientDlg) then Exit;
  mywebform := fCurrentChildform as TWebClientDlg;
  
  //1.去掉右键
  if (Msg.Message = WM_RBUTTONDOWN) or
     (Msg.Message = WM_RBUTTONDBLCLK) then
  begin
    if IsChild(mywebform.wbwiki.Handle, Msg.hwnd) then
    begin
      getcursorpos(Mouse);
      mywebform.pmWbCommand.popup(Mouse.x,Mouse.y);
      Handled := True;
      Exit;
    end;
  end;

  //2编辑回车换行功能
  Handled := IsDialogMessage(mywebform.wbwiki.Handle,Msg);
  if (Handled)and (not mywebform.wbwiki.Busy)then
  begin
    if  mywebform.OleInPlaceActiveObject = nil then
    begin
      Dispatch := mywebform.wbwiki.Application;
      if Dispatch<>nil then
      begin
        Dispatch.QueryInterface(IOleInPlaceActiveObject,iOIPAO);
        if iOIPAO <> nil then
          mywebform.OleInPlaceActiveObject := iOIPAO;
      end;
    end;

    if mywebform.OleInPlaceActiveObject <> nil then
    begin
      if ((Msg.message = WM_KEYDOWN) or (Msg.message = WM_KEYUP))and
          (Msg.wParam in DialogKeys)  then
          //   nothing   -   do   not   pass   on   the   DialogKeys
        else
          mywebform.OleInPlaceActiveObject.TranslateAccelerator(Msg);
    end;
  end;
  
end;

procedure TMainDlg.actMod_TestExecute(Sender: TObject);
begin
  DoChangeClient(TTestManageChildfrm);
end;

procedure TMainDlg.WMShowBugItem(var msg: TMessage);
var
  myBaseform,myform : TBaseChildDlg;
  i : Integer;
begin
  DoChangeClient(TBugManageDlg);

  myBaseform := nil;
  for i:=0 to fChildform.Count -1 do
  begin
    myform := fChildform.items[i];
    if myform is TBugManageDlg then
    begin
      myBaseform :=fChildform.items[i];
      break;
    end;
  end;

  if Assigned(myBaseform) then
  begin
    SendMessage(myBaseform.Handle,gcMSG_GetBugItem,msg.WParam,msg.LParam);
  end;

end;

procedure TMainDlg.actCalendarExecute(Sender: TObject);
begin
  DoChangeClient(TCalendarChildDlg);
end;

procedure TMainDlg.actMod_PLANExecute(Sender: TObject);
begin
  if ClientSystem.fEditerType in [etAdmin,etDeve,etTest] then
    DoChangeClient(TPlanManageClientDlg)
  else
    MessageBox(Handle,'你没有权限','提示',MB_ICONWARNING+MB_OK);
end;

procedure TMainDlg.actMod_AntExecute(Sender: TObject);
begin
  if ClientSystem.fEditerType in [etAdmin,etDeve,etTest] then
    DoChangeClient(TAntManageClientDlg)
  else
    MessageBox(Handle,'你没有权限','提示',MB_ICONWARNING+MB_OK);
end;

procedure TMainDlg.actMod_DayworktableExecute(Sender: TObject);
begin
  DoChangeClient(TDayWorktableManageClientDlg);
end;

procedure TMainDlg.WMShowTestItem(var msg: TMessage);
var
  myBaseform,myform : TBaseChildDlg;
  i : Integer;
begin
  DoChangeClient(TTestManageChildfrm);

  myBaseform := nil;
  for i:=0 to fChildform.Count -1 do
  begin
    myform := fChildform.items[i];
    if myform is TTestManageChildfrm then
    begin
      myBaseform :=fChildform.items[i];
      break;
    end;
  end;

  if Assigned(myBaseform) then
  begin
    SendMessage(myBaseform.Handle,gcMSG_GetTestItem,msg.WParam,msg.LParam);
  end;

end;

procedure TMainDlg.actMod_ReleaseExecute(Sender: TObject);
begin
  DoChangeClient(TReleaseManageClientDlg);
end;

procedure TMainDlg.WMShowReleaseItem(var msg: TMessage);
var
  myBaseform,myform : TBaseChildDlg;
  i : Integer;
begin
  DoChangeClient(TReleaseManageClientDlg);

  myBaseform := nil;
  for i:=0 to fChildform.Count -1 do
  begin
    myform := fChildform.items[i];
    if myform is TReleaseManageClientDlg then
    begin
      myBaseform :=fChildform.items[i];
      break;
    end;
  end;

  if Assigned(myBaseform) then
  begin
    SendMessage(myBaseform.Handle,gcMSG_GetReleaseItem,msg.WParam,msg.LParam);
  end;

end;

procedure TMainDlg.WMShowTestItemCode(var msg: TMessage);
var
  myBaseform,myform : TBaseChildDlg;
  i : Integer;
begin
  DoChangeClient(TTestManageChildfrm);

  myBaseform := nil;
  for i:=0 to fChildform.Count -1 do
  begin
    myform := fChildform.items[i];
    if myform is TTestManageChildfrm then
    begin
      myBaseform :=fChildform.items[i];
      break;
    end;
  end;

  if Assigned(myBaseform) then
  begin
    SendMessage(myBaseform.Handle,gcMSG_GetTestItemByCode,
      msg.WParam,msg.LParam);
  end;

end;

procedure TMainDlg.WMShowPlanItem(var msg: TMessage);
var
  myBaseform,myform : TBaseChildDlg;
  i : Integer;
begin
  DoChangeClient(TPlanManageClientDlg);

  myBaseform := nil;
  for i:=0 to fChildform.Count -1 do
  begin
    myform := fChildform.items[i];
    if myform is TPlanManageClientDlg then
    begin
      myBaseform :=fChildform.items[i];
      break;
    end;
  end;

  if Assigned(myBaseform) then
  begin
    SendMessage(myBaseform.Handle,gcMSG_GetPlanItem,msg.WParam,msg.LParam);
  end;

end;

procedure TMainDlg.FormShow(Sender: TObject);
var
  c : integer;
begin
  c := 1;
  while ClientSystem.fEditer_mm = '123456' do
  begin
    if c >3 then
    begin
      Application.Terminate;
      break;
    end;
    actFile_ChangPasswd.Execute;
    inc(c);
  end;
end;

procedure TMainDlg.actPw_GetPwExecute(Sender: TObject);
var
  mypw : string;
  mydatetime : TDateTime;
begin
  mydatetime := ClientSystem.fDbOpr.GetSysDateTime;
  mypw := EncryptString(PChar(FormatDateTime('yyyy-mm-dd',mydatetime)),'');
  InputBox('获取密码','密码',mypw);
end;

procedure TMainDlg.actwork_overtimeExecute(Sender: TObject);
begin
  DoChangeClient(TWorkOverTimeClient);
end;

procedure TMainDlg.actMod_DemandExecute(Sender: TObject);
begin
  DoChangeClient(TDemandClientDlg);
end;

procedure TMainDlg.WMShowDemandItem(var msg: TMessage);
var
  myBaseform,myform : TBaseChildDlg;
  i : Integer;
begin
  DoChangeClient(TDemandClientDlg);

  myBaseform := nil;
  for i:=0 to fChildform.Count -1 do
  begin
    myform := fChildform.items[i];
    if myform is TDemandClientDlg then
    begin
      myBaseform :=fChildform.items[i];
      break;
    end;
  end;

  if Assigned(myBaseform) then
  begin
    SendMessage(myBaseform.Handle,gcMSG_GetDemandItem,msg.WParam,msg.LParam);
  end;

end;

end.
