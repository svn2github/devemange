inherited ExtendWebManageDlg: TExtendWebManageDlg
  Left = 242
  Top = 95
  BorderStyle = bsDialog
  Caption = #25193#23637#24212#29992#31649#29702
  ClientHeight = 585
  ClientWidth = 645
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object spl1: TSplitter
    Left = 0
    Top = 277
    Width = 645
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object dbgrdItem: TDBGrid
    Left = 0
    Top = 0
    Width = 645
    Height = 137
    Align = alTop
    DataSource = dsData
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ZTYPE'
        Title.Caption = #31867#22411' 0=URL 1=HTML'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZNAME'
        Title.Caption = #21517#31216
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZSORT'
        Title.Caption = #25490#24207#21495
        Visible = True
      end>
  end
  object dbmmoValue: TDBMemo
    Left = 0
    Top = 137
    Width = 645
    Height = 140
    Align = alTop
    DataField = 'ZVALUE'
    DataSource = dsData
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object mmoHtmlEdit: TMemo
    Left = 0
    Top = 280
    Width = 645
    Height = 265
    Align = alClient
    Lines.Strings = (
      'mmoHtmlEdit')
    TabOrder = 2
  end
  object pnlButtom: TPanel
    Left = 0
    Top = 545
    Width = 645
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object bitEdit: TBitBtn
      Left = 8
      Top = 8
      Width = 100
      Height = 25
      Caption = #32534#36753#20869#23481
      TabOrder = 0
      OnClick = bitEditClick
    end
    object bitSaveContent: TBitBtn
      Left = 112
      Top = 8
      Width = 100
      Height = 25
      Caption = #20445#23384#20869#23481
      TabOrder = 1
      OnClick = bitSaveContentClick
    end
    object bntCancelSave: TBitBtn
      Left = 216
      Top = 8
      Width = 100
      Height = 25
      Caption = #25764#28040#20445#23384#20869#23481
      TabOrder = 2
      OnClick = bntCancelSaveClick
    end
    object bitAdd: TBitBtn
      Left = 320
      Top = 8
      Width = 100
      Height = 25
      Caption = #22686#21152#24212#29992
      TabOrder = 3
      OnClick = bitAddClick
    end
    object bitDel: TBitBtn
      Left = 424
      Top = 8
      Width = 100
      Height = 25
      Caption = #21024#38500#24212#29992
      TabOrder = 4
      OnClick = bitDelClick
    end
  end
  object cdsData: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsDataBeforePost
    OnNewRecord = cdsDataNewRecord
    Left = 16
    Top = 8
  end
  object dsData: TDataSource
    DataSet = cdsData
    Left = 48
    Top = 8
  end
end
