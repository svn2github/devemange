////////////////////////////////////////////////////////////////////////////////
//
// 项目:
// 模块: 开发计划表
// 作者: 龙仕云 创建时间:
//
//
// 修改:       
//
//
//
////////////////////////////////////////////////////////////////////////////////
unit CalendarChildfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WebClientfrm, ActnList, Menus, OleCtrls, SHDocVw, ComCtrls,
  StdCtrls, Buttons, ExtCtrls;

type
  TCalendarChildDlg = class(TWebClientDlg)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure initBase; override;
  end;

var
  CalendarChildDlg: TCalendarChildDlg;

implementation

uses
  ActiveX,
  ClinetSystemUnits;

{$R *.dfm}

procedure WB_LoadHTML(WebBrowser: TWebBrowser; HTMLCode: string);
var  
  sl: TStringList;  
  ms: TMemoryStream;  
begin
  WebBrowser.Navigate('about:blank');
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


{ TCalendarChildDlg }

procedure TCalendarChildDlg.initBase;
const
  glSQL = 'select ZVALUE from TB_SYSPARAMS where ZNAME=''Calendar''';
begin
  HomeURL := ClientSystem.fDbOpr.ReadVariant(glSQL);
  WB_LoadHTML(wbwiki,HomeURL);
  pnlWebTool.Visible := False;
end;

end.
