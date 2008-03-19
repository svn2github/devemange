inherited TaskScoreDlg: TTaskScoreDlg
  Left = 405
  Top = 266
  BorderStyle = bsDialog
  Caption = #20219#21153#35780#20998
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 72
    Top = 188
    Width = 75
    Height = 15
    Caption = #26368#21518#24471#20998#65306
  end
  object Label2: TLabel
    Left = 72
    Top = 156
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
    Top = 153
    Width = 200
    Height = 17
    Color = clSkyBlue
    DataField = 'ZPERFACT'
    DataSource = ProjectManageClientDlg.dsTaskUser
    ParentColor = False
  end
  object Label4: TLabel
    Left = 76
    Top = 242
    Width = 45
    Height = 15
    Caption = #22791#27880#65306
  end
  object Label5: TLabel
    Left = 64
    Top = 40
    Width = 99
    Height = 15
    Caption = #20195#30721#25972#27905#21344' 5%'
  end
  object Bevel1: TBevel
    Left = 11
    Top = 141
    Width = 494
    Height = 13
    Shape = bsTopLine
  end
  object BitBtn1: TBitBtn
    Left = 401
    Top = 284
    Width = 100
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 289
    Top = 284
    Width = 100
    Height = 25
    TabOrder = 3
    Kind = bkOK
  end
  object DBEdit1: TDBEdit
    Left = 152
    Top = 182
    Width = 200
    Height = 45
    DataField = 'ZSCORE'
    DataSource = ProjectManageClientDlg.dsTaskUser
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 152
    Top = 235
    Width = 345
    Height = 23
    DataField = 'ZREMASK'
    DataSource = ProjectManageClientDlg.dsTaskUser
    TabOrder = 1
  end
end
