unit BFSS_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 07-11-28 11:03:10 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\DeveManage\Source\Server\DeveManage.tlb (1)
// LIBID: {D1AF1628-E704-4247-9F5A-F1BCCD264A69}
// LCID: 0
// Helpfile: 
// HelpString: BFSS Library
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINDOWS\system32\midas.dll)
//   (2) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, Midas, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  BFSSMajorVersion = 1;
  BFSSMinorVersion = 0;

  LIBID_BFSS: TGUID = '{D1AF1628-E704-4247-9F5A-F1BCCD264A69}';

  IID_IBFSSRDM: TGUID = '{E4F02A3C-FDD0-4214-AF45-5CBD8B185B5F}';
  CLASS_BFSSRDM: TGUID = '{B4AA6BE1-5DEF-431A-AFA0-F1262EDB4C5A}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IBFSSRDM = interface;
  IBFSSRDMDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  BFSSRDM = IBFSSRDM;


// *********************************************************************//
// Interface: IBFSSRDM
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E4F02A3C-FDD0-4214-AF45-5CBD8B185B5F}
// *********************************************************************//
  IBFSSRDM = interface(IAppServer)
    ['{E4F02A3C-FDD0-4214-AF45-5CBD8B185B5F}']
    function Login(const AName: WideString; const APass: WideString): Integer; safecall;
    function GetDspName: WideString; safecall;
    procedure BeginTrans; safecall;
    procedure CommitTrans; safecall;
    procedure RollbackTrans; safecall;
    function CopyFile(AFile_ID: Integer; AVer: Integer; ATree_ID: Integer): Integer; safecall;
    function DeleteFile(AFile_ID: Integer): Integer; safecall;
    function UpFileChunk(AFile_ID: Integer; AVer: Integer; AGroupID: Integer; AStream: OleVariant): Integer; safecall;
    procedure MailTo(AStyle: Integer; const AMails: WideString; AContextID: Integer); safecall;
  end;

// *********************************************************************//
// DispIntf:  IBFSSRDMDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E4F02A3C-FDD0-4214-AF45-5CBD8B185B5F}
// *********************************************************************//
  IBFSSRDMDisp = dispinterface
    ['{E4F02A3C-FDD0-4214-AF45-5CBD8B185B5F}']
    function Login(const AName: WideString; const APass: WideString): Integer; dispid 1;
    function GetDspName: WideString; dispid 2;
    procedure BeginTrans; dispid 3;
    procedure CommitTrans; dispid 4;
    procedure RollbackTrans; dispid 5;
    function CopyFile(AFile_ID: Integer; AVer: Integer; ATree_ID: Integer): Integer; dispid 6;
    function DeleteFile(AFile_ID: Integer): Integer; dispid 7;
    function UpFileChunk(AFile_ID: Integer; AVer: Integer; AGroupID: Integer; AStream: OleVariant): Integer; dispid 8;
    procedure MailTo(AStyle: Integer; const AMails: WideString; AContextID: Integer); dispid 301;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoBFSSRDM provides a Create and CreateRemote method to          
// create instances of the default interface IBFSSRDM exposed by              
// the CoClass BFSSRDM. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBFSSRDM = class
    class function Create: IBFSSRDM;
    class function CreateRemote(const MachineName: string): IBFSSRDM;
  end;

implementation

uses ComObj;

class function CoBFSSRDM.Create: IBFSSRDM;
begin
  Result := CreateComObject(CLASS_BFSSRDM) as IBFSSRDM;
end;

class function CoBFSSRDM.CreateRemote(const MachineName: string): IBFSSRDM;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BFSSRDM) as IBFSSRDM;
end;

end.
