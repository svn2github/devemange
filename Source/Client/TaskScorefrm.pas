unit TaskScorefrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  TTaskScoreDlg = class(TBaseDialog)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    Bevel1: TBevel;
    Label8: TLabel;
    dbedtZTASKSCORE: TDBEdit;
    dbedtZRATE: TDBEdit;
    Label9: TLabel;
    dbmmoZREMASK: TDBMemo;
    Label1: TLabel;
    dbtxtZPERFACT: TDBText;
    lbl1: TLabel;
    Label5: TLabel;
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
