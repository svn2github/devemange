inherited AddBugTreeNodeDlg: TAddBugTreeNodeDlg
  Left = 523
  Top = 286
  BorderStyle = bsDialog
  Caption = #22686#21152#39033#30446
  ClientHeight = 336
  ClientWidth = 508
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 16
    Top = 16
    Width = 471
    Height = 57
    Caption = #20174#23646
    TabOrder = 0
    object rbRoot: TRadioButton
      Left = 56
      Top = 24
      Width = 113
      Height = 17
      Caption = #26681#32467#28857
      TabOrder = 0
    end
    object rbSelectNode: TRadioButton
      Left = 240
      Top = 24
      Width = 113
      Height = 17
      Caption = #24403#21069#39033#30446
      TabOrder = 1
    end
  end
  object BitBtn1: TBitBtn
    Left = 265
    Top = 292
    Width = 100
    Height = 25
    Caption = #30830#23450'(&O)'
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 385
    Top = 292
    Width = 100
    Height = 25
    Caption = #21462#28040'(&C)'
    TabOrder = 2
    Kind = bkCancel
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 88
    Width = 473
    Height = 193
    Caption = #20869#23481
    TabOrder = 3
    object Label1: TLabel
      Left = 56
      Top = 32
      Width = 45
      Height = 15
      Caption = #21517#31216#65306
    end
    object Label2: TLabel
      Left = 26
      Top = 64
      Width = 75
      Height = 15
      Caption = #31435#39033#39033#30446#65306
    end
    object Label3: TLabel
      Left = 41
      Top = 96
      Width = 60
      Height = 15
      Caption = #25490#24207#21495#65306
    end
    object Label4: TLabel
      Left = 29
      Top = 127
      Width = 75
      Height = 15
      Caption = #21019#24314#26085#26399#65306
    end
    object lbl1: TLabel
      Left = 29
      Top = 155
      Width = 75
      Height = 15
      Caption = #19978#32423#32534#21495#65306
      Visible = False
    end
    object lbl2: TLabel
      Left = 240
      Top = 154
      Width = 84
      Height = 15
      Caption = '-1 '#20026#26681#32467#28857
      Visible = False
    end
    object edName: TEdit
      Left = 104
      Top = 30
      Width = 329
      Height = 23
      TabOrder = 0
    end
    object edProID: TEdit
      Left = 104
      Top = 62
      Width = 329
      Height = 23
      TabOrder = 1
      Text = '0'
      OnKeyPress = edProIDKeyPress
    end
    object edSort: TEdit
      Left = 104
      Top = 91
      Width = 329
      Height = 23
      TabOrder = 2
      Text = '0'
      OnKeyPress = edSortKeyPress
    end
    object dpAddDate: TDateTimePicker
      Left = 104
      Top = 122
      Width = 333
      Height = 23
      Date = 39408.450666400500000000
      Time = 39408.450666400500000000
      TabOrder = 3
    end
    object edtParentCode: TEdit
      Left = 105
      Top = 151
      Width = 121
      Height = 23
      TabOrder = 4
      Text = 'edtParentCode'
      Visible = False
      OnKeyPress = edtParentCodeKeyPress
    end
  end
end
