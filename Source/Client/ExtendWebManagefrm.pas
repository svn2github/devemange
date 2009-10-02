unit ExtendWebManagefrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, DB, DBClient, Grids, DBGrids, ExtCtrls, StdCtrls,
  DBCtrls, Buttons,EncdDecd;

type
  TExtendWebManageDlg = class(TBaseDialog)
    cdsData: TClientDataSet;
    dsData: TDataSource;
    dbgrdItem: TDBGrid;
    dbmmoValue: TDBMemo;
    spl1: TSplitter;
    mmoHtmlEdit: TMemo;
    pnlButtom: TPanel;
    bitEdit: TBitBtn;
    bitSaveContent: TBitBtn;
    bntCancelSave: TBitBtn;
    bitAdd: TBitBtn;
    bitDel: TBitBtn;
    procedure bitEditClick(Sender: TObject);
    procedure bitSaveContentClick(Sender: TObject);
    procedure bntCancelSaveClick(Sender: TObject);
    procedure bitAddClick(Sender: TObject);
    procedure cdsDataNewRecord(DataSet: TDataSet);
    procedure cdsDataBeforePost(DataSet: TDataSet);
    procedure bitDelClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure initform;
  end;


implementation

uses ClinetSystemUnits;


{$R *.dfm}

{ TExtendWebManageDlg }

procedure TExtendWebManageDlg.initform;
var
  mycds : TClientDataSet;
  myfield : TFieldDef;
  i : Integer;
const
  gc_SQLTXT = 'select * from TB_EXTENDWEB';
begin
  //
  mycds := TClientDataSet.Create(nil);
  try
    mycds.Data := ClientSystem.fDbOpr.ReadDataSet(gc_SQLTXT);
    cdsData.FieldDefs.Clear;
    cdsData.FieldDefs.Assign(mycds.FieldDefs);
    myfield := cdsData.FieldDefs.AddFieldDef;
    myfield.Name := 'ZISNEW';
    myfield.DataType := ftBoolean;
    myfield := cdsData.FieldDefs.AddFieldDef;
    myfield.Name := 'ZMYID';
    myfield.DataType := ftInteger;
    cdsData.CreateDataSet;

    mycds.First;
    while not mycds.Eof do
    begin
      cdsData.Append;
      cdsData.FieldByName('ZISNEW').AsBoolean := False;
      for i:=0 to mycds.FieldDefs.Count -1 do
      begin
        if mycds.FieldDefs[i].Name = 'ZID' then
        begin
          cdsData.FieldByName('ZMYID').AsInteger :=
            mycds.FieldByName('ZID').AsInteger;
        end
        else
          cdsData.FieldByName(mycds.FieldDefs[i].Name).AsVariant :=
            mycds.FieldByName(mycds.FieldDefs[i].Name).AsVariant
      end;
      cdsData.Post;
      mycds.Next;
    end;

  finally
    mycds.Free;
  end;
end;

procedure TExtendWebManageDlg.bitEditClick(Sender: TObject);
begin
  if cdsData.IsEmpty then Exit;
  mmoHtmlEdit.Lines.Text := DecodeString(cdsData.FieldByName('ZVALUE').AsString);
end;

procedure TExtendWebManageDlg.bitSaveContentClick(Sender: TObject);
begin
  if cdsData.IsEmpty then Exit;
  if not (cdsData.State in [ dsEdit, dsInsert]) then
    cdsData.Edit;
  cdsData.FieldByName('ZVALUE').AsString := EncodeString(mmoHtmlEdit.Lines.Text);
end;

procedure TExtendWebManageDlg.bntCancelSaveClick(Sender: TObject);
begin
  if cdsData.State in [dsEdit, dsInsert] then
    cdsData.Cancel;
end;

procedure TExtendWebManageDlg.bitAddClick(Sender: TObject);
begin
  if cdsData.State in [dsEdit, dsInsert] then
    cdsData.Post;
  cdsData.Append;  //增加行
end;

procedure TExtendWebManageDlg.cdsDataNewRecord(DataSet: TDataSet);
begin
  cdsData.FieldByName('ZISNEW').AsBoolean := True;
end;

procedure TExtendWebManageDlg.cdsDataBeforePost(DataSet: TDataSet);
var
  mySQL : string;
const
  gl_SQLTXT = 'insert TB_EXTENDWEB (ZTYPE,ZNAME,ZVALUE,ZSORT) values(%d,''%s'',''%s'',%d)';
  gl_SQLTXT2 = 'update TB_EXTENDWEB set ZTYPE=%d,ZNAME=''%s'',ZVALUE=''%s'',ZSORT=%d where ZID=%d';
begin
  if DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    mySQL := Format(gl_SQLTXT,[
      DataSet.FieldByName('ZTYPE').AsInteger,
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZVALUE').AsString,
      DataSet.FieldByName('ZSORT').AsInteger
      ]);
    DataSet.FieldByName('ZISNEW').AsBoolean := False;
  end
  else begin
    mySQL := Format(gl_SQLTXT2,[
      DataSet.FieldByName('ZTYPE').AsInteger,
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZVALUE').AsString,
      DataSet.FieldByName('ZSORT').AsInteger,
      DataSet.FieldByName('ZMYID').AsInteger
      ]);
  end;
  ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
end;

procedure TExtendWebManageDlg.bitDelClick(Sender: TObject);
var
  mySQL : string;
const
  gl_SQLTXT = 'delete TB_EXTENDWEB where ZID=%d';
begin
  if cdsData.IsEmpty then Exit;
  if MessageBox(Handle,'是否删除?','提示',MB_ICONQUESTION+MB_YESNO)=IDNO then
    Exit;

  mySQL := Format(gl_SQLTXT,[cdsData.FieldByName('ZMYID').AsInteger]);
  ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
  cdsData.Delete;  
end;


end.
