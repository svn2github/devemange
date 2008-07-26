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
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation
uses
  ClinetSystemUnits;
{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
const
  glSQL  ='select ZID,ZNAME,ZEMAIL from TB_USER_ITEM where ZSTOP=0 ';
  glSQL2 = 'select ZID,ZNAME from TB_BUG_PARAMS where ZTYPE=%d';
begin

  with ClientSystem.fDbOpr do
  begin
    if cdsUSer.IsEmpty then
      cdsUser.Data := ReadDataSet(PChar(glSQL));
    if cdsOS.IsEmpty then
      cdsOS.Data   := ReadDataSet(PChar(format(glSQL2,[3])));
  end;
end;

end.
