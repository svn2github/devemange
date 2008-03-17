inherited SelectUsersDlg: TSelectUsersDlg
  Left = 355
  Top = 293
  BorderStyle = bsDialog
  Caption = #36873#36873#25321#29992#25143
  ClientHeight = 433
  ClientWidth = 559
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 9
    Top = 8
    Width = 217
    Height = 353
    DataSource = DM.dsUsers
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
    Top = 9
    Width = 219
    Height = 357
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
    Left = 424
    Top = 392
    Width = 100
    Height = 25
    TabOrder = 4
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 312
    Top = 392
    Width = 100
    Height = 25
    TabOrder = 5
    Kind = bkOK
  end
  object lbUserCode: TListBox
    Left = 11
    Top = 374
    Width = 121
    Height = 34
    ItemHeight = 15
    TabOrder = 6
    Visible = False
  end
end
