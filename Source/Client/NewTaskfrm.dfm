inherited NewTaskDlg: TNewTaskDlg
  Left = 307
  Top = 183
  BorderStyle = bsDialog
  Caption = #26032#24314#20219#21153#21333
  ClientHeight = 379
  ClientWidth = 726
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object BitBtn1: TBitBtn
    Left = 552
    Top = 328
    Width = 100
    Height = 25
    TabOrder = 0
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 440
    Top = 328
    Width = 100
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object GroupBox1: TGroupBox
    Left = 17
    Top = 17
    Width = 689
    Height = 120
    Caption = #22522#26412#24773#20917
    TabOrder = 2
    object Label1: TLabel
      Left = 15
      Top = 56
      Width = 90
      Height = 15
      Caption = #20219#21153#21333#32534#21495#65306
    end
    object DBText1: TDBText
      Left = 108
      Top = 51
      Width = 200
      Height = 17
      Color = clSkyBlue
      DataField = 'ZCODE'
      DataSource = ProjectManageClientDlg.dsTask
      ParentColor = False
    end
    object Label2: TLabel
      Left = 15
      Top = 80
      Width = 75
      Height = 15
      Caption = #20219#21153#21517#31216#65306
    end
    object Label3: TLabel
      Left = 332
      Top = 53
      Width = 38
      Height = 15
      Caption = #31867#22411':'
    end
    object Label9: TLabel
      Left = 15
      Top = 32
      Width = 75
      Height = 15
      Caption = #39033#30446#21517#31216#65306
    end
    object DBText2: TDBText
      Left = 108
      Top = 27
      Width = 200
      Height = 17
      Color = clSkyBlue
      DataField = 'ZNAME'
      DataSource = ProjectManageClientDlg.dsProjectItem
      ParentColor = False
    end
    object Label10: TLabel
      Left = 332
      Top = 32
      Width = 60
      Height = 15
      Caption = #29256#26412#21495#65306
    end
    object DBText3: TDBText
      Left = 397
      Top = 27
      Width = 200
      Height = 17
      Color = clSkyBlue
      DataField = 'ZVER'
      DataSource = ProjectManageClientDlg.dsProVersion
      ParentColor = False
    end
    object DBEdit1: TDBEdit
      Left = 107
      Top = 76
      Width = 494
      Height = 23
      DataField = 'ZNAME'
      DataSource = ProjectManageClientDlg.dsTask
      TabOrder = 0
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 399
      Top = 49
      Width = 200
      Height = 23
      DataField = 'ZTYPE'
      DataSource = ProjectManageClientDlg.dsTask
      KeyField = 'ZID'
      ListField = 'ZNAME'
      ListSource = ProjectManageClientDlg.dsTaskType
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 15
    Top = 146
    Width = 692
    Height = 135
    Caption = #20219#21153#36827#24230
    TabOrder = 3
    object Label4: TLabel
      Left = 11
      Top = 32
      Width = 106
      Height = 15
      Caption = #35745#21010#24037#26399'('#22825')'#65306
    end
    object Label5: TLabel
      Left = 11
      Top = 64
      Width = 98
      Height = 15
      Caption = #20219#21153#24320#22987#26102#38388':'
    end
    object Label6: TLabel
      Left = 336
      Top = 31
      Width = 106
      Height = 15
      Caption = #23454#38469#24037#26399'('#22825')'#65306
    end
    object Label7: TLabel
      Left = 336
      Top = 59
      Width = 105
      Height = 15
      Caption = #20219#21153#23436#25104#26102#38388#65306
    end
    object Label8: TLabel
      Left = 12
      Top = 96
      Width = 105
      Height = 15
      Caption = #20219#21153#20851#38381#26102#38388#65306
    end
    object DBEdit2: TDBEdit
      Left = 112
      Top = 27
      Width = 200
      Height = 23
      DataField = 'ZPALNDAY'
      DataSource = ProjectManageClientDlg.dsTask
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 440
      Top = 26
      Width = 200
      Height = 23
      DataField = 'ZDAY'
      DataSource = ProjectManageClientDlg.dsTask
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 112
      Top = 59
      Width = 200
      Height = 23
      DataField = 'ZBEGINDATE'
      DataSource = ProjectManageClientDlg.dsTask
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 440
      Top = 59
      Width = 200
      Height = 23
      DataField = 'ZSUCCESSDATE'
      DataSource = ProjectManageClientDlg.dsTask
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 112
      Top = 91
      Width = 200
      Height = 23
      DataField = 'ZCLOSEDATE'
      DataSource = ProjectManageClientDlg.dsTask
      TabOrder = 4
    end
  end
end
