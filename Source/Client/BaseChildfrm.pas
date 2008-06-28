unit BaseChildfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  ClientTypeUnits;

type
  TBaseChildClass = class of TBaseChildDlg;
  
  TBaseChildDlg = class(TForm)
  private

  public
    fLoading : Boolean;

    procedure initBase; virtual;
    procedure freeBase; virtual;
    procedure Showfrm ; virtual;  //显示后发生的事件
    procedure Closefrm; virtual;  //关闭显示发生的事件

    class function GetModuleID : integer;virtual; //取出模块ID
    //操作权限
    //
    // ASubModule 为子模块的id号
    // AID 为子模块下面的功能 ,如分部的ID, 或是 Bug下的分部ID
    //   所以AID是操作对象的ID
    //
    function HasModuleAction(ASubStype:integer;AID:integer;AAction:TActionType):Boolean;
    function HasModuleActionByShow(ASubStype:integer;AID:integer;AAction:TActionType):Boolean;

    //显示状态文字
    procedure ShowStatusBarText(Aindex:integer;AStr:String);

    //显示进度窗口
    procedure ShowProgress(const Title: string;ACount:integer);
    procedure HideProgress;
    procedure UpdateProgress(Value: Integer);
    procedure UpdateProgressTitle(const Title: string);
  end;

var
  BaseChildDlg: TBaseChildDlg;

implementation
uses
  ClinetSystemUnits, Mainfrm,CnProgressFrm;

{$R *.dfm}

{ TBaseChildDlg }

procedure TBaseChildDlg.Closefrm;
begin
  //子类重载
end;

procedure TBaseChildDlg.freeBase;
begin
  //子类重载
end;

class function TBaseChildDlg.GetModuleID: integer;
begin
  Result := -1;
end;

function TBaseChildDlg.HasModuleAction(ASubStype:integer;AID: integer;
  AAction: TActionType): Boolean;
var
  myStyle : integer;
begin
  myStyle := GetModuleID; //取出总的模块
  Result := ClientSystem.HasModuleAction(myStyle,{myStyle+}ASubStype,
    AID,AAction);
end;

function TBaseChildDlg.HasModuleActionByShow(ASubStype, AID: integer;
  AAction: TActionType): Boolean;
begin
  Result := HasModuleAction(ASubStype,AID,AAction);
  if not Result and (AID<>1) then   //AID<>1 根结点不提示
    MessageBox(Handle,PChar(format('你没有%s操作的权限',[ActionTypeName[AAction]])),
      '提示',MB_ICONWARNING+MB_OK);
end;

procedure TBaseChildDlg.HideProgress;
begin
  CnProgressFrm.HideProgress;  
end;

procedure TBaseChildDlg.initBase;
begin
  fLoading := False;
  //子类重载
end;

procedure TBaseChildDlg.Showfrm;
begin
  //子类重载
end;

procedure TBaseChildDlg.ShowProgress(const Title: string; ACount: integer);
begin
  CnProgressFrm.ShowProgress(Title,ACount);
end;

procedure TBaseChildDlg.ShowStatusBarText(Aindex: integer; AStr: String);
begin
  if Application.MainForm is TMainDlg then
  begin
    (Application.MainForm as TMainDlg).StatusBarMain.Panels[Aindex].Text := AStr;
  end;
end;

procedure TBaseChildDlg.UpdateProgress(Value: Integer);
begin
  CnProgressFrm.UpdateProgress(Value);
end;

procedure TBaseChildDlg.UpdateProgressTitle(const Title: string);
begin
  CnProgressFrm.UpdateProgressTitle(Title);
end;

end.
