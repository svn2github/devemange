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
*       8.增加问题管理内的期限 作者:龙仕云 2008-12-20
*       9.增加发布管理功能 作者：龙仕云 20080-12-20
*      10.增加加班单的功能 作者: 龙仕云 2009-7-3 
*      11.增加在用户表内的svn账号名 作者:龙仕云 2009-9-30
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
        ZSTYPE         int not null,           /*类型，分文件管理=0，bug管理=1，项目文档=2 测试管理=4 项目计划=5*/ 
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
	ZCONTENTID     int ,                   /*如是bug则是bug的id号,用于关联bug管理 2012-8-29*/
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
	ZLOCALGUID varchar(36),          /*本地的存文件的路径*/
	ZTYPE     int default 0,         /*=0表示采用Stream保存到库内,否则采用是文件保存某目录下*/
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
	ZSVNNAME   varchar(20),                          /*SVN的账号名 2009-9-30*/
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
	ZTESTTEAM      varchar(100),                             /*测试小组成员 格式 名称(编号) ,用于自动生成测试任务.*/
	ZSVNLOGGUID    varchar(36),                              /*项目的SVN日志GUID*/
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

	ZBEGINDATE      datetime,	                        /*任务开始时间(日记时间) 由任务执行人生成,这时状态变更为执行中*/
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
	ZID			int IDENTITY (1, 1) not null,
	ZTASK_CODE		varchar(30) not null,
	ZDATE			datetime,
	ZDESIGN         text,					/*测试说明*/
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
	ZTITLE         varchar(200),                             /*项目标题*/
	ZOS            int  not null,                            /*操作系统*/
	ZTYPE          int,                                       /*错误类型*/
	ZLEVEL         int  not null,                            /*BUG第级*/
	ZSTATUS        int  not null,                            /*BUG状态*/
	ZMAILTO        varchar(200),                             /*邮件给别人,用#13#10分开*/
	ZOPENEDBY      int  not null,                            /*BUG创建人*/
	ZOPENEDDATE    datetime not null,                       /*创建时间*/
	ZOPENVER       int not null,                             /*当时有问题的版本*/
	ZASSIGNEDTO    int,                                       /*分派给*/
	ZSUBASSIGNEDTO int,                                       /*从分派给 2012-3-30*/
        ZASSIGNEDDATE  datetime,                                 /*分派时间*/
	ZRESOLVEDBY    int,                                       /*解决人*/
	ZRESOLUTION    int,                                       /*解决方案*/
	ZRESOLVEDVER   int,                                       /*解决的版本*/
	ZRESOLVEDDATE  datetime,                                  /*解决的时间*/
	ZLASTEDITEDBY  int not null,                              /*最后修改的人*/
	ZLASTEDITEDDATE datetime not null,                       /*最后修改的时间*/ 
	ZOVERFRACTION  bit not null default 0 ,                  /*=True表示已记过分了*/ 
	ZTAGNAME       varchar(100),                              /*标签 多个标签采用;号分开 */ 
	ZTERM          int ,                                       /*要求期限(6)*/
	ZDEMAND_ID     int default -1,                            /*需求ID号*/ 
	ZNEDDDATE      datetime,                                  /*要求时间 要求期限暂时无用*/
	ZVERIFYDATE    datetime,                                  /*审核时间*/
	ZVERIFYED      bit not null default 0 ,                  /*是否已审核过了*/
	ZVERIFNAME     int,                                        /*审核人*/
	ZWORKTIME      float default 0,                           /*要求工期（小时）*/
	ZWORKLEVEL     float default 1,                           /*BUG难度系数*/
	ZWORKSCORE     float default 0,                           /*得分*/
	ZNOTDEMAND     bit not null default 0,                    /*=True 表示需求不明确*/
	
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
	ZNOTDEMAND     bit not null default 0,                    /*=True 表示需求不明确*/
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

/*##########################################################
 #
 # 测试表 
 #
 ###########################################################*/

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
	ZSUBMISBY    int,                                           /*提交人*/
	ZTESTNOTE    text,                                          /*测试后结果说明*/
	
	--测试的项目	
	ZPRO_ID      int,                                           /*项目ID*/
	ZPRO_VER     int,                                           /*项目版本*/
	ZPRO_SVN     int,                                           /*svn的版本号*/
	ZREMORK      varchar(200),                                  /*备注*/

	--关闭状态 作者：龙仕云 2008-11-29
	ZCLOSESTATUS int ,                                          /*0=高 1=中 2=一般 3=无效 4=扣分*/
	ZCLOSESOCRE  int not null default 0,                        /*分值,主要给创建人*/
	ZTAGNAME       varchar(100),                                /*标签 多个标签采用;号分开 */
	ZDEMAND_ID     int default -1,                              /*需求ID号*/  
	

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
	ZUSER_ID       int ,                                     /*创建人*/
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

/*##########################################################
 #
 # 项目进度管理 PLAN
 #
 ###########################################################*/


/*计划主表*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_PLAN]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_PLAN]
go

create table TB_PLAN(
	ZGUID        varchar(36) not null,                          /*编号*/
	ZID          int IDENTITY (1, 1) not null,                  /*ID值*/
	ZNAME        varchar(20),                                   /*名称*/
	ZSTATUS      int not null,                                  /*状态=5(关闭)*/
	ZPRO_ID      int ,                                          /*对应的项目ID号*/
	ZSUMTEXT     text,                                          /*项目完成总结*/
	ZPM          int ,                                          /*项目经理*/
	ZBUILDDATE   datetime,                                      /*创建时间*/
	ZMEMBER      varchar(200),                                  /*项目成员,可用于做为邮件通知*/ 
	

	constraint PK_TB_PLAN primary key(ZGUID)  
)
go

/*计划内容*/

if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_PLAN_ITEM]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_PLAN_ITEM]
go

create table TB_PLAN_ITEM(
	ZGUID        varchar(36) not null,                          /*编号*/
	ZPLAN_GUID   varchar(36) not null,                          /*计划项目GUID*/
	ZNAME        varchar(255),                                  /*名称*/
	ZSTATUS      int not null,                                  /*状态=5(关闭)*/
	ZPBDATE      datetime,                                      /*计划开始时间*/
	ZPEDATE      datetime,                                      /*计划结束时间*/
	ZFBDATE      datetime,                                      /*实际开始时间*/
	ZFEDATE      datetime,                                      /*实际结束时间*/
	ZCHILDCOUNT  int not null default 0,                        /*子任务数*/
	ZPASSCOUNT   int not null default 0,                        /*完成子任务数*/
	ZMAINDEVE    int ,                                          /*主要负责人*/
	ZSORT        int ,                                          /*排序号*/ 
	ZREMARK      varchar(255),                                  /*备注*/
	ZPROJECTTIME float default 0,                               /*工期*/
	ZCREATEDATE  datetime,                                      /*创建日期*/ 
	ZMAILTO      varchar(200),                                  /*邮件通知其他人*/
	

	constraint PK_TB_PLAN_ITEM primary key(ZGUID,ZPLAN_GUID)  
)
go

/*计划明细表 detail*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_PLAN_DETAIL]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_PLAN_DETAIL]
go

create table TB_PLAN_DETAIL(
	ZID          int not null,                                  /*编号*/
	ZITEM_GUID   varchar(36) not null,                          /*计划项目GUID*/
	ZNAME        varchar(255),                                  /*名称*/
	ZSTATUS      int not null,                                  /*状态=5(关闭)*/
	ZDEVE        int ,                                          /*负责人*/
	ZCONTENT     text,                                          /*要求内容*/
	ZSOCRE       int,                                           /*得分*/
	ZTESTCASE    varchar(100),                                  /*测试用例 多个采用;号分开*/

	constraint PK_TB_PLAN_DETAIL primary key(ZID)  
)
go

/*计划参数表*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_PLAN_PARAMS]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_PLAN_PARAMS]
go

create table TB_PLAN_PARAMS(
	ZTYPE 	     int not null,                                   /*类型*/
	ZID          int not null,                                   /*ID值*/
	ZNAME        varchar(200)                                    /*值*/
	constraint PK_TB_PLAN_PARAMS primary key(ZTYPE,ZID)  
)
go


/*自动构建项目*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_ANT]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_ANT]
go

create table TB_ANT(
	ZGUID varchar(36) not null,       --GUID 
	ZID  int IDENTITY (1, 1) not null,
	ZNAME varchar(200),
	ZPRO_ID  int ,                   --对应的项目
	ZIP varchar(20) not null,        --IP
	ZPYFILE varchar(200) not null,   --python文件
	ZREMARK text ,                   --编译说明
	ZDATE datetime,                  --编译时间
	ZSVN int,                        --SVN版本号 
	ZVERSION varchar(20),            --版本号(编译版本号)
	ZSVN_URL varchar(200),           --显示SVN日志的脚本 URL
	ZSVN_LATEST_VERSION int,         --SVN服务器上的版本号
	ZCOMPILETEXT text,               --最近的编译信息
	ZLANGTYPE int default 0,         -- 0 = Delphi 1=Java 2012-6-30
	ZWEBURL varchar(200),            -- web项目的url路径，用于直接连过去 2012-6-30 
	ZLOCALSVNBAT varchar(200),       --svn更新bat文件。
	ZCOMPLIEPARAM varchar(100),      --编译参数，转到服务器区分是要编译哪个子模块 2013-8-8

	
	
	constraint PK_TB_ANT primary key(ZGUID)  
)
go

/*编译日志 2013-6-20*/
create table TB_ANT_LOG(
	ZID  int IDENTITY (1, 1) not null,
	ZANT_GUID varchar(36) not null,
	ZPRO_ID int,        --对应的项目
	ZUSER_ID int ,      --谁在编译
	ZVERSION int,       --编译版本号
	ZDATE  datetime,    --编译时间
	ZLOG text,          --编译日志，最好是结果就行，不要太多，只记出错的内容 

	constraint PK_TB_ANT_LOG primary key(ZID,ZANT_GUID) 
)
go

/*标签*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_TAG]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_TAG]
go

create table TB_TAG(
	ZID            int IDENTITY (1, 1) not null,  
	ZNAME varchar(20),                    --名称
	ZCOLOR int ,                          --颜色
	constraint PK_TB_TAG primary key(ZNAME)  
)
go


/*发布管理*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_RELEASE_ITEM]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_RELEASE_ITEM]
go

create table TB_RELEASE_ITEM(
	ZID          int not null,            --ID做为主键
	ZNAME        varchar(200),            --名称
	ZVERSION     varchar(30),             --版本号  
	ZPRO_ID      int ,                    --对应于哪个项目
	ZASSIGNEDTO  int ,                    --指派给谁发布
	ZRELEASEDATE datetime not null,       --发布时间
	ZOPENEDBY    int ,                    --创建人
	ZOPENDATE    datetime not null,       --创建时间
	ZNEEDTERM    int,                     --要求发布的期限(0), 马上0 今天1, 明天2，后天3,有空就上传4。
	ZURLTYPE     int not null,            --发布路径(1), 0 网站 , 1 FTP 2 传给他人    
	ZURL         varchar(200),            --发布的保存路径
	ZPRODUCTURL  varchar(200),            --产品池路径
	ZPROCONTENT  text,                    --产品内容。
	ZMAILTO      varchar(200),            --邮件通知
	ZSTATUS      int not null,            --状态(2) , 0 创建 1 发布并上传。
	ZRELEASER    int ,                    --上传人
	ZBACKUP      bit ,                    --是否要备份文件  
	constraint PK_TB_RELEASE_ITEM primary key(ZID)  
)
go


/*发布管理参数表*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_RELEASE_PARAMS]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_RELEASE_PARAMS]
go

create table TB_RELEASE_PARAMS(
	ZTYPE 	     int not null,                                   /*类型*/
	ZID          int not null,                                   /*ID值*/
	ZNAME        varchar(200)                                    /*值*/
	constraint PK_TB_RELEASE_PARAMS primary key(ZTYPE,ZID)  
)
go



/*SVN接交的内容*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_SVN_COMMITS]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_SVN_COMMITS]
go

create table TB_SVN_COMMITS(
	ZSVN_GUID    varchar(36) not null,                           
	ZVERSION     int not null,                                   
	ZID          int IDENTITY (1, 1) not null,                   /*用于排序先后*/
	ZAUTHOR      varchar(50),                                    /*作者*/
	ZDATE        datetime,
	ZMESSAGE     text
	constraint PK_TB_SVN_COMMITS primary key(ZSVN_GUID,ZVERSION)  
)
go

/*SVN接交的明细*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_SVN_CHANGES]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_SVN_CHANGES]
go

create table TB_SVN_CHANGES(
	ZSVN_GUID    varchar(36) not null,                           
	ZVERSION     int not null,                                   /*版本号*/
	ZID          int IDENTITY (1, 1) not null,
	ZACTION      varchar(10),                                    /*动作*/
	ZPATH        varchar(200),
	ZCOPY_PATH   varchar(200),
	ZCOPY_VERSION int,

	constraint PK_TB_SVN_CHANGES primary key(ZSVN_GUID,ZVERSION,ZID)  
)
go

/*状态机*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_STATE]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_STATE]
go

create table TB_STATE(
	ZID          int ,         /*=0表示项目编译*/
	ZSTATECODE   int,          /*状态码 =0 表示开始 =1表示进行中 =2 结束掉了*/ 
	ZUSER_ID     int ,         /*操作的人*/
	ZSTATETIME   datetime,     /*动作发生在时间*/
	ZNOTE        varchar(200), /*备注*/
	
	constraint PK_TB_STATE primary key(ZID)
)
go

/*加班单功能*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_WORKOVERTIME]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_WORKOVERTIME]
go

create table TB_WORKOVERTIME(
	ZID           int IDENTITY (1, 1) not null,/*=加班ID*/
	ZUSER_ID      int,                         /*加班人*/
	ZDATE         varchar(20),                 /*日期*/
	ZDATETIME     datetime,                    /*加班的开始时间* 这个目前是固定好是 晚上6:00*/
	ZLASTDATETIME datetime,                    /*加班的下班时间*/
	ZADDRESS      varchar(50),                 /*加班的地点*/
	ZCONTENT      text,                        /*加班的事由*/
	ZCHECK_USER_ID int default -1,             /*审核人ID，没有审核则=-1*/
	ZMINUTE        int default 0,              /*加班的分钟*/ 
	ZSTATUS        int not null,               /*状态=0 申请 1=同意 2=不同意 3=废单*/
	ZWEEKEND       bit default 0,              /*是否是周末或节假日加班*/
	ZBUILDDATE    datetime,                    /*制单时间*/
	ZDECTIME      int default 0,               /*减去分钟 因工作效率问题 */
	ZRATE         float,                       /*系数*/
	
	constraint PK_TB_WORKOVERTIME primary key(ZID)
)
go

/*加班单参数表*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_WORKOVERTIME_PARAMS]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_WORKOVERTIME_PARAMS]
go

create table TB_WORKOVERTIME_PARAMS(
	ZTYPE 	     int not null,                                   /*类型*/
	ZID          int not null,                                   /*ID值*/
	ZNAME        varchar(200)                                    /*值*/
	constraint PK_TB_WORKOVERTIME_PARAMS primary key(ZTYPE,ZID)  
)
go

/*需求管理*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_DEMAND]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_DEMAND]
go

create table TB_DEMAND(
	ZID            int  not null,              /*需求ID*/
	ZNAME         varchar(100),                /*需求名称*/    
	ZUSER_ID      int,                         /*需求填写人*/
	ZBUILDDATE    datetime,                    /*制单时间*/
	ZCONTENT      text,                        /*需用描述*/
	ZNEEDDATE     datetime,                    /*要求时间*/
	ZISRESET      bit,                         /*是否已变更了*/    
	ZPRO_ID       int,                         /*属于如个项目*/
	ZCUSTOMER     text,                        /*客户信息*/
	ZANNEXFILE_ID  int,                        /*附件内容，可能是图片这个更直接*/
	ZANNEXFILENAME varchar(50),                /*附件名称*/
	ZSTATUS        int not null,               /*状态=0 制单 1=接受 2=拒绝 3=已变更*/
	ZCHECK_USER_ID int ,                       /*审核人*/
	ZMAILTO        varchar(200),               /*邮件给别人,用#13#10分开*/
	ZREMARK        text,                       /*备注*/
	
	constraint PK_TB_DEMAND primary key(ZID)
)
go

/*需求管理参数表*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_DEMAND_PARAMS]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_DEMAND_PARAMS]
go

create table TB_DEMAND_PARAMS(
	ZTYPE 	     int not null,                                   /*类型*/
	ZID          int not null,                                   /*ID值*/
	ZNAME        varchar(200)                                    /*值*/
	constraint PK_TB_DEMAND_PARAMS primary key(ZTYPE,ZID)  
)
go

/*扩展web应用 */
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_EXTENDWEB]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_EXTENDWEB]
go

create table TB_EXTENDWEB(
	ZTYPE 	     int not null,                                   /*类型 0=rul 1=html*/
	ZID          int IDENTITY (1, 1) not null,                   /*ID值*/
	ZNAME        varchar(50),                                    /*名称*/
	ZVALUE       text,                                           /*值*/  
	ZSORT        int,                                            /*排序号*/
	constraint PK_TB_EXTENDWEB primary key(ZID)  
)
go


/*今日贡献*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_TODAYRESULT]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_TODAYRESULT]
go

create table TB_TODAYRESULT(
	ZID          int IDENTITY (1, 1) not null,                   /*主键*/
	ZTYPE 	     int not null,                                   /*类型 0=测试用例 1=bug 2=svn 3=报功 4=举报 */
	ZUSER_ID     int not null,                                   /*谁的贡献*/
	ZDATETIME    datetime,                                       /*贡献时间,发生时间*/
	ZCONTENTID   int,                                            /*如是测试用列则写ID,bug则写bug*/
	ZCONTENT     varchar(200),                                   /*内容*/
	ZNOTE        text,                                           /*原因*/
	ZWRITER      int,                                            /*空则系统写*/
	ZACTION      int,                                            /*=0 表示是激活的 1=另外加分的*/
	ZSCORE       float,                                          /*得分,对考核有用的 2012-6-30*/
	
	constraint PK_TB_TODAYRESULT primary key(ZID)  
)
go

/*日志表*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_LOG]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_LOG]
go

create table TB_LOG(
	ZID          int IDENTITY (1, 1) not null,                   /*主键*/
	ZUSER_ID     int not null,                                   /*谁*/
	ZDATETIME    datetime,                                       /*时间*/
	ZCONTENT     varchar(200),                                   /*内容*/
	
	constraint PK_TB_LOG primary key(ZID)  
)
go


/*信息表*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_MSG]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_MSG]
go

create table TB_MSG(
	ZID          int IDENTITY (1, 1) not null,                   /*主键*/
	ZUSER_ID     int not null,                                   /*发起谁*/
	ZDATETIME    datetime,                                       /*时间*/
	ZCODE        int ,                                           /*内容的ID，如是Bug则是bug的Code*/ 
	ZCONTENT     varchar(200),                                   /*内容*/
	ZTYPE        int,                                            /*类型 0=bug , 1=测试用例*/
	ZSEND_ID     varchar(200),                                   /*哪个人，多个采用|分开*/
	
	constraint PK_TB_MSG primary key(ZID)  
)
go


/*题库类*/
create table TB_QUESTION_CLASS(
	ZGUID varchar(36) not null,
	ZCODE varchar(20) not null,    --题库号
	ZTITLE varchar(200),           --能力要求
	ZNOTE varchar(250) ,           --题库描述 
	ZPOWER varchar(250),           --多个以;分开是用户名称，表示有权力看到题目
	ZSORT int default 0,           --排序号

	constraint PK_TB_QUESTIONCLASS primary key(ZGUID)  	
)
go

/*题库内容表*/
create table TB_QUESTION(
	ZCLASS_GUID varchar(36) not null,  --题库的GUID
	ZQCODE varchar(50) not null,       --题目代码号,最好是自动生成的. ZCODE-0001 的格式.
	ZQTITLE varchar(200) not null,     --提目的标题
	ZQCENTENT text ,                   --提目的内容
	ZANSWER text,                      --答案
	ZUSER_ID int  not null,            --创建人ID
	ZDATETIME datetime,                --创建时间
	ZSTOP bit default 0,               --=Ture 表示不再使用
	ZIDX int default 1,                --索引号, 用于生成 ZCODE-0001 后面的数字

	constraint PK_TB_QUESTION primary key(ZCLASS_GUID,ZQCODE) 
)
go

/*等级对应的题库表*/
create table TB_QUESTION_DEVELEVEL(
	ZID       int IDENTITY (1, 1) not null,	 --主键
	ZDEVENAME  varchar(50) not null,         --等级名称
	ZSORT     int default 0,                 --排序号
	ZQUCLASS_CODE_1 varchar(20),
	ZQUCLASS_NUM_1 int default 0,
	ZQUCLASS_SCORE_1 int default 0,         --每道得分

	ZQUCLASS_CODE_2 varchar(20),
	ZQUCLASS_NUM_2 int default 0,
	ZQUCLASS_SCORE_2 int default 0,

	ZQUCLASS_CODE_3 varchar(20),
	ZQUCLASS_NUM_3 int default 0,
	ZQUCLASS_SCORE_3 int default 0,

	ZQUCLASS_CODE_4 varchar(20),
	ZQUCLASS_NUM_4 int default 0,
	ZQUCLASS_SCORE_4 int default 0,

	ZQUCLASS_CODE_5 varchar(20),
	ZQUCLASS_NUM_5 int default 0,
	ZQUCLASS_SCORE_5 int default 0,

	ZQUCLASS_CODE_6 varchar(20),
	ZQUCLASS_NUM_6 int default 0,
	ZQUCLASS_SCORE_6 int default 0,

	ZQUCLASS_CODE_7 varchar(20),
	ZQUCLASS_NUM_7 int default 0,
	ZQUCLASS_SCORE_7 int default 0,

	ZQUCLASS_CODE_8 varchar(20),
	ZQUCLASS_NUM_8 int default 0,
	ZQUCLASS_SCORE_8 int default 0,

	ZQUCLASS_CODE_9 varchar(20),
	ZQUCLASS_NUM_9 int default 0,
	ZQUCLASS_SCORE_9 int default 0,

	ZQUCLASS_CODE_10 varchar(20),
	ZQUCLASS_NUM_10 int default 0,
	ZQUCLASS_SCORE_10 int default 0,

	constraint PK_TB_QUESTION_DEVELEVEL primary key(ZID) 

)
go

/*产品原型*/
/*题库内容表*/
create table TB_PROTOTYPE(
	PRTY_GUID varchar(36) not null,    --产品原型的GUID
	PRTY_NAME varchar(200) not null,   --原型名称
	ZUSER_ID int  not null,            --创建人ID
	PRTY_DATETIME datetime,            --创建时间
	PRTY_DIRNAME varchar(100),         --目录名称,用于指定浏览的文件地址
  	
	constraint PK_TB_PROTOTYPE primary key(PRTY_GUID) 
)
go


















