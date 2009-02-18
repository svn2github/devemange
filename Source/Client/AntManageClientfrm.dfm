inherited AntManageClientDlg: TAntManageClientDlg
  Left = 178
  Top = 123
  Width = 964
  Height = 496
  Caption = #32534#35793#37096#32626
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object pgcAnt: TPageControl
    Left = 0
    Top = 0
    Width = 956
    Height = 462
    ActivePage = ts1
    Align = alClient
    TabOrder = 0
    OnChange = pgcAntChange
    OnChanging = pgcAntChanging
    object ts1: TTabSheet
      Caption = #39033#30446#37197#32622
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 948
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnProAdd: TBitBtn
          Left = 9
          Top = 8
          Width = 100
          Height = 25
          Action = act_ProAdd
          Caption = #22686#21152#39033#30446
          TabOrder = 0
        end
        object btnReLoadAnt: TBitBtn
          Left = 113
          Top = 8
          Width = 100
          Height = 25
          Action = act_ReLoadAnt
          Caption = #21047#26032#25968#25454
          TabOrder = 1
        end
      end
      object dbgrd1: TDBGrid
        Left = 0
        Top = 40
        Width = 948
        Height = 392
        Align = alClient
        DataSource = dsAntList
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDrawColumnCell = dbgrd1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'ZINDEX'
            Title.Alignment = taCenter
            Title.Caption = #24207#21495
            Width = 60
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
            FieldName = 'ZPRO_ID'
            Title.Alignment = taCenter
            Title.Caption = #31435#39033#39033#30446
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZDATE'
            Title.Alignment = taCenter
            Title.Caption = #32534#35793#26085#26399
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZIP'
            Title.Alignment = taCenter
            Title.Caption = #32534#35793#26381#21153#22120
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZVERSION'
            Title.Alignment = taCenter
            Title.Caption = #29256#26412#21495
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZSVN'
            Title.Alignment = taCenter
            Title.Caption = #32534#35793#29256#26412
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZSVN_LATEST_VERSION'
            Title.Caption = 'SVN'#29256#26412
            Width = 80
            Visible = True
          end>
      end
    end
    object ts2: TTabSheet
      Caption = #39033#30446#32534#35793
      ImageIndex = 1
      object dbtxtZNAME: TDBText
        Left = 0
        Top = 0
        Width = 948
        Height = 17
        Align = alTop
        Color = clGreen
        DataField = 'ZNAME'
        DataSource = dsAntList
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
        Top = 264
        Width = 948
        Height = 10
        Cursor = crVSplit
        Align = alTop
        Beveled = True
      end
      object pnl1: TPanel
        Left = 0
        Top = 274
        Width = 948
        Height = 158
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object pnl3: TPanel
          Left = 0
          Top = 0
          Width = 948
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          Color = clGreen
          TabOrder = 0
          object lblError: TLabel
            Left = 349
            Top = 12
            Width = 64
            Height = 15
            Caption = 'lblError'
            Font.Charset = GB2312_CHARSET
            Font.Color = clRed
            Font.Height = -15
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Visible = False
          end
          object btnBuildProject: TBitBtn
            Left = 120
            Top = 8
            Width = 100
            Height = 25
            Action = act_BuildProject
            Caption = #32534#35793
            TabOrder = 0
          end
          object btnBuildConnectIP: TBitBtn
            Left = 16
            Top = 8
            Width = 100
            Height = 25
            Action = act_BuildConnectIP
            Caption = #36830#25509#26381#21153#22120
            TabOrder = 1
          end
          object btn1_BuildInfo: TBitBtn
            Left = 224
            Top = 8
            Width = 100
            Height = 25
            Action = act1_BuildInfo
            Caption = #32534#35793#32467#26524
            TabOrder = 2
          end
        end
        object lstResult: TListBox
          Left = 0
          Top = 40
          Width = 948
          Height = 118
          Style = lbOwnerDrawFixed
          Align = alClient
          ItemHeight = 16
          TabOrder = 1
          OnDrawItem = lstResultDrawItem
        end
        object ani1: TAnimate
          Left = 3
          Top = 42
          Width = 100
          Height = 80
          Color = clWhite
          ParentColor = False
          Visible = False
        end
      end
      object scrlbx1: TScrollBox
        Left = 0
        Top = 17
        Width = 948
        Height = 247
        Align = alTop
        TabOrder = 1
        object lbl1: TLabel
          Left = 8
          Top = 16
          Width = 45
          Height = 15
          Caption = #21517#31216#65306
        end
        object lbl2: TLabel
          Left = 8
          Top = 45
          Width = 75
          Height = 15
          Caption = #31435#39033#39033#30446#65306
        end
        object lbl3: TLabel
          Left = 269
          Top = 45
          Width = 90
          Height = 15
          Caption = #32534#35793#26381#21153#22120#65306
        end
        object lbl4: TLabel
          Left = 8
          Top = 74
          Width = 75
          Height = 15
          Caption = #32534#35793#33050#26412#65306
        end
        object lbl5: TLabel
          Left = 8
          Top = 162
          Width = 75
          Height = 15
          Caption = #32534#35793#35828#26126#65306
        end
        object lbl6: TLabel
          Left = 553
          Top = 43
          Width = 75
          Height = 15
          Caption = #32534#35793#26085#26399#65306
        end
        object lbl7: TLabel
          Left = 8
          Top = 106
          Width = 60
          Height = 15
          Caption = #29256#26412#21495#65306
        end
        object lbl8: TLabel
          Left = 274
          Top = 105
          Width = 75
          Height = 15
          Caption = #32534#35793#29256#26412#65306
        end
        object lbl9: TLabel
          Left = 557
          Top = 103
          Width = 62
          Height = 15
          Caption = 'SVN'#29256#26412':'
        end
        object lbl10: TLabel
          Left = 8
          Top = 135
          Width = 62
          Height = 15
          Caption = 'SVN'#36335#24452':'
        end
        object dbedtZNAME: TDBEdit
          Left = 81
          Top = 11
          Width = 722
          Height = 23
          DataField = 'ZNAME'
          DataSource = dsAntList
          TabOrder = 0
        end
        object dbedtZPRO_ID: TDBEdit
          Left = 81
          Top = 40
          Width = 180
          Height = 23
          DataField = 'ZPRO_ID'
          DataSource = dsAntList
          TabOrder = 1
        end
        object dbedtZIP: TDBEdit
          Left = 353
          Top = 40
          Width = 180
          Height = 23
          DataField = 'ZIP'
          DataSource = dsAntList
          TabOrder = 2
        end
        object dbedtZPYFILE: TDBEdit
          Left = 82
          Top = 69
          Width = 722
          Height = 23
          DataField = 'ZPYFILE'
          DataSource = dsAntList
          TabOrder = 3
        end
        object btnProSave: TBitBtn
          Left = 818
          Top = 7
          Width = 100
          Height = 25
          Action = act_ProSave
          Caption = #20445#23384
          TabOrder = 4
        end
        object btnProCancel: TBitBtn
          Left = 818
          Top = 36
          Width = 100
          Height = 25
          Action = act_ProCancel
          Caption = #21462#28040
          TabOrder = 5
        end
        object dbmmoZREMARK: TDBMemo
          Left = 81
          Top = 159
          Width = 722
          Height = 75
          DataField = 'ZREMARK'
          DataSource = dsAntList
          ScrollBars = ssVertical
          TabOrder = 6
        end
        object dbedtZDATE: TDBEdit
          Left = 624
          Top = 40
          Width = 180
          Height = 23
          DataField = 'ZDATE'
          DataSource = dsAntList
          TabOrder = 7
        end
        object dbedtZVERSION: TDBEdit
          Left = 81
          Top = 102
          Width = 180
          Height = 23
          DataField = 'ZVERSION'
          DataSource = dsAntList
          TabOrder = 8
        end
        object dbedtZSVN: TDBEdit
          Left = 353
          Top = 101
          Width = 180
          Height = 23
          DataField = 'ZSVN'
          DataSource = dsAntList
          TabOrder = 9
        end
        object dbedtZSVN_LATEST_VERSION: TDBEdit
          Left = 624
          Top = 97
          Width = 180
          Height = 23
          Color = clBtnFace
          DataField = 'ZSVN_LATEST_VERSION'
          DataSource = dsAntList
          ReadOnly = True
          TabOrder = 10
        end
        object dbedtZSVN_URL: TDBEdit
          Left = 82
          Top = 130
          Width = 722
          Height = 23
          DataField = 'ZSVN_URL'
          DataSource = dsAntList
          TabOrder = 11
          Visible = False
        end
        object btnEditSVNRUL: TBitBtn
          Left = 83
          Top = 130
          Width = 100
          Height = 25
          Caption = #32534#36753#36335#24452
          TabOrder = 12
          OnClick = btnEditSVNRULClick
        end
      end
    end
    object tsLog: TTabSheet
      Caption = 'SVN'#26085#24535
      ImageIndex = 2
      object spl2: TSplitter
        Left = 0
        Top = 256
        Width = 948
        Height = 8
        Cursor = crVSplit
        Align = alBottom
      end
      object dbtxtZNAME1: TDBText
        Left = 0
        Top = 0
        Width = 948
        Height = 17
        Align = alTop
        Color = clGreen
        DataField = 'ZPRONAME'
        DataSource = dsSvnCommits
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object pnl4: TPanel
        Left = 0
        Top = 17
        Width = 948
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lblSvnPage: TLabel
          Left = 757
          Top = 12
          Width = 80
          Height = 15
          Caption = 'lblSvnPage'
        end
        object btnSvnLog_FirstPage: TBitBtn
          Left = 332
          Top = 8
          Width = 100
          Height = 25
          Action = actSvnLog_FirstPage
          Caption = #31532#19968#39029
          TabOrder = 0
        end
        object btnSvnLog_ProPage: TBitBtn
          Left = 436
          Top = 8
          Width = 100
          Height = 25
          Action = actSvnLog_ProPage
          Caption = #19978#19968#39029
          TabOrder = 1
        end
        object btnSvnLog_NextPage: TBitBtn
          Left = 540
          Top = 8
          Width = 100
          Height = 25
          Action = actSvnLog_NextPage
          Caption = #19979#19968#39029
          TabOrder = 2
        end
        object btnSvnLog_ProPage1: TBitBtn
          Left = 644
          Top = 8
          Width = 100
          Height = 25
          Action = actSvnLog_LastPage
          Caption = #26368#21518#19968#39029
          TabOrder = 3
        end
        object btnSvnLog_PiroProject: TBitBtn
          Left = 0
          Top = 8
          Width = 100
          Height = 25
          Action = actSvnLog_PiroProject
          Caption = #19978#19968#20010#39033#30446
          TabOrder = 4
        end
        object btnSvnLog_NetProject: TBitBtn
          Left = 104
          Top = 8
          Width = 100
          Height = 25
          Action = actSvnLog_NetProject
          Caption = #19979#19968#20010#39033#30446
          TabOrder = 5
        end
        object btnSvnLog_AllProject: TBitBtn
          Left = 208
          Top = 8
          Width = 100
          Height = 25
          Action = actSvnLog_AllProject
          Caption = #20840#37096#39033#30446
          TabOrder = 6
        end
      end
      object dbgrdSvnChanges: TDBGrid
        Left = 0
        Top = 264
        Width = 948
        Height = 168
        Align = alBottom
        DataSource = dsSvnChanges
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDrawColumnCell = dbgrdSvnChangesDrawColumnCell
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ZACTION'
            Title.Alignment = taCenter
            Title.Caption = #25805#20316
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZPATH'
            Title.Alignment = taCenter
            Title.Caption = #36335#24452
            Width = 450
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZCOPY_PATH'
            Title.Alignment = taCenter
            Title.Caption = #20174#36335#24452#22797#21046
            Width = 380
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZCOPY_VERSION'
            Title.Alignment = taCenter
            Title.Caption = #29256#26412
            Visible = True
          end>
      end
      object pnl5: TPanel
        Left = 0
        Top = 57
        Width = 948
        Height = 199
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnl5'
        TabOrder = 2
        object spl3: TSplitter
          Left = 0
          Top = 102
          Width = 948
          Height = 8
          Cursor = crVSplit
          Align = alBottom
        end
        object dbgrdSvnCommits: TDBGrid
          Left = 0
          Top = 0
          Width = 948
          Height = 102
          Align = alClient
          DataSource = dsSvnCommits
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnDrawColumnCell = dbgrdSvnCommitsDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'ZAUTOID'
              Title.Alignment = taCenter
              Title.Caption = #32534#21495
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZVERSTR'
              Title.Alignment = taCenter
              Title.Caption = #29256#26412
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZAUTHOR'
              Title.Alignment = taCenter
              Title.Caption = #20316#32773
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZDATE'
              Title.Alignment = taCenter
              Title.Caption = #26085#26399
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZMESSAGETEXT'
              Title.Alignment = taCenter
              Title.Caption = #20449#24687
              Width = 600
              Visible = True
            end>
        end
        object dbmmoZMESSAGE: TDBMemo
          Left = 0
          Top = 110
          Width = 948
          Height = 89
          Align = alBottom
          DataField = 'ZMESSAGE'
          DataSource = dsSvnCommits
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
    end
  end
  object actlst1: TActionList
    Left = 48
    Top = 328
    object act_BuildProject: TAction
      Caption = #32534#35793
      OnExecute = act_BuildProjectExecute
      OnUpdate = act_BuildProjectUpdate
    end
    object act_ProAdd: TAction
      Caption = #22686#21152#39033#30446
      OnExecute = act_ProAddExecute
    end
    object act_ProSave: TAction
      Caption = #20445#23384
      OnExecute = act_ProSaveExecute
      OnUpdate = act_ProSaveUpdate
    end
    object act_ProCancel: TAction
      Caption = #21462#28040
      OnExecute = act_ProCancelExecute
      OnUpdate = act_ProCancelUpdate
    end
    object act_BuildConnectIP: TAction
      Caption = #36830#25509#26381#21153#22120
      OnExecute = act_BuildConnectIPExecute
    end
    object act1_BuildInfo: TAction
      Caption = #32534#35793#32467#26524
      OnExecute = act1_BuildInfoExecute
      OnUpdate = act1_BuildInfoUpdate
    end
    object act_Svnlog: TAction
      Category = 'SVN'#26085#24535
      Caption = 'SVN'#26085#24535
    end
    object actSvnLog_FirstPage: TAction
      Category = 'SVN'#26085#24535
      Caption = #31532#19968#39029
      OnExecute = actSvnLog_FirstPageExecute
      OnUpdate = actSvnLog_FirstPageUpdate
    end
    object actSvnLog_ProPage: TAction
      Category = 'SVN'#26085#24535
      Caption = #19978#19968#39029
      OnExecute = actSvnLog_ProPageExecute
      OnUpdate = actSvnLog_ProPageUpdate
    end
    object actSvnLog_NextPage: TAction
      Category = 'SVN'#26085#24535
      Caption = #19979#19968#39029
      OnExecute = actSvnLog_NextPageExecute
      OnUpdate = actSvnLog_NextPageUpdate
    end
    object actSvnLog_LastPage: TAction
      Category = 'SVN'#26085#24535
      Caption = #26368#21518#19968#39029
      OnExecute = actSvnLog_LastPageExecute
      OnUpdate = actSvnLog_LastPageUpdate
    end
    object actSvnLog_PiroProject: TAction
      Category = 'SVN'#26085#24535
      Caption = #19978#19968#20010#39033#30446
      OnExecute = actSvnLog_PiroProjectExecute
      OnUpdate = actSvnLog_PiroProjectUpdate
    end
    object actSvnLog_NetProject: TAction
      Category = 'SVN'#26085#24535
      Caption = #19979#19968#20010#39033#30446
      OnExecute = actSvnLog_NetProjectExecute
      OnUpdate = actSvnLog_NetProjectUpdate
    end
    object actSvnLog_AllProject: TAction
      Category = 'SVN'#26085#24535
      Caption = #20840#37096#39033#30446
      OnExecute = actSvnLog_AllProjectExecute
    end
    object act_ReLoadAnt: TAction
      Caption = #21047#26032#25968#25454
      OnExecute = act_ReLoadAntExecute
    end
  end
  object idtcpclnt1: TIdTCPClient
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 0
    Left = 84
    Top = 328
  end
  object cdsAntList: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsAntListBeforePost
    AfterScroll = cdsAntListAfterScroll
    OnNewRecord = cdsAntListNewRecord
    Left = 118
    Top = 328
  end
  object dsAntList: TDataSource
    DataSet = cdsAntList
    Left = 117
    Top = 367
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 154
    Top = 328
  end
  object cdsSvnCommits: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsSvnCommitsAfterScroll
    OnCalcFields = cdsSvnCommitsCalcFields
    Left = 190
    Top = 328
  end
  object dsSvnCommits: TDataSource
    DataSet = cdsSvnCommits
    Left = 189
    Top = 366
  end
  object cdsSvnChanges: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 228
    Top = 330
  end
  object dsSvnChanges: TDataSource
    DataSet = cdsSvnChanges
    Left = 228
    Top = 362
  end
  object cdsCloneAntList: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 116
    Top = 290
  end
end
