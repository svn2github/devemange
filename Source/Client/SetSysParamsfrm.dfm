inherited SetParamsDlg: TSetParamsDlg
  Left = 361
  Top = 182
  Width = 641
  Height = 404
  Caption = #21442#25968#35774#32622
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object dbgrdParams: TDBGrid
    Left = 0
    Top = 0
    Width = 633
    Height = 370
    Align = alClient
    DataSource = dsParams
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ZNAME'
        ReadOnly = True
        Title.Caption = #21517#31216
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZVALUE'
        Title.Caption = #20869#23481
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZREMARK'
        ReadOnly = True
        Title.Caption = #35828#26126
        Width = 80
        Visible = True
      end>
  end
  object cdsParams: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsParamsBeforePost
    Left = 40
    Top = 16
  end
  object dsParams: TDataSource
    DataSet = cdsParams
    Left = 80
    Top = 16
  end
end
