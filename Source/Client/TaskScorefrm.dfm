inherited TaskScoreDlg: TTaskScoreDlg
  Left = 370
  Top = 124
  BorderStyle = bsDialog
  Caption = #20219#21153#35780#20998
  ClientHeight = 659
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Label2: TLabel
    Left = 279
    Top = 462
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
    Top = 459
    Width = 163
    Height = 17
    Alignment = taRightJustify
    Color = clSkyBlue
    DataField = 'ZPERFACT'
    DataSource = ProjectManageClientDlg.dsTaskUser
    ParentColor = False
  end
  object Label4: TLabel
    Left = 15
    Top = 543
    Width = 45
    Height = 15
    Caption = #22791#27880#65306
  end
  object Bevel1: TBevel
    Left = 11
    Top = 449
    Width = 494
    Height = 13
    Shape = bsTopLine
  end
  object Label8: TLabel
    Left = 15
    Top = 502
    Width = 68
    Height = 15
    Caption = #20219#21153#20998#25968':'
  end
  object Label9: TLabel
    Left = 279
    Top = 503
    Width = 38
    Height = 15
    Caption = #31995#25968':'
  end
  object Label1: TLabel
    Left = 15
    Top = 462
    Width = 68
    Height = 15
    Caption = #33258#23450#20998#25968':'
  end
  object dbtxtZPERFACT: TDBText
    Left = 88
    Top = 459
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
    Top = 35
    Width = 8
    Height = 15
    Caption = '%'
  end
  object Label5: TLabel
    Left = 183
    Top = 109
    Width = 8
    Height = 15
    Caption = '%'
  end
  object Label6: TLabel
    Left = 184
    Top = 236
    Width = 8
    Height = 15
    Caption = '%'
  end
  object Label7: TLabel
    Left = 183
    Top = 135
    Width = 8
    Height = 15
    Caption = '%'
  end
  object Label10: TLabel
    Left = 183
    Top = 208
    Width = 8
    Height = 15
    Caption = '%'
  end
  object Label11: TLabel
    Left = 183
    Top = 323
    Width = 8
    Height = 15
    Caption = '%'
  end
  object lbl3: TLabel
    Left = 200
    Top = 110
    Width = 285
    Height = 15
    Caption = #65288#20961#26159#39640#32423#19978#20197#30340#31243#24207#21592#21344#26377#27604#20363#35201#22823#28857#65289
  end
  object lbl4: TLabel
    Left = 36
    Top = 162
    Width = 391
    Height = 15
    Caption = '('#20170#22825#28608#27963#19968#20010' 5%  '#20170#22825#28608#27963#20108#20010#20197#19978' 3% , '#26080#28608#27963' 7% )'
    WordWrap = True
  end
  object lbl5: TLabel
    Left = 201
    Top = 208
    Width = 298
    Height = 15
    Caption = '('#20170#22825#26080#27979#35797#29992#20363#21017' 3% '#19968#20010'5% '#19968#20010#20197#19978'8%)'
  end
  object lbl6: TLabel
    Left = 48
    Top = 264
    Width = 431
    Height = 60
    Caption = 
      '1.'#20219#21153#21333#26159#28857#20889#25353#35268#26684#26469','#25552#20132#30340'svn'#26159#21542#25353#35268#26684#26469','#20195#30721#26816#26597#21518#26377#27809#26377#25353#35268#21017#26469#20889#13#10'2.'#25552#20132#30340#20195#30721#21040'svn'#26381#21153#22120#32534#35793#20986#38169#20943' 2%.' +
      #13#10
    WordWrap = True
  end
  object lbl7: TLabel
    Left = 201
    Top = 323
    Width = 204
    Height = 15
    Caption = '('#20170#22825#24635#31639#30495#27491#20026#39033#30446#36129#29486#20102') '
  end
  object lbl8: TLabel
    Left = 80
    Top = 58
    Width = 237
    Height = 45
    Caption = #22914#20170#22825#27809#26377#29992#20363#25552#20132' '#26368#22810#21482#33021' 25%'#13#10#22914#20170#22825#27809#26377'svn'#25552#20132' '#26368#22810#21482#33021' 20 %'#13#10
  end
  object BitBtn1: TBitBtn
    Left = 397
    Top = 620
    Width = 100
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 293
    Top = 620
    Width = 100
    Height = 25
    TabOrder = 3
    Kind = bkOK
  end
  object dbedtZTASKSCORE: TDBEdit
    Left = 88
    Top = 487
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
    TabOrder = 0
  end
  object dbedtZRATE: TDBEdit
    Left = 338
    Top = 487
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
    TabOrder = 1
  end
  object dbmmoZREMASK: TDBMemo
    Left = 88
    Top = 540
    Width = 413
    Height = 71
    DataField = 'ZREMASK'
    DataSource = ProjectManageClientDlg.dsTaskUser
    TabOrder = 4
  end
  object chkAmount: TCheckBox
    Left = 20
    Top = 35
    Width = 86
    Height = 17
    Caption = #24037#20316#37327#22823
    TabOrder = 5
  end
  object cbEasy: TCheckBox
    Left = 20
    Top = 108
    Width = 84
    Height = 17
    Caption = #38590#26131#31243#24230
    TabOrder = 6
  end
  object CheckUnitsDeiged: TCheckBox
    Left = 20
    Top = 136
    Width = 86
    Height = 17
    Caption = #21333#20803#35774#35745' '
    TabOrder = 7
  end
  object cbUnitTest: TCheckBox
    Left = 20
    Top = 206
    Width = 83
    Height = 17
    Caption = #21333#20803#27979#35797
    TabOrder = 8
  end
  object cbCode: TCheckBox
    Left = 20
    Top = 237
    Width = 84
    Height = 17
    Caption = #20195#30721#36136#37327
    TabOrder = 9
  end
  object btnCalc: TBitBtn
    Left = 405
    Top = 355
    Width = 100
    Height = 25
    Caption = #35745#31639#20998#25968
    TabOrder = 10
    OnClick = btnCalcClick
  end
  object chkOther: TCheckBox
    Left = 20
    Top = 324
    Width = 83
    Height = 17
    Caption = #26377#25104#26524#21527' '
    TabOrder = 11
  end
  object edtAmountRate: TEdit
    Left = 109
    Top = 31
    Width = 65
    Height = 23
    TabOrder = 12
    Text = '30'
  end
  object edtEasyRate: TEdit
    Left = 109
    Top = 104
    Width = 65
    Height = 23
    TabOrder = 13
    Text = '30'
  end
  object edtCodeRate: TEdit
    Left = 109
    Top = 234
    Width = 65
    Height = 23
    TabOrder = 14
    Text = '10'
  end
  object edtUnitDesig: TEdit
    Left = 109
    Top = 132
    Width = 65
    Height = 23
    TabOrder = 15
    Text = '7'
  end
  object edUnitsTestRate: TEdit
    Left = 109
    Top = 203
    Width = 65
    Height = 23
    TabOrder = 16
    Text = '8'
  end
  object edtOtherRate: TEdit
    Left = 109
    Top = 319
    Width = 65
    Height = 23
    TabOrder = 17
    Text = '15'
  end
end
