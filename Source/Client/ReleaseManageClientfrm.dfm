inherited ReleaseManageClientDlg: TReleaseManageClientDlg
  Left = 274
  Top = 104
  Caption = #21457#24067#31649#29702
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object pgcMain: TPageControl
    Left = 0
    Top = 65
    Width = 862
    Height = 541
    ActivePage = ts1
    Align = alClient
    TabOrder = 0
    OnChanging = pgcMainChanging
    object ts1: TTabSheet
      Caption = #21457#24067#39033#30446
      object pnlListTop: TPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnAddRelease: TBitBtn
          Left = 13
          Top = 7
          Width = 100
          Height = 25
          Action = act_AddRelease
          Caption = #26032#22686#21457#24067
          TabOrder = 0
        end
        object btnMeResult: TBitBtn
          Left = 117
          Top = 8
          Width = 100
          Height = 25
          Action = act_MeResult
          Caption = #25105#21019#24314#30340
          TabOrder = 1
        end
        object btnMeUp: TBitBtn
          Left = 221
          Top = 8
          Width = 100
          Height = 25
          Action = act_MeUp
          Caption = #25351#27966#32473#25105#30340
          TabOrder = 2
        end
      end
      object pnlListBottom: TPanel
        Left = 0
        Top = 471
        Width = 854
        Height = 40
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object lblPage: TLabel
          Left = 543
          Top = 12
          Width = 56
          Height = 15
          Caption = 'lblPage'
        end
        object btnFirstPage: TBitBtn
          Left = 17
          Top = 8
          Width = 100
          Height = 25
          Action = act_FirstPage
          Caption = #31532#19968#39029
          TabOrder = 0
        end
        object btnProipage: TBitBtn
          Left = 121
          Top = 8
          Width = 100
          Height = 25
          Action = act_Proipage
          Caption = #19978#19968#39029
          TabOrder = 1
        end
        object btnNextPage: TBitBtn
          Left = 225
          Top = 8
          Width = 100
          Height = 25
          Action = act_NextPage
          Caption = #19979#19968#39029
          TabOrder = 2
        end
        object btnLastPage: TBitBtn
          Left = 329
          Top = 8
          Width = 100
          Height = 25
          Action = act_LastPage
          Caption = #19979#19968#39029
          TabOrder = 3
        end
        object btnPageRefresh: TBitBtn
          Left = 433
          Top = 8
          Width = 100
          Height = 25
          Action = act_PageRefresh
          Caption = #21047#26032#25968#25454
          TabOrder = 4
        end
      end
      object dbgrdRelease: TDBGrid
        Left = 0
        Top = 40
        Width = 854
        Height = 431
        Align = alClient
        DataSource = dsRelease
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDrawColumnCell = dbgrdReleaseDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'ZID'
            Title.Alignment = taCenter
            Title.Caption = #32534#21495
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZNAME'
            Title.Alignment = taCenter
            Title.Caption = #21517#31216
            Width = 400
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZOPENEDBYNAME'
            Title.Alignment = taCenter
            Title.Caption = #21019#24314#20154
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZASSIGNEDTONAME'
            Title.Alignment = taCenter
            Title.Caption = #25351#27966#32473
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZURLTYPENAME'
            Title.Alignment = taCenter
            Title.Caption = #21457#24067#26041#21521
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZOPENDATE'
            Title.Alignment = taCenter
            Title.Caption = #21019#24314#26102#38388
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZNEEDTERMNAME'
            Title.Alignment = taCenter
            Title.Caption = #35201#27714#26399#38480
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZRELEASEDATE'
            Title.Alignment = taCenter
            Title.Caption = #21457#24067#19978#20256#26102#38388
            Width = 150
            Visible = True
          end>
      end
    end
    object ts2: TTabSheet
      Caption = #21457#24067#20869#23481
      ImageIndex = 1
      object dbtxtZNAME: TDBText
        Left = 0
        Top = 0
        Width = 854
        Height = 17
        Align = alTop
        Color = clOlive
        DataField = 'ZNAME'
        DataSource = dsRelease
        ParentColor = False
      end
      object spl1: TSplitter
        Left = 0
        Top = 223
        Width = 854
        Height = 9
        Cursor = crVSplit
        Align = alTop
        Beveled = True
      end
      object scrlbx1: TScrollBox
        Left = 0
        Top = 17
        Width = 854
        Height = 206
        Align = alTop
        TabOrder = 0
        object lbl1: TLabel
          Left = 11
          Top = 8
          Width = 75
          Height = 15
          Caption = #31435#39033#39033#30446#65306
        end
        object lbl2: TLabel
          Left = 541
          Top = 65
          Width = 75
          Height = 15
          Caption = #35201#27714#26399#38480#65306
        end
        object lbl3: TLabel
          Left = 41
          Top = 36
          Width = 45
          Height = 15
          Caption = #21517#31216#65306
        end
        object lbl4: TLabel
          Left = 26
          Top = 64
          Width = 60
          Height = 15
          Caption = #25351#27966#32473#65306
        end
        object lbl5: TLabel
          Left = 283
          Top = 63
          Width = 75
          Height = 15
          Caption = #21457#24067#26102#38388#65306
        end
        object lbl6: TLabel
          Left = 26
          Top = 90
          Width = 60
          Height = 15
          Caption = #21019#24314#20154#65306
        end
        object lbl7: TLabel
          Left = 283
          Top = 89
          Width = 75
          Height = 15
          Caption = #21019#24314#26102#38388#65306
        end
        object lbl8: TLabel
          Left = 11
          Top = 120
          Width = 75
          Height = 15
          Caption = #21457#24067#26041#21521#65306
        end
        object lbl9: TLabel
          Left = 264
          Top = 120
          Width = 16
          Height = 15
          Caption = '>>'
        end
        object lbl10: TLabel
          Left = 11
          Top = 178
          Width = 75
          Height = 15
          Caption = #37038#20214#36890#30693#65306
        end
        object lbl11: TLabel
          Left = 548
          Top = 179
          Width = 24
          Height = 15
          Caption = '<<<'
        end
        object lbl12: TLabel
          Left = 549
          Top = 121
          Width = 24
          Height = 15
          Caption = '<<<'
        end
        object lbl13: TLabel
          Left = -3
          Top = 147
          Width = 90
          Height = 15
          Caption = #35201#19978#20256#25991#20214#65306
        end
        object lbl14: TLabel
          Left = 498
          Top = 9
          Width = 53
          Height = 15
          Caption = #29256#26412#21495':'
        end
        object btnSave: TBitBtn
          Left = 738
          Top = 7
          Width = 100
          Height = 25
          Action = act_Save
          Caption = #20445#23384
          TabOrder = 0
        end
        object btnCancel: TBitBtn
          Left = 738
          Top = 36
          Width = 100
          Height = 25
          Action = act_Cancel
          Caption = #21462#28040
          TabOrder = 1
        end
        object btnProi: TBitBtn
          Left = 738
          Top = 65
          Width = 100
          Height = 25
          Action = act_Proi
          Caption = #19978#19968#20010
          TabOrder = 2
        end
        object btnNext: TBitBtn
          Left = 738
          Top = 94
          Width = 100
          Height = 25
          Action = act_Next
          Caption = #19979#19968#20010
          TabOrder = 3
        end
        object dblkcbbZNEEDTERMNAME: TDBLookupComboBox
          Left = 613
          Top = 62
          Width = 112
          Height = 23
          DataField = 'ZNEEDTERMNAME'
          DataSource = dsRelease
          TabOrder = 4
        end
        object dbedtZNAME: TDBEdit
          Left = 83
          Top = 33
          Width = 640
          Height = 23
          DataField = 'ZNAME'
          DataSource = dsRelease
          TabOrder = 5
        end
        object dblkcbbZPRO_NAME: TDBLookupComboBox
          Left = 83
          Top = 5
          Width = 296
          Height = 23
          DataField = 'ZPRO_NAME'
          DataSource = dsRelease
          TabOrder = 6
        end
        object dblkcbbZASSIGNEDTONAME: TDBLookupComboBox
          Left = 83
          Top = 60
          Width = 180
          Height = 23
          DataField = 'ZASSIGNEDTONAME'
          DataSource = dsRelease
          TabOrder = 7
        end
        object dbedtZRELEASEDATE: TDBEdit
          Left = 355
          Top = 60
          Width = 180
          Height = 23
          Color = clScrollBar
          DataField = 'ZRELEASEDATE'
          DataSource = dsRelease
          ReadOnly = True
          TabOrder = 8
        end
        object dbedtZOPENDATE: TDBEdit
          Left = 354
          Top = 87
          Width = 181
          Height = 23
          Color = clScrollBar
          DataField = 'ZOPENDATE'
          DataSource = dsRelease
          ReadOnly = True
          TabOrder = 9
        end
        object dblkcbbZOPENEDBYNAME: TDBLookupComboBox
          Left = 83
          Top = 88
          Width = 180
          Height = 23
          DataField = 'ZOPENEDBYNAME'
          DataSource = dsRelease
          TabOrder = 10
        end
        object dblkcbbZURLTYPENAME: TDBLookupComboBox
          Left = 83
          Top = 117
          Width = 180
          Height = 23
          DataField = 'ZURLTYPENAME'
          DataSource = dsRelease
          TabOrder = 11
        end
        object dbedtZURL: TDBEdit
          Left = 285
          Top = 117
          Width = 250
          Height = 23
          DataField = 'ZURL'
          DataSource = dsRelease
          TabOrder = 12
        end
        object dblkcbb6: TDBLookupComboBox
          Left = 578
          Top = 117
          Width = 147
          Height = 23
          DropDownRows = 30
          KeyField = 'ZID'
          ListField = 'ZNAME'
          ListSource = dsUser
          TabOrder = 13
          OnCloseUp = dblkcbb6CloseUp
        end
        object dbedtZMAILTO: TDBEdit
          Left = 84
          Top = 177
          Width = 451
          Height = 23
          DataField = 'ZMAILTO'
          DataSource = dsRelease
          TabOrder = 14
        end
        object dblkcbb7: TDBLookupComboBox
          Left = 580
          Top = 177
          Width = 145
          Height = 23
          DropDownRows = 30
          KeyField = 'ZID'
          ListField = 'ZNAME'
          ListSource = dsUser
          TabOrder = 15
          OnCloseUp = dblkcbb7CloseUp
        end
        object dbedtZPRODUCTURL: TDBEdit
          Left = 83
          Top = 145
          Width = 641
          Height = 23
          DataField = 'ZPRODUCTURL'
          DataSource = dsRelease
          TabOrder = 16
        end
        object dbedtZVERSION: TDBEdit
          Left = 555
          Top = 4
          Width = 167
          Height = 23
          DataField = 'ZVERSION'
          DataSource = dsRelease
          TabOrder = 17
        end
      end
      object pnlContent: TPanel
        Left = 0
        Top = 232
        Width = 854
        Height = 41
        Align = alTop
        Color = clOlive
        TabOrder = 1
        object btnSuccess: TBitBtn
          Left = 24
          Top = 8
          Width = 100
          Height = 25
          Action = act_Success
          Caption = #25105#19978#20256#23436#20102
          TabOrder = 0
        end
        object btnFalat: TBitBtn
          Left = 136
          Top = 8
          Width = 100
          Height = 25
          Action = act_Falat
          Caption = #19978#20256#22833#36133
          TabOrder = 1
        end
      end
      object dbmmoZPROCONTENT: TDBMemo
        Left = 0
        Top = 273
        Width = 854
        Height = 238
        Align = alClient
        DataField = 'ZPROCONTENT'
        DataSource = dsRelease
        ScrollBars = ssBoth
        TabOrder = 2
      end
    end
  end
  object pnlNovisible: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 65
    Align = alTop
    TabOrder = 1
    Visible = False
  end
  object actlst1: TActionList
    Left = 14
    Top = 3
    object act_AddRelease: TAction
      Category = #21015#34920
      Caption = #26032#22686#21457#24067
      OnExecute = act_AddReleaseExecute
    end
    object act_MeResult: TAction
      Category = #21015#34920
      Caption = #25105#21019#24314#30340
    end
    object act_MeUp: TAction
      Category = #21015#34920
      Caption = #25351#27966#32473#25105#30340
    end
    object act_FirstPage: TAction
      Category = #21015#34920
      Caption = #31532#19968#39029
      OnExecute = act_FirstPageExecute
      OnUpdate = act_FirstPageUpdate
    end
    object act_Proipage: TAction
      Category = #21015#34920
      Caption = #19978#19968#39029
      OnExecute = act_ProipageExecute
      OnUpdate = act_ProipageUpdate
    end
    object act_NextPage: TAction
      Category = #21015#34920
      Caption = #19979#19968#39029
      OnExecute = act_NextPageExecute
      OnUpdate = act_NextPageUpdate
    end
    object act_LastPage: TAction
      Category = #21015#34920
      Caption = #19979#19968#39029
      OnExecute = act_LastPageExecute
      OnUpdate = act_LastPageUpdate
    end
    object act_Save: TAction
      Category = #21457#24067#20869#23481
      Caption = #20445#23384
      OnExecute = act_SaveExecute
      OnUpdate = act_SaveUpdate
    end
    object act_Cancel: TAction
      Category = #21457#24067#20869#23481
      Caption = #21462#28040
      OnExecute = act_CancelExecute
      OnUpdate = act_CancelUpdate
    end
    object act_Proi: TAction
      Category = #21457#24067#20869#23481
      Caption = #19978#19968#20010
      OnExecute = act_ProiExecute
      OnUpdate = act_ProiUpdate
    end
    object act_Next: TAction
      Category = #21457#24067#20869#23481
      Caption = #19979#19968#20010
      OnExecute = act_NextExecute
      OnUpdate = act_NextUpdate
    end
    object act_Success: TAction
      Category = #21457#24067#20869#23481
      Caption = #25105#19978#20256#23436#20102
      OnExecute = act_SuccessExecute
      OnUpdate = act_SuccessUpdate
    end
    object act_Falat: TAction
      Category = #21457#24067#20869#23481
      Caption = #19978#20256#22833#36133
      OnExecute = act_FalatExecute
      OnUpdate = act_FalatUpdate
    end
    object act_PageRefresh: TAction
      Category = #21015#34920
      Caption = #21047#26032#25968#25454
      OnExecute = act_PageRefreshExecute
    end
  end
  object cdsRelease: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsReleaseBeforePost
    OnNewRecord = cdsReleaseNewRecord
    Left = 48
    Top = 2
  end
  object dsRelease: TDataSource
    DataSet = cdsRelease
    Left = 48
    Top = 32
  end
  object cdsNeedTerm: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 4
  end
  object cdsUrlType: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 122
    Top = 4
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 157
    Top = 4
  end
  object cdsProject: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 4
  end
  object cdsUser: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 231
    Top = 4
  end
  object dsUser: TDataSource
    DataSet = cdsUser
    Left = 231
    Top = 35
  end
end
