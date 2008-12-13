inherited TestHighQueryDlg: TTestHighQueryDlg
  Left = 407
  Top = 232
  BorderStyle = bsDialog
  Caption = #39640#32423#26597#35810
  ClientHeight = 234
  ClientWidth = 486
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
    Left = 351
    Top = 180
    Width = 100
    Height = 25
    TabOrder = 6
    Kind = bkCancel
  end
  object btn2: TBitBtn
    Left = 247
    Top = 180
    Width = 100
    Height = 25
    TabOrder = 7
    Kind = bkOK
  end
  object chkTestUser: TCheckBox
    Left = 28
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
    Left = 125
    Top = 154
    Width = 113
    Height = 17
    Caption = #20851#38381#30340#29992#20363
    TabOrder = 10
  end
  object rbOpen: TRadioButton
    Left = 269
    Top = 154
    Width = 151
    Height = 17
    Caption = #27809#26377#20851#38381#30340#29992#20363
    TabOrder = 11
  end
  object btnAll: TBitBtn
    Left = 143
    Top = 180
    Width = 100
    Height = 25
    Caption = #20840#37096
    TabOrder = 12
    OnClick = btnAllClick
    Kind = bkAll
  end
  object chkStats: TCheckBox
    Left = 30
    Top = 152
    Width = 97
    Height = 17
    Caption = #29366#24577
    TabOrder = 13
  end
  object cdsPros: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 8
    Top = 179
  end
  object dsPros: TDataSource
    DataSet = cdsPros
    Left = 48
    Top = 179
  end
  object cdsCreateor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 161
    Top = 179
  end
  object dsCreateor: TDataSource
    DataSet = cdsCreateor
    Left = 200
    Top = 178
  end
  object cdsCoser: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 181
  end
  object dsCloser: TDataSource
    DataSet = cdsCoser
    Left = 124
    Top = 181
  end
end
