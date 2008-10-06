object BFSSRDM: TBFSSRDM
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  OnDestroy = RemoteDataModuleDestroy
  Left = 350
  Top = 185
  Height = 422
  Width = 509
  object adsSQL: TADODataSet
    Parameters = <>
    Left = 120
    Top = 16
  end
  object adsQuery: TADODataSet
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
    Parameters = <>
    Left = 197
    Top = 85
  end
  object adsQueryEx3: TADODataSet
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
  object dspCommand: TDataSetProvider
    OnDataRequest = dspCommandDataRequest
    Left = 270
    Top = 16
  end
  object ADOQuery: TADOQuery
    Parameters = <>
    Left = 192
    Top = 16
  end
  object SMTP: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 25
    AuthenticationType = atNone
    Left = 272
    Top = 320
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Priority = mpHigh
    Recipients = <>
    ReplyTo = <>
    Left = 322
    Top = 319
  end
  object spExce: TADOStoredProc
    Parameters = <>
    Left = 56
    Top = 16
  end
  object spDataSet: TADOStoredProc
    Parameters = <>
    Left = 31
    Top = 206
  end
  object dspDataSet: TDataSetProvider
    DataSet = spDataSet
    Left = 32
    Top = 264
  end
  object cdsDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDataSet'
    Left = 32
    Top = 320
  end
end
