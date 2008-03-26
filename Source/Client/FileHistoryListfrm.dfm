object FileHistoryListDlg: TFileHistoryListDlg
  Left = 331
  Top = 197
  BorderStyle = bsDialog
  Caption = #25991#20214#21382#21490#35760#24405
  ClientHeight = 578
  ClientWidth = 799
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  object BitBtn2: TBitBtn
    Left = 680
    Top = 536
    Width = 100
    Height = 25
    Cancel = True
    Caption = #20851#38381'(&C)'
    ModalResult = 2
    TabOrder = 1
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object lvfiles: TListView
    Left = 8
    Top = 16
    Width = 777
    Height = 249
    Columns = <
      item
        Caption = #25991#20214#21517
        Width = 300
      end
      item
        Caption = #29256#26412
        Width = 45
      end
      item
        Caption = #26085#26399
        Width = 180
      end
      item
        Caption = #22823#23567
        Width = 80
      end
      item
        Caption = #32534#36753#20154
        Width = 100
      end>
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnClick = lvfilesClick
  end
  object MemoNote: TMemo
    Left = 10
    Top = 280
    Width = 777
    Height = 233
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object btDnowfile: TBitBtn
    Left = 16
    Top = 536
    Width = 100
    Height = 25
    Caption = #21478#23384#25991#20214
    TabOrder = 3
    OnClick = btDnowfileClick
  end
  object cdsExec: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 608
    Top = 536
  end
end
