inherited SetParamsDlg: TSetParamsDlg
  Left = 410
  Top = 91
  Width = 641
  Height = 536
  Caption = #21442#25968#35774#32622
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 0
    Top = 387
    Width = 625
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object dbgrdParams: TDBGrid
    Left = 0
    Top = 89
    Width = 625
    Height = 298
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
        Title.Caption = #35828#26126
        Width = 80
        Visible = True
      end>
  end
  object dbmmoZVALUE: TDBMemo
    Left = 0
    Top = 390
    Width = 625
    Height = 108
    Align = alBottom
    DataField = 'ZVALUE'
    DataSource = dsParams
    TabOrder = 1
  end
  object mmo1: TMemo
    Left = 0
    Top = 0
    Width = 625
    Height = 89
    Align = alTop
    Color = clMoneyGreen
    Lines.Strings = (
      #21517#31216#37096#20998#26377#35268#23450':'
      '   '#21517#31216'='#21319#32423#29256#26412'V4 '#34920#31034#31995#32479#21319#32423#30340#20869#23481#12290' '
      '           = Calendar   '#34920#31034#26085#35760#65292#29616#22312#19981#29992#20102
      '           =LoginImageIndex '
      '           =ProductDownload '#20135#21697#27744#36335#24452
      '           =USVN   SVN'#30340#31649#29702#36335#24452
      '           =wiki   wiki'#30340#36335#24452
      '           ='#21319#32423#29256#26412'V4   '#21319#32423#30340#29256#26412)
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object cdsParams: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsParamsBeforePost
    Left = 64
    Top = 192
  end
  object dsParams: TDataSource
    DataSet = cdsParams
    Left = 32
    Top = 192
  end
end
