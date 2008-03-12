inherited ProjectManageClientDlg: TProjectManageClientDlg
  Left = 227
  Top = 175
  Width = 923
  Caption = #39033#30446#31649#29702
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object plonvisible: TPanel
    Left = 0
    Top = 0
    Width = 915
    Height = 65
    Align = alTop
    Caption = 'plonvisible'
    TabOrder = 0
    Visible = False
  end
  object plcenter: TPanel
    Left = 0
    Top = 65
    Width = 915
    Height = 541
    Align = alClient
    BevelOuter = bvLowered
    Caption = 'plcenter'
    TabOrder = 1
    object pcProject: TPageControl
      Left = 1
      Top = 1
      Width = 913
      Height = 539
      ActivePage = tsProjectList
      Align = alClient
      MultiLine = True
      TabOrder = 0
      OnChange = pcProjectChange
      OnChanging = pcProjectChanging
      object tsProjectList: TTabSheet
        Caption = #31435#39033#39033#30446
        object plProItemTop: TPanel
          Left = 0
          Top = 0
          Width = 905
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object BitBtn1: TBitBtn
            Left = 77
            Top = 8
            Width = 100
            Height = 25
            Action = actPro_Add
            Caption = #22686#21152#39033#30446
            TabOrder = 0
          end
          object BitBtn2: TBitBtn
            Left = 300
            Top = 8
            Width = 100
            Height = 25
            Action = actPro_Save
            Caption = #20445#23384
            TabOrder = 1
          end
          object cbEditProItem: TCheckBox
            Left = 10
            Top = 14
            Width = 58
            Height = 17
            Caption = #32534#36753
            TabOrder = 2
            OnClick = cbEditProItemClick
          end
          object BitBtn3: TBitBtn
            Left = 410
            Top = 8
            Width = 100
            Height = 25
            Action = actPro_Cancel
            Caption = #21462#28040
            TabOrder = 3
          end
          object BitBtn4: TBitBtn
            Left = 189
            Top = 8
            Width = 100
            Height = 25
            Action = actPro_Del
            Caption = #21024#38500
            TabOrder = 4
          end
          object BitBtn9: TBitBtn
            Left = 528
            Top = 8
            Width = 100
            Height = 25
            Action = actPro_RefreshData
            Caption = #21047#26032#25968#25454
            TabOrder = 5
          end
        end
        object dgProItem: TDBGrid
          Left = 0
          Top = 40
          Width = 905
          Height = 469
          Align = alClient
          DataSource = dsProjectItem
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
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
              Title.Caption = #39033#30446'ID'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZNAME'
              Title.Alignment = taCenter
              Title.Caption = #39033#30446#21517#31216
              Width = 300
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
              Color = clBtnFace
              Expanded = False
              FieldName = 'ZLASTVER'
              Title.Alignment = taCenter
              Title.Caption = #26368#26032#29256#26412#21495
              Width = 102
              Visible = True
            end
            item
              Color = clBtnFace
              Expanded = False
              FieldName = 'ZLASTDATE'
              Title.Alignment = taCenter
              Title.Caption = #26368#26032#26356#26032#26102#38388
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZUSERNAME'
              Title.Alignment = taCenter
              Title.Caption = #36127#36131#20154
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZUNITS'
              Title.Alignment = taCenter
              Title.Caption = #20351#29992#21333#20301
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZHIGHVERID'
              Title.Caption = #26368#26032#29256#26412'ID'#21495
              Visible = True
            end>
        end
      end
      object tsProjectVer: TTabSheet
        Caption = #39033#30446#29256#26412
        ImageIndex = 1
        object Splitter1: TSplitter
          Left = 0
          Top = 158
          Width = 905
          Height = 10
          Cursor = crVSplit
          Align = alBottom
          Beveled = True
          ResizeStyle = rsLine
        end
        object dbProName: TDBText
          Left = 0
          Top = 40
          Width = 905
          Height = 17
          Align = alTop
          Color = clGray
          DataField = 'ZNAME'
          DataSource = dsProjectItem
          Font.Charset = GB2312_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object plProVersion: TPanel
          Left = 0
          Top = 0
          Width = 905
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object cbVersionEdit: TCheckBox
            Left = 9
            Top = 11
            Width = 64
            Height = 17
            Caption = #32534#36753
            TabOrder = 0
            OnClick = cbVersionEditClick
          end
          object BitBtn5: TBitBtn
            Left = 66
            Top = 6
            Width = 100
            Height = 25
            Action = actVer_Add
            Caption = #22686#21152#29256#26412
            TabOrder = 1
          end
          object BitBtn6: TBitBtn
            Left = 174
            Top = 6
            Width = 100
            Height = 25
            Action = actVer_Del
            Caption = #21024#38500
            TabOrder = 2
          end
          object BitBtn7: TBitBtn
            Left = 283
            Top = 6
            Width = 100
            Height = 25
            Action = actVer_Save
            Caption = #20445#23384
            TabOrder = 3
          end
          object BitBtn8: TBitBtn
            Left = 393
            Top = 6
            Width = 100
            Height = 25
            Action = actvar_Cancel
            Caption = #21462#28040
            TabOrder = 4
          end
        end
        object dbmContext: TDBMemo
          Left = 0
          Top = 168
          Width = 905
          Height = 341
          Align = alBottom
          DataField = 'ZCONTEXT'
          DataSource = dsProVersion
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object dgProVersion: TDBGrid
          Left = 0
          Top = 57
          Width = 905
          Height = 101
          Align = alClient
          DataSource = dsProVersion
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 2
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Color = clBtnFace
              Expanded = False
              FieldName = 'ZNO'
              Title.Alignment = taCenter
              Title.Caption = #24207#21495
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZVER'
              Title.Alignment = taCenter
              Title.Caption = #29256#26412
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZUPDATEDATE'
              Title.Alignment = taCenter
              Title.Caption = #26356#26032#26085#26399
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZMUSTVER'
              Title.Alignment = taCenter
              Title.Caption = #24517#39035#26356#26032#29256#26412
              Width = 131
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZID'
              Visible = True
            end>
        end
      end
    end
  end
  object cdsProjectItem: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsProjectItemBeforePost
    BeforeDelete = cdsProjectItemBeforeDelete
    OnNewRecord = cdsProjectItemNewRecord
    Left = 24
    Top = 8
  end
  object dsProjectItem: TDataSource
    DataSet = cdsProjectItem
    Left = 56
    Top = 8
  end
  object ActionList1: TActionList
    Left = 96
    Top = 8
    object actPro_Add: TAction
      Category = #31435#39033#39033#30446
      Caption = #22686#21152#39033#30446
      OnExecute = actPro_AddExecute
      OnUpdate = actPro_AddUpdate
    end
    object actPro_Save: TAction
      Category = #31435#39033#39033#30446
      Caption = #20445#23384
      Hint = #22686#21152#25110#20462#25913#28857#20445#23384#25165#33021#20445#23384#21040#25968#25454#24211
      OnExecute = actPro_SaveExecute
      OnUpdate = actPro_SaveUpdate
    end
    object actPro_Cancel: TAction
      Category = #31435#39033#39033#30446
      Caption = #21462#28040
      OnExecute = actPro_CancelExecute
      OnUpdate = actPro_CancelUpdate
    end
    object actPro_Del: TAction
      Category = #31435#39033#39033#30446
      Caption = #21024#38500
      OnExecute = actPro_DelExecute
      OnUpdate = actPro_DelUpdate
    end
    object actVer_Add: TAction
      Category = #39033#30446#29256#26412
      Caption = #22686#21152#29256#26412
      OnExecute = actVer_AddExecute
      OnUpdate = actVer_AddUpdate
    end
    object actVer_Del: TAction
      Category = #39033#30446#29256#26412
      Caption = #21024#38500
      OnExecute = actVer_DelExecute
      OnUpdate = actVer_DelUpdate
    end
    object actVer_Save: TAction
      Category = #39033#30446#29256#26412
      Caption = #20445#23384
      OnExecute = actVer_SaveExecute
      OnUpdate = actVer_SaveUpdate
    end
    object actvar_Cancel: TAction
      Category = #39033#30446#29256#26412
      Caption = #21462#28040
      OnExecute = actvar_CancelExecute
      OnUpdate = actvar_CancelUpdate
    end
    object actPro_RefreshData: TAction
      Category = #31435#39033#39033#30446
      Caption = #21047#26032#25968#25454
      Hint = #21047#26032#25968#25454
      OnExecute = actPro_RefreshDataExecute
    end
  end
  object dsProVersion: TDataSource
    DataSet = cdsProVersion
    Left = 168
    Top = 8
  end
  object cdsProVersion: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsProVersionBeforePost
    BeforeDelete = cdsProVersionBeforeDelete
    OnNewRecord = cdsProVersionNewRecord
    Left = 136
    Top = 7
  end
  object pmExcel: TPopupMenu
    AutoHotkeys = maManual
    Left = 224
    Top = 8
    object N4: TMenuItem
      Caption = #21333#20803#26684#25805#20316
    end
    object N2: TMenuItem
      Caption = #34892#25805#20316
      object N1: TMenuItem
        Caption = #35774#32622#22266#23450#34892
        object miFixedRow: TMenuItem
          Caption = '0'#34892
        end
        object miFixRow: TMenuItem
          Tag = 1
          Caption = '1'#34892
        end
        object N21: TMenuItem
          Tag = 2
          Caption = '2'#34892
        end
        object N31: TMenuItem
          Tag = 3
          Caption = '3'#34892
        end
        object N41: TMenuItem
          Tag = 4
          Caption = '4'#34892
        end
        object N51: TMenuItem
          Tag = 5
          Caption = '5'#34892
        end
      end
    end
    object N3: TMenuItem
      Caption = #21015#25805#20316
      object N5: TMenuItem
        Caption = #35774#32622#22266#23450#21015
        object miFixedCol: TMenuItem
          Caption = '0'#21015
        end
        object N11: TMenuItem
          Tag = 1
          Caption = '1'#21015
        end
        object N22: TMenuItem
          Tag = 2
          Caption = '2'#21015
        end
        object N32: TMenuItem
          Tag = 3
          Caption = '3'#21015
        end
        object N42: TMenuItem
          Tag = 4
          Caption = '4'#21015
        end
        object N52: TMenuItem
          Tag = 5
          Caption = '5'#21015
        end
      end
      object N6: TMenuItem
        Caption = #21069#31227#19968#21015
      end
      object N7: TMenuItem
        Caption = #21521#21518#31227#19968#21015
      end
    end
  end
  object cdsDocs: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 8
  end
end
