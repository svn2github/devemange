inherited TaskScoreDlg: TTaskScoreDlg
  Left = 344
  Top = 132
  BorderStyle = bsDialog
  Caption = #20219#21153#35780#20998
  ClientHeight = 487
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Label2: TLabel
    Left = 279
    Top = 291
    Width = 45
    Height = 15
    Caption = #28385#20998#65306
  end
  object Label3: TLabel
    Left = 15
    Top = 10
    Width = 75
    Height = 15
    Caption = #35780#20998#35268#21017#65306
  end
  object DBText1: TDBText
    Left = 338
    Top = 288
    Width = 163
    Height = 17
    Alignment = taRightJustify
    Color = clSkyBlue
    DataField = 'ZPERFACT'
    DataSource = ProjectManageClientDlg.dsTaskUser
    ParentColor = False
  end
  object Label4: TLabel
    Left = 18
    Top = 371
    Width = 45
    Height = 15
    Caption = #22791#27880#65306
  end
  object Bevel1: TBevel
    Left = 11
    Top = 272
    Width = 494
    Height = 13
    Shape = bsTopLine
  end
  object Label8: TLabel
    Left = 15
    Top = 330
    Width = 68
    Height = 15
    Caption = #20219#21153#20998#25968':'
  end
  object Label9: TLabel
    Left = 279
    Top = 331
    Width = 38
    Height = 15
    Caption = #31995#25968':'
  end
  object Label1: TLabel
    Left = 15
    Top = 291
    Width = 68
    Height = 15
    Caption = #33258#23450#20998#25968':'
  end
  object dbtxtZPERFACT: TDBText
    Left = 88
    Top = 288
    Width = 186
    Height = 17
    Alignment = taRightJustify
    Color = clSkyBlue
    DataField = 'ZSELFSCORE'
    DataSource = ProjectManageClientDlg.dsTaskUser
    ParentColor = False
  end
  object lbl1: TLabel
    Left = 183
    Top = 152
    Width = 8
    Height = 15
    Caption = '%'
  end
  object Label5: TLabel
    Left = 183
    Top = 181
    Width = 8
    Height = 15
    Caption = '%'
  end
  object Label6: TLabel
    Left = 184
    Top = 210
    Width = 7
    Height = 15
    Caption = '%'
  end
  object Label7: TLabel
    Left = 447
    Top = 151
    Width = 8
    Height = 15
    Caption = '%'
  end
  object Label10: TLabel
    Left = 447
    Top = 181
    Width = 8
    Height = 15
    Caption = '%'
  end
  object Label11: TLabel
    Left = 447
    Top = 207
    Width = 9
    Height = 15
    Caption = '%'
  end
  object BitBtn1: TBitBtn
    Left = 402
    Top = 452
    Width = 100
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 290
    Top = 452
    Width = 100
    Height = 25
    TabOrder = 4
    Kind = bkOK
  end
  object dbedtZTASKSCORE: TDBEdit
    Left = 88
    Top = 315
    Width = 186
    Height = 45
    Color = clSkyBlue
    DataField = 'ZTASKSCORE'
    DataSource = ProjectManageClientDlg.dsTaskUser
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object dbedtZRATE: TDBEdit
    Left = 338
    Top = 315
    Width = 163
    Height = 45
    Color = clSkyBlue
    DataField = 'ZRATE'
    DataSource = ProjectManageClientDlg.dsTaskUser
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object dbmmoZREMASK: TDBMemo
    Left = 88
    Top = 368
    Width = 413
    Height = 71
    DataField = 'ZREMASK'
    DataSource = ProjectManageClientDlg.dsTaskUser
    TabOrder = 5
  end
  object mmo1: TMemo
    Left = 15
    Top = 28
    Width = 487
    Height = 105
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    Lines.Strings = (
      #19968#12289#20219#21153#21333#30340#24037#20316#37327#22823#23567' 30%'
      #20108#12289#20219#21153#30340#38590#26131#31243#24230#21344' 30%'
      #19977#12289#20219#21153#21333#30340#25551#36848#31243#24230#21344' 10%  ('#26159#21542#31077#32454#22635#20889#20219#21153#21333#30340#25991#26723')'
      ' 1'#12289#21333#20803#35774#35745' '#21344' 7%'
      ' 2'#12289#21333#20803#27979#35797' '#21344' 3%'
      #22235#12289#26816#26597#20219#21153#21333#20195#30721#36136#37327',10%'
      ' 1'#12289#20195#30721#30340#20889#20070#26159#21542#31526#21512#35201#27714' 5%'
      ' 2'#12289#20195#30721#25191#34892#20013#26159#21542#26377#38169#35823'.5%'
      ''
      #27880#26126':'#20219#21153#21333#20869#20889#26126#20102#35299#20915'bug, '#20294'bug'#20869#27809#26377#25552#20132#20219#21153#21333#21017#19981#33021#25552#20132#23436
      #25104#20219
      #21153'. ')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object chkAmount: TCheckBox
    Left = 20
    Top = 152
    Width = 86
    Height = 17
    Caption = #24037#20316#37327#22823
    TabOrder = 6
  end
  object cbEasy: TCheckBox
    Left = 20
    Top = 180
    Width = 84
    Height = 17
    Caption = #38590#26131#31243#24230
    TabOrder = 7
  end
  object CheckUnitsDeiged: TCheckBox
    Left = 229
    Top = 152
    Width = 144
    Height = 17
    Caption = #21333#20803#35774#35745#26159#21542#31077#32454
    TabOrder = 8
  end
  object cbUnitTest: TCheckBox
    Left = 229
    Top = 180
    Width = 120
    Height = 17
    Caption = #26159#21542#21333#20803#27979#35797
    TabOrder = 9
  end
  object cbCode: TCheckBox
    Left = 21
    Top = 209
    Width = 84
    Height = 17
    Caption = #20195#30721#36136#37327
    TabOrder = 10
  end
  object btnCalc: TBitBtn
    Left = 397
    Top = 242
    Width = 100
    Height = 25
    Caption = #35745#31639#20998#25968
    TabOrder = 11
    OnClick = btnCalcClick
  end
  object chkOther: TCheckBox
    Left = 229
    Top = 209
    Width = 82
    Height = 17
    Caption = #20854#20182
    TabOrder = 12
  end
  object edtAmountRate: TEdit
    Left = 109
    Top = 148
    Width = 65
    Height = 23
    TabOrder = 13
    Text = '30'
  end
  object edtEasyRate: TEdit
    Left = 109
    Top = 176
    Width = 65
    Height = 23
    TabOrder = 14
    Text = '30'
  end
  object edtCodeRate: TEdit
    Left = 109
    Top = 204
    Width = 65
    Height = 23
    TabOrder = 15
    Text = '10'
  end
  object edtUnitDesig: TEdit
    Left = 373
    Top = 148
    Width = 65
    Height = 23
    TabOrder = 16
    Text = '7'
  end
  object edUnitsTestRate: TEdit
    Left = 373
    Top = 176
    Width = 65
    Height = 23
    TabOrder = 17
    Text = '3'
  end
  object edtOtherRate: TEdit
    Left = 373
    Top = 204
    Width = 65
    Height = 23
    TabOrder = 18
    Text = '20'
  end
end
