///////////////////////////////////////////////////////////////////////////////
//  作用：定义执行数据库操作的接口类
//  文件名：BFSSDbOprIntf.pas  版本：1.0
//  接口支持库: BFSSDBOpr.dll  
//  创建日期：2007-11-1       作者：龙仕云
//
//
//
//  还处理AppServer接口的问题
//
//******************************************************************************}
//
// 使用方法:
//   在公共部分定义:
//
//   function CreateBfssDBOpr(AConnectStype:Word): IDbOperator; stdcall;
//    参数: AConnectStype = 0 表示采用DCOM连接
//                        = 1 表示采用Socke连接
//   function CreateDbOperator; stdcall; external 'BfssDBOpr.Dll';
//
//
////////////////////////////////////////////////////////////////////////////////
unit DbApiIntf;

interface

uses
  Windows, DBClient;

const
  cnEmptyIntValue: Integer = -1;
  cnCurDbOprVersion = 1;

type

  TConnectStype = (csDCOM,csSocket); 

  IDbOperator = interface
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
    //
    // DoExecute 是执行采用SQL语句与Param参数来更新数据,
    // 与ExeSQL 不同的，ExeSQL没有Param参数值
    // 参数:
    //  ASqlStr 为SQL语句
    //  AParams 是用 PackageParams(cdsQuery.Params) 方法所得。
    //
    procedure DoExecute(ASqlStr:WideString;AParams: OleVariant); stdcall;

    //4.AppServer 接口
    function Login(const AName: WideString; const APass: WideString):integer;stdcall;
    function CopyFile(AFile_ID: Integer; AVer: Integer; ATree_ID: Integer): Integer; safecall;
    function DeleteFile(AFile_ID: Integer): Integer; safecall;
    function UpFileChunk(AFile_ID: Integer; AVer: Integer; AGroupID: Integer; AStream: OleVariant): Integer; safecall;

    //5.属性
    function Connected(): Boolean; stdcall;
    function Version : integer;stdcall;
    function AppServer : Variant; stdcall;
  end;


implementation

end.
