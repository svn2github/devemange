inherited StatChartDlg: TStatChartDlg
  Left = 72
  Top = 143
  Width = 1008
  Height = 579
  Caption = #22270#34920
  OldCreateOrder = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 15
  object pnlTool: TPanel
    Left = 0
    Top = 0
    Width = 992
    Height = 68
    Align = alTop
    TabOrder = 0
    object bvl1: TBevel
      Left = 512
      Top = 3
      Width = 17
      Height = 65
      Shape = bsLeftLine
    end
    object chkSubmitBugCount: TCheckBox
      Left = 6
      Top = 8
      Width = 97
      Height = 17
      Caption = #25552#20132'Bug'#25968
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = chkSubmitBugCountClick
    end
    object chkAnswerBugCount: TCheckBox
      Left = 6
      Top = 31
      Width = 97
      Height = 17
      Caption = #35299#20915'bug'#25968
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = chkAnswerBugCountClick
    end
    object chkBuildTestCount: TCheckBox
      Left = 113
      Top = 7
      Width = 121
      Height = 17
      Caption = #25552#20132#27979#35797#29992#20363
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = chkBuildTestCountClick
    end
    object chkAnswerTestCount: TCheckBox
      Left = 114
      Top = 32
      Width = 122
      Height = 17
      Caption = #20851#38381#27979#35797#29992#20363
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = chkAnswerTestCountClick
    end
    object chkWorkOverTime: TCheckBox
      Left = 346
      Top = 8
      Width = 125
      Height = 17
      Caption = #21152#29677#26102#38388'('#23567#26102')'
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = chkWorkOverTimeClick
    end
    object BitBtn1: TBitBtn
      Left = 742
      Top = 5
      Width = 120
      Height = 25
      Caption = #21152#29677#20026#38646#19981#26174#31034
      TabOrder = 5
      OnClick = BitBtn1Click
    end
    object chkTaskFraction: TCheckBox
      Left = 237
      Top = 8
      Width = 97
      Height = 17
      Caption = #20219#21153#21333#24471#20998
      TabOrder = 6
      OnClick = chkTaskFractionClick
    end
    object chk3D: TCheckBox
      Left = 521
      Top = 8
      Width = 50
      Height = 17
      Caption = '3D'
      Checked = True
      State = cbChecked
      TabOrder = 7
      OnClick = chk3DClick
    end
    object edt1: TEdit
      Left = 517
      Top = 40
      Width = 81
      Height = 23
      ReadOnly = True
      TabOrder = 8
    end
    object edt2: TEdit
      Left = 603
      Top = 40
      Width = 131
      Height = 23
      ReadOnly = True
      TabOrder = 9
    end
    object BitBtn2: TBitBtn
      Left = 868
      Top = 5
      Width = 100
      Height = 25
      Caption = #25335#36125#21040#21098#20999#26495
      TabOrder = 10
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 868
      Top = 35
      Width = 100
      Height = 25
      Caption = #25171#21360#39044#35272
      TabOrder = 11
      OnClick = BitBtn3Click
    end
    object chkZSvnSubimtCount: TCheckBox
      Left = 237
      Top = 32
      Width = 97
      Height = 18
      Caption = 'SVN'#25552#20132#25968
      Checked = True
      State = cbChecked
      TabOrder = 12
      OnClick = chkZSvnSubimtCountClick
    end
    object btn1: TBitBtn
      Left = 743
      Top = 34
      Width = 120
      Height = 25
      Caption = 'SVN'#25552#20132#20026#38646#19981#26174#31034
      TabOrder = 13
      OnClick = btn1Click
    end
  end
  object dbcht1: TDBChart
    Left = 0
    Top = 68
    Width = 992
    Height = 473
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Color = 8454016
    BackWall.Pen.Visible = False
    BottomWall.Color = clSilver
    Foot.Font.Height = -15
    Foot.Font.Style = [fsBold]
    Foot.Frame.Color = clScrollBar
    LeftWall.Brush.Color = clWhite
    LeftWall.Color = 16777088
    PrintProportional = False
    Title.Brush.Color = clWhite
    Title.Brush.Style = bsClear
    Title.Color = 16777088
    Title.Font.Height = -16
    Title.Font.Style = [fsBold, fsItalic]
    Title.Frame.Color = 8421440
    Title.Frame.Width = 4
    Title.Text.Strings = (
      #20154#21592#24471#20998#23545#27604#34920)
    Title.Visible = False
    BottomAxis.Grid.Color = clScrollBar
    Chart3DPercent = 40
    ClipPoints = False
    Frame.Visible = False
    LeftAxis.Grid.Color = clScrollBar
    Legend.Alignment = laTop
    Legend.Color = clAqua
    Legend.ColorWidth = 15
    Legend.Font.Charset = ANSI_CHARSET
    Legend.Font.Height = -14
    Legend.Font.Name = #26032#23435#20307
    Legend.Frame.Color = clTeal
    Legend.Frame.Width = 4
    Legend.Symbol.Width = 15
    Legend.TextStyle = ltsRightValue
    Legend.TopPos = 0
    RightAxis.Grid.Color = clScrollBar
    TopAxis.Grid.Color = clScrollBar
    Align = alClient
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnMouseMove = dbcht1MouseMove
    object brsrsSubmitBugCount: TBarSeries
      Marks.Callout.Brush.Color = clBlack
      Marks.Style = smsValue
      Marks.Visible = True
      DataSource = cds1
      Title = #25552#20132'Bug'#25968
      XLabelsSource = 'ZUSERNAME'
      Gradient.Direction = gdTopBottom
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'ZSubmitBugCount'
    end
    object brsrsAnswerBugCount: TBarSeries
      Marks.Callout.Brush.Color = clBlack
      Marks.Style = smsValue
      Marks.Visible = True
      DataSource = cds1
      SeriesColor = clBlue
      Title = #35299#20915'bug'#25968
      Gradient.Direction = gdTopBottom
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'ZAnswerBugCount'
    end
    object brsrsBuildTestCount: TBarSeries
      Marks.Callout.Brush.Color = clBlack
      Marks.Style = smsValue
      Marks.Visible = True
      DataSource = cds1
      SeriesColor = clYellow
      Title = #25552#20132#27979#35797#29992#20363
      XLabelsSource = 'ZUSERNAME'
      Gradient.Direction = gdTopBottom
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'ZBuildTestCount'
    end
    object brsrsAnswerTestCount: TBarSeries
      Marks.Callout.Brush.Color = clBlack
      Marks.Style = smsValue
      Marks.Visible = True
      DataSource = cds1
      SeriesColor = clWhite
      Title = #20851#38381#27979#35797#29992#20363
      XLabelsSource = 'ZUSERNAME'
      Gradient.Direction = gdTopBottom
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'ZAnswerTestCount'
    end
    object brsrsZTaskFraction: TBarSeries
      Active = False
      Marks.Callout.Brush.Color = clBlack
      Marks.Style = smsValue
      Marks.Visible = True
      DataSource = cds1
      SeriesColor = clGray
      Title = #20219#21153#21333#24471#20998
      XLabelsSource = 'ZUSERNAME'
      Gradient.Direction = gdTopBottom
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'ZTaskFraction'
    end
    object brsrsWorkOverTime: TBarSeries
      Marks.Callout.Brush.Color = clBlack
      Marks.Style = smsValue
      Marks.Visible = True
      DataSource = cds1
      Title = #21152#29677#26102#38388'('#23567#26102')'
      XLabelsSource = 'ZUSERNAME'
      Gradient.Direction = gdTopBottom
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'calcHour'
    end
    object brsrsZSvnSubimtCount: TBarSeries
      Marks.Callout.Brush.Color = clBlack
      Marks.Style = smsValue
      Marks.Visible = True
      DataSource = cds1
      Title = 'SVN'#25552#20132#25968
      XLabelsSource = 'ZUSERNAME'
      Gradient.Direction = gdTopBottom
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'ZSvnSubimtCount'
    end
  end
  object cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = cds1CalcFields
    Left = 160
    Top = 72
    object strngfldcds1ZUSERNAME: TStringField
      FieldName = 'ZUSERNAME'
    end
    object intgrfldcds1ZAnswerBugCount: TIntegerField
      FieldName = 'ZAnswerBugCount'
    end
    object intgrfldcds1ZSubmitBugCount: TIntegerField
      FieldName = 'ZSubmitBugCount'
    end
    object intgrfldcds1ZReplyBugCount: TIntegerField
      FieldName = 'ZReplyBugCount'
    end
    object intgrfldcds1ZReActionBug: TIntegerField
      FieldName = 'ZReActionBug'
    end
    object intgrfldcds1ZBugFraction: TIntegerField
      FieldName = 'ZBugFraction'
    end
    object intgrfldcds1ZTaskCount: TIntegerField
      FieldName = 'ZTaskCount'
    end
    object intgrfldcds1ZTaskFraction: TIntegerField
      FieldName = 'ZTaskFraction'
    end
    object intgrfldcds1ZWorkOverTime: TIntegerField
      FieldName = 'ZWorkOverTime'
    end
    object intgrfldcds1ZBuildTestCount: TIntegerField
      FieldName = 'ZBuildTestCount'
    end
    object intgrfldcds1ZAnswerTestCount: TIntegerField
      FieldName = 'ZAnswerTestCount'
    end
    object intgrfldcds1ZSOCRE: TIntegerField
      FieldName = 'ZSOCRE'
    end
    object fltfldcds1calcHour: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcHour'
      Calculated = True
    end
    object intgrfldcds1ZSvnSubimtCount: TIntegerField
      FieldName = 'ZSvnSubimtCount'
    end
    object intgrfldcds1ZSvnSubimt_M_Count: TIntegerField
      FieldName = 'ZSvnSubimt_M_Count'
    end
    object intgrfldcds1ZSvnSubimt_D_Count: TIntegerField
      FieldName = 'ZSvnSubimt_D_Count'
    end
    object intgrfldcds1ZSvnSubimt_A_Count: TIntegerField
      FieldName = 'ZSvnSubimt_A_Count'
    end
  end
  object ds1: TDataSource
    DataSet = cds1
    Left = 200
    Top = 72
  end
end
