///////////////////////////////////////////////////////////////////////////////
//
//  新建文件
//  创建日期: 2007-11-8  作者: 龙仕云
//
//  修改:
//    1) 显示模板只能是最新的 ZNEWVER=TRUE  ver=1.0.1.5  2007-11-8
//
//
//
///////////////////////////////////////////////////////////////////////////////
unit NewFilefrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, DBClient, ImgList;

type
  TNewFileDlg = class(TForm)
    lvtemplatefiles: TListView;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    cdsFiles: TClientDataSet;
    procedure BitBtn2Click(Sender: TObject);
  private
    fRootID  : integer; //根目录id值
    fFile_id : integer;
    fver     : integer;
    procedure Loadfileitem;
  public

  end;

  function ShowNewFileDlg(ARootID:integer;var AFile_ID,AVer:integer):Boolean;

implementation

uses
  ShellAPI,
  ClinetSystemUnits,
  FileMangeClientUnits, Mainfrm;

{$R *.dfm}
  function ShowNewFileDlg(ARootID:integer;var AFile_ID,AVer:integer):Boolean;
  begin
    with TNewFileDlg.Create(nil) do
    try
      fRootID := ARootID;
      Loadfileitem;
      Result := ShowModal = mrOK;
      if Result then
      begin
        AFile_ID := fFile_id;
        AVer := fVer;
      end;
    finally
      free;
    end;
  end;

{ TNewFileDlg }

procedure TNewFileDlg.Loadfileitem;
var
  myitem : TListItem;
  myExt  : String;
  nIndex : integer;
  myIcon   : TIcon;
  sinfo:SHFILEINFO;
  myfileDlg : TFileManageDlg;
const
  glSQL = 'select ZID,ZVER,ZNAME,ZEDITDATETIME,ZSIZE,ZExt from  TB_FILE_ITEM ' +
          'where ZTREE_ID=%d and ZNEWVER=1';
begin
  if not Assigned(MainDlg.CurrentChildform) or
     not (MainDlg.CurrentChildform is TFileManageDlg)then Exit;
  myfileDlg := MainDlg.CurrentChildform as TFileManageDlg;

  lvtemplatefiles.SmallImages := myfileDlg.ImageListFileIcon;
  cdsFiles.data := ClientSystem.fDBOpr.ReadDataSet(PChar(format(glSQL,[fRootID])));
  cdsFiles.First;
  while not cdsFiles.Eof do
  begin
    myitem := lvtemplatefiles.Items.Add;
    myitem.Caption := cdsFiles.FieldByName('ZNAME').AsString;
    myitem.SubItems.Add(cdsFiles.FieldByName('ZVER').AsString);
    myitem.SubItems.Add(cdsFiles.FieldByName('ZEDITDATETIME').AsString);
    myitem.SubItems.Add(cdsFiles.FieldByName('ZSIZE').AsString+'KB');
    myitem.Data := TObject(cdsFiles.FieldByName('ZID').AsInteger);

    myExt := cdsFiles.FieldByName('ZEXT').AsString;
    with myfileDlg do
    begin
      nIndex:=fIconList.IndexOf(myExt);
      if nIndex>=0 then
      begin
        nIndex:=Integer(fIconList.Objects[nIndex]);
        myItem.ImageIndex:=nIndex;
      end
      else begin
        FillChar(sinfo, SizeOf(sinfo),0);
        SHGetFileInfo(PChar(myExt),FILE_ATTRIBUTE_NORMAL,sinfo,SizeOf(sInfo),
        SHGFI_USEFILEATTRIBUTES or SHGFI_ICON or SHGFI_SMALLICON);
        if sinfo.hIcon>0 then
        begin
          myIcon:=TIcon.Create;
          myIcon.Handle:=sinfo.hIcon;
          nIndex:=ImageListFileIcon.AddIcon(myIcon);
          myIcon.Free;
          myItem.ImageIndex:=nIndex;
          fIconList.AddObject(myExt,TObject(nIndex));
        end;
      end;
    end;
    cdsFiles.Next;
  end;
end;

procedure TNewFileDlg.BitBtn2Click(Sender: TObject);
begin
  if Assigned(lvtemplatefiles.Selected) then
  begin
    ffile_id := integer(lvtemplatefiles.Selected.data);
    fver := strtoint(lvtemplatefiles.Selected.SubItems[0]);
    ModalResult := mrOK;
  end
  else
    MessageBox(Handle,'请选择模板文件。','提示',MB_ICONWARNING+MB_OK);
end;

end.
