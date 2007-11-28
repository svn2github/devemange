object BFSSRDM: TBFSSRDM
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  OnDestroy = RemoteDataModuleDestroy
  Left = 474
  Top = 229
  Height = 422
  Width = 509
  object adsSQL: TADODataSet
    Connection = RdmADOConn
    Parameters = <>
    Left = 120
    Top = 16
  end
  object adsQuery: TADODataSet
    Connection = RdmADOConn
    Parameters = <>
    Left = 33
    Top = 87
  end
  object dspQuery: TDataSetProvider
    DataSet = adsQuery
    Options = [poAllowCommandText]
    Left = 32
    Top = 144
  end
  object dspQueryEx: TDataSetProvider
    DataSet = adsQueryEx
    Options = [poAllowCommandText]
    Left = 111
    Top = 142
  end
  object adsQueryEx: TADODataSet
    Connection = RdmADOConn
    Parameters = <>
    Left = 112
    Top = 87
  end
  object dspQueryEx2: TDataSetProvider
    DataSet = adsQueryEx2
    Options = [poAllowCommandText]
    Left = 196
    Top = 142
  end
  object adsQueryEx2: TADODataSet
    Connection = RdmADOConn
    Parameters = <>
    Left = 197
    Top = 85
  end
  object adsQueryEx3: TADODataSet
    Connection = RdmADOConn
    Parameters = <>
    Left = 277
    Top = 85
  end
  object dspQueryEx3: TDataSetProvider
    DataSet = adsQueryEx3
    Options = [poAllowCommandText]
    Left = 276
    Top = 142
  end
  object adsQueryEx4: TADODataSet
    Connection = RdmADOConn
    Parameters = <>
    Left = 365
    Top = 85
  end
  object dspQueryEx4: TDataSetProvider
    DataSet = adsQueryEx4
    Options = [poAllowCommandText]
    Left = 364
    Top = 142
  end
  object RdmADOConn: TADOConnection
    LoginPrompt = False
    Left = 40
    Top = 16
  end
  object dspCommand: TDataSetProvider
    OnDataRequest = dspCommandDataRequest
    Left = 270
    Top = 16
  end
  object ADOQuery: TADOQuery
    Connection = RdmADOConn
    Parameters = <>
    Left = 192
    Top = 16
  end
  object SMTP: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 25
    AuthenticationType = atNone
    Left = 40
    Top = 280
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Priority = mpHigh
    Recipients = <>
    ReplyTo = <>
    Left = 88
    Top = 280
  end
end
