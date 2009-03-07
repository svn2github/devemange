unit ChangPasswdfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, StdCtrls, Buttons;

type
  TChangPasswdDlg = class(TBaseDialog)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edPasswd1: TEdit;
    edPasswd2: TEdit;
    lbl1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChangPasswdDlg: TChangPasswdDlg;

implementation

{$R *.dfm}

end.
