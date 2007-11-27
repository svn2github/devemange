object FileHistoryListDlg: TFileHistoryListDlg
  Left = 331
  Top = 197
  BorderStyle = bsDialog
  Caption = #25991#20214#21382#21490#35760#24405
  ClientHeight = 592
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
    Caption = #20851#38381'(&C)'
    TabOrder = 0
    Kind = bkClose
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
      end
      item
        Caption = #26085#26399
        Width = 150
      end
      item
        Alignment = taRightJustify
        Caption = #22823#23567
        Width = 80
      end
      item
        Caption = #32534#36753#20154
        Width = 100
      end>
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
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
    Left = 32
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
