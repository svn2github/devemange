inherited UserManageClientDlg: TUserManageClientDlg
  Left = 220
  Top = 116
  Height = 798
  Caption = #29992#25143#31649#29702
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object plCenter: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 764
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = 'plCenter'
    TabOrder = 0
    object plnoVisible: TPanel
      Left = 1
      Top = 1
      Width = 860
      Height = 64
      Align = alTop
      Caption = 'plnoVisible'
      TabOrder = 0
      Visible = False
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 65
      Width = 860
      Height = 698
      ActivePage = tsUser
      Align = alClient
      TabOrder = 1
      OnChange = PageControl1Change
      OnChanging = PageControl1Changing
      object tsUser: TTabSheet
        Caption = #21592#24037#21015#34920
        object dgUsers: TDBGrid
          Left = 0
          Top = 40
          Width = 852
          Height = 628
          Align = alClient
          DataSource = dsUsers
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Color = clBtnFace
              Expanded = False
              FieldName = 'ZID'
              Title.Alignment = taCenter
              Title.Caption = #29992#25143'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZNAME'
              Title.Alignment = taCenter
              Title.Caption = #36134#21495
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZPASS'
              Title.Alignment = taCenter
              Title.Caption = #23494#30721
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZSTOP'
              Title.Alignment = taCenter
              Title.Caption = #31105#29992
              Width = 80
              Visible = True
            end
            item
              Color = clBtnFace
              Expanded = False
              FieldName = 'ZTYPE'
              Title.Alignment = taCenter
              Title.Caption = #31867#22411'(0='#31995#32479#29992#25143'1='#24320#21457#20154#21592' 2='#27979#35797#20154#21592',3='#20854#20182#20154#21592',4='#23458#26381#20154#21592')'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZEMAIL'
              Title.Alignment = taCenter
              Title.Caption = #37038#31665
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZGROUP_ID'
              Title.Alignment = taCenter
              Title.Caption = #29992#25143#32452
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZPRIVGROUP'
              Title.Alignment = taCenter
              Title.Caption = #26435#38480#32452
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZCHECKTASK'
              Title.Alignment = taCenter
              Title.Caption = #20219#21153#21333#23457#26680
              Visible = True
            end>
        end
        object plUserTop: TPanel
          Left = 0
          Top = 0
          Width = 852
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object cbEditUser: TCheckBox
            Left = 8
            Top = 16
            Width = 57
            Height = 17
            Caption = #32534#36753
            TabOrder = 0
            OnClick = cbEditUserClick
          end
          object BitBtn1: TBitBtn
            Left = 80
            Top = 8
            Width = 100
            Height = 25
            Action = actUser_Add
            Caption = #22686#21152#29992#25143
            TabOrder = 1
          end
          object BitBtn2: TBitBtn
            Left = 192
            Top = 8
            Width = 100
            Height = 25
            Action = actUser_Del
            Caption = #21024#38500#29992#25143
            TabOrder = 2
          end
          object BitBtn3: TBitBtn
            Left = 304
            Top = 8
            Width = 100
            Height = 25
            Action = actUser_Save
            Caption = #20445#23384
            TabOrder = 3
          end
          object BitBtn4: TBitBtn
            Left = 416
            Top = 8
            Width = 100
            Height = 25
            Action = actUser_Cancel
            Caption = #21462#28040
            TabOrder = 4
          end
          object BitBtn9: TBitBtn
            Left = 528
            Top = 8
            Width = 100
            Height = 25
            Action = actUser_RefreshData
            Caption = #21047#26032#25968#25454
            TabOrder = 5
          end
        end
      end
      object tsUserPriv: TTabSheet
        Caption = #21592#24037#26435#38480
        ImageIndex = 1
        object DBText1: TDBText
          Left = 0
          Top = 40
          Width = 852
          Height = 17
          Align = alTop
          Color = clGray
          DataField = 'ZNAME'
          DataSource = dsUsers
          Font.Charset = GB2312_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Splitter1: TSplitter
          Left = 0
          Top = 470
          Width = 852
          Height = 10
          Cursor = crVSplit
          Align = alBottom
          Beveled = True
          ResizeStyle = rsLine
        end
        object plUserProvTool: TPanel
          Left = 0
          Top = 0
          Width = 852
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object ckEditUserPriv: TCheckBox
            Left = 8
            Top = 16
            Width = 65
            Height = 17
            Caption = #32534#36753
            TabOrder = 0
            OnClick = ckEditUserPrivClick
          end
          object BitBtn5: TBitBtn
            Left = 82
            Top = 8
            Width = 100
            Height = 25
            Action = accPriv_Add
            Caption = #22686#21152#26435#38480
            TabOrder = 1
          end
          object BitBtn6: TBitBtn
            Left = 194
            Top = 7
            Width = 100
            Height = 25
            Action = actPriv_Del
            Caption = #21024#38500#26435#38480
            TabOrder = 2
          end
          object BitBtn7: TBitBtn
            Left = 306
            Top = 7
            Width = 100
            Height = 25
            Action = actPriv_Save
            Caption = #20445#23384
            TabOrder = 3
          end
          object BitBtn8: TBitBtn
            Left = 418
            Top = 7
            Width = 100
            Height = 25
            Action = actPriv_Cancel
            Caption = #21462#28040
            TabOrder = 4
          end
        end
        object dgUserPriv: TDBGrid
          Left = 0
          Top = 57
          Width = 472
          Height = 413
          Align = alClient
          DataSource = dsUserPriv
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ZSTYLE'
              Title.Alignment = taCenter
              Title.Caption = #27169#22359
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZSUBSTYLE'
              Title.Alignment = taCenter
              Title.Caption = #23376#27169#22359
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZMODULEID'
              Title.Alignment = taCenter
              Title.Caption = #25805#20316#23545#35937
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZRIGHTMASK'
              Title.Alignment = taCenter
              Title.Caption = #26435#38480
              Width = 100
              Visible = True
            end>
        end
        object plUserPrivEdit: TPanel
          Left = 472
          Top = 57
          Width = 380
          Height = 413
          Align = alRight
          BevelOuter = bvNone
          Color = clMoneyGreen
          TabOrder = 2
          object Label1: TLabel
            Left = 32
            Top = 30
            Width = 38
            Height = 15
            Caption = #27169#22359':'
            Color = clBtnFace
            ParentColor = False
            Transparent = True
          end
          object Label2: TLabel
            Left = 32
            Top = 62
            Width = 53
            Height = 15
            Caption = #23376#27169#22359':'
            Color = clBtnFace
            ParentColor = False
            Transparent = True
          end
          object Label3: TLabel
            Left = 32
            Top = 89
            Width = 68
            Height = 15
            Caption = #25805#20316#23545#35937':'
            Color = clBtnFace
            ParentColor = False
            Transparent = True
          end
          object Label4: TLabel
            Left = 32
            Top = 118
            Width = 38
            Height = 15
            Caption = #26435#38480':'
            Color = clBtnFace
            ParentColor = False
            Transparent = True
          end
          object Label5: TLabel
            Left = 321
            Top = 90
            Width = 137
            Height = 15
            Caption = '('#20998#37096#25110#25991#20214#30340'ID'#21495')'
          end
          object Label6: TLabel
            Left = 8
            Top = 312
            Width = 429
            Height = 15
            Caption = #25805#20316#23545#35937'='#20998#37096#25110#25991#20214#30340'ID'#21495#65292#20063#26159#23545#36825#20010#23545#35937#36827#34892#26597#25214#65292#20462#25913#12290
          end
          object DBEdit1: TDBEdit
            Left = 112
            Top = 22
            Width = 201
            Height = 23
            DataField = 'ZSTYLE'
            DataSource = dsUserPriv
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 112
            Top = 54
            Width = 201
            Height = 23
            DataField = 'ZSUBSTYLE'
            DataSource = dsUserPriv
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit3: TDBEdit
            Left = 112
            Top = 86
            Width = 201
            Height = 23
            DataField = 'ZMODULEID'
            DataSource = dsUserPriv
            ReadOnly = True
            TabOrder = 2
          end
          object DBEdit4: TDBEdit
            Left = 112
            Top = 118
            Width = 201
            Height = 23
            DataField = 'ZRIGHTMASK'
            DataSource = dsUserPriv
            ReadOnly = True
            TabOrder = 3
          end
          object btbnCalcPriv: TBitBtn
            Left = 64
            Top = 245
            Width = 100
            Height = 25
            Caption = #35745#31639#26435#38480
            TabOrder = 4
            OnClick = btbnCalcPrivClick
          end
          object cbView: TCheckBox
            Left = 64
            Top = 165
            Width = 97
            Height = 17
            Caption = #26597#30475'=1'
            TabOrder = 5
          end
          object cbUpdate: TCheckBox
            Left = 64
            Top = 189
            Width = 97
            Height = 17
            Caption = #20462#25913'=2'
            TabOrder = 6
          end
          object cbDel: TCheckBox
            Left = 192
            Top = 165
            Width = 97
            Height = 17
            Caption = #21024#38500'=4'
            TabOrder = 7
          end
          object cbAdd: TCheckBox
            Left = 192
            Top = 189
            Width = 97
            Height = 17
            Caption = #22686#21152'=8'
            TabOrder = 8
          end
        end
        object Memo1: TMemo
          Left = 0
          Top = 480
          Width = 852
          Height = 188
          Align = alBottom
          Lines.Strings = (
            '#######################'
            '# '#39033#30446#25991#26723' '
            '#######################'
            #27169#22359'=500'
            '1.'#26641#26435#19982#25991#20214#30340#20445#23384#38480#23376#27169#22359'=1'
            ''
            '######################'
            '# Bug'#31649#29702#22120
            '######################'
            #27169#22359'=200'
            '1.'#26641#26435#38480#23376#27169#22359'=1'
            ''
            '######################'
            '# '#25991#20214#31649#29702
            '######################'
            #27169#22359'=100'
            '1.'#26641#26435#38480#23376#27169#22359'=1'
            '2.'#25991#20214#32534#36753#26435#38480#23376#27169#22359'=2'
            ''
            '######################'
            '# '#39033#30446#31649#29702
            '######################'
            #27169#22359'=300'
            #29256#26412#21495#23376#27169#22359'=1 ,'#25805#20316#23545#35937#39033#30446'ID'#21495
            #20219#21153#21333#23376#27169#22359'=2 ,'#25805#20316#23545#35937#39033#30446'ID'#21495
            '')
          ScrollBars = ssBoth
          TabOrder = 3
        end
      end
    end
  end
  object cdsUsers: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsUsersBeforePost
    BeforeDelete = cdsUsersBeforeDelete
    OnNewRecord = cdsUsersNewRecord
    Left = 16
    Top = 8
  end
  object dsUsers: TDataSource
    DataSet = cdsUsers
    Left = 56
    Top = 8
  end
  object cdsUserPriv: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsUserPrivBeforePost
    BeforeDelete = cdsUserPrivBeforeDelete
    OnNewRecord = cdsUserPrivNewRecord
    Left = 96
    Top = 8
  end
  object dsUserPriv: TDataSource
    DataSet = cdsUserPriv
    Left = 136
    Top = 8
  end
  object ActionList1: TActionList
    Left = 176
    Top = 8
    object actUser_Add: TAction
      Category = #29992#25143
      Caption = #22686#21152#29992#25143
      Hint = #22686#21152#29992#25143
      OnExecute = actUser_AddExecute
      OnUpdate = actUser_AddUpdate
    end
    object actUser_Del: TAction
      Category = #29992#25143
      Caption = #21024#38500#29992#25143
      OnExecute = actUser_DelExecute
      OnUpdate = actUser_DelUpdate
    end
    object actUser_Save: TAction
      Category = #29992#25143
      Caption = #20445#23384
      OnExecute = actUser_SaveExecute
      OnUpdate = actUser_SaveUpdate
    end
    object actUser_Cancel: TAction
      Category = #29992#25143
      Caption = #21462#28040
      OnExecute = actUser_CancelExecute
      OnUpdate = actUser_CancelUpdate
    end
    object accPriv_Add: TAction
      Category = #26435#38480
      Caption = #22686#21152#26435#38480
      OnExecute = accPriv_AddExecute
      OnUpdate = accPriv_AddUpdate
    end
    object actPriv_Del: TAction
      Category = #26435#38480
      Caption = #21024#38500#26435#38480
      OnExecute = actPriv_DelExecute
      OnUpdate = actPriv_DelUpdate
    end
    object actPriv_Save: TAction
      Category = #26435#38480
      Caption = #20445#23384
      OnExecute = actPriv_SaveExecute
      OnUpdate = actPriv_SaveUpdate
    end
    object actPriv_Cancel: TAction
      Category = #26435#38480
      Caption = #21462#28040
      OnUpdate = actPriv_CancelUpdate
    end
    object actUser_RefreshData: TAction
      Category = #29992#25143
      Caption = #21047#26032#25968#25454
      OnExecute = actUser_RefreshDataExecute
    end
  end
end
