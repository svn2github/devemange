unit AddBugTreeNodefrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, StdCtrls, Buttons, ComCtrls;

type
  TAddBugTreeNodeDlg = class(TBaseDialog)
    GroupBox1: TGroupBox;
    rbRoot: TRadioButton;
    rbSelectNode: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edName: TEdit;
    edProID: TEdit;
    edSort: TEdit;
    Label4: TLabel;
    dpAddDate: TDateTimePicker;
    lbl1: TLabel;
    edtParentCode: TEdit;
    lbl2: TLabel;
    procedure edProIDKeyPress(Sender: TObject; var Key: Char);
    procedure edSortKeyPress(Sender: TObject; var Key: Char);
    procedure edtParentCodeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddBugTreeNodeDlg: TAddBugTreeNodeDlg;

implementation

{$R *.dfm}

procedure TAddBugTreeNodeDlg.edProIDKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0','1','2','3','4','5','6','7','8','9',#8,#27]) then
    Key := #0;
end;

procedure TAddBugTreeNodeDlg.edSortKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0','1','2','3','4','5','6','7','8','9',#8,#27]) then
    Key := #0;
end;

procedure TAddBugTreeNodeDlg.edtParentCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['-','0','1','2','3','4','5','6','7','8','9',#8,#27]) then
    Key := #0;
end;

end.
