inherited DayWorktableManageClientDlg: TDayWorktableManageClientDlg
  Left = 170
  Top = 141
  Caption = #25105#30340#24037#20316#21488
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object dbtxtZROWNAME: TDBText
    Left = 0
    Top = 589
    Width = 862
    Height = 17
    Align = alBottom
    DataField = 'ZROWNAME'
    DataSource = dswork
  end
  object pnlnovisible: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 74
    Align = alTop
    TabOrder = 0
    Visible = False
  end
  object pnlworkTop: TPanel
    Left = 0
    Top = 74
    Width = 862
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lblName: TLabel
      Left = 732
      Top = 12
      Width = 56
      Height = 15
      Caption = 'lblName'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object btnmework: TBitBtn
      Left = 11
      Top = 8
      Width = 100
      Height = 25
      Action = act_mework
      Caption = #25105#30340#24037#20316#21488
      TabOrder = 0
    end
    object btnmework_Refresh: TBitBtn
      Left = 115
      Top = 8
      Width = 100
      Height = 25
      Action = act_goto
      Caption = #25171#24320#20869#23481
      TabOrder = 1
    end
    object dblkcbb1: TDBLookupComboBox
      Left = 236
      Top = 10
      Width = 145
      Height = 23
      DropDownRows = 30
      KeyField = 'ZID'
      ListField = 'ZNAME'
      ListSource = dsUser
      TabOrder = 2
    end
    object btnmework1: TBitBtn
      Left = 385
      Top = 8
      Width = 100
      Height = 25
      Action = act_hiswork
      Caption = #20182#20154#24037#20316#21488
      TabOrder = 3
    end
    object dbnvgr1: TDBNavigator
      Left = 489
      Top = 8
      Width = 224
      Height = 25
      DataSource = dswork
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 4
    end
  end
  object dbgrdwork: TDBGrid
    Left = 0
    Top = 114
    Width = 862
    Height = 475
    Align = alClient
    DataSource = dswork
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = dbgrdworkDrawColumnCell
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ZROWID'
        Title.Alignment = taCenter
        Title.Caption = #24207#21495
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZROWNAME'
        Title.Alignment = taCenter
        Title.Caption = #24037#20316#20869#23481
        Width = 600
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZCONTENTID'
        Title.Alignment = taCenter
        Title.Caption = #20869#23481#32534#21495
        Width = 80
        Visible = True
      end>
  end
  object actlst1: TActionList
    Left = 16
    Top = 8
    object act_mework: TAction
      Caption = #25105#30340#24037#20316#21488
      OnExecute = act_meworkExecute
    end
    object act_goto: TAction
      Caption = #25171#24320#20869#23481
      OnExecute = act_gotoExecute
      OnUpdate = act_gotoUpdate
    end
    object act_hiswork: TAction
      Caption = #20182#20154#24037#20316#21488
      OnExecute = act_hisworkExecute
      OnUpdate = act_hisworkUpdate
    end
  end
  object cdswork: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 5
  end
  object dswork: TDataSource
    DataSet = cdswork
    Left = 72
    Top = 39
  end
  object cdsUser: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 8
  end
  object dsUser: TDataSource
    DataSet = cdsUser
    Left = 112
    Top = 40
  end
end
