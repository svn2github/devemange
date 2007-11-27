object FileEditNote: TFileEditNote
  Left = 439
  Top = 250
  BorderStyle = bsDialog
  Caption = #25991#20214#35828#26126#32534#36753
  ClientHeight = 368
  ClientWidth = 568
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
    Left = 16
    Top = 11
    Width = 64
    Height = 16
    Caption = #25991#20214#35828#26126
  end
  object Memo1: TMemo
    Left = 17
    Top = 32
    Width = 533
    Height = 283
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 447
    Top = 328
    Width = 100
    Height = 25
    Caption = #21462#28040'(&C)'
    TabOrder = 1
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 335
    Top = 328
    Width = 100
    Height = 25
    Caption = #30830#23450'(&O)'
    TabOrder = 2
    Kind = bkOK
  end
end
