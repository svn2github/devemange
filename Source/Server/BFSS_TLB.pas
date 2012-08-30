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
// File generated on 2012-08-30 10:12:05 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\devemanage\Source\Server\DeveManage.tlb (1)
// LIBID: {D1AF1628-E704-4247-9F5A-F1BCCD264A69}
// LCID: 0
// Helpfile: 
// HelpString: BFSS Library
// DepndLst: 
//   (1) v1.0 Midas, (C:\Windows\system32\midas.dll)
//   (2) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
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
  IID_IBFSSRDM2: TGUID = '{71B7027F-8E00-49F3-9D5F-F69B0E945AF5}';
  IID_IBFSSRDM3: TGUID = '{AB514BEC-06E9-4263-9D2A-5886EE2DBE20}';
  CLASS_BFSSRDM2: TGUID = '{7B1AA46A-8C7D-4C89-BC7C-04129CC66D2A}';
  CLASS_BFSSRDM3: TGUID = '{24D5C599-7790-44F1-ACBF-EAD2E8192205}';
  IID_IBFSSRDM4: TGUID = '{55598F3B-D07E-41ED-BC01-C2C0B44B4C29}';
  CLASS_BFSSRDM4: TGUID = '{588580BC-AB3A-4B4A-BD53-9AF64C7ADA3B}';
  IID_IBFSSRDM5: TGUID = '{525DBF5F-5667-4593-B72A-E77450CB32B9}';
  CLASS_BFSSRDM5: TGUID = '{F1B0B88B-327F-4C78-9C11-B7A98B1086C1}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IBFSSRDM = interface;
  IBFSSRDMDisp = dispinterface;
  IBFSSRDM2 = interface;
  IBFSSRDM2Disp = dispinterface;
  IBFSSRDM3 = interface;
  IBFSSRDM3Disp = dispinterface;
  IBFSSRDM4 = interface;
  IBFSSRDM4Disp = dispinterface;
  IBFSSRDM5 = interface;
  IBFSSRDM5Disp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  BFSSRDM = IBFSSRDM;
  BFSSRDM2 = IBFSSRDM2;
  BFSSRDM3 = IBFSSRDM3;
  BFSSRDM4 = IBFSSRDM4;
  BFSSRDM5 = IBFSSRDM5;


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
    function GetSysDateTime: OleVariant; safecall;
    procedure MailToEx(const MailTo: WideString; const Title: WideString; const Content: WideString); safecall;
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
    function GetSysDateTime: OleVariant; dispid 302;
    procedure MailToEx(const MailTo: WideString; const Title: WideString; const Content: WideString); dispid 303;
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
// Interface: IBFSSRDM2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {71B7027F-8E00-49F3-9D5F-F69B0E945AF5}
// *********************************************************************//
  IBFSSRDM2 = interface(IBFSSRDM)
    ['{71B7027F-8E00-49F3-9D5F-F69B0E945AF5}']
  end;

// *********************************************************************//
// DispIntf:  IBFSSRDM2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {71B7027F-8E00-49F3-9D5F-F69B0E945AF5}
// *********************************************************************//
  IBFSSRDM2Disp = dispinterface
    ['{71B7027F-8E00-49F3-9D5F-F69B0E945AF5}']
    function Login(const AName: WideString; const APass: WideString): Integer; dispid 1;
    function GetDspName: WideString; dispid 2;
    procedure BeginTrans; dispid 3;
    procedure CommitTrans; dispid 4;
    procedure RollbackTrans; dispid 5;
    function CopyFile(AFile_ID: Integer; AVer: Integer; ATree_ID: Integer): Integer; dispid 6;
    function DeleteFile(AFile_ID: Integer): Integer; dispid 7;
    function UpFileChunk(AFile_ID: Integer; AVer: Integer; AGroupID: Integer; AStream: OleVariant): Integer; dispid 8;
    procedure MailTo(AStyle: Integer; const AMails: WideString; AContextID: Integer); dispid 301;
    function GetSysDateTime: OleVariant; dispid 302;
    procedure MailToEx(const MailTo: WideString; const Title: WideString; const Content: WideString); dispid 303;
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
// Interface: IBFSSRDM3
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {AB514BEC-06E9-4263-9D2A-5886EE2DBE20}
// *********************************************************************//
  IBFSSRDM3 = interface(IBFSSRDM)
    ['{AB514BEC-06E9-4263-9D2A-5886EE2DBE20}']
  end;

// *********************************************************************//
// DispIntf:  IBFSSRDM3Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {AB514BEC-06E9-4263-9D2A-5886EE2DBE20}
// *********************************************************************//
  IBFSSRDM3Disp = dispinterface
    ['{AB514BEC-06E9-4263-9D2A-5886EE2DBE20}']
    function Login(const AName: WideString; const APass: WideString): Integer; dispid 1;
    function GetDspName: WideString; dispid 2;
    procedure BeginTrans; dispid 3;
    procedure CommitTrans; dispid 4;
    procedure RollbackTrans; dispid 5;
    function CopyFile(AFile_ID: Integer; AVer: Integer; ATree_ID: Integer): Integer; dispid 6;
    function DeleteFile(AFile_ID: Integer): Integer; dispid 7;
    function UpFileChunk(AFile_ID: Integer; AVer: Integer; AGroupID: Integer; AStream: OleVariant): Integer; dispid 8;
    procedure MailTo(AStyle: Integer; const AMails: WideString; AContextID: Integer); dispid 301;
    function GetSysDateTime: OleVariant; dispid 302;
    procedure MailToEx(const MailTo: WideString; const Title: WideString; const Content: WideString); dispid 303;
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
// Interface: IBFSSRDM4
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {55598F3B-D07E-41ED-BC01-C2C0B44B4C29}
// *********************************************************************//
  IBFSSRDM4 = interface(IBFSSRDM)
    ['{55598F3B-D07E-41ED-BC01-C2C0B44B4C29}']
  end;

// *********************************************************************//
// DispIntf:  IBFSSRDM4Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {55598F3B-D07E-41ED-BC01-C2C0B44B4C29}
// *********************************************************************//
  IBFSSRDM4Disp = dispinterface
    ['{55598F3B-D07E-41ED-BC01-C2C0B44B4C29}']
    function Login(const AName: WideString; const APass: WideString): Integer; dispid 1;
    function GetDspName: WideString; dispid 2;
    procedure BeginTrans; dispid 3;
    procedure CommitTrans; dispid 4;
    procedure RollbackTrans; dispid 5;
    function CopyFile(AFile_ID: Integer; AVer: Integer; ATree_ID: Integer): Integer; dispid 6;
    function DeleteFile(AFile_ID: Integer): Integer; dispid 7;
    function UpFileChunk(AFile_ID: Integer; AVer: Integer; AGroupID: Integer; AStream: OleVariant): Integer; dispid 8;
    procedure MailTo(AStyle: Integer; const AMails: WideString; AContextID: Integer); dispid 301;
    function GetSysDateTime: OleVariant; dispid 302;
    procedure MailToEx(const MailTo: WideString; const Title: WideString; const Content: WideString); dispid 303;
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
// Interface: IBFSSRDM5
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {525DBF5F-5667-4593-B72A-E77450CB32B9}
// *********************************************************************//
  IBFSSRDM5 = interface(IBFSSRDM)
    ['{525DBF5F-5667-4593-B72A-E77450CB32B9}']
  end;

// *********************************************************************//
// DispIntf:  IBFSSRDM5Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {525DBF5F-5667-4593-B72A-E77450CB32B9}
// *********************************************************************//
  IBFSSRDM5Disp = dispinterface
    ['{525DBF5F-5667-4593-B72A-E77450CB32B9}']
    function Login(const AName: WideString; const APass: WideString): Integer; dispid 1;
    function GetDspName: WideString; dispid 2;
    procedure BeginTrans; dispid 3;
    procedure CommitTrans; dispid 4;
    procedure RollbackTrans; dispid 5;
    function CopyFile(AFile_ID: Integer; AVer: Integer; ATree_ID: Integer): Integer; dispid 6;
    function DeleteFile(AFile_ID: Integer): Integer; dispid 7;
    function UpFileChunk(AFile_ID: Integer; AVer: Integer; AGroupID: Integer; AStream: OleVariant): Integer; dispid 8;
    procedure MailTo(AStyle: Integer; const AMails: WideString; AContextID: Integer); dispid 301;
    function GetSysDateTime: OleVariant; dispid 302;
    procedure MailToEx(const MailTo: WideString; const Title: WideString; const Content: WideString); dispid 303;
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

// *********************************************************************//
// The Class CoBFSSRDM2 provides a Create and CreateRemote method to          
// create instances of the default interface IBFSSRDM2 exposed by              
// the CoClass BFSSRDM2. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBFSSRDM2 = class
    class function Create: IBFSSRDM2;
    class function CreateRemote(const MachineName: string): IBFSSRDM2;
  end;

// *********************************************************************//
// The Class CoBFSSRDM3 provides a Create and CreateRemote method to          
// create instances of the default interface IBFSSRDM3 exposed by              
// the CoClass BFSSRDM3. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBFSSRDM3 = class
    class function Create: IBFSSRDM3;
    class function CreateRemote(const MachineName: string): IBFSSRDM3;
  end;

// *********************************************************************//
// The Class CoBFSSRDM4 provides a Create and CreateRemote method to          
// create instances of the default interface IBFSSRDM4 exposed by              
// the CoClass BFSSRDM4. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBFSSRDM4 = class
    class function Create: IBFSSRDM4;
    class function CreateRemote(const MachineName: string): IBFSSRDM4;
  end;

// *********************************************************************//
// The Class CoBFSSRDM5 provides a Create and CreateRemote method to          
// create instances of the default interface IBFSSRDM5 exposed by              
// the CoClass BFSSRDM5. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBFSSRDM5 = class
    class function Create: IBFSSRDM5;
    class function CreateRemote(const MachineName: string): IBFSSRDM5;
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

class function CoBFSSRDM2.Create: IBFSSRDM2;
begin
  Result := CreateComObject(CLASS_BFSSRDM2) as IBFSSRDM2;
end;

class function CoBFSSRDM2.CreateRemote(const MachineName: string): IBFSSRDM2;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BFSSRDM2) as IBFSSRDM2;
end;

class function CoBFSSRDM3.Create: IBFSSRDM3;
begin
  Result := CreateComObject(CLASS_BFSSRDM3) as IBFSSRDM3;
end;

class function CoBFSSRDM3.CreateRemote(const MachineName: string): IBFSSRDM3;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BFSSRDM3) as IBFSSRDM3;
end;

class function CoBFSSRDM4.Create: IBFSSRDM4;
begin
  Result := CreateComObject(CLASS_BFSSRDM4) as IBFSSRDM4;
end;

class function CoBFSSRDM4.CreateRemote(const MachineName: string): IBFSSRDM4;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BFSSRDM4) as IBFSSRDM4;
end;

class function CoBFSSRDM5.Create: IBFSSRDM5;
begin
  Result := CreateComObject(CLASS_BFSSRDM5) as IBFSSRDM5;
end;

class function CoBFSSRDM5.CreateRemote(const MachineName: string): IBFSSRDM5;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BFSSRDM5) as IBFSSRDM5;
end;

end.
