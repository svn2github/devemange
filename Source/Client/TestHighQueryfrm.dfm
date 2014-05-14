inherited TestHighQueryDlg: TTestHighQueryDlg
  Left = 412
  Top = 224
  BorderStyle = bsDialog
  Caption = #39640#32423#26597#35810
  ClientHeight = 364
  ClientWidth = 478
  OldCreateOrder = True
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object chkCode: TCheckBox
    Left = 26
    Top = 28
    Width = 81
    Height = 17
    Caption = #25353#32534#21495
    TabOrder = 0
  end
  object edtCode: TEdit
    Left = 124
    Top = 20
    Width = 321
    Height = 23
    TabOrder = 1
    OnChange = edtCodeChange
  end
  object chkProject: TCheckBox
    Left = 26
    Top = 58
    Width = 97
    Height = 17
    Caption = #25353#31435#39033#39033#30446
    TabOrder = 2
  end
  object dblkcbb1: TDBLookupComboBox
    Left = 124
    Top = 53
    Width = 321
    Height = 23
    DropDownRows = 30
    KeyField = 'ZID'
    ListField = 'ZNAME'
    ListSource = dsPros
    TabOrder = 3
  end
  object chkBuildUser: TCheckBox
    Left = 26
    Top = 89
    Width = 97
    Height = 17
    Caption = #25353#21019#24314#20154
    TabOrder = 4
  end
  object dblkcbb2: TDBLookupComboBox
    Left = 124
    Top = 86
    Width = 320
    Height = 23
    DropDownRows = 30
    KeyField = 'ZID'
    ListField = 'ZNAME'
    ListSource = dsCreateor
    TabOrder = 5
  end
  object btn1: TBitBtn
    Left = 353
    Top = 316
    Width = 100
    Height = 25
    TabOrder = 6
    Kind = bkCancel
  end
  object btn2: TBitBtn
    Left = 249
    Top = 316
    Width = 100
    Height = 25
    TabOrder = 7
    Kind = bkOK
  end
  object chkTestUser: TCheckBox
    Left = 26
    Top = 123
    Width = 89
    Height = 17
    Caption = #25353#27979#35797#20154
    TabOrder = 8
  end
  object dblkcbb3: TDBLookupComboBox
    Left = 124
    Top = 119
    Width = 320
    Height = 23
    DropDownRows = 30
    KeyField = 'ZID'
    ListField = 'ZNAME'
    ListSource = dsCloser
    TabOrder = 9
  end
  object rbClosed: TRadioButton
    Left = 122
    Top = 176
    Width = 113
    Height = 17
    Caption = #20851#38381#30340#29992#20363
    TabOrder = 10
  end
  object rbOpen: TRadioButton
    Left = 242
    Top = 176
    Width = 151
    Height = 17
    Caption = #27809#26377#20851#38381#30340#29992#20363
    TabOrder = 11
  end
  object btnAll: TBitBtn
    Left = 145
    Top = 315
    Width = 100
    Height = 25
    Caption = #20840#37096
    TabOrder = 12
    OnClick = btnAllClick
    Kind = bkAll
  end
  object chkStats: TCheckBox
    Left = 26
    Top = 152
    Width = 78
    Height = 17
    Caption = #29366#24577
    TabOrder = 13
  end
  object rbSubmit: TRadioButton
    Left = 122
    Top = 153
    Width = 98
    Height = 17
    Caption = #24050#25552#20132#27979#35797
    TabOrder = 14
  end
  object rbAction: TRadioButton
    Left = 242
    Top = 152
    Width = 165
    Height = 17
    Caption = #27963#21160'('#27809#26377#25552#20132')'
    TabOrder = 15
  end
  object chkSubmis: TCheckBox
    Left = 26
    Top = 208
    Width = 97
    Height = 17
    Caption = #25353#25552#20132#20154
    TabOrder = 16
  end
  object dblkcbb4: TDBLookupComboBox
    Left = 124
    Top = 201
    Width = 320
    Height = 23
    DropDownRows = 50
    KeyField = 'ZID'
    ListField = 'ZNAME'
    ListSource = dssubmis
    TabOrder = 17
  end
  object chkopendate: TCheckBox
    Left = 26
    Top = 240
    Width = 97
    Height = 17
    Caption = #21019#24314#26102#38388#65306
    TabOrder = 18
  end
  object dtpopendate: TDateTimePicker
    Left = 128
    Top = 234
    Width = 118
    Height = 23
    Date = 41773.469548101850000000
    Time = 41773.469548101850000000
    TabOrder = 19
  end
  object dtpopendate2: TDateTimePicker
    Left = 250
    Top = 234
    Width = 118
    Height = 23
    Date = 41773.469548101850000000
    Time = 41773.469548101850000000
    TabOrder = 20
  end
  object chkresultdate: TCheckBox
    Left = 26
    Top = 271
    Width = 97
    Height = 17
    Caption = #23436#25104#26102#38388#65306
    TabOrder = 21
  end
  object dtpresultdate: TDateTimePicker
    Left = 128
    Top = 265
    Width = 118
    Height = 23
    Date = 41773.469548101850000000
    Time = 41773.469548101850000000
    TabOrder = 22
  end
  object dtpresultdate2: TDateTimePicker
    Left = 250
    Top = 265
    Width = 118
    Height = 23
    Date = 41773.469548101850000000
    Time = 41773.469548101850000000
    TabOrder = 23
  end
  object cdsPros: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 10
    Top = 312
  end
  object dsPros: TDataSource
    DataSet = cdsPros
    Left = 45
    Top = 312
  end
  object cdsCreateor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 313
  end
  object dsCreateor: TDataSource
    DataSet = cdsCreateor
    Left = 178
    Top = 312
  end
  object cdsCoser: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 79
    Top = 313
  end
  object dsCloser: TDataSource
    DataSet = cdsCoser
    Left = 111
    Top = 313
  end
  object cdssubmis: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 210
    Top = 312
  end
  object dssubmis: TDataSource
    DataSet = cdssubmis
    Left = 244
    Top = 311
  end
end
