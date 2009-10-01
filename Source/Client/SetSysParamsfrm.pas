unit SetSysParamsfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, DB, DBClient, Grids, DBGrids, StdCtrls, DBCtrls,
  ExtCtrls, Buttons;

type
  TSetParamsDlg = class(TBaseDialog)
    cdsParams: TClientDataSet;
    dsParams: TDataSource;
    dbgrdParams: TDBGrid;
    dbmmoZVALUE: TDBMemo;
    pnlTool: TPanel;
    Splitter1: TSplitter;
    btnView: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure cdsParamsBeforePost(DataSet: TDataSet);
    procedure btnViewClick(Sender: TObject);
  private
    { Private declarations }
    fLoading : Boolean;
    procedure initfrom;
  public
    { Public declarations }
  end;

implementation

uses ClinetSystemUnits,EncdDecd;

{$R *.dfm}

{ TSetParamsDlg }

procedure TSetParamsDlg.initfrom;
var
  i : integer;
  mycds : TClientDataSet;
  myb : Boolean;
const
  glSQL = 'select * from TB_SYSPARAMS';
begin
  myb := fLoading;
  fLoading := True;
  mycds := TClientDataSet.Create(nil);
  try

    mycds.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL));
    with cdsParams do
    begin
      Fields.Clear;
      FieldDefs.Assign(mycds.FieldDefs);
      CreateDataSet;
    end;

    cdsParams.DisableControls;
    try
      mycds.First;
      while not mycds.Eof do
      begin
        cdsParams.Append;
        for i:=0 to mycds.FieldDefs.Count -1 do
        begin
          cdsParams.FieldByName(mycds.FieldDefs[i].Name).AsVariant :=
              mycds.FieldByName(mycds.FieldDefs[i].Name).AsVariant;
        end;
        cdsParams.Post;
        mycds.Next;
      end;
      cdsParams.First;
    finally
      cdsParams.EnableControls;
    end;

  finally
    mycds.Free;
    fLoading := myb ;
  end;
end;


procedure TSetParamsDlg.FormShow(Sender: TObject);
begin
  fLoading := False;
  initfrom;
end;

procedure TSetParamsDlg.cdsParamsBeforePost(DataSet: TDataSet);
var
  mysql : String;
  mystr : string;
const
  glSQL2 = 'update TB_SYSPARAMS set ZVALUE=''%s'' where ZNAME=''%s''';
begin

  //
  //采用base64字符串来处理
  //
  if fLoading then Exit;
  ClientSystem.fDbOpr.BeginTrans;
  try
    mystr := EncodeString(DataSet.FieldByName('ZVALUE').AsString);
    mysql := format(glSQL2,[
        mystr,
        DataSet.FieldByName('ZNAME').AsString]);

    ClientSystem.fDbOpr.ExeSQL(Pchar(mysql));
    ClientSystem.fDbOpr.CommitTrans;
  except
    ClientSystem.fDbOpr.RollbackTrans;
  end;
end;

procedure TSetParamsDlg.btnViewClick(Sender: TObject);
var
  mystr : string;
begin
  if cdsParams.IsEmpty then Exit;
  mystr := DecodeString(cdsParams.FieldByName('ZVALUE').AsString);
  ShowMessage(mystr);
end;

end.
