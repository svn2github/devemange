inherited DeveCalendarDlg: TDeveCalendarDlg
  Left = 533
  Top = 295
  BorderStyle = bsNone
  Caption = #26085#31243#25353#25490
  ClientHeight = 221
  ClientWidth = 363
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 363
    Height = 221
    Align = alClient
    Caption = 'pnl1'
    Color = clMaroon
    TabOrder = 0
    object dbgrd1: TDBGrid
      Left = 6
      Top = 5
      Width = 351
      Height = 210
      Ctl3D = True
      DataSource = ds1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      PopupMenu = pm1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = dbgrd1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ZCODENAME'
          Title.Caption = #32534#21495
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZCONTENT'
          Title.Caption = #20869#23481
          Width = 356
          Visible = True
        end>
    end
    object ani1: TAnimate
      Left = 134
      Top = 76
      Width = 80
      Height = 50
      Color = clBtnFace
      ParentColor = False
      StopFrame = 29
    end
  end
  object tmr1: TTimer
    Enabled = False
    OnTimer = tmr1Timer
    Left = 112
    Top = 152
  end
  object cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 112
  end
  object ds1: TDataSource
    DataSet = cds1
    Left = 224
    Top = 80
  end
  object pm1: TPopupMenu
    AutoHotkeys = maManual
    Left = 48
    Top = 88
    object mniread: TMenuItem
      Action = act_read
    end
  end
  object actlst1: TActionList
    Left = 96
    Top = 88
    object act_read: TAction
      Caption = #21047#26032
      OnExecute = act_readExecute
      OnUpdate = act_readUpdate
    end
  end
end
