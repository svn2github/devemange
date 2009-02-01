inherited TestCaseSOCREDlg: TTestCaseSOCREDlg
  Left = 363
  Top = 142
  BorderStyle = bsDialog
  Caption = #27979#35797#35780#20998
  ClientHeight = 482
  ClientWidth = 493
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object lbl1: TLabel
    Left = 13
    Top = 19
    Width = 375
    Height = 15
    Caption = #26681#25454#27979#35797#29992#20363#65292#23545#24320#21457#20154#21592#25552#20132#30340#29992#20363#36827#34892#25171#20998#35774#31561#32423#12290
  end
  object lbl2: TLabel
    Left = 13
    Top = 59
    Width = 75
    Height = 15
    Caption = #25171#20998#31561#32423#65306
  end
  object lbl4: TLabel
    Left = 13
    Top = 93
    Width = 90
    Height = 15
    Caption = #35828#21477#20844#36947#35805#65306
  end
  object lbl5: TLabel
    Left = 13
    Top = 225
    Width = 469
    Height = 51
    AutoSize = False
    Caption = #20013' (2'#20998')'#13#10#25253#34920#27979#35797#28041#21450#25968#25454#65292#23436#21892#24050#26377#30340#21151#33021#65292#20462#25913#20869#23481#19981#22810#12290#13#10#27979#35797#29992#20363#31616#21333#65292#27979#35797#29992#20363#23376#25968#24517#39035#26159'2~4'#20010#12290#13#10
    Color = clGreen
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lbl6: TLabel
    Left = 13
    Top = 280
    Width = 469
    Height = 57
    AutoSize = False
    Caption = #19968#33324'(1'#20998') '#13#10#27979#35797#29992#20363#20010#25968#24517#39035#36798#21040'1'#20010#20197#19978'('#21253#25324'1'#20010') '#65292#13#10#25253#34920#26684#24335#27979#35797','#31616#21333#30340#25968#25454#26657#23545#12290#13#10#13#10'  '
    Color = clOlive
    ParentColor = False
  end
  object lbl7: TLabel
    Left = 13
    Top = 341
    Width = 469
    Height = 41
    AutoSize = False
    Caption = #26080#25928'(0'#20998')'#13#10#26080#27979#35797#29992#20363#65292#25110#21482#26159#30028#38754#30340#25991#23383#20462#25913#19981#32473#20998#65292#21450#27169#26495#21442#25968#30340#35774#32622#13#10
    Color = clGray
    Font.Charset = GB2312_CHARSET
    Font.Color = clYellow
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lbl8: TLabel
    Left = 13
    Top = 386
    Width = 469
    Height = 48
    AutoSize = False
    Caption = #25187#20998'(-2'#20998')'#13#10#25552#20132#30340#24212#29992#31243#24207#26080#27861#36816#34892','#27979#35797#30340#31243#24207#25353#24120#35268#25805#20316#26377#38169#35823#23545#35805#26694#65292#13#10#24182#27809#26377#25429#25417#21040#12290#13#10
    Color = clRed
    ParentColor = False
  end
  object lbl3: TLabel
    Left = 13
    Top = 120
    Width = 469
    Height = 99
    AutoSize = False
    Caption = 
      #39640' (5'#20998')'#13#10#31639#27861#30340#27979#35797#65292#22823#37327#25968#25454#30340#35745#31639#65292#13#10#27979#35797#29992#20363#23376#25968#24517#39035#26159'5'#20010#20197#19978'('#21253#25324'5'#20010') 5'#20010#27809#26377#31867#20284#30340#13#10#22914' '#35780#26631#30340#35780#26631#26041#27861#30340#22686 +
      #21152#13#10'   '#35745#31639#36153#29992#34920#20540#13#10'   '#26032#22686#21151#33021#28041#21450#21040#25307#26631','#25237#26631','#24320#26631','#35780#26631';'#13#10'  '
    Color = clMoneyGreen
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object dblkcbbZCLOSESTATUS: TDBLookupComboBox
    Left = 99
    Top = 55
    Width = 265
    Height = 23
    KeyField = 'ZID'
    ListField = 'ZNAME'
    ListSource = ds1
    TabOrder = 0
  end
  object btnCancel: TBitBtn
    Left = 381
    Top = 448
    Width = 100
    Height = 25
    TabOrder = 1
    Kind = bkCancel
  end
  object btnOk: TBitBtn
    Left = 277
    Top = 448
    Width = 100
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object edt1: TEdit
    Left = 378
    Top = 55
    Width = 101
    Height = 23
    Color = clTeal
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    Text = '0'
  end
  object dbedtZREMORK: TDBEdit
    Left = 100
    Top = 88
    Width = 379
    Height = 23
    DataField = 'ZREMORK'
    DataSource = TestManageChildfrm.dsTestItem
    TabOrder = 4
  end
  object cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cds1AfterScroll
    Left = 64
    Top = 435
  end
  object ds1: TDataSource
    DataSet = cds1
    Left = 32
    Top = 435
  end
end
