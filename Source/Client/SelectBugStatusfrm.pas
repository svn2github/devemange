unit SelectBugStatusfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, StdCtrls, Buttons;

type
  TSelectBugStatusDlg = class(TBaseDialog)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    rbAdd: TRadioButton;
    rbMeReso: TRadioButton;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectBugStatusDlg: TSelectBugStatusDlg;

implementation

{$R *.dfm}

procedure TSelectBugStatusDlg.BitBtn1Click(Sender: TObject);
begin
  if rbadd.Checked or
     rbMeReso.Checked then
    ModalResult := mrOK
  else begin
    MessageBox(Handle,'«Î—°‘Ò','Ã· æ',MB_ICONERROR+MB_OK);
  end;

end;

end.
