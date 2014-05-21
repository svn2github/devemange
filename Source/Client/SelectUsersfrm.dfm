inherited SelectUsersDlg: TSelectUsersDlg
  Left = 229
  Top = 118
  BorderStyle = bsDialog
  Caption = #36873#25321#29992#25143
  ClientHeight = 479
  ClientWidth = 890
  OldCreateOrder = True
  Position = poMainFormCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object lblSelectSelfUser: TLabel
    Left = 648
    Top = 10
    Width = 227
    Height = 30
    Caption = #23433#35013#30446#24405#19979#26377#19968#20010#32463#24120#32852#31995#20154'.txt'#13#10#25105#30340#32463#24120#32852#31995#20154#65306
  end
  object lbl2: TLabel
    Left = 331
    Top = 33
    Width = 90
    Height = 15
    Caption = #36873#20013#30340#20154#21592#65306
  end
  object lbl3: TLabel
    Left = 12
    Top = 29
    Width = 90
    Height = 15
    Caption = #24211#20013#21487#36873#20154#65306
  end
  object DBGrid1: TDBGrid
    Left = 9
    Top = 48
    Width = 217
    Height = 313
    DataSource = DM.dsUserAll
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ZNAME'
        Title.Caption = #29992#25143#21517
        Width = 200
        Visible = True
      end>
  end
  object lbUsers: TListBox
    Left = 329
    Top = 72
    Width = 219
    Height = 289
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ItemHeight = 15
    TabOrder = 1
    OnDblClick = lbUsersDblClick
  end
  object btbnAdd: TBitBtn
    Left = 240
    Top = 144
    Width = 75
    Height = 25
    Caption = '>>'
    TabOrder = 2
    OnClick = btbnAddClick
  end
  object btbnDel: TBitBtn
    Left = 240
    Top = 192
    Width = 75
    Height = 25
    Caption = '<<'
    TabOrder = 3
    OnClick = btbnDelClick
  end
  object BitBtn1: TBitBtn
    Left = 432
    Top = 441
    Width = 100
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 328
    Top = 441
    Width = 100
    Height = 25
    Caption = #30830#23450
    TabOrder = 5
    Kind = bkOK
  end
  object lbUserCode: TListBox
    Left = 243
    Top = 14
    Width = 70
    Height = 34
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ItemHeight = 15
    TabOrder = 6
    Visible = False
  end
  object lstSelectSelf: TListBox
    Left = 654
    Top = 56
    Width = 219
    Height = 305
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ItemHeight = 15
    TabOrder = 7
    OnDblClick = lstSelectSelfDblClick
  end
  object btnAddBySelf: TBitBtn
    Left = 568
    Top = 152
    Width = 75
    Height = 25
    Caption = '<<'
    TabOrder = 8
    OnClick = btnAddBySelfClick
  end
  object btn2: TBitBtn
    Left = 19
    Top = 374
    Width = 200
    Height = 25
    Caption = #22686#21152#21040#24120#29992
    TabOrder = 9
    OnClick = btn2Click
  end
  object btnDelSelfSelect: TBitBtn
    Left = 670
    Top = 374
    Width = 200
    Height = 25
    Caption = ' '#21024#38500#32463#24120#32852#31995#20154
    TabOrder = 10
    OnClick = btnDelSelfSelectClick
  end
end
