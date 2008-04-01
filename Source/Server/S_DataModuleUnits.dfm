object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 437
  Top = 254
  Height = 384
  Width = 337
  object dsUser: TDataSource
    DataSet = adsUser
    Left = 24
    Top = 144
  end
  object dsUserPrivilege: TDataSource
    DataSet = adsUserPrivilege
    Left = 96
    Top = 144
  end
  object adsUser: TADODataSet
    BeforePost = adsUserBeforePost
    AfterScroll = adsUserAfterScroll
    OnNewRecord = adsUserNewRecord
    CommandText = 'TB_USER_ITEM'
    CommandType = cmdTable
    Parameters = <>
    Left = 24
    Top = 88
  end
  object adsUserPrivilege: TADODataSet
    BeforePost = adsUserPrivilegeBeforePost
    OnFilterRecord = adsUserPrivilegeFilterRecord
    OnNewRecord = adsUserPrivilegeNewRecord
    CommandText = 'TB_USER_PRIVILEGE'
    CommandType = cmdTable
    Parameters = <>
    Left = 96
    Top = 87
  end
  object aqryPublic: TADOQuery
    Parameters = <>
    Left = 24
    Top = 24
  end
end
