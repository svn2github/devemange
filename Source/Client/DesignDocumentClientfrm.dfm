inherited DesignDocumentClientDlg: TDesignDocumentClientDlg
  Left = 64
  Top = 194
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
    Images = DM.ImageListTree
    Indent = 19
    PopupMenu = pmProject
    TabOrder = 0
    OnExpanding = tvProjectExpanding
  end
  object plClient: TPanel
    Left = 211
    Top = 0
    Width = 857
    Height = 606
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object lbDocName: TLabel
      Left = 0
      Top = 40
      Width = 857
      Height = 15
      Align = alTop
      Caption = ' '#31354
      Color = clGray
      Font.Charset = GB2312_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object plTool: TPanel
      Left = 0
      Top = 0
      Width = 857
      Height = 40
      Align = alTop
      TabOrder = 0
      object Bevel1: TBevel
        Left = 245
        Top = 8
        Width = 9
        Height = 26
        Shape = bsLeftLine
      end
      object BitBtn1: TBitBtn
        Left = 136
        Top = 8
        Width = 100
        Height = 25
        Action = actEditor_Save
        Caption = #20445#23384
        TabOrder = 0
      end
      object BitBtn2: TBitBtn
        Left = 24
        Top = 8
        Width = 100
        Height = 25
        Action = actProject_OpenFile
        Caption = #25171#24320#25991#26723
        TabOrder = 1
      end
      object cbAction: TComboBox
        Left = 256
        Top = 9
        Width = 81
        Height = 23
        Style = csDropDownList
        ItemHeight = 15
        TabOrder = 2
        Items.Strings = (
          #21333#20803#26684
          #34892
          #21015)
      end
      object cbFontColor: TColorBox
        Left = 344
        Top = 9
        Width = 50
        Height = 22
        Hint = #23383#20307#33394
        ItemHeight = 16
        TabOrder = 3
      end
      object cbbgColor: TColorBox
        Left = 399
        Top = 9
        Width = 55
        Height = 22
        Hint = #32972#26223#33394
        ItemHeight = 16
        TabOrder = 4
      end
      object btbnOK: TBitBtn
        Left = 736
        Top = 8
        Width = 100
        Height = 25
        Action = actEdit_SetCells
        Caption = #30830#23450#21442#25968
        TabOrder = 5
      end
    end
    object dgExcel: TDrawGrid
      Left = 0
      Top = 55
      Width = 857
      Height = 551
      Align = alClient
      ColCount = 27
      DefaultRowHeight = 21
      RowCount = 1000
      FixedRows = 4
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSizing, goColSizing, goEditing, goTabs]
      PopupMenu = pmExcel
      TabOrder = 1
      Visible = False
      OnDrawCell = dgExcelDrawCell
      OnGetEditText = dgExcelGetEditText
      OnSetEditText = dgExcelSetEditText
    end
  end
  object ActionList1: TActionList
    Left = 427
    Top = 264
    object actEditor_Save: TAction
      Category = #32534#36753
      Caption = #20445#23384
      OnExecute = actEditor_SaveExecute
      OnUpdate = actEditor_SaveUpdate
    end
    object actEditor_FrontCol: TAction
      Category = #32534#36753
      Caption = #21521#21069#31227#19968#21015
      Hint = #21521#21069#31227#19968#21015
    end
    object actEditor_BlackCol: TAction
      Category = #32534#36753
      Caption = #21521#21518#31227#19968#21015
    end
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
    object actProject_OpenFile: TAction
      Category = #32534#36753
      Caption = #25171#24320#25991#26723
      OnExecute = actProject_OpenFileExecute
      OnUpdate = actProject_OpenFileUpdate
    end
    object actEdit_SetCells: TAction
      Category = #32534#36753
      Caption = #30830#23450#21442#25968
      Hint = #30830#23450#35774#32622#20869#23481#30340#21442#25968
      OnExecute = actEdit_SetCellsExecute
      OnUpdate = actEdit_SetCellsUpdate
    end
    object actEdit_savecolwidth: TAction
      Category = #32534#36753
      Caption = #20445#23384#21015#23485
      OnExecute = actEdit_savecolwidthExecute
      OnUpdate = actEdit_savecolwidthUpdate
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
        Action = actEditor_FrontCol
      end
      object N7: TMenuItem
        Action = actEditor_BlackCol
      end
      object N12: TMenuItem
        Action = actEdit_savecolwidth
      end
    end
  end
  object cdsData: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 531
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
end
