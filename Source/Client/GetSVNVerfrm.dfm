inherited GetSVNVerDlg: TGetSVNVerDlg
  Left = 261
  Top = 201
  BorderStyle = bsDialog
  Caption = #21462'SVN'#29256#26412#21495
  ClientHeight = 362
  ClientWidth = 788
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object lbl1: TLabel
    Left = 12
    Top = 15
    Width = 98
    Height = 15
    Caption = #30830#23450#29256#26412#21495#20026'='
  end
  object edtVer: TEdit
    Left = 115
    Top = 10
    Width = 133
    Height = 23
    TabOrder = 0
    Text = 'edtVer'
  end
  object dbgrd1: TDBGrid
    Left = 11
    Top = 44
    Width = 766
    Height = 174
    DataSource = ds1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = dbgrd1DrawColumnCell
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ZVERSION'
        Title.Alignment = taCenter
        Title.Caption = #29256#26412
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZAUTHOR'
        Title.Alignment = taCenter
        Title.Caption = #20316#32773
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZDATE'
        Title.Alignment = taCenter
        Title.Caption = #26085#26399
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZMESSAGETEXT'
        Title.Alignment = taCenter
        Title.Caption = #20449#24687
        Width = 375
        Visible = True
      end>
  end
  object btn1: TBitBtn
    Left = 678
    Top = 327
    Width = 100
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object btn2: TBitBtn
    Left = 574
    Top = 327
    Width = 100
    Height = 25
    TabOrder = 3
    Kind = bkOK
  end
  object btn3: TButton
    Left = 273
    Top = 8
    Width = 200
    Height = 25
    Caption = #35760#19981#28165#20102#65292#25105#26597#19968#19979#12290
    TabOrder = 4
    OnClick = btn3Click
  end
  object dbmmoZMESSAGE: TDBMemo
    Left = 11
    Top = 226
    Width = 766
    Height = 89
    DataField = 'ZMESSAGE'
    DataSource = ds1
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object ani1: TAnimate
    Left = 706
    Top = 3
    Width = 71
    Height = 39
    Visible = False
  end
  object chk15: TCheckBox
    Left = 504
    Top = 14
    Width = 88
    Height = 17
    Caption = #26174#31034'?'#26465'='
    TabOrder = 7
  end
  object edtCount: TEdit
    Left = 589
    Top = 11
    Width = 70
    Height = 23
    TabOrder = 8
    Text = '15'
  end
  object ds1: TDataSource
    DataSet = cds1
    Left = 16
    Top = 324
  end
  object cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cds1AfterScroll
    OnCalcFields = cds1CalcFields
    Left = 52
    Top = 324
  end
end
