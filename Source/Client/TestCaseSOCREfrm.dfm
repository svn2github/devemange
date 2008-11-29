inherited TestCaseSOCREDlg: TTestCaseSOCREDlg
  Left = 411
  Top = 270
  BorderStyle = bsDialog
  Caption = #27979#35797#35780#20998
  ClientHeight = 406
  ClientWidth = 493
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
  object lbl3: TLabel
    Left = 13
    Top = 133
    Width = 467
    Height = 225
    AutoSize = False
    Caption = 
      #8251#39640#13#10#31639#27861#30340#27979#35797#65307#27979#35797#20869#23481#28041#21450#21040#25307#26631#65292#25237#26631#65292#24320#26631#65292#35780#26631#12290#13#10'    '#13#10#8251#20013#13#10#20462#25913#20869#23481#19981#22810#12290#27979#35797#29992#20363#31616#21333#12290#27979#35797#30340#26102#38388#19981#38271#12290#13 +
      #10#13#10#8251#19968#33324#13#10#27979#35797#29992#20363#22522#26412#27809#26377#38382#39064#12290#13#10#13#10#8251#26080#25928#13#10#21482#26159#30028#38754#30340#25991#23383#30340#20462#25913#65292#21487#26159#27169#26495#21442#25968#30340#35774#32622#12290#13#10#13#10#8251#25187#20998#13#10' '#25552#20132#30340#24212#29992 +
      #31243#24207#26080#27861#36816#34892#65292#27979#35797#30340#31243#24207#25353#24120#35268#25805#20316#26377#38169#35823#30340#23545#35805#26694#65292#13#10#24182#27809#26377#25429#25417#21040#30340#12290'     '
    Color = clMoneyGreen
    ParentColor = False
  end
  object lbl4: TLabel
    Left = 13
    Top = 93
    Width = 85
    Height = 15
    Caption = #35828#21477#20844#36947#35805#65306
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
    Left = 380
    Top = 366
    Width = 100
    Height = 25
    TabOrder = 1
    Kind = bkCancel
  end
  object btnOk: TBitBtn
    Left = 276
    Top = 366
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
    Top = 128
  end
  object ds1: TDataSource
    DataSet = cds1
    Left = 64
    Top = 160
  end
end
