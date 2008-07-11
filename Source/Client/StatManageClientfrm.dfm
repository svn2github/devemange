inherited StatManageClientDlg: TStatManageClientDlg
  Left = 206
  Top = 229
  Width = 758
  Height = 407
  Caption = #32479#35745
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object pnlTool: TPanel
    Left = 0
    Top = 0
    Width = 750
    Height = 40
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 24
      Top = 16
      Width = 45
      Height = 15
      Caption = #26399#38388#65306
    end
    object lbl2: TLabel
      Left = 201
      Top = 14
      Width = 15
      Height = 15
      Caption = #33267
    end
    object dtp1: TDateTimePicker
      Left = 65
      Top = 11
      Width = 121
      Height = 23
      Date = 39627.739827650460000000
      Time = 39627.739827650460000000
      Color = clSkyBlue
      TabOrder = 0
    end
    object dtp2: TDateTimePicker
      Left = 229
      Top = 11
      Width = 118
      Height = 23
      Date = 39627.739903969910000000
      Time = 39627.739903969910000000
      Color = clSkyBlue
      TabOrder = 1
    end
    object btnStat: TBitBtn
      Left = 378
      Top = 10
      Width = 100
      Height = 25
      Action = actStat
      Caption = #32479#35745#20869#23481
      TabOrder = 2
    end
    object btnExportExcel: TBitBtn
      Left = 488
      Top = 10
      Width = 100
      Height = 25
      Action = actExportExcel
      Caption = #23548#20986#21040'Excel'
      TabOrder = 3
    end
  end
  object dbgrdData: TDBGrid
    Left = 0
    Top = 40
    Width = 750
    Height = 333
    Align = alClient
    DataSource = dsData
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
  end
  object cdsData: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 374
    Top = 94
  end
  object dsData: TDataSource
    DataSet = cdsData
    Left = 408
    Top = 95
  end
  object actlst1: TActionList
    Left = 448
    Top = 96
    object actStat: TAction
      Caption = #32479#35745#20869#23481
      OnExecute = actStatExecute
    end
    object actExportExcel: TAction
      Caption = #23548#20986#21040'Excel'
    end
  end
end
