object SetFileOpenModeDlg: TSetFileOpenModeDlg
  Left = 472
  Top = 281
  BorderStyle = bsDialog
  Caption = #35774#32622#25991#20214#25171#24320#26041#24335
  ClientHeight = 365
  ClientWidth = 635
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
  object cbInherit: TCheckBox
    Left = 24
    Top = 16
    Width = 217
    Height = 17
    Caption = #32487#25215#19978#32423#30446#24405#30340#25171#24320#26041#24335
    TabOrder = 0
    OnClick = cbInheritClick
  end
  object BitBtn1: TBitBtn
    Left = 497
    Top = 325
    Width = 100
    Height = 25
    Caption = #21462#28040'(&C)'
    TabOrder = 1
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 377
    Top = 325
    Width = 100
    Height = 25
    Caption = #30830#23450'(&O)'
    TabOrder = 2
    Kind = bkOK
  end
  object GroupBox1: TGroupBox
    Left = 22
    Top = 47
    Width = 593
    Height = 258
    Caption = #35774#32622
    TabOrder = 3
    object Label2: TLabel
      Left = 22
      Top = 159
      Width = 208
      Height = 16
      Caption = #29992#26469#25171#24320#25991#20214#30340#31243#24207'(*.exe)='
    end
    object Label1: TLabel
      Left = 21
      Top = 26
      Width = 80
      Height = 16
      Caption = #25991#20214#25193#23637#21517
    end
    object Label3: TLabel
      Left = 24
      Top = 81
      Width = 480
      Height = 16
      Caption = '('#22810#20010#25193#23637#21517#21487#20197#37319#29992';'#21495#20998#24320#12290#20363#22914': *.mlg;*.mlgc;*.mld;*.mlc) '
    end
    object edExt: TEdit
      Left = 23
      Top = 47
      Width = 538
      Height = 24
      TabOrder = 0
    end
    object edExe: TEdit
      Left = 24
      Top = 182
      Width = 537
      Height = 24
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 216
      Top = 219
      Width = 150
      Height = 25
      Caption = #36873#25321#31243#24207'...'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object btbnSetyonda: TBitBtn
      Left = 26
      Top = 109
      Width = 150
      Height = 25
      Caption = #27704#22823#24037#31243#25991#20214
      TabOrder = 3
      OnClick = btbnSetyondaClick
    end
    object btbnExcel: TBitBtn
      Left = 185
      Top = 109
      Width = 150
      Height = 25
      Caption = #30005#23376#34920#26684'Excel'#25991#20214
      TabOrder = 4
      OnClick = btbnExcelClick
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'exe'
    Filter = #31243#24207#25991#20214'(*.exe)|*.exe|'#25152#26377#25991#20214'(*.*)|*.*'
    Left = 104
    Top = 248
  end
end
