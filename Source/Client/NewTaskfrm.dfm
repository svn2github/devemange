inherited NewTaskDlg: TNewTaskDlg
  Left = 312
  Top = 168
  BorderStyle = bsDialog
  Caption = #26032#24314#20219#21153#21333
  ClientHeight = 430
  ClientWidth = 719
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object BitBtn1: TBitBtn
    Left = 600
    Top = 387
    Width = 100
    Height = 25
    TabOrder = 0
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 488
    Top = 387
    Width = 100
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object GroupBox1: TGroupBox
    Left = 14
    Top = 17
    Width = 691
    Height = 135
    Caption = #22522#26412#24773#20917
    TabOrder = 2
    object Label1: TLabel
      Left = 15
      Top = 24
      Width = 90
      Height = 15
      Caption = #20219#21153#21333#32534#21495#65306
    end
    object DBText1: TDBText
      Left = 107
      Top = 23
      Width = 250
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
      Left = 372
      Top = 25
      Width = 38
      Height = 15
      Caption = #31867#22411':'
    end
    object Label9: TLabel
      Left = 15
      Top = 50
      Width = 75
      Height = 15
      Caption = #31435#39033#39033#30446#65306
    end
    object Label10: TLabel
      Left = 372
      Top = 51
      Width = 60
      Height = 15
      Caption = #29256#26412#21495#65306
    end
    object dbtxtVer: TDBText
      Left = 431
      Top = 50
      Width = 199
      Height = 17
      Color = clSkyBlue
      DataField = 'ZLASTVER'
      DataSource = dsCloneProjectName
      ParentColor = False
    end
    object DBEdit1: TDBEdit
      Left = 107
      Top = 77
      Width = 521
      Height = 23
      DataField = 'ZNAME'
      DataSource = ProjectManageClientDlg.dsTask
      TabOrder = 0
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 429
      Top = 22
      Width = 200
      Height = 23
      DataField = 'ZTYPE'
      DataSource = ProjectManageClientDlg.dsTask
      KeyField = 'ZID'
      ListField = 'ZNAME'
      ListSource = ProjectManageClientDlg.dsTaskType
      TabOrder = 1
    end
    object dbchkAddWork: TDBCheckBox
      Left = 108
      Top = 108
      Width = 97
      Height = 17
      Caption = #21152#29677#20219#21153#21333
      DataField = 'ZOVERWORK'
      DataSource = ProjectManageClientDlg.dsTask
      TabOrder = 2
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object dblkcbbZPRO_ID: TDBLookupComboBox
      Left = 106
      Top = 46
      Width = 254
      Height = 23
      DataField = 'ZPRO_ID'
      DataSource = ProjectManageClientDlg.dsTask
      KeyField = 'ZID'
      ListField = 'ZNAME'
      ListSource = dsCloneProjectName
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 15
    Top = 158
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
      Left = 442
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
      Left = 442
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
  object GroupBox3: TGroupBox
    Left = 16
    Top = 302
    Width = 689
    Height = 75
    Caption = #20219#21153#23457#26680
    TabOrder = 4
    object Label11: TLabel
      Left = 16
      Top = 25
      Width = 83
      Height = 15
      Caption = #25351#23450#23457#26680#20154':'
    end
    object lbl1: TLabel
      Left = 353
      Top = 49
      Width = 75
      Height = 15
      Caption = #26085#24535#26085#26399#65306
    end
    object dblkcbbName: TDBLookupComboBox
      Left = 112
      Top = 20
      Width = 203
      Height = 23
      DataField = 'ZCHECKNAME'
      DataSource = ProjectManageClientDlg.dsTask
      KeyField = 'ZID'
      ListField = 'ZNAME'
      ListSource = ProjectManageClientDlg.dsCheckName
      TabOrder = 0
    end
    object chkSelf: TCheckBox
      Left = 336
      Top = 21
      Width = 191
      Height = 17
      Caption = #25351#27966#32473#33258#24049','#24182#33258#23450#20998#25968':'
      TabOrder = 1
    end
    object edtSelfSrce: TEdit
      Left = 527
      Top = 17
      Width = 134
      Height = 23
      TabOrder = 2
    end
    object dtp1: TDateTimePicker
      Left = 434
      Top = 44
      Width = 231
      Height = 23
      Hint = #21482#26377#25351#27966#32473#33258#24049#25165#33021#35774#32622
      Date = 40736.434164131950000000
      Time = 40736.434164131950000000
      TabOrder = 3
    end
  end
  object cdsCloneProjectName: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 18
    Top = 392
  end
  object dsCloneProjectName: TDataSource
    DataSet = cdsCloneProjectName
    Left = 54
    Top = 392
  end
end
