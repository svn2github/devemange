inherited TaskScoreDlg: TTaskScoreDlg
  Left = 468
  Top = 164
  BorderStyle = bsDialog
  Caption = #20219#21153#35780#20998
  ClientHeight = 385
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Label2: TLabel
    Left = 283
    Top = 159
    Width = 45
    Height = 15
    Caption = #28385#20998#65306
  end
  object Label3: TLabel
    Left = 20
    Top = 16
    Width = 75
    Height = 15
    Caption = #35780#20998#35268#21017#65306
  end
  object DBText1: TDBText
    Left = 335
    Top = 158
    Width = 163
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
  object Bevel1: TBevel
    Left = 11
    Top = 141
    Width = 494
    Height = 13
    Shape = bsTopLine
  end
  object Label8: TLabel
    Left = 15
    Top = 202
    Width = 68
    Height = 15
    Caption = #20219#21153#20998#25968':'
  end
  object Label9: TLabel
    Left = 297
    Top = 200
    Width = 38
    Height = 15
    Caption = #31995#25968':'
  end
  object Label1: TLabel
    Left = 15
    Top = 160
    Width = 68
    Height = 15
    Caption = #33258#23450#20998#25968':'
  end
  object dbtxtZPERFACT: TDBText
    Left = 89
    Top = 158
    Width = 171
    Height = 17
    Color = clSkyBlue
    DataField = 'ZSELFSCORE'
    DataSource = ProjectManageClientDlg.dsTaskUser
    ParentColor = False
  end
  object lbl1: TLabel
    Left = 56
    Top = 40
    Width = 105
    Height = 15
    Caption = #23454#29616#30340#38590#23481#31243#24230
  end
  object Label5: TLabel
    Left = 58
    Top = 64
    Width = 75
    Height = 15
    Caption = #20195#30721#30340#36136#37327
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
    Width = 197
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
    Left = 354
    Top = 184
    Width = 140
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
