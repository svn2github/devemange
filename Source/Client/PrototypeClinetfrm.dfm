inherited PrototypeClientDlg: TPrototypeClientDlg
  Left = 359
  Top = 260
  Width = 844
  Caption = #20135#21697#21407#22411
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object pgcPrty: TPageControl
    Left = 0
    Top = 73
    Width = 828
    Height = 529
    ActivePage = tsList
    Align = alClient
    TabOrder = 0
    OnChanging = pgcPrtyChanging
    object tsList: TTabSheet
      Caption = #21407#22411#21015#34920
      object pnlTools: TPanel
        Left = 0
        Top = 0
        Width = 820
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnAddPro: TBitBtn
          Left = 13
          Top = 6
          Width = 100
          Height = 25
          Action = act_AddPro
          Caption = #22686#21152#21407#22411
          TabOrder = 0
        end
        object btnPrtyView: TBitBtn
          Left = 117
          Top = 6
          Width = 100
          Height = 25
          Action = act_PrtyView
          Caption = #21407#22411#27983#35272
          TabOrder = 1
        end
      end
      object dbgrdList: TDBGrid
        Left = 0
        Top = 41
        Width = 820
        Height = 417
        Align = alClient
        DataSource = dsList
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDrawColumnCell = dbgrdListDrawColumnCell
        OnDblClick = dbgrdListDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ZAUTOID'
            Title.Alignment = taCenter
            Title.Caption = #24207#21495
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRTY_NAME'
            Title.Alignment = taCenter
            Title.Caption = #39033#30446#21517#31216
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZUSERNAME'
            Title.Alignment = taCenter
            Title.Caption = #20316#32773
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRTY_DATETIME'
            Title.Alignment = taCenter
            Title.Caption = #21019#24314#26102#38388
            Width = 180
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRTY_DIRNAME'
            Title.Alignment = taCenter
            Title.Caption = 'SVN'#23376#30446#24405
            Width = 200
            Visible = True
          end>
      end
      object pnlPrtyBottom: TPanel
        Left = 0
        Top = 458
        Width = 820
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object lblpagecount: TLabel
          Left = 592
          Top = 16
          Width = 96
          Height = 15
          Caption = 'lblpagecount'
        end
        object btnFirstPage: TBitBtn
          Left = 7
          Top = 12
          Width = 100
          Height = 25
          Action = act_FirstPage
          Caption = #31532#19968#39029
          TabOrder = 0
        end
        object btnProPage: TBitBtn
          Left = 111
          Top = 12
          Width = 100
          Height = 25
          Action = act_ProPage
          Caption = #19978#19968#39029
          TabOrder = 1
        end
        object btnNextPage: TBitBtn
          Left = 215
          Top = 12
          Width = 100
          Height = 25
          Action = act_NextPage
          Caption = #19979#19968#39029
          TabOrder = 2
        end
        object btnLastPage: TBitBtn
          Left = 319
          Top = 12
          Width = 100
          Height = 25
          Action = act_LastPage
          Caption = #26368#21518#19968#39029
          TabOrder = 3
        end
      end
    end
    object tsEdit: TTabSheet
      Caption = #32534#36753#21407#22411
      ImageIndex = 1
      object lbl1: TLabel
        Left = 40
        Top = 32
        Width = 75
        Height = 15
        Caption = #39033#30446#21517#31216#65306
      end
      object lbl2: TLabel
        Left = 44
        Top = 68
        Width = 84
        Height = 15
        Caption = 'SVN'#23376#30446#24405#65306
      end
      object dbedtPRTY_NAME: TDBEdit
        Left = 129
        Top = 27
        Width = 515
        Height = 23
        DataField = 'PRTY_NAME'
        DataSource = dsList
        TabOrder = 0
      end
      object dbedtPRTY_NAME1: TDBEdit
        Left = 128
        Top = 64
        Width = 518
        Height = 23
        DataField = 'PRTY_DIRNAME'
        DataSource = dsList
        TabOrder = 1
      end
      object btnSavePro: TBitBtn
        Left = 72
        Top = 136
        Width = 100
        Height = 25
        Action = act_SavePro
        Caption = #20445#23384#20462#25913
        TabOrder = 2
      end
      object btnClance: TBitBtn
        Left = 184
        Top = 136
        Width = 100
        Height = 25
        Action = act_Clance
        Caption = #21462#28040#20445#23384
        TabOrder = 3
      end
    end
    object tsView: TTabSheet
      Caption = #21407#22411#27983#35272
      ImageIndex = 1
      object wbview: TWebBrowser
        Left = 0
        Top = 0
        Width = 820
        Height = 499
        Align = alClient
        TabOrder = 0
        ControlData = {
          4C000000C0540000933300000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
  end
  object pnlonvisible: TPanel
    Left = 0
    Top = 0
    Width = 828
    Height = 73
    Align = alTop
    Caption = #19981#21487#35270#38754#26495
    TabOrder = 1
    Visible = False
  end
  object actlst1: TActionList
    Left = 32
    Top = 16
    object act_AddPro: TAction
      Caption = #22686#21152#21407#22411
      OnExecute = act_AddProExecute
      OnUpdate = act_AddProUpdate
    end
    object act_SavePro: TAction
      Caption = #20445#23384#20462#25913
      OnExecute = act_SaveProExecute
      OnUpdate = act_SaveProUpdate
    end
    object act_Clance: TAction
      Caption = #21462#28040#20445#23384
      OnExecute = act_ClanceExecute
      OnUpdate = act_ClanceUpdate
    end
    object act_PrtyView: TAction
      Caption = #21407#22411#27983#35272
      OnExecute = act_PrtyViewExecute
      OnUpdate = act_PrtyViewUpdate
    end
    object act_FirstPage: TAction
      Caption = #31532#19968#39029
      OnExecute = act_FirstPageExecute
      OnUpdate = act_FirstPageUpdate
    end
    object act_NextPage: TAction
      Caption = #19979#19968#39029
      OnExecute = act_NextPageExecute
      OnUpdate = act_NextPageUpdate
    end
    object act_ProPage: TAction
      Caption = #19978#19968#39029
      OnExecute = act_ProPageExecute
      OnUpdate = act_ProPageUpdate
    end
    object act_LastPage: TAction
      Caption = #26368#21518#19968#39029
      OnExecute = act_LastPageExecute
      OnUpdate = act_LastPageUpdate
    end
  end
  object dsList: TDataSource
    DataSet = cdsPrtyList
    Left = 88
    Top = 8
  end
  object cdsPrtyList: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsPrtyListBeforePost
    OnNewRecord = cdsPrtyListNewRecord
    Left = 88
    Top = 40
  end
end
