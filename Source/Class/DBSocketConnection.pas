///////////////////////////////////////////////////////////////////////////////
//  自定义一个SocketConnection的连接
//  创建日期: 2007-11-5 作者:龙仕云
//
//  采用第三方库 ZLib
//
//  目前只能采用TCP方式进行，以后有必要可以增加UCP的方式。
//
//
// 因小于100字节的量比较多,所以小于100或等于100的内容不处理
//
//
///////////////////////////////////////////////////////////////////////////////
unit DBSocketConnection;

interface
uses
  Classes,SConnect,ScktComp,WinSock;
type

  TSendDataEvent = procedure(const Data: IDataBlock) of Object;
  TReceiveDataEvent = procedure(const Data: IDataBlock) of Object;

  TBffsSocketConnection = class;

//-------------------------
// 数据发送与接收
//-------------------------
  TDBSocketTransport = class(TInterfacedObject, ITransport)
  private
    fOwner : TBffsSocketConnection;
    FEvent: THandle;
    FAddress: string;
    FHost: string;
    FPort: Integer;
    FClientSocket: TClientSocket;
    FSocket: TCustomWinSocket;
  protected
    procedure InterceptIncoming(const Data: IDataBlock);virtual;  //接收
    procedure InterceptOutgoing(const Data: IDataBlock);virtual;  //发送
    { ITransport }
    function GetWaitEvent: THandle; stdcall;
    function GetConnected: Boolean; stdcall;
    procedure SetConnected(Value: Boolean); stdcall;
    function Receive(WaitForInput: Boolean; Context: Integer): IDataBlock; stdcall;
    function Send(const Data: IDataBlock): Integer; stdcall;
  public
    constructor Create;
    destructor Destroy; override;
    property Host: string read FHost write FHost;
    property Address: string read FAddress write FAddress;
    property Port: Integer read FPort write FPort;
    property Socket: TCustomWinSocket read FSocket write FSocket;
  end;

//-------------------------
// Socket连接
//-------------------------
  TBffsSocketConnection = Class(TStreamedConnection)
  private
    FPort: Integer;
    FHost: string;
    FAddress: string;
    fSendDataEvent : TSendDataEvent;
    fReceiveDataEvent : TReceiveDataEvent;

    function IsAddressStored: Boolean;
    function IsHostStored: Boolean;
    procedure SetAddress(const Value: string);
    procedure SetHost(const Value: string);
  protected
    function CreateTransport: ITransport; override;
    procedure DoConnect; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Address: string read FAddress write SetAddress stored IsAddressStored;
    property Host: string read FHost write SetHost stored IsHostStored;
    property Port: Integer read FPort write FPort default 211;
    property SupportCallbacks;
    property ObjectBroker;
    property SendDataEvent :TSendDataEvent read fSendDataEvent write fSendDataEvent;
    property ReceiveDataEvent : TReceiveDataEvent read fReceiveDataEvent write fReceiveDataEvent;
  end;


implementation
uses
  ZLibEx,
  SysUtils;

resourcestring
  SNoWinSock2        = 'WinSock 2 必须安装，才能进行 Socket连接。';
  SNoAddress         = '无效的服务器地址。';
  SSocketReadError   = '从Socket读取数据出错。';
  SInvalidDataPacket = '无效的数据包。';

  procedure CheckSignature(Sig: Integer);
  begin
    if (Sig and $FF00 <> CallSig) and
       (Sig and $FF00 <> ResultSig) then
      raise Exception.CreateRes(@SInvalidDataPacket);
  end;

  {
    解压数据包
  }
  procedure DataIn(const Data: IDataBlock);
  var
    Size: Integer;
    InStream, OutStream: TMemoryStream;
    ZStream: TZDecompressionStream;
    p: Pointer;
  begin
    InStream := TMemoryStream.Create;
    try
      p := Pointer(Integer(Data.Memory) + Data.BytesReserved);
      Size := PInteger(p)^;
      if Size = 0 then Exit;
      p := Pointer(Integer(p) + SizeOf(Size));
      InStream.Write(p^, Data.Size - SizeOf(Size));
      OutStream := TMemoryStream.Create;
      try
        InStream.Position := 0;
        ZStream := TZDecompressionStream.Create(InStream);
        try
          OutStream.CopyFrom(ZStream, Size);
        finally
          ZStream.Free;
        end;
        Data.Clear;
        Data.Write(OutStream.Memory^, OutStream.Size);
      finally
        OutStream.Free;
      end;
    finally
      InStream.Free;
    end;
  end;

  {
    压缩数据包
  }
  procedure DataOut(const Data: IDataBlock);
  var
    InStream, OutStream: TMemoryStream;
    ZStream: TZCompressionStream;
    Size: Integer;
  begin
    InStream := TMemoryStream.Create;
    try
      InStream.Write(Pointer(Integer(Data.Memory) + Data.BytesReserved)^, Data.Size);
      Size := InStream.Size;
      if Size = 0 then Exit;
      OutStream := TMemoryStream.Create;
      try
        ZStream := TZCompressionStream.Create(OutStream,zcFastest);
        try
          ZStream.CopyFrom(InStream, 0);
        finally
          ZStream.Free;
        end;
        Data.Clear;
        Data.Write(Size, SizeOf(Integer));
        Data.Write(OutStream.Memory^, OutStream.Size);
      finally
        OutStream.Free;
      end;
    finally
      InStream.Free;
    end;
  end;
             
{ TBffsSocketConnection }

constructor TBffsSocketConnection.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPort := 211;
end;

function TBffsSocketConnection.CreateTransport: ITransport;
var
  SocketTransport: TDBSocketTransport;
begin
  if SupportCallbacks then
    if not LoadWinSock2 then raise Exception.CreateRes(@SNoWinSock2);
  if (FAddress = '') and (FHost = '') then
    raise ESocketConnectionError.CreateRes(@SNoAddress);

  SocketTransport := TDBSocketTransport.Create;
  SocketTransport.Host := FHost;
  SocketTransport.Address := FAddress;
  SocketTransport.Port := FPort;
  SocketTransport.fOwner := Self;
  Result := SocketTransport as ITransport;
end;

procedure TBffsSocketConnection.DoConnect;
var
  Comp: string;
  p, i: Integer;
begin
  if (ObjectBroker <> nil) then
  begin
    repeat
      if FAddress <> '' then
        Comp := FAddress else
      if FHost <> '' then
        Comp := FHost else
      if ServerGUID <> '' then
        Comp := ObjectBroker.GetComputerForGUID(GetServerCLSID) else
        Comp := ObjectBroker.GetComputerForProgID(ServerName);
      try
        p := ObjectBroker.GetPortForComputer(Comp);
        if p > 0 then
          FPort := p;
        p := 0;
        for i := 1 to Length(Comp) do
          if (Comp[i] in ['0'..'9', '.']) then
            Inc(p, Ord(Comp[i] = '.')) else
            break;
        if p <> 3 then
          Host := Comp else
          Address := Comp;
        inherited DoConnect;
        ObjectBroker.SetConnectStatus(Comp, True);
      except
        ObjectBroker.SetConnectStatus(Comp, False);
        FAddress := '';
        FHost := '';
      end;
    until Connected;
  end else
    inherited DoConnect;
end;


function TBffsSocketConnection.IsAddressStored: Boolean;
begin
  Result := (ObjectBroker = nil) and (Address <> '');  
end;

function TBffsSocketConnection.IsHostStored: Boolean;
begin
  Result := (ObjectBroker = nil) and (Host <> '');
end;

procedure TBffsSocketConnection.SetAddress(const Value: string);
begin
  if Value <> '' then
    FHost := '';
  FAddress := Value;
end;

procedure TBffsSocketConnection.SetHost(const Value: string);
begin
  if Value <> '' then
    FAddress := '';
  FHost := Value;
end;

{ TBfssSocketTransport }

constructor TDBSocketTransport.Create;
begin
  inherited Create;
  FEvent := 0;
end;

destructor TDBSocketTransport.Destroy;
begin
  SetConnected(False);
  inherited Destroy;
end;

function TDBSocketTransport.GetConnected: Boolean;
begin
  Result := (FSocket <> nil) and (FSocket.Connected);
end;

function TDBSocketTransport.GetWaitEvent: THandle;
begin
  FEvent := WSACreateEvent;
  WSAEventSelect(FSocket.SocketHandle, FEvent, FD_READ or FD_CLOSE);
  Result := FEvent;
end;

procedure TDBSocketTransport.InterceptIncoming(const Data: IDataBlock);
begin
  if Assigned(fOwner.fReceiveDataEvent) then
    fOwner.fReceiveDataEvent(Data);
  DataIn(Data);
end;

procedure TDBSocketTransport.InterceptOutgoing(const Data: IDataBlock);
begin
  DataOut(Data);
  if Assigned(fOwner.fSendDataEvent) then
    fOwner.fSendDataEvent(Data);
end;

function TDBSocketTransport.Receive(WaitForInput: Boolean;
  Context: Integer): IDataBlock;
var
  RetLen, Sig, StreamLen: Integer;
  P: Pointer;
  FDSet: TFDSet;
  TimeVal: PTimeVal;
  RetVal: Integer;
begin
  Result := nil;
  TimeVal := nil;
  FD_ZERO(FDSet);
  FD_SET(FSocket.SocketHandle, FDSet);
  if not WaitForInput then
  begin
    New(TimeVal);
    TimeVal.tv_sec := 0;
    TimeVal.tv_usec := 1;
  end;
  RetVal := select(0, @FDSet, nil, nil, TimeVal);
  if Assigned(TimeVal) then
    FreeMem(TimeVal);
  if RetVal = SOCKET_ERROR then
    raise ESocketConnectionError.Create(SysErrorMessage(WSAGetLastError));
  if (RetVal = 0) then Exit;
  RetLen := FSocket.ReceiveBuf(Sig, SizeOf(Sig));
  if RetLen <> SizeOf(Sig) then
    raise ESocketConnectionError.CreateRes(@SSocketReadError);
  CheckSignature(Sig);
  RetLen := FSocket.ReceiveBuf(StreamLen, SizeOf(StreamLen));
  if RetLen = 0 then
    raise ESocketConnectionError.CreateRes(@SSocketReadError);
  if RetLen <> SizeOf(StreamLen) then
    raise ESocketConnectionError.CreateRes(@SSocketReadError);
  Result := TDataBlock.Create as IDataBlock;
  Result.Size := StreamLen;
  Result.Signature := Sig;
  P := Result.Memory;
  Inc(Integer(P), Result.BytesReserved);
  while StreamLen > 0 do
  begin
    RetLen := FSocket.ReceiveBuf(P^, StreamLen);
    if RetLen = 0 then
      raise ESocketConnectionError.CreateRes(@SSocketReadError);
    if RetLen > 0 then
    begin
      Dec(StreamLen, RetLen);
      Inc(Integer(P), RetLen);
    end;
  end;
  if StreamLen <> 0 then
    raise ESocketConnectionError.CreateRes(@SInvalidDataPacket);
  InterceptIncoming(Result);
end;


function TDBSocketTransport.Send(const Data: IDataBlock): Integer;
var
  P: Pointer;
begin
  Result := 0;
  InterceptOutgoing(Data);
  P := Data.Memory;
  FSocket.SendBuf(P^, Data.Size + Data.BytesReserved);
end;

procedure TDBSocketTransport.SetConnected(Value: Boolean);
begin
  if GetConnected = Value then Exit;
  if Value then
  begin
    if (FAddress = '') and (FHost = '') then
      raise ESocketConnectionError.CreateRes(@SNoAddress);
    FClientSocket := TClientSocket.Create(nil);
    FClientSocket.ClientType := ctBlocking;
    FSocket := FClientSocket.Socket;
    FClientSocket.Port := FPort;
    if FAddress <> '' then
      FClientSocket.Address := FAddress else
      FClientSocket.Host := FHost;
    FClientSocket.Open;
  end else
  begin
    FSocket.Close;
    FClientSocket.Free;
    if FEvent <> 0 then WSACloseEvent(FEvent);
  end;
end;

end.
