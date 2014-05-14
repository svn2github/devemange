unit TestHighQueryfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, StdCtrls, DBCtrls, Buttons, DB, DBClient,
  ComCtrls;

type
  TTestHighQueryDlg = class(TBaseDialog)
    chkCode: TCheckBox;
    edtCode: TEdit;
    chkProject: TCheckBox;
    dblkcbb1: TDBLookupComboBox;
    chkBuildUser: TCheckBox;
    dblkcbb2: TDBLookupComboBox;
    btn1: TBitBtn;
    btn2: TBitBtn;
    cdsPros: TClientDataSet;
    dsPros: TDataSource;
    cdsCreateor: TClientDataSet;
    dsCreateor: TDataSource;
    chkTestUser: TCheckBox;
    cdsCoser: TClientDataSet;
    dsCloser: TDataSource;
    dblkcbb3: TDBLookupComboBox;
    rbClosed: TRadioButton;
    rbOpen: TRadioButton;
    btnAll: TBitBtn;
    chkStats: TCheckBox;
    rbSubmit: TRadioButton;
    rbAction: TRadioButton;
    chkSubmis: TCheckBox;
    dblkcbb4: TDBLookupComboBox;
    cdssubmis: TClientDataSet;
    dssubmis: TDataSource;
    chkopendate: TCheckBox;
    dtpopendate: TDateTimePicker;
    dtpopendate2: TDateTimePicker;
    chkresultdate: TCheckBox;
    dtpresultdate: TDateTimePicker;
    dtpresultdate2: TDateTimePicker;
    procedure edtCodeChange(Sender: TObject);
    procedure btnAllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fShowAllItem : Boolean ; //=True 表示显示全部
    function GetwhereStr():string;
  end;

implementation


{$R *.dfm}

{ TTestHighQueryDlg }

function TTestHighQueryDlg.GetwhereStr: string;
var
  mystr : string;
  mywhere : string;
begin
  //
  mywhere := '1=1';
  if fShowAllItem then
  begin
    Result := mywhere;
    Exit;
  end;

  mystr :='';
  if chkCode.Checked then
  begin
    mystr := Format('ZID=%d',[StrToIntDef(edtCode.Text,-1)]);
    if mystr <> '' then mywhere := mywhere + ' and ' + mystr;
  end;


  mystr :='';
  if chkProject.Checked then
  begin
    mystr :=   Format('ZPRO_ID=%d ',[
        cdsPros.FieldByName('ZID').AsInteger]);

    if mystr <> '' then mywhere := mywhere + ' and ' + mystr;
  end;

  mystr :='';
  if chkBuildUser.Checked then
  begin
      mystr :=   Format('ZOPENEDBY=%d ',[
        cdsCreateor.FieldByName('ZID').AsInteger]);
    if mystr <> '' then mywhere := mywhere + ' and ' + mystr;
  end;

  mystr :='';
  if chkTestUser.Checked then
  begin
      mystr :=   Format('ZTESTRESULTBY=%d ',[
        cdsCoser.FieldByName('ZID').AsInteger]);
    if mystr <> '' then mywhere := mywhere + ' and ' + mystr;
  end;

  mystr :='';
  if chkStats.Checked and rbClosed.Checked then
  begin
     mystr := 'ZSTATUS=3';
    if mystr <> '' then mywhere := mywhere + ' and ' + mystr;
  end;

  mystr :='';
  if chkStats.Checked and rbOpen.Checked then
  begin
      mystr := 'ZSTATUS<>3';
    if mystr <> '' then mywhere := mywhere + ' and ' + mystr;
  end;

  mystr :='';
  if chkStats.Checked and rbSubmit.Checked then
  begin
      mystr := 'ZSTATUS=4';
      if mystr <> '' then mywhere := mywhere + ' and ' + mystr;
  end;

  mystr :='';
  if chkStats.Checked and rbAction.Checked then
  begin
      mystr := '(ZSTATUS=0) or (ZSTATUS=2)';
    if mystr <> '' then mywhere := mywhere + ' and ' + mystr;
  end;

  mystr :='';
  if chkSubmis.Checked then
  begin

      mystr :=   Format('ZSUBMISBY=%d ',[
        cdssubmis.FieldByName('ZID').AsInteger]);
    if mystr <> '' then mywhere := mywhere + ' and ' + mystr;
  end;

  //创建时间
  mystr := '';
  if chkopendate.Checked then
  begin
    mystr := format('(ZOPENEDDATE between ''%s'' and ''%s'')  ',
      [''''+datetostr(dtpopendate.Date)+'''',''''+datetostr(dtpopendate2.Date)+'''']);
  end;
  if mystr <> '' then mywhere := mywhere + ' and ' + mystr;

  //完成时间
  mystr := '';
  if chkresultdate.Checked then
  begin
    mystr := format('(ZRESULTDATE between ''%s'' and ''%s'')  ',
      [''''+datetostr(dtpresultdate.Date)+'''',''''+datetostr(dtpresultdate2.Date)+'''']);
  end;
  if mystr <> '' then mywhere := mywhere + ' and ' + mystr;

  Result := mywhere;
end;

procedure TTestHighQueryDlg.edtCodeChange(Sender: TObject);
begin
  chkCode.Checked := edtCode.Text <> '';
end;

procedure TTestHighQueryDlg.btnAllClick(Sender: TObject);
begin
  fShowAllItem := True;
  ModalResult := mrOK;
end;

procedure TTestHighQueryDlg.FormShow(Sender: TObject);
begin
  inherited;
  fShowAllItem := False;
end;

end.
