inherited TestManageChildfrm: TTestManageChildfrm
  Left = 192
  Top = 58
  Width = 958
  Height = 689
  Caption = #27979#35797#31649#29702
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object pnlOnVisible: TPanel
    Left = 0
    Top = 0
    Width = 950
    Height = 68
    Align = alTop
    TabOrder = 0
    Visible = False
  end
  object pgcTestMain: TPageControl
    Left = 0
    Top = 68
    Width = 950
    Height = 587
    ActivePage = tsList
    Align = alClient
    TabOrder = 1
    OnChange = pgcTestMainChange
    OnChanging = pgcTestMainChanging
    object tsList: TTabSheet
      Caption = #27979#35797#21015#34920
      object dbgrdTest: TDBGrid
        Left = 0
        Top = 40
        Width = 942
        Height = 477
        Align = alClient
        DataSource = dsTestItem
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDrawColumnCell = dbgrdTestDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'ZID'
            Title.Alignment = taCenter
            Title.Caption = #32534#21495
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZNAME'
            Title.Alignment = taCenter
            Title.Caption = #21517#31216
            Width = 350
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
            Alignment = taCenter
            Expanded = False
            FieldName = 'ZLEVELNAME'
            Title.Alignment = taCenter
            Title.Caption = #31561#32423
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZTESTRESULTBYNAME'
            Title.Alignment = taCenter
            Title.Caption = #27979#35797#20154
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZSTATUSNAME'
            Title.Alignment = taCenter
            Title.Caption = #27979#35797#32467#26524
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZCLOSESTATUSNAME'
            Title.Alignment = taCenter
            Title.Caption = #35780#23457
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZOPENEDDATE'
            Title.Alignment = taCenter
            Title.Caption = #21019#24314#26102#38388
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZRESULTDATE'
            Title.Alignment = taCenter
            Title.Caption = #23436#25104#26102#38388
            Width = 150
            Visible = True
          end>
      end
      object pnlTestTool: TPanel
        Left = 0
        Top = 0
        Width = 942
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object btnNewTest: TBitBtn
          Left = 3
          Top = 9
          Width = 100
          Height = 25
          Action = act_New
          Caption = #26032#24314#27979#35797
          TabOrder = 0
        end
        object btntoMe: TBitBtn
          Left = 315
          Top = 9
          Width = 100
          Height = 25
          Action = act_toMe
          Caption = #25351#27966#32473#25105#30340
          TabOrder = 1
        end
        object btnmetest: TBitBtn
          Left = 419
          Top = 9
          Width = 100
          Height = 25
          Action = act_metest
          Caption = #26159#25105#27979#35797#30340
          TabOrder = 2
        end
        object btnmebuild: TBitBtn
          Left = 211
          Top = 9
          Width = 100
          Height = 25
          Action = act_mebuild
          Caption = #25105#21019#24314#30340
          TabOrder = 3
        end
        object btnNewByBugCode: TBitBtn
          Left = 107
          Top = 9
          Width = 100
          Height = 25
          Action = act_NewByBugCode
          Caption = #29992'Bug'#24314#29992#20363
          TabOrder = 4
        end
        object btnResult_Add1: TBitBtn
          Left = 523
          Top = 8
          Width = 100
          Height = 25
          Action = actHighQuery
          Caption = #39640#32423#26597#35810'...'
          TabOrder = 5
        end
      end
      object pnlTestBottom: TPanel
        Left = 0
        Top = 517
        Width = 942
        Height = 40
        Align = alBottom
        TabOrder = 2
        object lblPage: TLabel
          Left = 552
          Top = 13
          Width = 56
          Height = 15
          Caption = 'lblPage'
        end
        object btnFirstPage: TBitBtn
          Left = 16
          Top = 8
          Width = 100
          Height = 25
          Action = act_FirstPage
          Caption = #31532#19968#39029
          TabOrder = 0
        end
        object btnProvPage: TBitBtn
          Left = 120
          Top = 8
          Width = 100
          Height = 25
          Action = act_ProvPage
          Caption = #19978#19968#39029
          TabOrder = 1
        end
        object btnNextPage: TBitBtn
          Left = 224
          Top = 8
          Width = 100
          Height = 25
          Action = act_NextPage
          Caption = #19979#19968#39029
          TabOrder = 2
        end
        object btnLastPage: TBitBtn
          Left = 328
          Top = 8
          Width = 100
          Height = 25
          Action = act_LastPage
          Caption = #26368#21518#19968#39029
          TabOrder = 3
        end
        object btnRefreshData: TBitBtn
          Left = 432
          Top = 8
          Width = 100
          Height = 25
          Action = act_RefreshData
          Caption = #21047#26032#25968#25454
          TabOrder = 4
        end
      end
    end
    object tsConTent: TTabSheet
      Caption = #27979#35797#20869#23481
      ImageIndex = 1
      object lblTitle: TLabel
        Left = 0
        Top = 0
        Width = 942
        Height = 15
        Align = alTop
        Caption = 'lblTitle'
        Color = clTeal
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object spl1: TSplitter
        Left = 0
        Top = 251
        Width = 942
        Height = 10
        Cursor = crVSplit
        Align = alTop
        Beveled = True
        ResizeStyle = rsLine
      end
      object pnlTestClient: TPanel
        Left = 0
        Top = 261
        Width = 942
        Height = 296
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object dbctrlgrd1: TDBCtrlGrid
          Left = 0
          Top = 40
          Width = 942
          Height = 256
          Align = alClient
          AllowDelete = False
          AllowInsert = False
          ColCount = 2
          DataSource = dsResult
          PanelBorder = gbNone
          PanelHeight = 85
          PanelWidth = 462
          TabOrder = 0
          SelectedColor = clMoneyGreen
          object Label8: TLabel
            Left = 5
            Top = 61
            Width = 60
            Height = 15
            Anchors = [akLeft, akBottom]
            Caption = #26399#26395#20540#65306
          end
          object Label16: TLabel
            Left = 218
            Top = 62
            Width = 60
            Height = 15
            Anchors = [akLeft, akBottom]
            Caption = #23454#38469#20540#65306
          end
          object bvl1: TBevel
            Left = 0
            Top = 0
            Width = 462
            Height = 85
            Align = alClient
            Shape = bsFrame
          end
          object dbtxtZNO: TDBText
            Left = 436
            Top = 61
            Width = 18
            Height = 17
            Alignment = taCenter
            Anchors = [akRight, akBottom]
            Color = clTeal
            DataField = 'ZNO'
            DataSource = dsResult
            Font.Charset = GB2312_CHARSET
            Font.Color = clYellow
            Font.Height = -15
            Font.Name = #23435#20307
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object dbmmoZACTION: TDBMemo
            Left = 5
            Top = 5
            Width = 450
            Height = 48
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'ZACTION'
            DataSource = dsResult
            TabOrder = 0
          end
          object dbedtZTRUEVALUE: TDBEdit
            Left = 61
            Top = 57
            Width = 150
            Height = 23
            Anchors = [akLeft, akBottom]
            DataField = 'ZTRUEVALUE'
            DataSource = dsResult
            TabOrder = 1
          end
          object dbedtZINFACE: TDBEdit
            Left = 273
            Top = 58
            Width = 150
            Height = 23
            Anchors = [akLeft, akBottom]
            DataField = 'ZINFACE'
            DataSource = dsResult
            TabOrder = 2
          end
        end
        object pnl1: TPanel
          Left = 0
          Top = 0
          Width = 942
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          Color = clTeal
          TabOrder = 1
          DesignSize = (
            942
            40)
          object bvl2: TBevel
            Left = 328
            Top = 6
            Width = 8
            Height = 32
            Shape = bsLeftLine
          end
          object btnResult_Add: TBitBtn
            Left = 11
            Top = 8
            Width = 100
            Height = 25
            Action = actResult_Add
            Caption = #22686#21152#29992#20363
            TabOrder = 0
          end
          object btnResult_Save: TBitBtn
            Left = 219
            Top = 8
            Width = 100
            Height = 25
            Action = actResult_Save
            Caption = #20445#23384#29992#20363
            TabOrder = 1
          end
          object btnSuccess: TBitBtn
            Left = 342
            Top = 8
            Width = 100
            Height = 25
            Action = act_Success
            Caption = #25105#23436#25104#20102
            TabOrder = 2
          end
          object btnAction: TBitBtn
            Left = 446
            Top = 8
            Width = 100
            Height = 25
            Action = act_Action
            Caption = #28608#27963
            TabOrder = 3
          end
          object btnColse: TBitBtn
            Left = 550
            Top = 8
            Width = 100
            Height = 25
            Action = act_Colse
            Caption = #20851#38381
            TabOrder = 4
          end
          object btnResult_AddByBug: TBitBtn
            Left = 115
            Top = 8
            Width = 100
            Height = 25
            Action = actResult_AddByBug
            Caption = 'Bug'#22238#22797#29992#20363
            TabOrder = 5
          end
          object dbnvgr1: TDBNavigator
            Left = 781
            Top = 8
            Width = 152
            Height = 25
            DataSource = dsResult
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Anchors = [akTop, akRight]
            TabOrder = 6
          end
        end
      end
      object scrlbx1: TScrollBox
        Left = 0
        Top = 15
        Width = 942
        Height = 236
        Align = alTop
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object Label2: TLabel
          Left = 8
          Top = 10
          Width = 45
          Height = 15
          Caption = #21517#31216#65306
        end
        object Label4: TLabel
          Left = 8
          Top = 41
          Width = 75
          Height = 15
          Caption = #27979#35797#31867#22411#65306
        end
        object Label5: TLabel
          Left = 8
          Top = 70
          Width = 60
          Height = 15
          Caption = #25351#27966#32473#65306
        end
        object Label10: TLabel
          Left = 8
          Top = 96
          Width = 62
          Height = 15
          Caption = #30456#20851'BUG:'
        end
        object Label12: TLabel
          Left = 8
          Top = 126
          Width = 68
          Height = 15
          Caption = #31435#39033#39033#30446':'
        end
        object Label6: TLabel
          Left = 11
          Top = 212
          Width = 60
          Height = 15
          Caption = #27979#35797#20154#65306
        end
        object Label1: TLabel
          Left = 8
          Top = 153
          Width = 75
          Height = 15
          Caption = #37038#20214#36890#30693#65306
        end
        object Label19: TLabel
          Left = 524
          Top = 154
          Width = 24
          Height = 15
          Caption = '<<<'
        end
        object Label7: TLabel
          Left = 238
          Top = 210
          Width = 75
          Height = 15
          Caption = #27979#35797#26102#38388#65306
        end
        object Label13: TLabel
          Left = 240
          Top = 126
          Width = 68
          Height = 15
          Caption = #39033#30446#29256#26412':'
        end
        object Label11: TLabel
          Left = 240
          Top = 98
          Width = 70
          Height = 15
          Caption = #30456#20851'TASK:'
        end
        object Label15: TLabel
          Left = 240
          Top = 70
          Width = 75
          Height = 15
          Caption = #21019#24314#26102#38388#65306
        end
        object Label9: TLabel
          Left = 240
          Top = 39
          Width = 75
          Height = 15
          Caption = #27979#35797#26041#27861#65306
        end
        object Label14: TLabel
          Left = 479
          Top = 124
          Width = 62
          Height = 15
          Caption = 'SVN'#29256#26412':'
        end
        object Label3: TLabel
          Left = 479
          Top = 41
          Width = 60
          Height = 15
          Caption = #20248#20808#32423#65306
        end
        object lbl1: TLabel
          Left = 472
          Top = 211
          Width = 68
          Height = 15
          Caption = #27979#35797#32467#26524':'
        end
        object lbl2: TLabel
          Left = 11
          Top = 181
          Width = 45
          Height = 15
          Caption = #22791#27880#65306
        end
        object dbedtZNAME: TDBEdit
          Left = 84
          Top = 6
          Width = 618
          Height = 23
          DataField = 'ZNAME'
          DataSource = dsTestItem
          TabOrder = 0
        end
        object dblkcbbZTYPE: TDBLookupComboBox
          Left = 84
          Top = 36
          Width = 150
          Height = 23
          DataField = 'ZTYPE'
          DataSource = dsTestItem
          KeyField = 'ZID'
          ListField = 'ZNAME'
          ListSource = dsTestType
          TabOrder = 1
        end
        object dblkcbbZASSIGNEDTO: TDBLookupComboBox
          Left = 84
          Top = 66
          Width = 150
          Height = 23
          DataField = 'ZASSIGNEDTONAME'
          DataSource = dsTestItem
          DropDownRows = 30
          TabOrder = 2
        end
        object dbedtZCASEBUG: TDBEdit
          Left = 84
          Top = 95
          Width = 148
          Height = 23
          DataField = 'ZCASEBUG'
          DataSource = dsTestItem
          TabOrder = 3
        end
        object dbedtZMAILTO: TDBEdit
          Left = 84
          Top = 151
          Width = 432
          Height = 23
          DataField = 'ZMAILTO'
          DataSource = dsTestItem
          TabOrder = 4
        end
        object dblcSelectUsermail: TDBLookupComboBox
          Left = 551
          Top = 149
          Width = 150
          Height = 23
          DropDownRows = 50
          KeyField = 'ZID'
          ListField = 'ZNAME'
          ListSource = DM.dsUsers
          TabOrder = 5
          OnCloseUp = dblcSelectUsermailCloseUp
        end
        object dbedtZRESULTDATE: TDBEdit
          Left = 304
          Top = 206
          Width = 161
          Height = 23
          Color = clScrollBar
          DataField = 'ZRESULTDATE'
          DataSource = dsTestItem
          ReadOnly = True
          TabOrder = 6
        end
        object dblkcbbZTESTMETHOD: TDBLookupComboBox
          Left = 314
          Top = 35
          Width = 150
          Height = 23
          DataField = 'ZTESTMETHOD'
          DataSource = dsTestItem
          KeyField = 'ZID'
          ListField = 'ZNAME'
          ListSource = dsmethod
          TabOrder = 7
        end
        object dbedtZOPENEDDATE: TDBEdit
          Left = 315
          Top = 65
          Width = 150
          Height = 23
          DataField = 'ZOPENEDDATE'
          DataSource = dsTestItem
          TabOrder = 8
        end
        object dbedtZCASETASK: TDBEdit
          Left = 315
          Top = 94
          Width = 150
          Height = 23
          DataField = 'ZCASETASK'
          DataSource = dsTestItem
          TabOrder = 9
        end
        object btnGetVer: TBitBtn
          Left = 445
          Top = 119
          Width = 19
          Height = 24
          Caption = 'G'
          TabOrder = 10
          OnClick = btnGetVerClick
        end
        object dbedtZPRO_SVN: TDBEdit
          Left = 551
          Top = 121
          Width = 150
          Height = 23
          DataField = 'ZPRO_SVN'
          DataSource = dsTestItem
          TabOrder = 11
        end
        object dblkcbbZLEVEL: TDBLookupComboBox
          Left = 551
          Top = 36
          Width = 150
          Height = 23
          Hint = #19968#32423#20026#39532#19978#35201#27979#23436#30340#65292#24182#24456#37325#35201#12290#21521#19979#31867#25512#12290
          DataField = 'ZLEVEL'
          DataSource = dsTestItem
          KeyField = 'ZID'
          ListField = 'ZNAME'
          ListSource = dsLevel
          TabOrder = 12
        end
        object btnCancel: TBitBtn
          Left = 716
          Top = 35
          Width = 100
          Height = 25
          Action = act_Cancel
          Caption = #21462#28040
          TabOrder = 13
        end
        object btnSave: TBitBtn
          Left = 716
          Top = 6
          Width = 100
          Height = 25
          Action = act_Save
          Caption = #20445#23384
          TabOrder = 14
        end
        object dblkcbbZPRO_ID: TDBLookupComboBox
          Left = 85
          Top = 121
          Width = 150
          Height = 23
          DataField = 'ZPRO_ID'
          DataSource = dsTestItem
          DropDownRows = 30
          KeyField = 'ZID'
          ListField = 'ZNAME'
          ListSource = dsProject
          TabOrder = 15
        end
        object dblkcbbZPRO_VER: TDBLookupComboBox
          Left = 316
          Top = 121
          Width = 127
          Height = 23
          Hint = #22914#27809#26377#20869#23481#65292#21017#28857'[G]'#12290
          DataField = 'ZPRO_VER'
          DataSource = dsTestItem
          KeyField = 'ZID'
          ListField = 'ZVER'
          ListSource = dsProVer
          TabOrder = 16
        end
        object btnNext: TBitBtn
          Left = 716
          Top = 93
          Width = 100
          Height = 25
          Action = act_Next
          Caption = #19979#19968#20010
          TabOrder = 17
        end
        object btnProv: TBitBtn
          Left = 716
          Top = 64
          Width = 100
          Height = 25
          Action = act_Prov
          Caption = #19978#19968#20010
          TabOrder = 18
        end
        object dbedtZSTATUSNAME: TDBEdit
          Left = 541
          Top = 206
          Width = 110
          Height = 23
          Color = clScrollBar
          DataField = 'ZSTATUSNAME'
          DataSource = dsTestItem
          ReadOnly = True
          TabOrder = 19
        end
        object dbedtZREMORK: TDBEdit
          Left = 85
          Top = 179
          Width = 617
          Height = 23
          DataField = 'ZREMORK'
          DataSource = dsTestItem
          TabOrder = 20
        end
        object dbedtdbgrdTest: TDBEdit
          Left = 85
          Top = 206
          Width = 150
          Height = 23
          Color = clScrollBar
          DataField = 'ZTESTRESULTBYNAME'
          DataSource = dsTestItem
          ReadOnly = True
          TabOrder = 21
        end
        object btnGetBugItem: TBitBtn
          Left = 716
          Top = 136
          Width = 100
          Height = 25
          Action = act_GetBugItem
          Caption = #36339#21040#30456#20851'BUG'
          TabOrder = 22
        end
        object dbedtZCLOSESTATUSNAME: TDBEdit
          Left = 657
          Top = 206
          Width = 44
          Height = 23
          Color = clScrollBar
          DataField = 'ZCLOSESTATUSNAME'
          DataSource = dsTestItem
          TabOrder = 23
        end
      end
    end
  end
  object cdsTestItem: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsTestItemBeforePost
    AfterScroll = cdsTestItemAfterScroll
    OnNewRecord = cdsTestItemNewRecord
    Left = 22
    Top = 3
  end
  object dsTestItem: TDataSource
    DataSet = cdsTestItem
    Left = 22
    Top = 34
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 4
  end
  object ActionList1: TActionList
    Left = 392
    Top = 4
    object act_New: TAction
      Category = #21015#34920
      Caption = #26032#24314#27979#35797
      OnExecute = act_NewExecute
    end
    object act_Save: TAction
      Category = #21015#34920
      Caption = #20445#23384
      OnExecute = act_SaveExecute
      OnUpdate = act_SaveUpdate
    end
    object act_Cancel: TAction
      Category = #21015#34920
      Caption = #21462#28040
      OnExecute = act_CancelExecute
      OnUpdate = act_CancelUpdate
    end
    object act_Next: TAction
      Category = #21015#34920
      Caption = #19979#19968#20010
      OnExecute = act_NextExecute
      OnUpdate = act_NextUpdate
    end
    object act_Prov: TAction
      Category = #21015#34920
      Caption = #19978#19968#20010
      OnExecute = act_ProvExecute
      OnUpdate = act_ProvUpdate
    end
    object actResult_Add: TAction
      Category = #29992#20363
      Caption = #22686#21152#29992#20363
      OnExecute = actResult_AddExecute
      OnUpdate = actResult_AddUpdate
    end
    object actResult_Save: TAction
      Category = #29992#20363
      Caption = #20445#23384#29992#20363
      OnExecute = actResult_SaveExecute
      OnUpdate = actResult_SaveUpdate
    end
    object act_Success: TAction
      Category = #21015#34920
      Caption = #25105#23436#25104#20102
      OnExecute = act_SuccessExecute
      OnUpdate = act_SuccessUpdate
    end
    object act_Action: TAction
      Category = #21015#34920
      Caption = #28608#27963
      OnExecute = act_ActionExecute
      OnUpdate = act_ActionUpdate
    end
    object act_Colse: TAction
      Category = #21015#34920
      Caption = #20851#38381
      OnExecute = act_ColseExecute
      OnUpdate = act_ColseUpdate
    end
    object act_FirstPage: TAction
      Category = #21015#34920
      Caption = #31532#19968#39029
      OnExecute = act_FirstPageExecute
      OnUpdate = act_FirstPageUpdate
    end
    object act_NextPage: TAction
      Category = #21015#34920
      Caption = #19979#19968#39029
      OnExecute = act_NextPageExecute
      OnUpdate = act_NextPageUpdate
    end
    object act_ProvPage: TAction
      Category = #21015#34920
      Caption = #19978#19968#39029
      OnExecute = act_ProvPageExecute
      OnUpdate = act_ProvPageUpdate
    end
    object act_LastPage: TAction
      Category = #21015#34920
      Caption = #26368#21518#19968#39029
      OnExecute = act_LastPageExecute
      OnUpdate = act_LastPageUpdate
    end
    object act_toMe: TAction
      Category = #21015#34920
      Caption = #25351#27966#32473#25105#30340
      OnExecute = act_toMeExecute
    end
    object act_metest: TAction
      Category = #21015#34920
      Caption = #26159#25105#27979#35797#30340
      OnExecute = act_metestExecute
    end
    object act_mebuild: TAction
      Category = #21015#34920
      Caption = #25105#21019#24314#30340
      OnExecute = act_mebuildExecute
    end
    object act_NewByBugCode: TAction
      Category = #21015#34920
      Caption = #29992'Bug'#24314#29992#20363
      OnExecute = act_NewByBugCodeExecute
    end
    object actResult_AddByBug: TAction
      Category = #29992#20363
      Caption = 'Bug'#22238#22797#29992#20363
      OnExecute = actResult_AddByBugExecute
      OnUpdate = actResult_AddByBugUpdate
    end
    object act_GetBugItem: TAction
      Category = #21015#34920
      Caption = #36339#21040#30456#20851'BUG'
      OnExecute = act_GetBugItemExecute
      OnUpdate = act_GetBugItemUpdate
    end
    object act_RefreshData: TAction
      Category = #21015#34920
      Caption = #21047#26032#25968#25454
      OnExecute = act_RefreshDataExecute
    end
    object actHighQuery: TAction
      Category = #21015#34920
      Caption = #39640#32423#26597#35810'...'
      OnExecute = actHighQueryExecute
    end
  end
  object cdsProject: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsProjectAfterScroll
    Left = 64
    Top = 2
  end
  object dsProject: TDataSource
    DataSet = cdsProject
    Left = 64
    Top = 32
  end
  object cdsProVer: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 2
  end
  object dsProVer: TDataSource
    DataSet = cdsProVer
    Left = 96
    Top = 32
  end
  object cdsLevel: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 2
  end
  object dsLevel: TDataSource
    DataSet = cdsLevel
    Left = 136
    Top = 32
  end
  object cdsTesttype: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 169
    Top = 1
  end
  object dsTestType: TDataSource
    DataSet = cdsTesttype
    Left = 169
    Top = 32
  end
  object cdsmethod: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 202
    Top = 1
  end
  object dsmethod: TDataSource
    DataSet = cdsmethod
    Left = 202
    Top = 33
  end
  object cdsTestSTATUS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 238
    Top = 2
  end
  object dsTestSTATUS: TDataSource
    DataSet = cdsTestSTATUS
    Left = 238
    Top = 34
  end
  object cdsResult: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsResultBeforePost
    OnNewRecord = cdsResultNewRecord
    Left = 276
    Top = 3
  end
  object dsResult: TDataSource
    DataSet = cdsResult
    Left = 276
    Top = 35
  end
  object cdsTestCoseSTATUS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 311
    Top = 3
  end
  object dsTestCoseSTATUS: TDataSource
    DataSet = cdsTestCoseSTATUS
    Left = 313
    Top = 34
  end
end
