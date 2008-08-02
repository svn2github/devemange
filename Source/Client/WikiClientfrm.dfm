inherited WikiClientDlg: TWikiClientDlg
  Left = 165
  Top = 127
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
      Left = 728
      Top = 0
      Width = 134
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
    object btnRefresh: TBitBtn
      Left = 480
      Top = 7
      Width = 100
      Height = 25
      Caption = #21047#26032
      Enabled = False
      TabOrder = 5
      OnClick = btnRefreshClick
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
    OnDownloadComplete = wbwikiDownloadComplete
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
  object pmWbCommand: TPopupMenu
    AutoHotkeys = maManual
    Left = 88
    Top = 56
    object N1: TMenuItem
      Action = actwb_Copy
    end
    object N2: TMenuItem
      Action = actwb_Cut
    end
    object N3: TMenuItem
      Action = actwb_Paste
    end
  end
  object actlstwb: TActionList
    Left = 120
    Top = 56
    object actwb_Copy: TAction
      Caption = #25991#23383#22797#21046
      OnExecute = actwb_CopyExecute
    end
    object actwb_Cut: TAction
      Caption = #25991#23383#21098#20999
      OnExecute = actwb_CutExecute
    end
    object actwb_Paste: TAction
      Caption = #25991#23383#31896#36148
      OnExecute = actwb_PasteExecute
    end
  end
end
