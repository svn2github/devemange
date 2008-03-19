///////////////////////////////////////////////////////////////////////////////
//
// 接口的定义实现内容
// 创建日期:2007-11-1 作者:龙仕云
// 版本: 1.0.0 
//
//
//
//
///////////////////////////////////////////////////////////////////////////////
unit DbApiImpl;

interface
uses
  Classes,DBClient,SysUtils,
  MConnect,SConnect,
  DBSocketConnection,
  DbApiIntf;

type

  TBfssDBOpr = class(TInterfacedObject, IDbOperator)
  private
    fLogFile:textfile;

    function GetRemoteServer: TCustomRemoteServer;
    procedure SendData(const Data: IDataBlock);
    procedure ReceiveData(const Data: IDataBlock);
    procedure WriteLog(AStr:String);

  private
    fDOMServer    : TDCOMConnection;
    fSocketServer : TBffsSocketConnection;
    fcdsQuery     : TClientDataSet;
    fConnectStype : TConnectStype;

    property RemoteServer : TCustomRemoteServer read GetRemoteServer;


  public
    constructor Create();
    destructor Destroy; override;

    //1.连接数据库
    function Connect(AConnStype:word;const AHost: PChar;const APort: Word = 0): Boolean; stdcall;
    function DisConnect(): Boolean; stdcall;
    function ReConnect(): Boolean; stdcall;
    //2.交易控制
    procedure BeginTrans; stdcall;
    procedure CommitTrans; stdcall;
    procedure RollbackTrans; stdcall;

    //3.执行SQL 语句
    function ExeSQL(const SqlStr: PChar): Boolean; stdcall;
    function ReadInt(const SqlStr: PChar): Integer; stdcall;
    function ReadRecord(const SqlStr: PChar): OleVariant; stdcall;
    function ReadDataSet(const SqlStr: PChar): OleVariant; stdcall;
    function ReadVariant(const SqlStr: PChar): OleVariant; stdcall;
    function ReadRecordCount(const SqlStr: PChar): Integer; stdcall;
    function ReadBlob(const SqlStr: PChar; var Buf; Len: Integer): Integer; stdcall;
    function RefreshData(const AData: TClientDataSet; const SqlStr: PChar): Boolean; stdcall;
    procedure DoExecute(ASqlStr:WideString;AParams: OleVariant); stdcall;

    //4.AppServer 接口
    function Login(const AName: WideString; const APass: WideString):integer;stdcall;
    function CopyFile(AFile_ID: Integer; AVer: Integer; ATree_ID: Integer): Integer; safecall;
    function DeleteFile(AFile_ID: Integer): Integer; safecall;
    function UpFileChunk(AFile_ID: Integer; AVer: Integer; AGroupID: Integer; AStream: OleVariant): Integer; safecall;
    procedure MailTo(AStyle: Integer; const AMails: WideString; AContextID: Integer); safecall;

    //5.属性
    function Connected(): Boolean; stdcall;
    function Version : integer;stdcall;
    function AppServer : Variant; stdcall;


  end;

var
  CurrentDBOpr : TBfssDBOpr;

  function CreateBfssDBOpr(): IDbOperator; stdcall;

implementation

  function CreateBfssDBOpr(): IDbOperator;
  begin
    if not Assigned(CurrentDBOpr) then
      CurrentDBOpr := TBfssDBOpr.Create;
    Result := CurrentDBOpr;
  end;

  //写日志



{ TBfssDBOpr }

function TBfssDBOpr.AppServer: Variant;
begin
  if RemoteServer.Connected then
    Result := RemoteServer.AppServer;
end;

procedure TBfssDBOpr.BeginTrans;
begin
  if RemoteServer.Connected then
    RemoteServer.AppServer.BeginTrans;
end;

procedure TBfssDBOpr.CommitTrans;
begin
  if RemoteServer.Connected then
    RemoteServer.AppServer.CommitTrans;
end;

function TBfssDBOpr.Connect(AConnStype:word;const AHost: PChar; const APort: Word): Boolean;
begin
  fConnectStype := TConnectStype(AConnStype);
  if RemoteServer.Connected then
    RemoteServer.Connected := False;

  if Self.fConnectStype = csDCOM then
  begin

    with  RemoteServer as TDCOMConnection do
    begin
      ServerName :=  AHost;
      ServerGUID := '{B4AA6BE1-5DEF-431A-AFA0-F1262EDB4C5A}';
      ServerName := 'BFSS.BFSSRDM';
      Connected  := True;
      if Connected then
        WriteLog('DCOM 连接成功。')
      else
        WriteLog('DCOM 连接失败。');
    end;
  end
  else begin
    with RemoteServer as TBffsSocketConnection do
    begin
      Host := AHost;
      Port := APort;
      ServerGUID    := '{B4AA6BE1-5DEF-431A-AFA0-F1262EDB4C5A}';
      Connected  := True;
      if Connected then
        WriteLog('Sokcet 连接成功。')
      else
        WriteLog('Sokcet 连接失败。');
    end;
  end;
  fcdsQuery.RemoteServer := RemoteServer;
  Result := RemoteServer.Connected;
end;

function TBfssDBOpr.Connected: Boolean;
begin
  Result := RemoteServer.Connected;
end;

function TBfssDBOpr.CopyFile(AFile_ID, AVer, ATree_ID: Integer): Integer;
begin
  Result := -1;
  if RemoteServer.Connected then
    Result := RemoteServer.AppServer.CopyFile(AFile_ID,AVer,ATree_ID);
end;

constructor TBfssDBOpr.Create();
var
  mylogfile : string;
begin
  fDOMServer    := TDCOMConnection.Create(nil);
  fSocketServer := TBffsSocketConnection.Create(nil);
  fSocketServer.SendDataEvent := SendData;
  fSocketServer.ReceiveDataEvent := ReceiveData;

  fcdsQuery := TClientDataSet.Create(nil);
  fConnectStype := csSocket;

  //日志
  mylogfile := ExtractFileDir(System.ParamStr(0)) +
    format('\Log\DBApi_%s.log',[formatdatetime('yyyy-mm-dd',now())]);
  AssignFile(fLogFile,mylogfile);
  if not FileExists(mylogfile) then
    Rewrite(fLogfile)
  else
    Reset(flogfile);
end;

function TBfssDBOpr.DeleteFile(AFile_ID: Integer): Integer;
begin
  Result := -1;
  if RemoteServer.Connected then
    Result := RemoteServer.AppServer.DeleteFile(AFile_ID);
end;

destructor TBfssDBOpr.Destroy;
begin
  if fcdsQuery.Active then
    fcdsQuery.Close;
  fcdsQuery.Free;
  if RemoteServer.Connected then
    RemoteServer.Connected := False;
  fDOMServer.Free;
  fSocketServer.Free;
  Closefile(fLogFile);  //关闭日志
  inherited;
end;

function TBfssDBOpr.DisConnect: Boolean;
begin
  RemoteServer.Connected := False;
  Result := not RemoteServer.Connected;
end;

procedure TBfssDBOpr.DoExecute(ASqlStr:WideString;AParams: OleVariant);
var
  OwnerData: OleVariant;
begin
  if not RemoteServer.Connected then Exit;
  with  RemoteServer do
  begin
    AppServer.AS_Execute(AppServer.GetDSPName,
      ASqlStr,AParams, OwnerData);
  end;
end;

function TBfssDBOpr.ExeSQL(const SqlStr: PChar): Boolean;
begin
  Result := False;
  if not RemoteServer.Connected then Exit;
  try
    fcdsQuery.Close;
    fcdsQuery.ProviderName := RemoteServer.AppServer.GetDSPName;
    fcdsQuery.CommandText := SqlStr;
    fcdsQuery.Execute;
    fcdsQuery.Close;
  except
    Exit;
  end;
  Result := True;
end;


function TBfssDBOpr.GetRemoteServer: TCustomRemoteServer;
begin
  if fConnectStype = csDCOM then
    Result := fDOMServer
  else
    Result := fSocketServer;
end;

function TBfssDBOpr.Login(const AName, APass: WideString):integer;
begin
  Result := RemoteServer.AppServer.Login(AName,APass);
end;

procedure TBfssDBOpr.MailTo(AStyle: Integer; const AMails: WideString;
  AContextID: Integer);
begin
  RemoteServer.AppServer.MailTo(AStyle,AMails,AContextID);
end;

function TBfssDBOpr.ReadBlob(const SqlStr: PChar; var Buf;
  Len: Integer): Integer;
begin
  Result := -1;
end;

function TBfssDBOpr.ReadDataSet(const SqlStr: PChar): OleVariant;
begin
  if not RemoteServer.Connected then Exit;
  fcdsQuery.Close;
  fcdsQuery.ProviderName := RemoteServer.AppServer.GetDSPName;
  WriteLog(fcdsQuery.ProviderName);
  fcdsQuery.CommandText := SqlStr;
  fcdsQuery.Open;
  Result := fcdsQuery.Data;
  fcdsQuery.Close;
end;

function TBfssDBOpr.ReadInt(const SqlStr: PChar): Integer;
begin
  Result := -1;
  if not RemoteServer.Connected then Exit;
  fcdsQuery.Close;
  fcdsQuery.ProviderName := RemoteServer.AppServer.GetDSPName;
  fcdsQuery.CommandText := SqlStr;
  fcdsQuery.Open;
  if fcdsQuery.Fields.Count > 0 then
    Result := fcdsQuery.Fields[0].Value;
  fcdsQuery.Close;
end;

function TBfssDBOpr.ReadRecord(const SqlStr: PChar): OleVariant;
begin

end;

function TBfssDBOpr.ReadRecordCount(const SqlStr: PChar): Integer;
begin
  Result := 0;
  if not RemoteServer.Connected then Exit;
  fcdsQuery.Close;
  fcdsQuery.ProviderName := RemoteServer.AppServer.GetDSPName;
  fcdsQuery.CommandText := SqlStr;
  fcdsQuery.Open;
  Result := fcdsQuery.RecordCount;
  fcdsQuery.Close;
end;

function TBfssDBOpr.ReadVariant(const SqlStr: PChar): OleVariant;
begin

end;

procedure TBfssDBOpr.ReceiveData(const Data: IDataBlock);
begin
  WriteLog('接收='+inttostr(Data.Size));
end;

function TBfssDBOpr.ReConnect: Boolean;
begin
  RemoteServer.Connected := False;
  RemoteServer.Connected := True;
  Result := RemoteServer.Connected;
end;

function TBfssDBOpr.RefreshData(const AData: TClientDataSet;
  const SqlStr: PChar): Boolean;
begin
   Result := False;
end;

procedure TBfssDBOpr.RollbackTrans;
begin
  if RemoteServer.Connected then
    RemoteServer.AppServer.RollbackTrans;
end;

procedure TBfssDBOpr.SendData(const Data: IDataBlock);
begin
  WriteLog('发送='+inttostr(Data.Size));
end;

function TBfssDBOpr.UpFileChunk(AFile_ID, AVer, AGroupID: Integer;
  AStream: OleVariant): Integer;
begin
  Result := -1;
  if RemoteServer.Connected then
    Result := RemoteServer.AppServer.UpFileChunk(AFile_ID,AVer,AGroupID,AStream);
end;

function TBfssDBOpr.Version: integer;
begin
  Result := cnCurDbOprVersion;
end;

procedure TBfssDBOpr.WriteLog(AStr: String);
var
  mystr : string;
begin
  mystr := format('%s %s',[
    formatdatetime('yyyy-dd-mm hh:mm:ss',now()),AStr]);
  Append(fLogFile);
  writeln(fLogFile,mystr);
  Flush(fLogFile);
end;

initialization
  CurrentDBOpr := nil;
finalization

end.
