object ProgressForm: TProgressForm
  Left = 428
  Top = 245
  AutoSize = True
  BorderIcons = []
  BorderStyle = bsNone
  Caption = #35831#31245#20505'...'
  ClientHeight = 67
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 358
    Height = 67
    Color = clYellow
    TabOrder = 0
    object lblTitle: TLabel
      Left = 10
      Top = 11
      Width = 48
      Height = 12
      Caption = 'lblTitle'
      Transparent = True
    end
    object ProgressBar: TProgressBar
      Left = 7
      Top = 34
      Width = 345
      Height = 23
      Smooth = True
      TabOrder = 0
    end
  end
end
