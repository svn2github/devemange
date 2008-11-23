unit SetSysParamsfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, DB, DBClient, Grids, DBGrids, StdCtrls, DBCtrls;

type
  TSetParamsDlg = class(TBaseDialog)
    cdsParams: TClientDataSet;
    dsParams: TDataSource;
    dbgrdParams: TDBGrid;
    dbmmoZVALUE: TDBMemo;
    procedure FormShow(Sender: TObject);
    procedure cdsParamsBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    fLoading : Boolean;
    procedure initfrom;
  public
    { Public declarations }
  end;

implementation

uses ClinetSystemUnits;

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
const
  glSQL2 = 'update TB_SYSPARAMS set ZVALUE=''%s'' where ZNAME=''%s''';
begin

  if fLoading then Exit;
  ClientSystem.fDbOpr.BeginTrans;
  try
    mysql := format(glSQL2,[
        DataSet.FieldByName('ZVALUE').AsString,
        DataSet.FieldByName('ZNAME').AsString]);

    ClientSystem.fDbOpr.ExeSQL(Pchar(mysql));
    ClientSystem.fDbOpr.CommitTrans;
  except
    ClientSystem.fDbOpr.RollbackTrans;
  end;
end;

end.
