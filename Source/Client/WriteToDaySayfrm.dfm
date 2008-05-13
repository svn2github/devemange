inherited WriteToDaySayDlg: TWriteToDaySayDlg
  Left = 308
  Top = 236
  Width = 662
  Height = 458
  Caption = #27599#26085#19968#21477
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 654
    Height = 424
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ZID'
        Title.Alignment = taCenter
        Title.Caption = #24207#21495
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZNAME'
        Title.Alignment = taCenter
        Title.Caption = #20869#23481'('#21482#38480'100'#20010#23383')'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZDATE'
        Title.Alignment = taCenter
        Title.Caption = #26085#26399
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZSTOP'
        Title.Alignment = taCenter
        Title.Caption = #20572#27490
        Visible = True
      end>
  end
  object cdsSay: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsSayBeforePost
    OnNewRecord = cdsSayNewRecord
    Left = 40
    Top = 360
  end
  object DataSource1: TDataSource
    DataSet = cdsSay
    Left = 72
    Top = 360
  end
end
