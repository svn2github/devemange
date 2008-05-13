unit WriteToDaySayfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, DB, DBClient, Grids, DBGrids ;

type
  TWriteToDaySayDlg = class(TBaseDialog)
    cdsSay: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure cdsSayBeforePost(DataSet: TDataSet);
    procedure cdsSayNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    fLoading : Boolean;
    procedure initfrom;
  public
    { Public declarations }
  end;


implementation
uses
  ClinetSystemUnits;

{$R *.dfm}

{ TWriteToDaySayDlg }

procedure TWriteToDaySayDlg.initfrom;
var
  i : integer;
  mycds : TClientDataSet;
  myfield : TFieldDef;
  myb : Boolean;
const
  glSQL = 'select * from TB_TODAYSAY Order by ZID DESC ';
begin
  myb := fLoading;
  fLoading := True;
  mycds := TClientDataSet.Create(nil);
  try

    mycds.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL));
    with cdsSay do
    begin
      Fields.Clear;
      FieldDefs.Assign(mycds.FieldDefs);
      myfield := FieldDefs.AddFieldDef;
      myfield.Name :='ZISNEW';
      myfield.DataType := ftBoolean;
      for i:=0 to FieldDefs.Count -1 do
           FieldDefs[i].CreateField(cdsSay);

      myField := FieldDefs.AddFieldDef;
      myField.Name := 'ZMYID';   // 对应与库的ZID ，因为ZID是自动的
      myField.DataType := ftInteger;
      myField.CreateField(cdsSay);

      CreateDataSet;
    end;

    cdsSay.DisableControls;
    try
      mycds.First;
      while not mycds.Eof do
      begin
        cdsSay.Append;
        cdsSay.FieldByName('ZISNEW').AsBoolean := False;
        for i:=0 to mycds.FieldDefs.Count -1 do
        begin
          if mycds.FieldDefs[i].Name = 'ZID' then
            cdsSay.FieldByName('ZMYID').AsInteger := mycds.FieldByName('ZID').AsInteger
          else
            cdsSay.FieldByName(mycds.FieldDefs[i].Name).AsVariant :=
              mycds.FieldByName(mycds.FieldDefs[i].Name).AsVariant;
        end;
        cdsSay.Post;
        mycds.Next;
      end;
      cdsSay.First;
    finally
      cdsSay.EnableControls;
    end;

  finally
    mycds.Free;
    fLoading := myb ;
  end;
end;

procedure TWriteToDaySayDlg.FormShow(Sender: TObject);
begin
  fLoading := False;
  initfrom;
end;

procedure TWriteToDaySayDlg.cdsSayBeforePost(DataSet: TDataSet);
var
  mysql : String;
const
  glSQL  = 'insert TB_TODAYSAY(ZNAME,ZDATE,ZSTOP) ' +
           'values(''%s'',''%s'',0)';
  glSQL2 = 'update TB_TODAYSAY set ZNAME=''%s'',ZSTOP=%d where ZID=%d';
begin

  if fLoading then Exit;
  
  if DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    ClientSystem.fDbOpr.BeginTrans;
    try
      mysql := format(glSQL,[
        DataSet.FieldByName('ZNAME').AsString,
        DateTimeToStr(ClientSystem.SysNow)]);
      ClientSystem.fDbOpr.ExeSQL(Pchar(mysql));
      ClientSystem.fDbOpr.CommitTrans;
      DataSet.FieldByName('ZISNEW').AsBoolean := False;
    except
      ClientSystem.fDbOpr.RollbackTrans;
    end;
  end
  else begin
    ClientSystem.fDbOpr.BeginTrans;
    try
      if UpperCase(DataSet.FieldByName('ZSTOP').AsString) = 'TRUE' then
        mysql := format(glSQL2,[
          DataSet.FieldByName('ZNAME').AsString,1,
          DataSet.FieldByName('ZMYID').AsInteger])
      else
        mysql := format(glSQL2,[
          DataSet.FieldByName('ZNAME').AsString,0,
          DataSet.FieldByName('ZMYID').AsInteger]);

      ClientSystem.fDbOpr.ExeSQL(Pchar(mysql));
      ClientSystem.fDbOpr.CommitTrans;
    except
      ClientSystem.fDbOpr.RollbackTrans;
    end;
  end;

end;

procedure TWriteToDaySayDlg.cdsSayNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
  DataSet.FieldByName('ZDATE').AsDateTime := ClientSystem.SysNow;
end;

end.
