inherited DemandClientDlg: TDemandClientDlg
  Left = 173
  Top = 98
  Width = 979
  Caption = #38656#27714#31649#29702
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object pgc1: TPageControl
    Left = 0
    Top = 77
    Width = 971
    Height = 529
    ActivePage = ts1
    Align = alClient
    TabOrder = 0
    OnChanging = pgc1Changing
    object ts1: TTabSheet
      Caption = #38656#27714#21015#34920
      object pnlTool: TPanel
        Left = 0
        Top = 0
        Width = 963
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnAddDemand: TBitBtn
          Left = 12
          Top = 8
          Width = 100
          Height = 25
          Action = act_AddDemand
          Caption = #25105#35201#25552#38656#27714
          TabOrder = 0
        end
        object btntoMe: TBitBtn
          Left = 118
          Top = 8
          Width = 100
          Height = 25
          Action = act_toMe
          Caption = #25105#25552#20132#30340#38656#27714
          TabOrder = 1
        end
      end
      object pnlBottom: TPanel
        Left = 0
        Top = 459
        Width = 963
        Height = 40
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object lblPageCount: TLabel
          Left = 641
          Top = 11
          Width = 96
          Height = 15
          Caption = 'lblPageCount'
        end
        object btnFirstPage: TBitBtn
          Left = 11
          Top = 8
          Width = 100
          Height = 25
          Action = act_FirstPage
          Caption = #31532#19968#39029
          TabOrder = 0
        end
        object btnPrivPage: TBitBtn
          Left = 115
          Top = 8
          Width = 100
          Height = 25
          Action = act_PrivPage
          Caption = #19978#19968#39029
          TabOrder = 1
        end
        object btnNextPage: TBitBtn
          Left = 219
          Top = 8
          Width = 100
          Height = 25
          Action = act_NextPage
          Caption = #19979#19968#39029
          TabOrder = 2
        end
        object btnLastPage: TBitBtn
          Left = 323
          Top = 8
          Width = 100
          Height = 25
          Action = act_LastPage
          Caption = #26368#21518#19968#39029
          TabOrder = 3
        end
        object btnRefreshData: TBitBtn
          Left = 427
          Top = 8
          Width = 100
          Height = 25
          Action = act_RefreshData
          Caption = #21047#26032#25968#25454
          TabOrder = 4
        end
        object btnAllData: TBitBtn
          Left = 531
          Top = 8
          Width = 100
          Height = 25
          Action = act_AllData
          Caption = #20840#37096#25968#25454
          TabOrder = 5
        end
      end
      object dbgrd1: TDBGrid
        Left = 0
        Top = 40
        Width = 963
        Height = 419
        Align = alClient
        DataSource = dsDemandList
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDrawColumnCell = dbgrd1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'ZID'
            Title.Alignment = taCenter
            Title.Caption = 'D'#32534#21495
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZNAME'
            Title.Alignment = taCenter
            Title.Caption = #38656#27714#21517#31216
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZUSERNAME'
            Title.Alignment = taCenter
            Title.Caption = #25552#20132#20154
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZBUILDDATE'
            Title.Alignment = taCenter
            Title.Caption = #25552#20132#26102#38388
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZPROJECTNAME'
            Title.Alignment = taCenter
            Title.Caption = #25152#23646#39033#30446
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZCHECKNAME'
            Title.Alignment = taCenter
            Title.Caption = #23457#26680#20154
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ZSTATUSNAME'
            Title.Alignment = taCenter
            Title.Caption = #29366#24577
            Width = 60
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ZRESETNAME'
            Title.Alignment = taCenter
            Title.Caption = #38656#27714#21464#26356
            Width = 80
            Visible = True
          end>
      end
    end
    object ts2: TTabSheet
      Caption = #38656#27714#20869#23481
      ImageIndex = 1
      object dbtxtZNAME: TDBText
        Left = 0
        Top = 0
        Width = 963
        Height = 17
        Align = alTop
        Color = clBlack
        DataField = 'ZNAME'
        DataSource = dsDemandList
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 0
        Top = 263
        Width = 963
        Height = 15
        Align = alTop
        Caption = #38656#27714#25551#36848
        Color = clBlack
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
        Top = 260
        Width = 963
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 17
        Width = 963
        Height = 243
        Align = alTop
        TabOrder = 0
        object lbl2: TLabel
          Left = 14
          Top = 13
          Width = 75
          Height = 15
          Caption = #38656#27714#21517#31216#65306
        end
        object lbl3: TLabel
          Left = 14
          Top = 42
          Width = 75
          Height = 15
          Caption = #35201#27714#26102#38388#65306
        end
        object lbl4: TLabel
          Left = 14
          Top = 68
          Width = 75
          Height = 15
          Caption = #31435#39033#39033#30446#65306
        end
        object lbl5: TLabel
          Left = 14
          Top = 97
          Width = 75
          Height = 15
          Caption = #23458#25143#20449#24687#65306
        end
        object lbl6: TLabel
          Left = 12
          Top = 156
          Width = 75
          Height = 15
          Caption = #37038#20214#36890#30693#65306
        end
        object lbl7: TLabel
          Left = 516
          Top = 157
          Width = 24
          Height = 15
          Caption = '<<<'
        end
        object lbl8: TLabel
          Left = 12
          Top = 182
          Width = 75
          Height = 30
          Caption = #25509#21463#25110#13#10#25298#32477#21407#22240#65306
        end
        object lbl9: TLabel
          Left = 345
          Top = 68
          Width = 45
          Height = 15
          Caption = #29366#24577#65306
        end
        object lbl11: TLabel
          Left = 324
          Top = 41
          Width = 24
          Height = 15
          Caption = '<<<'
        end
        object dbedtZNAME: TDBEdit
          Left = 85
          Top = 8
          Width = 599
          Height = 23
          DataField = 'ZNAME'
          DataSource = dsDemandList
          TabOrder = 0
        end
        object btnSave: TBitBtn
          Left = 784
          Top = 8
          Width = 100
          Height = 25
          Action = act_Save
          Caption = #20445#23384
          TabOrder = 1
        end
        object btnCancel: TBitBtn
          Left = 784
          Top = 37
          Width = 100
          Height = 25
          Action = act_Cancel
          Caption = #21462#28040
          TabOrder = 2
        end
        object btnPriv: TBitBtn
          Left = 784
          Top = 66
          Width = 100
          Height = 25
          Action = act_Priv
          Caption = #19978#19968#20010
          TabOrder = 3
        end
        object btnNext: TBitBtn
          Left = 784
          Top = 95
          Width = 100
          Height = 25
          Action = act_Next
          Caption = #19979#19968#20010
          TabOrder = 4
        end
        object dbedtZNEEDDATE: TDBEdit
          Left = 85
          Top = 37
          Width = 232
          Height = 23
          DataField = 'ZNEEDDATE'
          DataSource = dsDemandList
          TabOrder = 5
        end
        object dblkcbbZPROJECTNAME: TDBLookupComboBox
          Left = 85
          Top = 65
          Width = 233
          Height = 23
          DataField = 'ZPROJECTNAME'
          DataSource = dsDemandList
          DropDownRows = 25
          TabOrder = 6
        end
        object dbmmoZCUSTOMER: TDBMemo
          Left = 85
          Top = 94
          Width = 602
          Height = 53
          DataField = 'ZCUSTOMER'
          DataSource = dsDemandList
          TabOrder = 7
        end
        object dbedtZMAILTO: TDBEdit
          Left = 84
          Top = 152
          Width = 427
          Height = 23
          DataField = 'ZMAILTO'
          DataSource = dsDemandList
          TabOrder = 8
        end
        object dblkcbbSelectUsermail: TDBLookupComboBox
          Left = 544
          Top = 152
          Width = 144
          Height = 23
          DropDownRows = 25
          KeyField = 'ZID'
          ListField = 'ZNAME'
          ListSource = DM.dsUsers
          TabOrder = 9
          OnCloseUp = dblkcbbSelectUsermailCloseUp
        end
        object dbmmoZREMARK: TDBMemo
          Left = 84
          Top = 181
          Width = 603
          Height = 42
          DataField = 'ZREMARK'
          DataSource = dsDemandList
          TabOrder = 10
        end
        object dbedtZSTATUSNAME: TDBEdit
          Left = 389
          Top = 64
          Width = 122
          Height = 23
          DataField = 'ZSTATUSNAME'
          DataSource = dsDemandList
          TabOrder = 11
        end
        object btnAccept: TBitBtn
          Left = 784
          Top = 158
          Width = 100
          Height = 25
          Action = act_Accept
          Caption = #25509#21463
          TabOrder = 12
        end
        object btnrefuse: TBitBtn
          Left = 784
          Top = 187
          Width = 100
          Height = 25
          Action = act_refuse
          Caption = #25298#32477
          TabOrder = 13
        end
        object dbchkZISRESET: TDBCheckBox
          Left = 529
          Top = 67
          Width = 97
          Height = 17
          Caption = #38656#27714#24050#21464#26356#20102
          DataField = 'ZISRESET'
          DataSource = dsDemandList
          TabOrder = 14
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object dtp1: TDateTimePicker
          Left = 355
          Top = 36
          Width = 186
          Height = 23
          Date = 39998.849618958330000000
          Time = 39998.849618958330000000
          TabOrder = 15
          OnChange = dtp1Change
        end
      end
      object dbmmoZCONTENT: TDBMemo
        Left = 0
        Top = 278
        Width = 963
        Height = 181
        Align = alClient
        DataField = 'ZCONTENT'
        DataSource = dsDemandList
        ScrollBars = ssBoth
        TabOrder = 1
      end
      object pnlFile: TPanel
        Left = 0
        Top = 459
        Width = 963
        Height = 40
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object lbl10: TLabel
          Left = 12
          Top = 16
          Width = 45
          Height = 15
          Caption = #38468#20214#65306
        end
        object dbtxtZANNEXFILENAME: TDBText
          Left = 53
          Top = 15
          Width = 332
          Height = 17
          DataField = 'ZANNEXFILENAME'
          DataSource = dsDemandList
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object btnOpenFIle: TBitBtn
          Left = 545
          Top = 10
          Width = 100
          Height = 25
          Action = act_OpenFIle
          Caption = #19978#20256#38468#20214
          TabOrder = 0
        end
        object btndownfile: TBitBtn
          Left = 649
          Top = 10
          Width = 100
          Height = 25
          Action = act_downfile
          Caption = #19979#36733#38468#20214
          TabOrder = 1
        end
      end
    end
  end
  object pnlNoVisible: TPanel
    Left = 0
    Top = 0
    Width = 971
    Height = 77
    Align = alTop
    Alignment = taRightJustify
    Caption = #19981#21487#35270'   '
    TabOrder = 1
    Visible = False
  end
  object cdsDemandList: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsDemandListBeforePost
    OnCalcFields = cdsDemandListCalcFields
    OnNewRecord = cdsDemandListNewRecord
    Left = 40
    Top = 4
  end
  object dsDemandList: TDataSource
    DataSet = cdsDemandList
    Left = 42
    Top = 40
  end
  object actlst1: TActionList
    Left = 8
    Top = 3
    object act_FirstPage: TAction
      Category = #39029#38754
      Caption = #31532#19968#39029
      OnExecute = act_FirstPageExecute
      OnUpdate = act_FirstPageUpdate
    end
    object act_PrivPage: TAction
      Category = #39029#38754
      Caption = #19978#19968#39029
      OnExecute = act_PrivPageExecute
      OnUpdate = act_PrivPageUpdate
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
    object act_AddDemand: TAction
      Caption = #25105#35201#25552#38656#27714
      OnExecute = act_AddDemandExecute
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
    object act_Priv: TAction
      Caption = #19978#19968#20010
      OnExecute = act_PrivExecute
      OnUpdate = act_PrivUpdate
    end
    object act_Next: TAction
      Caption = #19979#19968#20010
      OnExecute = act_NextExecute
      OnUpdate = act_NextUpdate
    end
    object act_OpenFIle: TAction
      Caption = #19978#20256#38468#20214
      OnExecute = act_OpenFIleExecute
    end
    object act_Accept: TAction
      Caption = #25509#21463
      OnExecute = act_AcceptExecute
    end
    object act_refuse: TAction
      Caption = #25298#32477
      OnExecute = act_refuseExecute
    end
    object act_downfile: TAction
      Caption = #19979#36733#38468#20214
      OnExecute = act_downfileExecute
      OnUpdate = act_downfileUpdate
    end
    object act_toMe: TAction
      Caption = #25105#25552#20132#30340#38656#27714
      OnExecute = act_toMeExecute
    end
    object act_AllData: TAction
      Caption = #20840#37096#25968#25454
      OnExecute = act_AllDataExecute
    end
  end
  object cdsParams: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 78
    Top = 4
  end
  object cdsProject: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 114
    Top = 4
  end
  object dlgOpen1: TOpenDialog
    Filter = #25152#26377#25991#20214'(*.*)|*.*'
    Left = 152
    Top = 8
  end
  object dlgSave1: TSaveDialog
    Left = 184
    Top = 8
  end
end
