inherited DeveCalendarDlg: TDeveCalendarDlg
  Left = 507
  Top = 297
  BorderStyle = bsNone
  Caption = #26085#31243#25353#25490
  ClientHeight = 221
  ClientWidth = 363
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object wb1: TWebBrowser
    Left = 0
    Top = 0
    Width = 363
    Height = 221
    Align = alClient
    TabOrder = 0
    ControlData = {
      4C00000084250000D71600000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object ani1: TAnimate
    Left = 6
    Top = 4
    Width = 80
    Height = 50
    Color = clBtnFace
    ParentColor = False
    StopFrame = 29
  end
  object tmr1: TTimer
    Enabled = False
    OnTimer = tmr1Timer
    Left = 112
    Top = 152
  end
end
