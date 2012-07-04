inherited WarnBuckleScoreClientDlg: TWarnBuckleScoreClientDlg
  Left = 171
  Top = 165
  Caption = #25237#35785#25187#20998
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object pgc1: TPageControl
    Left = 0
    Top = 63
    Width = 854
    Height = 539
    ActivePage = ts1
    Align = alClient
    TabOrder = 0
    OnChanging = pgc1Changing
    object ts1: TTabSheet
      Caption = #25237#35785#25187#20998
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 846
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnWarn_new: TBitBtn
          Left = 8
          Top = 8
          Width = 100
          Height = 25
          Action = act_Warn_new
          Caption = #25105#35201#20030#25253
          TabOrder = 0
        end
        object btnwarn_excel: TBitBtn
          Left = 448
          Top = 8
          Width = 100
          Height = 25
          Action = act_warn_excel
          Caption = #23548#20986'Excel'
          TabOrder = 1
        end
        object btnwarn_del: TBitBtn
          Left = 112
          Top = 8
          Width = 100
          Height = 25
          Action = act_warn_del
          Caption = #25105#35201#21024#38500
          TabOrder = 2
        end
        object btnwarn_writeme: TBitBtn
          Left = 216
          Top = 8
          Width = 100
          Height = 25
          Action = act_warn_writeme
          Caption = #25105#20030#25253#30340
          TabOrder = 3
        end
        object btnwaren_tome: TBitBtn
          Left = 320
          Top = 8
          Width = 100
          Height = 25
          Action = act_waren_tome
          Caption = #25187#25105#20998#30340
          TabOrder = 4
        end
        object edtendpage: TEdit
          Left = 555
          Top = 8
          Width = 47
          Height = 23
          Hint = #21482#23548#20986#21040#31532#20960#39029
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
      end
      object dbgrdResult: TDBGrid
        Left = 0
        Top = 40
        Width = 846
        Height = 366
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
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZTYPENAME'
            Title.Alignment = taCenter
            Title.Caption = #31867#22411
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZCONTENTID'
            Title.Alignment = taCenter
            Title.Caption = #20869#23481'ID'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZCONTENT'
            Title.Alignment = taCenter
            Title.Caption = #26631#39064
            Width = 310
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZUSER_NAME'
            Title.Alignment = taCenter
            Title.Caption = #21457#29983#20154
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZDATETIME'
            Title.Alignment = taCenter
            Title.Caption = #21457#29983#26085#26399
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZNOTE2'
            Title.Alignment = taCenter
            Title.Caption = #25187#20998#29702#30001
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZWRITERNAME'
            Title.Alignment = taCenter
            Title.Caption = #26159#35841#20030#25253
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZSCORE'
            Title.Alignment = taCenter
            Title.Caption = #25187#20998
            Visible = True
          end>
      end
      object pnl2: TPanel
        Left = 0
        Top = 469
        Width = 846
        Height = 40
        Align = alBottom
        TabOrder = 2
        object lblPageCount: TLabel
          Left = 649
          Top = 14
          Width = 96
          Height = 15
          Caption = 'lblPageCount'
        end
        object btnBtnFirstPage: TBitBtn
          Left = 11
          Top = 8
          Width = 100
          Height = 25
          Action = act_page_first
          Caption = #31532#19968#39029
          TabOrder = 0
        end
        object btnBtnProPage: TBitBtn
          Left = 115
          Top = 8
          Width = 100
          Height = 25
          Action = act_page_Provi
          Caption = #19978#19968#39029
          TabOrder = 1
        end
        object btnBtnNextPage: TBitBtn
          Left = 219
          Top = 8
          Width = 100
          Height = 25
          Action = act_page_next
          Caption = #19979#19968#39029
          TabOrder = 2
        end
        object btnBtnLastPage: TBitBtn
          Left = 323
          Top = 8
          Width = 100
          Height = 25
          Action = act_page_Last
          Caption = #26368#21518#19968#39029
          TabOrder = 3
        end
        object btnBtnRefreshData: TBitBtn
          Left = 427
          Top = 8
          Width = 100
          Height = 25
          Action = act_page_reload
          Caption = #21047#26032#25968#25454
          TabOrder = 4
        end
        object btnpage_reload: TBitBtn
          Left = 531
          Top = 8
          Width = 100
          Height = 25
          Action = act_page_Alldata
          Caption = #20840#37096#25968#25454
          TabOrder = 5
        end
      end
      object dbmmoZNOTETEXT: TDBMemo
        Left = 0
        Top = 406
        Width = 846
        Height = 63
        Align = alBottom
        DataField = 'ZNOTETEXT'
        DataSource = dsToDayResult
        ScrollBars = ssVertical
        TabOrder = 3
      end
    end
    object ts2: TTabSheet
      Caption = #25237#35785#20869#23481
      ImageIndex = 1
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
        Caption = #21457#29983#20154#65306
      end
      object lbl5: TLabel
        Left = 21
        Top = 119
        Width = 75
        Height = 15
        Caption = #21457#29983#26085#26399#65306
      end
      object lbl9: TLabel
        Left = 290
        Top = 118
        Width = 24
        Height = 15
        Caption = '<<<'
      end
      object lbl6: TLabel
        Left = 22
        Top = 158
        Width = 75
        Height = 15
        Caption = #25187#20998#29702#30001#65306
      end
      object lbl7: TLabel
        Left = 22
        Top = 381
        Width = 45
        Height = 15
        Caption = #31867#22411#65306
      end
      object lbl8: TLabel
        Left = 295
        Top = 377
        Width = 105
        Height = 15
        Caption = #25253#21151#25110#20030#25253#20154#65306
      end
      object lbl1: TLabel
        Left = 24
        Top = 352
        Width = 45
        Height = 15
        Caption = #25187#20998#65306
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
      object dblkcbbZUSER_NAME: TDBLookupComboBox
        Left = 101
        Top = 80
        Width = 180
        Height = 23
        DataField = 'ZUSER_NAME'
        DataSource = dsToDayResult
        DropDownRows = 30
        ListSource = dsUser
        TabOrder = 2
      end
      object dbedtZDATETIME: TDBEdit
        Left = 101
        Top = 113
        Width = 180
        Height = 23
        DataField = 'ZDATETIME'
        DataSource = dsToDayResult
        TabOrder = 3
      end
      object dtp2: TDateTimePicker
        Left = 331
        Top = 114
        Width = 180
        Height = 23
        Date = 40121.483783634270000000
        Time = 40121.483783634270000000
        TabOrder = 4
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
        TabOrder = 5
      end
      object dblkcbbZTYPENAME: TDBLookupComboBox
        Left = 98
        Top = 374
        Width = 180
        Height = 23
        DataField = 'ZTYPENAME'
        DataSource = dsToDayResult
        ListSource = dsType
        TabOrder = 6
      end
      object dblkcbbZWRITERNAME: TDBLookupComboBox
        Left = 398
        Top = 373
        Width = 180
        Height = 23
        DataField = 'ZWRITERNAME'
        DataSource = dsToDayResult
        DropDownRows = 30
        ListSource = dsUser
        ReadOnly = True
        TabOrder = 7
      end
      object btnBtnNextRow: TBitBtn
        Left = 602
        Top = 98
        Width = 100
        Height = 25
        Action = act_warn_next
        Caption = #19979#19968#20010
        TabOrder = 8
      end
      object btnBtnProRow: TBitBtn
        Left = 602
        Top = 69
        Width = 100
        Height = 25
        Action = act_warn_proiv
        Caption = #19978#19968#20010
        TabOrder = 9
      end
      object btnBtnCancel: TBitBtn
        Left = 602
        Top = 40
        Width = 100
        Height = 25
        Action = act_Warn_clane
        Caption = #21462#28040
        TabOrder = 10
      end
      object btnBtnSave: TBitBtn
        Left = 602
        Top = 11
        Width = 100
        Height = 25
        Action = act_Warn_Save
        Caption = #20445#23384
        TabOrder = 11
      end
      object dbedtZSCORE: TDBEdit
        Left = 101
        Top = 342
        Width = 121
        Height = 23
        DataField = 'ZSCORE'
        DataSource = dsToDayResult
        TabOrder = 12
      end
      object btnwarn_score: TBitBtn
        Left = 602
        Top = 336
        Width = 100
        Height = 25
        Action = act_warn_score
        Caption = #25105#26469#31639#20998
        TabOrder = 13
      end
    end
  end
  object pnlnovisible: TPanel
    Left = 0
    Top = 0
    Width = 854
    Height = 63
    Align = alTop
    TabOrder = 1
    Visible = False
  end
  object dsType: TDataSource
    DataSet = cdsTYPE
    Left = 268
    Top = 32
  end
  object cdsTYPE: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 264
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
  object dsToDayResult: TDataSource
    DataSet = cdsToDayResult
    Left = 226
    Top = 34
  end
  object cdsToDayResult: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsToDayResultBeforePost
    OnCalcFields = cdsToDayResultCalcFields
    OnNewRecord = cdsToDayResultNewRecord
    Left = 224
    Top = 5
  end
  object dsUser: TDataSource
    DataSet = cdsUser
    Left = 112
    Top = 34
  end
  object cdsUser: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 2
  end
  object ds1: TDataSource
    DataSet = cds1
    Left = 308
    Top = 32
  end
  object cds1: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 311
    Top = 2
    Data = {
      400000009619E0BD0100000018000000020000000000030000004000035A4944
      0400010000000000055A4E414D45010049000000010005574944544802000200
      14000000}
    object intgrfld1: TIntegerField
      FieldName = 'ZID'
    end
    object strngfld1: TStringField
      FieldName = 'ZNAME'
    end
  end
  object actlst1: TActionList
    Left = 351
    Top = 10
    object act_page_first: TAction
      Category = #39029#38754
      Caption = #31532#19968#39029
      OnExecute = act_page_firstExecute
      OnUpdate = act_page_firstUpdate
    end
    object act_page_Provi: TAction
      Category = #39029#38754
      Caption = #19978#19968#39029
      OnExecute = act_page_ProviExecute
      OnUpdate = act_page_ProviUpdate
    end
    object act_page_next: TAction
      Category = #39029#38754
      Caption = #19979#19968#39029
      OnExecute = act_page_nextExecute
      OnUpdate = act_page_nextUpdate
    end
    object act_page_Last: TAction
      Category = #39029#38754
      Caption = #26368#21518#19968#39029
      OnExecute = act_page_LastExecute
      OnUpdate = act_page_LastUpdate
    end
    object act_page_reload: TAction
      Category = #39029#38754
      Caption = #21047#26032#25968#25454
      OnExecute = act_page_reloadExecute
    end
    object act_Warn_new: TAction
      Caption = #25105#35201#20030#25253
      OnExecute = act_Warn_newExecute
    end
    object act_Warn_Save: TAction
      Caption = #20445#23384
      OnExecute = act_Warn_SaveExecute
      OnUpdate = act_Warn_SaveUpdate
    end
    object act_Warn_clane: TAction
      Caption = #21462#28040
      OnExecute = act_Warn_claneExecute
      OnUpdate = act_Warn_claneUpdate
    end
    object act_warn_proiv: TAction
      Caption = #19978#19968#20010
      OnExecute = act_warn_proivExecute
      OnUpdate = act_warn_proivUpdate
    end
    object act_warn_next: TAction
      Caption = #19979#19968#20010
      OnExecute = act_warn_nextExecute
      OnUpdate = act_warn_nextUpdate
    end
    object act_warn_excel: TAction
      Caption = #23548#20986'Excel'
      OnExecute = act_warn_excelExecute
    end
    object act_warn_del: TAction
      Caption = #25105#35201#21024#38500
      OnExecute = act_warn_delExecute
      OnUpdate = act_warn_delUpdate
    end
    object act_warn_writeme: TAction
      Caption = #25105#20030#25253#30340
      OnExecute = act_warn_writemeExecute
    end
    object act_waren_tome: TAction
      Caption = #25187#25105#20998#30340
      OnExecute = act_waren_tomeExecute
    end
    object act_warn_score: TAction
      Caption = #25105#26469#31639#20998
      OnExecute = act_warn_scoreExecute
      OnUpdate = act_warn_scoreUpdate
    end
    object act_page_Alldata: TAction
      Category = #39029#38754
      Caption = #20840#37096#25968#25454
      OnExecute = act_page_AlldataExecute
    end
  end
end
