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
    cdsSysParams: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsTagNewRecord(DataSet: TDataSet);
    procedure cdsTagBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    fLoading : Boolean;
  public
    { Public declarations }
    procedure LoadSelectUser(AFileName:string);

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
  myfilename : string;
const
  glSQL  ='select ZID,ZNAME,ZEMAIL,ZCHECKTASK,ZTYPE from TB_USER_ITEM where ZSTOP=0 order by ZTYPE';
  glSQL2 = 'select ZID,ZNAME from TB_BUG_PARAMS where ZTYPE=%d';
  glSQL3 = 'select ZNAME,ZCOLOR,ZID from TB_TAG order by ZID desc ';
  glSQL4 = 'select ZID,ZNAME,ZEMAIL,ZCHECKTASK,ZTYPE from TB_USER_ITEM order by ZTYPE';
  glSQL5 = 'select ZNAME,ZVALUE from TB_SYSPARAMS ';

begin
  fLoading := True;
  with ClientSystem.fDbOpr do
  begin

    //if cdsUSer.IsEmpty then
    //  cdsUser.Data := ReadDataSet(PChar(glSQL));

    //if cdsUserAll.IsEmpty then
      //cdsUserAll.Data := ReadDataSet(PChar(glSQL4));

    myfilename := ClientSystem.fAppDir + '/' + gc_selectuser_file;
    LoadSelectUser(myfilename);

    if cdsOS.IsEmpty then
      cdsOS.Data   := ReadDataSet(PChar(format(glSQL2,[3])));

    if cdsSysParams.IsEmpty then
      cdsSysParams.Data := ReadDataSet(PChar(glSQL5));
      
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

procedure TDM.LoadSelectUser(AFileName: string);
var
  i,c : Integer;
  mystr : string;
  myname : string;
  myid : string;
  mysl : TStringList;
  mycodes : TStringList;
  mycds,mycds2 : TClientDataSet;
  myField : TFieldDef;

const
  glSQL  ='select ZID,ZNAME,ZEMAIL,ZCHECKTASK,ZTYPE from TB_USER_ITEM where ZSTOP=0 order by ZTYPE';
  glSQL4 = 'select ZID,ZNAME,ZEMAIL,ZCHECKTASK,ZTYPE from TB_USER_ITEM order by ZTYPE';

begin
  mycds := TClientDataSet.Create(nil);
  mycds2 := TClientDataSet.Create(nil);

  mysl := TStringList.Create;
  mycodes := TStringList.Create;
  try
    mycds.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL));
    mycds2.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL4));

    if cdsUser.Fields.Count = 0 then
    begin
      myField := cdsUser.FieldDefs.AddFieldDef;
      myField.DataType := ftInteger;
      myField.Name := 'ZID';

      myField := cdsUser.FieldDefs.AddFieldDef;
      myField.DataType := ftString;
      myField.Size := 50;
      myField.Name := 'ZNAME';

      myField := cdsUser.FieldDefs.AddFieldDef;
      myField.DataType := ftString;
      myField.Size := 50;
      myField.Name := 'ZEMAIL';

      myField := cdsUser.FieldDefs.AddFieldDef;
      myField.DataType := ftBoolean;
      myField.Name := 'ZCHECKTASK';

      myField := cdsUser.FieldDefs.AddFieldDef;
      myField.DataType := ftInteger;
      myField.Name := 'ZTYPE';


      //cdsUser.FieldDefs.Assign(mycds.FieldDefs);
      cdsUser.CreateDataSet; //
    end;

    if cdsUserAll.Fields.Count = 0 then
    begin
      myField := cdsUserAll.FieldDefs.AddFieldDef;
      myField.DataType := ftInteger;
      myField.Name := 'ZID';

      myField := cdsUserAll.FieldDefs.AddFieldDef;
      myField.DataType := ftString;
      myField.Size := 50;
      myField.Name := 'ZNAME';

      myField := cdsUserAll.FieldDefs.AddFieldDef;
      myField.DataType := ftString;
      myField.Size := 50;
      myField.Name := 'ZEMAIL';

      myField := cdsUserAll.FieldDefs.AddFieldDef;
      myField.DataType := ftBoolean;
      myField.Name := 'ZCHECKTASK';

      myField := cdsUserAll.FieldDefs.AddFieldDef;
      myField.DataType := ftInteger;
      myField.Name := 'ZTYPE';


      //cdsUser.FieldDefs.Assign(mycds.FieldDefs);
      cdsUserAll.CreateDataSet; //
    end;



    //清空原来的数据
    while not cdsUser.IsEmpty do
    begin
      cdsUser.Delete;
    end;

    while not cdsUserAll.IsEmpty do
    begin
      cdsUserAll.Delete;
    end;

    if FileExists(AFileName) then
    begin
      mysl.LoadFromFile(AFileName);
      for i:=0 to mysl.Count -1 do
      begin
        mystr := mysl.Strings[i];
        myname := Copy(mystr,1,Pos('(',mystr)-1);
        myid   := Copy(mystr,Pos('(',mystr)+1,Pos(')',mystr)-Pos('(',mystr)-1);
        if mycds.Locate('ZID',StrToIntDef(myid,-1),[loPartialKey]) then
        begin
          cdsUser.Append;
          for c := 0 to mycds.FieldDefs.Count -1 do
            cdsUser.FieldByName(mycds.Fields[c].FieldName).AsVariant :=
             mycds.FieldByName(mycds.Fields[c].FieldName).AsVariant;
          mycodes.Add(myid);
          cdsUser.Post;

        end;

        if mycds2.Locate('ZID',StrToIntDef(myid,-1),[loPartialKey]) then
        begin
          cdsUserAll.Append;
          for c := 0 to mycds2.FieldDefs.Count -1 do
            cdsUserAll.FieldByName(mycds2.Fields[c].FieldName).AsVariant :=
             mycds2.FieldByName(mycds2.Fields[c].FieldName).AsVariant;
          cdsUserAll.Post;
        end;

      end;



    end;

   //增加其他的内容
    mycds.First;
    while not mycds.Eof do
    begin
      if mycodes.IndexOf(mycds.FieldByName('ZID').AsString)<0 then
      begin
        cdsUser.Append;
        for c := 0 to mycds.FieldDefs.Count -1 do
          cdsUser.FieldByName(mycds.Fields[c].FieldName).AsVariant :=
           mycds.FieldByName(mycds.Fields[c].FieldName).AsVariant;
        cdsUser.Post;
      end;
      mycds.Next;
    end;

    mycds2.First;
    while not mycds2.Eof do
    begin
      if mycodes.IndexOf(mycds2.FieldByName('ZID').AsString)<0 then
      begin
        cdsUserAll.Append;
        for c := 0 to mycds2.FieldDefs.Count -1 do
          cdsUserAll.FieldByName(mycds2.Fields[c].FieldName).AsVariant :=
           mycds2.FieldByName(mycds2.Fields[c].FieldName).AsVariant;
        cdsUserAll.Post;
      end;
      mycds2.Next;
    end;

  finally
    mysl.Free;
    mycds.Free;
    mycodes.Free;
    mycds2.Free;
  end;
end;

end.
