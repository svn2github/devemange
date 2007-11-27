unit SetFileOpenModefrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TSetFileOpenModeDlg = class(TForm)
    cbInherit: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edExt: TEdit;
    Label1: TLabel;
    edExe: TEdit;
    BitBtn3: TBitBtn;
    OpenDialog1: TOpenDialog;
    Label3: TLabel;
    btbnSetyonda: TBitBtn;
    btbnExcel: TBitBtn;
    procedure cbInheritClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btbnSetyondaClick(Sender: TObject);
    procedure btbnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetFileOpenModeDlg: TSetFileOpenModeDlg;

implementation

{$R *.dfm}

procedure TSetFileOpenModeDlg.cbInheritClick(Sender: TObject);
begin
  BitBtn3.Enabled   := not cbInherit.Checked;
  edExt.Enabled     := not cbInherit.Checked;
  edExe.Enabled     := not cbInherit.Checked;
  btbnSetyonda.Enabled := not cbInherit.Checked;
  btbnExcel.Enabled := not cbInherit.Checked;
end;

procedure TSetFileOpenModeDlg.BitBtn3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edExe.Text := OpenDialog1.FileName;
end;

procedure TSetFileOpenModeDlg.btbnSetyondaClick(Sender: TObject);
begin
  edExt.Text :='*.mlg;*.mlgcl;*.mlgxm;mld;mlc;mlb';
end;

procedure TSetFileOpenModeDlg.btbnExcelClick(Sender: TObject);
begin
  edExt.Text := '*.xls';
end;

end.
