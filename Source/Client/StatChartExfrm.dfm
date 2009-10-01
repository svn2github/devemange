inherited StatChartDlg: TStatChartDlg
  Left = 134
  Top = 173
  Width = 891
  Height = 579
  Caption = #22270#34920
  OldCreateOrder = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 15
  object pnlTool: TPanel
    Left = 0
    Top = 0
    Width = 883
    Height = 68
    Align = alTop
    TabOrder = 0
    object chkTotal: TCheckBox
      Left = 241
      Top = 31
      Width = 66
      Height = 17
      Caption = #24635#20998
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = chkTotalClick
    end
    object chkSubmitBugCount: TCheckBox
      Left = 6
      Top = 8
      Width = 97
      Height = 17
      Caption = #25552#20132'Bug'#25968
      Checked = True
      State = cbChecked
      TabOrder = 1
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
      TabOrder = 2
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
      TabOrder = 3
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
      TabOrder = 4
      OnClick = chkAnswerTestCountClick
    end
    object chkWorkOverTime: TCheckBox
      Left = 240
      Top = 8
      Width = 125
      Height = 17
      Caption = #21152#29677#26102#38388'('#23567#26102')'
      Checked = True
      State = cbChecked
      TabOrder = 5
      OnClick = chkWorkOverTimeClick
    end
    object Button1: TButton
      Left = 624
      Top = 6
      Width = 100
      Height = 25
      Caption = #24635#20998#20026#38646#21024#38500
      TabOrder = 6
      OnClick = Button1Click
    end
    object BitBtn1: TBitBtn
      Left = 624
      Top = 35
      Width = 100
      Height = 25
      Caption = #21152#29677#20026#38646
      TabOrder = 7
      OnClick = BitBtn1Click
    end
  end
  object dbcht1: TDBChart
    Left = 0
    Top = 68
    Width = 883
    Height = 477
    Hint = 'Click on a Bar to see an example of event handling.'
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Color = 8454016
    BackWall.Pen.Visible = False
    BottomWall.Color = clRed
    Foot.Font.Charset = DEFAULT_CHARSET
    Foot.Font.Color = clRed
    Foot.Font.Height = -15
    Foot.Font.Name = 'Arial'
    Foot.Font.Style = [fsBold]
    Foot.Frame.Color = clScrollBar
    LeftWall.Brush.Color = clWhite
    LeftWall.Color = 16777088
    Title.Brush.Color = clWhite
    Title.Brush.Style = bsClear
    Title.Color = 16777088
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -16
    Title.Font.Name = 'Arial'
    Title.Font.Style = [fsBold, fsItalic]
    Title.Frame.Color = 8421440
    Title.Frame.Width = 4
    Title.Text.Strings = (
      #20154#21592#24471#20998#23545#27604#34920)
    BackColor = 8454016
    BottomAxis.Grid.Color = clScrollBar
    Chart3DPercent = 40
    ClipPoints = False
    Frame.Visible = False
    LeftAxis.Grid.Color = clScrollBar
    Legend.Color = clAqua
    Legend.Font.Charset = DEFAULT_CHARSET
    Legend.Font.Color = clBlack
    Legend.Font.Height = -16
    Legend.Font.Name = 'Arial'
    Legend.Font.Style = [fsBold, fsItalic]
    Legend.Frame.Color = clTeal
    Legend.Frame.Width = 4
    Legend.ShadowSize = 11
    Legend.TextStyle = ltsRightValue
    Legend.TopPos = 5
    RightAxis.Grid.Color = clScrollBar
    TopAxis.Grid.Color = clScrollBar
    Align = alClient
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object brsrsSubmitBugCount: TBarSeries
      Marks.ArrowLength = 20
      Marks.Style = smsValue
      Marks.Visible = True
      DataSource = cds1
      SeriesColor = clRed
      Title = #25552#20132'Bug'#25968
      XLabelsSource = 'ZUSERNAME'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'ZSubmitBugCount'
    end
    object brsrsAnswerBugCount: TBarSeries
      Marks.ArrowLength = 20
      Marks.Style = smsValue
      Marks.Visible = True
      DataSource = cds1
      SeriesColor = clBlue
      Title = #35299#20915'bug'#25968
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'ZAnswerBugCount'
    end
    object brsrsBuildTestCount: TBarSeries
      Marks.ArrowLength = 20
      Marks.Style = smsValue
      Marks.Visible = True
      DataSource = cds1
      SeriesColor = clYellow
      Title = #25552#20132#27979#35797#29992#20363
      XLabelsSource = 'ZUSERNAME'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'ZBuildTestCount'
    end
    object brsrsAnswerTestCount: TBarSeries
      Marks.ArrowLength = 20
      Marks.Style = smsValue
      Marks.Visible = True
      DataSource = cds1
      SeriesColor = clWhite
      Title = #20851#38381#27979#35797#29992#20363
      XLabelsSource = 'ZUSERNAME'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'ZAnswerTestCount'
    end
    object brsrsWorkOverTime: TBarSeries
      Marks.ArrowLength = 20
      Marks.Style = smsValue
      Marks.Visible = True
      DataSource = cds1
      SeriesColor = clGreen
      Title = #21152#29677#26102#38388'('#23567#26102')'
      XLabelsSource = 'ZUSERNAME'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'calcHour'
    end
    object brsrsSeries1: TBarSeries
      Marks.ArrowLength = 20
      Marks.Style = smsValue
      Marks.Visible = True
      DataSource = cds1
      SeriesColor = clNavy
      Title = #24635#20998
      XLabelsSource = 'ZUSERNAME'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'ZTotal'
    end
  end
  object cds1: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    OnCalcFields = cds1CalcFields
    Left = 160
    Top = 72
    Data = {
      370100009619E0BD01000000180000000D0000000000030000003701095A5553
      45524E414D4501004900000001000557494454480200020014000F5A416E7377
      6572427567436F756E7404000100000000000F5A5375626D6974427567436F75
      6E7404000100000000000E5A5265706C79427567436F756E7404000100000000
      000C5A5265416374696F6E42756704000100000000000C5A4275674672616374
      696F6E04000100000000000A5A5461736B436F756E7404000100000000000D5A
      5461736B4672616374696F6E04000100000000000D5A576F726B4F7665725469
      6D6504000100000000000F5A4275696C6454657374436F756E74040001000000
      0000105A416E7377657254657374436F756E740400010000000000065A534F43
      52450400010000000000065A546F74616C04000100000000000000}
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
    object intgrfldcds1ZTotal: TIntegerField
      FieldName = 'ZTotal'
    end
    object fltfldcds1calcHour: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcHour'
      Calculated = True
    end
  end
  object ds1: TDataSource
    DataSet = cds1
    Left = 200
    Top = 72
  end
end
