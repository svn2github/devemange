///////////////////////////////////////////////////////////////////////////////
//
// BFSS 类定义
//
// 作者: 龙仕云  创建日期: 2007-10-26
//
//
//
///////////////////////////////////////////////////////////////////////////////

unit BFSSClassUnits;

interface
uses
  Classes,Windows, SysUtils,inifiles;

{常量}
const
  //权限掩码 1=查看 2=修改 4=删除 8=增加
  GC_RIGHTVIEW    = 1;
  GC_RIGHTUPDATE  = 2;
  GC_RIGHTDELETE  = 4;
  GC_RIGHTINSERT  = 8;

{目录}
const
  GC_LOGDIR       = 'Log';   //日记目录

type

  TDataBaseType = (dbt_Access,dbt_MSSQL2000);

  TDataBaseRec = Record
    fType : TDataBaseType;
    fDBName   : String; //库名
    fDBServer : String; //如是MSSQL则是服务器的ip
    fasPass   : String; //as的密码
  end;

  TUserRec = Record
    fID   : integer;
    fName : String;
    fLoginDateTime : TDateTime;
    fPrivi    : THashedStringList; //权限表
  end;
  PUserRec = ^TUserRec;


  TConnectParamRec = Record
    fPort : integer;
    fThreadCacheSiz : integer;
    fTimeout : integer;
  end;

  //邮件服务器参数
  TSMTPParams = Record
    fAction   : Boolean;
    fUserName : String;
    fPassword : String;
    fHost     : String;
    fPort     : integer;  
  end;

//
// 用户，当前的用户
//
  TUser = Class
  private
    fItems : TList;
    procedure Clear;
    function GetItemCount: integer;
    function GetItems(index: integer): PUserRec;
  public
    constructor Create ;
    destructor Destroy; override;
    procedure Add(AItem:PUserRec);
    procedure Delete(AIndex:integer); //删除;
    function Indexof(AItem:PUserRec):integer;
    property Items[index:integer]:PUserRec read GetItems;
    property ItemCount : integer read GetItemCount;
  end;


  TBFSSSystem = Class
  private

  public
    fAppDir   : String;
    finifile  : String; // ini配置文件
    fDataBase : TDataBaseRec;
    fUsers    : TUser;
    fConnectParam : TConnectParamRec; //连接参数
    fAppCaption : String;  //应用名称
    fHasZipData : Boolean; //是否压缩数据包
    fSMTPParams : TSMTPParams;

    constructor Create ;
    destructor Destroy; override;
    procedure LoadDataBaseByIni();
    procedure LoadConnectParamByIni();
    procedure LoadOtherByIni();
    procedure Lock();
    procedure UnLock();
    procedure WriteLog(AStr:String); //写入日志文件
  end;

var
  CurrBFSSSystem : TBFSSSystem;

implementation


//内部临界区对象
//var
//  fLock: TRTLCriticalSection;

{ TBFSSSystem }

constructor TBFSSSystem.Create;
begin
  fAppDir  := ExtractFileDir(System.ParamStr(0));
  finifile := ChangeFileExt(System.ParamStr(0),'.ini');
  LoadDataBaseByIni();
  LoadConnectParamByIni();
  LoadOtherByIni();
  fUsers   := TUser.Create;
  if not DirectoryExists(format('%s\%s',[fAppDir,GC_LOGDIR])) then
    if not CreateDir(format('%s\%s',[fAppDir,GC_LOGDIR])) then
      raise Exception.Create('无法创建Log目录。');
end;

destructor TBFSSSystem.Destroy;
begin
  fUsers.Free;
  inherited;
end;

procedure TBFSSSystem.LoadConnectParamByIni;
var
  ini : Tinifile;
begin
  ini := Tinifile.Create(finifile);
  try
    fConnectParam.fPort := ini.ReadInteger('Connect','Port',211);
    fConnectParam.fThreadCacheSiz := ini.ReadInteger('Connect','ThreadCacheSiz',10);
    fConnectParam.fTimeout := ini.ReadInteger('Connect','Timeout',0);
  finally
    ini.Free;
  end;
end;

procedure TBFSSSystem.LoadDataBaseByIni;
var
  ini : Tinifile;
begin
  ini := Tinifile.Create(finifile);
  try
    fDataBase.fType := TDataBaseType(ini.ReadInteger('DataBase','Type',0));
    fDataBase.fDBName := ini.ReadString('DataBase','DBName','');
    fDataBase.fDBServer := ini.ReadString('DataBase','DBServer','localhost');
    fDataBase.fasPass := ini.ReadString('DataBase','AsPass','');
  finally
    ini.Free;
  end;
end;

procedure TBFSSSystem.LoadOtherByIni;
var
  ini : Tinifile;
begin
  ini := Tinifile.Create(finifile);
  try
    fAppCaption := ini.ReadString('App','Caption','应用服务器');
    fHasZipData := ini.ReadBool('App','HasZipData',False);

    fSMTPParams.fAction   := ini.ReadBool('SMTP','Action',False);
    fSMTPParams.fHost     := ini.ReadString('SMTP','Host','');
    fSMTPParams.fPort     := ini.ReadInteger('SMTP','Port',25);
    fSMTPParams.fUserName := ini.ReadString('SMTP','Name','');
    fSMTPParams.fPassword := ini.ReadString('SMTP','Password','');
  finally
    ini.Free;
  end;
end;

procedure TBFSSSystem.Lock;
begin
  //EnterCriticalSection(FLock);
end;

procedure TBFSSSystem.UnLock;
begin
  //LeaveCriticalSection(FLock);
end;

procedure TBFSSSystem.WriteLog(AStr: String);
var
  mylogfile : String;
  mysl : TStringList;
begin
  //
  // 如文件行过多时，这个要不要优化.
  //
  mylogfile := format('%s\%s\%s.log',[fAppDir,GC_LOGDIR,
    formatDateTime('yyyy-mm-dd',Now())]);

  mysl := TStringList.Create;
  try
    if FileExists(mylogfile) then
      mysl.LoadFromFile(mylogfile);
    mysl.Add(format('%s %s',
      [formatDateTime('yyyy-mm-dd hh:mm:ss',now()),AStr]));
    mysl.SaveToFile(mylogfile);
  finally
    mysl.Free;
  end;
end;

{ TUser }

procedure TUser.Add(AItem: PUserRec);
var
  i : integer;
begin
  //EnterCriticalSection(FLock);
  try
    //如存在，则不增加，只更新时间
    for i:=0 to fItems.Count -1 do
    begin
      if Items[i]^.fID = AItem^.fID then
      begin
        Items[i]^.fLoginDateTime := AItem^.fLoginDateTime;
        AItem^.fPrivi.Free;
        Dispose(AItem);
        Exit;
      end;

    end;
    fItems.Add(AItem);
  finally
    //LeaveCriticalSection(FLock);
  end;
end;

procedure TUser.Clear;
var
  i : integer;
  myItem : PUserRec;
begin
  //EnterCriticalSection(FLock);
  try
    for i:=0 to fItems.Count - 1 do
    begin
      myItem := fItems.Items[i];
      myItem^.fPrivi.Free;
      Dispose(myItem);
    end;
    fItems.Clear;
  finally
    //LeaveCriticalSection(FLock);
  end;
end;

constructor TUser.Create;
begin
  fItems := TList.Create;
end;

procedure TUser.Delete(AIndex: integer);
var
  myItem : PUserRec;
begin
  //EnterCriticalSection(FLock);
  try
    if (AIndex >=0) and (AIndex < fItems.Count) then
    begin
      myItem := fItems.Items[AIndex];
      myItem^.fPrivi.Free;
      Dispose(myItem);
      fItems.Delete(AIndex);
    end;
  finally
    //LeaveCriticalSection(FLock);
  end;
end;

destructor TUser.Destroy;
begin
  Clear;
  fItems.Free;
  inherited;
end;

function TUser.GetItemCount: integer;
begin
  Result := fItems.Count;
end;

function TUser.GetItems(index: integer): PUserRec;
begin
  Result := nil;
  if (index >=0) and (index < fItems.Count) then
    Result := fItems.Items[index];
end;

function TUser.Indexof(AItem: PUserRec): integer;
begin
  Result := fItems.IndexOf(AItem);
end;

initialization
begin
  CurrBFSSSystem := TBFSSSystem.Create;
  //InitializeCriticalSection(FLock);
end;
finalization
begin
  CurrBFSSSystem.Free;
  //DeleteCriticalSection(FLock);
end;
  
end.
