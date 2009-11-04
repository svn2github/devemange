inherited DayWorktableManageClientDlg: TDayWorktableManageClientDlg
  Left = 214
  Top = 122
  Caption = #25105#30340#24037#20316#21488
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object pnlnovisible: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 74
    Align = alTop
    TabOrder = 0
    Visible = False
  end
  object pgc1: TPageControl
    Left = 0
    Top = 74
    Width = 862
    Height = 532
    ActivePage = ts1
    Align = alClient
    TabOrder = 1
    OnChange = pgc1Change
    OnChanging = pgc1Changing
    object ts1: TTabSheet
      Caption = #24037#20316#21488
      object dbtxtZROWNAME: TDBText
        Left = 0
        Top = 485
        Width = 854
        Height = 17
        Align = alBottom
        DataField = 'ZROWNAME'
        DataSource = dswork
      end
      object pnlworkTop: TPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
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
        object Btnmework2: TBitBtn
          Left = 11
          Top = 8
          Width = 100
          Height = 25
          Action = act_mework
          Caption = #25105#30340#24037#20316#21488
          TabOrder = 0
        end
        object Btngoto: TBitBtn
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
        object Btnhiswork: TBitBtn
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
        Top = 40
        Width = 854
        Height = 445
        Align = alClient
        DataSource = dswork
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
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
            FieldName = 'ZBUILDDATE'
            Title.Alignment = taCenter
            Title.Caption = #21019#24314#26102#38388
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZCONTENTID'
            Title.Alignment = taCenter
            Title.Caption = #20869#23481#32534#21495
            Width = 70
            Visible = True
          end>
      end
    end
    object ts2: TTabSheet
      Caption = #36129#29486#21147#37327
      ImageIndex = 1
      object pnlTool: TPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lbl1: TLabel
          Left = 116
          Top = 14
          Width = 68
          Height = 15
          Caption = #36129#29486#26102#38388':'
        end
        object lblName1: TLabel
          Left = 811
          Top = 14
          Width = 30
          Height = 15
          Caption = #21517#31216
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object BtnReader: TBitBtn
          Left = 11
          Top = 8
          Width = 100
          Height = 25
          Action = act1_ReadToDay
          Caption = #20170#26085#36129#29486#22810#23569
          TabOrder = 0
        end
        object dtp1: TDateTimePicker
          Left = 187
          Top = 10
          Width = 130
          Height = 23
          Date = 40121.434358171300000000
          Time = 40121.434358171300000000
          TabOrder = 1
        end
        object BtnMeWrite: TBitBtn
          Left = 679
          Top = 8
          Width = 100
          Height = 25
          Action = act_MeWrite
          Caption = #25253#21151#25110#20030#25253
          TabOrder = 2
        end
        object dblkcbb2: TDBLookupComboBox
          Left = 425
          Top = 10
          Width = 145
          Height = 23
          DropDownRows = 30
          KeyField = 'ZID'
          ListField = 'ZNAME'
          ListSource = dsUser
          TabOrder = 3
        end
        object BtnOtherResultToDay: TBitBtn
          Left = 575
          Top = 8
          Width = 100
          Height = 25
          Action = act_OtherResultToDay
          Caption = #20182#20154#36129#29486
          TabOrder = 4
        end
        object BtnGotoContent: TBitBtn
          Left = 321
          Top = 8
          Width = 100
          Height = 25
          Action = act_GotoContent
          Caption = #25171#24320#20869#23481
          TabOrder = 5
        end
      end
      object dbgrdResult: TDBGrid
        Left = 0
        Top = 40
        Width = 854
        Height = 422
        Align = alClient
        DataSource = dsToDayResult
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDrawColumnCell = dbgrdResultDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'ZMYID'
            Title.Alignment = taCenter
            Title.Caption = #32534#21495
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZCONTENTID'
            Title.Alignment = taCenter
            Title.Caption = #20869#23481'ID'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZCONTENT'
            Title.Alignment = taCenter
            Title.Caption = #26631#39064
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZUSER_NAME'
            Title.Alignment = taCenter
            Title.Caption = #36129#29486#20154
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZDATETIME'
            Title.Alignment = taCenter
            Title.Caption = #36129#29486#26102#38388
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZNOTETEXT'
            Title.Alignment = taCenter
            Title.Caption = #21407#22240#20107#30001
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZTYPENAME'
            Title.Alignment = taCenter
            Title.Caption = #31867#22411
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZWRITERNAME'
            Title.Alignment = taCenter
            Title.Caption = #35841#25253#21151#20030#25253
            Width = 80
            Visible = True
          end>
      end
      object pnl2: TPanel
        Left = 0
        Top = 462
        Width = 854
        Height = 40
        Align = alBottom
        TabOrder = 2
        object lblPageCount: TLabel
          Left = 640
          Top = 13
          Width = 96
          Height = 15
          Caption = 'lblPageCount'
        end
        object BtnFirstPage: TBitBtn
          Left = 8
          Top = 8
          Width = 100
          Height = 25
          Action = act_FirstPage
          Caption = #31532#19968#39029
          TabOrder = 0
        end
        object BtnProPage: TBitBtn
          Left = 112
          Top = 8
          Width = 100
          Height = 25
          Action = act_ProPage
          Caption = #19978#19968#39029
          TabOrder = 1
        end
        object BtnNextPage: TBitBtn
          Left = 216
          Top = 8
          Width = 100
          Height = 25
          Action = act_NextPage
          Caption = #19979#19968#39029
          TabOrder = 2
        end
        object BtnLastPage: TBitBtn
          Left = 320
          Top = 8
          Width = 100
          Height = 25
          Action = act_LastPage
          Caption = #26368#21518#19968#39029
          TabOrder = 3
        end
        object BtnRefreshData: TBitBtn
          Left = 424
          Top = 8
          Width = 100
          Height = 25
          Action = act_RefreshData
          Caption = #21047#26032#25968#25454
          TabOrder = 4
        end
        object BtnAllData: TBitBtn
          Left = 528
          Top = 8
          Width = 100
          Height = 25
          Action = act_AllData
          Caption = #20840#37096#25968#25454
          TabOrder = 5
        end
      end
    end
    object ts3: TTabSheet
      Caption = #36129#29486#20869#23481
      ImageIndex = 2
      object lbl2: TLabel
        Left = 22
        Top = 24
        Width = 61
        Height = 15
        Caption = #20869#23481'ID'#65306
      end
      object lbl3: TLabel
        Left = 22
        Top = 54
        Width = 45
        Height = 15
        Caption = #26631#39064#65306
      end
      object lbl4: TLabel
        Left = 22
        Top = 86
        Width = 60
        Height = 15
        Caption = #36129#29486#20154#65306
      end
      object lbl5: TLabel
        Left = 21
        Top = 119
        Width = 75
        Height = 15
        Caption = #36129#29486#26102#38388#65306
      end
      object lbl6: TLabel
        Left = 22
        Top = 158
        Width = 75
        Height = 15
        Caption = #21407#22240#20107#30001#65306
      end
      object lbl7: TLabel
        Left = 22
        Top = 352
        Width = 45
        Height = 15
        Caption = #31867#22411#65306
      end
      object lbl8: TLabel
        Left = 295
        Top = 352
        Width = 105
        Height = 15
        Caption = #25253#21151#25110#20030#25253#20154#65306
      end
      object lbl9: TLabel
        Left = 290
        Top = 118
        Width = 24
        Height = 15
        Caption = '<<<'
      end
      object dbedtZCONTENTID: TDBEdit
        Left = 101
        Top = 20
        Width = 180
        Height = 23
        DataField = 'ZCONTENTID'
        DataSource = dsToDayResult
        TabOrder = 0
      end
      object dbedtZCONTENT: TDBEdit
        Left = 101
        Top = 50
        Width = 472
        Height = 23
        DataField = 'ZCONTENT'
        DataSource = dsToDayResult
        TabOrder = 1
      end
      object dtp2: TDateTimePicker
        Left = 331
        Top = 114
        Width = 180
        Height = 23
        Date = 40121.483783634260000000
        Time = 40121.483783634260000000
        TabOrder = 2
        OnChange = dtp2Change
      end
      object dbmmoZNOTE: TDBMemo
        Left = 101
        Top = 156
        Width = 476
        Height = 177
        DataField = 'ZNOTE'
        DataSource = dsToDayResult
        ScrollBars = ssBoth
        TabOrder = 3
      end
      object BtnSave: TBitBtn
        Left = 602
        Top = 11
        Width = 100
        Height = 25
        Action = act_Save
        Caption = #20445#23384
        TabOrder = 4
      end
      object BtnCancel: TBitBtn
        Left = 602
        Top = 40
        Width = 100
        Height = 25
        Action = act_Cancel
        Caption = #21462#28040
        TabOrder = 5
      end
      object BtnProRow: TBitBtn
        Left = 602
        Top = 69
        Width = 100
        Height = 25
        Action = act_ProRow
        Caption = #19978#19968#20010
        TabOrder = 6
      end
      object BtnNextRow: TBitBtn
        Left = 602
        Top = 98
        Width = 100
        Height = 25
        Action = act_NextRow
        Caption = #19979#19968#20010
        TabOrder = 7
      end
      object dbedtZDATETIME: TDBEdit
        Left = 101
        Top = 113
        Width = 180
        Height = 23
        DataField = 'ZDATETIME'
        DataSource = dsToDayResult
        TabOrder = 8
      end
      object dblkcbbZUSER_NAME: TDBLookupComboBox
        Left = 101
        Top = 80
        Width = 180
        Height = 23
        DataField = 'ZUSER_NAME'
        DataSource = dsToDayResult
        DropDownRows = 30
        ListSource = dsUser
        TabOrder = 9
      end
      object dblkcbbZWRITERNAME: TDBLookupComboBox
        Left = 398
        Top = 346
        Width = 180
        Height = 23
        DataField = 'ZWRITERNAME'
        DataSource = dsToDayResult
        DropDownRows = 30
        ListSource = dsUser
        ReadOnly = True
        TabOrder = 10
      end
      object dblkcbbZTYPENAME: TDBLookupComboBox
        Left = 104
        Top = 349
        Width = 180
        Height = 23
        DataField = 'ZTYPENAME'
        DataSource = dsToDayResult
        ListSource = dsType
        TabOrder = 11
      end
    end
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
  object actlst2: TActionList
    Left = 192
    Top = 9
    object act1_ReadToDay: TAction
      Caption = #20170#26085#36129#29486#22810#23569
      OnExecute = act1_ReadToDayExecute
    end
    object act_MeWrite: TAction
      Caption = #25105#25253#21151
      OnExecute = act_MeWriteExecute
    end
    object act_Save: TAction
      Caption = #20445#23384
      OnExecute = act_SaveExecute
      OnUpdate = act_SaveUpdate
    end
    object act_Cancel: TAction
      Caption = #21462#28040
      OnExecute = act_CancelExecute
      OnUpdate = act_CancelUpdate
    end
    object act_NextRow: TAction
      Caption = #19979#19968#20010
      OnExecute = act_NextRowExecute
      OnUpdate = act_NextRowUpdate
    end
    object act_ProRow: TAction
      Caption = #19978#19968#20010
      OnExecute = act_ProRowExecute
      OnUpdate = act_ProRowUpdate
    end
    object act_OtherResultToDay: TAction
      Caption = #20182#20154#36129#29486
      OnExecute = act_OtherResultToDayExecute
    end
    object act_FirstPage: TAction
      Category = #39029#38754
      Caption = #31532#19968#39029
      OnExecute = act_FirstPageExecute
      OnUpdate = act_FirstPageUpdate
    end
    object act_ProPage: TAction
      Category = #39029#38754
      Caption = #19978#19968#39029
      OnExecute = act_ProPageExecute
      OnUpdate = act_ProPageUpdate
    end
    object act_NextPage: TAction
      Category = #39029#38754
      Caption = #19979#19968#39029
      OnExecute = act_NextPageExecute
      OnUpdate = act_NextPageUpdate
    end
    object act_LastPage: TAction
      Category = #39029#38754
      Caption = #26368#21518#19968#39029
      OnExecute = act_LastPageExecute
      OnUpdate = act_LastPageUpdate
    end
    object act_RefreshData: TAction
      Category = #39029#38754
      Caption = #21047#26032#25968#25454
      OnExecute = act_RefreshDataExecute
    end
    object act_AllData: TAction
      Category = #39029#38754
      Caption = #20840#37096#25968#25454
      OnExecute = act_AllDataExecute
    end
    object act_GotoContent: TAction
      Caption = #25171#24320#20869#23481
      OnExecute = act_GotoContentExecute
    end
  end
  object cdsToDayResult: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsToDayResultBeforePost
    OnCalcFields = cdsToDayResultCalcFields
    OnNewRecord = cdsToDayResultNewRecord
    Left = 224
    Top = 8
  end
  object dsToDayResult: TDataSource
    DataSet = cdsToDayResult
    Left = 256
    Top = 8
  end
  object cdsTYPE: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 8
    Data = {
      400000009619E0BD0100000018000000020000000000030000004000035A4944
      0400010000000000055A4E414D45010049000000010005574944544802000200
      14000000}
    object intgrfldcds1ZID: TIntegerField
      FieldName = 'ZID'
    end
    object strngfldcds1ZNAME: TStringField
      FieldName = 'ZNAME'
    end
  end
  object dsType: TDataSource
    DataSet = cdsTYPE
    Left = 324
    Top = 8
  end
end
