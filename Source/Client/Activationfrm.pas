///////////////////////////////////////////////////////////////////////////////
//
//  作者:龙仕云  创建时间: 2009-11-04
//  功能描述:
//
//  修改历史记录:
//       编号  作者     修改日期   修改内容
//
//
///////////////////////////////////////////////////////////////////////////////

unit Activationfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, StdCtrls, Buttons;

type
  TActivationDlg = class(TBaseDialog)
    lbl1: TLabel;
    edtID: TEdit;
    lbl2: TLabel;
    edtName: TEdit;
    lbl3: TLabel;
    mmoNote: TMemo;
    Btn1: TBitBtn;
    Btn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
    fType : Integer;
    fAcivate_UserID : Integer; //提交人的id
    procedure PostData();
  end;

implementation
uses
  ClinetSystemUnits;

{$R *.dfm}

{ TActivationDlg }

procedure TActivationDlg.PostData;
var
  mySQL : string;
  mydatetime : TDateTime;
const
  gl_SQLTXT = 'insert TB_TODAYRESULT (ZTYPE,ZUSER_ID,ZDATETIME,ZCONTENTID, ' +
    'ZCONTENT,ZNOTE,ZWRITER,ZACTION) values(%d,%d,''%s'',%d,''%s'',''%s'',%d,%d)';
begin
  mydatetime := ClientSystem.fDbOpr.GetSysDateTime;
  mySQL := Format(gl_SQLTXT,[
    fType,
    fAcivate_UserID,
    DateToStr(mydatetime),
    StrToIntDef(edtID.Text,0),
    edtName.Text ,
    mmoNote.Text ,
    ClientSystem.fEditer_id,
    0]);
  ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
end;

end.
