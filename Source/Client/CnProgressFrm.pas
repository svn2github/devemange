{******************************************************************************}
{                       CnPack For Delphi/C++Builder                           }
{                     中国人自己的开放源码第三方开发包                         }
{                   (C)Copyright 2001-2008 CnPack 开发组                       }
{                   ------------------------------------                       }
{                                                                              }
{            本开发包是开源的自由软件，您可以遵照 CnPack 的发布协议来修        }
{        改和重新发布这一程序。                                                }
{                                                                              }
{            发布这一开发包的目的是希望它有用，但没有任何担保。甚至没有        }
{        适合特定目的而隐含的担保。更详细的情况请参阅 CnPack 发布协议。        }
{                                                                              }
{            您应该已经和开发包一起收到一份 CnPack 发布协议的副本。如果        }
{        还没有，可访问我们的网站：                                            }
{                                                                              }
{            网站地址：http://www.cnpack.org                                   }
{            电子邮件：master@cnpack.org                                       }
{                                                                              }
{******************************************************************************}

unit CnProgressFrm;
{* |<PRE>
================================================================================
* 软件名称：公共窗体库
* 单元名称：通用进度条窗体单元
* 单元作者：周劲羽 (zjy@cnpack.org)
* 备    注：该窗体由程序内部控制开启和关闭，请勿直接创建窗体实例
*           该单元提供以下几个过程用于显示动态提示窗体：
*             ShowProgress   - 显示进度条窗体
*             HideProgress   - 隐藏进度条窗体
*             UpdateProgress - 更新当前进度
*             UpdateProgressTitle  - 更新窗体标题
* 使用方法：在需要显示提示窗口的单元中uses本单元，当需要显示提示信息时直接
*           直接调用ShowXXXX过程即可。
* 注意事项：同一时间屏幕上只能显示一个进度窗体，窗体显示时其它所有窗体均不
*           能使用，但显示该窗体的代码仍可以继续运行。
* 开发平台：PWin98SE + Delphi 5.0
* 兼容测试：PWin9X/2000/XP + Delphi 5/6
* 本 地 化：该单元中的字符串尚不符合本地化处理方式
* 单元标识：$Id: CnProgressFrm.pas,v 1.6 2008/03/08 02:20:17 liuxiao Exp $
* 修改记录：2008.03.08 V1.1
*                xierenxixi 修改其禁用方式
*           2002.04.03 V1.0
*                创建单元
================================================================================
|</PRE>}

interface



uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ComCtrls, ExtCtrls;

type

{ TProgressForm }
  TProgressType = (ptProgress,ptAction);

  TProgressForm = class(TForm)
    pnl1: TPanel;
    ProgressBar: TProgressBar;
    ani1: TAnimate;
    lblTitle: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowProgress(const Title: string;ACount:integer);
{* 显示进度条窗体，参数为窗体标题}
procedure HideProgress;
{* 关闭进度条窗体}
procedure UpdateProgress(Value: Integer);
{* 更新当前进度，参数为进度值：0..100}
procedure UpdateProgressTitle(const Title: string);
{* 更新进度条窗体标题，参数为标题}

implementation

{$R *.DFM}

var
  ProgressForm: TProgressForm = nil;  // 进度条窗体实例
  FormList: TThreadList	;  // 被禁用的窗体列表指针

// 显示窗体
procedure ShowProgress(const Title: string;ACount:integer);
var
  i: Integer;
begin
  if not Assigned(ProgressForm) then
  begin
    ProgressForm := TProgressForm.Create(Application.MainForm);
    ProgressForm.ani1.ResName := 'MOV';
  end
  else
    ProgressForm.BringToFront;
  ProgressForm.lblTitle.Caption := Title;
  if ACount = 0 then
  begin
    ProgressForm.ani1.Visible := True;
    ProgressForm.ProgressBar.Visible := False;
    ProgressForm.ani1.Active := True;
  end
  else begin
    ProgressForm.ani1.Visible := False;
    ProgressForm.ProgressBar.Visible := True;
    ProgressForm.ProgressBar.Position := 0;
    ProgressForm.ProgressBar.Max := ACount;
  end;
  ProgressForm.Show;

  with FormList.LockList do
  try
     for i := 0 to Screen.FormCount - 1 do
    begin
      if (Screen.Forms[i] <> ProgressForm) and Screen.Forms[i].Enabled
         and (IndexOf(Screen.Forms[i])<0)  then
      begin
        Add(Screen.Forms[i]);    // 保存当前可用的窗体列表
        Screen.Forms[i].Enabled := False; // 禁用窗体
      end;
    end;
  finally
    FormList.UnlockList;
  end;


  // xierenxixi 修改
  //FormList := DisableTaskWindows(ProgressForm.Handle);
  ProgressForm.Update;
end;

// 关闭窗体
procedure HideProgress;
var
  i: Integer;
begin
  if not Assigned(ProgressForm) then Exit;
  with FormList.LockList do
  try
    for i := Count - 1 downto 0 do
    begin
      try
        TForm(Items[i]).Enabled := True;   // 恢复原窗体
      except
        ;
      end;
      Delete(i);
    end;
  finally
    FormList.UnlockList;
  end;

  // xierenxixi 修改
  //EnableTaskWindows(FormList);
  
  ProgressForm.Hide;
  Application.ProcessMessages;
  ProgressForm.Free;
  ProgressForm := nil;
end;

// 更新进度
procedure UpdateProgress(Value: Integer);
begin
  if Assigned(ProgressForm) then
  begin
    ProgressForm.ProgressBar.Position := Value;
    ProgressForm.Update;
    Application.ProcessMessages;
  end;
end;

// 更新标题
procedure UpdateProgressTitle(const Title: string);
begin
  if Assigned(ProgressForm) then
  begin
    ProgressForm.lblTitle.Caption := Title;
    ProgressForm.Update;
    Application.ProcessMessages;
  end;
end;

initialization
  FormList:= TThreadList.Create;


finalization
  FormList.Free;

end.
