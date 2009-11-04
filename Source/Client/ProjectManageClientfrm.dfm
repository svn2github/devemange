inherited ProjectManageClientDlg: TProjectManageClientDlg
  Left = 111
  Top = 53
  Width = 964
  Height = 585
  Caption = #39033#30446#31649#29702
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object plonvisible: TPanel
    Left = 0
    Top = 0
    Width = 956
    Height = 71
    Align = alTop
    TabOrder = 0
    Visible = False
  end
  object plcenter: TPanel
    Left = 0
    Top = 71
    Width = 956
    Height = 480
    Align = alClient
    BevelOuter = bvLowered
    Caption = 'plcenter'
    TabOrder = 1
    object pcProject: TPageControl
      Left = 1
      Top = 1
      Width = 954
      Height = 478
      ActivePage = tsProjectList
      Align = alClient
      MultiLine = True
      TabOrder = 0
      OnChange = pcProjectChange
      OnChanging = pcProjectChanging
      object tsProjectList: TTabSheet
        Caption = #31435#39033#39033#30446
        object plProItemTop: TPanel
          Left = 0
          Top = 0
          Width = 946
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object BitBtn1: TBitBtn
            Left = 77
            Top = 8
            Width = 100
            Height = 25
            Action = actPro_Add
            Caption = #22686#21152#39033#30446
            TabOrder = 0
          end
          object BitBtn2: TBitBtn
            Left = 285
            Top = 8
            Width = 100
            Height = 25
            Action = actPro_Save
            Caption = #20445#23384
            TabOrder = 1
          end
          object cbEditProItem: TCheckBox
            Left = 10
            Top = 14
            Width = 58
            Height = 17
            Caption = #32534#36753
            TabOrder = 2
            OnClick = cbEditProItemClick
          end
          object BitBtn3: TBitBtn
            Left = 389
            Top = 8
            Width = 100
            Height = 25
            Action = actPro_Cancel
            Caption = #21462#28040
            TabOrder = 3
          end
          object BitBtn4: TBitBtn
            Left = 181
            Top = 8
            Width = 100
            Height = 25
            Action = actPro_Del
            Caption = #21024#38500
            TabOrder = 4
          end
          object BitBtn9: TBitBtn
            Left = 493
            Top = 8
            Width = 100
            Height = 25
            Action = actPro_RefreshData
            Caption = #21047#26032#25968#25454
            TabOrder = 5
          end
        end
        object dgProItem: TDBGrid
          Left = 0
          Top = 40
          Width = 946
          Height = 408
          Align = alClient
          DataSource = dsProjectItem
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnDrawColumnCell = dgProItemDrawColumnCell
          Columns = <
            item
              Color = clBtnFace
              Expanded = False
              FieldName = 'ZID'
              Title.Alignment = taCenter
              Title.Caption = #39033#30446'ID'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZNAME'
              Title.Alignment = taCenter
              Title.Caption = #39033#30446#21517#31216
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZOPENDATE'
              Title.Alignment = taCenter
              Title.Caption = #21019#24314#26102#38388
              Width = 150
              Visible = True
            end
            item
              Color = clBtnFace
              Expanded = False
              FieldName = 'ZLASTVER'
              Title.Alignment = taCenter
              Title.Caption = #26368#26032#29256#26412#21495
              Width = 102
              Visible = True
            end
            item
              Color = clBtnFace
              Expanded = False
              FieldName = 'ZLASTDATE'
              Title.Alignment = taCenter
              Title.Caption = #26368#26032#26356#26032#26102#38388
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZUSERNAME'
              Title.Alignment = taCenter
              Title.Caption = #36127#36131#20154
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZUNITS'
              Title.Alignment = taCenter
              Title.Caption = #20351#29992#21333#20301
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZHIGHVERID'
              Title.Caption = #26368#26032#29256#26412'ID'#21495
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZTESTTEAM'
              Title.Caption = #27979#35797#32452'('#26684#24335#22995#21517'(2);)'#22995#21517'(3)'
              Width = 66
              Visible = True
            end>
        end
      end
      object tsProjectVer: TTabSheet
        Caption = #39033#30446#29256#26412
        ImageIndex = 1
        object Splitter1: TSplitter
          Left = 0
          Top = 97
          Width = 946
          Height = 10
          Cursor = crVSplit
          Align = alBottom
          Beveled = True
          ResizeStyle = rsLine
        end
        object dbProName: TDBText
          Left = 0
          Top = 40
          Width = 946
          Height = 17
          Align = alTop
          Color = clGray
          DataField = 'ZNAME'
          DataSource = dsProjectItem
          Font.Charset = GB2312_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object plProVersion: TPanel
          Left = 0
          Top = 0
          Width = 946
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object cbVersionEdit: TCheckBox
            Left = 9
            Top = 11
            Width = 64
            Height = 17
            Caption = #32534#36753
            TabOrder = 0
            OnClick = cbVersionEditClick
          end
          object BitBtn5: TBitBtn
            Left = 66
            Top = 6
            Width = 100
            Height = 25
            Action = actVer_Add
            Caption = #22686#21152#29256#26412
            TabOrder = 1
          end
          object BitBtn6: TBitBtn
            Left = 174
            Top = 6
            Width = 100
            Height = 25
            Action = actVer_Del
            Caption = #21024#38500
            TabOrder = 2
          end
          object BitBtn7: TBitBtn
            Left = 283
            Top = 6
            Width = 100
            Height = 25
            Action = actVer_Save
            Caption = #20445#23384
            TabOrder = 3
          end
          object BitBtn8: TBitBtn
            Left = 393
            Top = 6
            Width = 100
            Height = 25
            Action = actvar_Cancel
            Caption = #21462#28040
            TabOrder = 4
          end
        end
        object dbmContext: TDBMemo
          Left = 0
          Top = 107
          Width = 946
          Height = 341
          Align = alBottom
          DataField = 'ZCONTEXT'
          DataSource = dsProVersion
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object dgProVersion: TDBGrid
          Left = 0
          Top = 57
          Width = 946
          Height = 40
          Align = alClient
          DataSource = dsProVersion
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 2
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnDrawColumnCell = dgProVersionDrawColumnCell
          Columns = <
            item
              Color = clBtnFace
              Expanded = False
              FieldName = 'ZNO'
              Title.Alignment = taCenter
              Title.Caption = #24207#21495
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZVER'
              Title.Alignment = taCenter
              Title.Caption = #29256#26412
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZUPDATEDATE'
              Title.Alignment = taCenter
              Title.Caption = #26356#26032#26085#26399
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZMUSTVER'
              Title.Alignment = taCenter
              Title.Caption = #24517#39035#26356#26032#29256#26412
              Width = 131
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZID'
              Visible = True
            end>
        end
      end
      object tsTask: TTabSheet
        Caption = #20170#26085#26085#24535
        ImageIndex = 2
        object Splitter3: TSplitter
          Left = 401
          Top = 62
          Width = 10
          Height = 386
          Beveled = True
          ResizeStyle = rsLine
        end
        object plTaskTool: TPanel
          Left = 0
          Top = 0
          Width = 946
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object BitBtn10: TBitBtn
            Left = 8
            Top = 8
            Width = 100
            Height = 25
            Action = actTask_Creaet
            Caption = #29983#25104#26085#24535
            TabOrder = 0
          end
          object BitBtn11: TBitBtn
            Left = 112
            Top = 8
            Width = 100
            Height = 25
            Action = actTask_ToMe
            Caption = #25351#25344#32473#25105#30340
            TabOrder = 1
          end
          object BitBtn13: TBitBtn
            Left = 216
            Top = 8
            Width = 100
            Height = 25
            Action = actTask_to
            Caption = #25351#27966#32473
            TabOrder = 2
          end
          object BitBtn19: TBitBtn
            Left = 320
            Top = 8
            Width = 100
            Height = 25
            Action = actTask_CreateByme
            Caption = #30001#25105#21019#24314#30340
            TabOrder = 3
          end
          object btnTask_Save: TBitBtn
            Left = 795
            Top = 7
            Width = 109
            Height = 25
            Action = actTask_Save
            Caption = #20445#23384
            TabOrder = 4
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000FF00FF00FF00FF000000
              0000008080000080800000000000000000000000000000000000000000000000
              0000C0C0C000C0C0C000000000000080800000000000FF00FF00FF00FF000000
              0000008080000080800000000000000000000000000000000000000000000000
              0000C0C0C000C0C0C000000000000080800000000000FF00FF00FF00FF000000
              0000008080000080800000000000000000000000000000000000000000000000
              0000C0C0C000C0C0C000000000000080800000000000FF00FF00FF00FF000000
              0000008080000080800000000000000000000000000000000000000000000000
              00000000000000000000000000000080800000000000FF00FF00FF00FF000000
              0000008080000080800000808000008080000080800000808000008080000080
              80000080800000808000008080000080800000000000FF00FF00FF00FF000000
              0000008080000080800000000000000000000000000000000000000000000000
              00000000000000000000008080000080800000000000FF00FF00FF00FF000000
              00000080800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
              C000C0C0C000C0C0C000000000000080800000000000FF00FF00FF00FF000000
              00000080800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
              C000C0C0C000C0C0C000000000000080800000000000FF00FF00FF00FF000000
              00000080800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
              C000C0C0C000C0C0C000000000000080800000000000FF00FF00FF00FF000000
              00000080800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
              C000C0C0C000C0C0C000000000000080800000000000FF00FF00FF00FF000000
              00000080800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
              C000C0C0C000C0C0C000000000000000000000000000FF00FF00FF00FF000000
              00000080800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
              C000C0C0C000C0C0C00000000000C0C0C00000000000FF00FF00FF00FF000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          end
          object btnTASK_MeCheck: TBitBtn
            Left = 424
            Top = 8
            Width = 100
            Height = 25
            Action = actTASK_MeCheck
            Caption = #35201#25105#23457#26680#30340
            TabOrder = 5
          end
          object dblkcbb1: TDBLookupComboBox
            Left = 537
            Top = 8
            Width = 145
            Height = 23
            DropDownRows = 30
            ImeName = #26497#21697#20116#31508#36755#20837#27861
            KeyField = 'ZID'
            ListField = 'ZNAME'
            ListSource = dsUser
            TabOrder = 6
          end
          object btnTask_FindWho: TBitBtn
            Left = 688
            Top = 7
            Width = 100
            Height = 25
            Action = actTask_FindWho
            Caption = #26597#20182#20154#26085#24535
            TabOrder = 7
          end
        end
        object plTitle: TPanel
          Left = 0
          Top = 40
          Width = 946
          Height = 22
          Align = alTop
          TabOrder = 1
          object DBText1: TDBText
            Left = 405
            Top = 1
            Width = 540
            Height = 20
            Align = alClient
            Color = clGray
            DataField = 'ZVER'
            DataSource = dsProVersion
            Font.Charset = GB2312_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = #23435#20307
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object DBText2: TDBText
            Left = 1
            Top = 1
            Width = 404
            Height = 20
            Align = alLeft
            Color = clGray
            DataField = 'ZNAME'
            DataSource = dsProjectItem
            Font.Charset = GB2312_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = #23435#20307
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object cbEditDesing: TCheckBox
            Left = 798
            Top = 3
            Width = 60
            Height = 17
            Caption = #32534#36753
            Color = clGray
            ParentColor = False
            TabOrder = 0
            OnClick = cbEditDesingClick
          end
        end
        object plTaskList: TPanel
          Left = 0
          Top = 62
          Width = 401
          Height = 386
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 2
          object dgTaskList: TDBGrid
            Left = 0
            Top = 0
            Width = 401
            Height = 346
            Align = alClient
            DataSource = dsTask
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -15
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnDrawColumnCell = dgTaskListDrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'ZUSERNAME'
                Title.Alignment = taCenter
                Title.Caption = #35841#30340
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZDATE'
                Title.Alignment = taCenter
                Title.Caption = #26085#26399
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZNAME'
                Title.Alignment = taCenter
                Title.Caption = #26085#24535#21517#31216
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZSTATUSNAME'
                Title.Alignment = taCenter
                Title.Caption = #29366#24577
                Width = 50
                Visible = True
              end>
          end
          object pnlTaskListBottom: TPanel
            Left = 0
            Top = 346
            Width = 401
            Height = 40
            Align = alBottom
            TabOrder = 1
            object lblPage: TLabel
              Left = 334
              Top = 15
              Width = 56
              Height = 15
              Caption = 'lblPage'
            end
            object btnTask_FirstPage: TBitBtn
              Left = 9
              Top = 10
              Width = 75
              Height = 25
              Action = actTask_FirstPage
              Caption = #31532#19968#39029
              TabOrder = 0
            end
            object btnTask_UpPage: TBitBtn
              Left = 89
              Top = 10
              Width = 75
              Height = 25
              Action = actTask_UpPage
              Caption = #19978#19968#39029
              TabOrder = 1
            end
            object btnTask_NextPage: TBitBtn
              Left = 169
              Top = 10
              Width = 75
              Height = 25
              Action = actTask_NextPage
              Caption = #19979#19968#39029
              TabOrder = 2
            end
            object btnTask_Lastpage: TBitBtn
              Left = 251
              Top = 10
              Width = 75
              Height = 25
              Action = actTask_Lastpage
              Caption = #26368#21518#19968#39029
              TabOrder = 3
            end
          end
        end
        object plTaskContext: TPanel
          Left = 411
          Top = 62
          Width = 535
          Height = 386
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 3
          object pcTasKUser: TPageControl
            Left = 0
            Top = 0
            Width = 535
            Height = 386
            ActivePage = tsUser
            Align = alClient
            TabOrder = 0
            TabPosition = tpBottom
            object tsDesign: TTabSheet
              Caption = #21333#20803#35774#35745
              ImageIndex = 1
              object Splitter4: TSplitter
                Left = 0
                Top = 242
                Width = 527
                Height = 10
                Cursor = crVSplit
                Align = alBottom
                Beveled = True
                ResizeStyle = rsLine
              end
              object DBMDesign: TDBMemo
                Left = 0
                Top = 0
                Width = 527
                Height = 202
                Align = alClient
                DataField = 'ZDESIGN'
                DataSource = dsTask
                ImeName = #26497#21697#20116#31508#36755#20837#27861
                ReadOnly = True
                ScrollBars = ssBoth
                TabOrder = 0
              end
              object DBMTestCase: TDBMemo
                Left = 0
                Top = 252
                Width = 527
                Height = 66
                Align = alBottom
                DataField = 'ZTESTCASE'
                DataSource = dsTask
                ImeName = #26497#21697#20116#31508#36755#20837#27861
                ReadOnly = True
                ScrollBars = ssBoth
                TabOrder = 1
              end
              object pnlBugInfo: TPanel
                Left = 0
                Top = 202
                Width = 527
                Height = 40
                Align = alBottom
                BevelOuter = bvNone
                Color = clMoneyGreen
                TabOrder = 2
                DesignSize = (
                  527
                  40)
                object Label18: TLabel
                  Left = 4
                  Top = 15
                  Width = 8
                  Height = 15
                  Caption = '#'
                  FocusControl = edtBugCode
                end
                object dbtxt1: TDBText
                  Left = 371
                  Top = 14
                  Width = 69
                  Height = 17
                  Alignment = taCenter
                  Anchors = [akRight, akBottom]
                  DataField = 'ZNAME'
                  DataSource = dsBug
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -15
                  Font.Name = #23435#20307
                  Font.Style = []
                  ParentFont = False
                end
                object edtBugCode: TEdit
                  Left = 16
                  Top = 11
                  Width = 90
                  Height = 23
                  ImeName = #26497#21697#20116#31508#36755#20837#27861
                  TabOrder = 0
                end
                object btnFindBug: TBitBtn
                  Left = 111
                  Top = 11
                  Width = 75
                  Height = 25
                  Caption = #26597#35810
                  TabOrder = 1
                  OnClick = btnFindBugClick
                end
                object dbedtZTITLE: TDBEdit
                  Left = 192
                  Top = 11
                  Width = 174
                  Height = 23
                  Anchors = [akLeft, akTop, akRight]
                  DataField = 'ZTITLE'
                  DataSource = dsBug
                  ImeName = #26497#21697#20116#31508#36755#20837#27861
                  TabOrder = 2
                end
                object btnAddDesText: TBitBtn
                  Left = 445
                  Top = 9
                  Width = 75
                  Height = 25
                  Anchors = [akRight, akBottom]
                  Caption = #8593#28155#21152
                  TabOrder = 3
                  OnClick = btnAddDesTextClick
                end
              end
              object pnltestBottom: TPanel
                Left = 0
                Top = 318
                Width = 527
                Height = 40
                Align = alBottom
                BevelOuter = bvNone
                Color = clMoneyGreen
                TabOrder = 3
                object lbl3: TLabel
                  Left = 10
                  Top = 14
                  Width = 329
                  Height = 15
                  Caption = #8593#27979#35797#29992#20363#65292#20070#20889#26684#24335' $123;$234 '#22810#20010#29992'; '#20998#24320
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clBlack
                  Font.Height = -15
                  Font.Name = #23435#20307
                  Font.Style = []
                  ParentFont = False
                end
                object btnTask_gotoTest: TBitBtn
                  Left = 352
                  Top = 7
                  Width = 100
                  Height = 25
                  Action = actTask_gotoTest
                  Caption = #36339#21040#27979#35797#29992#20363
                  TabOrder = 0
                end
              end
            end
            object tsUser: TTabSheet
              Caption = #25191#34892#20154
              ImageIndex = 1
              object dgUser: TDBGrid
                Left = 0
                Top = 0
                Width = 205
                Height = 358
                Align = alLeft
                DataSource = dsTaskUser
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = GB2312_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -15
                TitleFont.Name = #23435#20307
                TitleFont.Style = []
                Columns = <
                  item
                    Alignment = taRightJustify
                    Expanded = False
                    FieldName = 'ZUSER_ID'
                    Title.Alignment = taCenter
                    Title.Caption = 'UID'
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ZUSERNAME'
                    Title.Alignment = taCenter
                    Title.Caption = #22995#21517
                    Width = 141
                    Visible = True
                  end>
              end
              object plUserRight: TPanel
                Left = 205
                Top = 0
                Width = 322
                Height = 358
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object plUserBottom: TPanel
                  Left = 0
                  Top = 317
                  Width = 322
                  Height = 41
                  Align = alBottom
                  BevelOuter = bvNone
                  TabOrder = 0
                  object BitBtn14: TBitBtn
                    Left = 4
                    Top = 10
                    Width = 100
                    Height = 25
                    Action = actTask_Score
                    Caption = #35780#20998
                    TabOrder = 0
                  end
                  object BitBtn16: TBitBtn
                    Left = 108
                    Top = 10
                    Width = 100
                    Height = 25
                    Action = actTask_Finally
                    Caption = #25105#23436#25104#20102
                    TabOrder = 1
                  end
                  object BitBtn17: TBitBtn
                    Left = 212
                    Top = 10
                    Width = 100
                    Height = 25
                    Action = actTask_Action
                    Caption = #28608#27963#26085#24535
                    TabOrder = 2
                  end
                  object BitBtn18: TBitBtn
                    Left = 316
                    Top = 10
                    Width = 100
                    Height = 25
                    Action = actTask_Close
                    Caption = #20851#38381#26085#24535
                    TabOrder = 3
                  end
                end
                object plScore: TPanel
                  Left = 0
                  Top = 0
                  Width = 322
                  Height = 317
                  Align = alClient
                  BevelOuter = bvNone
                  Color = clMoneyGreen
                  TabOrder = 1
                  object Label1: TLabel
                    Left = 24
                    Top = 32
                    Width = 45
                    Height = 15
                    Caption = #28385#20998#65306
                  end
                  object Label2: TLabel
                    Left = 24
                    Top = 96
                    Width = 45
                    Height = 15
                    Caption = #24471#20998#65306
                  end
                  object Label3: TLabel
                    Left = 24
                    Top = 161
                    Width = 45
                    Height = 15
                    Caption = #22791#27880#65306
                  end
                  object Label4: TLabel
                    Left = 24
                    Top = 325
                    Width = 75
                    Height = 15
                    Caption = #35780#20998#26102#38388#65306
                  end
                  object DBText3: TDBText
                    Left = 103
                    Top = 325
                    Width = 163
                    Height = 17
                    Color = clMoneyGreen
                    DataField = 'ZSCOREDATE'
                    DataSource = dsTaskUser
                    ParentColor = False
                  end
                  object Label5: TLabel
                    Left = 24
                    Top = 375
                    Width = 173
                    Height = 15
                    Caption = #27880#24847':'#35780#20998#21518#28857#20851#38381#20219#21153#12290
                  end
                  object Label17: TLabel
                    Left = 24
                    Top = 123
                    Width = 68
                    Height = 15
                    Caption = #20219#21153#20998#25968':'
                  end
                  object lbl1: TLabel
                    Left = 336
                    Top = 123
                    Width = 38
                    Height = 15
                    Caption = #31995#25968':'
                  end
                  object lbl2: TLabel
                    Left = 24
                    Top = 65
                    Width = 68
                    Height = 15
                    Caption = #33258#23450#20998#25968':'
                  end
                  object lbl4: TLabel
                    Left = 270
                    Top = 325
                    Width = 68
                    Height = 15
                    Caption = #20851#38381#26102#38388':'
                  end
                  object dbtxtZCLOSEDATE: TDBText
                    Left = 342
                    Top = 325
                    Width = 147
                    Height = 17
                    DataField = 'ZCLOSEDATE'
                    DataSource = dsTask
                  end
                  object DBEdit1: TDBEdit
                    Left = 100
                    Top = 28
                    Width = 200
                    Height = 23
                    DataField = 'ZPERFACT'
                    DataSource = dsTaskUser
                    TabOrder = 0
                  end
                  object DBEdit2: TDBEdit
                    Left = 100
                    Top = 91
                    Width = 200
                    Height = 23
                    Color = clMenuBar
                    DataField = 'ZSCORE'
                    DataSource = dsTaskUser
                    ImeName = #26497#21697#20116#31508#36755#20837#27861
                    ReadOnly = True
                    TabOrder = 1
                  end
                  object DBCheckBox1: TDBCheckBox
                    Left = 339
                    Top = 29
                    Width = 97
                    Height = 17
                    Caption = #21462#28040#25191#34892#20154
                    DataField = 'ZCANCEL'
                    DataSource = dsTaskUser
                    TabOrder = 2
                    ValueChecked = 'True'
                    ValueUnchecked = 'False'
                  end
                  object dbedtZTASKSCORE: TDBEdit
                    Left = 102
                    Top = 121
                    Width = 198
                    Height = 23
                    Color = clMenuBar
                    DataField = 'ZTASKSCORE'
                    DataSource = dsTaskUser
                    ImeName = #26497#21697#20116#31508#36755#20837#27861
                    ReadOnly = True
                    TabOrder = 3
                  end
                  object dbedtZRATE: TDBEdit
                    Left = 381
                    Top = 117
                    Width = 112
                    Height = 23
                    Color = clMenuBar
                    DataField = 'ZRATE'
                    DataSource = dsTaskUser
                    ImeName = #26497#21697#20116#31508#36755#20837#27861
                    ReadOnly = True
                    TabOrder = 4
                  end
                  object dbedtZSELFSCORE: TDBEdit
                    Left = 101
                    Top = 59
                    Width = 198
                    Height = 23
                    DataField = 'ZSELFSCORE'
                    DataSource = dsTaskUser
                    TabOrder = 5
                  end
                  object dbmmoZREMASK: TDBMemo
                    Left = 103
                    Top = 153
                    Width = 394
                    Height = 156
                    DataField = 'ZREMASK'
                    DataSource = dsTaskUser
                    ScrollBars = ssVertical
                    TabOrder = 6
                  end
                end
              end
            end
            object tsPlan: TTabSheet
              Caption = #20219#21153#36827#24230
              ImageIndex = 2
              object Splitter2: TSplitter
                Left = 0
                Top = 169
                Width = 527
                Height = 10
                Cursor = crVSplit
                Align = alTop
                Beveled = True
                ResizeStyle = rsLine
              end
              object DBGrid1: TDBGrid
                Left = 0
                Top = 0
                Width = 527
                Height = 169
                Align = alTop
                DataSource = dsTaskItem
                ImeName = #26497#21697#20116#31508#36755#20837#27861
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = GB2312_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -15
                TitleFont.Name = #23435#20307
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ZNO'
                    Title.Alignment = taCenter
                    Title.Caption = #24207#21495
                    Width = 48
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ZUSERNAME'
                    Title.Alignment = taCenter
                    Title.Caption = #25191#34892#20154
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ZDATE'
                    Title.Alignment = taCenter
                    Title.Caption = #26102#38388
                    Width = 200
                    Visible = True
                  end>
              end
              object dbmItemDeign: TDBMemo
                Left = 0
                Top = 179
                Width = 527
                Height = 139
                Align = alClient
                DataField = 'ZDESIGN'
                DataSource = dsTaskItem
                ImeName = #26497#21697#20116#31508#36755#20837#27861
                ReadOnly = True
                ScrollBars = ssBoth
                TabOrder = 1
              end
              object plTaskItemBottom: TPanel
                Left = 0
                Top = 318
                Width = 527
                Height = 40
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 2
                object BitBtn15: TBitBtn
                  Left = 8
                  Top = 8
                  Width = 100
                  Height = 25
                  Action = actTask_AddItem
                  Caption = #22686#21152
                  TabOrder = 0
                end
              end
            end
            object tsPanl2: TTabSheet
              Caption = #20219#21153#35745#21010
              ImageIndex = 3
              object plPlan: TPanel
                Left = 0
                Top = 0
                Width = 527
                Height = 358
                Align = alClient
                BevelOuter = bvNone
                Color = clMoneyGreen
                TabOrder = 0
                object Label14: TLabel
                  Left = 16
                  Top = 232
                  Width = 75
                  Height = 15
                  Caption = #20851#38381#26102#38388#65306
                end
                object Label10: TLabel
                  Left = 16
                  Top = 200
                  Width = 106
                  Height = 15
                  Caption = #35745#21010#24037#26399'('#22825')'#65306
                end
                object Label11: TLabel
                  Left = 16
                  Top = 163
                  Width = 105
                  Height = 15
                  Caption = #20219#21153#24320#22987#26102#38388#65306
                end
                object Label7: TLabel
                  Left = 16
                  Top = 98
                  Width = 75
                  Height = 15
                  Caption = #31435#39033#39033#30446#65306
                end
                object Label6: TLabel
                  Left = 17
                  Top = 63
                  Width = 60
                  Height = 15
                  Caption = #21046#21333#20154#65306
                end
                object Label12: TLabel
                  Left = 329
                  Top = 200
                  Width = 99
                  Height = 15
                  Caption = #23454#38469#24037#26399'('#22825'):'
                end
                object Label13: TLabel
                  Left = 329
                  Top = 163
                  Width = 68
                  Height = 15
                  Caption = #23436#25104#26102#38388':'
                end
                object Label9: TLabel
                  Left = 329
                  Top = 62
                  Width = 75
                  Height = 15
                  Caption = #21046#21333#26102#38388#65306
                end
                object Label8: TLabel
                  Left = 329
                  Top = 94
                  Width = 75
                  Height = 15
                  Caption = #39033#30446#29256#26412#65306
                end
                object Label15: TLabel
                  Left = 17
                  Top = 27
                  Width = 90
                  Height = 15
                  Caption = #20219#21153#21333#21517#31216#65306
                end
                object DBEdit4: TDBEdit
                  Left = 116
                  Top = 58
                  Width = 200
                  Height = 23
                  Color = clBtnFace
                  DataField = 'ZUSERNAME'
                  DataSource = dsTask
                  ImeName = #26497#21697#20116#31508#36755#20837#27861
                  ReadOnly = True
                  TabOrder = 0
                end
                object DBEdit8: TDBEdit
                  Left = 115
                  Top = 157
                  Width = 200
                  Height = 23
                  DataField = 'ZBEGINDATE'
                  DataSource = dsTask
                  ImeName = #26497#21697#20116#31508#36755#20837#27861
                  TabOrder = 1
                end
                object DBEdit11: TDBEdit
                  Left = 115
                  Top = 192
                  Width = 200
                  Height = 23
                  DataField = 'ZPALNDAY'
                  DataSource = dsTask
                  ImeName = #26497#21697#20116#31508#36755#20837#27861
                  TabOrder = 2
                end
                object DBEdit12: TDBEdit
                  Left = 115
                  Top = 224
                  Width = 200
                  Height = 23
                  DataField = 'ZCLOSEDATE'
                  DataSource = dsTask
                  ImeName = #26497#21697#20116#31508#36755#20837#27861
                  TabOrder = 3
                end
                object DBEdit9: TDBEdit
                  Left = 441
                  Top = 90
                  Width = 200
                  Height = 23
                  Color = clBtnFace
                  DataField = 'ZPRO_VERSION_ID'
                  DataSource = dsTask
                  ImeName = #26497#21697#20116#31508#36755#20837#27861
                  ReadOnly = True
                  TabOrder = 4
                end
                object DBEdit10: TDBEdit
                  Left = 440
                  Top = 160
                  Width = 200
                  Height = 23
                  DataField = 'ZSUCCESSDATE'
                  DataSource = dsTask
                  ImeName = #26497#21697#20116#31508#36755#20837#27861
                  TabOrder = 5
                end
                object DBEdit7: TDBEdit
                  Left = 440
                  Top = 192
                  Width = 200
                  Height = 23
                  DataField = 'ZDAY'
                  DataSource = dsTask
                  ImeName = #26497#21697#20116#31508#36755#20837#27861
                  TabOrder = 6
                end
                object DBEdit6: TDBEdit
                  Left = 440
                  Top = 58
                  Width = 200
                  Height = 23
                  Color = clBtnFace
                  DataField = 'ZDATE'
                  DataSource = dsTask
                  ImeName = #26497#21697#20116#31508#36755#20837#27861
                  ReadOnly = True
                  TabOrder = 7
                end
                object DBEdit13: TDBEdit
                  Left = 115
                  Top = 24
                  Width = 523
                  Height = 23
                  DataField = 'ZNAME'
                  DataSource = dsTask
                  ImeName = #26497#21697#20116#31508#36755#20837#27861
                  TabOrder = 8
                end
                object dbchkOverWork: TDBCheckBox
                  Left = 120
                  Top = 126
                  Width = 97
                  Height = 17
                  Caption = #21152#29677#26085
                  DataField = 'ZOVERWORK'
                  DataSource = dsTask
                  TabOrder = 9
                  ValueChecked = 'True'
                  ValueUnchecked = 'False'
                end
                object grp1: TGroupBox
                  Left = 16
                  Top = 269
                  Width = 626
                  Height = 71
                  Caption = #23457#26680
                  TabOrder = 10
                  object Label16: TLabel
                    Left = 16
                    Top = 32
                    Width = 83
                    Height = 15
                    Caption = #20219#21153#23457#26680#20154':'
                  end
                  object dblkcbbZCHECKNAME: TDBLookupComboBox
                    Left = 104
                    Top = 27
                    Width = 200
                    Height = 23
                    DataField = 'ZCHECKNAME'
                    DataSource = dsTask
                    ImeName = #26497#21697#20116#31508#36755#20837#27861
                    KeyField = 'ZID'
                    ListField = 'ZNAME'
                    ListSource = dsCheckName
                    TabOrder = 0
                  end
                end
                object dblkcbbZPRO_ID: TDBLookupComboBox
                  Left = 118
                  Top = 91
                  Width = 201
                  Height = 23
                  Color = clBtnFace
                  DataField = 'ZPRO_ID'
                  DataSource = dsTask
                  ImeName = #26497#21697#20116#31508#36755#20837#27861
                  KeyField = 'ZID'
                  ListField = 'ZNAME'
                  ListSource = dsProjectItem
                  ReadOnly = True
                  TabOrder = 11
                end
              end
            end
          end
        end
      end
    end
  end
  object cdsProjectItem: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsProjectItemBeforePost
    BeforeDelete = cdsProjectItemBeforeDelete
    OnNewRecord = cdsProjectItemNewRecord
    Left = 24
    Top = 8
  end
  object dsProjectItem: TDataSource
    DataSet = cdsProjectItem
    Left = 24
    Top = 32
  end
  object ActionList1: TActionList
    Images = DM.ImageList1
    Left = 96
    Top = 8
    object actPro_Add: TAction
      Category = #31435#39033#39033#30446
      Caption = #22686#21152#39033#30446
      OnExecute = actPro_AddExecute
      OnUpdate = actPro_AddUpdate
    end
    object actPro_Save: TAction
      Category = #31435#39033#39033#30446
      Caption = #20445#23384
      Hint = #22686#21152#25110#20462#25913#28857#20445#23384#25165#33021#20445#23384#21040#25968#25454#24211
      OnExecute = actPro_SaveExecute
      OnUpdate = actPro_SaveUpdate
    end
    object actPro_Cancel: TAction
      Category = #31435#39033#39033#30446
      Caption = #21462#28040
      OnExecute = actPro_CancelExecute
      OnUpdate = actPro_CancelUpdate
    end
    object actPro_Del: TAction
      Category = #31435#39033#39033#30446
      Caption = #21024#38500
      OnExecute = actPro_DelExecute
      OnUpdate = actPro_DelUpdate
    end
    object actVer_Add: TAction
      Category = #39033#30446#29256#26412
      Caption = #22686#21152#29256#26412
      OnExecute = actVer_AddExecute
      OnUpdate = actVer_AddUpdate
    end
    object actVer_Del: TAction
      Category = #39033#30446#29256#26412
      Caption = #21024#38500
      OnExecute = actVer_DelExecute
      OnUpdate = actVer_DelUpdate
    end
    object actVer_Save: TAction
      Category = #39033#30446#29256#26412
      Caption = #20445#23384
      OnExecute = actVer_SaveExecute
      OnUpdate = actVer_SaveUpdate
    end
    object actvar_Cancel: TAction
      Category = #39033#30446#29256#26412
      Caption = #21462#28040
      OnExecute = actvar_CancelExecute
      OnUpdate = actvar_CancelUpdate
    end
    object actPro_RefreshData: TAction
      Category = #31435#39033#39033#30446
      Caption = #21047#26032#25968#25454
      Hint = #21047#26032#25968#25454
      OnExecute = actPro_RefreshDataExecute
    end
    object actTask_Creaet: TAction
      Category = #20170#26085#26085#24535
      Caption = #29983#25104#26085#24535
      Hint = #29983#25104#20219#21153#21333
      OnExecute = actTask_CreaetExecute
    end
    object actTask_ToMe: TAction
      Category = #20170#26085#26085#24535
      Caption = #25351#25344#32473#25105#30340
      OnExecute = actTask_ToMeExecute
    end
    object actTask_Save: TAction
      Category = #20170#26085#26085#24535
      Caption = #20445#23384
      Hint = #20445#23384#20462#25913
      ImageIndex = 6
      OnExecute = actTask_SaveExecute
      OnUpdate = actTask_SaveUpdate
    end
    object actTask_to: TAction
      Category = #20170#26085#26085#24535
      Caption = #25351#27966#32473
      OnExecute = actTask_toExecute
      OnUpdate = actTask_toUpdate
    end
    object actTask_AddItem: TAction
      Category = #20170#26085#26085#24535
      Caption = #22686#21152
      OnExecute = actTask_AddItemExecute
      OnUpdate = actTask_AddItemUpdate
    end
    object actTask_Finally: TAction
      Category = #20170#26085#26085#24535
      Caption = #25105#23436#25104#20102
      OnExecute = actTask_FinallyExecute
      OnUpdate = actTask_FinallyUpdate
    end
    object actTask_Close: TAction
      Category = #20170#26085#26085#24535
      Caption = #20851#38381#26085#24535
      OnExecute = actTask_CloseExecute
      OnUpdate = actTask_CloseUpdate
    end
    object actTask_Action: TAction
      Category = #20170#26085#26085#24535
      Caption = #28608#27963#26085#24535
      OnExecute = actTask_ActionExecute
      OnUpdate = actTask_ActionUpdate
    end
    object actTask_Score: TAction
      Category = #20170#26085#26085#24535
      Caption = #35780#20998
      OnExecute = actTask_ScoreExecute
      OnUpdate = actTask_ScoreUpdate
    end
    object actTask_CreateByme: TAction
      Category = #20170#26085#26085#24535
      Caption = #30001#25105#21019#24314#30340
      OnExecute = actTask_CreateBymeExecute
    end
    object actTask_FirstPage: TAction
      Category = #20170#26085#26085#24535
      Caption = #31532#19968#39029
      OnExecute = actTask_FirstPageExecute
      OnUpdate = actTask_FirstPageUpdate
    end
    object actTask_NextPage: TAction
      Category = #20170#26085#26085#24535
      Caption = #19979#19968#39029
      OnExecute = actTask_NextPageExecute
      OnUpdate = actTask_NextPageUpdate
    end
    object actTask_UpPage: TAction
      Category = #20170#26085#26085#24535
      Caption = #19978#19968#39029
      OnExecute = actTask_UpPageExecute
      OnUpdate = actTask_UpPageUpdate
    end
    object actTask_Lastpage: TAction
      Category = #20170#26085#26085#24535
      Caption = #26368#21518#19968#39029
      OnExecute = actTask_LastpageExecute
      OnUpdate = actTask_LastpageUpdate
    end
    object actTASK_MeCheck: TAction
      Category = #20170#26085#26085#24535
      Caption = #35201#25105#23457#26680#30340
      OnExecute = actTASK_MeCheckExecute
    end
    object actTask_gotoTest: TAction
      Category = #20170#26085#26085#24535
      Caption = #36339#21040#27979#35797#29992#20363
      OnExecute = actTask_gotoTestExecute
    end
    object actTask_FindWho: TAction
      Category = #20170#26085#26085#24535
      Caption = #26597#20182#20154#26085#24535
      OnExecute = actTask_FindWhoExecute
    end
  end
  object dsProVersion: TDataSource
    DataSet = cdsProVersion
    Left = 136
    Top = 32
  end
  object cdsProVersion: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsProVersionBeforePost
    BeforeDelete = cdsProVersionBeforeDelete
    OnNewRecord = cdsProVersionNewRecord
    Left = 136
    Top = 5
  end
  object pmExcel: TPopupMenu
    AutoHotkeys = maManual
    Left = 224
    Top = 8
    object N4: TMenuItem
      Caption = #21333#20803#26684#25805#20316
    end
    object N2: TMenuItem
      Caption = #34892#25805#20316
      object N1: TMenuItem
        Caption = #35774#32622#22266#23450#34892
        object miFixedRow: TMenuItem
          Caption = '0'#34892
        end
        object miFixRow: TMenuItem
          Tag = 1
          Caption = '1'#34892
        end
        object N21: TMenuItem
          Tag = 2
          Caption = '2'#34892
        end
        object N31: TMenuItem
          Tag = 3
          Caption = '3'#34892
        end
        object N41: TMenuItem
          Tag = 4
          Caption = '4'#34892
        end
        object N51: TMenuItem
          Tag = 5
          Caption = '5'#34892
        end
      end
    end
    object N3: TMenuItem
      Caption = #21015#25805#20316
      object N5: TMenuItem
        Caption = #35774#32622#22266#23450#21015
        object miFixedCol: TMenuItem
          Caption = '0'#21015
        end
        object N11: TMenuItem
          Tag = 1
          Caption = '1'#21015
        end
        object N22: TMenuItem
          Tag = 2
          Caption = '2'#21015
        end
        object N32: TMenuItem
          Tag = 3
          Caption = '3'#21015
        end
        object N42: TMenuItem
          Tag = 4
          Caption = '4'#21015
        end
        object N52: TMenuItem
          Tag = 5
          Caption = '5'#21015
        end
      end
      object N6: TMenuItem
        Caption = #21069#31227#19968#21015
      end
      object N7: TMenuItem
        Caption = #21521#21518#31227#19968#21015
      end
    end
  end
  object cdsDocs: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 8
  end
  object cdsTask: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsTaskBeforePost
    AfterScroll = cdsTaskAfterScroll
    OnCalcFields = cdsTaskCalcFields
    OnNewRecord = cdsTaskNewRecord
    Left = 297
    Top = 6
  end
  object dsTask: TDataSource
    DataSet = cdsTask
    Left = 296
    Top = 36
  end
  object cdsTaskType: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 8
  end
  object dsTaskType: TDataSource
    DataSet = cdsTaskType
    Left = 336
    Top = 40
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 8
  end
  object cdsStatus: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 8
  end
  object dsStatus: TDataSource
    DataSet = cdsStatus
    Left = 376
    Top = 40
  end
  object cdsTaskUser: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsTaskUserBeforePost
    OnNewRecord = cdsTaskUserNewRecord
    Left = 416
    Top = 8
  end
  object dsTaskUser: TDataSource
    DataSet = cdsTaskUser
    Left = 416
    Top = 40
  end
  object cdsTaskItem: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsTaskItemBeforePost
    OnCalcFields = cdsTaskItemCalcFields
    OnNewRecord = cdsTaskItemNewRecord
    Left = 456
    Top = 8
  end
  object dsTaskItem: TDataSource
    DataSet = cdsTaskItem
    Left = 456
    Top = 40
  end
  object dsCheckName: TDataSource
    DataSet = cdsCheckName
    Left = 535
    Top = 38
  end
  object cdsCheckName: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 534
    Top = 6
  end
  object cdsBug: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 569
    Top = 5
  end
  object dsBug: TDataSource
    DataSet = cdsBug
    Left = 570
    Top = 37
  end
  object cdsUser: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 609
    Top = 5
  end
  object dsUser: TDataSource
    DataSet = cdsUser
    Left = 609
    Top = 37
  end
end
