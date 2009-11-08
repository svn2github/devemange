inherited DayWorktableManageClientDlg: TDayWorktableManageClientDlg
  Left = 183
  Top = 51
  Width = 971
  Caption = #25105#30340#24037#20316#21488
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object pnlnovisible: TPanel
    Left = 0
    Top = 0
    Width = 963
    Height = 74
    Align = alTop
    TabOrder = 0
    Visible = False
  end
  object pgc1: TPageControl
    Left = 0
    Top = 74
    Width = 963
    Height = 532
    ActivePage = ts2
    Align = alClient
    TabOrder = 1
    OnChange = pgc1Change
    OnChanging = pgc1Changing
    object ts1: TTabSheet
      Caption = #24037#20316#21488
      object dbtxtZROWNAME: TDBText
        Left = 0
        Top = 484
        Width = 955
        Height = 18
        Align = alBottom
        DataField = 'ZROWNAME'
        DataSource = dswork
      end
      object pnlworkTop: TPanel
        Left = 0
        Top = 0
        Width = 955
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
        Width = 955
        Height = 444
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
        Width = 955
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lblName1: TLabel
          Left = 927
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
          Left = 112
          Top = 8
          Width = 100
          Height = 25
          Action = act1_ReadToDay
          Caption = #20170#26085#36129#29486
          TabOrder = 0
        end
        object dtp1: TDateTimePicker
          Left = 222
          Top = 9
          Width = 120
          Height = 23
          Date = 40121.434358171300000000
          Time = 40121.434358171300000000
          TabOrder = 1
        end
        object BtnMeWrite: TBitBtn
          Left = 782
          Top = 7
          Width = 100
          Height = 25
          Action = act_MeWrite
          Caption = #25253#21151#25110#20030#25253
          TabOrder = 2
        end
        object dblkcbb2: TDBLookupComboBox
          Left = 346
          Top = 9
          Width = 120
          Height = 23
          DropDownRows = 30
          KeyField = 'ZID'
          ListField = 'ZNAME'
          ListSource = dsUser
          TabOrder = 3
        end
        object BtnOtherResultToDay: TBitBtn
          Left = 470
          Top = 7
          Width = 100
          Height = 25
          Action = act_OtherResultToDay
          Caption = #20182#20154#36129#29486
          TabOrder = 4
        end
        object BtnGotoContent: TBitBtn
          Left = 678
          Top = 7
          Width = 100
          Height = 25
          Action = act_GotoContent
          Caption = #25171#24320#20869#23481
          TabOrder = 5
        end
        object Btn1_Readyesterday: TBitBtn
          Left = 8
          Top = 8
          Width = 100
          Height = 25
          Action = act1_Readyesterday
          Caption = #26152#26085#25112#26524
          TabOrder = 6
        end
        object BtnReadAll: TBitBtn
          Left = 574
          Top = 7
          Width = 100
          Height = 25
          Action = act_ReadAll
          Caption = #22242#38431#25104#26524
          TabOrder = 7
        end
      end
      object dbgrdResult: TDBGrid
        Left = 0
        Top = 40
        Width = 955
        Height = 337
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
      object pnl1: TPanel
        Left = 0
        Top = 377
        Width = 955
        Height = 125
        Align = alBottom
        BevelOuter = bvLowered
        Caption = 'pnl1'
        TabOrder = 2
        object dbtxtZCONTENT: TDBText
          Left = 1
          Top = 1
          Width = 615
          Height = 123
          Align = alClient
          DataField = 'ZCONTENT'
          DataSource = dsToDayResult
          WordWrap = True
        end
        object pnl2: TPanel
          Left = 616
          Top = 1
          Width = 338
          Height = 123
          Align = alRight
          TabOrder = 0
          object lbl1: TLabel
            Left = 14
            Top = 9
            Width = 113
            Height = 15
            Caption = #25552#20132#27979#35797#29992#20363#25968':'
          end
          object lbl10: TLabel
            Left = 14
            Top = 32
            Width = 128
            Height = 15
            Caption = #25552#20132#29992#20363#34987#28608#27963#25968':'
            Font.Charset = GB2312_CHARSET
            Font.Color = clRed
            Font.Height = -15
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lbl11: TLabel
            Left = 14
            Top = 54
            Width = 122
            Height = 15
            Caption = #20851#38381'BUG'#34987#28608#27963#25968':'
            Font.Charset = GB2312_CHARSET
            Font.Color = clRed
            Font.Height = -15
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lbl12: TLabel
            Left = 14
            Top = 80
            Width = 77
            Height = 15
            Caption = #25552#20132'BUG'#25968':'
          end
          object lbl13: TLabel
            Left = 14
            Top = 104
            Width = 77
            Height = 15
            Caption = 'SVN'#25552#20132#25968':'
          end
          object lbl14: TLabel
            Left = 166
            Top = 9
            Width = 40
            Height = 15
            Caption = 'lbl14'
          end
          object lbl15: TLabel
            Left = 166
            Top = 32
            Width = 40
            Height = 15
            Caption = 'lbl15'
            Font.Charset = GB2312_CHARSET
            Font.Color = clRed
            Font.Height = -15
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lbl16: TLabel
            Left = 166
            Top = 54
            Width = 40
            Height = 15
            Caption = 'lbl16'
            Font.Charset = GB2312_CHARSET
            Font.Color = clRed
            Font.Height = -15
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lbl17: TLabel
            Left = 166
            Top = 80
            Width = 40
            Height = 15
            Caption = 'lbl17'
          end
          object lbl18: TLabel
            Left = 166
            Top = 104
            Width = 40
            Height = 15
            Caption = 'lbl18'
          end
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
        Date = 40121.483783634270000000
        Time = 40121.483783634270000000
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
      Category = #20170#26085#36129#29486
      Caption = #20170#26085#36129#29486
      OnExecute = act1_ReadToDayExecute
    end
    object act_MeWrite: TAction
      Category = #20170#26085#36129#29486
      Caption = #25105#25253#21151
      OnExecute = act_MeWriteExecute
    end
    object act_Save: TAction
      Category = #20170#26085#36129#29486
      Caption = #20445#23384
      OnExecute = act_SaveExecute
      OnUpdate = act_SaveUpdate
    end
    object act_Cancel: TAction
      Category = #20170#26085#36129#29486
      Caption = #21462#28040
      OnExecute = act_CancelExecute
      OnUpdate = act_CancelUpdate
    end
    object act_NextRow: TAction
      Category = #20170#26085#36129#29486
      Caption = #19979#19968#20010
      OnExecute = act_NextRowExecute
      OnUpdate = act_NextRowUpdate
    end
    object act_ProRow: TAction
      Category = #20170#26085#36129#29486
      Caption = #19978#19968#20010
      OnExecute = act_ProRowExecute
      OnUpdate = act_ProRowUpdate
    end
    object act_OtherResultToDay: TAction
      Category = #20170#26085#36129#29486
      Caption = #20182#20154#36129#29486
      OnExecute = act_OtherResultToDayExecute
    end
    object act_GotoContent: TAction
      Category = #20170#26085#36129#29486
      Caption = #25171#24320#20869#23481
      OnExecute = act_GotoContentExecute
    end
    object act1_Readyesterday: TAction
      Category = #20170#26085#36129#29486
      Caption = #26152#26085#25112#26524
      OnExecute = act1_ReadyesterdayExecute
    end
    object act_ReadAll: TAction
      Category = #20170#26085#36129#29486
      Caption = #22242#38431#25104#26524
      OnExecute = act_ReadAllExecute
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
