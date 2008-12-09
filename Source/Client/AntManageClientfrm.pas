////////////////////////////////////////////////////////////////////////////////
//
// 项目:
// 模块: 自动编译项目
// 作者: 龙仕云 创建时间: 2008-12-7
//
//
// 修改:       
//
//
//
////////////////////////////////////////////////////////////////////////////////
unit AntManageClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseChildfrm, StdCtrls, ExtCtrls, DBCtrls, Buttons, ActnList,
  ComCtrls, Grids, DBGrids, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, DB, DBClient,
  ClientTypeUnits, Mask;

type
  TAntManageClientDlg = class(TBaseChildDlg)
    actlst1: TActionList;
    act_BuildProject: TAction;
    pgcAnt: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    pnl1: TPanel;
    dbtxtZNAME: TDBText;
    pnl2: TPanel;
    dbgrd1: TDBGrid;
    scrlbx1: TScrollBox;
    spl1: TSplitter;
    mmo1: TMemo;
    pnl3: TPanel;
    btnBuildProject: TBitBtn;
    act_ProAdd: TAction;
    btnProAdd: TBitBtn;
    idtcpclnt1: TIdTCPClient;
    cdsAntList: TClientDataSet;
    dsAntList: TDataSource;
    lbl1: TLabel;
    dbedtZNAME: TDBEdit;
    lbl2: TLabel;
    dbedtZPRO_ID: TDBEdit;
    lbl3: TLabel;
    dbedtZIP: TDBEdit;
    lbl4: TLabel;
    dbedtZPYFILE: TDBEdit;
    btnProSave: TBitBtn;
    btnProCancel: TBitBtn;
    act_ProSave: TAction;
    act_ProCancel: TAction;
    cdstemp: TClientDataSet;
    dbmmoZREMARK: TDBMemo;
    lbl5: TLabel;
    act_BuildConnectIP: TAction;
    btnBuildConnectIP: TBitBtn;
    act1_BuildInfo: TAction;
    btn1_BuildInfo: TBitBtn;
    lbl6: TLabel;
    dbedtZDATE: TDBEdit;
    lbl7: TLabel;
    dbedtZVERSION: TDBEdit;
    lbl8: TLabel;
    dbedtZSVN: TDBEdit;
    lblError: TLabel;
    ani1: TAnimate;
    procedure act_ProAddExecute(Sender: TObject);
    procedure cdsAntListNewRecord(DataSet: TDataSet);
    procedure act_ProSaveUpdate(Sender: TObject);
    procedure act_ProCancelUpdate(Sender: TObject);
    procedure act_ProSaveExecute(Sender: TObject);
    procedure act_ProCancelExecute(Sender: TObject);
    procedure cdsAntListBeforePost(DataSet: TDataSet);
    procedure act_BuildConnectIPExecute(Sender: TObject);
    procedure act_BuildProjectUpdate(Sender: TObject);
    procedure cdsAntListAfterScroll(DataSet: TDataSet);
    procedure act1_BuildInfoExecute(Sender: TObject);
    procedure act_BuildProjectExecute(Sender: TObject);
    procedure act1_BuildInfoUpdate(Sender: TObject);
    procedure dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure pgcAntChanging(Sender: TObject; var AllowChange: Boolean);
  private
    { Private declarations }
    function initconnection():Boolean; //连接服务器
    procedure LoadAnt();
  public
    { Public declarations }
    procedure initBase; override;
    procedure freeBase; override;
    procedure Showfrm ; override;  //显示后发生的事件
    procedure Closefrm; override;  //关闭显示发生的事件
    class function GetModuleID : integer;override;
  end;


implementation
uses
  ClinetSystemUnits;

{$R *.dfm}

{ TAntManageClientDlg }

procedure TAntManageClientDlg.Closefrm;
begin
  inherited;
  if idtcpclnt1.Connected then
    idtcpclnt1.Disconnect;
end;

procedure TAntManageClientDlg.freeBase;
begin
  inherited;

end;

class function TAntManageClientDlg.GetModuleID: integer;
begin
  Result := Ord(mtAnt);
end;

procedure TAntManageClientDlg.initBase;
var
  mycds : TClientDataSet;
  myfield : TFieldDef;
const
  glSQL1 = 'select * from TB_ANT where 1=0 ';
begin
  inherited;
  ani1.ResName := 'MOV';
  mycds := TClientDataSet.Create(nil);
  try
    mycds.data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL1));

    if cdsAntList.Active then
      cdsAntList.Close;
    cdsAntList.FieldDefs.Clear;
    cdsAntList.FieldDefs.Assign(mycds.FieldDefs);
    with cdsAntList.FieldDefs do
    begin
      myField := AddFieldDef;
      myField.Name := 'ZISNEW';   //是否是新增
      myField.DataType := ftBoolean;

      myField := AddFieldDef;
      myField.Name := 'ZAUTOID';   
      myField.DataType := ftInteger;

      myField := AddFieldDef;
      myField.Name := 'ZINDEX';
      myField.DataType := ftString;
    end;
    cdsAntList.CreateDataSet;

    LoadAnt();
    
  finally
    mycds.Free;
  end;
end;

function TAntManageClientDlg.initconnection:Boolean;
var
  myip : string;
  myport : Integer;
  mystr : string;
begin
  //
  Result := False;
  mystr := cdsAntList.FieldByName('ZIP').AsString;
  if Pos(':',mystr) = 0 then Exit;

  myip := Copy(mystr,1,Pos(':',mystr)-1);
  myport := StrToIntDef(Copy(mystr,Pos(':',mystr)+1,MaxInt),-1);
  if myport = -1 then Exit;

  if idtcpclnt1.Connected then
    idtcpclnt1.Disconnect;

  try
    idtcpclnt1.Host := myip;
    idtcpclnt1.Port := myport;
    idtcpclnt1.Connect();
    Result := idtcpclnt1.Connected;
  except
    Exit;
  end;
end;

procedure TAntManageClientDlg.Showfrm;
begin
  inherited;

end;

procedure TAntManageClientDlg.act_ProAddExecute(Sender: TObject);
begin
  //
  if cdsAntList.State in [dsEdit,dsInsert] then
    cdsAntList.Post;
  cdsAntList.Append;
  pgcAnt.ActivePageIndex := 1;

end;

procedure TAntManageClientDlg.cdsAntListNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ZGUID').AsString := NewGuid;
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
end;

procedure TAntManageClientDlg.act_ProSaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsAntList.State in [dsEdit,dsInsert];
end;

procedure TAntManageClientDlg.act_ProCancelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsAntList.State in [dsEdit,dsInsert];
end;

procedure TAntManageClientDlg.act_ProSaveExecute(Sender: TObject);
begin
  cdsAntList.Post;
end;

procedure TAntManageClientDlg.act_ProCancelExecute(Sender: TObject);
begin
  cdsAntList.Cancel;
end;

procedure TAntManageClientDlg.LoadAnt;
var
  i,myc : Integer;
  myb : Boolean;
const
  glSQL = 'select * from TB_ANT order by ZID desc';

begin
  //
  myb := fLoading;
  fLoading := True;
  cdsAntList.DisableControls;
  try
    while not cdsAntList.Eof do
      cdsAntList.Delete;
      
    cdstemp.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL));
    cdstemp.First;
    myc := 1;
    while not cdstemp.Eof do
    begin
      cdsAntList.Append;
      cdsAntList.FieldByName('ZISNEW').AsBoolean := False;
      cdsAntList.FieldByName('ZINDEX').AsString := inttostr(myc);Inc(myc);
      for i:=0 to cdstemp.Fields.Count -1 do
      begin
        if  cdstemp.Fields[i].FieldName = 'ZID' then
        begin
          cdsAntList.FieldByName('ZAUTOID').AsInteger :=
            cdstemp.FieldByName('ZID').AsInteger;
        end
        else begin
          cdsAntList.FieldByName(cdstemp.Fields[i].FieldName).AsVariant :=
            cdstemp.FieldByName(cdstemp.Fields[i].FieldName).AsVariant;
        end;
      end;
      cdstemp.Next;
      cdsAntList.Post;
    end;

    cdsAntList.First;
  finally
    cdsAntList.EnableControls;
    fLoading := myb;
  end;
end;


procedure TAntManageClientDlg.cdsAntListBeforePost(DataSet: TDataSet);
var
  mySQL : string;
const
  gl_SQL1 = 'insert TB_ANT(ZGUID,ZNAME,ZPRO_ID,ZIP,ZPYFILE,ZREMARK,ZDATE,ZSVN,ZVERSION)' +
       ' values(''%s'',''%s'',%d,''%s'',''%s'',''%s'',''%s'',%d,''%s'')';
  gl_SQL2 = 'update TB_ANT set ZNAME=''%s'',ZPRO_ID=%d,ZIP=''%s'',ZPYFILE=''%s'', ' +
      'ZREMARK=''%s'',ZDATE=''%s'',ZSVN=%d,ZVERSION=''%s'' where ZGUID=''%s''';
begin
  if fLoading then Exit;
  
  if DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    mySQL := Format(gl_SQL1,[
      DataSet.FieldByName('ZGUID').AsString,
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZPRO_ID').AsInteger,
      DataSet.FieldByName('ZIP').AsString,
      DataSet.FieldByName('ZPYFILE').AsString,
      DataSet.FieldByName('ZREMARK').AsString,
      DataSet.FieldByName('ZDATE').AsString,
      DataSet.FieldByName('ZSVN').AsInteger,
      DataSet.FieldByName('ZVERSION').AsString]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));

    DataSet.FieldByName('ZISNEW').AsBoolean := False;
  end
  else begin
    mySQL := Format(gl_SQL2,[
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZPRO_ID').AsInteger,
      DataSet.FieldByName('ZIP').AsString,
      DataSet.FieldByName('ZPYFILE').AsString,
      DataSet.FieldByName('ZREMARK').AsString,
      DataSet.FieldByName('ZDATE').AsString,
      DataSet.FieldByName('ZSVN').AsInteger,
      DataSet.FieldByName('ZVERSION').AsString,
      DataSet.FieldByName('ZGUID').AsString]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
  end;
end;

procedure TAntManageClientDlg.act_BuildConnectIPExecute(Sender: TObject);
begin
  //
  if not initconnection() then
  begin
    MessageBox(Handle,'连接编译服务器出错，请与管理员联系。','编译',
      MB_ICONWARNING+MB_OK);
  end;
end;

procedure TAntManageClientDlg.act_BuildProjectUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := idtcpclnt1.Connected;
end;

procedure TAntManageClientDlg.cdsAntListAfterScroll(DataSet: TDataSet);
begin
  if idtcpclnt1.Connected then
    idtcpclnt1.Disconnect;
end;

procedure TAntManageClientDlg.act1_BuildInfoExecute(Sender: TObject);
var
  i,j,count : integer;
  linenum :Integer; //要跳往的行号
  mystr : string;
  myverstr,mys : string;
  myver : Integer;
begin
  idtcpclnt1.WriteLn('A');
  count := idtcpclnt1.ReadInteger;
  if count = -1 then
  begin
    mmo1.Lines.Add('还没有编译完成，请稍候...');
    Exit;
  end;

  linenum := 0;
  for i:=0 to count -1 do
  begin
    mystr := idtcpclnt1.ReadLn();
    if (Pos('FATA',UpperCase(mystr)) + Pos('ERROR',UpperCase(mystr)) > 0)  then
    begin
      lblError.Visible := True;
      lblError.Caption := Format('编译出错。第%d行',[i+1]);
      lblError.Hint := mystr;
      linenum := i;
    end
    else if Pos('[<Revision kind=number',mystr) > 0 then
    begin
      //[<Revision kind=number 5>]
      myverstr := Copy(mystr,Pos('=number',mystr)+length('=number'),Pos('>]',mystr));
      mys := '';
      myverstr := Trim(myverstr);
      for j:=1 to Length(myverstr) do
      begin
        if myverstr[j] in ['0','1','2','3','4','5','6','7','8','9'] then
          mys := mys + myverstr[j]
        else
          Break;
      end;
      myver := StrToIntdef(mys,-1);

      //更新svn 版本
      if cdsAntList.FieldByName('ZSVN').AsInteger <> myver then
      begin
        if not (cdsAntList.State in [dsEdit,dsInsert]) then
          cdsAntList.Edit;
        cdsAntList.FieldByName('ZSVN').AsInteger := myver;
        cdsAntList.Post;
      end;
    end;
    mmo1.Lines.Add(mystr);

  end;
  SendMessage(mmo1.Handle,WM_VSCROLL,MakeWParam(SB_THUMBPOSITION,linenum),0);
end;

procedure TAntManageClientDlg.act_BuildProjectExecute(Sender: TObject);
var
  mystr : string;
begin
  Screen.Cursor := crHourGlass;
  ani1.Visible := True;
  ani1.Active := True;
  try
    lblError.Visible := False;
    mmo1.Lines.Clear;
    mmo1.Lines.Add(#13#10);
    mmo1.Lines.Add('         正在编译中...');
    Application.ProcessMessages;
    mystr := Format('C%s',[cdsAntList.FieldByName('ZPYFILE').AsString]);
    idtcpclnt1.WriteLn(mystr);
    mmo1.Lines.Clear;
    mmo1.Lines.Add(idtcpclnt1.ReadLn());
    if not (cdsAntList.State in [dsEdit,dsInsert]) then
      cdsAntList.Edit;
    cdsAntList.FieldByName('ZDATE').AsDateTime := ClientSystem.fDbOpr.GetSysDateTime;
    cdsAntList.Post;

  finally
    ani1.Active  := False;
    ani1.Visible := False;
    Screen.Cursor := crDefault;
  end;
end;

procedure TAntManageClientDlg.act1_BuildInfoUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := idtcpclnt1.Connected;
end;

procedure TAntManageClientDlg.dbgrd1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (cdsAntList.RecNo mod 2  = 0) and not ( gdSelected in State)  then
    dbgrd1.Canvas.Brush.Color := clSilver;

  dbgrd1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TAntManageClientDlg.pgcAntChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if cdsAntList.State in [dsEdit,dsInsert] then
  begin
    AllowChange := False;
    MessageBox(Handle,'内容已修改，请点保存或取消。','提示',MB_ICONWARNING+MB_OK);
    Exit;
  end;
end;

end.
