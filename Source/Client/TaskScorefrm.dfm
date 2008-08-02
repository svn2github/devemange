inherited TaskScoreDlg: TTaskScoreDlg
  Left = 429
  Top = 199
  BorderStyle = bsDialog
  Caption = #20219#21153#35780#20998
  ClientHeight = 385
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Label2: TLabel
    Left = 17
    Top = 156
    Width = 45
    Height = 15
    Caption = #28385#20998#65306
  end
  object Label3: TLabel
    Left = 28
    Top = 16
    Width = 75
    Height = 15
    Caption = #35780#20998#35268#21017#65306
  end
  object DBText1: TDBText
    Left = 87
    Top = 156
    Width = 200
    Height = 17
    Color = clSkyBlue
    DataField = 'ZPERFACT'
    DataSource = ProjectManageClientDlg.dsTaskUser
    ParentColor = False
  end
  object Label4: TLabel
    Left = 18
    Top = 243
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
  object Label6: TLabel
    Left = 64
    Top = 112
    Width = 183
    Height = 15
    Caption = #24037#26399#25552#21069'1/3 '#22686#21152#24635#20998#30340'5%'
  end
  object Label7: TLabel
    Left = 28
    Top = 96
    Width = 60
    Height = 15
    Caption = #38468#21152#20998#65306
  end
  object Label8: TLabel
    Left = 15
    Top = 202
    Width = 68
    Height = 15
    Caption = #20219#21153#20998#25968':'
  end
  object Label9: TLabel
    Left = 309
    Top = 203
    Width = 38
    Height = 15
    Caption = #31995#25968':'
  end
  object BitBtn1: TBitBtn
    Left = 402
    Top = 340
    Width = 100
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 290
    Top = 340
    Width = 100
    Height = 25
    TabOrder = 3
    Kind = bkOK
  end
  object dbedtZTASKSCORE: TDBEdit
    Left = 88
    Top = 187
    Width = 200
    Height = 45
    DataField = 'ZTASKSCORE'
    DataSource = ProjectManageClientDlg.dsTaskUser
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object dbedtZRATE: TDBEdit
    Left = 360
    Top = 184
    Width = 139
    Height = 45
    DataField = 'ZRATE'
    DataSource = ProjectManageClientDlg.dsTaskUser
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object dbmmoZREMASK: TDBMemo
    Left = 88
    Top = 240
    Width = 413
    Height = 71
    DataField = 'ZREMASK'
    DataSource = ProjectManageClientDlg.dsTaskUser
    TabOrder = 4
  end
end
