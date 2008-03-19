///////////////////////////////////////////////////////////////////////////////
//   author: mrlong date:2007-8-2
//
//
//   压缩的算法,我采用了ZLib 1.2.3 版本 www.Zlib.net
//
//
//   1.增加一个数据包如小于100字节，则不压。 21008-3-19
//
///////////////////////////////////////////////////////////////////////////////

unit ZLibImpt;


interface

uses
  Windows, ActiveX, ComObj, SConnect;

type

  TDataCompressor = class(TComObject, IDataIntercept)
  protected
    procedure DataIn(const Data: IDataBlock); stdcall;
    procedure DataOut(const Data: IDataBlock); stdcall;
  end;

const
  Class_DataCompressor: TGUID = '{3E3C8C5F-CD43-44CF-A4B5-30871E5F7936}'; //'{B249776C-E429-11D1-AAA4-00C04FA35CFA}';

implementation

uses ComServ, SysUtils, ZLibEx, Classes, MidConst;

{
  解压数据包
}
procedure TDataCompressor.DataIn(const Data: IDataBlock);
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
    if (Size = 0) or (Size<=100) then Exit;
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
procedure TDataCompressor.DataOut(const Data: IDataBlock);
var
  InStream, OutStream: TMemoryStream;
  ZStream: TZCompressionStream;
  Size: Integer;
begin
  InStream := TMemoryStream.Create;
  try
    InStream.Write(Pointer(Integer(Data.Memory) + Data.BytesReserved)^, Data.Size);
    Size := InStream.Size;
    if (Size = 0) or (Size<=100) then Exit;
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

initialization
  TPacketInterceptFactory.Create(ComServer, TDataCompressor, Class_DataCompressor,
    'DataCompressor', 'SampleInterceptor', ciMultiInstance, tmApartment);
end.
