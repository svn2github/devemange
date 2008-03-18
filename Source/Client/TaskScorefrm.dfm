inherited TaskScoreDlg: TTaskScoreDlg
  Left = 366
  Top = 367
  BorderStyle = bsDialog
  Caption = #20219#21153#35780#20998
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 72
    Top = 192
    Width = 75
    Height = 15
    Caption = #26368#21518#24471#20998#65306
  end
  object Label2: TLabel
    Left = 72
    Top = 152
    Width = 45
    Height = 15
    Caption = #28385#20998#65306
  end
  object Label3: TLabel
    Left = 40
    Top = 16
    Width = 75
    Height = 15
    Caption = #35780#20998#35268#21017#65306
  end
  object DBText1: TDBText
    Left = 151
    Top = 152
    Width = 200
    Height = 17
    Color = clSkyBlue
    DataField = 'ZPERFACT'
    DataSource = ProjectManageClientDlg.dsTaskUser
    ParentColor = False
  end
  object BitBtn1: TBitBtn
    Left = 384
    Top = 272
    Width = 100
    Height = 25
    TabOrder = 0
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 272
    Width = 100
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object DBEdit1: TDBEdit
    Left = 152
    Top = 188
    Width = 200
    Height = 23
    DataField = 'ZSCORE'
    DataSource = ProjectManageClientDlg.dsTaskUser
    TabOrder = 2
  end
end
