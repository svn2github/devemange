////////////////////////////////////////////////////////////////////////////
//
// 作者:龙仕云 时间:2009-6-16
//
// 模块: 加密 用于服务器的用应软件
//
// 用时间进行加密串
// 思想: 时间总是要向前走的，我们将会记下时间的列表
//   如用户修改了时间，则提示
//
// 并采用随机数进行.
//  加密与解密两个pas文件处理
//
//
//////////////////////////////////////////////////////////////////////////////
unit TimeEncrypt;

interface
uses
  Classes,Windows,Registry,SysUtils;

  function EncryptString(sSrc,sKey:string):string;

implementation


function EncryptString(sSrc,sKey: string):string;
const
  sHex:array[0..15] of Char =
          ('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F');
var
  iKeyLen,iKeyPos,iOffset,iSrcPos,iSrcAsc: Integer;

  function IntToHexStr(iNum:   Integer):   string;
  begin
    Result := sHex[iNum div 16] + sHex[iNum mod 16];
  end;

begin
  if sSrc = '' then Exit;
  if sKey = '' then sKey := 'MRLONG';
  iKeyLen := Length(sKey);
  iKeyPos := 0;

  Randomize;
  iOffset := Random(256);
  Result := IntToHexStr(iOffset);
  for iSrcPos := 1 to Length(sSrc)   do
  begin
    iSrcAsc   :=   (Ord(sSrc[iSrcPos])   +   iOffset)   mod   255;
    if iKeyPos < iKeyLen   then
      Inc(iKeyPos)
    else
      iKeyPos   :=   1;
    iSrcAsc :=   iSrcAsc   xor   Ord(sKey[iKeyPos]);
    Result  :=   Result   +   IntToHexStr(iSrcAsc);
    iOffset :=   iSrcAsc;
  end;
end;



end.
