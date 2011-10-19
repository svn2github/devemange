inherited StatManageClientDlg: TStatManageClientDlg
  Left = 143
  Top = 179
  Width = 971
  Height = 467
  Caption = #32479#35745#27719#24635
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object pnlTool: TPanel
    Left = 0
    Top = 0
    Width = 955
    Height = 40
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 5
      Top = 16
      Width = 45
      Height = 15
      Caption = #26399#38388#65306
    end
    object lbl2: TLabel
      Left = 174
      Top = 14
      Width = 15
      Height = 15
      Caption = #33267
    end
    object dtp1: TDateTimePicker
      Left = 46
      Top = 11
      Width = 121
      Height = 23
      Date = 39627.739827650460000000
      Time = 39627.739827650460000000
      Color = clSkyBlue
      TabOrder = 0
    end
    object dtp2: TDateTimePicker
      Left = 199
      Top = 11
      Width = 118
      Height = 23
      Date = 39627.739903969910000000
      Time = 39627.739903969910000000
      Color = clSkyBlue
      TabOrder = 1
    end
    object btnStat: TBitBtn
      Left = 322
      Top = 9
      Width = 100
      Height = 25
      Action = actStat
      Caption = #32479#35745#20869#23481
      TabOrder = 2
    end
    object btnExportExcel: TBitBtn
      Left = 738
      Top = 9
      Width = 100
      Height = 25
      Action = actExportExcel
      Caption = #23548#20986#21040'Excel'
      TabOrder = 3
    end
    object btnUpMother: TBitBtn
      Left = 426
      Top = 9
      Width = 100
      Height = 25
      Action = actUpMother
      Caption = #19978#19968#20010#26376
      TabOrder = 4
    end
    object btnDownMother: TBitBtn
      Left = 530
      Top = 9
      Width = 100
      Height = 25
      Action = actDownMother
      Caption = #19979#19968#20010#26376
      TabOrder = 5
    end
    object btnCurrMother: TBitBtn
      Left = 634
      Top = 9
      Width = 100
      Height = 25
      Action = actCurrMother
      Caption = #24403#21069#26376#20221
      TabOrder = 6
    end
    object btn1: TBitBtn
      Left = 842
      Top = 9
      Width = 100
      Height = 25
      Action = actChart
      Caption = #22270#34920#23545#27604
      TabOrder = 7
    end
  end
  object tbc1: TTabControl
    Left = 0
    Top = 40
    Width = 955
    Height = 294
    Align = alClient
    TabOrder = 1
    Tabs.Strings = (
      #25353#22995#21517#32479#35745
      #25353#39033#30446#32479#35745)
    TabIndex = 0
    OnChanging = tbc1Changing
    object dbgrdData: TDBGrid
      Left = 4
      Top = 26
      Width = 947
      Height = 264
      Align = alClient
      DataSource = dsData
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDrawColumnCell = dbgrdDataDrawColumnCell
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 334
    Width = 955
    Height = 95
    Align = alBottom
    TabOrder = 2
    object lbl3: TLabel
      Left = 632
      Top = 20
      Width = 45
      Height = 15
      Caption = #22995#21517#65306
    end
    object lbl4: TLabel
      Left = 633
      Top = 52
      Width = 38
      Height = 15
      Caption = #24471#20998':'
    end
    object rbRule_1: TRadioButton
      Left = 14
      Top = 7
      Width = 486
      Height = 17
      Caption = #26041#27861'1('#20170#26085#26085#24535#25171#20998' + '#27979#35797#29992#20363#20998' + SVN'#25552#20132#20998')'
      TabOrder = 0
    end
    object edt1: TEdit
      Left = 686
      Top = 16
      Width = 121
      Height = 23
      TabOrder = 1
    end
    object edt2: TEdit
      Left = 686
      Top = 48
      Width = 121
      Height = 23
      TabOrder = 2
    end
    object Button1: TButton
      Left = 826
      Top = 15
      Width = 100
      Height = 25
      Action = actCalc_Total
      TabOrder = 3
    end
    object rbRule_2: TRadioButton
      Left = 14
      Top = 28
      Width = 425
      Height = 17
      Caption = #26041#27861'2('#20170#26085#26085#24535#25171#20998' + '#20851#38381#27979#35797#29992#20363#25968'+'#21019#24314'Bug'#25968')'
      TabOrder = 4
    end
    object rbRule_3: TRadioButton
      Left = 14
      Top = 48
      Width = 361
      Height = 17
      Caption = #26041#27861'3('#20170#26085#26085#24535#25171#20998' + Bug'#24471#20998')'
      TabOrder = 5
    end
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
      OnExecute = actExportExcelExecute
      OnUpdate = actExportExcelUpdate
    end
    object actDownMother: TAction
      Caption = #19979#19968#20010#26376
      OnExecute = actDownMotherExecute
    end
    object actUpMother: TAction
      Caption = #19978#19968#20010#26376
      OnExecute = actUpMotherExecute
    end
    object actCurrMother: TAction
      Caption = #24403#21069#26376#20221
      OnExecute = actCurrMotherExecute
    end
    object actChart: TAction
      Caption = #22270#34920#23545#27604
      OnExecute = actChartExecute
      OnUpdate = actChartUpdate
    end
    object actCalc_Total: TAction
      Caption = #35745#31639#24635#24471#20998
      OnExecute = actCalc_TotalExecute
      OnUpdate = actCalc_TotalUpdate
    end
  end
  object dlgSave1: TSaveDialog
    Filter = 'Excel(*xls)|*.xls'
    Left = 528
    Top = 96
  end
end
