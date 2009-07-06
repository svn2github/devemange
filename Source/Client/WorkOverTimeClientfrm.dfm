inherited WorkOverTimeClient: TWorkOverTimeClient
  Left = 225
  Top = 57
  Height = 679
  Caption = #21152#29677#21333
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object pgc1: TPageControl
    Left = 0
    Top = 80
    Width = 862
    Height = 565
    ActivePage = tsWorkList
    Align = alClient
    TabOrder = 0
    OnChanging = pgc1Changing
    object tsWorkList: TTabSheet
      Caption = #25105#30340#21152#29677#21333
      object pnlTool: TPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnAddToDay: TBitBtn
          Left = 112
          Top = 8
          Width = 100
          Height = 25
          Action = act_AddToDay
          Caption = #25105#20170#22825#21152#29677#20102
          TabOrder = 0
        end
        object btnAddToYesterday: TBitBtn
          Left = 216
          Top = 8
          Width = 100
          Height = 25
          Action = act_AddToYesterday
          Caption = #25105#26576#22825#21152#29677#20102
          TabOrder = 1
        end
        object btnAddLoad: TBitBtn
          Left = 8
          Top = 8
          Width = 100
          Height = 25
          Action = act_AddLoad
          Caption = #25105#30340#21152#29677#21333
          TabOrder = 2
        end
        object btnCheckList: TBitBtn
          Left = 320
          Top = 8
          Width = 100
          Height = 25
          Action = act_CheckList
          Caption = #35201#25105#23457#26680#30340
          TabOrder = 3
        end
        object dblkcbb1: TDBLookupComboBox
          Left = 428
          Top = 9
          Width = 145
          Height = 23
          DropDownRows = 25
          KeyField = 'ZID'
          ListField = 'ZNAME'
          ListSource = dsUser
          TabOrder = 4
        end
        object btnmework1: TBitBtn
          Left = 577
          Top = 7
          Width = 100
          Height = 25
          Action = act_OtherWork
          Caption = #20182#20154#21152#29677#21333
          TabOrder = 5
        end
      end
      object dbgrd1: TDBGrid
        Left = 0
        Top = 40
        Width = 854
        Height = 455
        Align = alClient
        DataSource = dsWorkList
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
            FieldName = 'ZMYID'
            Title.Alignment = taCenter
            Title.Caption = #32534#21495
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZUSERNAME'
            Title.Alignment = taCenter
            Title.Caption = #35841#21152#29677
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZDATE'
            Title.Alignment = taCenter
            Title.Caption = #26085#26399
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZLASTDATETIME'
            Title.Alignment = taCenter
            Title.Caption = #19979#29677#26102#38388
            Width = 150
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ZMINUTE'
            Title.Alignment = taCenter
            Title.Caption = #21152#29677#20998#38047
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZCONTENTTEXT'
            Title.Alignment = taCenter
            Title.Caption = #20107#30001
            Width = 300
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ZSTATUSNAME'
            Title.Alignment = taCenter
            Title.Caption = #29366#24577
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZCHECKNAME'
            Title.Alignment = taCenter
            Title.Caption = #23457#26680#20154
            Width = 80
            Visible = True
          end>
      end
      object pnlPage: TPanel
        Left = 0
        Top = 495
        Width = 854
        Height = 40
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object lblPageCount: TLabel
          Left = 640
          Top = 13
          Width = 96
          Height = 15
          Caption = 'lblPageCount'
        end
        object btnfirstPage: TBitBtn
          Left = 12
          Top = 8
          Width = 100
          Height = 25
          Action = act_firstPage
          Caption = #31532#19968#39029
          TabOrder = 0
        end
        object btnPrivPage: TBitBtn
          Left = 116
          Top = 8
          Width = 100
          Height = 25
          Action = act_PrivPage
          Caption = #19978#19968#39029
          TabOrder = 1
        end
        object btnNextPage: TBitBtn
          Left = 220
          Top = 8
          Width = 100
          Height = 25
          Action = act_NextPage
          Caption = #19979#19968#39029
          TabOrder = 2
        end
        object btnLastPage: TBitBtn
          Left = 324
          Top = 8
          Width = 100
          Height = 25
          Action = act_LastPage
          Caption = #26368#21518#19968#39029
          TabOrder = 3
        end
        object btnRefreshData: TBitBtn
          Left = 428
          Top = 8
          Width = 100
          Height = 25
          Action = act_RefreshData
          Caption = #21047#26032#25968#25454
          TabOrder = 4
        end
        object btnAll: TBitBtn
          Left = 532
          Top = 8
          Width = 100
          Height = 25
          Action = act_All
          Caption = #20840#37096#25968#25454
          TabOrder = 5
        end
      end
    end
    object tsWorkContent: TTabSheet
      Caption = #21152#29677#20869#23481
      ImageIndex = 1
      object lbl4: TLabel
        Left = 15
        Top = 160
        Width = 77
        Height = 15
        Caption = #20107'    '#30001#65306
      end
      object lbl11: TLabel
        Left = 14
        Top = 486
        Width = 75
        Height = 15
        Caption = #21046#21333#26102#38388#65306
      end
      object dbtxtZBUILDDATE: TDBText
        Left = 91
        Top = 486
        Width = 315
        Height = 17
        DataField = 'ZBUILDDATE'
        DataSource = dsWorkList
      end
      object lbl12: TLabel
        Left = 16
        Top = 186
        Width = 77
        Height = 15
        Caption = #20107'    '#30001#65306
      end
      object dbmmoZCONTENT: TDBMemo
        Left = 90
        Top = 186
        Width = 462
        Height = 291
        DataField = 'ZCONTENT'
        DataSource = dsWorkList
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 178
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object lbl1: TLabel
          Left = 16
          Top = 38
          Width = 69
          Height = 15
          Caption = #21152' '#29677' '#20154':'
        end
        object lbl2: TLabel
          Left = 16
          Top = 97
          Width = 75
          Height = 15
          Caption = #19979#29677#26102#38388#65306
        end
        object lbl3: TLabel
          Left = 16
          Top = 129
          Width = 75
          Height = 15
          Caption = #21152#29677#22320#28857#65306
        end
        object lbl5: TLabel
          Left = 16
          Top = 156
          Width = 76
          Height = 15
          Caption = #23457' '#26680' '#20154#65306
        end
        object lbl6: TLabel
          Left = 301
          Top = 38
          Width = 68
          Height = 15
          Caption = #21152#29677#20998#38047':'
        end
        object lbl7: TLabel
          Left = 16
          Top = 68
          Width = 77
          Height = 15
          Caption = #26085'    '#26399#65306
        end
        object lbl8: TLabel
          Left = 303
          Top = 98
          Width = 15
          Height = 15
          Caption = #33267
        end
        object lbl9: TLabel
          Left = 297
          Top = 66
          Width = 24
          Height = 15
          Caption = '<<<'
        end
        object lbl10: TLabel
          Left = 302
          Top = 157
          Width = 45
          Height = 15
          Caption = #29366#24577#65306
        end
        object lbl13: TLabel
          Left = 472
          Top = 39
          Width = 40
          Height = 15
          Caption = #31995#25968#65306
        end
        object dbedtZCHECKNAME: TDBEdit
          Left = 90
          Top = 153
          Width = 202
          Height = 23
          DataField = 'ZCHECKNAME'
          DataSource = dsWorkList
          TabOrder = 0
        end
        object dbedtZADDRESS: TDBEdit
          Left = 90
          Top = 124
          Width = 464
          Height = 23
          DataField = 'ZADDRESS'
          DataSource = dsWorkList
          TabOrder = 1
        end
        object dbedtZLASTDATETIME: TDBEdit
          Left = 327
          Top = 94
          Width = 226
          Height = 23
          DataField = 'ZLASTDATETIME'
          DataSource = dsWorkList
          TabOrder = 2
        end
        object dbedtZUSERNAME: TDBEdit
          Left = 90
          Top = 35
          Width = 202
          Height = 23
          DataField = 'ZUSERNAME'
          DataSource = dsWorkList
          TabOrder = 3
        end
        object dbedtZMINUTE: TDBEdit
          Left = 373
          Top = 34
          Width = 94
          Height = 23
          Color = clBtnFace
          DataField = 'ZMINUTE'
          DataSource = dsWorkList
          ReadOnly = True
          TabOrder = 4
        end
        object btnNext: TBitBtn
          Left = 600
          Top = 95
          Width = 100
          Height = 25
          Action = act_Next
          Caption = #19979#19968#20010
          TabOrder = 5
        end
        object btnPriv: TBitBtn
          Left = 600
          Top = 66
          Width = 100
          Height = 25
          Action = act_Priv
          Caption = #19978#19968#20010
          TabOrder = 6
        end
        object btncancel: TBitBtn
          Left = 601
          Top = 37
          Width = 100
          Height = 25
          Action = act_cancel
          Caption = #21462#28040
          TabOrder = 7
        end
        object btnSave: TBitBtn
          Left = 600
          Top = 8
          Width = 100
          Height = 25
          Action = act_Save
          Caption = #20445#23384
          TabOrder = 8
        end
        object dbedtZDATE: TDBEdit
          Left = 90
          Top = 96
          Width = 202
          Height = 23
          Color = clBtnFace
          DataField = 'ZDATETIME'
          DataSource = dsWorkList
          ReadOnly = True
          TabOrder = 9
        end
        object dbedtZDATE1: TDBEdit
          Left = 90
          Top = 64
          Width = 202
          Height = 23
          DataField = 'ZDATE'
          DataSource = dsWorkList
          TabOrder = 10
        end
        object dtp1: TDateTimePicker
          Left = 327
          Top = 63
          Width = 228
          Height = 23
          Date = 39997.934213136580000000
          Time = 39997.934213136580000000
          TabOrder = 11
          OnChange = dtp1Change
        end
        object dbedtZSTATUSNAME: TDBEdit
          Left = 341
          Top = 154
          Width = 84
          Height = 23
          DataField = 'ZSTATUSNAME'
          DataSource = dsWorkList
          TabOrder = 12
        end
        object dbchkZWEEKEND: TDBCheckBox
          Left = 88
          Top = 8
          Width = 226
          Height = 17
          Caption = #25105#26159#21608#26411#25110#33410#20551#26085#21152#29677
          DataField = 'ZWEEKEND'
          DataSource = dsWorkList
          TabOrder = 13
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = dbchkZWEEKENDClick
        end
        object btnCancellBill: TBitBtn
          Left = 430
          Top = 152
          Width = 124
          Height = 25
          Action = act_CancellBill
          Caption = #21462#28040'\'#30003#35831#21152#29677#21333
          TabOrder = 14
        end
        object dbedtZRATE: TDBEdit
          Left = 511
          Top = 35
          Width = 42
          Height = 23
          Color = clBtnFace
          DataField = 'ZRATE'
          DataSource = dsWorkList
          ReadOnly = True
          TabOrder = 15
        end
      end
      object btnAgree: TBitBtn
        Left = 600
        Top = 197
        Width = 98
        Height = 25
        Action = act_Agree
        Caption = #21516#24847
        TabOrder = 2
      end
      object btnNoAgree: TBitBtn
        Left = 600
        Top = 229
        Width = 100
        Height = 25
        Action = act_NoAgree
        Caption = #19981#21516#24847
        TabOrder = 3
      end
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 80
    Align = alTop
    Alignment = taRightJustify
    Caption = #38754#26495','#19981#21487#35270
    TabOrder = 1
    Visible = False
  end
  object actlst1: TActionList
    Left = 24
    Top = 10
    object act_AddToDay: TAction
      Caption = #25105#20170#22825#21152#29677#20102
      OnExecute = act_AddToDayExecute
    end
    object act_AddToYesterday: TAction
      Caption = #25105#26152#22825#21152#29677#20102
      OnExecute = act_AddToYesterdayExecute
    end
    object act_AddLoad: TAction
      Caption = #25105#30340#21152#29677#21333
      OnExecute = act_AddLoadExecute
    end
    object act_firstPage: TAction
      Category = #39029#25805#20316
      Caption = #31532#19968#39029
      OnExecute = act_firstPageExecute
      OnUpdate = act_firstPageUpdate
    end
    object act_PrivPage: TAction
      Category = #39029#25805#20316
      Caption = #19978#19968#39029
      OnExecute = act_PrivPageExecute
      OnUpdate = act_PrivPageUpdate
    end
    object act_NextPage: TAction
      Category = #39029#25805#20316
      Caption = #19979#19968#39029
      OnExecute = act_NextPageExecute
      OnUpdate = act_NextPageUpdate
    end
    object act_LastPage: TAction
      Category = #39029#25805#20316
      Caption = #26368#21518#19968#39029
      OnExecute = act_LastPageExecute
      OnUpdate = act_LastPageUpdate
    end
    object act_Save: TAction
      Caption = #20445#23384
      OnExecute = act_SaveExecute
      OnUpdate = act_SaveUpdate
    end
    object act_cancel: TAction
      Caption = #21462#28040
      OnExecute = act_cancelExecute
      OnUpdate = act_cancelUpdate
    end
    object act_RefreshData: TAction
      Category = #39029#25805#20316
      Caption = #21047#26032#25968#25454
      OnExecute = act_RefreshDataExecute
    end
    object act_Agree: TAction
      Caption = #21516#24847
      OnExecute = act_AgreeExecute
    end
    object act_NoAgree: TAction
      Caption = #19981#21516#24847
      OnExecute = act_NoAgreeExecute
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
    object act_CancellBill: TAction
      Caption = #21462#28040#21152#29677#21333
      OnExecute = act_CancellBillExecute
      OnUpdate = act_CancellBillUpdate
    end
    object act_CheckList: TAction
      Caption = #35201#25105#23457#26680#30340
      OnExecute = act_CheckListExecute
    end
    object act_OtherWork: TAction
      Caption = #20182#20154#21152#29677#21333
      OnExecute = act_OtherWorkExecute
    end
    object act_All: TAction
      Caption = #20840#37096#25968#25454
      OnExecute = act_AllExecute
    end
  end
  object cdsWrokList: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsWrokListBeforePost
    OnCalcFields = cdsWrokListCalcFields
    OnNewRecord = cdsWrokListNewRecord
    Left = 64
    Top = 8
  end
  object dsWorkList: TDataSource
    DataSet = cdsWrokList
    Left = 64
    Top = 40
  end
  object cdsParams: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 8
  end
  object cdsUser: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 139
    Top = 8
  end
  object dsUser: TDataSource
    DataSet = cdsUser
    Left = 139
    Top = 40
  end
end
