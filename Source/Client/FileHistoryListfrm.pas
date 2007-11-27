unit FileHistoryListfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, DBClient;

type
  TFileHistoryListDlg = class(TForm)
    BitBtn2: TBitBtn;
    lvfiles: TListView;
    MemoNote: TMemo;
    cdsExec: TClientDataSet;
    btDnowfile: TBitBtn;
    procedure btDnowfileClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure lvfilesClick(Sender: TObject);
  private
    { Private declarations }
    ffile_id :integer;
    fLoading : Boolean;
    ffilever : integer;
  public
    procedure iniform;
  end;

  function ShowFileHistoryList(AFile_ID:integer;var Aver:integer):Boolean;


implementation

uses
  ClinetSystemUnits,
  FileMangeClientUnits;

  function ShowFileHistoryList(AFile_ID:integer;var Aver:integer):Boolean;
  begin
    with TFileHistoryListDlg.Create(nil) do
    try
      fLoading := False;
      ffile_id := AFile_id;
      iniform;
      Result :=ShowModal=mrOK;
      if Result then
        Aver := ffilever;
    finally
      free;
    end;
  end;

{$R *.dfm}

{ TFileHistoryListDlg }

procedure TFileHistoryListDlg.iniform;
var
  myItem : TListItem;
  myb : Boolean;
const
  glSQL = 'select a.ZNAME,a.ZVER,a.ZEDITDATETIME,a.ZSIZE, b.ZNAME as UserName from TB_FILE_ITEM as a  '         +
          'left join TB_USER_ITEM as b on a.ZEDITER_ID = b.ZID '            +
          'where a.ZID=%d Order by a.ZVER desc ';
begin
  cdsExec.Data := ClientSystem.fDBOpr.ReadDataSet(PChar(format(glSQL,[ffile_id])));
  cdsExec.First;
  lvfiles.Items.BeginUpdate;
  myb := fLoading;
  fLoading := True;
  try
    while not cdsExec.Eof do
    begin
      myItem := lvfiles.Items.Add;
      myitem.Caption := cdsExec.FieldByName('ZNAME').AsString;
      myitem.SubItems.Add(cdsExec.FieldByName('ZVer').AsString);
      myitem.SubItems.Add(cdsExec.FieldByName('ZEDITDATETIME').AsString);
      myitem.SubItems.Add(cdsExec.FieldByName('ZSIZE').AsString+'KB');
      myitem.SubItems.Add(cdsExec.FieldByName('UserName').AsString);
      cdsExec.Next;
    end;
  finally
    lvfiles.Items.EndUpdate;
    fLoading := myb;
  end;
end;

procedure TFileHistoryListDlg.btDnowfileClick(Sender: TObject);
begin
  if Assigned(lvfiles.Selected) then
  begin
    ffilever := strtointdef(lvfiles.Selected.SubItems[0],0);
    ModalResult := mrOK;
  end;
end;

procedure TFileHistoryListDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  fLoading := True;
end;

procedure TFileHistoryListDlg.lvfilesClick(Sender: TObject);
var
  myver : integer;
  myb : Boolean;
const
  glSQL = 'select ZNOTE from TB_FILE_ITEM where ZID=%d and ZVER=%d';
begin
  if fLoading then Exit;
  if not Assigned(lvfiles.Selected) then Exit;

  myb := fLoading;
  fLoading := True;
  try
    myver := strtointdef(lvfiles.Selected.SubItems[0],0);
    cdsExec.Data := ClientSystem.fDBOpr.ReadDataSet(PChar(format(glSQL,[ffile_id,myver])));
    if cdsExec.RecordCount > 0 then
    begin
      MemoNote.Lines.Text := cdsExec.FieldByName('ZNOTE').AsString;
    end;
  finally
    fLoading := myb;
  end;
end;

end.
