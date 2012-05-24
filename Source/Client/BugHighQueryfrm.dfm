inherited BugHighQueryDlg: TBugHighQueryDlg
  Left = 357
  Top = 136
  BorderStyle = bsDialog
  Caption = #39640#32423#26597#35810
  ClientHeight = 544
  ClientWidth = 620
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object btn1: TBitBtn
    Left = 482
    Top = 508
    Width = 100
    Height = 25
    TabOrder = 1
    Kind = bkCancel
  end
  object btn2: TBitBtn
    Left = 378
    Top = 508
    Width = 100
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object chktodayAmind: TCheckBox
    Left = 30
    Top = 122
    Width = 153
    Height = 17
    Caption = #35299#20915#30340#38382#39064#26102#38388':'
    TabOrder = 3
  end
  object dtpAmod: TDateTimePicker
    Left = 203
    Top = 119
    Width = 142
    Height = 23
    Date = 39648.739446967590000000
    Time = 39648.739446967590000000
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    TabOrder = 4
  end
  object btntoday: TBitBtn
    Left = 473
    Top = 118
    Width = 36
    Height = 25
    Caption = #20170#22825
    TabOrder = 5
    OnClick = btntodayClick
  end
  object btnyesterday: TBitBtn
    Left = 521
    Top = 118
    Width = 36
    Height = 25
    Caption = #26152#22825
    TabOrder = 6
    OnClick = btnyesterdayClick
  end
  object chktodayBug: TCheckBox
    Left = 30
    Top = 150
    Width = 137
    Height = 17
    Caption = #21019#24314#30340#38382#39064#26102#38388':'
    TabOrder = 7
  end
  object dtpBugday: TDateTimePicker
    Left = 203
    Top = 146
    Width = 142
    Height = 23
    Date = 39648.741306423610000000
    Time = 39648.741306423610000000
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    TabOrder = 8
  end
  object btntodayBug: TBitBtn
    Left = 472
    Top = 148
    Width = 36
    Height = 25
    Caption = #20170#22825
    TabOrder = 9
    OnClick = btntodayBugClick
  end
  object btnyesterdaybug: TBitBtn
    Left = 521
    Top = 148
    Width = 36
    Height = 25
    Caption = #26152#22825
    TabOrder = 10
    OnClick = btnyesterdaybugClick
  end
  object chkmodule: TCheckBox
    Left = 30
    Top = 43
    Width = 97
    Height = 17
    Caption = #25351#23450#27169#22359':'
    TabOrder = 11
    OnClick = chkmoduleClick
  end
  object cbbModule: TComboBox
    Left = 203
    Top = 38
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
    Top = 208
    Width = 97
    Height = 17
    Caption = #38169#35823#31867#22411':'
    TabOrder = 13
  end
  object chkVersion: TCheckBox
    Left = 30
    Top = 70
    Width = 166
    Height = 17
    Caption = #25351#23450#20986#29616#38382#39064#30340#29256#26412':'
    TabOrder = 14
  end
  object dblkcbbVersion: TDBLookupComboBox
    Left = 203
    Top = 65
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
    Height = 45
    Caption = #33719#21462#29256#26412
    TabOrder = 16
    OnClick = btngetvesionClick
  end
  object dblkcbbBugtype: TDBLookupComboBox
    Left = 202
    Top = 205
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
    Top = 96
    Width = 166
    Height = 17
    Caption = #25351#23450#35299#20915#38382#39064#30340#29256#26412':'
    TabOrder = 18
  end
  object dblkcbbAmdieVer: TDBLookupComboBox
    Left = 203
    Top = 92
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
    Top = 7
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
    Top = 508
    Width = 100
    Height = 25
    Caption = #20840#37096#38382#39064
    TabOrder = 22
    OnClick = btnAllClick
    Kind = bkAll
  end
  object cbbTreeID: TComboBox
    Left = 511
    Top = 6
    Width = 88
    Height = 23
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    ItemHeight = 15
    TabOrder = 23
    Text = 'cbbTreeID'
    Visible = False
  end
  object chkBugLevel: TCheckBox
    Left = 30
    Top = 235
    Width = 97
    Height = 17
    Caption = #38382#39064#31561#32423#65306
    TabOrder = 24
  end
  object dblkcbbBugLevel: TDBLookupComboBox
    Left = 202
    Top = 232
    Width = 194
    Height = 23
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    KeyField = 'ZID'
    ListField = 'ZNAME'
    ListSource = dsBugLevel
    TabOrder = 25
  end
  object chkStatus: TCheckBox
    Left = 30
    Top = 270
    Width = 97
    Height = 17
    Caption = #38382#39064#29366#24577#65306
    TabOrder = 26
  end
  object rg1: TRadioGroup
    Left = 200
    Top = 259
    Width = 368
    Height = 36
    Columns = 2
    Items.Strings = (
      #27809#26377#35299#20915
      #24050#35299#20915)
    TabOrder = 27
  end
  object chkBugCreateor: TCheckBox
    Left = 30
    Top = 308
    Width = 97
    Height = 17
    Caption = #38382#39064#21019#24314#20154':'
    TabOrder = 28
  end
  object cbBugAmdorer: TCheckBox
    Left = 30
    Top = 338
    Width = 97
    Height = 17
    Caption = #38382#39064#35299#20915#20154':'
    TabOrder = 29
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 202
    Top = 303
    Width = 201
    Height = 23
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    KeyField = 'ZID'
    ListField = 'ZNAME'
    ListSource = dsBugCreaeter
    TabOrder = 30
    OnCloseUp = DBLookupComboBox1CloseUp
  end
  object dblkcbb1: TDBLookupComboBox
    Left = 202
    Top = 330
    Width = 201
    Height = 23
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    KeyField = 'ZID'
    ListField = 'ZNAME'
    ListSource = dsAmder
    TabOrder = 31
  end
  object chkTag: TCheckBox
    Left = 30
    Top = 416
    Width = 97
    Height = 17
    Caption = #26631#31614':'
    TabOrder = 32
  end
  object cbbTag: TComboBox
    Left = 202
    Top = 414
    Width = 199
    Height = 23
    Style = csDropDownList
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    ItemHeight = 15
    TabOrder = 33
  end
  object chkToWho: TCheckBox
    Left = 30
    Top = 364
    Width = 97
    Height = 17
    Caption = #25351#27966#32473#35841':'
    TabOrder = 34
  end
  object dblkcbb2: TDBLookupComboBox
    Left = 202
    Top = 357
    Width = 201
    Height = 23
    DropDownRows = 30
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    KeyField = 'ZID'
    ListField = 'ZNAME'
    ListSource = dsToWho
    TabOrder = 35
  end
  object edtName: TEdit
    Left = 202
    Top = 441
    Width = 377
    Height = 23
    TabOrder = 36
  end
  object chkName: TCheckBox
    Left = 30
    Top = 444
    Width = 155
    Height = 17
    Caption = #38382#39064#21517#31216#27169#31946#26597#25214#65306
    TabOrder = 37
  end
  object dtpAmod2: TDateTimePicker
    Left = 349
    Top = 119
    Width = 118
    Height = 23
    Date = 39648.739446967590000000
    Time = 39648.739446967590000000
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    TabOrder = 38
  end
  object dtpBugday2: TDateTimePicker
    Left = 349
    Top = 146
    Width = 118
    Height = 23
    Date = 39648.741306423610000000
    Time = 39648.741306423610000000
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    TabOrder = 39
  end
  object chkNeedDate: TCheckBox
    Left = 30
    Top = 176
    Width = 121
    Height = 17
    Caption = #35201#27714#23436#25104#26102#38388#65306
    TabOrder = 40
  end
  object dtpNeed: TDateTimePicker
    Left = 203
    Top = 173
    Width = 142
    Height = 23
    Date = 39648.741306423610000000
    Time = 39648.741306423610000000
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    TabOrder = 41
  end
  object dtpNeed2: TDateTimePicker
    Left = 349
    Top = 173
    Width = 118
    Height = 23
    Date = 39648.741306423610000000
    Time = 39648.741306423610000000
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    TabOrder = 42
  end
  object chkSubToWho: TCheckBox
    Left = 31
    Top = 388
    Width = 97
    Height = 17
    Caption = #20174#25351#27966#32473#35841':'
    TabOrder = 43
  end
  object dblkcbb3: TDBLookupComboBox
    Left = 203
    Top = 382
    Width = 201
    Height = 23
    DropDownRows = 30
    KeyField = 'ZID'
    ListField = 'ZNAME'
    ListSource = dsSubToWho
    TabOrder = 44
  end
  object edtMutilModule: TEdit
    Left = 476
    Top = 38
    Width = 121
    Height = 23
    TabOrder = 45
  end
  object chkMutilModule: TCheckBox
    Left = 408
    Top = 42
    Width = 65
    Height = 17
    Caption = #22810#27169#22359
    TabOrder = 46
  end
  object btnSave: TBitBtn
    Left = 24
    Top = 508
    Width = 100
    Height = 25
    Caption = #20445#23384#26597#35810'...'
    TabOrder = 47
    OnClick = btnSaveClick
  end
  object chkMutilCreateor: TCheckBox
    Left = 410
    Top = 306
    Width = 95
    Height = 17
    Caption = #22810#21019#24314#20154
    TabOrder = 48
  end
  object edtMutilCreateor: TEdit
    Left = 494
    Top = 303
    Width = 95
    Height = 23
    TabOrder = 49
  end
  object chkNeed: TCheckBox
    Left = 31
    Top = 472
    Width = 97
    Height = 17
    Caption = #38656#35201#19981#26126#30830
    TabOrder = 50
  end
  object cbbNeed: TComboBox
    Left = 203
    Top = 467
    Width = 145
    Height = 23
    Style = csDropDownList
    ItemHeight = 15
    TabOrder = 51
    Items.Strings = (
      #21542
      #26159)
  end
  object cdsProject: TClientDataSet
    Tag = -1
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 200
  end
  object dsProject: TDataSource
    DataSet = cdsProject
    Left = 416
    Top = 232
  end
  object cdsBugType: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 200
  end
  object dsBugType: TDataSource
    DataSet = cdsBugType
    Left = 456
    Top = 232
  end
  object cdsAmdieVer: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 494
    Top = 200
  end
  object dsAmdieVer: TDataSource
    DataSet = cdsAmdieVer
    Left = 496
    Top = 232
  end
  object cdsBugLevel: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 200
  end
  object dsBugLevel: TDataSource
    DataSet = cdsBugLevel
    Left = 536
    Top = 232
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
  object cdsSubToWho: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 533
    Top = 316
  end
  object dsSubToWho: TDataSource
    DataSet = cdsSubToWho
    Left = 534
    Top = 348
  end
end
