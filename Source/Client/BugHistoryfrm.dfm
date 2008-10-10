inherited BugHistoryDlg: TBugHistoryDlg
  Left = 530
  Top = 148
  BorderStyle = bsDialog
  Caption = 'Bug'#22238#22797
  ClientHeight = 444
  ClientWidth = 492
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object dbctrlgrd1: TDBCtrlGrid
    Left = 0
    Top = 0
    Width = 492
    Height = 405
    AllowDelete = False
    AllowInsert = False
    Color = clBtnFace
    DataSource = ds1
    PanelBorder = gbNone
    PanelHeight = 81
    PanelWidth = 475
    ParentColor = False
    TabOrder = 0
    RowCount = 5
    SelectedColor = clMoneyGreen
    object dbmmoZCONTEXT: TDBMemo
      Left = 6
      Top = 7
      Width = 462
      Height = 67
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataField = 'ZCONTEXT'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 0
    end
  end
  object btn1: TBitBtn
    Left = 384
    Top = 414
    Width = 100
    Height = 25
    Cancel = True
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 1
  end
  object btn2: TBitBtn
    Left = 280
    Top = 414
    Width = 100
    Height = 25
    Caption = #30830#23450'(&O)'
    ModalResult = 1
    TabOrder = 2
  end
  object cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 23
    Top = 412
  end
  object ds1: TDataSource
    DataSet = cds1
    Left = 56
    Top = 412
  end
end
