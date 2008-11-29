/******************************************************************************
*
*         网络文件管理器
*         文件名：BFSS_TABLES.SQ  版本：1.0
*         创建日期：2007-11-9    作者:龙仕云
*         最后修改时间:2008-4-28
*
* 
*   注意: 
*	因mssql2000内没有boolean的类型，采用bit的处理 0=False 1=True
*
*   修改内容:
*       1.将项目文档改为txt的格式 2008-3-10   
*       2.增加任务单功能. 2008-3-11
*       3.文件管理的文件权限,可以设计为与目录一样的权限. 2008-4-28
*          这样我们不可以一一对每一个文件都做权限。
*       4.增加系统参数表 TB_SYSPARAMS 2006-5-13
*       5.TB_USER 内增加 TCHECKTASK : bit 2008-8-2
*       6.增加测试功能模块. 作者:龙仕云 2008-9-5
*       7.增加测试功能模块的关闭等级 作者:龙仕云龙 2008-11-29
*
******************************************************************************/

/*#########################################################
 #
 # 文件管理器
 #
 #########################################################*/

/*文件树目录结构*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_FILE_TREE]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_FILE_TREE]
go

create table TB_FILE_TREE(
	ZID	int IDENTITY (1, 1) not null, /*ID并自动产生编号*/
	ZPID    int not null default -1,      /*上级ID=-1表示根目录 默认值为-1 */
	ZNAME	varchar(200) not null,        /*名称*/
	ZNOTE	varchar(200),                 /*说明*/
	ZHASCHILD bit not null,               /*=True表示有下级*/
	ZPublic  bit not null default 0,      /*公共 表示没有权限处理 2008-4-28*/
	constraint PK_TB_FILE_TREE primary key(ZID)
)
go

/*文件列表 TB_FILE_ITEM*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_FILE_ITEM]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_FILE_ITEM]
go

create table TB_FILE_ITEM(
	ZTREE_ID       int not null,           /*树ID*/
        ZSTYPE         int not null,           /*类型，分文件管理，bug管理，项目文档*/ 
	ZID	       int not null,           /*文件id*/
	ZVER           int not null,           /*文件的版本号*/
	ZNAME          varchar(200) not null,  /*名称*/
	ZEDITER_ID     int ,                   /*编辑人*/
        ZFILEPATH      varchar(200),           /*文件路径*/
	ZSTATUS        int not null,           /*状态 = 0 表示没有人编辑 =1表示在编辑*/	
	ZEXT           varchar(10),            /*文件的扩展名*/
	ZEDITDATETIME  datetime,               /*文件编辑时间*/
	ZSTRUCTVER     int,                    /*永大文件的结构版本*/
	ZTYPE          int not null,           /*文件类型 0=永大软件文件*/
	ZNEWVER        bit not null,           /*是否是最新版本*/
	ZNOTE          text,                   /*文件说明*/
	ZSIZE          int not null,           /*文件大小*/
	ZParentPri     bit not null default 0, /*是否采用上级树目录的权限 2008-4-28*/
	ZOWNER         int not null default 1, /*文件的创建人 1=admin 2008-4-28*/
	constraint PK_TB_FILE_ITEM primary key(ZTREE_ID,ZTYPE,ZID,ZVER)
)
go

/*文件内容 TB_FILE_CONTEXT*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_FILE_CONTEXT]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_FILE_CONTEXT]
go

create table TB_FILE_CONTEXT(
	ZFILE_ID  int not null,          /*文件ID*/
	ZGROUPID  int not null,          /*文件块的顺序号*/
	ZVER      int not null,          /*文件版本*/
	ZSTREAM   image not null,        /*文件块内容*/
	constraint PK_TB_FILE_CONTEXT primary key(ZFILE_ID,ZGROUPID,ZVER)       
)
go

/*用户列表 TB_USER_ITEM */
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_USER_ITEM]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_USER_ITEM]
go

create table TB_USER_ITEM(
	ZID        int IDENTITY (1, 1) not null,         /*自动产生的ID*/
	ZNAME      varchar(20) not null,                 /*用户名*/
	ZPASS      varchar(20),                          /*密码*/
	ZSTOP      bit,                                  /*是否禁用*/
	ZTYPE      int not null,                         /*类型=0系统用户,1=开发人员 2=测试人员,3=其他人员 不能删除*/
	ZEMAIL     varchar(50),                          /*邮箱*/
	ZGROUP_ID  int,                                  /*组ID*/
	ZPRIVGROUP int,                                  /*权限组*/
	ZCHECKTASK bit default 0,                        /*审核任务单* 2008-8-2*/
	constraint PK_TB_USER_ITEM primary key(ZID)       
)
go

/*用户权限表 TB_USER_PRIVILEGE */
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_USER_PRIVILEGE]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_USER_PRIVILEGE]
go

create table TB_USER_PRIVILEGE(
	ZID            int IDENTITY (1, 1) not null, /*ID值*/
	ZUSER_ID       int not null,    /*用户ID*/
	ZSTYLE         int not null,    /*类型 是大的模块*/
	ZSUBSTYLE      int not null,    /*子类型 如树,编辑列表*/
	ZMODULEID      int not null,    /*模块ID就是文件，目录的ID 对象ID*/
	ZRIGHTMASK     int not null,    /*权限掩码  1=查看 2=修改 4=删除 8=增加*/
	constraint PK_TB_USER_PRIVILEGE primary key(ZID,ZUSER_ID,ZSTYLE,ZMODULEID)   
)
go


/*#########################################################
 #
 # 项目管理 
 #
 #########################################################*/

/*项目列表*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_PRO_ITEM]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_PRO_ITEM]
go

create table TB_PRO_ITEM(
	ZID            int IDENTITY (1, 1) not null,             /*项目ID*/
	ZNAME          varchar(200) not null,                    /*项目名称*/
	ZOPENDATE      datetime not null,                        /*项目开始时间*/
	ZLASTVER       varchar(50),                              /*项目的最新版本*/
	ZLASTDATE      datetime,                                 /*项目最后更新时间*/
	ZMANAGERID     int ,                                     /*项目的负责人*/
	ZUNITS         varchar(200),                             /*项目的使用单位*/     
	ZHIGHVERID     int not null default -1,                  /*最新版本号的ID值*/
	ZTESTTEAM      varchar(100),                             /*测试小组成员 格式 名称(编号) ,用于自动生成测试任务.     
	constraint PK_TB_PRO_ITEM primary key(ZID)   
)
go

/*项目版本*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_PRO_VERSION]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_PRO_VERSION]
go

create table TB_PRO_VERSION(
	ZID            int IDENTITY (1, 1) not null,             /*版本ID*/
	ZPRO_ID        int not null,                             /*项目ID*/
	ZVER           varchar(50) not null,                     /*版本号格式 1.2.5.67*/
	ZUPDATEDATE    datetime,                                 /*更新时间*/
	ZCONTEXT       text,                                     /*更新说明*/
	ZMUSTVER       bit,                                      /*是否是必须更新的版本*/
	constraint PK_TB_PRO_VERSION primary key(ZID,ZPRO_ID)   
)
go

/*项目文档列表*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_PRO_DOCUMENT]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_PRO_DOCUMENT]
go

create table TB_PRO_DOCUMENT(
	ZID            int IDENTITY (1, 1) not null,             /*ID*/
	ZPID           int not null,                             /*上级ID = -1 表示根目录*/
	ZNAME          varchar(200),                             /*文档名称*/ 
  	ZSTYLE         int not null,                             /*类型 = 0 目录，=1文档*/ 
	ZSORT          int ,                                     /*排序号*/
	ZHASCHILD      bit not null,                             /*是否有下级*/
	ZDOCTYPE       int ,                                     /*文档类型 0=Excel 1=txt*/
    ZCONTEXT       text,                                     /*内容 2008-3-11*/
	constraint PK_TB_PRO_DOCUMENT primary key(ZID),   
)
go

/*任务单*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_TASK]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_TASK]
go
create table TB_TASK(
	ZCODE           varchar(30) not null,                   /*自行按一定的规则生成 人员编号_TASK_时间*/
	ZTYPE           int not null,                           /*类型 新增功能=0,变更功能=1*/
	ZNAME			varchar(100),                   /*名称*/
	ZUSER_ID        int ,					/*创建人*/				/*任务单制单人,并有关闭任务单功能*/
	ZPRO_ID         int not null,                           /*项目ID*/
	ZPRO_VERSION_ID int not null,                           /*项目版本,只有定版后才能生成任务单*/
	ZDESIGN         text,                                   /*项目的设计说明*/
	ZTESTCASE       text,                                   /*测试用例*/
	ZSTATUS         int not null,                           /*状态 待分发=0 ; 执行中=1 ; 撤消=2; 完成=3 ; 关闭=4;激活=5*/
	ZDATE           datetime,                               /*制单时间*/
	ZPALNDAY        float not null default 1,               /*计划工期(天)*/

	ZBEGINDATE      datetime,	                        /*任务开始时间 由任务执行人生成,这时状态变更为执行中*/
	ZDAY            float,                                  /*实际的天数*/
	ZSUCCESSDATE    datetime,                               /*完成时间*/
	ZCLOSEDATE      datetime,                               /*关闭时间*/
	ZCHECKNAME      int not null default 0,                 /*审核人*/
	ZOVERWORK       bit  default 0,                         /*是否是加班任务单*/
	
	
	constraint PK_TB_TASK primary key(ZCODE) 
)
go

/*任务单执行人*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_TASK_USER]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_TASK_USER]
go
create table TB_TASK_USER(
	ZTASK_CODE      varchar(30) not null,
	ZUSER_ID        int not null,			        /*执行的人*/
	ZTASKSCORE      float,                                  /*任务得分*/ 
	ZPERFACT        float,                                  /*满分分数*/
	ZSCORE          float,                                  /*得分 = 任务得分*分数倍数*/
	ZREMASK         varchar(200),                           /*备注*/
	ZSCOREDATE      datetime,                               /*评分的时间，用于统计一个月的得分*/
        ZRATE           float not null default 1,               /*分数倍数*/ 
	ZCANCEL	        bit not null default 1,                 /*取消执行*/
	ZSELFSCORE      float,                                  /*自定分数*/
	constraint PK_TB_TASK_USER primary key(ZTASK_CODE,ZUSER_ID)
)
go

/*任务单明细*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_TASK_ITEM]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_TASK_ITEM]
go
create table TB_TASK_ITEM(
	ZID				int IDENTITY (1, 1) not null,
	ZTASK_CODE		varchar(30) not null,
	ZDATE			datetime,
	ZDESIGN         text,									/*测试说明*/
	ZUSER_ID        int  not null,                          /*书写人员*/

	constraint PK_TB_TASK_ITEM primary key(ZID)
)
go

/*任务单参数表*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_TASK_PARAMS]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_TASK_PARAMS]
go

create table TB_TASK_PARAMS(
	ZTYPE 	     int not null,                                   /*类型*/
	ZID          int not null,                                   /*ID值*/
	ZNAME        varchar(200)                                    /*值*/
	constraint PK_TB_TASK_PARAMS primary key(ZTYPE,ZID)  
)
go

/*##########################################################
 #
 # BUG管理 
 #
 ###########################################################*/

/*BUG树结构*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_BUG_TREE]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_BUG_TREE]
go

create table TB_BUG_TREE(
	ZID            int IDENTITY (1, 1) not null,             /*BUG ID*/
	ZPID           int not null,                             /*上级BUG项目ID*/
	ZPRO_ID        int not null,                             /*对应的立项项目*/
	ZNAME          varchar(200) not null,                    /*名称*/ 
	ZAddDATE       datetime not null,                        /*增加的时间*/
	ZSORT          int not null,                             /*排序号*/
	ZHASCHILD      bit not null,                             /*=True表示有下级*/
	constraint PK_TB_BUG_TREE primary key(ZID)   
)
go

/*BUG列表*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_BUG_ITEM]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_BUG_ITEM]
go

create table TB_BUG_ITEM(
	ZID            int  not null,                             /*BUG ID*/
	ZTREE_ID       int  not null,                             /*BUG项目ID*/
	ZPRO_ID        int  not null,                             /*立项项目项目ID*/
	ZTREEPATH      varchar(200) not null,                     /*项目路径*/ 
	ZTITLE         varchar(200),                              /*项目标题*/
	ZOS            int  not null,                             /*操作系统*/
	ZTYPE          int,                                       /*错误类型*/
	ZLEVEL         int  not null,                             /*BUG第级*/
	ZSTATUS        int  not null,                             /*BUG状态*/
	ZMAILTO        varchar(200),                              /*邮件给别人,用#13#10分开*/
	ZOPENEDBY      int  not null,                             /*BUG创建人*/
	ZOPENEDDATE    datetime not null,                         /*创建时间*/
	ZOPENVER       int not null,                              /*当时有问题的版本*/
	ZASSIGNEDTO    int,                                       /*分派给*/
        ZASSIGNEDDATE  datetime,                                  /*分派时间*/
	ZRESOLVEDBY    int,                                       /*解决人*/
	ZRESOLUTION    int,                                       /*解决方案*/
	ZRESOLVEDVER   int,                                       /*解决的版本*/
	ZRESOLVEDDATE  datetime,                                  /*解决的时间*/
	ZLASTEDITEDBY  int not null,                              /*最后修改的人*/
	ZLASTEDITEDDATE datetime not null,                        /*最后修改的时间*/ 
	ZOVERFRACTION  bit not null default 0                     /*=True表示已记过分了*/ 
	
	constraint PK_TB_BUG_ITEM primary key(ZID desc,ZTREE_ID)   
)
go
  --创建以最后修改日期为索引 
  CREATE  INDEX [TK_BUG_ITEM_LastDate] ON [dbo].[TB_BUG_ITEM]([ZLASTEDITEDDATE] DESC ) ON [PRIMARY]
go

/*BUG的回复信息*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_BUG_HISTORY]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_BUG_HISTORY]
go

create table TB_BUG_HISTORY(
	ZID            int IDENTITY (1, 1) not null,             /*回复 ID*/
	ZBUG_ID        int not null,                             /*BUG的ID*/
	ZUSER_ID       int not null,                             /*用户ID*/
	ZSTATUS        int not null,                             /*状态*/ 
	ZACTIONDATE    datetime not null,                        /*时间*/
	ZCONTEXT       text,                                     /*内容*/
	ZANNEXFILE_ID  int,                                      /*附件内容，可能是图片这个更直接*/
	ZANNEXFILENAME varchar(50),                              /*附件名称*/
	constraint PK_TB_BUG_HISTORY primary key(ZID,ZBUG_ID)   
)
go

/*BUG参数表*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_BUG_PARAMS]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_BUG_PARAMS]
go

create table TB_BUG_PARAMS(
	ZTYPE 	     int not null,                                   /*类型*/
	ZID          int not null,                                   /*ID值*/
	ZNAME        varchar(200)                                    /*值*/
	constraint PK_TB_BUG_PARAMS primary key(ZTYPE,ZID)  
)
go


/*每日一语*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_TODAYSAY]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_TODAYSAY]
go

create table TB_TODAYSAY(
	ZID          int IDENTITY (1, 1) not null,                   /*ID值,自动产生内容*/
	ZNAME        varchar(200),                                   /*内容*/
	ZDATE        datetime,                                       /*创建时间*/
	ZSTOP        bit default 1                                   /*停止 1=True 0=False*/                 
	constraint PK_TB_TODAYSAY primary key(ZID)  
)
go

/*系统参数表*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_SYSPARAMS]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_SYSPARAMS]
go

create table TB_SYSPARAMS(
	ZNAME        varchar(20),                                   /*名称*/
	ZVALUE       varchar(200),
	ZREMARK      varchar(100)                                   /*备注*/ 
	constraint PK_TB_SYSPARAMS primary key(ZNAME)  
)
go



/*测试主表*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_TEST_ITEM]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_TEST_ITEM]
go

create table TB_TEST_ITEM(
	ZID          int not null,                                  /*编号*/
	ZNAME        varchar(20),                                   /*名称*/
	ZSTATUS      int not null,                                  /*状态=3*/
	ZOPENEDBY    int not null,                                  /*创建人*/
	ZOPENEDDATE  datetime not null,                             /*创建时间*/
	ZLEVEL       int,                                           /*优先级=0*/
	ZTYPE        int,                                           /*要测试的类型=1*/
	ZASSIGNEDTO  int,                                           /*指派给*/
	ZRESULT      int,                                           /*测试结果*/
	ZTESTRESULTBY int not null,                                 /*测试结果人,最后执行的人*/
	ZRESULTDATE  datetime not null,                             /*最后测试的时间*/
	ZTESTMETHOD  int,                                           /*测试方法=2*/
	ZCASEBUG     varchar(50),                                   /*相关bug*/
	ZCASETASK    varchar(50),                                   /*相关任务单*/
	ZMAILTO      varchar(100),                                  /*邮件通知*/
	
	--测试的项目	
	ZPRO_ID      int,                                           /*项目ID*/
	ZPRO_VER     int,                                           /*项目版本*/
	ZPRO_SVN     int,                                           /*svn的版本号*/
	ZREMORK      varchar(200),                                  /*备注*/

	--关闭状态 作者：龙仕云 2008-11-29
	ZCLOSESTATUS int ,                                          /*0=高 1=中 2=一般 3=无效 4=扣分*/
	ZCLOSESOCRE  int not null default 0,                        /*分值,主要给创建人*/
	

	constraint PK_TB_TEST_ITEM primary key(ZID)  
)
go

/*TEST的回复信息*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_TEST_RESULT]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_TEST_RESULT]
go

create table TB_TEST_RESULT(
	ZID            int IDENTITY (1, 1) not null,             /*ID*/
	ZTEST_ID       int not null,                             /*TEST的ID*/
	ZACTION        varchar(100),                             /*输入动作*/ 
	ZTRUEVALUE     varchar(100),                             /*期望的输出或是真正结果*/ 
	ZINFACE        varchar(100),                             /*实际值*/
	ZPASS          bit not null default 0,                   /*是否通过*/ 
	constraint PK_TB_TEST_HISTORY primary key(ZID,ZTEST_ID)   
)
go

/*测试参数表*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_TEST_PARAMS]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_TEST_PARAMS]
go

create table TB_TEST_PARAMS(
	ZTYPE 	     int not null,                                   /*类型*/
	ZID          int not null,                                   /*ID值*/
	ZNAME        varchar(200)                                    /*值*/
	constraint PK_TB_TEST_PARAMS primary key(ZTYPE,ZID)  
)
go













