unit DmUints;

interface

uses
  SysUtils, Classes, ImgList, Controls, DB, DBClient;

type
  TDM = class(TDataModule)
    ImageListTree: TImageList;
    ImageList1: TImageList;
    cdsUser: TClientDataSet;
    cdsOS: TClientDataSet;
    dsOS: TDataSource;
    dsUsers: TDataSource;
    cdsTag: TClientDataSet;
    dstag: TDataSource;
    cdsUserAll: TClientDataSet;
    dsUserAll: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsTagNewRecord(DataSet: TDataSet);
    procedure cdsTagBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    fLoading : Boolean;
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation
uses
  Graphics,
  ClientTypeUnits,
  ClinetSystemUnits;
{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  mycds : TClientDataSet;
  myField : TFieldDef;
const
  glSQL  ='select ZID,ZNAME,ZEMAIL,ZCHECKTASK,ZTYPE from TB_USER_ITEM where ZSTOP=0 ';
  glSQL2 = 'select ZID,ZNAME from TB_BUG_PARAMS where ZTYPE=%d';
  glSQL3 = 'select ZNAME,ZCOLOR,ZID from TB_TAG order by ZID desc ';
  glSQL4 = 'select ZID,ZNAME,ZEMAIL,ZCHECKTASK,ZTYPE from TB_USER_ITEM';

begin
  fLoading := True;
  with ClientSystem.fDbOpr do
  begin
    if cdsUSer.IsEmpty then
      cdsUser.Data := ReadDataSet(PChar(glSQL));
    if cdsOS.IsEmpty then
      cdsOS.Data   := ReadDataSet(PChar(format(glSQL2,[3])));
    if cdsUserAll.IsEmpty then
      cdsUserAll.Data := ReadDataSet(PChar(glSQL4));
      
    if cdsTag.IsEmpty then
    begin
      mycds := TClientDataSet.Create(nil);
      mycds.Data  := ReadDataSet(PChar(glSQL3));
      cdsTag.FieldDefs.Assign(mycds.FieldDefs);
      myField := cdsTag.FieldDefs.AddFieldDef;
      myField.DataType := ftBoolean;
      myField.Name := 'ZISNEW';
      myField := cdsTag.FieldDefs.AddFieldDef;
      myField.DataType := ftInteger;
      myField.Name := 'ZAUTOID';
      cdsTag.CreateDataSet;

      mycds.First;
      while not mycds.Eof do
      begin
        cdsTag.Append;
        cdsTag.FieldByName('ZISNEW').AsBoolean := False;
        cdsTag.FieldByName('ZAUTOID').AsInteger := mycds.FieldByName('ZID').AsInteger;
        cdsTag.FieldByName('ZNAME').AsString := mycds.FieldByName('ZNAME').AsString;
        cdsTag.FieldByName('ZCOLOR').AsInteger := mycds.FieldByName('ZCOLOR').AsInteger;
        cdsTag.Post;
        mycds.Next;
      end;
      mycds.Free;
    end;
  end;
  fLoading := False;
end;

procedure TDM.cdsTagNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
end;

procedure TDM.cdsTagBeforePost(DataSet: TDataSet);
var
  mySQL : string;
const
  glSQL1 = 'insert TB_TAG(ZNAME,ZCOLOR) values(''%s'',%d)';
  glSQL2 = 'update TB_TAG set ZNAME=''%s'',ZCOLOR=%d where ZID=%d';
begin
  if fLoading then Exit;
  
  if DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    mySQL := Format(glSQL1,[
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZCOLOR').AsInteger
      ]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
    DataSet.FieldByName('ZISNEW').AsBoolean := False;
  end
  else begin
    mySQL := Format(glSQL1,[
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZCOLOR').AsInteger,
      DataSet.FieldByName('ZAUTOID').AsInteger
      ]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));

  end;
end;

end.
