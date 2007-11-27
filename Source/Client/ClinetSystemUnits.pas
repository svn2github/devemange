unit ClinetSystemUnits;

interface
uses
  Classes,SysUtils,Windows,
  ClientTypeUnits,Gauges,
  DBApiIntf,DBClient;

type
  TClinetSystem = Class(TObject)
  public
    fAppDir : String;
    fDbOpr  : IDbOperator;        //数据接口处理
    fEditer_id : integer;         //用户的id号
    fEditer : String;             //用户名
    fHost   : String;             //服务器名
    fcdsUsePriv : TClientDataSet; //用户权限表
    fGauge  : TGauge;

    constructor Create;
    destructor Destroy; override;

    procedure GetUserPriv(); //取出用户的权限
    function HasModuleAction(AStype:integer;ASubStype:integer;AID:integer;AAction:TActionType):Boolean;      //操作权限

    //文件的上传与下载
    function UpFile(AFile_ID,AVer:integer;AfileName:String):Boolean; //上传文件
    function DonwFileToFileName(Afile_id,Aver:integer;AfileName:String):Boolean; //保存到文件
    procedure OleVariantToStream(var Input: OleVariant; Stream: TStream);
    function StreamToOleVariant(Stream: TStream; Count: Integer): OleVariant;
  end;

var
  ClientSystem : TClinetSystem;

implementation
uses
  DB,
  Variants,
  ZLibEx;

  function CreateBfssDBOpr():IDbOperator; stdcall;
    external 'DBApi.dll';

type
   TByteArray = array of byte;

{ TClinetSystem }

constructor TClinetSystem.Create;
begin
  fDbOpr := CreateBfssDBOpr();
  fAppDir := ExtractFileDir(System.ParamStr(0));
  fcdsUsePriv := TClientDataSet.Create(nil);
  fEditer_id := -1;
  fGauge  := TGauge.Create(nil);
end;

destructor TClinetSystem.Destroy;
begin
  fcdsUsePriv.Free;
  fDbOpr := nil;
  fGauge.Free;
  inherited;
end;

function TClinetSystem.DonwFileToFileName(Afile_id, Aver: integer;
  AfileName: String): Boolean;
var
  myfileStream: TMemoryStream;
  myStream,OutStream : TMemoryStream;
  myfilename : String;
  ZStream : TZDecompressionStream;
  mycds : TClientDataSet;
const
  glSQL = 'Select ZSTREAM from TB_FILE_CONTEXT ' +
          ' where ZFILE_ID=%d and ZVer=%d Order by ZGROUPID';
begin
  myfilename := AfileName;
  mycds := TClientDataSet.Create(nil);
  try
    mycds.Data := ClientSystem.fDBOpr.ReadDataSet(pChar(format(glSQL,[Afile_id,Aver])));
    myfileStream := TMemoryStream.Create;
    OutStream    := TMemoryStream.Create;
    fGauge.Progress := 0;
    fGauge.MaxValue := mycds.RecordCount;
    try
      while not mycds.Eof do
      begin
        myStream :=  TMemoryStream.Create;
        //TBlobField(cdsQuery.FieldByName('ZSTREAM')).SaveToStream(myStream);
        //myStream := StrToStream(Base64ToStr(cdsQuery.FieldByName('ZSTREAM').AsString));
        (mycds.FieldByName('ZSTREAM') as TBlobField).SaveToStream(myStream);
        myStream.Position := 0;
        myfileStream.CopyFrom(myStream,myStream.Size);
        freeandnil(myStream);
        mycds.Next;
        fGauge.Progress := fGauge.Progress + 1;
      end;

      //解压
      myfileStream.Position := 0;
      ZStream := TZDecompressionStream.Create(myfileStream);
      try
        OutStream.CopyFrom(ZStream, ZStream.Size);
      finally
        ZStream.Free;
      end;
      OutStream.Position := 0;
      OutStream.SaveToFile(myfilename);
    finally
      myfileStream.Free;
      OutStream.Free;
    end;
  finally
    mycds.Free;
  end;
  Result := True;
end;


procedure TClinetSystem.GetUserPriv;
const
  glSQL = 'select ZSTYLE,ZMODULEID,ZRIGHTMASK from TB_USER_PRIVILEGE ' +
          'where ZUSER_ID=%d';
begin
  if fEditer_id <0 then Exit;
  fcdsUsePriv.data := fDBOpr.ReadDataSet(PChar(format(glSQL,[fEditer_id])));
end;

function TClinetSystem.HasModuleAction(AStype: integer;ASubStype:integer; AID: integer;
  AAction: TActionType): Boolean;
var
  myc : integer;
begin
  //
  // 反向权限,如是有权限,则是说明这个模板
  //  对这个人要处理的.
  //
  //
  if ClientSystem.fEditer_id < 0 then
  begin
    Result := False;
    Exit;
  end;

  Result := True;
  fcdsUsePriv.First;
  myc := 0;
  while not fcdsUsePriv.Eof do
  begin
    if (fcdsUsePriv.FieldByName('ZSTYLE').AsInteger = AStype) and
       (fcdsUsePriv.FieldByName('ZSUBSTYLE').AsInteger = ASubStype) and
       (fcdsUsePriv.FieldByName('ZMODULEID').AsInteger = AID) then
    begin
      case AAction of
        atView:   myc := gcActionView;
        atUpdate: myc := gcActionUpdate;
        atInsert: myc := acActionInsert;
        atDelete: myc := acActionDelete;
      end;

      Result := fcdsUsePriv.FieldByName('ZRIGHTMASK').AsInteger and myc = myc;
      break;
    end;
    fcdsUsePriv.Next;
  end;
end;

procedure TClinetSystem.OleVariantToStream(var Input: OleVariant;
  Stream: TStream);
var
  pBuf: Pointer;
begin
  pBuf := VarArrayLock(Input);
  Stream.Write(TByteArray(pBuf^), Length(TByteArray(Input)));
  VarArrayUnlock(Input);
end;



function TClinetSystem.StreamToOleVariant(Stream: TStream;
  Count: Integer): OleVariant;
var
  pBuf: Pointer;
begin
  Result := VarArrayCreate([0, Count-1], varByte);
  pBuf := VarArrayLock(Result);
  Stream.Read(TByteArray(pBuf^), Length(TByteArray(Result)));
  VarArrayUnlock(Result);
end;


function TClinetSystem.UpFile(AFile_ID, AVer: integer;
  AfileName: String): Boolean;
var
  count,c,i : integer;
  myStream,myms : TMemoryStream;
  OutStream : TMemoryStream;
  ZStream: TZCompressionStream;
  myData : OleVariant;
  
const
  glSQL = 'insert into TB_FILE_CONTEXT (ZFILE_ID,ZGROUPID,ZVER,ZSTREAM)  ' +
          'values(%d,%d,%d,:myStream)';
  glBackSize = 10240*5; //5k
begin
  myStream := TMemoryStream.Create;
  OutStream := TMemoryStream.Create;
  try
    myStream.LoadFromFile(AfileName);
    //压缩
    ZStream := TZCompressionStream.Create(OutStream,zcFastest);
    try
      ZStream.CopyFrom(myStream, 0);
    finally
      ZStream.Free;
    end;

    OutStream.Position := 0;
    count := OutStream.Size div glBackSize; //一次保存1024个字节
    fGauge.Progress := 0;
    if OutStream.Size mod glBackSize > 0 then
      fGauge.MaxValue := count +1
    else
      fGauge.MaxValue := count;
    c := 0;
    for i:=0 to count -1 do
    begin
      //Application.ProcessMessages;
      myms := TMemoryStream.Create;
      myms.CopyFrom(OutStream,glBackSize);
      myms.Position := 0;
      try
        {
        cdsQuery.Close;
        cdsQuery.Params.Clear;
        //cdsQuery.Params.CreateParam(ftString,'myStream',ptInput);
        //cdsQuery.Params.ParamByName('myStream').AsBlob := StrToBase64(StreamToStr(myms));  //LoadFromStream(myms,ftBlob);
        cdsQuery.Params.CreateParam(ftBlob,'myStream',ptInput);
        cdsQuery.Params.ParamByName('myStream').LoadFromStream(myms,ftBlob);  //LoadFromStream(myms,ftBlob);
        cdsQuery.CommandText := format(glSQL,[AFile_ID,c,AVer]);
        fDBOpr.DoExecute(cdsQuery.CommandText ,PackageParams(cdsQuery.Params));
        }
        myData := StreamToOleVariant(myms,myms.Size);
        if ClientSystem.fDBOpr.UpFileChunk(AFile_ID,AVer,c,myData) <0 then
        begin
          Result := False;
          Exit;
        end;

      except
        Result := False;
        Exit;
      end;

      inc(c);
      freeandnil(myms);
      fGauge.Progress := c;
    end;

    if (OutStream.Size mod glBackSize) >0 then
    begin
      myms := TMemoryStream.Create;
      myms.CopyFrom(OutStream,OutStream.Size mod glBackSize);
      myms.Position :=0;
      try
      {
        cdsQuery.Close;
        cdsQuery.Params.Clear;
        cdsQuery.Params.CreateParam(ftString,'myStream',ptInput);
        cdsQuery.params.findparam('myStream').AsString := StrToBase64(StreamToStr(myms));//oadFromStream(myms,ftblob);
        cdsQuery.CommandText := format(glSQL,[AFile_ID,c,AVer]);

        fDBOpr.DoExecute(cdsQuery.CommandText,PackageParams(cdsQuery.Params));
      }
        myData := StreamToOleVariant(myms,myms.Size);
        if ClientSystem.fDBOpr.UpFileChunk(AFile_ID,AVer,c,myData) <0 then
        begin
          Result := False;
          Exit;
        end;

        fGauge.Progress := fGauge.Progress + 1;
      except
        Result := False;
        Exit;
      end;
      freeandnil(myms);
    end;

  finally
    myStream.Free;
    OutStream.Free;
  end;
  Result := True;
end;


initialization
  ClientSystem := TClinetSystem.Create;
finalization
  ClientSystem.Free;


end.
