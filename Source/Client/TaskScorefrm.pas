unit TaskScorefrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls,DB;

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
    mmo1: TMemo;
    chkAmount: TCheckBox;
    cbEasy: TCheckBox;
    CheckUnitsDeiged: TCheckBox;
    cbUnitTest: TCheckBox;
    cbCode: TCheckBox;
    btnCalc: TBitBtn;
    chkOther: TCheckBox;
    edtAmountRate: TEdit;
    edtEasyRate: TEdit;
    edtCodeRate: TEdit;
    edtUnitDesig: TEdit;
    edUnitsTestRate: TEdit;
    edtOtherRate: TEdit;
    lbl1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure btnCalcClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    fScoreStr : string; //评分的内容
    fTaskScore : Extended; //任务分数
  end;

var
  TaskScoreDlg: TTaskScoreDlg;

implementation

uses ProjectManageClientfrm;

{$R *.dfm}

procedure TTaskScoreDlg.btnCalcClick(Sender: TObject);
var
  myv,v : Extended;
  mystr : string;
  myTotal : Extended;
begin
  //
  // 计算分值
  //
  myTotal := strtofloat(dbtxtZPERFACT.Caption);
  myv := 0;
  fTaskScore := 0;
  if chkAmount.Checked then
  begin
    v := myTotal * strtofloatdef(edtAmountRate.Text,0) /100;
    mystr := mystr +#13#10 +format('工作量大小占 %s=%f',[edtAmountRate.Text+'%',v]);
    myv := myv+v;
  end;

  if cbEasy.Checked then
  begin
    v := myTotal *  strtofloatdef(edtEasyRate.Text,0)/100;
    myv := myv + v;
    mystr := mystr +#13#10+ format('难易程度占 %s =%f',[edtEasyRate.Text+'%',v]);
  end;

  if CheckUnitsDeiged.Checked then
  begin
    v := myTotal *  strtofloatdef(edtUnitDesig.Text,0)/100;
    myv := myv + v;
    mystr := mystr +#13#10+ format('任务单祥细设计占 %s =%f',[edtUnitDesig.Text+'%',v]);
  end;

  if cbUnitTest.Checked then
  begin
    v := myTotal * strtofloatdef(edUnitsTestRate.Text,0)/100;
    myv := myv + v;
    mystr := mystr + #13#10 + format('任务单测试占 %s =%f',[edUnitsTestRate.Text+'%', v]);
  end;

  if cbCode.Checked then
  begin
    v := myTotal * strtofloatdef(edtCodeRate.Text,0)/100;
    myv := myv +v;
    mystr := mystr +#13#10+format('代码质量占 %s =%f',[edtCodeRate.Text+'%',v]);
  end;

  if chkOther.Checked then
  begin
    v := myTotal * strtofloatdef(edtOtherRate.Text,0)/100;
    myv := myv + v;
    mystr := mystr +#13#10 +format('其他情况占 %s =%f',[edtOtherRate.Text+'%',v]);
  end;
  fScoreStr := mystr;

  dbedtZTASKSCORE.Text := floattostr(myv);
  fTaskScore := myv;

end;

end.
