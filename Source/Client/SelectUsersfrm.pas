unit SelectUsersfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, StdCtrls, Buttons, Grids, DBGrids;

type
  TSelectUsersDlg = class(TBaseDialog)
    DBGrid1: TDBGrid;
    lbUsers: TListBox;
    btbnAdd: TBitBtn;
    btbnDel: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lbUserCode: TListBox;
    procedure btbnAddClick(Sender: TObject);
    procedure btbnDelClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure lbUsersDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

uses DmUints;

{$R *.dfm}

procedure TSelectUsersDlg.btbnAddClick(Sender: TObject);
begin
  with DM do
  begin
    if cdsUserAll.IsEmpty then Exit;
    if lbUsers.Items.IndexOf(cdsUserAll.FieldByName('ZNAME').AsString) >=0 Then Exit;
    lbUsers.Items.Add(cdsUserAll.FieldByName('ZNAME').AsString);
    lbUserCode.Items.Add(cdsUserAll.FieldByName('ZID').AsString);
  end;
end;

procedure TSelectUsersDlg.btbnDelClick(Sender: TObject);
var
  myindex : integer;
begin
  myindex := lbUsers.ItemIndex;
  if myindex >=0 then
  begin
    lbUsers.Items.Delete(myindex);
    lbUserCode.Items.Delete(myindex);
  end;
end;

procedure TSelectUsersDlg.DBGrid1DblClick(Sender: TObject);
begin
  btbnAddClick(nil);
end;

procedure TSelectUsersDlg.lbUsersDblClick(Sender: TObject);
begin
  btbnDelClick(nil);
end;

end.
