unit S_DataModuleUnits;

interface

uses
  SysUtils, Classes, DB, ADODB,

  BFSSClassUnits;

type
  TDM = class(TDataModule)
    dsUser: TDataSource;
    dsUserPrivilege: TDataSource;
    adsUser: TADODataSet;
    adsUserPrivilege: TADODataSet;
    aqryPublic: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure adsUserNewRecord(DataSet: TDataSet);
    procedure adsUserBeforePost(DataSet: TDataSet);
    procedure adsUserPrivilegeNewRecord(DataSet: TDataSet);
    procedure adsUserPrivilegeBeforePost(DataSet: TDataSet);
    procedure adsUserAfterScroll(DataSet: TDataSet);
    procedure adsUserPrivilegeFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DoBackDatabase(AFileName:String);
    function DoRestoreDatabase(AFileName:String):Boolean;

    function AddFile(
      AStyle : Integer;
      AContentid:Integer;
      ALocalFileName:string;AGuid:string;AFileName:string;
      AFileSize:Integer):Boolean;

    //取出内容来,根据文件的ID号
    function GetDownFile(AFileid:Integer;var AFileGuid:string):Boolean;

  end;


  function NewGuid: string;

var
  DM: TDM;
  gConn: TADOConnection;

implementation
uses
  ActiveX;

{$R *.dfm}

function NewGuid: string;
var
  aGuid: TGUID;
begin
  CreateGUID(aGuid);
  result:=GUIDToString(aGuid);
  result:=Copy(result, 2, 36);
end;


procedure TDM.DataModuleCreate(Sender: TObject);
var
  myDataBase : String;
const
  glconnstr = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s;'
   +'Persist Security Info=False';
  glconnstrmssql2000 = 'Provider=SQLOLEDB.1;Persist Security Info=False;'+
   'User ID=sa;Password=%s;Initial Catalog=%s;Data Source=%s';
                                   //库名         //服务器
begin
  //
  //Aeecss
  //
  if CurrBFSSSystem.fDataBase.fType = dbt_Access then
  begin
    myDataBase := Format('%s\%s',[CurrBFSSSystem.fAppDir,
             CurrBFSSSystem.fDataBase.fDBName]);
    if not FileExists(myDataBase) then Exit;
    with DM do
    begin
      if  gConn.Connected then
        gConn.Connected := False;
      gConn.ConnectionString := format(glconnstr,[myDataBase]);
      adsUser.Open;
    end;
  end
  // MSSQL2000
  else begin
    if gConn.Connected then
      gConn.Connected := False;
    gConn.ConnectionString := format(glconnstrmssql2000,[
      CurrBFSSSystem.fDataBase.fasPass,
      CurrBFSSSystem.fDataBase.fDBName,
      CurrBFSSSystem.fDataBase.fDBServer]);
    gConn.Open;
  end;
end;

procedure TDM.adsUserNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ZSTOP').AsBoolean := False;
  DataSet.FieldByName('ZTYPE').AsInteger := 1;
end;

procedure TDM.adsUserBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('ZNAME').AsString = '' then
  begin
    Abort;
  end;
  
end;

procedure TDM.adsUserPrivilegeNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ZUSER_ID').AsInteger :=
    adsUser.fieldByName('ZID').AsInteger;
  DataSet.FieldByName('ZRIGHTMASK').AsInteger := 0;
end;

procedure TDM.adsUserPrivilegeBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('ZMODULEID').AsInteger <=0 then
  begin
    Abort;
  end;
end;

procedure TDM.adsUserAfterScroll(DataSet: TDataSet);
begin
  if not adsUserPrivilege.Active then
    adsUserPrivilege.Open;
  if adsUserPrivilege.State in [dsEdit, dsInsert] then
    adsUserPrivilege.Post;
  adsUserPrivilege.Filtered := False;
  adsUserPrivilege.Filtered := True;
end;

procedure TDM.adsUserPrivilegeFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := DataSet.FieldByName('ZUSER_ID').AsInteger =
    adsUser.FieldByName('ZID').AsInteger
end;


procedure TDM.DoBackDatabase(AFileName:String);
begin
  if gConn.Connected then
    gConn.Open;

  //MSSQL2000
  if CurrBFSSSystem.fDataBase.fType = dbt_MSSQL2000 then
  begin
    gConn.Execute('Backup database ' + CurrBFSSSystem.fDataBase.fDBName
        + ' to disk = ''' + AFileName + '''' );//+ 'with init');
  end
  else begin

  end;
end;


function TDM.DoRestoreDatabase(AFileName:String):Boolean;
var
  Tspid:string;
begin
  if gConn.Connected then  gConn.Open;

  with gConn do
  try
    Execute('use master');
    with aqryPublic do
    begin
      SQL.Text := 'EXEC sp_who';  //查看进程信息
      try
        Open;
        if not IsEmpty then
          while not Eof do
          begin
            if FieldByName('dbname').AsString = CurrBFSSSystem.fDataBase.fDBName then
            begin
              Tspid := Fields[0].AsString;  //取得进程号 Tspid
              try
                Execute('kill ' + Tspid + '');    //停止对应进程号(spid)的进程
              except
                //AlertMe('断开用户失败!');
                //StatusBar1.Panels[0].Text:='还原失败！';
                Result := False;
                Exit;
              end;
            end;
            Next; //下一记录
          end;
      except
        //AlertMe('返回连接用户失败!');
        Result := False;
        Exit;
      end;
    end;
    //返回登陆用户(正在使用的数据库)
    Result := True;
    //还原数据
    try
      Execute('restore database ' + CurrBFSSSystem.fDataBase.fDBName
        + ' from disk = ''' + AFileName + '''');
    except
      Result := False;
      Exit;
    end;
  finally
    Execute('use ' + CurrBFSSSystem.fDataBase.fDBName);
  end;
end;

function TDM.AddFile(AStyle : Integer;
      AContentid:Integer;
      ALocalFileName:string;AGuid:string;AFileName:string;
      AFileSize:Integer): Boolean;
var
  myQuery : TADOQuery;
  myfid : Integer;
  mysql : String;
const
  glSQL1  = 'select isnull(Max(ZID),0)+1 as mymax from TB_FILE_ITEM';
  glSQL2  = 'insert into TB_FILE_ITEM (ZTREE_ID,ZSTYPE,ZID,ZVER,ZNAME,ZEDITER_ID, ' +
            'ZEDITDATETIME,ZSTATUS,ZEXT,ZSTRUCTVER,ZTYPE,ZNEWVER,ZSIZE,ZCONTENTID) '+
            ' values(%d,%d,%d,%d,''%s'',%d,''%s'',%d,''%s'',%d,%d,1,%d,%d) ';
  glSQL4  = 'insert into TB_FILE_CONTEXT (ZFILE_ID,ZGROUPID,ZVER,ZLOCALGUID,ZTYPE) ' +
            ' values(%d,%d,%d,''%s'',%d)';
begin
  //
  Result := False;
  myQuery := TADOQuery.Create(nil);
  try
    myQuery.Connection := gConn;

    gConn.BeginTrans;
    try
      mysql := glSQL1;
      myQuery.SQL.Add(mysql);
      myQuery.Open;
      myfid := myQuery.FieldByName('mymax').AsInteger;


      mysql := Format(glSQL2,[
        0,
        AStyle,
        myfid,
        1,
        ExtractFileName(AFileName),
        0,
        datetimetostr(now()),
        0,
        ExtractFileExt(AFileName),
        0,
        1,
        AFileSize,
        AContentid]);

      myQuery.Close;
      myQuery.SQL.Clear;
      myQuery.SQL.Add(mysql);
      myQuery.ExecSQL;

      //增加明细
      myQuery.Close;
      myQuery.SQL.Clear;
      mysql := Format(glSQL4,[
        myfid,
        0,
        1,
        AGuid,
        1
        ]);
      myQuery.Close;
      myQuery.SQL.Clear;
      myQuery.SQL.Add(mysql);
      myQuery.ExecSQL;
      gConn.CommitTrans;

      Result := True;
    except
      gConn.RollbackTrans;
    end;
  finally
    myQuery.Free;
  end;
end;

function TDM.GetDownFile(AFileid: Integer; var AFileGuid: string): Boolean;
var
  myQuery : TADOQuery;
  mySQL : string;

const
  gl_SQL = 'select * from TB_FILE_CONTEXT where ZFILE_ID=%d and ZGROUPID=0 and ZVER=1 and ZTYPE=1';
begin
  //
  Result := False;
  myQuery := TADOQuery.Create(nil);
  try
    myQuery.Connection := gConn;
    mySQL := Format(gl_SQL,[AFileid]);
    myQuery.SQL.Add(mySQL);
    myQuery.Open;
    if myQuery.RecordCount > 0 then
    begin
      AFileGuid := myQuery.FieldByName('ZLOCALGUID').AsString;
      Result := True;
    end
    else
      Result := False;

  finally
    myQuery.Free;
  end;
end;

initialization
begin
  Coinitialize(nil);
  gConn:= TADOConnection.Create(nil);
  gConn.LoginPrompt := False;
end;
finalization
begin
  gConn.Free;
  CoUninitialize();
end;

end.

