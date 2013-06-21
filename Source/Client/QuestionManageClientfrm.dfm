inherited QuestionManageClientDlg: TQuestionManageClientDlg
  Left = 165
  Top = 152
  Width = 966
  Height = 679
  Caption = #31561#32423#39064#24211
  PixelsPerInch = 96
  TextHeight = 15
  object pgcQuestion: TPageControl
    Left = 0
    Top = 81
    Width = 950
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
        Width = 942
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
        Width = 942
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
        Width = 942
        Height = 448
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
        Width = 942
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
        Width = 674
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
          Width = 674
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
  end
  object pnl3: TPanel
    Left = 0
    Top = 0
    Width = 950
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
end
