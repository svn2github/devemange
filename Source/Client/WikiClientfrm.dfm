inherited WikiClientDlg: TWikiClientDlg
  Left = 275
  Top = 115
  Caption = 'Wiki'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object pnlWebTool: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object btnHome: TBitBtn
      Left = 19
      Top = 8
      Width = 100
      Height = 25
      Caption = #20027#39029
      TabOrder = 0
      OnClick = btnHomeClick
    end
    object btnBack: TBitBtn
      Left = 136
      Top = 8
      Width = 100
      Height = 25
      Caption = #21518#36864
      Enabled = False
      TabOrder = 1
      OnClick = btnBackClick
    end
    object btnForward: TBitBtn
      Left = 252
      Top = 7
      Width = 100
      Height = 25
      Caption = #21069#36827
      Enabled = False
      TabOrder = 2
      OnClick = btnForwardClick
    end
    object Animate1: TAnimate
      Left = 782
      Top = 0
      Width = 80
      Height = 40
      Align = alRight
      Color = clBtnFace
      CommonAVI = aviFindFolder
      ParentColor = False
      StopFrame = 29
    end
    object btnStop: TBitBtn
      Left = 364
      Top = 7
      Width = 100
      Height = 25
      Caption = #20572#27490
      Enabled = False
      TabOrder = 4
      OnClick = btnStopClick
    end
  end
  object wbwiki: TWebBrowser
    Left = 0
    Top = 40
    Width = 862
    Height = 566
    Align = alClient
    TabOrder = 1
    OnCommandStateChange = wbwikiCommandStateChange
    OnDownloadBegin = wbwikiDownloadBegin
    OnDocumentComplete = wbwikiDocumentComplete
    ControlData = {
      4C000000175900007F3A00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object aplctnvnts1: TApplicationEvents
    OnMessage = aplctnvnts1Message
    Left = 48
    Top = 56
  end
end
