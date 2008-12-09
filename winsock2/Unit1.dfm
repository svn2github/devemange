object Form1: TForm1
  Left = 233
  Top = 162
  BorderStyle = bsDialog
  Caption = #32534#35793#26381#21153
  ClientHeight = 290
  ClientWidth = 863
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 12
  object lbl1: TLabel
    Left = 372
    Top = 255
    Width = 300
    Height = 12
    Caption = #24037#20855#26159#37197#21512#24320#21457#31649#29702#31995#32479#20351#29992#12290#20316#32773#65306#40857#20181#20113' 2008-12-7'
  end
  object lbl2: TLabel
    Left = 14
    Top = 186
    Width = 300
    Height = 96
    Caption = 
      'A'#21629#20196':'#13#10'   '#21462#20986#24403#21069#20301#32622#19978#30340'b.txt '#25991#26412#13#10'   '#36820#22238' -1 '#34920#31034#32534#35793#36824#27809#26377#23436#25104'.'#23436#25104#21518#23558#36820#22238#34892#30340#24635#25968#13#10#13#10'C'#21629#20196':' +
      #13#10'   '#26684#24335': C'#25991#20214#21517#13#10'   '#25191#34892'python'#25991#20214' c:\python25\python '#25991#20214#21517#13#10'   '
    Color = clMoneyGreen
    ParentColor = False
  end
  object grp2: TGroupBox
    Left = 11
    Top = 8
    Width = 834
    Height = 169
    Caption = #26381#21153#22120
    TabOrder = 0
    object lbl3: TLabel
      Left = 31
      Top = 141
      Width = 72
      Height = 12
      Caption = 'python.exe'#65306
    end
    object btn2: TButton
      Left = 32
      Top = 56
      Width = 153
      Height = 25
      Caption = #21551#21160#26381#21153
      TabOrder = 0
      OnClick = btn2Click
    end
    object mmo1: TMemo
      Left = 353
      Top = 15
      Width = 467
      Height = 140
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object edt2: TEdit
      Left = 32
      Top = 26
      Width = 161
      Height = 20
      TabOrder = 2
      Text = '192.168.1.80'
    end
    object edt3: TEdit
      Left = 200
      Top = 26
      Width = 121
      Height = 20
      TabOrder = 3
      Text = '8180'
    end
    object btn4: TButton
      Left = 32
      Top = 88
      Width = 153
      Height = 25
      Caption = #20851#38381#26381#21153
      TabOrder = 4
      OnClick = btn4Click
    end
    object btn7: TButton
      Left = 200
      Top = 87
      Width = 75
      Height = 25
      Caption = #28165#31354#26085#24535
      TabOrder = 5
      OnClick = btn7Click
    end
    object edt1: TEdit
      Left = 107
      Top = 137
      Width = 229
      Height = 20
      TabOrder = 6
      Text = 'c:\python25\python'
    end
  end
  object btn1: TButton
    Left = 746
    Top = 208
    Width = 100
    Height = 25
    Caption = #38544#34255#31383#21475
    TabOrder = 1
    OnClick = btn1Click
  end
  object idtcpsrvr1: TIdTCPServer
    Bindings = <
      item
        IP = '192.168.1.100'
        Port = 9876
      end>
    CommandHandlers = <>
    DefaultPort = 0
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
    OnConnect = idtcpsrvr1Connect
    OnExecute = idtcpsrvr1Execute
    OnDisconnect = idtcpsrvr1Disconnect
    OnException = idtcpsrvr1Exception
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    Left = 232
    Top = 24
  end
  object cltrycn1: TCoolTrayIcon
    CycleInterval = 0
    ShowHint = False
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF009999
      999999999999999999999999999994444F00F40F444444444444444444499C44
      4F00F40F444444444444444444499CC44F0F0F0F444444440000004444499CCC
      4F0F0F0F444440008888880044499CCCCF04F00F444008888888888804499CCC
      CF00000F4008F8F8F8F8888804499CCCCF04F00F0F8F88888888800004499CCC
      CF0F0040F8F8F8F8F800078804499CCCCCF0040F8F888F880077787804499CCC
      CCCFC0F8F8F8F8F00787878044499CCCCCCC0F8F8F8F80070878788044499CCC
      CCC0F8F8F8F807770787880444499CCCCCC0FFFF8F8077780878780444499CCC
      CC08F8F8F80F77870787804444499CCCCC0FFF8F80F0F7780878044444499CCC
      C0F8F8F8078F0F870787044444499CCCC0FF8FF07777F0F80880444444499CCC
      C0F8F8F077878F0F0804444444499CCC0FFFFF07777878F00044444444499CCC
      0FF8F000000000000F4F444444499CCC0FFFF07778787880F0F0F44444499CCC
      0FF807878787870CCF00F44444499CCC0FFF0778787870CCF000F44444499CCC
      0FF8078787800CCCCFFF0F4444499CCC0FF07878780CCCCCCCCCFF4444499CCC
      C0F0777700CCCCCCCCCCCC4444499CCCC0F07700CCCCCCCCCCCCCCC444499CCC
      CC0000CCCCCCCCCCCCCCCCCC44499CCCCCCCCCCCCCCCCCCCCCCCCCCCC4499CCC
      CCCCCCCCCCCCCCCCCCCCCCCCCC49999999999999999999999999999999990000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000}
    IconIndex = 0
    PopupMenu = pm1
    OnDblClick = cltrycn1DblClick
    Left = 576
    Top = 208
  end
  object pm1: TPopupMenu
    AutoHotkeys = maManual
    Left = 608
    Top = 208
    object N1: TMenuItem
      Caption = #26174#31034#31383#21475
      OnClick = N1Click
    end
  end
end
