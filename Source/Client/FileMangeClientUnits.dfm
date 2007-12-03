object FileManageDlg: TFileManageDlg
  Left = 270
  Top = 161
  Width = 800
  Height = 631
  Caption = #32593#32476#25991#20214#31649#29702
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 220
    Top = 78
    Width = 10
    Height = 519
    Beveled = True
    ResizeStyle = rsLine
  end
  object plfilelist: TPanel
    Left = 230
    Top = 78
    Width = 562
    Height = 519
    Align = alClient
    BevelOuter = bvNone
    Caption = 'plfilelist'
    ParentColor = True
    TabOrder = 0
    object lvFileItem: TListView
      Left = 0
      Top = 41
      Width = 562
      Height = 435
      Hint = #28857#20987#21015#21487#20197#36827#34892#21015#20869#23481#30340#25490#24207#12290
      Align = alClient
      Columns = <
        item
          Caption = #25991#20214#21517
          Width = 350
        end
        item
          Caption = #29256#26412
          Width = 60
        end
        item
          Caption = #32534#36753#26102#38388
          Width = 180
        end
        item
          Alignment = taRightJustify
          Caption = #22823#23567
          Width = 80
        end
        item
          Caption = #32534#36753#20154
          Width = 80
        end
        item
          Caption = #36335#24452
          Width = 300
        end>
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      PopupMenu = pmFile
      SmallImages = ImageListFileIcon
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = lvFileItemClick
      OnColumnClick = lvFileItemColumnClick
      OnCompare = lvFileItemCompare
      OnCustomDrawItem = lvFileItemCustomDrawItem
      OnCustomDrawSubItem = lvFileItemCustomDrawSubItem
    end
    object plFileTop: TPanel
      Left = 0
      Top = 0
      Width = 562
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object BitBtn3: TBitBtn
        Left = 123
        Top = 8
        Width = 100
        Height = 25
        Action = actFile_Openfile
        Caption = #25171#24320#25991#20214
        TabOrder = 0
      end
      object BitBtn4: TBitBtn
        Left = 234
        Top = 8
        Width = 100
        Height = 25
        Action = actFile_SaveFile
        Caption = #20445#23384#25991#20214
        TabOrder = 1
      end
      object BitBtn5: TBitBtn
        Left = 347
        Top = 8
        Width = 100
        Height = 25
        Action = actFile_UndoOpen
        Caption = #25764#28040#25171#24320
        TabOrder = 2
      end
      object BitBtn6: TBitBtn
        Left = 460
        Top = 8
        Width = 100
        Height = 25
        Action = actFile_Viewfile
        Caption = #27983#35272#25991#20214
        TabOrder = 3
      end
      object BitBtn7: TBitBtn
        Left = 12
        Top = 8
        Width = 100
        Height = 25
        Action = actFile_Newfile
        Caption = #26032#24314#25991#20214
        TabOrder = 4
      end
    end
    object plMainBottom: TPanel
      Left = 0
      Top = 476
      Width = 562
      Height = 43
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 2
      object Button7: TButton
        Left = 12
        Top = 9
        Width = 100
        Height = 25
        Action = actFile_AddFile
        TabOrder = 0
      end
      object Button8: TButton
        Left = 122
        Top = 9
        Width = 100
        Height = 25
        Action = actFile_DownLoadFIle
        TabOrder = 1
      end
      object BitBtn1: TBitBtn
        Left = 232
        Top = 9
        Width = 100
        Height = 25
        Action = actFile_Updatefile
        Caption = #26356#26032#25991#20214
        TabOrder = 2
      end
      object BitBtn2: TBitBtn
        Left = 342
        Top = 8
        Width = 100
        Height = 25
        Action = actFile_HistoryFile
        Caption = #21382#21490#29256#26412
        TabOrder = 3
      end
    end
  end
  object plTree: TPanel
    Left = 0
    Top = 78
    Width = 220
    Height = 519
    Align = alLeft
    TabOrder = 1
    object tvFileTree: TTreeView
      Left = 1
      Top = 1
      Width = 218
      Height = 517
      Align = alClient
      HideSelection = False
      Images = DM.ImageListTree
      Indent = 19
      PopupMenu = pmTree
      ReadOnly = True
      TabOrder = 0
      OnChange = tvFileTreeChange
      OnChanging = tvFileTreeChanging
      OnExpanding = tvFileTreeExpanding
    end
  end
  object plNoVisible: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 78
    Align = alTop
    Caption = 'plNoVisible'
    TabOrder = 2
    Visible = False
  end
  object OpenDialog1: TOpenDialog
    Filter = '*.*|*.*'
    Left = 607
    Top = 5
  end
  object SaveDialog: TSaveDialog
    Filter = '*.*|*.*'
    Left = 639
    Top = 5
  end
  object cdsQuery: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQueryEx2'
    Left = 16
    Top = 5
  end
  object ActionList1: TActionList
    Left = 712
    Top = 5
    object actFile_DeleteFIle: TAction
      Category = #25991#20214
      Caption = #21024#38500#25991#20214
      OnExecute = actFile_DeleteFIleExecute
      OnUpdate = actFile_DeleteFIleUpdate
    end
    object actTree_DeleteDir: TAction
      Category = #20998#37096
      Caption = #21024#38500#20998#37096
      Hint = #21024#38500#24403#21069#36873#25321#30340#20998#37096#65292#21024#38500#21518#26159#27704#20037#21024#38500#12290
      OnExecute = actTree_DeleteDirExecute
      OnUpdate = actTree_DeleteDirUpdate
    end
    object actFile_AddFile: TAction
      Category = #25991#20214
      Caption = #22686#21152#25991#20214
      OnExecute = actFile_AddFileExecute
    end
    object actFile_DownLoadFIle: TAction
      Category = #25991#20214
      Caption = #21478#23384#25991#20214
      OnExecute = actFile_DownLoadFIleExecute
      OnUpdate = actFile_DownLoadFIleUpdate
    end
    object actTree_AddDir: TAction
      Category = #20998#37096
      Caption = #22686#21152#20998#37096
      Hint = #22312#24403#21069#36873#25321#20998#37096#19979#38754#22686#21152#19968#20010#23376#20998#37096#12290
      OnExecute = actTree_AddDirExecute
    end
    object actFile_HistoryFile: TAction
      Category = #25991#20214
      Caption = #21382#21490#29256#26412
      Hint = #25991#20214#30340#21382#21490#29256#26412
      OnExecute = actFile_HistoryFileExecute
      OnUpdate = actFile_HistoryFileUpdate
    end
    object actFile_Updatefile: TAction
      Category = #25991#20214
      Caption = #26356#26032#25991#20214
      OnExecute = actFile_UpdatefileExecute
      OnUpdate = actFile_UpdatefileUpdate
    end
    object acFile_ShowNote: TAction
      Category = #25991#20214
      Caption = #25991#20214#35828#26126'...'
      OnExecute = acFile_ShowNoteExecute
      OnUpdate = acFile_ShowNoteUpdate
    end
    object actTree_ReName: TAction
      Category = #20998#37096
      Caption = #37325#21629#21517'...'
      Hint = #24403#21069#36873#25321#30340#20998#37096#37325#21629#21517#12290
      OnExecute = actTree_ReNameExecute
      OnUpdate = actTree_ReNameUpdate
    end
    object actFile_ReName: TAction
      Category = #25991#20214
      Caption = #37325#21629#21517'...'
      OnExecute = actFile_ReNameExecute
      OnUpdate = actFile_ReNameUpdate
    end
    object actFile_Openfile: TAction
      Category = #25991#20214
      Caption = #25171#24320#25991#20214
      OnExecute = actFile_OpenfileExecute
      OnUpdate = actFile_OpenfileUpdate
    end
    object actFile_SaveFile: TAction
      Category = #25991#20214
      Caption = #20445#23384#25991#20214
      OnExecute = actFile_SaveFileExecute
      OnUpdate = actFile_SaveFileUpdate
    end
    object actFile_UndoOpen: TAction
      Category = #25991#20214
      Caption = #25764#28040#25171#24320
      Hint = #25764#28040#24050#25171#24320#30340#25991#20214#12290
      OnExecute = actFile_UndoOpenExecute
      OnUpdate = actFile_UndoOpenUpdate
    end
    object actTree_OpenModlue: TAction
      Category = #20998#37096
      Caption = #25991#20214#30340#25171#24320#26041#24335'...'
      Hint = #35774#32622#36825#20010#30446#24405#19979#30340#25152#26377#25991#20214#30340#25171#24320#26041#24335#12290
      OnExecute = actTree_OpenModlueExecute
      OnUpdate = actTree_OpenModlueUpdate
    end
    object actFile_Viewfile: TAction
      Category = #25991#20214
      Caption = #27983#35272#25991#20214
      Hint = #27983#35272#26597#25214#25991#20214#20869#23481#20294#19981#33021#20462#25913#24182#20445#23384#12290
      OnExecute = actFile_ViewfileExecute
      OnUpdate = actFile_ViewfileUpdate
    end
    object actFile_SendMail: TAction
      Category = #25991#20214
      Caption = #21457#36865#21040#37038#31665
      Hint = #23558#36873#20013#30340#25991#20214#21457#36865#21040#25351#23450#30340#37038#31665#12290
      OnExecute = actFile_SendMailExecute
      OnUpdate = actFile_SendMailUpdate
    end
    object actFile_CopyAndPaste: TAction
      Category = #25991#20214
      Caption = #22797#21046#24182#36148#31896
      Hint = #25335#36125#24403#21069#30340#25991#20214#24182#22312#36825#20010#30446#24405#19979#31896#36148#12290
      OnExecute = actFile_CopyAndPasteExecute
      OnUpdate = actFile_CopyAndPasteUpdate
    end
    object actFile_Newfile: TAction
      Category = #25991#20214
      Caption = #26032#24314#25991#20214
      OnExecute = actFile_NewfileExecute
      OnUpdate = actFile_NewfileUpdate
    end
  end
  object pmTree: TPopupMenu
    AutoHotkeys = maManual
    Left = 607
    Top = 45
    object N5: TMenuItem
      Action = actTree_AddDir
    end
    object N1: TMenuItem
      Action = actTree_DeleteDir
    end
    object N7: TMenuItem
      Action = actTree_ReName
    end
    object N9: TMenuItem
      Action = actTree_OpenModlue
    end
  end
  object pmFile: TPopupMenu
    AutoHotkeys = maManual
    Left = 647
    Top = 45
    object N10: TMenuItem
      Action = actFile_Openfile
    end
    object N11: TMenuItem
      Action = actFile_SaveFile
    end
    object N12: TMenuItem
      Action = actFile_UndoOpen
    end
    object N6: TMenuItem
      Action = acFile_ShowNote
    end
    object N13: TMenuItem
      Caption = '-'
    end
    object N15: TMenuItem
      Action = actFile_CopyAndPaste
    end
    object N8: TMenuItem
      Action = actFile_ReName
    end
    object N16: TMenuItem
      Action = actFile_HistoryFile
    end
    object N14: TMenuItem
      Action = actFile_SendMail
    end
    object N17: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Action = actFile_AddFile
    end
    object N4: TMenuItem
      Action = actFile_DownLoadFIle
    end
    object N2: TMenuItem
      Action = actFile_DeleteFIle
    end
  end
  object cdsOpenMode: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 81
    Top = 7
  end
  object ImageListFileIcon: TImageList
    Left = 720
    Top = 45
  end
end
