inherited SetParamsDlg: TSetParamsDlg
  Left = 390
  Top = 195
  Width = 641
  Height = 404
  Caption = #21442#25968#35774#32622
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 0
    Top = 219
    Width = 633
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object dbgrdParams: TDBGrid
    Left = 0
    Top = 0
    Width = 633
    Height = 219
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
        Width = 338
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZVALUE'
        Title.Caption = #20869#23481
        Width = 91
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
  object dbmmoZVALUE: TDBMemo
    Left = 0
    Top = 222
    Width = 633
    Height = 108
    Align = alBottom
    DataField = 'ZVALUE'
    DataSource = dsParams
    TabOrder = 1
  end
  object pnlTool: TPanel
    Left = 0
    Top = 330
    Width = 633
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnView: TBitBtn
      Left = 509
      Top = 8
      Width = 100
      Height = 25
      Caption = #26597#30475#20869#23481
      TabOrder = 0
      OnClick = btnViewClick
    end
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
