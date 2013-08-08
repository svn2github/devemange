object Form1: TForm1
  Left = 213
  Top = 139
  Width = 871
  Height = 377
  Caption = #32534#35793#26381#21153
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
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
    object lbl2: TLabel
      Left = 360
      Top = 18
      Width = 300
      Height = 96
      Caption = 
        'A'#21629#20196':'#13#10'   '#21462#20986#24403#21069#20301#32622#19978#30340'b.txt '#25991#26412#13#10'   '#36820#22238' -1 '#34920#31034#32534#35793#36824#27809#26377#23436#25104'.'#23436#25104#21518#23558#36820#22238#34892#30340#24635#25968#13#10#13#10'C'#21629#20196':' +
        #13#10'   '#26684#24335': C'#25991#20214#21517#13#10'   '#25191#34892'python'#25991#20214' c:\python25\python '#25991#20214#21517#13#10'   '#22914'.py'#25991#20214'do' +
        'svn.bat ,'#20250#20808#25191#34892' 2012-223'
      Color = clMoneyGreen
      ParentColor = False
    end
    object lbl1: TLabel
      Left = 372
      Top = 141
      Width = 306
      Height = 12
      Caption = #24037#20855#26159#37197#21512#24320#21457#31649#29702#31995#32479#20351#29992#12290#20316#32773#65306#40857#20181#20113' 2013-08-08'
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
    object edt2: TEdit
      Left = 32
      Top = 26
      Width = 161
      Height = 20
      TabOrder = 1
      Text = '192.168.1.200'
    end
    object edt3: TEdit
      Left = 200
      Top = 26
      Width = 121
      Height = 20
      ImeName = #26497#21697#20116#31508#36755#20837#27861
      TabOrder = 2
      Text = '8180'
    end
    object btn4: TButton
      Left = 32
      Top = 88
      Width = 153
      Height = 25
      Caption = #20851#38381#26381#21153
      TabOrder = 3
      OnClick = btn4Click
    end
    object btn7: TButton
      Left = 200
      Top = 87
      Width = 75
      Height = 25
      Caption = #28165#31354#26085#24535
      TabOrder = 4
      OnClick = btn7Click
    end
    object edt1: TEdit
      Left = 107
      Top = 137
      Width = 229
      Height = 20
      ImeName = #26497#21697#20116#31508#36755#20837#27861
      TabOrder = 5
      Text = 'c:\python25\python'
    end
  end
  object mmo1: TMemo
    Left = 0
    Top = 181
    Width = 855
    Height = 158
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    ImeName = #26497#21697#20116#31508#36755#20837#27861
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object idtcpsrvr1: TIdTCPServer
    Bindings = <>
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
    Left = 216
    Top = 64
  end
  object pm1: TPopupMenu
    AutoHotkeys = maManual
    Left = 256
    Top = 64
    object N1: TMenuItem
      Caption = #26174#31034#31383#21475
    end
  end
end
