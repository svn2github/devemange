/******************************************************************************
*
*         网络文件管理器
*         文件名：BFSS_TABLES.SQ  版本：1.0
*         数据库初期化处量
*         创建日期：2007-11-9    作者:龙仕云
*
******************************************************************************/


insert into TB_USER_ITEM (ZNAME,ZPASS,ZSTOP,ZTYPE) values('admin','123456',0,0);
insert into TB_FILE_TREE (ZPID,ZNAME,ZHASCHILD) values(-1,'$/',0);
insert into TB_PRO_DOCUMENT (ZPID,ZNAME,ZSTYLE,ZHASCHILD) values(-1,'$/',0,0);

/*######################
 #BUG参数
 ######################*/
/*BUG的状态*/
insert into TB_BUG_PARAMS (ZTYPE,ZID,ZNAME) values(1,0,'活动');
insert into TB_BUG_PARAMS (ZTYPE,ZID,ZNAME) values(1,1,'修改完成');
insert into TB_BUG_PARAMS (ZTYPE,ZID,ZNAME) values(1,2,'被激活');
/*BUG的解决方案*/
insert into TB_BUG_PARAMS (ZTYPE,ZID,ZNAME) values(2,0,'修改');
insert into TB_BUG_PARAMS (ZTYPE,ZID,ZNAME) values(2,1,'不是问题，不修改');
insert into TB_BUG_PARAMS (ZTYPE,ZID,ZNAME) values(2,2,'暂时不修改');
/*BUG操作系统*/
insert into TB_BUG_PARAMS (ZTYPE,ZID,ZNAME) values(3,0,'win98');
insert into TB_BUG_PARAMS (ZTYPE,ZID,ZNAME) values(3,1,'win2000');
insert into TB_BUG_PARAMS (ZTYPE,ZID,ZNAME) values(3,2,'xp');
insert into TB_BUG_PARAMS (ZTYPE,ZID,ZNAME) values(3,3,'vista');
/*BUG的类型*/
insert into TB_BUG_PARAMS (ZTYPE,ZID,ZNAME) values(4,0,'代码错误');
insert into TB_BUG_PARAMS (ZTYPE,ZID,ZNAME) values(4,1,'界面错误');
insert into TB_BUG_PARAMS (ZTYPE,ZID,ZNAME) values(4,2,'设计变更');
insert into TB_BUG_PARAMS (ZTYPE,ZID,ZNAME) values(4,3,'新增功能');
insert into TB_BUG_PARAMS (ZTYPE,ZID,ZNAME) values(4,4,'数据校对');
insert into TB_BUG_PARAMS (ZTYPE,ZID,ZNAME) values(4,5,'报表错误');
insert into TB_BUG_PARAMS (ZTYPE,ZID,ZNAME) values(4,6,'测试案例');
/*BUG等级*/
insert into TB_BUG_PARAMS (ZTYPE,ZID,ZNAME) values(5,0,'严重错误');
insert into TB_BUG_PARAMS (ZTYPE,ZID,ZNAME) values(5,1,'一般错误');
insert into TB_BUG_PARAMS (ZTYPE,ZID,ZNAME) values(5,2,'可不改错误');

/*任务单状态*/
insert into TB_TASK_PARAMS (ZTYPE,ZID,ZNAME) values(1,0,'待分发');
insert into TB_TASK_PARAMS (ZTYPE,ZID,ZNAME) values(1,1,'执行中');
insert into TB_TASK_PARAMS (ZTYPE,ZID,ZNAME) values(1,2,'撤消');
insert into TB_TASK_PARAMS (ZTYPE,ZID,ZNAME) values(1,3,'完成');
insert into TB_TASK_PARAMS (ZTYPE,ZID,ZNAME) values(1,4,'关闭');
insert into TB_TASK_PARAMS (ZTYPE,ZID,ZNAME) values(1,5,'激活');
/*任务单类型*/
insert into TB_TASK_PARAMS (ZTYPE,ZID,ZNAME) values(2,0,'新增功能');
insert into TB_TASK_PARAMS (ZTYPE,ZID,ZNAME) values(2,1,'变更功能');
/*系统参数*/
insert into TB_SYSPARAMS (ZNAME,ZVALUE) values('wiki','');
insert into TB_SYSPARAMS (ZNAME,ZVALUE) values('ProductDownload','');
insert into TB_SYSPARAMS (ZNAME,ZVALUE) values('Calendar','');

/*测试参数*/
insert into TB_TEST_PARAMS (ZTYPE,ZID,ZNAME) values(0,0,'一级');
insert into TB_TEST_PARAMS (ZTYPE,ZID,ZNAME) values(0,1,'二级');
insert into TB_TEST_PARAMS (ZTYPE,ZID,ZNAME) values(0,2,'三级');
insert into TB_TEST_PARAMS (ZTYPE,ZID,ZNAME) values(0,3,'四级');
--测试的类型
insert into TB_TEST_PARAMS (ZTYPE,ZID,ZNAME) values(1,0,'功能测试');
insert into TB_TEST_PARAMS (ZTYPE,ZID,ZNAME) values(1,1,'整体测试');
insert into TB_TEST_PARAMS (ZTYPE,ZID,ZNAME) values(1,2,'单元测试');
--测试方法=2
insert into TB_TEST_PARAMS (ZTYPE,ZID,ZNAME) values(2,0,'黑盒测试');
insert into TB_TEST_PARAMS (ZTYPE,ZID,ZNAME) values(2,1,'脚本测试');
--测试状态ZSTATUS
insert into TB_TEST_PARAMS (ZTYPE,ZID,ZNAME) values(3,0,'活动');
insert into TB_TEST_PARAMS (ZTYPE,ZID,ZNAME) values(3,1,'修改完成');
insert into TB_TEST_PARAMS (ZTYPE,ZID,ZNAME) values(3,2,'被激活');
insert into TB_TEST_PARAMS (ZTYPE,ZID,ZNAME) values(3,3,'关闭');

GO