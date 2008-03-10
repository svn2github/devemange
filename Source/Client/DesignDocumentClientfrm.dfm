inherited DesignDocumentClientDlg: TDesignDocumentClientDlg
  Left = 148
  Top = 183
  Width = 1076
  Caption = #35774#35745#25991#26723
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 201
    Top = 0
    Width = 10
    Height = 606
    Beveled = True
  end
  object tvProject: TTreeView
    Left = 0
    Top = 0
    Width = 201
    Height = 606
    Align = alLeft
    HideSelection = False
    Images = DM.ImageListTree
    Indent = 19
    PopupMenu = pmProject
    TabOrder = 0
    OnChange = tvProjectChange
    OnExpanding = tvProjectExpanding
  end
  object pltxt: TPanel
    Left = 211
    Top = 0
    Width = 857
    Height = 606
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBText1: TDBText
      Left = 0
      Top = 0
      Width = 857
      Height = 17
      Align = alTop
      Color = clGray
      DataField = 'ZNAME'
      DataSource = dsText
      Font.Charset = GB2312_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object DBMemo1: TDBMemo
      Left = 0
      Top = 17
      Width = 857
      Height = 589
      Align = alClient
      DataField = 'ZCONTEXT'
      DataSource = dsText
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object ActionList1: TActionList
    Images = DM.ImageList1
    Left = 427
    Top = 264
    object actProject_AddDir: TAction
      Category = #20998#37096#26641
      Caption = #22686#21152#30446#24405
      Hint = #22686#21152#30446#24405
      OnExecute = actProject_AddDirExecute
      OnUpdate = actProject_AddDirUpdate
    end
    object actProject_DelDir: TAction
      Category = #20998#37096#26641
      Caption = #21024#38500#20998#37096
      OnExecute = actProject_DelDirExecute
      OnUpdate = actProject_DelDirUpdate
    end
    object actProject_AddExcel: TAction
      Category = #20998#37096#26641
      Caption = #22686#21152#30005#23376#34920#26684#25991#26723
      OnExecute = actProject_AddExcelExecute
      OnUpdate = actProject_AddExcelUpdate
    end
    object actEdit_savecolwidth: TAction
      Category = #32534#36753
      Caption = #20445#23384#21015#23485
    end
    object actEdit_SaveRowHgith: TAction
      Category = #32534#36753
      Caption = #20445#23384#34892#39640
    end
    object actEdit_InsertRow: TAction
      Category = #32534#36753
      Caption = #25554#20837#34892
    end
    object actEdit_DeleteRow: TAction
      Category = #32534#36753
      Caption = #21024#38500#34892
      Hint = #21024#38500#24403#21069#36873#25321#30340#34892
    end
  end
  object pmExcel: TPopupMenu
    AutoHotkeys = maManual
    Left = 456
    Top = 264
    object N4: TMenuItem
      Caption = #21333#20803#26684#25805#20316
    end
    object N2: TMenuItem
      Caption = #34892#25805#20316
      object N14: TMenuItem
        Action = actEdit_InsertRow
      end
      object N15: TMenuItem
        Action = actEdit_DeleteRow
      end
      object N13: TMenuItem
        Action = actEdit_SaveRowHgith
      end
      object N1: TMenuItem
        Caption = #35774#32622#22266#23450#34892
        object miFixedRow: TMenuItem
          Caption = '0'#34892
          OnClick = miFixedRowClick
        end
        object miFixRow: TMenuItem
          Tag = 1
          Caption = '1'#34892
          OnClick = miFixedRowClick
        end
        object N21: TMenuItem
          Tag = 2
          Caption = '2'#34892
          OnClick = miFixedRowClick
        end
        object N31: TMenuItem
          Tag = 3
          Caption = '3'#34892
          OnClick = miFixedRowClick
        end
        object N41: TMenuItem
          Tag = 4
          Caption = '4'#34892
          OnClick = miFixedRowClick
        end
        object N51: TMenuItem
          Tag = 5
          Caption = '5'#34892
          OnClick = miFixedRowClick
        end
      end
    end
    object N3: TMenuItem
      Caption = #21015#25805#20316
      object N5: TMenuItem
        Caption = #35774#32622#22266#23450#21015
        object miFixedCol: TMenuItem
          Caption = '0'#21015
          OnClick = miFixedColClick
        end
        object N11: TMenuItem
          Tag = 1
          Caption = '1'#21015
          OnClick = miFixedColClick
        end
        object N22: TMenuItem
          Tag = 2
          Caption = '2'#21015
          OnClick = miFixedColClick
        end
        object N32: TMenuItem
          Tag = 3
          Caption = '3'#21015
          OnClick = miFixedColClick
        end
        object N42: TMenuItem
          Tag = 4
          Caption = '4'#21015
          OnClick = miFixedColClick
        end
        object N52: TMenuItem
          Tag = 5
          Caption = '5'#21015
          OnClick = miFixedColClick
        end
      end
      object N6: TMenuItem
        Caption = #21521#21069#31227#19968#21015
        Hint = #21521#21069#31227#19968#21015
      end
      object N7: TMenuItem
        Caption = #21521#21518#31227#19968#21015
      end
      object N12: TMenuItem
        Action = actEdit_savecolwidth
      end
    end
  end
  object cdsData: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 523
    Top = 264
  end
  object pmProject: TPopupMenu
    AutoHotkeys = maManual
    Left = 491
    Top = 264
    object N10: TMenuItem
      Action = actProject_AddExcel
    end
    object N8: TMenuItem
      Action = actProject_AddDir
    end
    object N9: TMenuItem
      Action = actProject_DelDir
    end
  end
  object cdsText: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 427
    Top = 304
  end
  object dsText: TDataSource
    DataSet = cdsText
    Left = 427
    Top = 336
  end
end
