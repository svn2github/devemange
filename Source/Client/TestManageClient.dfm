inherited TestManageChildfrm: TTestManageChildfrm
  Left = 123
  Top = 168
  Width = 1139
  Height = 713
  Caption = #27979#35797#31649#29702
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object pnlOnVisible: TPanel
    Left = 0
    Top = 0
    Width = 1123
    Height = 68
    Align = alTop
    TabOrder = 0
    Visible = False
  end
  object pgcTestMain: TPageControl
    Left = 0
    Top = 68
    Width = 1123
    Height = 607
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
        Width = 1115
        Height = 434
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
            Title.Caption = '$'#32534#21495
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
            FieldName = 'ZSUBMISBYNAME'
            Title.Alignment = taCenter
            Title.Caption = #25552#20132#20154
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZASSIGNEDTONAME'
            Title.Alignment = taCenter
            Title.Caption = #25351#27966#32473
            Width = 60
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ZLEVELNAME'
            Title.Alignment = taCenter
            Title.Caption = #31561#32423
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZTESTRESULTBYNAME'
            Title.Alignment = taCenter
            Title.Caption = #27979#35797#20154
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZSTATUSNAME'
            Title.Alignment = taCenter
            Title.Caption = #27979#35797#32467#26524
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZCLOSESTATUSNAME'
            Title.Alignment = taCenter
            Title.Caption = #35780#23457
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZPRONAME'
            Title.Alignment = taCenter
            Title.Caption = #31435#39033#39033#30446
            Width = 100
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
        Width = 1115
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object btnNewTest: TBitBtn
          Left = 3
          Top = 8
          Width = 100
          Height = 25
          Action = act_New
          Caption = #26032#24314#27979#35797
          TabOrder = 0
        end
        object btntoMe: TBitBtn
          Left = 419
          Top = 8
          Width = 100
          Height = 25
          Action = act_toMe
          Caption = #25351#27966#32473#25105#30340
          TabOrder = 1
        end
        object btnmetest: TBitBtn
          Left = 523
          Top = 8
          Width = 100
          Height = 25
          Action = act_metest
          Caption = #26159#25105#27979#35797#30340
          TabOrder = 2
        end
        object btnmebuild: TBitBtn
          Left = 315
          Top = 8
          Width = 100
          Height = 25
          Action = act_mebuild
          Caption = #25105#25552#20132#30340
          TabOrder = 3
        end
        object btnNewByBugCode: TBitBtn
          Left = 107
          Top = 8
          Width = 100
          Height = 25
          Action = act_NewByBugCode
          Caption = #29992'Bug'#24314#29992#20363
          TabOrder = 4
        end
        object btnResult_Add1: TBitBtn
          Left = 627
          Top = 8
          Width = 100
          Height = 25
          Action = actHighQuery
          Caption = #39640#32423#26597#35810'...'
          TabOrder = 5
        end
        object btnnewByPlanCode: TBitBtn
          Left = 211
          Top = 8
          Width = 100
          Height = 25
          Action = act_newByPlanCode
          Caption = #29992#20219#21153#24314#29992#20363
          TabOrder = 6
        end
      end
      object pnlTestBottom: TPanel
        Left = 0
        Top = 537
        Width = 1115
        Height = 40
        Align = alBottom
        TabOrder = 2
        object lblPage: TLabel
          Left = 645
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
        object btnAddData: TBitBtn
          Left = 536
          Top = 8
          Width = 100
          Height = 25
          Action = act_AddData
          Caption = #20840#37096#25968#25454
          TabOrder = 5
        end
      end
      object dbmmoZNAME: TDBMemo
        Left = 0
        Top = 474
        Width = 1115
        Height = 63
        Align = alBottom
        DataField = 'ZNAME'
        DataSource = dsTestItem
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 3
      end
    end
    object tsConTent: TTabSheet
      Caption = #27979#35797#20869#23481
      ImageIndex = 1
      object spl1: TSplitter
        Left = 0
        Top = 250
        Width = 1115
        Height = 10
        Cursor = crVSplit
        Align = alTop
        Beveled = True
        ResizeStyle = rsLine
      end
      object pnlTestClient: TPanel
        Left = 0
        Top = 260
        Width = 1115
        Height = 317
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object dbctrlgrd1: TDBCtrlGrid
          Left = 0
          Top = 40
          Width = 1008
          Height = 277
          Align = alClient
          AllowDelete = False
          AllowInsert = False
          ColCount = 2
          DataSource = dsResult
          PanelBorder = gbNone
          PanelHeight = 92
          PanelWidth = 495
          TabOrder = 0
          SelectedColor = clMoneyGreen
          OnPaintPanel = dbctrlgrd1PaintPanel
          object Label8: TLabel
            Left = 4
            Top = 68
            Width = 60
            Height = 15
            Anchors = [akLeft, akBottom]
            Caption = #26399#26395#20540#65306
          end
          object Label16: TLabel
            Left = 181
            Top = 69
            Width = 60
            Height = 15
            Anchors = [akLeft, akBottom]
            Caption = #23454#38469#20540#65306
          end
          object dbtxtZNO: TDBText
            Left = 469
            Top = 68
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
          object dbtxtZUSERNAME: TDBText
            Left = 419
            Top = 68
            Width = 50
            Height = 17
            Alignment = taCenter
            Anchors = [akRight, akBottom]
            Color = clYellow
            DataField = 'ZUSERNAME'
            DataSource = dsResult
            Font.Charset = GB2312_CHARSET
            Font.Color = clTeal
            Font.Height = -15
            Font.Name = #23435#20307
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
          end
          object bvl1: TBevel
            Left = 0
            Top = 0
            Width = 495
            Height = 92
            Align = alClient
            Shape = bsFrame
          end
          object dbmmoZACTION: TDBMemo
            Left = 5
            Top = 6
            Width = 483
            Height = 55
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'ZACTION'
            DataSource = dsResult
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object dbedtZTRUEVALUE: TDBEdit
            Left = 55
            Top = 64
            Width = 121
            Height = 23
            Anchors = [akLeft, akBottom]
            DataField = 'ZTRUEVALUE'
            DataSource = dsResult
            ImeName = #26497#21697#20116#31508#36755#20837#27861
            TabOrder = 1
          end
          object dbedtZINFACE: TDBEdit
            Left = 234
            Top = 65
            Width = 150
            Height = 23
            Anchors = [akLeft, akBottom]
            DataField = 'ZINFACE'
            DataSource = dsResult
            ImeName = #26497#21697#20116#31508#36755#20837#27861
            TabOrder = 2
          end
          object dbchkOK: TDBCheckBox
            Left = 387
            Top = 68
            Width = 37
            Height = 17
            Anchors = [akLeft, akBottom]
            Caption = 'OK'
            DataField = 'ZPASS'
            DataSource = dsResult
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
        object pnl1: TPanel
          Left = 0
          Top = 0
          Width = 1115
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          Color = clTeal
          TabOrder = 1
          DesignSize = (
            1115
            40)
          object bvl2: TBevel
            Left = 426
            Top = 6
            Width = 8
            Height = 32
            Shape = bsLeftLine
          end
          object btnResult_Add: TBitBtn
            Left = 6
            Top = 8
            Width = 100
            Height = 25
            Action = actResult_Add
            Caption = #22686#21152#29992#20363
            TabOrder = 0
          end
          object btnResult_Save: TBitBtn
            Left = 214
            Top = 8
            Width = 100
            Height = 25
            Action = actResult_Save
            Caption = #20445#23384#29992#20363
            TabOrder = 1
          end
          object btnSuccess: TBitBtn
            Left = 435
            Top = 8
            Width = 100
            Height = 25
            Action = act_Success
            Caption = #23436#25104#27979#35797
            TabOrder = 2
          end
          object btnAction: TBitBtn
            Left = 539
            Top = 8
            Width = 100
            Height = 25
            Action = act_Action
            Caption = #28608#27963
            TabOrder = 3
          end
          object btnColse: TBitBtn
            Left = 643
            Top = 8
            Width = 100
            Height = 25
            Action = act_Colse
            Caption = #20851#38381
            TabOrder = 4
          end
          object btnResult_AddByBug: TBitBtn
            Left = 110
            Top = 8
            Width = 100
            Height = 25
            Action = actResult_AddByBug
            Caption = 'Bug'#22238#22797#29992#20363
            TabOrder = 5
          end
          object dbnvgr1: TDBNavigator
            Left = 954
            Top = 8
            Width = 152
            Height = 25
            DataSource = dsResult
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Anchors = [akTop, akRight]
            TabOrder = 6
          end
          object btnReQuery: TBitBtn
            Left = 318
            Top = 8
            Width = 100
            Height = 25
            Action = act_Subbim
            Caption = #25552#20132#27979#35797
            TabOrder = 7
          end
        end
        object lvAttach: TListView
          Left = 1008
          Top = 40
          Width = 107
          Height = 277
          Align = alRight
          Columns = <>
          LargeImages = ilAttach
          PopupMenu = pmAttach
          TabOrder = 2
          OnDblClick = lvAttachDblClick
        end
      end
      object pnlTitle: TPanel
        Left = 0
        Top = 0
        Width = 1115
        Height = 15
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pnlTitle'
        TabOrder = 1
        object lblTitle: TLabel
          Left = 0
          Top = 0
          Width = 984
          Height = 15
          Align = alClient
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
        object dbtxtZOPENEDBYNAME: TDBText
          Left = 984
          Top = 0
          Width = 131
          Height = 15
          Align = alRight
          Alignment = taCenter
          Color = clTeal
          DataField = 'ZOPENEDBYNAME'
          DataSource = dsTestItem
          Font.Charset = GB2312_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
      end
      object pnlTop: TPanel
        Left = 0
        Top = 15
        Width = 1115
        Height = 235
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pnlTop'
        TabOrder = 2
        object spl2: TSplitter
          Left = 826
          Top = 0
          Height = 235
        end
        object scrlbx1: TScrollBox
          Left = 0
          Top = 0
          Width = 826
          Height = 235
          Align = alLeft
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object lbl6: TLabel
            Left = 8
            Top = 10
            Width = 45
            Height = 15
            Caption = #21517#31216#65306
          end
          object lbl7: TLabel
            Left = 8
            Top = 41
            Width = 75
            Height = 15
            Caption = #27979#35797#31867#22411#65306
          end
          object lbl8: TLabel
            Left = 8
            Top = 70
            Width = 60
            Height = 15
            Caption = #25351#27966#32473#65306
          end
          object lbl9: TLabel
            Left = 8
            Top = 97
            Width = 62
            Height = 15
            Caption = #30456#20851'BUG:'
          end
          object lbl10: TLabel
            Left = 8
            Top = 126
            Width = 68
            Height = 15
            Caption = #31435#39033#39033#30446':'
          end
          object lbl11: TLabel
            Left = 8
            Top = 212
            Width = 60
            Height = 15
            Caption = #27979#35797#20154#65306
          end
          object lbl12: TLabel
            Left = 8
            Top = 153
            Width = 75
            Height = 15
            Caption = #37038#20214#36890#30693#65306
          end
          object lbl5: TLabel
            Left = 524
            Top = 154
            Width = 24
            Height = 15
            Caption = '<<<'
          end
          object lbl13: TLabel
            Left = 238
            Top = 210
            Width = 75
            Height = 15
            Caption = #27979#35797#26102#38388#65306
          end
          object lbl14: TLabel
            Left = 240
            Top = 126
            Width = 68
            Height = 15
            Caption = #39033#30446#29256#26412':'
          end
          object lbl15: TLabel
            Left = 240
            Top = 97
            Width = 70
            Height = 15
            Caption = #30456#20851'TASK:'
          end
          object lbl16: TLabel
            Left = 478
            Top = 68
            Width = 75
            Height = 15
            Caption = #21019#24314#26102#38388#65306
          end
          object lbl17: TLabel
            Left = 240
            Top = 39
            Width = 75
            Height = 15
            Caption = #27979#35797#26041#27861#65306
          end
          object lbl18: TLabel
            Left = 478
            Top = 124
            Width = 62
            Height = 15
            Caption = 'SVN'#29256#26412':'
          end
          object lbl19: TLabel
            Left = 478
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
            Left = 8
            Top = 181
            Width = 45
            Height = 15
            Caption = #22791#27880#65306
          end
          object btnResult_AddSVNVer: TSpeedButton
            Left = 675
            Top = 121
            Width = 23
            Height = 23
            Action = actResult_AddSVNVer
            Caption = 'G'
          end
          object lbl3: TLabel
            Left = 240
            Top = 68
            Width = 60
            Height = 15
            Caption = #25552#20132#20154#65306
          end
          object lbl4: TLabel
            Left = 478
            Top = 97
            Width = 75
            Height = 15
            Caption = #30456#20851#38656#27714#65306
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
            ImeName = #26497#21697#20116#31508#36755#20837#27861
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
            DropDownRows = 20
            TabOrder = 2
          end
          object dbedtZCASEBUG: TDBEdit
            Left = 84
            Top = 95
            Width = 148
            Height = 23
            DataField = 'ZCASEBUG'
            DataSource = dsTestItem
            ImeName = #26497#21697#20116#31508#36755#20837#27861
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
          object dblkcbbSelectUsermail: TDBLookupComboBox
            Left = 551
            Top = 149
            Width = 150
            Height = 23
            DropDownRows = 20
            KeyField = 'ZID'
            ListField = 'ZNAME'
            ListSource = DM.dsUsers
            TabOrder = 5
            OnCloseUp = dblkcbbSelectUsermailCloseUp
          end
          object dbedtZRESULTDATE: TDBEdit
            Left = 304
            Top = 206
            Width = 161
            Height = 23
            Color = clScrollBar
            DataField = 'ZRESULTDATE'
            DataSource = dsTestItem
            ImeName = #26497#21697#20116#31508#36755#20837#27861
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
            ImeName = #26497#21697#20116#31508#36755#20837#27861
            KeyField = 'ZID'
            ListField = 'ZNAME'
            ListSource = dsmethod
            TabOrder = 7
          end
          object dbedtZOPENEDDATE: TDBEdit
            Left = 551
            Top = 65
            Width = 150
            Height = 23
            DataField = 'ZOPENEDDATE'
            DataSource = dsTestItem
            ImeName = #26497#21697#20116#31508#36755#20837#27861
            TabOrder = 8
          end
          object dbedtZCASETASK: TDBEdit
            Left = 315
            Top = 94
            Width = 150
            Height = 23
            DataField = 'ZCASETASK'
            DataSource = dsTestItem
            ImeName = #26497#21697#20116#31508#36755#20837#27861
            TabOrder = 9
          end
          object BtnGetVer1: TBitBtn
            Left = 445
            Top = 119
            Width = 19
            Height = 24
            Caption = 'G'
            TabOrder = 10
            OnClick = BtnGetVer1Click
          end
          object dbedtZPRO_SVN: TDBEdit
            Left = 551
            Top = 121
            Width = 125
            Height = 23
            DataField = 'ZPRO_SVN'
            DataSource = dsTestItem
            ImeName = #26497#21697#20116#31508#36755#20837#27861
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
            ImeName = #26497#21697#20116#31508#36755#20837#27861
            KeyField = 'ZID'
            ListField = 'ZNAME'
            ListSource = dsLevel
            TabOrder = 12
          end
          object BtnCancel1: TBitBtn
            Left = 716
            Top = 35
            Width = 100
            Height = 25
            Action = act_Cancel
            Caption = #21462#28040
            TabOrder = 13
          end
          object BtnSave1: TBitBtn
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
            ImeName = #26497#21697#20116#31508#36755#20837#27861
            KeyField = 'ZID'
            ListField = 'ZVER'
            ListSource = dsProVer
            TabOrder = 16
          end
          object BtnNext1: TBitBtn
            Left = 716
            Top = 93
            Width = 100
            Height = 25
            Action = act_Next
            Caption = #19979#19968#20010
            TabOrder = 17
          end
          object BtnProv1: TBitBtn
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
            ImeName = #26497#21697#20116#31508#36755#20837#27861
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
            ImeName = #26497#21697#20116#31508#36755#20837#27861
            ReadOnly = True
            TabOrder = 21
          end
          object BtnGetBugItem2: TBitBtn
            Left = 717
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
            ImeName = #26497#21697#20116#31508#36755#20837#27861
            TabOrder = 23
          end
          object dbedtZSUBMISBYNAME: TDBEdit
            Left = 314
            Top = 64
            Width = 150
            Height = 23
            DataField = 'ZSUBMISBYNAME'
            DataSource = dsTestItem
            ImeName = #26497#21697#20116#31508#36755#20837#27861
            TabOrder = 24
          end
          object BtnGetPlanItem1: TBitBtn
            Left = 717
            Top = 165
            Width = 100
            Height = 25
            Action = act_GetPlanItem
            Caption = #36339#21040#30456#20851#20219#21153
            TabOrder = 25
          end
          object dbedtZDEMAND_ID: TDBEdit
            Left = 551
            Top = 92
            Width = 150
            Height = 23
            DataField = 'ZDEMAND_ID'
            DataSource = dsTestItem
            TabOrder = 26
          end
          object BtngotoDemand: TBitBtn
            Left = 717
            Top = 194
            Width = 100
            Height = 25
            Action = act_gotoDemand
            Caption = #36339#21040#30456#20851#38656#27714
            TabOrder = 27
          end
        end
        object dbmmoZTESTNOTE: TDBMemo
          Left = 829
          Top = 0
          Width = 286
          Height = 235
          Align = alClient
          DataField = 'ZTESTNOTE'
          DataSource = dsTestItem
          ScrollBars = ssBoth
          TabOrder = 1
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
      Caption = #23436#25104#27979#35797
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
    object act_Subbim: TAction
      Category = #21015#34920
      Caption = #25552#20132#27979#35797
      OnExecute = act_SubbimExecute
      OnUpdate = act_SubbimUpdate
    end
    object actResult_AddSVNVer: TAction
      Category = #29992#20363
      Caption = #21462'SVN'#29256#26412#21495
      OnExecute = actResult_AddSVNVerExecute
    end
    object act_newByPlanCode: TAction
      Category = #21015#34920
      Caption = #29992#20219#21153#24314#29992#20363
      OnExecute = act_newByPlanCodeExecute
    end
    object act_GetPlanItem: TAction
      Category = #21015#34920
      Caption = #36339#21040#30456#20851#20219#21153
      OnExecute = act_GetPlanItemExecute
      OnUpdate = act_GetPlanItemUpdate
    end
    object act_AddData: TAction
      Category = #21015#34920
      Caption = #20840#37096#25968#25454
      OnExecute = act_AddDataExecute
    end
    object act_gotoDemand: TAction
      Category = #21015#34920
      Caption = #36339#21040#30456#20851#38656#27714
      OnExecute = act_gotoDemandExecute
      OnUpdate = act_gotoDemandUpdate
    end
    object actAttach_Addfile: TAction
      Caption = #19978#20256#38468#20214'...'
      OnExecute = actAttach_AddfileExecute
      OnUpdate = actAttach_AddfileUpdate
    end
    object actAttach_downfile: TAction
      Caption = #19979#36733#38468#20214'('#21452#20987')...'
      OnExecute = actAttach_downfileExecute
      OnUpdate = actAttach_downfileUpdate
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
    AfterEdit = cdsResultAfterEdit
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
  object cdsUser: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 431
    Top = 2
  end
  object ilAttach: TImageList
    Height = 32
    Width = 32
    Left = 560
    Top = 16
  end
  object dlgOpen1: TOpenDialog
    Left = 600
    Top = 16
  end
  object dlgSave1: TSaveDialog
    Left = 640
    Top = 16
  end
  object pmAttach: TPopupMenu
    AutoHotkeys = maManual
    Left = 680
    Top = 16
    object N1: TMenuItem
      Action = actAttach_Addfile
    end
    object N2: TMenuItem
      Action = actAttach_downfile
    end
  end
end
