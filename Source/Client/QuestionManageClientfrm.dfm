inherited QuestionManageClientDlg: TQuestionManageClientDlg
  Left = 259
  Top = 208
  Width = 1004
  Height = 679
  Caption = #31561#32423#39064#24211
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object pgcQuestion: TPageControl
    Left = 0
    Top = 81
    Width = 988
    Height = 560
    ActivePage = tsQuestionClass
    Align = alClient
    TabOrder = 0
    OnChange = pgcQuestionChange
    OnChanging = pgcQuestionChanging
    object tsQuestionClass: TTabSheet
      Caption = #39064#30446#24211#20998#31867
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 980
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnReLoadClass: TBitBtn
          Left = 217
          Top = 8
          Width = 100
          Height = 25
          Action = act_ReLoadClass
          Caption = #21047#26032#25968#25454
          TabOrder = 0
        end
        object btnClass_Add: TBitBtn
          Left = 9
          Top = 8
          Width = 100
          Height = 25
          Action = act_Class_Add
          Caption = #22686#21152#20998#31867
          TabOrder = 1
        end
        object btnClass_Save: TBitBtn
          Left = 113
          Top = 8
          Width = 100
          Height = 25
          Action = act_Class_Save
          Caption = #20445#23384#20998#31867
          TabOrder = 2
        end
        object chkEditor: TCheckBox
          Left = 339
          Top = 13
          Width = 57
          Height = 17
          Caption = #32534#36753
          TabOrder = 3
          OnClick = chkEditorClick
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 489
        Width = 980
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object lblQuestionCount: TLabel
          Left = 19
          Top = 12
          Width = 86
          Height = 19
          Caption = #24635#39064#30446#25968':'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
      end
      object dbgrdQuestionClass: TDBGrid
        Left = 0
        Top = 41
        Width = 980
        Height = 383
        Align = alClient
        DataSource = dsQuestionClass
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDrawColumnCell = dbgrdQuestionClassDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'ZINDEX'
            ReadOnly = True
            Title.Caption = #24207#21495
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZCODE'
            Title.Caption = #39064#24211#21495
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZTITLE'
            Title.Caption = #33021#21147#35201#27714
            Width = 221
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZNOTE'
            Title.Caption = #31077#32454#25551#36848
            Width = 430
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZSORT'
            Title.Caption = #25490#24207#21495
            Visible = True
          end>
      end
      object dbmmoZNOTE: TDBMemo
        Left = 0
        Top = 424
        Width = 980
        Height = 65
        Align = alBottom
        DataField = 'ZNOTE'
        DataSource = dsQuestionClass
        ScrollBars = ssVertical
        TabOrder = 3
      end
    end
    object tsQuest: TTabSheet
      Caption = #39064#30446#20869#23481
      ImageIndex = 1
      object spl1: TSplitter
        Left = 265
        Top = 0
        Height = 489
      end
      object dbgrdQuestion: TDBGrid
        Left = 0
        Top = 0
        Width = 265
        Height = 489
        Align = alLeft
        DataSource = dsQuestion
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDrawColumnCell = dbgrdQuestionDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'ZINDEX'
            Title.Caption = #24207#21495
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZQCODE'
            Title.Caption = #39064#30446#21495
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZQTITLE'
            Title.Caption = #39064#30446
            Width = 259
            Visible = True
          end>
      end
      object pnl4: TPanel
        Left = 0
        Top = 489
        Width = 980
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object lblPage: TLabel
          Left = 560
          Top = 16
          Width = 56
          Height = 15
          Caption = 'lblPage'
        end
        object btnQuestion_firstpage: TBitBtn
          Left = 16
          Top = 10
          Width = 100
          Height = 25
          Action = act_Question_firstpage
          Caption = #31532#19968#39029
          TabOrder = 0
        end
        object btnQuestion_NextPage: TBitBtn
          Left = 120
          Top = 10
          Width = 100
          Height = 25
          Action = act_Question_NextPage
          Caption = #19979#19968#39029
          TabOrder = 1
        end
        object btnQuestion_ProvPage: TBitBtn
          Left = 224
          Top = 10
          Width = 100
          Height = 25
          Action = act_Question_ProvPage
          Caption = #19978#19968#39029
          TabOrder = 2
        end
        object btnQuestion_LastPage: TBitBtn
          Left = 328
          Top = 10
          Width = 100
          Height = 25
          Action = act_Question_LastPage
          Caption = #26368#21518#19968#39029
          TabOrder = 3
        end
        object btnQuestion_ReLoad: TBitBtn
          Left = 432
          Top = 10
          Width = 100
          Height = 25
          Action = act_Question_ReLoad
          Caption = #21047#26032#25968#25454
          TabOrder = 4
        end
      end
      object pnl5: TPanel
        Left = 268
        Top = 0
        Width = 712
        Height = 489
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object lb1: TLabel
          Left = 22
          Top = 56
          Width = 45
          Height = 15
          Caption = #39064#30446#65306
        end
        object lbl1: TLabel
          Left = 23
          Top = 88
          Width = 75
          Height = 15
          Caption = #39064#30446#20869#23481#65306
        end
        object lbl2: TLabel
          Left = 24
          Top = 376
          Width = 45
          Height = 15
          Caption = #31572#26696#65306
        end
        object dbtxtZDATETIME: TDBText
          Left = 191
          Top = 586
          Width = 241
          Height = 17
          DataField = 'ZDATETIME'
          DataSource = dsQuestion
        end
        object lbl3: TLabel
          Left = 104
          Top = 88
          Width = 331
          Height = 15
          Caption = #27880#24847#19981#35201#26377#21333#24341#21495','#35831#29992#21452#24341#29992','#21542#21017#20445#23384#19981#25104#21151#12290
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 104
          Top = 376
          Width = 331
          Height = 15
          Caption = #27880#24847#19981#35201#26377#21333#24341#21495','#35831#29992#21452#24341#29992','#21542#21017#20445#23384#19981#25104#21151#12290
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object pnl6: TPanel
          Left = 0
          Top = 0
          Width = 712
          Height = 41
          Align = alTop
          Color = clGray
          TabOrder = 0
          object btnQuestoin_Add: TBitBtn
            Left = 17
            Top = 8
            Width = 100
            Height = 25
            Action = act_Questoin_Add
            Caption = #22686#21152#39064#30446
            TabOrder = 0
          end
          object btnQuestion_Save: TBitBtn
            Left = 121
            Top = 8
            Width = 100
            Height = 25
            Action = act_Question_Save
            Caption = #20445#23384#39064#30446
            TabOrder = 1
          end
          object btnQuestion_Cancel: TBitBtn
            Left = 225
            Top = 8
            Width = 100
            Height = 25
            Action = act_Question_Cancel
            Caption = #21462#28040#20462#25913
            TabOrder = 2
          end
          object chkEditQustion: TCheckBox
            Left = 349
            Top = 14
            Width = 97
            Height = 17
            Caption = #32534#36753
            TabOrder = 3
            OnClick = chkEditQustionClick
          end
        end
        object dbedtZQTITLE: TDBEdit
          Left = 69
          Top = 51
          Width = 520
          Height = 23
          DataField = 'ZQTITLE'
          DataSource = dsQuestion
          ReadOnly = True
          TabOrder = 1
        end
        object dbmmoZQCENTENT: TDBMemo
          Left = 22
          Top = 109
          Width = 561
          Height = 257
          DataField = 'ZQCENTENT'
          DataSource = dsQuestion
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 2
        end
        object dbmmoZANSWER: TDBMemo
          Left = 24
          Top = 397
          Width = 556
          Height = 169
          DataField = 'ZANSWER'
          DataSource = dsQuestion
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 3
        end
        object dblkcbbZNAME: TDBLookupComboBox
          Left = 24
          Top = 582
          Width = 145
          Height = 23
          DataField = 'ZNAME'
          DataSource = dsQuestion
          ReadOnly = True
          TabOrder = 4
        end
        object dbchkZSORT: TDBCheckBox
          Left = 472
          Top = 584
          Width = 97
          Height = 17
          Caption = #19981#20877#20351#29992
          DataField = 'ZSTOP'
          DataSource = dsQuestion
          Font.Charset = GB2312_CHARSET
          Font.Color = clRed
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
    end
    object ts1: TTabSheet
      Caption = #33021#21147#31561#32423#39064#30446
      ImageIndex = 2
      object spl2: TSplitter
        Left = 353
        Top = 0
        Height = 489
      end
      object pnl7: TPanel
        Left = 0
        Top = 489
        Width = 980
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object btnDeveLeve_ReLoad: TBitBtn
          Left = 13
          Top = 8
          Width = 100
          Height = 25
          Action = act_DeveLeve_ReLoad
          Caption = #21047#26032#25968#25454
          TabOrder = 0
        end
        object btnDeveLeve_Build: TBitBtn
          Left = 117
          Top = 8
          Width = 284
          Height = 25
          Action = act_DeveLeve_Build
          Caption = #29983#25104#35797#21367
          TabOrder = 1
        end
      end
      object dbgrdLeve: TDBGrid
        Left = 0
        Top = 0
        Width = 353
        Height = 489
        Align = alLeft
        DataSource = dsDeveLeve
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDrawColumnCell = dbgrdLeveDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'ZINDEX'
            Title.Caption = #24207#21495
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZDEVENAME'
            Title.Caption = #33021#21147#31561#32423
            Width = 176
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZSORT'
            Title.Caption = #25490#24207#21495
            Visible = True
          end>
      end
      object pnl8: TPanel
        Left = 356
        Top = 0
        Width = 624
        Height = 489
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object lbl8: TLabel
          Left = 10
          Top = 72
          Width = 75
          Height = 15
          Caption = #33021#21147#31561#32423#65306
        end
        object lbl9: TLabel
          Left = 330
          Top = 72
          Width = 60
          Height = 15
          Caption = #25490#24207#21495#65306
        end
        object grp1: TGroupBox
          Left = 8
          Top = 117
          Width = 577
          Height = 57
          Caption = #39064#30446#24211'1'
          TabOrder = 0
          object lbl5: TLabel
            Left = 13
            Top = 28
            Width = 60
            Height = 15
            Caption = #39064#24211#21495#65306
          end
          object lbl6: TLabel
            Left = 333
            Top = 28
            Width = 38
            Height = 15
            Caption = #39064#25968':'
          end
          object lbl7: TLabel
            Left = 441
            Top = 27
            Width = 68
            Height = 15
            Caption = #27599#39064#24471#20998':'
          end
          object dblkcbbZQUCLASS_CODE_NAME_1: TDBLookupComboBox
            Left = 76
            Top = 24
            Width = 250
            Height = 23
            DataField = 'ZQUCLASS_CODE_NAME_1'
            DataSource = dsDeveLeve
            DropDownRows = 20
            TabOrder = 0
          end
          object dbedtZQUCLASS_NUM_1: TDBEdit
            Left = 377
            Top = 24
            Width = 61
            Height = 23
            DataField = 'ZQUCLASS_NUM_1'
            DataSource = dsDeveLeve
            TabOrder = 1
          end
          object dbedtZQUCLASS_SCORE_1: TDBEdit
            Left = 511
            Top = 24
            Width = 56
            Height = 23
            DataField = 'ZQUCLASS_SCORE_1'
            DataSource = dsDeveLeve
            TabOrder = 2
          end
        end
        object grp2: TGroupBox
          Left = 8
          Top = 178
          Width = 577
          Height = 57
          Caption = #39064#30446#24211'2'
          TabOrder = 1
          object lbl10: TLabel
            Left = 13
            Top = 28
            Width = 60
            Height = 15
            Caption = #39064#24211#21495#65306
          end
          object lbl11: TLabel
            Left = 333
            Top = 28
            Width = 38
            Height = 15
            Caption = #39064#25968':'
          end
          object lbl12: TLabel
            Left = 441
            Top = 27
            Width = 68
            Height = 15
            Caption = #27599#39064#24471#20998':'
          end
          object dblkcbbZQUCLASS_CODE_NAME_2: TDBLookupComboBox
            Left = 76
            Top = 24
            Width = 250
            Height = 23
            DataField = 'ZQUCLASS_CODE_NAME_2'
            DataSource = dsDeveLeve
            DropDownRows = 20
            TabOrder = 0
          end
          object dbedtZQUCLASS_NUM_2: TDBEdit
            Left = 377
            Top = 24
            Width = 61
            Height = 23
            DataField = 'ZQUCLASS_NUM_2'
            DataSource = dsDeveLeve
            TabOrder = 1
          end
          object dbedtZQUCLASS_SCORE_2: TDBEdit
            Left = 511
            Top = 24
            Width = 56
            Height = 23
            DataField = 'ZQUCLASS_SCORE_2'
            DataSource = dsDeveLeve
            TabOrder = 2
          end
        end
        object grp3: TGroupBox
          Left = 8
          Top = 239
          Width = 577
          Height = 57
          Caption = #39064#30446#24211'3'
          TabOrder = 2
          object Label1: TLabel
            Left = 13
            Top = 28
            Width = 60
            Height = 15
            Caption = #39064#24211#21495#65306
          end
          object Label2: TLabel
            Left = 333
            Top = 28
            Width = 38
            Height = 15
            Caption = #39064#25968':'
          end
          object Label3: TLabel
            Left = 441
            Top = 27
            Width = 68
            Height = 15
            Caption = #27599#39064#24471#20998':'
          end
          object dblkcbbZQUCLASS_CODE_NAME_3: TDBLookupComboBox
            Left = 76
            Top = 24
            Width = 250
            Height = 23
            DataField = 'ZQUCLASS_CODE_NAME_3'
            DataSource = dsDeveLeve
            DropDownRows = 20
            TabOrder = 0
          end
          object dbedtZQUCLASS_NUM_3: TDBEdit
            Left = 377
            Top = 24
            Width = 61
            Height = 23
            DataField = 'ZQUCLASS_NUM_3'
            DataSource = dsDeveLeve
            TabOrder = 1
          end
          object dbedtZQUCLASS_SCORE_3: TDBEdit
            Left = 511
            Top = 24
            Width = 56
            Height = 23
            DataField = 'ZQUCLASS_SCORE_3'
            DataSource = dsDeveLeve
            TabOrder = 2
          end
        end
        object grp4: TGroupBox
          Left = 8
          Top = 300
          Width = 577
          Height = 57
          Caption = #39064#30446#24211'4'
          TabOrder = 3
          object Label4: TLabel
            Left = 13
            Top = 28
            Width = 60
            Height = 15
            Caption = #39064#24211#21495#65306
          end
          object Label5: TLabel
            Left = 333
            Top = 28
            Width = 38
            Height = 15
            Caption = #39064#25968':'
          end
          object Label6: TLabel
            Left = 441
            Top = 27
            Width = 68
            Height = 15
            Caption = #27599#39064#24471#20998':'
          end
          object dblkcbbZQUCLASS_CODE_NAME_4: TDBLookupComboBox
            Left = 76
            Top = 24
            Width = 250
            Height = 23
            DataField = 'ZQUCLASS_CODE_NAME_4'
            DataSource = dsDeveLeve
            DropDownRows = 20
            TabOrder = 0
          end
          object dbedtZQUCLASS_NUM_4: TDBEdit
            Left = 377
            Top = 24
            Width = 61
            Height = 23
            DataField = 'ZQUCLASS_NUM_4'
            DataSource = dsDeveLeve
            TabOrder = 1
          end
          object dbedtZQUCLASS_SCORE_4: TDBEdit
            Left = 511
            Top = 24
            Width = 56
            Height = 23
            DataField = 'ZQUCLASS_SCORE_4'
            DataSource = dsDeveLeve
            TabOrder = 2
          end
        end
        object grp5: TGroupBox
          Left = 8
          Top = 361
          Width = 577
          Height = 57
          Caption = #39064#30446#24211'5'
          TabOrder = 4
          object Label7: TLabel
            Left = 13
            Top = 28
            Width = 60
            Height = 15
            Caption = #39064#24211#21495#65306
          end
          object Label8: TLabel
            Left = 333
            Top = 28
            Width = 38
            Height = 15
            Caption = #39064#25968':'
          end
          object Label9: TLabel
            Left = 441
            Top = 27
            Width = 68
            Height = 15
            Caption = #27599#39064#24471#20998':'
          end
          object dblkcbbZQUCLASS_CODE_NAME_5: TDBLookupComboBox
            Left = 76
            Top = 24
            Width = 250
            Height = 23
            DataField = 'ZQUCLASS_CODE_NAME_5'
            DataSource = dsDeveLeve
            DropDownRows = 20
            TabOrder = 0
          end
          object dbedtZQUCLASS_NUM_5: TDBEdit
            Left = 377
            Top = 24
            Width = 61
            Height = 23
            DataField = 'ZQUCLASS_NUM_5'
            DataSource = dsDeveLeve
            TabOrder = 1
          end
          object dbedtZQUCLASS_SCORE_5: TDBEdit
            Left = 511
            Top = 24
            Width = 56
            Height = 23
            DataField = 'ZQUCLASS_SCORE_5'
            DataSource = dsDeveLeve
            TabOrder = 2
          end
        end
        object GroupBox1: TGroupBox
          Left = 8
          Top = 422
          Width = 577
          Height = 57
          Caption = #39064#30446#24211'6'
          TabOrder = 5
          object Label10: TLabel
            Left = 13
            Top = 28
            Width = 60
            Height = 15
            Caption = #39064#24211#21495#65306
          end
          object Label11: TLabel
            Left = 333
            Top = 28
            Width = 38
            Height = 15
            Caption = #39064#25968':'
          end
          object Label12: TLabel
            Left = 441
            Top = 27
            Width = 68
            Height = 15
            Caption = #27599#39064#24471#20998':'
          end
          object dblkcbbZQUCLASS_CODE_NAME_6: TDBLookupComboBox
            Left = 76
            Top = 24
            Width = 250
            Height = 23
            DataField = 'ZQUCLASS_CODE_NAME_6'
            DataSource = dsDeveLeve
            DropDownRows = 20
            TabOrder = 0
          end
          object dbedtZQUCLASS_NUM_6: TDBEdit
            Left = 377
            Top = 24
            Width = 61
            Height = 23
            DataField = 'ZQUCLASS_NUM_6'
            DataSource = dsDeveLeve
            TabOrder = 1
          end
          object dbedtZQUCLASS_SCORE_6: TDBEdit
            Left = 511
            Top = 24
            Width = 56
            Height = 23
            DataField = 'ZQUCLASS_SCORE_6'
            DataSource = dsDeveLeve
            TabOrder = 2
          end
        end
        object grp6: TGroupBox
          Left = 8
          Top = 483
          Width = 577
          Height = 57
          Caption = #39064#30446#24211'7'
          TabOrder = 6
          object Label13: TLabel
            Left = 13
            Top = 28
            Width = 60
            Height = 15
            Caption = #39064#24211#21495#65306
          end
          object Label14: TLabel
            Left = 333
            Top = 28
            Width = 38
            Height = 15
            Caption = #39064#25968':'
          end
          object Label15: TLabel
            Left = 441
            Top = 27
            Width = 68
            Height = 15
            Caption = #27599#39064#24471#20998':'
          end
          object dblkcbbZQUCLASS_CODE_NAME_7: TDBLookupComboBox
            Left = 76
            Top = 24
            Width = 250
            Height = 23
            DataField = 'ZQUCLASS_CODE_NAME_7'
            DataSource = dsDeveLeve
            DropDownRows = 20
            TabOrder = 0
          end
          object dbedtZQUCLASS_NUM_7: TDBEdit
            Left = 377
            Top = 24
            Width = 61
            Height = 23
            DataField = 'ZQUCLASS_NUM_7'
            DataSource = dsDeveLeve
            TabOrder = 1
          end
          object dbedtZQUCLASS_SCORE_7: TDBEdit
            Left = 511
            Top = 24
            Width = 56
            Height = 23
            DataField = 'ZQUCLASS_SCORE_7'
            DataSource = dsDeveLeve
            TabOrder = 2
          end
        end
        object grp7: TGroupBox
          Left = 8
          Top = 544
          Width = 577
          Height = 57
          Caption = #39064#30446#24211'8'
          TabOrder = 7
          object Label16: TLabel
            Left = 13
            Top = 28
            Width = 60
            Height = 15
            Caption = #39064#24211#21495#65306
          end
          object Label17: TLabel
            Left = 333
            Top = 28
            Width = 38
            Height = 15
            Caption = #39064#25968':'
          end
          object Label18: TLabel
            Left = 441
            Top = 27
            Width = 68
            Height = 15
            Caption = #27599#39064#24471#20998':'
          end
          object dblkcbbZQUCLASS_CODE_NAME_8: TDBLookupComboBox
            Left = 76
            Top = 24
            Width = 250
            Height = 23
            DataField = 'ZQUCLASS_CODE_NAME_8'
            DataSource = dsDeveLeve
            DropDownRows = 20
            TabOrder = 0
          end
          object dbedtZQUCLASS_NUM_8: TDBEdit
            Left = 377
            Top = 24
            Width = 61
            Height = 23
            DataField = 'ZQUCLASS_NUM_8'
            DataSource = dsDeveLeve
            TabOrder = 1
          end
          object dbedtZQUCLASS_SCORE_8: TDBEdit
            Left = 511
            Top = 24
            Width = 56
            Height = 23
            DataField = 'ZQUCLASS_SCORE_8'
            DataSource = dsDeveLeve
            TabOrder = 2
          end
        end
        object grp8: TGroupBox
          Left = 8
          Top = 605
          Width = 577
          Height = 57
          Caption = #39064#30446#24211'9'
          TabOrder = 8
          object Label19: TLabel
            Left = 13
            Top = 28
            Width = 60
            Height = 15
            Caption = #39064#24211#21495#65306
          end
          object Label20: TLabel
            Left = 333
            Top = 28
            Width = 38
            Height = 15
            Caption = #39064#25968':'
          end
          object Label21: TLabel
            Left = 441
            Top = 27
            Width = 68
            Height = 15
            Caption = #27599#39064#24471#20998':'
          end
          object dblkcbbZQUCLASS_CODE_NAME_9: TDBLookupComboBox
            Left = 76
            Top = 24
            Width = 250
            Height = 23
            DataField = 'ZQUCLASS_CODE_NAME_9'
            DataSource = dsDeveLeve
            DropDownRows = 20
            TabOrder = 0
          end
          object dbedtZQUCLASS_NUM_9: TDBEdit
            Left = 377
            Top = 24
            Width = 61
            Height = 23
            DataField = 'ZQUCLASS_NUM_9'
            DataSource = dsDeveLeve
            TabOrder = 1
          end
          object dbedtZQUCLASS_SCORE_9: TDBEdit
            Left = 511
            Top = 24
            Width = 56
            Height = 23
            DataField = 'ZQUCLASS_SCORE_9'
            DataSource = dsDeveLeve
            TabOrder = 2
          end
        end
        object grp9: TGroupBox
          Left = 8
          Top = 669
          Width = 577
          Height = 57
          Caption = #39064#30446#24211'10'
          TabOrder = 9
          object Label22: TLabel
            Left = 13
            Top = 28
            Width = 60
            Height = 15
            Caption = #39064#24211#21495#65306
          end
          object Label23: TLabel
            Left = 333
            Top = 28
            Width = 38
            Height = 15
            Caption = #39064#25968':'
          end
          object Label24: TLabel
            Left = 441
            Top = 27
            Width = 68
            Height = 15
            Caption = #27599#39064#24471#20998':'
          end
          object dblkcbbZQUCLASS_CODE_NAME_10: TDBLookupComboBox
            Left = 76
            Top = 24
            Width = 250
            Height = 23
            DataField = 'ZQUCLASS_CODE_NAME_10'
            DataSource = dsDeveLeve
            DropDownRows = 20
            TabOrder = 0
          end
          object dbedtZQUCLASS_NUM_10: TDBEdit
            Left = 377
            Top = 24
            Width = 61
            Height = 23
            DataField = 'ZQUCLASS_NUM_10'
            DataSource = dsDeveLeve
            TabOrder = 1
          end
          object dbedtZQUCLASS_SCORE_10: TDBEdit
            Left = 511
            Top = 24
            Width = 56
            Height = 23
            DataField = 'ZQUCLASS_SCORE_10'
            DataSource = dsDeveLeve
            TabOrder = 2
          end
        end
        object pnl9: TPanel
          Left = 0
          Top = 0
          Width = 624
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          Color = clTeal
          TabOrder = 10
          object btnDeveLeve_Add: TBitBtn
            Left = 10
            Top = 8
            Width = 100
            Height = 25
            Action = act_DeveLeve_Add
            Caption = #22686#21152#33021#21147#31561#32423
            TabOrder = 0
          end
          object btnDeveLeve_Save: TBitBtn
            Left = 114
            Top = 8
            Width = 100
            Height = 25
            Action = act_DeveLeve_Save
            Caption = #20445#23384
            TabOrder = 1
          end
          object btnDeveLeve_Cancel: TBitBtn
            Left = 218
            Top = 8
            Width = 100
            Height = 25
            Action = act_DeveLeve_Cancel
            Caption = #21462#28040
            TabOrder = 2
          end
          object chkEditDeveLeve: TCheckBox
            Left = 368
            Top = 12
            Width = 97
            Height = 17
            Caption = #32534#36753
            TabOrder = 3
            OnClick = chkEditDeveLeveClick
          end
        end
        object dbedtZDEVENAME: TDBEdit
          Left = 85
          Top = 68
          Width = 209
          Height = 23
          DataField = 'ZDEVENAME'
          DataSource = dsDeveLeve
          TabOrder = 11
        end
        object dbedtZSORT: TDBEdit
          Left = 388
          Top = 68
          Width = 121
          Height = 23
          DataField = 'ZSORT'
          DataSource = dsDeveLeve
          TabOrder = 12
        end
      end
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 0
    Width = 988
    Height = 81
    Align = alTop
    Caption = #19981#21487#35270
    TabOrder = 1
    Visible = False
  end
  object cdsQuestionClass: TClientDataSet
    Aggregates = <>
    Params = <>
    OnNewRecord = cdsQuestionClassNewRecord
    Left = 24
    Top = 8
  end
  object dsQuestionClass: TDataSource
    DataSet = cdsQuestionClass
    Left = 24
    Top = 40
  end
  object actlst1: TActionList
    Left = 104
    Top = 8
    object act_ReLoadClass: TAction
      Category = #39064#30446#31867#24211
      Caption = #21047#26032#25968#25454
      OnExecute = act_ReLoadClassExecute
      OnUpdate = act_ReLoadClassUpdate
    end
    object act_Class_Add: TAction
      Category = #39064#30446#31867#24211
      Caption = #22686#21152#20998#31867
      OnExecute = act_Class_AddExecute
      OnUpdate = act_Class_AddUpdate
    end
    object act_Class_Save: TAction
      Category = #39064#30446#31867#24211
      Caption = #20445#23384#20998#31867
      OnExecute = act_Class_SaveExecute
      OnUpdate = act_Class_SaveUpdate
    end
    object act_Questoin_Add: TAction
      Category = #39064#30446
      Caption = #22686#21152#39064#30446
      OnExecute = act_Questoin_AddExecute
      OnUpdate = act_Questoin_AddUpdate
    end
    object act_Question_Save: TAction
      Category = #39064#30446
      Caption = #20445#23384#39064#30446
      OnExecute = act_Question_SaveExecute
      OnUpdate = act_Question_SaveUpdate
    end
    object act_Question_firstpage: TAction
      Category = #39064#30446
      Caption = #31532#19968#39029
      OnExecute = act_Question_firstpageExecute
      OnUpdate = act_Question_firstpageUpdate
    end
    object act_Question_NextPage: TAction
      Category = #39064#30446
      Caption = #19979#19968#39029
      OnExecute = act_Question_NextPageExecute
      OnUpdate = act_Question_NextPageUpdate
    end
    object act_Question_ProvPage: TAction
      Category = #39064#30446
      Caption = #19978#19968#39029
      OnExecute = act_Question_ProvPageExecute
      OnUpdate = act_Question_ProvPageUpdate
    end
    object act_Question_LastPage: TAction
      Category = #39064#30446
      Caption = #26368#21518#19968#39029
      OnExecute = act_Question_LastPageExecute
      OnUpdate = act_Question_LastPageUpdate
    end
    object act_Question_ReLoad: TAction
      Category = #39064#30446
      Caption = #21047#26032#25968#25454
      OnExecute = act_Question_ReLoadExecute
    end
    object act_Question_Cancel: TAction
      Category = #39064#30446
      Caption = #21462#28040#20462#25913
      OnExecute = act_Question_CancelExecute
      OnUpdate = act_Question_CancelUpdate
    end
    object act_DeveLeve_Add: TAction
      Category = #33021#21147#31561#32423
      Caption = #22686#21152#33021#21147#31561#32423
      OnExecute = act_DeveLeve_AddExecute
      OnUpdate = act_DeveLeve_AddUpdate
    end
    object act_DeveLeve_Save: TAction
      Category = #33021#21147#31561#32423
      Caption = #20445#23384
      OnExecute = act_DeveLeve_SaveExecute
      OnUpdate = act_DeveLeve_SaveUpdate
    end
    object act_DeveLeve_Cancel: TAction
      Category = #33021#21147#31561#32423
      Caption = #21462#28040
      OnExecute = act_DeveLeve_CancelExecute
      OnUpdate = act_DeveLeve_CancelUpdate
    end
    object act_DeveLeve_ReLoad: TAction
      Category = #33021#21147#31561#32423
      Caption = #21047#26032#25968#25454
      OnExecute = act_DeveLeve_ReLoadExecute
      OnUpdate = act_DeveLeve_ReLoadUpdate
    end
    object act_DeveLeve_Build: TAction
      Category = #33021#21147#31561#32423
      Caption = #29983#25104#35797#21367
    end
  end
  object cdsQuestion: TClientDataSet
    Aggregates = <>
    Params = <>
    OnNewRecord = cdsQuestionNewRecord
    Left = 64
    Top = 8
  end
  object dsQuestion: TDataSource
    DataSet = cdsQuestion
    Left = 64
    Top = 40
  end
  object dsDeveLeve: TDataSource
    DataSet = cdsDeveLeve
    Left = 152
    Top = 40
  end
  object cdsDeveLeve: TClientDataSet
    Aggregates = <>
    Params = <>
    OnNewRecord = cdsDeveLeveNewRecord
    Left = 152
    Top = 8
  end
  object cdsQuestionClass_bak: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 8
  end
end
