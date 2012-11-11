inherited BitmapFromDesktopfrmDlg: TBitmapFromDesktopfrmDlg
  Left = 245
  Top = 153
  Width = 845
  Height = 542
  Caption = #25130#22270
  PixelsPerInch = 96
  TextHeight = 15
  object img1: TImage
    Left = 0
    Top = 41
    Width = 829
    Height = 463
    Align = alClient
    AutoSize = True
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 829
    Height = 41
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 17
      Top = 12
      Width = 73
      Height = 17
      AutoSize = False
      Caption = #20301#22270#39068#33394':'
    end
    object cbb1: TComboBox
      Left = 93
      Top = 11
      Width = 113
      Height = 23
      Style = csDropDownList
      ItemHeight = 15
      ItemIndex = 5
      TabOrder = 0
      Text = '32'#20301
      Items.Strings = (
        '1'#20301
        '4'#20301
        '8'#20301
        '16'#20301
        '24'#20301' '#25991#20214#26368#22823
        '32'#20301)
    end
    object btn2: TBitBtn
      Left = 232
      Top = 8
      Width = 100
      Height = 25
      Caption = #25235#22270
      TabOrder = 1
      OnClick = btn2Click
    end
    object btn1: TBitBtn
      Left = 336
      Top = 8
      Width = 100
      Height = 25
      Caption = #30830#23450'(&O)'
      ModalResult = 1
      TabOrder = 2
    end
  end
end
