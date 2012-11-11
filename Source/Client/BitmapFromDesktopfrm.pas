unit BitmapFromDesktopfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, StdCtrls, ExtCtrls, Buttons;

type
  TBitmapFromDesktopfrmDlg = class(TBaseDialog)
    pnl1: TPanel;
    lbl1: TLabel;
    cbb1: TComboBox;
    img1: TImage;
    btn2: TBitBtn;
    btn1: TBitBtn;
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


  function ShowBitmapFromDesktopfrmDlg(AStream:TMemoryStream):Boolean;


implementation
uses
  Jpeg;

{$R *.dfm}

  function ShowBitmapFromDesktopfrmDlg(AStream:TMemoryStream):Boolean;
  var
     myJpg : TJpegImage;
  begin
    with TBitmapFromDesktopfrmDlg.Create(nil) do
    try

      Result := ShowModal = mrOk;

      if Result then
      begin
        AStream.Clear;
        myJpg :=TJpegImage.Create;
        myJpg.Assign(img1.Picture.Bitmap);
        myJpg.SaveToStream(AStream);
        myJpg.Free;
        //img1.Picture.Bitmap.SaveToStream(AStream);
      end;
    finally
      Free;
    end;
  end;

function GetAPIBitmapFromDesktop(AStream:TMemoryStream;ABitCount:Integer): boolean;
const
  BMType = $4D42;
type
  TBitmap = record
    BMType: Integer;
    bmWidth: Integer;
    bmHeight: Integer;
    bmWidthBytes: Integer;
    bmPlanes: byte;
    bmBitsPixel: byte;
    bmBits: Pointer;
  end;
  function AlignDouble(Size: Longint): Longint;
  begin
    Result := (Size + 31) div 32 * 4;
  end;
var
  Stream: TMemoryStream;
  BM: TBitmap;
  BFH: TBitmapFileHeader;
  BIP: PBitmapInfo;
//  DC: HDC;
  HMem: THandle;
  Buf: Pointer;
  ColorSize, DataSize: Longint;
  BitCount: word;


  DC, MemDC: HDC;
  Bitmap, OBitmap: HBitmap;
  BitmapWidth, BitmapHeight: Integer;
begin
  Stream:= AStream;

  DC := GetDC(GetDesktopWindow);
  MemDC := CreateCompatibleDC(DC);
//  BitmapWidth := GetDeviceCaps(DC, 8);
//  BitmapHeight := GetDeviceCaps(DC, 10);
  BitmapWidth := GetSystemMetrics(0);
  BitmapHeight := GetSystemMetrics(1);

  Bitmap := CreateCompatibleBitmap(DC, BitmapWidth, BitmapHeight);
  OBitmap := SelectObject(MemDC, Bitmap);
  BitBlt(MemDC, 0, 0, BitmapWidth, BitmapHeight, DC, 0, 0, SRCCOPY);
  SelectObject(MemDC, OBitmap);
  DeleteDC(MemDC);
  ReleaseDC(GetDesktopWindow, DC);
//  Result := Bitmap;
  //----------------
  if GetObject(Bitmap, SizeOf(TBitmap), @BM) = 0 then Exit; //GetObject 返回的对象赋给对象变量
  BitCount := ABitCount;
  {
  case cbb1.ItemIndex of
    0: BitCount:=1;
    1: BitCount:=4;
    2: BitCount:=8;  //8表示位图最多有256种颜色
    3: BitCount:=16;
    4: BitCount:=24;
    5: BitCount:=32;
  end;
  }

 // BitCount := 32; //表示位图最多有232种颜色。这种位图的结构与16位位图结构非常类似
{if (BitCount <> 4) then //表示位图最多有16种颜色。
  //If (BitCount <> 24) Then     //表示位图最多有224种颜色。
    ColorSize := SizeOf(TRGBQuad) * (1 shl BitCount)
  else
    ColorSize := 0;    }
    ColorSize := SizeOf(TRGBQuad) * (1 shl BitCount);
  DataSize := AlignDouble(BM.bmWidth * BitCount) * BM.bmHeight;
  GetMem(BIP, SizeOf(TBitmapInfoHeader) + ColorSize);
  if BIP <> nil then
  begin
    with BIP^.bmiHeader do
    begin
      biSize := SizeOf(TBitmapInfoHeader);
      biWidth := BM.bmWidth;
      biHeight := BM.bmHeight;
      biPlanes := 1;
      biBitCount := BitCount;
      biCompression := 0;
      biSizeImage := DataSize;
      biXPelsPerMeter := 0;
      biYPelsPerMeter := 0;
      biClrUsed := 0;
      biClrImportant := 0;
    end;
    with BFH do
    begin
      bfOffBits := SizeOf(BFH) + SizeOf(TBitmapInfo) + ColorSize;
      bfReserved1 := 0;
      bfReserved2 := 0;
      bfSize := Longint(bfOffBits) + DataSize;
      bfType := BMType;
    end;
    HMem := GlobalAlloc(gmem_Fixed, DataSize);
    if HMem <> 0 then
    begin
      Buf := GlobalLock(HMem);
      DC := GetDC(0);
      if GetDIBits(DC, Bitmap, 0, BM.bmHeight,
        Buf, BIP^, dib_RGB_Colors) <> 0 then
      begin
        Stream.WriteBuffer(BFH, SizeOf(BFH));
        Stream.WriteBuffer(pchar(BIP)^, SizeOf(TBitmapInfo) + ColorSize);
        Stream.WriteBuffer(Buf^, DataSize);
      //  Result := 1;
      end;
      ReleaseDC(0, DC);
      GlobalUnlock(HMem);
      GlobalFree(HMem);
    end;
  end;
  FreeMem(BIP, SizeOf(TBitmapInfoHeader) + ColorSize);
  DeleteObject(Bitmap);
  //Stream.Position:=0;
  //Form1.Image1.Picture.Bitmap.LoadFromStream(Stream);
  //Stream.SaveToFile('测试.bmp');
  //Stream.Free;
end;


procedure TBitmapFromDesktopfrmDlg.btn2Click(Sender: TObject);
var
  myms : TMemoryStream;
  myState : TWindowState;
  myBitCount : Integer;
  myJpg : TJpegImage;
begin
  myms := TMemoryStream.Create;
  myState := Self.WindowState;
  try
    Self.WindowState := wsMinimized;
    Sleep(1000);
    case cbb1.ItemIndex of
      0: myBitCount:=1;
      1: myBitCount:=4;
      2: myBitCount:=8;  //8表示位图最多有256种颜色
      3: myBitCount:=16;
      4: myBitCount:=24;
      5: myBitCount:=32;
    end;

    if GetAPIBitmapFromDesktop(myms,myBitCount) then
    begin
      myms.Position := 0;
      img1.Picture.Bitmap.LoadFromStream(myms);
    end;
  finally
    myms.Free;
    Self.WindowState := myState;
  end;
end;


end.
