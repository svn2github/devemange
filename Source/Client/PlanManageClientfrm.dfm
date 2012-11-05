inherited PlanManageClientDlg: TPlanManageClientDlg
  Left = 144
  Top = 244
  Width = 1043
  Caption = #39033#30446#35745#21010
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object pnlonvisible: TPanel
    Left = 0
    Top = 0
    Width = 1027
    Height = 73
    Align = alTop
    Caption = 'pnlonvisible'
    TabOrder = 0
    Visible = False
  end
  object pnl1: TPanel
    Left = 0
    Top = 73
    Width = 1027
    Height = 529
    Align = alClient
    BevelOuter = bvLowered
    Caption = 'pnl1'
    TabOrder = 1
    object pgcplan: TPageControl
      Left = 1
      Top = 1
      Width = 1025
      Height = 527
      ActivePage = tsPlanItem
      Align = alClient
      TabOrder = 0
      OnChange = pgcplanChange
      OnChanging = pgcplanChanging
      object tsProject: TTabSheet
        Caption = #39033#30446#21015#34920
        ImageIndex = 3
        object pnl6: TPanel
          Left = 0
          Top = 456
          Width = 1017
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object lblPlanPage: TLabel
            Left = 436
            Top = 14
            Width = 88
            Height = 15
            Caption = 'lblPlanPage'
          end
          object btnPan_LastPage: TSpeedButton
            Left = 317
            Top = 8
            Width = 100
            Height = 25
            Action = actPan_LastPage
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF00000000000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000
              FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00000000000000
              000000000000000000000000000000000000000000000000FF000000FF000000
              FF000000FF000000FF000000000000000000FF00FF00FF00FF00000000000000
              FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
              FF000000FF000000FF000000FF000000FF000000000000000000000000000000
              000000000000000000000000000000000000000000000000FF000000FF000000
              FF000000FF000000FF000000000000000000FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000
              FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF00000000000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            ParentShowHint = False
            ShowHint = True
          end
          object btnPan_NextPage: TSpeedButton
            Left = 213
            Top = 8
            Width = 100
            Height = 25
            Action = actPan_NextPage
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000FF000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000FF000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000000FF000000FF000000FF000000FF000000
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000000FF000000FF000000FF000000FF000000
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00000000000000FF000000FF000000FF000000FF000000FF000000
              FF000000FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00000000000000000000000000000000000000FF00000000000000
              00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            ParentShowHint = False
            ShowHint = True
          end
          object btnPan_Propage: TSpeedButton
            Left = 109
            Top = 8
            Width = 100
            Height = 25
            Action = actPan_Propage
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00000000000000000000000000000000000000FF00000000000000
              00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00000000000000FF000000FF000000FF000000FF000000FF000000
              FF000000FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000000FF000000FF000000FF000000FF000000
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000000FF000000FF000000FF000000FF000000
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000FF000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000FF000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            ParentShowHint = False
            ShowHint = True
          end
          object btnPan_FirstPage: TSpeedButton
            Left = 5
            Top = 8
            Width = 100
            Height = 25
            Action = actPan_FirstPage
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000FF000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF0000000000000000000000FF000000FF000000FF000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF0000000000000000000000FF000000FF000000FF000000FF000000FF000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
              FF000000FF000000FF000000FF000000FF000000FF0000000000FF00FF00FF00
              FF0000000000000000000000FF000000FF000000FF000000FF000000FF000000
              0000000000000000000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF0000000000000000000000FF000000FF000000FF000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000FF000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            ParentShowHint = False
            ShowHint = True
          end
        end
        object pnl7: TPanel
          Left = 0
          Top = 0
          Width = 1017
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          Caption = 'pnl6'
          TabOrder = 1
          object btnPan_Open: TBitBtn
            Left = 16
            Top = 8
            Width = 100
            Height = 25
            Action = actPan_Open
            Caption = #25171#24320#39033#30446
            TabOrder = 0
          end
        end
        object dbgrdPlan: TDBGrid
          Left = 0
          Top = 41
          Width = 1017
          Height = 415
          Align = alClient
          DataSource = dsPlan
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnDrawColumnCell = dbgrdPlanDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'ZID'
              Title.Alignment = taCenter
              Title.Caption = #32534#21495
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZNAME'
              Title.Alignment = taCenter
              Title.Caption = #39033#30446#21517#31216
              Width = 420
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZSTATUS'
              Title.Alignment = taCenter
              Title.Caption = #29366#24577
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZPM'
              Title.Alignment = taCenter
              Title.Caption = #39033#30446#32463#29702
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZMEMBER'
              Title.Alignment = taCenter
              Title.Caption = #39033#30446#25104#21592
              Width = 200
              Visible = True
            end>
        end
      end
      object tsPlanItem: TTabSheet
        Caption = #39033#30446#20219#21153
        ImageIndex = 1
        object pnlPlanItemTop: TPanel
          Left = 0
          Top = 0
          Width = 1017
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            1017
            40)
          object btnItem_Add: TBitBtn
            Left = 8
            Top = 8
            Width = 100
            Height = 25
            Action = actItem_Add
            Caption = #21019#24314#20219#21153
            TabOrder = 0
          end
          object btnItem_Success: TBitBtn
            Left = 216
            Top = 8
            Width = 100
            Height = 25
            Action = actItem_Success
            Caption = #23436#25104#20219#21153
            TabOrder = 1
          end
          object btnItem_Close: TBitBtn
            Left = 320
            Top = 8
            Width = 100
            Height = 25
            Action = actItem_Close
            Caption = #20851#38381#20219#21153
            TabOrder = 2
          end
          object btnItem_Action: TBitBtn
            Left = 424
            Top = 8
            Width = 100
            Height = 25
            Action = actItem_Action
            Caption = #28608#27963#20219#21153
            TabOrder = 3
          end
          object dbedtZSORT: TDBEdit
            Left = 948
            Top = 8
            Width = 72
            Height = 23
            Anchors = [akTop, akRight]
            DataField = 'ZSORT'
            DataSource = dsPlanItem
            ImeName = #26497#21697#20116#31508#36755#20837#27861
            TabOrder = 4
          end
          object btnItem_Starting: TBitBtn
            Left = 112
            Top = 8
            Width = 100
            Height = 24
            Action = actItem_Starting
            Caption = #24320#22987#25191#34892
            TabOrder = 5
          end
          object btnItem_Waiting: TBitBtn
            Left = 528
            Top = 8
            Width = 100
            Height = 25
            Action = actItem_Waiting
            Caption = #20219#21153#31561#24453#20013
            TabOrder = 6
          end
        end
        object dbgrdPlanItem: TDBGrid
          Left = 0
          Top = 40
          Width = 1017
          Height = 417
          Align = alClient
          DataSource = dsPlanItem
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnDrawColumnCell = dbgrdPlanItemDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'ZNAME'
              Title.Alignment = taCenter
              Title.Caption = #20219#21153#21517#31216
              Width = 400
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ZSUCCESSRATE'
              Title.Alignment = taCenter
              Title.Caption = #27604#20363'%'
              Width = 40
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ZSTATUSNAME'
              Title.Alignment = taCenter
              Title.Caption = #29366#24577
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZFBDATE'
              Title.Alignment = taCenter
              Title.Caption = #23454#38469#24320#22987#26085#26399
              Width = 123
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZFEDATE'
              Title.Alignment = taCenter
              Title.Caption = #23454#38469#32467#26463#26085#26399
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZPEDATE'
              Title.Alignment = taCenter
              Title.Caption = #35745#21010#32467#26463#26085#26399
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZPROJECTTIME'
              Title.Alignment = taCenter
              Title.Caption = #24037#26399
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZMAINDEVENAME'
              Title.Alignment = taCenter
              Title.Caption = #20027#35201#36127#36131#20154
              Width = 83
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZREMARK'
              Title.Alignment = taCenter
              Title.Caption = #22791#27880
              Width = 155
              Visible = True
            end>
        end
        object pnlPlanPage: TPanel
          Left = 0
          Top = 457
          Width = 1017
          Height = 40
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object lblItemPage: TLabel
            Left = 529
            Top = 12
            Width = 88
            Height = 15
            Caption = 'lblItemPage'
          end
          object btnItem_firstPage: TBitBtn
            Left = 9
            Top = 8
            Width = 100
            Height = 25
            Action = actItem_firstPage
            Caption = #31532#19968#39029
            TabOrder = 0
          end
          object btnItem_PiroPage: TBitBtn
            Left = 113
            Top = 8
            Width = 100
            Height = 25
            Action = actItme_ProvPage
            Caption = #19978#19968#39029
            TabOrder = 1
          end
          object btnItem_NextPage: TBitBtn
            Left = 217
            Top = 8
            Width = 100
            Height = 25
            Action = actItem_NextPage
            Caption = #19979#19968#39029
            TabOrder = 2
          end
          object btnItem_LastPage: TBitBtn
            Left = 321
            Top = 8
            Width = 100
            Height = 25
            Action = actItem_LastPage
            Caption = #26368#21518#19968#39029
            TabOrder = 3
          end
          object btnItem_RefreshData: TBitBtn
            Left = 425
            Top = 8
            Width = 100
            Height = 25
            Action = actItem_RefreshData
            Caption = #21047#26032#25968#25454
            TabOrder = 4
          end
        end
      end
      object tsPlanDetial: TTabSheet
        Caption = #20219#21153#20869#23481
        ImageIndex = 2
        DesignSize = (
          1017
          497)
        object dbtxtZNAME1: TDBText
          Left = 0
          Top = 0
          Width = 1017
          Height = 17
          Align = alTop
          Color = clNavy
          DataField = 'ZNAME'
          DataSource = dsPlanItem
          Font.Charset = GB2312_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object spl2: TSplitter
          Left = 0
          Top = 189
          Width = 1017
          Height = 10
          Cursor = crVSplit
          Align = alTop
          Beveled = True
        end
        object scrlbx1: TScrollBox
          Left = 0
          Top = 17
          Width = 1017
          Height = 172
          Align = alTop
          TabOrder = 0
          object lbl8: TLabel
            Left = 8
            Top = 9
            Width = 75
            Height = 15
            Caption = #20219#21153#21517#31216#65306
          end
          object lbl9: TLabel
            Left = 8
            Top = 40
            Width = 98
            Height = 15
            Caption = #35745#21010#24320#22987#26085#26399':'
          end
          object lbl10: TLabel
            Left = 339
            Top = 40
            Width = 98
            Height = 15
            Caption = #35745#21010#32467#26463#26085#26399':'
          end
          object lbl11: TLabel
            Left = 8
            Top = 72
            Width = 105
            Height = 15
            Caption = #23454#38469#24320#22987#26085#26399#65306
          end
          object lbl12: TLabel
            Left = 339
            Top = 66
            Width = 105
            Height = 15
            Caption = #23454#38469#32467#26463#26085#26399#65306
          end
          object lbl13: TLabel
            Left = 8
            Top = 98
            Width = 90
            Height = 15
            Caption = #20027#35201#36127#36131#20154#65306
          end
          object lbl14: TLabel
            Left = 10
            Top = 149
            Width = 45
            Height = 15
            Caption = #22791#27880#65306
          end
          object lbl15: TLabel
            Left = 309
            Top = 96
            Width = 75
            Height = 15
            Caption = #23436#25104#27604#20363#65306
          end
          object lbl24: TLabel
            Left = 470
            Top = 96
            Width = 68
            Height = 15
            Caption = #35745#21010#24037#26399':'
          end
          object lbl25: TLabel
            Left = 8
            Top = 122
            Width = 68
            Height = 15
            Caption = #21019#24314#26085#26399':'
          end
          object lbl26: TLabel
            Left = 311
            Top = 121
            Width = 120
            Height = 15
            Caption = #37038#31665#36890#30693#20854#20182#20154#65306
          end
          object dbedtZNAME1: TDBEdit
            Left = 109
            Top = 4
            Width = 518
            Height = 23
            DataField = 'ZNAME'
            DataSource = dsPlanItem
            ReadOnly = True
            TabOrder = 0
          end
          object dblkcbbZMAINDEVENAME: TDBLookupComboBox
            Left = 109
            Top = 93
            Width = 180
            Height = 23
            DataField = 'ZMAINDEVENAME'
            DataSource = dsPlanItem
            DropDownRows = 25
            ImeName = #26497#21697#20116#31508#36755#20837#27861
            KeyField = 'ZID'
            ListField = 'ZNAME'
            ListSource = DM.dsUsers
            ReadOnly = True
            TabOrder = 1
          end
          object dbedtZFBDATE: TDBEdit
            Left = 109
            Top = 35
            Width = 180
            Height = 23
            DataField = 'ZPBDATE'
            DataSource = dsPlanItem
            ReadOnly = True
            TabOrder = 2
            OnDblClick = dbedtZFBDATEDblClick
          end
          object dbedtZFBDATE1: TDBEdit
            Left = 109
            Top = 63
            Width = 180
            Height = 23
            DataField = 'ZFBDATE'
            DataSource = dsPlanItem
            ReadOnly = True
            TabOrder = 3
            OnDblClick = dbedtZFBDATEDblClick
          end
          object dbedtZFEDATE: TDBEdit
            Left = 447
            Top = 35
            Width = 180
            Height = 23
            DataField = 'ZPEDATE'
            DataSource = dsPlanItem
            ReadOnly = True
            TabOrder = 4
            OnDblClick = dbedtZFBDATEDblClick
          end
          object dbedtZFBDATE2: TDBEdit
            Left = 447
            Top = 63
            Width = 180
            Height = 23
            DataField = 'ZFEDATE'
            DataSource = dsPlanItem
            ReadOnly = True
            TabOrder = 5
            OnDblClick = dbedtZFBDATEDblClick
          end
          object dbedtZREMARK: TDBEdit
            Left = 108
            Top = 145
            Width = 520
            Height = 23
            DataField = 'ZREMARK'
            DataSource = dsPlanItem
            ReadOnly = True
            TabOrder = 6
          end
          object dbedtZSUCCESSRATE: TDBEdit
            Left = 383
            Top = 91
            Width = 83
            Height = 23
            Color = clBtnFace
            DataField = 'ZSUCCESSRATE'
            DataSource = dsPlanItem
            ImeName = #26497#21697#20116#31508#36755#20837#27861
            TabOrder = 7
          end
          object btnItem_Save: TBitBtn
            Left = 647
            Top = 8
            Width = 100
            Height = 25
            Action = actItem_Save
            Caption = #20445#23384
            TabOrder = 8
          end
          object btnItem_Cancel: TBitBtn
            Left = 647
            Top = 37
            Width = 100
            Height = 25
            Action = actItem_Cancel
            Caption = #21462#28040
            TabOrder = 9
          end
          object btnItem_Piro: TBitBtn
            Left = 647
            Top = 66
            Width = 100
            Height = 25
            Action = actItem_PiroPage
            Caption = #19978#19968#20010
            TabOrder = 10
          end
          object btnItem_Next: TBitBtn
            Left = 647
            Top = 95
            Width = 100
            Height = 25
            Action = actItem_Next
            Caption = #19979#19968#20010
            TabOrder = 11
          end
          object dbedtZPROJECTT: TDBEdit
            Left = 543
            Top = 91
            Width = 83
            Height = 23
            DataField = 'ZPROJECTTIME'
            DataSource = dsPlanItem
            TabOrder = 12
          end
          object dbedtZCREATEDATE: TDBEdit
            Left = 109
            Top = 119
            Width = 180
            Height = 23
            DataField = 'ZCREATEDATE'
            DataSource = dsPlanItem
            ReadOnly = True
            TabOrder = 13
            OnDblClick = dbedtZFBDATEDblClick
          end
          object btnItem_SendMail: TBitBtn
            Left = 647
            Top = 124
            Width = 100
            Height = 25
            Action = actItem_SendMail
            Caption = #37038#20214#36890#30693
            TabOrder = 14
          end
          object dbedtZMAILTO: TDBEdit
            Left = 427
            Top = 117
            Width = 114
            Height = 23
            DataField = 'ZMAILTO'
            DataSource = dsPlanItem
            TabOrder = 15
          end
          object dblkcbbSelectUsermail: TDBLookupComboBox
            Left = 545
            Top = 116
            Width = 80
            Height = 23
            DropDownRows = 25
            KeyField = 'ZID'
            ListField = 'ZNAME'
            ListSource = DM.dsUsers
            TabOrder = 16
            OnCloseUp = dblkcbbSelectUsermailCloseUp
          end
        end
        object pnlPlanDetail: TPanel
          Left = 0
          Top = 199
          Width = 1017
          Height = 298
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnlPlanDetail'
          TabOrder = 1
          object spl3: TSplitter
            Left = 247
            Top = 40
            Width = 10
            Height = 258
            Beveled = True
          end
          object pnlPlanDetailTop: TPanel
            Left = 0
            Top = 0
            Width = 1017
            Height = 40
            Align = alTop
            BevelOuter = bvLowered
            Color = clNavy
            TabOrder = 0
            object lbl17: TLabel
              Left = 8
              Top = 13
              Width = 60
              Height = 15
              Caption = #23376#20219#21153#65306
              Font.Charset = GB2312_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object btnDetail_Add: TBitBtn
              Left = 65
              Top = 8
              Width = 100
              Height = 25
              Action = actDetail_Add
              Caption = #22686#21152#23376#20219#21153
              TabOrder = 0
            end
            object btnDetail_SUCCESS: TBitBtn
              Left = 377
              Top = 8
              Width = 100
              Height = 25
              Action = actDetail_SUCCESS
              Caption = #23436#25104
              TabOrder = 1
            end
            object btnDetail_Colse: TBitBtn
              Left = 481
              Top = 8
              Width = 100
              Height = 25
              Action = actDetail_Colse
              Caption = #20851#38381
              TabOrder = 2
            end
            object btnDetail_Action: TBitBtn
              Left = 585
              Top = 8
              Width = 100
              Height = 25
              Action = actDetail_Action
              Caption = #28608#27963
              TabOrder = 3
            end
            object btnDetail_Save: TBitBtn
              Left = 169
              Top = 8
              Width = 100
              Height = 25
              Action = actDetail_Save
              Caption = #20445#23384#20869#23481
              TabOrder = 4
            end
            object btnDetail_Cancel: TBitBtn
              Left = 273
              Top = 8
              Width = 100
              Height = 25
              Action = actDetail_Cancel
              Caption = #21462#28040#20869#23481
              TabOrder = 5
            end
          end
          object dbgrdDetail: TDBGrid
            Left = 0
            Top = 40
            Width = 247
            Height = 258
            Align = alLeft
            DataSource = dsPlanDetail
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -15
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnDrawColumnCell = dbgrdDetailDrawColumnCell
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'ZID'
                Title.Alignment = taCenter
                Title.Caption = #32534#21495
                Width = 48
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZNAME'
                Title.Alignment = taCenter
                Title.Caption = #21517#31216
                Width = 202
                Visible = True
              end>
          end
          object pnl3: TPanel
            Left = 257
            Top = 40
            Width = 760
            Height = 258
            Align = alClient
            BevelOuter = bvNone
            Caption = 'pnl3'
            TabOrder = 2
            object dbmmoZCONTENT: TDBMemo
              Left = 0
              Top = 65
              Width = 653
              Height = 153
              Align = alClient
              DataField = 'ZCONTENT'
              DataSource = dsPlanDetail
              ReadOnly = True
              ScrollBars = ssBoth
              TabOrder = 0
            end
            object pnl5: TPanel
              Left = 0
              Top = 0
              Width = 760
              Height = 65
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              DesignSize = (
                760
                65)
              object lbl18: TLabel
                Left = 8
                Top = 38
                Width = 60
                Height = 15
                Caption = #36127#36131#20154#65306
              end
              object lbl16: TLabel
                Left = 8
                Top = 9
                Width = 45
                Height = 15
                Caption = #21517#31216#65306
              end
              object lbl20: TLabel
                Left = 253
                Top = 36
                Width = 45
                Height = 15
                Caption = #24471#20998#65306
              end
              object lbl19: TLabel
                Left = 483
                Top = 35
                Width = 45
                Height = 15
                Caption = #29366#24577#65306
              end
              object dbtxtZSTATUSNAME1: TDBText
                Left = 529
                Top = 33
                Width = 227
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Color = clGray
                DataField = 'ZSTATUSNAME'
                DataSource = dsPlanDetail
                Font.Charset = GB2312_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = #23435#20307
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object dblkcbbZSTATUSNAME: TDBLookupComboBox
                Left = 64
                Top = 33
                Width = 180
                Height = 23
                DataField = 'ZDEVENAME'
                DataSource = dsPlanDetail
                DropDownRows = 30
                ReadOnly = True
                TabOrder = 0
              end
              object dbedtZNAME2: TDBEdit
                Left = 64
                Top = 5
                Width = 693
                Height = 23
                Anchors = [akLeft, akTop, akRight]
                DataField = 'ZNAME'
                DataSource = dsPlanDetail
                ReadOnly = True
                TabOrder = 1
              end
              object dbedtZSOCRE: TDBEdit
                Left = 294
                Top = 31
                Width = 180
                Height = 23
                Color = clBtnFace
                DataField = 'ZSOCRE'
                DataSource = dsPlanDetail
                ReadOnly = True
                TabOrder = 2
              end
            end
            object pnlTestCase: TPanel
              Left = 0
              Top = 218
              Width = 760
              Height = 40
              Align = alBottom
              BevelOuter = bvNone
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              DesignSize = (
                760
                40)
              object lbl23: TLabel
                Left = 8
                Top = 14
                Width = 68
                Height = 15
                Caption = #27979#35797#29992#20363':'
              end
              object dbedtZTESTCASE: TDBEdit
                Left = 81
                Top = 8
                Width = 575
                Height = 23
                Hint = #22810#20010#29992#20998#21495'(;)'#20998#24320' '#20363#22914' $234;$123;$567'
                Anchors = [akLeft, akTop, akRight]
                DataField = 'ZTESTCASE'
                DataSource = dsPlanDetail
                ReadOnly = True
                TabOrder = 0
              end
              object btnGotoTest: TBitBtn
                Left = 663
                Top = 8
                Width = 100
                Height = 25
                Anchors = [akTop, akRight]
                Caption = #36339#21040#27979#35797#29992#20363
                TabOrder = 1
                OnClick = btnGotoTestClick
              end
            end
            object lvAttach: TListView
              Left = 653
              Top = 65
              Width = 107
              Height = 153
              Align = alRight
              Columns = <>
              LargeImages = ilAttach
              PopupMenu = pmAttach
              TabOrder = 3
              OnDblClick = lvAttachDblClick
            end
          end
        end
        object chkEdit: TCheckBox
          Left = 963
          Top = 0
          Width = 55
          Height = 17
          Anchors = [akTop, akRight]
          Caption = #32534#36753
          Color = clNavy
          Font.Charset = GB2312_CHARSET
          Font.Color = clYellow
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 2
          OnClick = chkEditClick
        end
      end
      object tsPlan: TTabSheet
        Caption = #39033#30446#20449#24687
        object pnlPlanBottom: TPanel
          Left = 0
          Top = 457
          Width = 1017
          Height = 40
          Align = alBottom
          BevelOuter = bvNone
          Color = clNavy
          TabOrder = 0
          object btnPan_Add: TBitBtn
            Left = 10
            Top = 8
            Width = 100
            Height = 25
            Action = actPan_Add
            Caption = #22686#21152#39033#30446
            TabOrder = 0
          end
          object btnPan_success: TBitBtn
            Left = 218
            Top = 8
            Width = 100
            Height = 25
            Action = actPan_success
            Caption = #23436#25104#39033#30446
            TabOrder = 1
          end
          object btnPan_CLOSE: TBitBtn
            Left = 322
            Top = 8
            Width = 100
            Height = 25
            Action = actPan_CLOSE
            Caption = #20851#38381#39033#30446
            TabOrder = 2
          end
          object btnPan_Save: TBitBtn
            Left = 114
            Top = 8
            Width = 100
            Height = 25
            Action = actPan_Save
            Caption = #20445#23384#39033#30446
            TabOrder = 3
          end
          object btnPan_Action: TBitBtn
            Left = 426
            Top = 8
            Width = 100
            Height = 25
            Action = actPan_Action
            Caption = #28608#27963
            TabOrder = 4
          end
        end
        object pnl4: TPanel
          Left = 0
          Top = 0
          Width = 1017
          Height = 457
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            1017
            457)
          object dbtxtZID: TDBText
            Left = 88
            Top = 8
            Width = 180
            Height = 17
            Color = clGray
            DataField = 'ZAUTOID'
            DataSource = dsPlan
            Font.Charset = GB2312_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = #23435#20307
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object lbl7: TLabel
            Left = 14
            Top = 10
            Width = 68
            Height = 15
            Caption = #39033#30446#32534#21495':'
          end
          object lbl1: TLabel
            Left = 14
            Top = 39
            Width = 68
            Height = 15
            Caption = #39033#30446#21517#31216':'
          end
          object lbl6: TLabel
            Left = 14
            Top = 69
            Width = 75
            Height = 15
            Caption = #31435#39033#39033#30446#65306
          end
          object lbl3: TLabel
            Left = 305
            Top = 71
            Width = 105
            Height = 15
            Caption = #39033#30446#21019#24314#26102#38388#65306
          end
          object dbtxtZBUILDDATE: TDBText
            Left = 426
            Top = 69
            Width = 180
            Height = 17
            Color = clGray
            DataField = 'ZBUILDDATE'
            DataSource = dsPlan
            Font.Charset = GB2312_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = #23435#20307
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object dbtxtZSTATUSNAME: TDBText
            Left = 427
            Top = 100
            Width = 180
            Height = 17
            Color = clGray
            DataField = 'ZSTATUSNAME'
            DataSource = dsPlan
            Font.Charset = GB2312_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = #23435#20307
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object lbl2: TLabel
            Left = 305
            Top = 103
            Width = 68
            Height = 15
            Caption = #39033#30446#29366#24577':'
          end
          object lbl4: TLabel
            Left = 14
            Top = 105
            Width = 68
            Height = 15
            Caption = #39033#30446#32463#29702':'
          end
          object lbl5: TLabel
            Left = 14
            Top = 165
            Width = 98
            Height = 15
            Caption = #39033#30446#23436#25104#24635#32467':'
          end
          object lbl21: TLabel
            Left = 14
            Top = 136
            Width = 68
            Height = 15
            Caption = #39033#30446#25104#21592':'
          end
          object lbl22: TLabel
            Left = 617
            Top = 133
            Width = 24
            Height = 15
            Caption = '<<<'
          end
          object dbedtZNAME: TDBEdit
            Left = 87
            Top = 34
            Width = 520
            Height = 23
            DataField = 'ZNAME'
            DataSource = dsPlan
            ImeName = #26497#21697#20116#31508#36755#20837#27861
            TabOrder = 0
          end
          object dbedtZPRO_ID: TDBEdit
            Left = 87
            Top = 64
            Width = 180
            Height = 23
            DataField = 'ZPRO_ID'
            DataSource = dsPlan
            ImeName = #26497#21697#20116#31508#36755#20837#27861
            TabOrder = 1
          end
          object dblkcbbZPMNAME: TDBLookupComboBox
            Left = 87
            Top = 100
            Width = 180
            Height = 23
            DataField = 'ZPMNAME'
            DataSource = dsPlan
            DropDownRows = 30
            KeyField = 'ZID'
            ListField = 'ZNAME'
            ListSource = DM.dsUsers
            TabOrder = 2
          end
          object dbmmoZSUMTEXT: TDBMemo
            Left = 14
            Top = 188
            Width = 980
            Height = 264
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'ZSUMTEXT'
            DataSource = dsPlan
            ScrollBars = ssBoth
            TabOrder = 3
          end
          object lstPlanGUID: TListBox
            Left = 680
            Top = 24
            Width = 121
            Height = 89
            ImeName = #26497#21697#20116#31508#36755#20837#27861
            ItemHeight = 15
            TabOrder = 4
            Visible = False
          end
          object dbedtZMEMBER: TDBEdit
            Left = 89
            Top = 130
            Width = 520
            Height = 23
            Hint = #21482#26377#31649#29702#21592#25165#33021#22686#21152
            DataField = 'ZMEMBER'
            DataSource = dsPlan
            ImeName = #26497#21697#20116#31508#36755#20837#27861
            TabOrder = 5
          end
          object dblkcbb1: TDBLookupComboBox
            Left = 647
            Top = 130
            Width = 145
            Height = 23
            DropDownRows = 25
            KeyField = 'ZID'
            ListField = 'ZNAME'
            ListSource = DM.dsUsers
            TabOrder = 6
            OnCloseUp = dblkcbb1CloseUp
          end
        end
      end
    end
  end
  object cdsPlan: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsPlanBeforePost
    OnNewRecord = cdsPlanNewRecord
    Left = 24
    Top = 8
  end
  object dsPlan: TDataSource
    DataSet = cdsPlan
    Left = 24
    Top = 40
  end
  object actlst1: TActionList
    Images = il1
    Left = 64
    Top = 8
    object actPan_Add: TAction
      Category = #39033#30446
      Caption = #22686#21152#39033#30446
      OnExecute = actPan_AddExecute
      OnUpdate = actPan_AddUpdate
    end
    object actPan_success: TAction
      Category = #39033#30446
      Caption = #23436#25104#39033#30446
      OnExecute = actPan_successExecute
      OnUpdate = actPan_successUpdate
    end
    object actPan_CLOSE: TAction
      Category = #39033#30446
      Caption = #20851#38381#39033#30446
      OnExecute = actPan_CLOSEExecute
      OnUpdate = actPan_CLOSEUpdate
    end
    object actPan_Save: TAction
      Category = #39033#30446
      Caption = #20445#23384#39033#30446
      OnExecute = actPan_SaveExecute
      OnUpdate = actPan_SaveUpdate
    end
    object actPan_FirstPage: TAction
      Category = #39033#30446
      Caption = #31532#19968#39029
      Hint = #31532#19968#39029
      ImageIndex = 0
      OnExecute = actPan_FirstPageExecute
      OnUpdate = actPan_FirstPageUpdate
    end
    object actPan_Propage: TAction
      Category = #39033#30446
      Caption = #19978#19968#39029
      Hint = #19978#19968#39029
      ImageIndex = 3
      OnExecute = actPan_PropageExecute
      OnUpdate = actPan_PropageUpdate
    end
    object actPan_NextPage: TAction
      Category = #39033#30446
      Caption = #19979#19968#39029
      Hint = #19979#19968#39029
      ImageIndex = 2
      OnExecute = actPan_NextPageExecute
      OnUpdate = actPan_NextPageUpdate
    end
    object actPan_LastPage: TAction
      Category = #39033#30446
      Caption = #26368#21518#19968#39029
      Hint = #26368#21518#19968#39029
      ImageIndex = 1
      OnExecute = actPan_LastPageExecute
      OnUpdate = actPan_LastPageUpdate
    end
    object actItem_Add: TAction
      Category = #39033#30446#20219#21153
      Caption = #21019#24314#20219#21153
      OnExecute = actItem_AddExecute
      OnUpdate = actItem_AddUpdate
    end
    object actItem_Success: TAction
      Category = #39033#30446#20219#21153
      Caption = #23436#25104#20219#21153
      OnExecute = actItem_SuccessExecute
      OnUpdate = actItem_SuccessUpdate
    end
    object actItem_Close: TAction
      Category = #39033#30446#20219#21153
      Caption = #20851#38381#20219#21153
      OnExecute = actItem_CloseExecute
      OnUpdate = actItem_CloseUpdate
    end
    object actItem_Save: TAction
      Category = #39033#30446#20219#21153
      Caption = #20445#23384
      OnExecute = actItem_SaveExecute
      OnUpdate = actItem_SaveUpdate
    end
    object actItem_Cancel: TAction
      Category = #39033#30446#20219#21153
      Caption = #21462#28040
      OnExecute = actItem_CancelExecute
      OnUpdate = actItem_CancelUpdate
    end
    object actItem_PiroPage: TAction
      Category = #39033#30446#20219#21153
      Caption = #19978#19968#20010
      OnExecute = actItem_PiroPageExecute
      OnUpdate = actItem_PiroPageUpdate
    end
    object actItem_Next: TAction
      Category = #39033#30446#20219#21153
      Caption = #19979#19968#20010
      OnExecute = actItem_NextExecute
      OnUpdate = actItem_NextUpdate
    end
    object actItem_Action: TAction
      Category = #39033#30446#20219#21153
      Caption = #28608#27963#20219#21153
      OnExecute = actItem_ActionExecute
      OnUpdate = actItem_ActionUpdate
    end
    object actDetail_Add: TAction
      Category = #23376#20219#21153
      Caption = #22686#21152#23376#20219#21153
      OnExecute = actDetail_AddExecute
      OnUpdate = actDetail_AddUpdate
    end
    object actDetail_SUCCESS: TAction
      Category = #23376#20219#21153
      Caption = #23436#25104
      OnExecute = actDetail_SUCCESSExecute
      OnUpdate = actDetail_SUCCESSUpdate
    end
    object actDetail_Colse: TAction
      Category = #23376#20219#21153
      Caption = #20851#38381
      OnExecute = actDetail_ColseExecute
      OnUpdate = actDetail_ColseUpdate
    end
    object actDetail_Action: TAction
      Category = #23376#20219#21153
      Caption = #28608#27963
      OnExecute = actDetail_ActionExecute
      OnUpdate = actDetail_ActionUpdate
    end
    object actDetail_Save: TAction
      Category = #23376#20219#21153
      Caption = #20445#23384#20869#23481
      OnExecute = actDetail_SaveExecute
      OnUpdate = actDetail_SaveUpdate
    end
    object actPan_Action: TAction
      Category = #39033#30446
      Caption = #28608#27963
      OnExecute = actPan_ActionExecute
      OnUpdate = actPan_ActionUpdate
    end
    object actItem_firstPage: TAction
      Category = #39033#30446#20219#21153
      Caption = #31532#19968#39029
      OnExecute = actItem_firstPageExecute
      OnUpdate = actItem_firstPageUpdate
    end
    object actItme_ProvPage: TAction
      Category = #39033#30446#20219#21153
      Caption = #19978#19968#39029
      OnExecute = actItme_ProvPageExecute
      OnUpdate = actItme_ProvPageUpdate
    end
    object actItem_NextPage: TAction
      Category = #39033#30446#20219#21153
      Caption = #19979#19968#39029
      OnExecute = actItem_NextPageExecute
      OnUpdate = actItem_NextPageUpdate
    end
    object actItem_LastPage: TAction
      Category = #39033#30446#20219#21153
      Caption = #26368#21518#19968#39029
      OnExecute = actItem_LastPageExecute
      OnUpdate = actItem_LastPageUpdate
    end
    object actItem_RefreshData: TAction
      Category = #39033#30446#20219#21153
      Caption = #21047#26032#25968#25454
      OnExecute = actItem_RefreshDataExecute
      OnUpdate = actItem_RefreshDataUpdate
    end
    object actItem_Starting: TAction
      Category = #39033#30446#20219#21153
      Caption = #24320#22987#25191#34892
      Hint = #24320#22987#25191#34892#20219#21153
      OnExecute = actItem_StartingExecute
      OnUpdate = actItem_StartingUpdate
    end
    object actItem_Waiting: TAction
      Category = #39033#30446#20219#21153
      Caption = #20219#21153#31561#24453#20013
      Visible = False
      OnExecute = actItem_WaitingExecute
      OnUpdate = actItem_WaitingUpdate
    end
    object actPan_Open: TAction
      Category = #39033#30446
      Caption = #25171#24320#39033#30446
      OnExecute = actPan_OpenExecute
      OnUpdate = actPan_OpenUpdate
    end
    object actAttach_Addfile: TAction
      Category = #38468#20214
      Caption = #22686#21152#38468#20214
      OnExecute = actAttach_AddfileExecute
      OnUpdate = actAttach_AddfileUpdate
    end
    object actAttach_downfile: TAction
      Category = #38468#20214
      Caption = #19979#36733#38468#20214'('#21452#20987')...'
      OnExecute = actAttach_downfileExecute
      OnUpdate = actAttach_downfileUpdate
    end
    object actDetail_Cancel: TAction
      Category = #23376#20219#21153
      Caption = #21462#28040#20869#23481
      OnExecute = actDetail_CancelExecute
      OnUpdate = actDetail_CancelUpdate
    end
    object actItem_SendMail: TAction
      Category = #39033#30446#20219#21153
      Caption = #37038#20214#36890#30693
      OnExecute = actItem_SendMailExecute
      OnUpdate = actItem_SendMailUpdate
    end
  end
  object cdsPlanStauts: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 8
  end
  object cdsPlanItem: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsPlanItemBeforePost
    OnCalcFields = cdsPlanItemCalcFields
    OnNewRecord = cdsPlanItemNewRecord
    Left = 104
    Top = 8
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 8
  end
  object il1: TImageList
    Left = 400
    Top = 8
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFEFFFC7FFFFFFFFFFEFFFC7F
      FFFFFFFFFC7FFC7FFF3FFFFFFC7FFC7FFC3FFCFFF83FFC7FF03FFC3FF83FFC7F
      C000FC0FF01FE00F00000003F01FE00FC0000000E00FF01FF03F0003E00FF01F
      FC3FFC0FFC7FF83FFF3FFC3FFC7FF83FFFFFFCFFFC7FFC7FFFFFFFFFFC7FFC7F
      FFFFFFFFFC7FFEFFFFFFFFFFFC7FFEFF00000000000000000000000000000000
      000000000000}
  end
  object dsPlanItem: TDataSource
    DataSet = cdsPlanItem
    Left = 104
    Top = 39
  end
  object cdsPlanDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsPlanDetailBeforePost
    AfterScroll = cdsPlanDetailAfterScroll
    OnNewRecord = cdsPlanDetailNewRecord
    Left = 144
    Top = 8
  end
  object dsPlanDetail: TDataSource
    DataSet = cdsPlanDetail
    Left = 144
    Top = 40
  end
  object ilAttach: TImageList
    Height = 32
    Width = 32
    Left = 288
    Top = 8
  end
  object dlgOpen1: TOpenDialog
    Left = 632
    Top = 16
  end
  object dlgSave1: TSaveDialog
    Left = 664
    Top = 16
  end
  object pmAttach: TPopupMenu
    AutoHotkeys = maManual
    Left = 696
    Top = 16
    object N1: TMenuItem
      Action = actAttach_Addfile
    end
    object N2: TMenuItem
      Action = actAttach_downfile
    end
  end
end
