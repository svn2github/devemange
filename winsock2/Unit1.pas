unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Sockets, IdTCPServer, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, Menus;

type
  TForm1 = class(TForm)
    idtcpsrvr1: TIdTCPServer;
    grp2: TGroupBox;
    btn2: TButton;
    mmo1: TMemo;
    edt2: TEdit;
    edt3: TEdit;
    btn4: TButton;
    btn7: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    pm1: TPopupMenu;
    N1: TMenuItem;
    edt1: TEdit;
    lbl3: TLabel;
    procedure idtcpsrvr1Connect(AThread: TIdPeerThread);
    procedure btn2Click(Sender: TObject);
    procedure idtcpsrvr1Exception(AThread: TIdPeerThread;
      AException: Exception);
    procedure idtcpsrvr1Execute(AThread: TIdPeerThread);
    procedure idtcpsrvr1Disconnect(AThread: TIdPeerThread);
    procedure btn4Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fPyDir : string; 
  end;

var
  Form1: TForm1;

implementation

uses
  IdSocketHandle,
  WinSock2;
{$R *.dfm}

type

  TCP_KeepAlive = record
    OnOff: Cardinal;
    KeepAliveTime: Cardinal;
    KeepAliveInterval: Cardinal
  end;


function GetShortName( sLongName : string ): string;
var
  sShortName : string;
  nShortNameLen : integer;
begin
  SetLength( sShortName, MAX_PATH );
  nShortNameLen := GetShortPathName(PChar( sLongName ), PChar( sShortName ), MAX_PATH - 1 );
  if( 0 = nShortNameLen )then
  begin
    Result := sLongName;
    Exit;
  end;
  SetLength(sShortName,nShortNameLen);
  Result := sShortName;
end;

Function WinExecExW(cmd,workdir:pchar;visiable:integer):DWORD; 
var 
  StartupInfo:TStartupInfo;
  ProcessInfo:TProcessInformation;
begin
  FillChar(StartupInfo,SizeOf(StartupInfo),#0);
  StartupInfo.cb:=SizeOf(StartupInfo);
  StartupInfo.dwFlags:=STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow:=visiable;
  if not CreateProcess(nil,cmd,nil,nil,false,Create_new_console or
    Normal_priority_class,nil,nil,StartupInfo,ProcessInfo) then
    result:=0
  else
  begin
    waitforsingleobject(processinfo.hProcess,INFINITE);
    GetExitCodeProcess(ProcessInfo.hProcess,Result);
  end;
end;

procedure TForm1.idtcpsrvr1Connect(AThread: TIdPeerThread);
type

  TCP_KeepAlive = record
    OnOff:   Cardinal;
    KeepAliveTime:   Cardinal;
    KeepAliveInterval:   Cardinal
  end;

  var
    Val:   TCP_KeepAlive;
    Ret:   DWord;
  begin
    mmo1.Lines.Add(datetimetostr(now())+ ' 来自主机 '
      + AThread.Connection.Socket.Binding.PeerIP
      + ' 的连接请求已被接纳！');
    Val.OnOff:=1;
    Val.KeepAliveTime:=6000*10;
    Val.KeepAliveInterval:=6000;
    WSAIoctl(AThread.Connection.Socket.Binding.Handle,   IOC_IN   or   IOC_VENDOR   or   4,
          @Val,   SizeOf(Val),   nil,   0,   @Ret,   nil,   nil)
  end;

procedure TForm1.btn2Click(Sender: TObject);
var
  myBind : TIdSocketHandle;
begin
  if idtcpsrvr1.Active then
    idtcpsrvr1.Active := False;

  idtcpsrvr1.Bindings.Clear;
  myBind := idtcpsrvr1.Bindings.Add;
  myBind.IP := edt2.Text;
  myBind.Port := StrToIntdef(edt3.Text,8888);
  idtcpsrvr1.Active := True;
  mmo1.Lines.Add('服务已启动');

end;

procedure TForm1.idtcpsrvr1Exception(AThread: TIdPeerThread;
  AException: Exception);
begin
   mmo1.Lines.Add(datetimetostr(now()) + ' 检测到来自主机 '
   + AThread.Connection.Socket.Binding.PeerIP
   + ' 的连接已中断！');
end;

procedure TForm1.idtcpsrvr1Execute(AThread: TIdPeerThread);
var
  i : integer;
  mycommand : string;
  mysl : TStringList;
  mybat : string;
  mybfile : string;
  cmdcommand : string;
begin
  if not AThread.Terminated and AThread.Connection.Connected then
   begin
      try
        mycommand := AThread.Connection.ReadLnWait(100);
        mmo1.Lines.Add( AThread.Connection.Socket.Binding.PeerIP + ':' +mycommand  );
        case mycommand[1] of
          'A': //取说明
            begin
              mybfile := fPyDir + '\b.txt';
              mysl := TStringList.Create;
              if FileExists(mybfile) then
              begin
                mysl.LoadFromFile(mybfile);
                AThread.Connection.WriteInteger(mysl.Count);
                for i:=mysl.Count-1 downto  0 do
                  AThread.Connection.WriteLn(mysl.Strings[i]);
              end
              else begin
                mmo1.Lines.Add(Format('无法找到编译结果文件 %s，可能还没有编译完，请稍候...',[mybfile]));
                AThread.Connection.WriteInteger(-1);
              end;
              mysl.Free;
            end;
          'C':
            begin

              mybat := Copy(mycommand,2,maxint);
              fPyDir := ExtractFileDir(mybat);
              SetCurrentDir(fPyDir); //设置当前目录
              mybfile := fPyDir + '\b.txt';
              if FileExists(mybfile) then
                DeleteFile(mybfile);

              // winexec('cmd /c c:\python25\python c:\python_svn.py >c:\a.txt',0);
              //如当前位置有dosvn.bat 时，先运行 2012-2-23 作者：龙仕云
              if FileExists(fPyDir+'\dosvn.bat') then
              begin
                WinExecExW(PChar(GetShortName(fPyDir+'\dosvn.bat')),PChar(fPyDir),0)
              end;

              cmdcommand := Format('cmd /c %s %s > %s',[edt1.Text,
                  GetShortName(mybat),GetShortName(mybfile)]);

              //winexec(Pchar(cmdcommand),0);
              mmo1.Lines.Add(datetimetostr(now())+ '执行的代码 ' + cmdcommand);

              //
              //这地方要等待编译，可能会死锁掉
              //
              if WinExecExW(PChar(cmdcommand),PChar(fPyDir),0)<>0 then
              begin
                //
                // 经以前的用过程中,b.txt 可能锁了,产生的问题
                //
                mybfile := fPyDir + '\b1.txt';
                cmdcommand := Format('cmd /c %s %s > %s',[edt1.Text,
                  GetShortName(mybat),GetShortName(mybfile)]);
                mmo1.Lines.Add(cmdcommand);
                if WinExecExW(PChar(cmdcommand),PChar(fPyDir),0)<>0 then
                  AThread.Connection.WriteLn('编译进度出错...');
              end
              else
                AThread.Connection.WriteLn('编译完成。');

            end;
        end;
      except
      end;
   end;
end;

procedure TForm1.idtcpsrvr1Disconnect(AThread: TIdPeerThread);
begin
  mmo1.Lines.Add(datetimetostr(now()) + ' 自主机 '
   + AThread.Connection.Socket.Binding.PeerIP
   + ' 的连接已中断！');
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
  if idtcpsrvr1.Active then
    idtcpsrvr1.Active := False;
  mmo1.Lines.Add('服务已关闭');
end;

procedure TForm1.btn7Click(Sender: TObject);
begin
  mmo1.Lines.Clear;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if idtcpsrvr1.Active then
    idtcpsrvr1.Active := False;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  btn2Click(nil);
end;

end.
