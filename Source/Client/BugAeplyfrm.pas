unit BugAeplyfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, StdCtrls, Buttons, DBCtrls, ExtCtrls, Mask;

type
  TBugAeplyDlg = class(TBaseDialog)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    OpenDialog1: TOpenDialog;
    plQustion: TPanel;
    Label8: TLabel;
    Label7: TLabel;
    dblcQustionType: TDBLookupComboBox;
    Label6: TLabel;
    dblcQustionVer: TDBLookupComboBox;
    Panel1: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    DBText2: TDBText;
    DBMemo1: TDBMemo;
    Label4: TLabel;
    DBText3: TDBText;
    Label1: TLabel;
    btbnOpenAnnix: TBitBtn;
    Label9: TLabel;
    edPath: TEdit;
    btnOpenFileTxt: TBitBtn;
    procedure btbnOpenAnnixClick(Sender: TObject);
    procedure btnOpenFileTxtClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fBugItem_ID : Integer; 
  end;

var
  BugAeplyDlg: TBugAeplyDlg;

implementation

uses
BugManageClientfrm,

  ClinetSystemUnits;

{$R *.dfm}

procedure TBugAeplyDlg.btbnOpenAnnixClick(Sender: TObject);
var
  myfilename : string;
begin
  if OpenDialog1.Execute then
  begin
    myfilename := OpenDialog1.FileName;
    edPath.Text := myfilename;
  end;
end;

procedure TBugAeplyDlg.btnOpenFileTxtClick(Sender: TObject);
var
  myfilename : string;
  mysl : TStringList;
begin
  myfilename := ClientSystem.fDataDir + '\#' + IntToStr(fBugItem_ID);
  if not FileExists(myfilename) then
  begin
    Application.MessageBox('无草稿，不能打开。','提示',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  mysl := TStringList.Create;
  mysl.LoadFromFile(myfilename);
  DBMemo1.Lines.Assign(mysl);
  mysl.Free;


end;

end.
