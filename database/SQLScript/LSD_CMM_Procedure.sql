/**********************************************************
 *
 * 创建存储过程
 *
 * 作者: 龙仕云 时间: 2007-11-22
 *
 *
 *********************************************************/


/*分页通用处理*/
CREATE PROCEDURE pt_SplitPage 
	@tblName      varchar(255),            -- 表名
	@strGetFields varchar(1000) = '*',     -- 需要返回的列 
	@fldName      varchar(255)='',         -- 排序的字段名
	@PageSize     int = 20,                -- 页尺寸
	@PageIndex    int = 1,                 -- 页码
	@doCount      bit = 0,                 -- 返回记录总数, 非 0 值则返回
	@OrderType    bit = 0,                 -- 设置排序类型, 非 0 值则降序
	@strWhere     varchar(1500) = ''       -- 查询条件 (注意: 不要加 where)
AS

declare @strSQL   varchar(5000)       -- 主语句
declare @strTmp   varchar(110)        -- 临时变量
declare @strOrder varchar(400)        -- 排序类型

if @doCount != 0
begin
	if @strWhere !=''
		set @strSQL = 'select count(*) as Total from [' + @tblName + '] where '+@strWhere
	else
		set @strSQL = 'select count(*) as Total from [' + @tblName + ']'
end  

--以上代码的意思是如果@doCount传递过来的不是0，就执行总数统计。以下的所有代码都是@doCount为0的情况

else begin

if @fldName !=''
begin
	if @OrderType != 0  --如果@OrderType不是0，就执行降序，这句很重要！
	begin
		set @strTmp = '<(select min'
		set @strOrder = ' order by [' + @fldName +'] desc'
	end
	else begin
		set @strTmp = '>(select max'
    		set @strOrder = ' order by [' + @fldName +'] asc'
	end
end
else begin
	set @strTmp = ''
	set @strOrder = ''
end

--如果是第一页就执行以上代码，这样会加快执行速度
if @PageIndex = 1
begin
	if @strWhere != ''   
		set @strSQL = 'select top ' + str(@PageSize) +' '+@strGetFields+ '  from [' + @tblName 
                               + '] where ' + @strWhere + ' ' + @strOrder
     	else
     		set @strSQL = 'select top ' + str(@PageSize) +' '+@strGetFields+ '  from ['+ @tblName 
                               + '] '+ @strOrder

end
else begin
--以下代码赋予了@strSQL以真正执行的SQL代码
	set @strSQL = 'select top ' + str(@PageSize) +' '+@strGetFields+ '  from ['
		+ @tblName + '] where [' + @fldName + ']' + @strTmp + '(['+ @fldName + ']) from (select top ' 
                + str((@PageIndex-1)*@PageSize) + ' ['+ @fldName + '] from [' + @tblName + ']' + @strOrder + ') as tblTmp)'+ @strOrder

	if @strWhere != ''
    		set @strSQL = 'select top ' + str(@PageSize) +' '+@strGetFields+ '  from ['
	        + @tblName + '] where [' + @fldName + ']' + @strTmp + '(['
	        + @fldName + ']) from (select top ' + str((@PageIndex-1)*@PageSize) + ' ['
	        + @fldName + '] from [' + @tblName + '] where ' + @strWhere + ' '
	        + @strOrder + ') as tblTmp) and ' + @strWhere + ' ' + @strOrder
	end 
end   
exec (@strSQL)
--print @strSQL

go



/*Bug管理器的发布邮件*/
/*
创建: 2008-5-21  mrlong
目的: 取出问题的邮件内容
修改：
编号   时间         修改人             修改内容
*/

CREATE   PROCEDURE pt_MaintoByBug 
@BugID int, --BugID号
@mailtitle varchar(200) output, --返回的标题
@mailtext varchar(4000) output --返回的内容
as
declare @TreePath  varchar(200)
declare @Title varchar(200)
declare @Auathor varchar(20)  
declare @BugMaxID int
declare @BugContext varchar(4000)
declare @BugReplay  varchar(20)
begin


--取出标题及作者
declare my_cursor cursor 
for
select a.ZTREEPATH,a.ZTITLE,b.ZNAME from TB_BUG_ITEM as a, TB_USER_ITEM as b where a.ZID=@BugID and
a.ZOPENEDBY=b.ZID

open my_cursor
fetch next from my_cursor into @TreePath,@Title,@Auathor
close   my_cursor  
deallocate my_cursor

--取现回复最大值
declare my_cursor cursor
for
select isnull(max(ZID),0)  from TB_BUG_HISTORY where ZBUG_ID=@BugID 
open my_cursor
fetch next from my_cursor into @BugMaxID
close my_cursor
deallocate my_cursor

--取出回复内容
if @BugMaxID > 0
begin
	declare my_cursor cursor
	for
	select a.ZCONTEXT,b.ZNAME  from TB_BUG_HISTORY as a , TB_USER_ITEM as b where a.ZID=@BugMaxID and
	a.ZUSER_ID=b.ZID
	open my_cursor
	fetch next from my_cursor into @BugContext,@BugReplay
	close my_cursor
	deallocate my_cursor
end

--格式
set @mailtitle = @Title
set @mailtext  = @TreePath  + char(13) +char(10)+
'-------------------------------------------------------------------------------------------' + char(13) + char(10)+
@BugContext + char(13) +char(10)+char(13)+char(10)+
'创建人:' +  @Auathor + '   回复人:' + @BugReplay


end
GO


/*
创建: 2008-6-28  作者:龙仕云
目的: 准备任务单的邮件内容
修改：
编号   时间         修改人             修改内容
 1     2008-8-4    龙仕云      增加审核人的邮件发送

*/

CREATE    PROCEDURE pt_MaintoByTask
@TaskCode  varchar(30), --任务号,是唯一号
@mailtitle varchar(200) output,   --返回的标题
@mailtext varchar(4000) output, --返回的内容
@mailto   varchar(1000) output --返回的发送邮件的人,多个采用;分开

as
declare @ProName  varchar(200) --项目的名称
declare @Prover varchar(50) --项目的版本号
declare @Title varchar(200)
declare @Auathor varchar(20)   --创建任务的人
declare @TaskContext varchar(4000) --任务的内容
declare @TaskStatus varchar(20) --任务单状态
declare @myMail varchar(50)
declare @CheckMail varchar(50) --审核人的邮箱


begin


--取出标题及作者
declare my_cursor cursor 
for
select  a.ZName as TaskName,b.ZNAME as UserName,c.ZNAME as ProName , d.ZVER , e.ZName as STATUS ,a.ZDESIGN ,b.ZEMAIL,f.ZEMAIL as CheckMail  
from TB_TASK as a
left join  TB_USER_ITEM as b  on a.ZUSER_ID=b.ZID 
left join  TB_PRO_ITEM   as c  on a.ZPRO_ID=c.ZID
left join  TB_PRO_VERSION as d on d.ZID=a.ZPRO_VERSION_ID
left join  TB_TASK_PARAMS as e on e.ZTYPE=1 and e.ZID=a.ZSTATUS 
left join  TB_USER_ITEM as f on a.ZCHECKNAME=f.ZID
where a.ZCODE=@TaskCode 

open my_cursor
fetch next from my_cursor into @mailtitle,@Auathor,@ProName,@Prover,@TaskStatus,@TaskContext,@mailto,@CheckMail
close   my_cursor  
deallocate my_cursor

set @mailto =isnull(@mailto,'')+';' + isnull(@CheckMail,'')

--取出任务的执行人,注意取消执行人
declare my_cursor cursor
for
select b.ZEMAIL  from TB_TASK_USER as a
left join TB_USER_ITEM as b on a.ZUSER_ID=b.ZID
where a.ZTASK_CODE=@TaskCode and a.ZCANCEL=1 

open my_cursor
fetch next from my_cursor into @myMail
while( @@fetch_status = 0)
begin
  --print @myMail
  set @mailto =isnull(@mailto,'')+';'+@myMail
  fetch next from my_cursor into @myMail
end

close   my_cursor  
deallocate my_cursor

--格式

set @mailtext  = '项目:' + @ProName + '  版本:' + @Prover + char(13) + char(10) + 
'任务:' + @mailtitle  + char(13) +char(10)+
'状态:' + @TaskStatus + char(13)+char(10)+
'-------------------------------------------------------------------------------------------' + char(13) + char(10)+
@TaskContext + char(13) +char(10)+char(13)+char(10)+
'任务创建人:' +  @Auathor 

set @mailtitle =  '【' + @TaskStatus+' 】'+ @mailtitle


end
GO



/*
创建: 2008-6-28  作者:龙仕云
目的: 统计
修改：
编号   时间         修改人             修改内容

*/

CREATE    PROCEDURE pt_StatBugTaskCount
@StatbeginDate datetime,
@StatendDate datetime

as

declare @myUserName varchar(20)
declare @myUser_ID int
declare @c1 int
declare @c2 int
declare @c3 int
declare @c4 int

set @c1=0
set @c2=0
set @c3=0
set @c4=0

--建表
if exists(select 1 from sysobjects where id=object_id('temp_stat')and type = 'u')
  drop table temp_stat
  
create table temp_stat
  (
  ZUSERNAME varchar(20),
  ZAnswerBugCount int , --处理问题数 c1
  ZSubmitBugCount  int, --提交的问题数 c2
  ZReplyBugCount int,    --回复问题数 c3
)



--先按人员表进行遍历
declare my_cursor cursor
for
select a.ZNAME,a.ZID  from TB_USER_ITEM as a
where a.ZSTOP=0

open my_cursor
fetch next from my_cursor into @myUserName,@myUser_ID
while( @@fetch_status = 0)
begin
  
------bug
  select @c1= count(a.ZID)   from TB_BUG_ITEM as a 
  where  a.ZRESOLVEDBY=@myUser_ID and a.ZSTATUS=1 --1表示修改完成
  
  select @c2= count(a.ZID)   from TB_BUG_ITEM as a 
  where  a.ZOPENEDBY=@myUser_ID 

  select @c3= count(a.ZID)   from TB_BUG_HISTORY as a 
  where  a.ZUSER_ID=@myUser_ID
------Task
	
  insert into temp_stat(
       ZUSERNAME,
       ZAnswerBugCount,
       ZSubmitBugCount,
       ZReplyBugCount) 
  values(
       @myUserName,
       @c1,
       @c2,
       @c3) 
  fetch next from my_cursor into @myUserName, @myUser_ID
end

close   my_cursor  
deallocate my_cursor

select * from temp_stat
GO


/*
创建: 2008-6-28  作者:龙仕云
目的: 统计
修改：
编号   时间         修改人             修改内容

*/

CREATE    PROCEDURE pt_StatBugTaskCount
@StatbeginDate datetime,
@StatendDate datetime

as

declare @myUserName varchar(20)
declare @myUser_ID int
declare @c1 int
declare @c2 int
declare @c3 int
declare @c4 int
declare @c5 int
declare @c6 int
declare @c7 int

set @c1=0
set @c2=0
set @c3=0
set @c4=0
set @c5=0
set @c6=0
set @c7=0

--建表
if exists(select 1 from sysobjects where id=object_id('temp_stat')and type = 'u')
  drop table temp_stat
  
create table temp_stat
  (
  ZUSERNAME varchar(20) ,
  ZAnswerBugCount int , --处理问题数 c1
  ZSubmitBugCount  int, --提交的问题数 c2
  ZReplyBugCount int,    --回复问题数 c3
  ZReActionBug int,       --问题被激活数 c4
  ZBugFraction int,          --问题分数

  ZTaskCount int,            --完成的任务数
  ZTaskFraction int,         --任务分数
 ZTotal int                       --总分
  
  
)



--先按人员表进行遍历
declare my_cursor cursor
for
select a.ZNAME,a.ZID  from TB_USER_ITEM as a
where a.ZSTOP=0

open my_cursor
fetch next from my_cursor into @myUserName,@myUser_ID
while( @@fetch_status = 0)
begin
 
-----------------------------------bug----------------------------------------

  /*解决问题*/
  select @c1= count(a.ZID)   from TB_BUG_ITEM as a 
  where  a.ZRESOLVEDBY=@myUser_ID and a.ZSTATUS=1 and  --1表示修改完成
              (a.ZRESOLVEDDATE between  @StatbeginDate and  @StatendDate)
         
   /*创建问题*/
  select @c2= count(a.ZID)   from TB_BUG_ITEM as a   
  where  a.ZOPENEDBY=@myUser_ID and
             (a.ZOPENEDDATE between  @StatbeginDate and  @StatendDate)
  
  /*回复问题*/
  select @c3= count(a.ZID)   from TB_BUG_HISTORY as a 
  where  a.ZUSER_ID=@myUser_ID and ( ZSTATUS=0)  and --0表示活动的
    (a.ZACTIONDATE between @StatbeginDate and  @StatendDate )
 
   /*被激活数*/
  select @c4=count(a.ZID) from  TB_BUG_ITEM as a 
  where  a.ZSTATUS=2 and (a.ZOVERFRACTION=1) and   --  ZOVERFRACTION =1表示已记分
  exists(select * from TB_BUG_HISTORY as b where b.ZSTATUS=2 and b.ZBUG_ID=a.ZID 
          and b.ZUSER_ID= @myUser_ID
           and b.ZACTIONDATE between @StatbeginDate and  @StatendDate)

  /*计算分数*/  
  select @c5= count(a.ZID)   from TB_BUG_ITEM as a 
  where  a.ZRESOLVEDBY=@myUser_ID and a.ZSTATUS=1 and  --1表示修改完成
             (a.ZOVERFRACTION=0) and
              (a.ZRESOLVEDDATE between  @StatbeginDate and  @StatendDate)

  

-------------------------------Task--------------------------------------------
  /*计算任务单个数*/
 select @c6=count(a.ZTASK_CODE) from  TB_TASK_USER as a
 where (a.ZUSER_ID=@myUser_ID)  and
  ( a.ZSCOREDATE between @StatbeginDate and  @StatendDate)

  /*任务得分*/
   select @c7=sum(a.ZSCORE) from  TB_TASK_USER as a , TB_TASK as b
 where (a.ZUSER_ID=@myUser_ID)  and (a.ZTASK_CODE=b.ZCODE) and (b.ZSTATUS=4) and
  ( a.ZSCOREDATE between @StatbeginDate and  @StatendDate)


	
  insert into temp_stat(
       ZUSERNAME,
       ZAnswerBugCount,
       ZSubmitBugCount,
       ZReplyBugCount,
       ZReActionBug,
       ZBugFraction,
       ZTaskCount,
       ZTaskFraction,
      ZTotal
     ) 
  values(
       @myUserName,
       @c1,
       @c2,
       @c3,
       @c4,
       @c5,
       @c6,
       @c7,
       isnull(@c5,0)+isnull(@c7,0)); 
  fetch next from my_cursor into @myUserName, @myUser_ID
end

close   my_cursor  
deallocate my_cursor

select * from temp_stat
GO



/*
创建: 2008-7-11  作者:龙仕云
目的: 统计项目的处理情况
修改：
编号   时间         修改人             修改内容

*/

CREATE    PROCEDURE pt_StatBugProjectTaskCount
@StatbeginDate datetime,
@StatendDate datetime

as

declare @myProName varchar(200)
declare @myPro_ID int
declare @c1 int
declare @c2 int
declare @c3 int


set @c1=0
set @c2=0
set @c3=0


--建表
if exists(select 1 from sysobjects where id=object_id('temp_prostat')and type = 'u')
  drop table temp_prostat
  
create table temp_prostat
  (
  ZPRONAME varchar(200) ,  --项目名称
  ZSubmitBugCount  int,  --提交的问题数 c1
  ZAnswerBugCount int , --处理问题数 c2
  ZNoAnswerBugCount int  --没有处理的问题数 c3
)



--先按表进行遍历
declare my_cursor cursor
for
select a.ZNAME,a.ZID  from TB_BUG_TREE as a order by a.ZID,a.ZSORT

open my_cursor
fetch next from my_cursor into @myProName,@myPro_ID
while( @@fetch_status = 0)
begin
 
-----------------------------------bug----------------------------------------

        
   /*创建问题*/
  select @c1= count(a.ZID)   from TB_BUG_ITEM as a   
  where  a.ZTREE_ID=@myPro_ID and
             (a.ZOPENEDDATE between  @StatbeginDate and  @StatendDate)

  /*解决问题*/
  select @c2= count(a.ZID)   from TB_BUG_ITEM as a 
  where  a.ZTREE_ID=@myPro_ID and a.ZSTATUS=1 and  --1表示修改完成
              (a.ZOPENEDDATE between  @StatbeginDate and  @StatendDate)

  
  /*没有和理问题数*/
  select @c3= count(a.ZID)   from TB_BUG_ITEM as a 
  where  a.ZTREE_ID=@myPro_ID and a.ZSTATUS<>1 and  --1表示修改完成
              (a.ZOPENEDDATE between  @StatbeginDate and  @StatendDate)



	
  insert into temp_prostat(
      ZPRONAME ,
      ZSubmitBugCount,
      ZAnswerBugCount,
      ZNoAnswerBugCount 
     ) 
  values(
       @myProName,
       @c1,
       @c2,
       @c3 ); 

  fetch next from my_cursor into @myProName, @myPro_ID
end

close   my_cursor  
deallocate my_cursor

select * from temp_prostat
GO





/*测试管理器的发布邮件*/
/*
创建: 2008-10-6  mrlong
目的: 取出测试的邮件内容
修改：
编号   时间         修改人             修改内容
*/

CREATE   PROCEDURE pt_MaintoByTest
@TestID int, --TestID号
@mailtitle varchar(200) output, --返回的标题
@mailtext varchar(4000) output --返回的内容
as
declare @Title varchar(200)
declare @ProName varchar(200) --项目名称
declare @Auathor varchar(20)  
declare @TestContext varchar(2000) --内容
declare @Status int --状态 1 完成 2 激活 3 关闭

begin


--取出标题及作者
declare my_cursor cursor 
for
select a.ZNAME,b.ZNAME,a.ZSTATUS  from TB_TEST_ITEM as a, TB_USER_ITEM as b where a.ZID=@TestID and
a.ZOPENEDBY=b.ZID

open my_cursor
fetch next from my_cursor into @Title,@Auathor,@Status
close   my_cursor  
deallocate my_cursor

--取出项目名称与版本号
declare my_cursor cursor 
for
select b.ZNAME from TB_TEST_ITEM as a, TB_PRO_ITEM as b where a.ZID=@TestID and
a.ZPRO_ID=b.ZID

open my_cursor
fetch next from my_cursor into @ProName
close   my_cursor  
deallocate my_cursor

--内容
if @Status =2
begin
 set @TestContext  = '测试被激活'
end

if @Status =3
begin
 set @TestContext  = '测试关闭'
end




--格式
set @mailtitle = @Title
set @mailtext  = @ProName + char(13) +char(10)+
'-------------------------------------------------------------------------------------------' + char(13) + char(10)+
@TestContext + char(13) +char(10)+char(13)+char(10)+
'创建人:' +  @Auathor 


end
GO


