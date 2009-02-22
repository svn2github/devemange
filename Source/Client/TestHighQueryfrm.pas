unit TestHighQueryfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, StdCtrls, DBCtrls, Buttons, DB, DBClient;

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
begin
  //
  if fShowAllItem then
  begin
    Result := '1=1';
    Exit;
  end;

  mystr :='';
  if chkCode.Checked then
  begin
    mystr := Format('ZID=%d',[StrToIntDef(edtCode.Text,-1)]);
  end;

  if chkProject.Checked then
  begin
    if mystr <> '' then
      mystr := Format('%s and ZPRO_ID=%d ',[mystr,
        cdsPros.FieldByName('ZID').AsInteger])
    else
      mystr :=   Format('ZPRO_ID=%d ',[
        cdsPros.FieldByName('ZID').AsInteger]);

  end;

  if chkBuildUser.Checked then
  begin
    if mystr <> '' then
      mystr := Format('%s and ZOPENEDBY=%d ',[mystr,
        cdsCreateor.FieldByName('ZID').AsInteger])
    else
      mystr :=   Format('ZOPENEDBY=%d ',[
        cdsCreateor.FieldByName('ZID').AsInteger]);
  end;

  if chkTestUser.Checked then
  begin
    if mystr <> '' then
      mystr := Format('%s and ZTESTRESULTBY=%d ',[mystr,
        cdsCoser.FieldByName('ZID').AsInteger])
    else
      mystr :=   Format('ZTESTRESULTBY=%d ',[
        cdsCoser.FieldByName('ZID').AsInteger]);
  end;

  if chkStats.Checked and rbClosed.Checked then
  begin
    if mystr <> '' then
      mystr := Format('%s and ZSTATUS=3',[mystr])
    else
      mystr := 'ZSTATUS=3'
  end;

  if chkStats.Checked and rbOpen.Checked then
  begin
    if mystr <> '' then
      mystr := Format('%s and ZSTATUS<>3',[mystr])
    else
      mystr := 'ZSTATUS<>3'

  end;

  if chkStats.Checked and rbSubmit.Checked then
  begin
    if mystr <> '' then
      mystr := Format('%s and ZSTATUS<>3',[mystr])
    else
      mystr := 'ZSTATUS=4'
  end;

  if chkStats.Checked and rbAction.Checked then
  begin
    if mystr <> '' then
      mystr := Format('%s and ((ZSTATUS=0) or (ZSTATUS=2))',[mystr])
    else
      mystr := '(ZSTATUS=0) or (ZSTATUS=2)'
  end;

  if chkSubmis.Checked then
  begin
    if mystr <> '' then
      mystr := Format('%s and ZSUBMISBY=%d ',[mystr,
        cdssubmis.FieldByName('ZID').AsInteger])
    else
      mystr :=   Format('ZSUBMISBY=%d ',[
        cdssubmis.FieldByName('ZID').AsInteger]);
  end;

  Result := mystr;
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
