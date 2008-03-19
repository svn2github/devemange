inherited ProjectManageClientDlg: TProjectManageClientDlg
  Left = 72
  Top = 128
  Width = 1173
  Caption = #39033#30446#31649#29702
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object plonvisible: TPanel
    Left = 0
    Top = 0
    Width = 1165
    Height = 70
    Align = alTop
    TabOrder = 0
    Visible = False
  end
  object plcenter: TPanel
    Left = 0
    Top = 70
    Width = 1165
    Height = 536
    Align = alClient
    BevelOuter = bvLowered
    Caption = 'plcenter'
    TabOrder = 1
    object pcProject: TPageControl
      Left = 1
      Top = 1
      Width = 1163
      Height = 534
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
          Width = 1155
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
            Left = 300
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
            Left = 410
            Top = 8
            Width = 100
            Height = 25
            Action = actPro_Cancel
            Caption = #21462#28040
            TabOrder = 3
          end
          object BitBtn4: TBitBtn
            Left = 189
            Top = 8
            Width = 100
            Height = 25
            Action = actPro_Del
            Caption = #21024#38500
            TabOrder = 4
          end
          object BitBtn9: TBitBtn
            Left = 528
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
          Width = 1155
          Height = 464
          Align = alClient
          DataSource = dsProjectItem
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
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
            end>
        end
      end
      object tsProjectVer: TTabSheet
        Caption = #39033#30446#29256#26412
        ImageIndex = 1
        object Splitter1: TSplitter
          Left = 0
          Top = 153
          Width = 1155
          Height = 10
          Cursor = crVSplit
          Align = alBottom
          Beveled = True
          ResizeStyle = rsLine
        end
        object dbProName: TDBText
          Left = 0
          Top = 40
          Width = 1155
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
          Width = 1155
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
          Top = 163
          Width = 1155
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
          Width = 1155
          Height = 96
          Align = alClient
          DataSource = dsProVersion
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 2
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
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
        Caption = #20219#21153#21333
        ImageIndex = 2
        object Splitter3: TSplitter
          Left = 401
          Top = 62
          Width = 10
          Height = 442
          Beveled = True
          ResizeStyle = rsLine
        end
        object plTaskTool: TPanel
          Left = 0
          Top = 0
          Width = 1155
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            1155
            40)
          object BitBtn10: TBitBtn
            Left = 8
            Top = 8
            Width = 100
            Height = 25
            Action = actTask_Creaet
            Caption = #29983#25104#20219#21153#21333
            TabOrder = 0
          end
          object BitBtn11: TBitBtn
            Left = 118
            Top = 8
            Width = 100
            Height = 25
            Action = actTask_ToMe
            Caption = #25351#25344#32473#25105#30340
            TabOrder = 1
          end
          object BitBtn12: TBitBtn
            Left = 1049
            Top = 7
            Width = 100
            Height = 25
            Action = actTask_Save
            Anchors = [akTop, akRight]
            Caption = #20445#23384
            TabOrder = 2
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
          object BitBtn13: TBitBtn
            Left = 229
            Top = 8
            Width = 100
            Height = 25
            Action = actTask_to
            Caption = #25351#27966#32473
            TabOrder = 3
          end
          object BitBtn19: TBitBtn
            Left = 342
            Top = 8
            Width = 100
            Height = 25
            Action = actTask_CreateByme
            Caption = #30001#25105#21019#24314#30340
            TabOrder = 4
          end
        end
        object plTitle: TPanel
          Left = 0
          Top = 40
          Width = 1155
          Height = 22
          Align = alTop
          TabOrder = 1
          DesignSize = (
            1155
            22)
          object DBText1: TDBText
            Left = 440
            Top = 1
            Width = 714
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
            Width = 439
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
            Left = 1094
            Top = 3
            Width = 55
            Height = 17
            Anchors = [akTop, akRight]
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
          Height = 442
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 2
          object dgTaskList: TDBGrid
            Left = 0
            Top = 0
            Width = 401
            Height = 442
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
            Columns = <
              item
                Expanded = False
                FieldName = 'ZNo'
                Title.Alignment = taCenter
                Title.Caption = #24207#21495
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZNAME'
                Title.Alignment = taCenter
                Title.Caption = #20219#21153#21333#21517#31216
                Width = 280
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
        end
        object plTaskContext: TPanel
          Left = 411
          Top = 62
          Width = 744
          Height = 442
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 3
          object pcTasKUser: TPageControl
            Left = 0
            Top = 0
            Width = 744
            Height = 442
            ActivePage = tsDesign
            Align = alClient
            TabOrder = 0
            TabPosition = tpBottom
            object tsDesign: TTabSheet
              Caption = #21333#20803#35774#35745
              ImageIndex = 1
              object Splitter4: TSplitter
                Left = 0
                Top = 253
                Width = 736
                Height = 10
                Cursor = crVSplit
                Align = alBottom
                Beveled = True
                ResizeStyle = rsLine
              end
              object DBMDesign: TDBMemo
                Left = 0
                Top = 0
                Width = 736
                Height = 253
                Align = alClient
                DataField = 'ZDESIGN'
                DataSource = dsTask
                ReadOnly = True
                ScrollBars = ssBoth
                TabOrder = 0
              end
              object DBMTestCase: TDBMemo
                Left = 0
                Top = 263
                Width = 736
                Height = 151
                Align = alBottom
                DataField = 'ZTESTCASE'
                DataSource = dsTask
                ReadOnly = True
                ScrollBars = ssBoth
                TabOrder = 1
              end
            end
            object tsUser: TTabSheet
              Caption = #25191#34892#20154
              ImageIndex = 1
              object dgUser: TDBGrid
                Left = 0
                Top = 0
                Width = 241
                Height = 414
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
                Left = 241
                Top = 0
                Width = 495
                Height = 414
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object plUserBottom: TPanel
                  Left = 0
                  Top = 373
                  Width = 495
                  Height = 41
                  Align = alBottom
                  BevelOuter = bvNone
                  TabOrder = 0
                  object BitBtn14: TBitBtn
                    Left = 12
                    Top = 8
                    Width = 100
                    Height = 25
                    Action = actTask_Score
                    Caption = #35780#20998
                    TabOrder = 0
                  end
                  object BitBtn16: TBitBtn
                    Left = 128
                    Top = 8
                    Width = 100
                    Height = 25
                    Action = actTask_Finally
                    Caption = #25105#23436#25104#20102
                    TabOrder = 1
                  end
                  object BitBtn17: TBitBtn
                    Left = 249
                    Top = 8
                    Width = 100
                    Height = 25
                    Action = actTask_Action
                    Caption = #28608#27963#20219#21153
                    TabOrder = 2
                  end
                  object BitBtn18: TBitBtn
                    Left = 362
                    Top = 8
                    Width = 100
                    Height = 25
                    Action = actTask_Close
                    Caption = #20851#38381#20219#21153
                    TabOrder = 3
                  end
                end
                object plScore: TPanel
                  Left = 0
                  Top = 0
                  Width = 495
                  Height = 373
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
                    Top = 61
                    Width = 45
                    Height = 15
                    Caption = #24471#20998#65306
                  end
                  object Label3: TLabel
                    Left = 26
                    Top = 92
                    Width = 45
                    Height = 15
                    Caption = #22791#27880#65306
                  end
                  object Label4: TLabel
                    Left = 24
                    Top = 128
                    Width = 75
                    Height = 15
                    Caption = #35780#20998#26102#38388#65306
                  end
                  object DBText3: TDBText
                    Left = 100
                    Top = 125
                    Width = 200
                    Height = 17
                    Color = clMoneyGreen
                    DataField = 'ZSCOREDATE'
                    DataSource = dsTaskUser
                    ParentColor = False
                  end
                  object Label5: TLabel
                    Left = 24
                    Top = 184
                    Width = 180
                    Height = 15
                    Caption = #27880#24847#65292#35780#20998#21518#28857#20851#38381#20219#21153#12290
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
                    Top = 56
                    Width = 200
                    Height = 23
                    Color = clMenuBar
                    DataField = 'ZSCORE'
                    DataSource = dsTaskUser
                    ReadOnly = True
                    TabOrder = 1
                  end
                  object DBEdit3: TDBEdit
                    Left = 100
                    Top = 88
                    Width = 400
                    Height = 23
                    DataField = 'ZREMASK'
                    DataSource = dsTaskUser
                    TabOrder = 2
                  end
                  object DBCheckBox1: TDBCheckBox
                    Left = 328
                    Top = 27
                    Width = 97
                    Height = 17
                    Caption = #21462#28040#25191#34892#20154
                    DataField = 'ZCANCEL'
                    DataSource = dsTaskUser
                    TabOrder = 3
                    ValueChecked = 'True'
                    ValueUnchecked = 'False'
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
                Width = 736
                Height = 10
                Cursor = crVSplit
                Align = alTop
                Beveled = True
                ResizeStyle = rsLine
              end
              object DBGrid1: TDBGrid
                Left = 0
                Top = 0
                Width = 736
                Height = 169
                Align = alTop
                DataSource = dsTaskItem
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
                Width = 736
                Height = 195
                Align = alClient
                DataField = 'ZDESIGN'
                DataSource = dsTaskItem
                ReadOnly = True
                ScrollBars = ssBoth
                TabOrder = 1
              end
              object plTaskItemBottom: TPanel
                Left = 0
                Top = 374
                Width = 736
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
                Width = 736
                Height = 414
                Align = alClient
                BevelOuter = bvNone
                Color = clMoneyGreen
                TabOrder = 0
                object Label14: TLabel
                  Left = 16
                  Top = 226
                  Width = 75
                  Height = 15
                  Caption = #20851#38381#26102#38388#65306
                end
                object Label10: TLabel
                  Left = 16
                  Top = 194
                  Width = 106
                  Height = 15
                  Caption = #35745#21010#24037#26399'('#22825')'#65306
                end
                object Label11: TLabel
                  Left = 16
                  Top = 157
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
                  Left = 361
                  Top = 194
                  Width = 99
                  Height = 15
                  Caption = #23454#38469#24037#26399'('#22825'):'
                end
                object Label13: TLabel
                  Left = 361
                  Top = 157
                  Width = 68
                  Height = 15
                  Caption = #23436#25104#26102#38388':'
                end
                object Label9: TLabel
                  Left = 361
                  Top = 62
                  Width = 75
                  Height = 15
                  Caption = #21046#21333#26102#38388#65306
                end
                object Label8: TLabel
                  Left = 361
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
                  Left = 121
                  Top = 58
                  Width = 200
                  Height = 23
                  Color = clBtnFace
                  DataField = 'ZUSERNAME'
                  DataSource = dsTask
                  ReadOnly = True
                  TabOrder = 0
                end
                object DBEdit5: TDBEdit
                  Left = 121
                  Top = 90
                  Width = 200
                  Height = 23
                  Color = clBtnFace
                  DataField = 'ZPRO_ID'
                  DataSource = dsTask
                  ReadOnly = True
                  TabOrder = 1
                end
                object DBEdit8: TDBEdit
                  Left = 120
                  Top = 151
                  Width = 200
                  Height = 23
                  DataField = 'ZBEGINDATE'
                  DataSource = dsTask
                  TabOrder = 2
                end
                object DBEdit11: TDBEdit
                  Left = 120
                  Top = 186
                  Width = 200
                  Height = 23
                  DataField = 'ZPALNDAY'
                  DataSource = dsTask
                  TabOrder = 3
                end
                object DBEdit12: TDBEdit
                  Left = 120
                  Top = 218
                  Width = 200
                  Height = 23
                  DataField = 'ZCLOSEDATE'
                  DataSource = dsTask
                  TabOrder = 4
                end
                object DBEdit9: TDBEdit
                  Left = 473
                  Top = 90
                  Width = 200
                  Height = 23
                  Color = clBtnFace
                  DataField = 'ZPRO_VERSION_ID'
                  DataSource = dsTask
                  ReadOnly = True
                  TabOrder = 5
                end
                object DBEdit10: TDBEdit
                  Left = 472
                  Top = 154
                  Width = 200
                  Height = 23
                  DataField = 'ZSUCCESSDATE'
                  DataSource = dsTask
                  TabOrder = 6
                end
                object DBEdit7: TDBEdit
                  Left = 472
                  Top = 186
                  Width = 200
                  Height = 23
                  DataField = 'ZDAY'
                  DataSource = dsTask
                  TabOrder = 7
                end
                object DBEdit6: TDBEdit
                  Left = 472
                  Top = 58
                  Width = 200
                  Height = 23
                  Color = clBtnFace
                  DataField = 'ZDATE'
                  DataSource = dsTask
                  ReadOnly = True
                  TabOrder = 8
                end
                object DBEdit13: TDBEdit
                  Left = 120
                  Top = 24
                  Width = 553
                  Height = 23
                  DataField = 'ZNAME'
                  DataSource = dsTask
                  TabOrder = 9
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
      Category = #20219#21153#21333
      Caption = #29983#25104#20219#21153#21333
      Hint = #29983#25104#20219#21153#21333
      OnExecute = actTask_CreaetExecute
    end
    object actTask_ToMe: TAction
      Category = #20219#21153#21333
      Caption = #25351#25344#32473#25105#30340
      OnExecute = actTask_ToMeExecute
    end
    object actTask_Save: TAction
      Category = #20219#21153#21333
      Caption = #20445#23384
      Hint = #20445#23384#20462#25913
      ImageIndex = 6
      OnExecute = actTask_SaveExecute
      OnUpdate = actTask_SaveUpdate
    end
    object actTask_to: TAction
      Category = #20219#21153#21333
      Caption = #25351#27966#32473
      OnExecute = actTask_toExecute
      OnUpdate = actTask_toUpdate
    end
    object actTask_AddItem: TAction
      Category = #20219#21153#21333
      Caption = #22686#21152
      OnExecute = actTask_AddItemExecute
      OnUpdate = actTask_AddItemUpdate
    end
    object actTask_Finally: TAction
      Category = #20219#21153#21333
      Caption = #25105#23436#25104#20102
      OnExecute = actTask_FinallyExecute
      OnUpdate = actTask_FinallyUpdate
    end
    object actTask_Close: TAction
      Category = #20219#21153#21333
      Caption = #20851#38381#20219#21153
      OnExecute = actTask_CloseExecute
      OnUpdate = actTask_CloseUpdate
    end
    object actTask_Action: TAction
      Category = #20219#21153#21333
      Caption = #28608#27963#20219#21153
      OnExecute = actTask_ActionExecute
      OnUpdate = actTask_ActionUpdate
    end
    object actTask_Score: TAction
      Category = #20219#21153#21333
      Caption = #35780#20998
      OnExecute = actTask_ScoreExecute
      OnUpdate = actTask_ScoreUpdate
    end
    object actTask_CreateByme: TAction
      Category = #20219#21153#21333
      Caption = #30001#25105#21019#24314#30340
      OnExecute = actTask_CreateBymeExecute
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
    Left = 296
    Top = 8
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
    Left = 680
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
end
