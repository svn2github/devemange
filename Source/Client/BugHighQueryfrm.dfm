inherited BugHighQueryDlg: TBugHighQueryDlg
  Left = 369
  Top = 123
  BorderStyle = bsDialog
  Caption = #39640#32423#26597#35810
  ClientHeight = 493
  ClientWidth = 620
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object btn1: TBitBtn
    Left = 482
    Top = 455
    Width = 100
    Height = 25
    TabOrder = 1
    Kind = bkCancel
  end
  object btn2: TBitBtn
    Left = 378
    Top = 455
    Width = 100
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object chktodayAmind: TCheckBox
    Left = 30
    Top = 141
    Width = 153
    Height = 17
    Caption = #35299#20915#30340#38382#39064#26102#38388':'
    TabOrder = 3
  end
  object dtpAmod: TDateTimePicker
    Left = 203
    Top = 141
    Width = 194
    Height = 23
    Date = 39648.739446967590000000
    Time = 39648.739446967590000000
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    TabOrder = 4
  end
  object btntoday: TBitBtn
    Left = 408
    Top = 137
    Width = 75
    Height = 25
    Caption = #20170#22825
    TabOrder = 5
    OnClick = btntodayClick
  end
  object btnyesterday: TBitBtn
    Left = 496
    Top = 137
    Width = 75
    Height = 25
    Caption = #26152#22825
    TabOrder = 6
    OnClick = btnyesterdayClick
  end
  object chktodayBug: TCheckBox
    Left = 30
    Top = 179
    Width = 137
    Height = 17
    Caption = #21019#24314#30340#38382#39064#26102#38388':'
    TabOrder = 7
  end
  object dtpBugday: TDateTimePicker
    Left = 203
    Top = 179
    Width = 194
    Height = 23
    Date = 39648.741306423610000000
    Time = 39648.741306423610000000
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    TabOrder = 8
  end
  object btntodayBug: TBitBtn
    Left = 407
    Top = 175
    Width = 75
    Height = 25
    Caption = #20170#22825
    TabOrder = 9
    OnClick = btntodayBugClick
  end
  object btnyesterdaybug: TBitBtn
    Left = 495
    Top = 175
    Width = 75
    Height = 25
    Caption = #26152#22825
    TabOrder = 10
    OnClick = btnyesterdaybugClick
  end
  object chkmodule: TCheckBox
    Left = 30
    Top = 44
    Width = 97
    Height = 17
    Caption = #25351#23450#27169#22359':'
    TabOrder = 11
    OnClick = chkmoduleClick
  end
  object cbbModule: TComboBox
    Left = 203
    Top = 39
    Width = 194
    Height = 23
    Style = csDropDownList
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    ItemHeight = 15
    TabOrder = 12
    OnChange = cbbModuleChange
  end
  object chkBugType: TCheckBox
    Left = 30
    Top = 214
    Width = 97
    Height = 17
    Caption = #38169#35823#31867#22411':'
    TabOrder = 13
  end
  object chkVersion: TCheckBox
    Left = 30
    Top = 72
    Width = 166
    Height = 17
    Caption = #25351#23450#20986#29616#38382#39064#30340#29256#26412':'
    TabOrder = 14
  end
  object dblkcbbVersion: TDBLookupComboBox
    Left = 203
    Top = 70
    Width = 194
    Height = 23
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    KeyField = 'ZID'
    ListField = 'ZVER'
    ListSource = dsProject
    TabOrder = 15
  end
  object btngetvesion: TBitBtn
    Left = 408
    Top = 68
    Width = 75
    Height = 53
    Caption = #33719#21462#29256#26412
    TabOrder = 16
    OnClick = btngetvesionClick
  end
  object dblkcbbBugtype: TDBLookupComboBox
    Left = 202
    Top = 212
    Width = 194
    Height = 23
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    KeyField = 'ZID'
    ListField = 'ZNAME'
    ListSource = dsBugType
    TabOrder = 17
  end
  object chkAmideBugVer: TCheckBox
    Left = 30
    Top = 103
    Width = 166
    Height = 17
    Caption = #25351#23450#35299#20915#38382#39064#30340#29256#26412':'
    TabOrder = 18
  end
  object dblkcbbAmdieVer: TDBLookupComboBox
    Left = 203
    Top = 101
    Width = 194
    Height = 23
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    KeyField = 'ZID'
    ListField = 'ZVER'
    ListSource = dsAmdieVer
    TabOrder = 19
  end
  object cbbModuleID: TComboBox
    Left = 408
    Top = 37
    Width = 97
    Height = 23
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    ItemHeight = 15
    TabOrder = 20
    Text = 'cbbModuleID'
    Visible = False
  end
  object chkCode: TCheckBox
    Left = 30
    Top = 16
    Width = 81
    Height = 17
    Caption = #32534#21495#65306
    TabOrder = 21
  end
  object edtCode: TEdit
    Left = 203
    Top = 11
    Width = 194
    Height = 23
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    TabOrder = 0
    OnChange = edtCodeChange
  end
  object btnAll: TBitBtn
    Left = 274
    Top = 455
    Width = 100
    Height = 25
    Caption = #20840#37096#38382#39064
    TabOrder = 22
    OnClick = btnAllClick
    Kind = bkAll
  end
  object cbbTreeID: TComboBox
    Left = 511
    Top = 36
    Width = 88
    Height = 23
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    ItemHeight = 15
    TabOrder = 23
    Text = 'cbbTreeID'
    Visible = False
  end
  object chkBugLevel: TCheckBox
    Left = 32
    Top = 246
    Width = 97
    Height = 17
    Caption = #38382#39064#31561#32423#65306
    TabOrder = 24
  end
  object dblkcbbBugLevel: TDBLookupComboBox
    Left = 202
    Top = 243
    Width = 194
    Height = 23
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    KeyField = 'ZID'
    ListField = 'ZNAME'
    ListSource = dsBugLevel
    TabOrder = 25
  end
  object chkStatus: TCheckBox
    Left = 32
    Top = 288
    Width = 97
    Height = 17
    Caption = #38382#39064#29366#24577#65306
    TabOrder = 26
  end
  object rg1: TRadioGroup
    Left = 200
    Top = 273
    Width = 368
    Height = 36
    Columns = 2
    Items.Strings = (
      #27809#26377#35299#20915
      #24050#35299#20915)
    TabOrder = 27
  end
  object chkBugCreateor: TCheckBox
    Left = 32
    Top = 328
    Width = 97
    Height = 17
    Caption = #38382#39064#21019#24314#20154':'
    TabOrder = 28
  end
  object cbBugAmdorer: TCheckBox
    Left = 32
    Top = 361
    Width = 97
    Height = 17
    Caption = #38382#39064#35299#20915#20154':'
    TabOrder = 29
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 202
    Top = 321
    Width = 201
    Height = 23
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    KeyField = 'ZID'
    ListField = 'ZNAME'
    ListSource = dsBugCreaeter
    TabOrder = 30
  end
  object dblkcbb1: TDBLookupComboBox
    Left = 202
    Top = 351
    Width = 201
    Height = 23
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    KeyField = 'ZID'
    ListField = 'ZNAME'
    ListSource = dsAmder
    TabOrder = 31
  end
  object chkTag: TCheckBox
    Left = 36
    Top = 423
    Width = 97
    Height = 17
    Caption = #26631#31614
    TabOrder = 32
  end
  object cbbTag: TComboBox
    Left = 202
    Top = 416
    Width = 199
    Height = 23
    Style = csDropDownList
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    ItemHeight = 15
    TabOrder = 33
  end
  object chkToWho: TCheckBox
    Left = 34
    Top = 388
    Width = 97
    Height = 17
    Caption = #25351#27966#32473#35841':'
    TabOrder = 34
  end
  object dblkcbb2: TDBLookupComboBox
    Left = 201
    Top = 383
    Width = 201
    Height = 23
    DropDownRows = 30
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    KeyField = 'ZID'
    ListField = 'ZNAME'
    ListSource = dsToWho
    TabOrder = 35
  end
  object cdsProject: TClientDataSet
    Tag = -1
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 208
  end
  object dsProject: TDataSource
    DataSet = cdsProject
    Left = 416
    Top = 240
  end
  object cdsBugType: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 208
  end
  object dsBugType: TDataSource
    DataSet = cdsBugType
    Left = 456
    Top = 240
  end
  object cdsAmdieVer: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 494
    Top = 208
  end
  object dsAmdieVer: TDataSource
    DataSet = cdsAmdieVer
    Left = 496
    Top = 240
  end
  object cdsBugLevel: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 208
  end
  object dsBugLevel: TDataSource
    DataSet = cdsBugLevel
    Left = 536
    Top = 240
  end
  object cdsBugCreater: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 317
  end
  object dsBugCreaeter: TDataSource
    DataSet = cdsBugCreater
    Left = 426
    Top = 349
  end
  object cdsBugAdmder: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 460
    Top = 316
  end
  object dsAmder: TDataSource
    DataSet = cdsBugAdmder
    Left = 461
    Top = 348
  end
  object cdsToWho: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 315
  end
  object dsToWho: TDataSource
    DataSet = cdsToWho
    Left = 497
    Top = 347
  end
end
