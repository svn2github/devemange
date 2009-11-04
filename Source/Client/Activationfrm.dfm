inherited ActivationDlg: TActivationDlg
  Left = 425
  Top = 250
  BorderStyle = bsDialog
  Caption = #28608#27963
  ClientHeight = 229
  ClientWidth = 605
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object lbl1: TLabel
    Left = 14
    Top = 17
    Width = 61
    Height = 15
    Caption = #20869#23481'ID'#65306
  end
  object lbl2: TLabel
    Left = 14
    Top = 46
    Width = 45
    Height = 15
    Caption = #26631#39064#65306
  end
  object lbl3: TLabel
    Left = 14
    Top = 76
    Width = 75
    Height = 15
    Caption = #21407#22240#20107#30001#65306
  end
  object edtID: TEdit
    Left = 99
    Top = 12
    Width = 180
    Height = 23
    ReadOnly = True
    TabOrder = 0
    Text = 'edtID'
  end
  object edtName: TEdit
    Left = 99
    Top = 41
    Width = 492
    Height = 23
    ReadOnly = True
    TabOrder = 1
    Text = 'edtName'
  end
  object mmoNote: TMemo
    Left = 99
    Top = 75
    Width = 492
    Height = 105
    TabOrder = 2
  end
  object Btn1: TBitBtn
    Left = 492
    Top = 193
    Width = 100
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
  object Btn2: TBitBtn
    Left = 380
    Top = 193
    Width = 100
    Height = 25
    TabOrder = 4
    Kind = bkOK
  end
end
