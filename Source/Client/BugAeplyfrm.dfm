inherited BugAeplyDlg: TBugAeplyDlg
  Left = 299
  Top = 152
  BorderStyle = bsDialog
  Caption = #22238#22797
  ClientHeight = 445
  ClientWidth = 661
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object BitBtn1: TBitBtn
    Left = 449
    Top = 414
    Width = 100
    Height = 25
    Caption = #30830#23450'(&O)'
    TabOrder = 0
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 553
    Top = 414
    Width = 100
    Height = 25
    Caption = #21462#28040'(&C)'
    TabOrder = 1
    Kind = bkCancel
  end
  object plQustion: TPanel
    Left = -1
    Top = 342
    Width = 663
    Height = 59
    BevelOuter = bvNone
    Color = clMoneyGreen
    TabOrder = 2
    object Label8: TLabel
      Left = 0
      Top = 0
      Width = 663
      Height = 15
      Align = alTop
      AutoSize = False
      Caption = #35299#20915#26041#26696
      Color = clGray
      Font.Charset = GB2312_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label7: TLabel
      Left = 38
      Top = 30
      Width = 113
      Height = 15
      Caption = #22788#29702#38382#39064#30340#26041#26696':'
    end
    object Label6: TLabel
      Left = 332
      Top = 30
      Width = 120
      Height = 15
      Caption = #22788#29702#38382#39064#30340#29256#26412#65306
    end
    object dblcQustionType: TDBLookupComboBox
      Left = 157
      Top = 26
      Width = 145
      Height = 23
      KeyField = 'ZID'
      ListField = 'ZNAME'
      ListSource = BugManageDlg.dsBugPlan
      TabOrder = 0
    end
    object dblcQustionVer: TDBLookupComboBox
      Left = 455
      Top = 27
      Width = 145
      Height = 23
      KeyField = 'ZID'
      ListField = 'ZVER'
      ListSource = BugManageDlg.dsProject
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 661
    Height = 342
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 3
    object Label2: TLabel
      Left = 16
      Top = 25
      Width = 53
      Height = 15
      Caption = #22238#22797#20154':'
    end
    object Label5: TLabel
      Left = 17
      Top = 53
      Width = 45
      Height = 15
      Caption = #20869#23481#65306
    end
    object DBText1: TDBText
      Left = 72
      Top = 24
      Width = 180
      Height = 17
      Color = clBtnFace
      DataField = 'ZUSERNAME'
      DataSource = BugManageDlg.dsBugBugHistory
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 288
      Top = 25
      Width = 38
      Height = 15
      Caption = #26102#38388':'
    end
    object DBText2: TDBText
      Left = 336
      Top = 24
      Width = 180
      Height = 17
      Color = clBtnFace
      DataField = 'ZACTIONDATE'
      DataSource = BugManageDlg.dsBugBugHistory
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 16
      Top = 312
      Width = 38
      Height = 15
      Caption = #29366#24577':'
    end
    object DBText3: TDBText
      Left = 69
      Top = 312
      Width = 180
      Height = 17
      Color = clBtnFace
      DataField = 'ZSTATUSNAME'
      DataSource = BugManageDlg.dsBugBugHistory
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 288
      Top = 312
      Width = 38
      Height = 15
      Caption = #38468#20214':'
    end
    object Label9: TLabel
      Left = 0
      Top = 0
      Width = 661
      Height = 15
      Align = alTop
      Caption = #35831#36755#20837#20320#35201#22238#22797#30340#20869#23481
      Color = clGray
      Font.Charset = GB2312_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object DBMemo1: TDBMemo
      Left = 14
      Top = 75
      Width = 633
      Height = 220
      DataField = 'ZCONTEXT'
      DataSource = BugManageDlg.dsBugBugHistory
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object btbnOpenAnnix: TBitBtn
      Left = 552
      Top = 306
      Width = 100
      Height = 25
      Caption = #25171#24320#38468#20214
      TabOrder = 1
      OnClick = btbnOpenAnnixClick
    end
    object edPath: TEdit
      Left = 329
      Top = 309
      Width = 215
      Height = 23
      TabOrder = 2
    end
    object chkNeed: TCheckBox
      Left = 548
      Top = 24
      Width = 98
      Height = 17
      Hint = #38656#35201#20135#21697#20877#30830#23450#30340
      Caption = #38656#27714#19981#26126#30830
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object btnOpenFileTxt: TBitBtn
    Left = 13
    Top = 414
    Width = 100
    Height = 25
    Caption = #25171#24320#33609#31295
    TabOrder = 4
    OnClick = btnOpenFileTxtClick
  end
  object OpenDialog1: TOpenDialog
    Filter = #25152#26377#25991#20214'(*.*)|*.*|Png(*.png)|*.png|bmp(*.bmp)|*.bmp|jpg(*.jpg)|*.jpg'
    Left = 192
    Top = 160
  end
end
