inherited PrototypeClientDlg: TPrototypeClientDlg
  Left = 282
  Top = 256
  Caption = #20135#21697#21407#22411
  PixelsPerInch = 96
  TextHeight = 15
  object pgc1: TPageControl
    Left = 0
    Top = 73
    Width = 854
    Height = 529
    ActivePage = tsList
    Align = alClient
    TabOrder = 0
    object tsList: TTabSheet
      Caption = #21407#22411#21015#34920
      object pnlTools: TPanel
        Left = 0
        Top = 0
        Width = 846
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnAddPro: TBitBtn
          Left = 13
          Top = 6
          Width = 100
          Height = 25
          Action = act_AddPro
          Caption = #22686#21152#21407#22411
          TabOrder = 0
        end
      end
      object dbgrdList: TDBGrid
        Left = 0
        Top = 41
        Width = 846
        Height = 458
        Align = alClient
        TabOrder = 1
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
      end
    end
    object tsView: TTabSheet
      Caption = #21407#22411#27983#35272
      ImageIndex = 1
    end
  end
  object pnlonvisible: TPanel
    Left = 0
    Top = 0
    Width = 854
    Height = 73
    Align = alTop
    Caption = #19981#21487#35270#38754#26495
    TabOrder = 1
    Visible = False
  end
  object actlst1: TActionList
    Left = 32
    Top = 16
    object act_AddPro: TAction
      Caption = #22686#21152#21407#22411
      OnExecute = act_AddProExecute
    end
  end
end
