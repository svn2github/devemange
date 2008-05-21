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


--set @mailtitle = "国家"
--set @mailtext  = "bbbbbbbbbbbbb"

end
GO
