unit BugHighQueryfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, StdCtrls, Buttons, ComCtrls, DBCtrls, DB,
  DBClient, ExtCtrls;

type
  TBugHighQueryDlg = class(TBaseDialog)
    btn1: TBitBtn;
    btn2: TBitBtn;
    chktodayAmind: TCheckBox;
    dtpAmod: TDateTimePicker;
    btntoday: TBitBtn;
    btnyesterday: TBitBtn;
    chktodayBug: TCheckBox;
    dtpBugday: TDateTimePicker;
    btntodayBug: TBitBtn;
    btnyesterdaybug: TBitBtn;
    chkmodule: TCheckBox;
    cbbModule: TComboBox;
    chkBugType: TCheckBox;
    chkVersion: TCheckBox;
    dblkcbbVersion: TDBLookupComboBox;
    btngetvesion: TBitBtn;
    cdsProject: TClientDataSet;
    dsProject: TDataSource;
    cdsBugType: TClientDataSet;
    dsBugType: TDataSource;
    dblkcbbBugtype: TDBLookupComboBox;
    chkAmideBugVer: TCheckBox;
    dblkcbbAmdieVer: TDBLookupComboBox;
    cdsAmdieVer: TClientDataSet;
    dsAmdieVer: TDataSource;
    cbbModuleID: TComboBox;
    chkCode: TCheckBox;
    edtCode: TEdit;
    btnAll: TBitBtn;
    cbbTreeID: TComboBox;
    chkBugLevel: TCheckBox;
    dblkcbbBugLevel: TDBLookupComboBox;
    cdsBugLevel: TClientDataSet;
    dsBugLevel: TDataSource;
    chkStatus: TCheckBox;
    rg1: TRadioGroup;
    chkBugCreateor: TCheckBox;
    cbBugAmdorer: TCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    dblkcbb1: TDBLookupComboBox;
    cdsBugCreater: TClientDataSet;
    dsBugCreaeter: TDataSource;
    cdsBugAdmder: TClientDataSet;
    dsAmder: TDataSource;
    chkTag: TCheckBox;
    cbbTag: TComboBox;
    chkToWho: TCheckBox;
    cdsToWho: TClientDataSet;
    dsToWho: TDataSource;
    dblkcbb2: TDBLookupComboBox;
    edtName: TEdit;
    chkName: TCheckBox;
    dtpAmod2: TDateTimePicker;
    dtpBugday2: TDateTimePicker;
    chkNeedDate: TCheckBox;
    dtpNeed: TDateTimePicker;
    dtpNeed2: TDateTimePicker;
    chkSubToWho: TCheckBox;
    dblkcbb3: TDBLookupComboBox;
    cdsSubToWho: TClientDataSet;
    dsSubToWho: TDataSource;
    edtMutilModule: TEdit;
    chkMutilModule: TCheckBox;
    btnSave: TBitBtn;
    procedure chkmoduleClick(Sender: TObject);
    procedure btntodayClick(Sender: TObject);
    procedure btntodayBugClick(Sender: TObject);
    procedure btnyesterdayClick(Sender: TObject);
    procedure btnyesterdaybugClick(Sender: TObject);
    procedure btngetvesionClick(Sender: TObject);
    procedure cbbModuleChange(Sender: TObject);
    procedure edtCodeChange(Sender: TObject);
    procedure btnAllClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetBugType();
    function GetwhereStr():string;
  end;

var
  BugHighQueryDlg: TBugHighQueryDlg;

implementation
uses
  ClientTypeUnits,
  ClinetSystemUnits;

{$R *.dfm}

procedure TBugHighQueryDlg.chkmoduleClick(Sender: TObject);
begin
  if chkmodule.Checked  and (cbbModule.ItemIndex<0)
    and (cbbModule.Items.Count>0) then
    cbbModule.ItemIndex := 0;
end;

procedure TBugHighQueryDlg.btntodayClick(Sender: TObject);
begin
  dtpAmod.DateTime := now();
  dtpAmod2.DateTime := now() + 1;
end;

procedure TBugHighQueryDlg.btntodayBugClick(Sender: TObject);
begin
  dtpBugday.DateTime := now();
  dtpBugday2.DateTime := Now() + 1;
end;

procedure TBugHighQueryDlg.btnyesterdayClick(Sender: TObject);
begin
  dtpAmod.DateTime := now()-1;
  dtpAmod2.DateTime := Now();
end;

procedure TBugHighQueryDlg.btnyesterdaybugClick(Sender: TObject);
begin
  dtpBugday.DateTime := now()-1;
  dtpBugday2.DateTime := Now();
end;

procedure TBugHighQueryDlg.btngetvesionClick(Sender: TObject);
var
  mySQL :  String;
const
  glSQL  = 'select ZID,ZVER from TB_PRO_VERSION where ZPRO_ID=%d Order by ZID DESC';
begin
  if cbbModule.ItemIndex < 0 then Exit;
  if cdsProject.Tag <> strtoint(cbbModuleID.Items[cbbModule.ItemIndex]) then
  begin
    cdsProject.Tag := strtoint(cbbModuleID.Items[cbbModule.ItemIndex]);
    mySQL := format(glSQL,[strtoint(cbbModuleID.Items[cbbModule.ItemIndex])]);
    cdsProject.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(mySQL));
    cdsAmdieVer.Data := cdsProject.Data;
  end;
end;

procedure TBugHighQueryDlg.cbbModuleChange(Sender: TObject);
var
  mystr : string;
begin
  cdsProject.Close;
  cdsAmdieVer.Close;

  //多模块时
  if chkMutilModule.Checked then
  begin
    mystr := cbbTreeID.Items[cbbModule.ItemIndex];// cbbModule.Text;
    if Pos(mystr+ ';',edtMutilModule.Text) = 0 then
    begin

      if edtMutilModule.Text = '' then
        edtMutilModule.Text := mystr + ';'
      else
        edtMutilModule.Text := edtMutilModule.Text + mystr +';';
    end;
  end;
end;

procedure TBugHighQueryDlg.GetBugType;
const
  glSQL = 'select ZID,ZNAME from TB_BUG_PARAMS where ZTYPE=%d';
begin
  cdsBugType.Data  := ClientSystem.fDbOpr.ReadDataSet(PChar(format(glSQL,[4])));
  cdsBugLevel.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(format(glSQL,[5])));
end;

function TBugHighQueryDlg.GetwhereStr:string;
var
  mystr : string;
  mywhere : string;
  i : integer;
  mysl : TStringList;
begin
  //1.指定模块
  mystr := '';
  if chkmodule.Checked then
  begin
    if not chkMutilModule.Checked then
      mystr := format('ZTREE_ID=%s',[cbbTreeID.Items[cbbModule.ItemIndex]])
    else begin
      //多模块时
      mysl := TStringList.Create;
      mysl.Delimiter := ';';
      mysl.DelimitedText := edtMutilModule.Text;
      for i:=0 to  mysl.Count -1 do
      begin
        if mysl.Strings[i] = '' then Continue;
        if mystr = '' then
          mystr := format('ZTREE_ID=%s',[mysl.Strings[i]])
        else
          mystr := mystr + ' or ' + format('ZTREE_ID=%s',[mysl.Strings[i]]);
      end;
      mysl.Free
    end;
  end
  else begin
    for i:=0 to cbbModule.Items.Count -1 do
    begin
      if mystr = '' then
        mystr := format('ZTREE_ID=%s',[cbbTreeID.Items[i]])
      else
        mystr := mystr + ' or ' +  format('ZTREE_ID=%s',[cbbTreeID.Items[i]]);
    end;
  end;

  if mystr <> '' then mywhere := '(' + mystr + ')';

  //2.指定出现问题的版本
  mystr := '';
  if chkVersion.Checked and cdsProject.Active
     and (cdsProject.RecordCount > 0) then
  begin
    mystr := format('ZOPENVER=%d',[cdsProject.FieldByName('ZID').AsInteger]);
  end;
  if mystr <> '' then mywhere := mywhere + ' and ' + mystr;

  //3.指定解决问题的版本
  mystr := '';
  if chkAmideBugVer.Checked and cdsAmdieVer.Active
    and (cdsAmdieVer.RecordCount>0) then
  begin
    mystr := format('ZRESOLVEDVER=%d',[cdsAmdieVer.FieldByName('ZID').AsInteger]);
  end;
  if mystr <> '' then mywhere := mywhere + ' and ' + mystr;

  //解决问题的时间
  mystr := '';
  if chktodayAmind.Checked then
  begin
    mystr := format('(ZRESOLVEDDATE between ''%s'' and ''%s'') and (ZSTATUS=1) ',
      [''''+datetostr(dtpAmod.Date)+'''',''''+datetostr(dtpAmod2.Date)+'''']);
  end;
  if mystr <> '' then mywhere := mywhere + ' and ' + mystr;

  //创建问题的时间
  mystr := '';
  if chktodayBug.Checked then
  begin
    mystr := format('(ZOPENEDDATE between ''%s'' and ''%s'')  ',
      [''''+datetostr(dtpBugday.Date)+'''',''''+datetostr(dtpBugday2.Date)+'''']);
  end;
  if mystr <> '' then mywhere := mywhere + ' and ' + mystr;

  //错误类型
  mystr := '';
  if chkBugType.Checked then
  begin
    mystr := format('ZTYPE=%d',[cdsBugType.FieldByName('ZID').AsInteger]);
  end;
  if mystr <> '' then mywhere := mywhere + ' and ' + mystr;

  //编号
  mystr := '';
  if chkCode.Checked then
  begin
    mystr := format('ZID=%d',[strtointdef(edtCode.Text,-1)]);
  end;
  if mystr <> '' then mywhere := mywhere + ' and ' + mystr;

  //问题等级
  mystr := '';
  if chkBugLevel.Checked then
  begin
    mystr := format('ZLEVEL=%d',[cdsBugLevel.FieldByName('ZID').AsInteger]);
  end;
  if mystr <> '' then mywhere := mywhere + ' and ' + mystr;

  //问题状态
  mystr := '';
  if chkStatus.Checked then
  begin
    if rg1.ItemIndex = 0 then mystr := '(ZSTATUS=0 or ZSTATUS=2) '
    else mystr := 'ZSTATUS=1';
  end;
  if mystr <> '' then mywhere := mywhere + ' and ' + mystr;

  //问题创建人
  mystr := '';
  if chkBugCreateor.Checked then
  begin
    mystr := format('ZOPENEDBY=%d',[cdsBugCreater.FieldByName('ZID').AsInteger]);
  end;
  if mystr <> '' then mywhere := mywhere + ' and ' + mystr;

  //问题解决人
  mystr := '';
  if cbBugAmdorer.Checked then
  begin
    mystr := format('ZRESOLVEDBY=%d',[cdsBugAdmder.FieldByName('ZID').AsInteger]);
  end;
  if mystr <> '' then mywhere := mywhere + ' and ' + mystr;

  //指派给谁
  mystr := '';
  if chkToWho.Checked then
  begin
    mystr := format('ZASSIGNEDTO=%d',[cdsToWho.FieldByName('ZID').AsInteger]);
  end;
  if mystr <> '' then mywhere := mywhere + ' and ' + mystr;

  //从指派给谁
  mystr := '';
  if chkSubToWho.Checked then
  begin
    mystr := format('ZASSIGNEDTO=%d',[cdsSubToWho.FieldByName('ZID').AsInteger]);
  end;
  if mystr <> '' then mywhere := mywhere + ' and ' + mystr;

  mystr := '';
  if (chkTag.Checked) and (cbbTag.ItemIndex>=0) then
  begin
    mystr := Format('(ZTAGNAME  like ''''%s'''')',['%'+cbbTag.Text+'%']);
  end;
  if mystr <> '' then mywhere := mywhere + ' and ' + mystr;

  //名称查找
  mystr := '';
  if (edtName.Text <> '') then
  begin
    mystr := Format('(ZTITLE  like ''''%s'''')',['%'+edtName.Text+'%']);
  end;
  if mystr <> '' then mywhere := mywhere + ' and ' + mystr;


  //要求完成时间
  mystr := '';
  if chkNeedDate.Checked then
  begin
    mystr := format('(ZNEDDDATE between ''%s'' and ''%s'')  ',
      [''''+datetostr(dtpNeed.Date)+'''',''''+datetostr(dtpNeed2.Date)+'''']);
  end;
  if mystr <> '' then mywhere := mywhere + ' and ' + mystr;

  Result := mywhere;

end;

procedure TBugHighQueryDlg.edtCodeChange(Sender: TObject);
begin
  chkCode.Checked := edtCode.Text <> '';
end;

procedure TBugHighQueryDlg.btnAllClick(Sender: TObject);
begin
  chkCode.Checked        := False;
  chkmodule.Checked      := False;
  chkVersion.Checked     := False;
  chkAmideBugVer.Checked := False;
  chktodayAmind.Checked  := False;
  chktodayBug.Checked    := False;
  chkBugType.Checked     := False;
  chkStatus.Checked      := False;
  chkBugCreateor.Checked := False;
  cbBugAmdorer.Checked   := False;
  chkTag.Checked         := False;
  ModalResult := mrOK;
end;

procedure TBugHighQueryDlg.btnSaveClick(Sender: TObject);
var
  myfilename : string;
  mystr : string;
  mysl : TStringList;
begin
  //
  if not InputQuery('保存','查询名称',mystr) then
    Exit;

  myfilename := ClientSystem.fQueryDir + '\' + mystr;
  if FileExists(myfilename) then
  begin
    Application.MessageBox('已经有重名的了','保存',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  //写入到文件内
  mysl := TStringList.Create;
  mysl.Add(GetwhereStr());
  mysl.SaveToFile(myfilename);
  mysl.Free;
end;

end.
