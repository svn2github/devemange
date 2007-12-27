/*******************************************************
 *
 *  BFSS 
 *
 * 作者: 龙仕云  日期:2007-10-26 
 *
 *
 *
 ******************************************************/

/*文件树*/
create table TB_FILE_TREE(
	ZID	int not null,
	ZNAME	VarChar(20) not null,
	ZMONTHVOLUME int default 0,             /* 月最大购买量（充值上限） */
constraint PK_TB_MEDIA  primary key (ZID)
)
go

