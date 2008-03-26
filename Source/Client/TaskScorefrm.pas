unit TaskScorefrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  TTaskScoreDlg = class(TBaseDialog)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    Bevel1: TBevel;
    Label6: TLabel;
    Label7: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TaskScoreDlg: TTaskScoreDlg;

implementation

uses ProjectManageClientfrm;

{$R *.dfm}

end.
