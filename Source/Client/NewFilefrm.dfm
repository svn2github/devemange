object NewFileDlg: TNewFileDlg
  Left = 372
  Top = 201
  BorderStyle = bsDialog
  Caption = #26032#24314#25991#20214
  ClientHeight = 363
  ClientWidth = 695
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 13
    Top = 16
    Width = 256
    Height = 16
    Caption = #35268#23450#26681#30446#24405#19979#30340#25152#26377#25991#20214#37117#26159#27169#26495#12290
  end
  object lvtemplatefiles: TListView
    Left = 13
    Top = 42
    Width = 667
    Height = 265
    Columns = <
      item
        Caption = #21517#31216
        Width = 350
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
      end>
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object BitBtn1: TBitBtn
    Left = 568
    Top = 320
    Width = 100
    Height = 25
    Caption = #21462#28040'(&C)'
    TabOrder = 1
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 447
    Top = 320
    Width = 100
    Height = 25
    Caption = #30830#23450'(&O)'
    Default = True
    TabOrder = 2
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object cdsFiles: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 320
  end
end
