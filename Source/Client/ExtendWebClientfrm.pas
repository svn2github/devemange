///////////////////////////////////////////////////////////////////////////////
//
//  作者:龙仕云  创建时间:2009-10-02
//  功能描述: 扩展web应用
//
//  修改历史记录:
//       编号  作者     修改日期   修改内容
//
//
///////////////////////////////////////////////////////////////////////////////
unit ExtendWebClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WebClientfrm, ActnList, Menus, OleCtrls, SHDocVw, ComCtrls,
  StdCtrls, Buttons, ExtCtrls, DB, DBClient;

type
  TExtendWebClientDlg = class(TWebClientDlg)
    cdsData: TClientDataSet;
    procedure btnHomeClick(Sender: TObject);
  private
    { Private declarations }
    fType : Integer;
    fValue : string; //内容

    procedure WB_LoadHTML(WebBrowser: TWebBrowser; HTMLCode: string);
  public
    { Public declarations }
    procedure initBase; override;
  end;


implementation

uses ClinetSystemUnits,
  EncdDecd,ActiveX;

{$R *.dfm}

{ TExtendWebClientDlg }

procedure TExtendWebClientDlg.initBase;
var
  myID : Integer;
  mySQL : string;

const
  gl_SQLTXT = 'select * from TB_EXTENDWEB where ZID=%d';
begin
  inherited;
  myID := Self.Tag;
  mySQL := Format(gl_SQLTXT,[myID]);
  cdsData.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));
  if not cdsData.IsEmpty then
  begin
    fType  := cdsData.FieldByName('ZTYPE').AsInteger;
    //这个要传化一下,因为是base64串
    fValue := DecodeString(cdsData.FieldByName('ZVALUE').AsString);

    if fType = 0 then   //是RUL时
      HomeURL := fValue
    else begin

    end;

  end;
end;

procedure TExtendWebClientDlg.btnHomeClick(Sender: TObject);
begin
  if fType = 0 then
     wbwiki.Navigate(HomeURL)
  else begin
    WB_LoadHTML(wbwiki,fValue);
  end;
end;

procedure TExtendWebClientDlg.WB_LoadHTML(WebBrowser: TWebBrowser;
  HTMLCode: string);
var
  sl: TStringList;
  ms: TMemoryStream;
begin
  WebBrowser.Navigate('about:blank');
  while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do
   Application.ProcessMessages;

  if Assigned(WebBrowser.Document) then
  begin
    sl := TStringList.Create;
    try
      ms := TMemoryStream.Create;
      try
        sl.Text := HTMLCode;
        sl.SaveToStream(ms);
        ms.Seek(0, 0);
        (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms));
      finally
        ms.Free;
      end;
    finally
      sl.Free;
    end;
  end;
end;

end.
