object LoginDlg: TLoginDlg
  Left = 457
  Top = 284
  BorderStyle = bsDialog
  Caption = #29992#25143#30331#24405
  ClientHeight = 241
  ClientWidth = 453
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 20
    Top = 75
    Width = 104
    Height = 16
    Caption = #26381#21153#22120'IP'#22320#22336'='
  end
  object Label2: TLabel
    Left = 21
    Top = 129
    Width = 56
    Height = 16
    Caption = #29992#25143#21517'='
  end
  object Label3: TLabel
    Left = 23
    Top = 159
    Width = 56
    Height = 16
    Caption = #23494'  '#30721'='
  end
  object lbStutas: TLabel
    Left = 16
    Top = 200
    Width = 70
    Height = 14
    Caption = #30331#24405#26381#21153#22120
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label4: TLabel
    Left = 129
    Top = 99
    Width = 238
    Height = 14
    Caption = #26684#24335'= IP:'#31471#21475' '#20363#22914'=192.168.0.1:211'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object cbServerIP: TComboBox
    Left = 128
    Top = 73
    Width = 308
    Height = 24
    Color = clBtnFace
    Enabled = False
    ItemHeight = 16
    TabOrder = 0
    Text = 'localhost'
  end
  object edName: TEdit
    Left = 126
    Top = 125
    Width = 309
    Height = 24
    TabOrder = 1
    Text = 'admin'
  end
  object edPass: TEdit
    Left = 127
    Top = 157
    Width = 309
    Height = 24
    PasswordChar = '*'
    TabOrder = 2
    Text = '123456'
  end
  object btOK: TBitBtn
    Left = 217
    Top = 198
    Width = 100
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 3
    OnClick = btOKClick
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
  object btCancel: TBitBtn
    Left = 337
    Top = 198
    Width = 100
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
    Kind = bkCancel
  end
  object rbLocal: TRadioButton
    Left = 81
    Top = 23
    Width = 113
    Height = 17
    Caption = #26412#22320#36830#25509
    Checked = True
    TabOrder = 5
    TabStop = True
    OnClick = rbLocalClick
  end
  object rbRemoate: TRadioButton
    Left = 257
    Top = 23
    Width = 113
    Height = 17
    Caption = #36828#31243#36830#25509
    TabOrder = 6
    OnClick = rbRemoateClick
  end
end
