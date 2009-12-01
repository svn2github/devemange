unit GetSVNVerfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, StdCtrls, Buttons, Grids, DBGrids, DB, DBClient,
  DBCtrls, ComCtrls;

type
  TGetSVNVerDlg = class(TBaseDialog)
    lbl1: TLabel;
    edtVer: TEdit;
    ds1: TDataSource;
    cds1: TClientDataSet;
    dbgrd1: TDBGrid;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TButton;
    dbmmoZMESSAGE: TDBMemo;
    ani1: TAnimate;
    chk15: TCheckBox;
    edtCount: TEdit;
    procedure cds1CalcFields(DataSet: TDataSet);
    procedure btn3Click(Sender: TObject);
    procedure dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cds1AfterScroll(DataSet: TDataSet);
  private
    fLoading : Boolean;
    { Private declarations }
    procedure LoadSVNData();

  public
    { Public declarations }
  end;


  function ShowGetSVNVer(var AVer:String) : Boolean;

implementation
uses
  ClinetSystemUnits;

{$R *.dfm}

  function ShowGetSVNVer(var AVer:String) : Boolean;
  begin
    with TGetSVNVerDlg.Create(nil) do
    try
      edtVer.Text := AVer;
      fLoading := False;
      ani1.ResName := 'MOV';
      Result := ShowModal = mrok;
      if Result then
        AVer := edtVer.Text;
    finally
      free;
    end;
  end;

{ TGetSVNVerDlg }

procedure TGetSVNVerDlg.LoadSVNData;
var
  i : integer;
  mycds : TClientDataSet;
  myField : TFieldDef;
  myb : Boolean;
  mystr : string;
const
  gl_SQLTXT = 'select top %d ZVERSION,ZAUTHOR,ZDATE,ZMESSAGE ' +
    'from TB_SVN_COMMITS order by ZID DESC';
begin

  myb := fLoading;
  mycds := TClientDataSet.Create(nil);
  ani1.Visible := True;
  cds1.DisableControls;
  try
    fLoading := True;
    ani1.Active := True;
    Application.ProcessMessages;
    if chk15.Checked then
      mystr := Format(gl_SQLTXT,[StrToIntDef(edtCount.Text,15)])
    else
      mystr := Format(gl_SQLTXT,[6]);
      
    mycds.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mystr));

    if cds1.Active then
      while not cds1.Eof do cds1.Delete;

    cds1.Close;
    cds1.FieldDefs.Clear;
    cds1.Fields.Clear;
    cds1.FieldDefs.Assign(mycds.FieldDefs);
    with cds1 do
    begin
      for i:=0 to FieldDefs.Count -1 do
        FieldDefs[i].CreateField(cds1);

      //ÏîÄ¿Ãû³Æ
      myField := cds1.FieldDefs.AddFieldDef ;
      myField.Name := 'ZMESSAGETEXT';
      myField.DataType := ftString;
      myField.Size := 4000;
      with myfield.CreateField(cds1) do
      begin
        FieldKind := fkCalculated;
      end;
    end;
    cds1.CreateDataSet;

    mycds.First;
    while not mycds.Eof do
    begin
      cds1.Append;
      cds1.FieldByName('ZVERSION').AsString := mycds.FieldByName('ZVERSION').AsString;
      cds1.FieldByName('ZAUTHOR').AsString  := mycds.FieldByName('ZAUTHOR').AsString;
      cds1.FieldByName('ZDATE').AsString    := mycds.FieldByName('ZDATE').AsString;
      cds1.FieldByName('ZMESSAGE').AsString := mycds.FieldByName('ZMESSAGE').AsString;
      cds1.Post;

      mycds.Next;
    end;

    cds1.First;
    edtVer.Text := cds1.FieldByName('ZVERSION').AsString;
    
  finally
    mycds.free;
    ani1.Active := False;
    ani1.Visible := False;
    fLoading := myb;
    cds1.EnableControls;
  end;

end;

procedure TGetSVNVerDlg.cds1CalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('ZMESSAGETEXT').AsString :=
  DataSet.FieldByName('ZMESSAGE').AsString;
end;

procedure TGetSVNVerDlg.btn3Click(Sender: TObject);
begin
  LoadSVNData;
end;

procedure TGetSVNVerDlg.dbgrd1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (cds1.RecNo mod 2  = 0) and not ( gdSelected in State)  then
    dbgrd1.Canvas.Brush.Color := clSilver;

  dbgrd1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TGetSVNVerDlg.cds1AfterScroll(DataSet: TDataSet);
begin
  if fLoading  then Exit;
  edtVer.Text := cds1.FieldByName('ZVERSION').AsString;
end;

end.
