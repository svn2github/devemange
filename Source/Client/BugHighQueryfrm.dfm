inherited BugHighQueryDlg: TBugHighQueryDlg
  Left = 360
  Top = 170
  BorderStyle = bsDialog
  Caption = #39640#32423#26597#35810
  ClientHeight = 448
  ClientWidth = 620
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object btn1: TBitBtn
    Left = 496
    Top = 408
    Width = 100
    Height = 25
    TabOrder = 1
    Kind = bkCancel
  end
  object btn2: TBitBtn
    Left = 376
    Top = 408
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
    Left = 203
    Top = 214
    Width = 194
    Height = 23
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
    TabOrder = 0
    OnChange = edtCodeChange
  end
  object chkSelectAll: TCheckBox
    Left = 24
    Top = 413
    Width = 73
    Height = 17
    Caption = #20840#36873
    TabOrder = 22
    OnClick = chkSelectAllClick
  end
  object btnAll: TBitBtn
    Left = 253
    Top = 408
    Width = 100
    Height = 25
    Caption = #20840#37096#38382#39064
    TabOrder = 23
    OnClick = btnAllClick
  end
  object cbbTreeID: TComboBox
    Left = 511
    Top = 36
    Width = 88
    Height = 23
    ItemHeight = 15
    TabOrder = 24
    Text = 'cbbTreeID'
    Visible = False
  end
  object cdsProject: TClientDataSet
    Tag = -1
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 368
  end
  object dsProject: TDataSource
    DataSet = cdsProject
    Left = 40
    Top = 400
  end
  object cdsBugType: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 368
  end
  object dsBugType: TDataSource
    DataSet = cdsBugType
    Left = 80
    Top = 400
  end
  object cdsAmdieVer: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 118
    Top = 368
  end
  object dsAmdieVer: TDataSource
    DataSet = cdsAmdieVer
    Left = 120
    Top = 400
  end
end
