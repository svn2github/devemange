unit TickDateTimefrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, StdCtrls, Buttons, ComCtrls;

type
  TTickDateTimeDlg = class(TBaseDialog)
    cal1: TMonthCalendar;
    btn1: TBitBtn;
    btn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TickDateTimeDlg: TTickDateTimeDlg;

implementation

{$R *.dfm}

end.
