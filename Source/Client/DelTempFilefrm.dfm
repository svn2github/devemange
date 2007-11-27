object DelTempFileDlg: TDelTempFileDlg
  Left = 322
  Top = 205
  BorderStyle = bsDialog
  Caption = #21024#38500#20020#26102#25991#20214
  ClientHeight = 258
  ClientWidth = 660
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 13
    Top = 15
    Width = 416
    Height = 16
    Caption = #21024#38500#31995#32479#20135#29983#30340#20020#26102#25991#20214#65292#21246#19978#21017#21024#38500#65292#19981#21246#21017#20445#30041#25991#20214#12290
  end
  object clbFiles: TCheckListBox
    Left = 10
    Top = 42
    Width = 638
    Height = 168
    ItemHeight = 16
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 538
    Top = 221
    Width = 100
    Height = 25
    Caption = #21462#28040'(&C)'
    TabOrder = 1
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 420
    Top = 221
    Width = 100
    Height = 25
    Caption = #30830#23450'(&O)'
    TabOrder = 2
    Kind = bkOK
  end
end
