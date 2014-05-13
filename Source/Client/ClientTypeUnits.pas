unit ClientTypeUnits;

interface
uses
  windows,ExcelUnits;
type

  //
  // 权限管理的内容
  //
  TModuleType = (mtFile=100,mtBug=200,mtProject=300,mtUser=400,mtDoc=500,
    mtTest=600,mtPlan=700,mtAnt=800,mtdayworktable=900,mtRelease=1000,
    mtQuestion=1100,mtPrototype=1200);
  //文件的子模块
  TFileSubModuleStype = (fsmDir=1,fsmfile=2);
  //BUG项目管理
  TBugSubModuleStype = (bsBugTree=1
                         );
  //项目管理
  TProjectSubModuleStype = (psVersion=1,psTask=2);
  //项目文档
  TDocSubModuleStype = (bsDocTree=1);
  
  //项目计划
  TPlanSubModuleStype=(psTree=1);

  //状态码
  TSTATECODE=(sc_begint=0,sc_doing=1,sc_end=2);


  //权限操作权限
  TActionType = (atView,atUpdate,atInsert,atDelete);
  TActionTypes = set of  TActionType;


  //文件管理内类型
  TFileStype = (fsFile,fsBug,fsDoc,fsDemand); //增加需求管理附件

  //BUG的状态
  TBugStatus = (bgsAction,bgsDeath,bgsReAction,bgsClose,bgsSubmi); //活动的，已修改的,被激活,关闭,提交测试

  //任务单的状态
  //待分发=0 ; 执行中=1 ; 撤消=2; 完成=3 ; 关闭=4;激活=5
  TTaskStatus = (tsRelass,tsing,tsUndo,tsSccuess,tsClose,tsAction);

  //发布管理状态
  TReleaseStatus = (rsCreate,rsClose);

  TStatusBarPanel=(sbpHint,sbpPart,spbObjID,spbComplier);

  PFileTreeNode = ^TFileTreeNode;
  TFileTreeNode = record
    fParent : PFileTreeNode;   //父对象
    fID   : integer;
    fPID  : integer;
    fName : String;
    fNote : String;
    fhasChild : Boolean;
    fOpenInherit  : Boolean; //=True 表示继承上级的打开方式
    fOpenExe      : String;  // Exe的路径
    fOpenExt      : String;  // 打开的扩展
    fPublic       : Boolean; //=True 表示公共,不处量权限
  end;

  PFileItem = ^TFileItem;
  TFileItem = record
    fTreeID : integer;
    fID : integer;
    fVer : integer;
    fName : String;
    fEditer_id : integer; //编辑人的id
    fEditer : String;     //编辑人的名称
    fFilePath : String;
    fStatus : integer;    //状态
    fExt : String;
    fEditDateTime : TDateTime;
    fStructVer : integer;
    fType : integer;      //类型
    fSzie : integer;      //文件大小
    fParentPri : Boolean; //是否采用目录的权限
    fOwner : Integer;     //创建人
    fOwnerName : string;
  end;

  PBugTreeNode = ^TBugTreeNode;
  TBugTreeNode = record
    fParent : PBugTreeNode;
    fID     : integer;
    fPID    : integer;
    fPRO_ID : integer; //项目ID值
    fName   : string;
    fAddDate: TDateTime;
    fSort   : integer;
    fhasChild : Boolean;
    fhasLoad : Boolean; //表示已加载了子级
    fPageIndex : integer; //当前的页数,默认为1;
    fPageCount : integer; //页总数
  end;

  PProjectDoc = ^TProjectDoc;
  TProjectDoc = record
    fParent : PProjectDoc;
    fID   : integer;
    fPid  : integer;
    fStyle : integer;     //类型  类型 = 0 目录，=1文档
    fName : String;
    fSort      : integer;
    fExcelFile : TExcelFile;
    fhasChild  : Boolean;
    fIsLoad    : Boolean; //是否已加载过了
  end;


const
  gcActionView   = 1;
  gcActionUpdate = 2;
  acActionInsert = 4;
  acActionDelete = 8;
const
  gcSoftChar    = '↑';
  gcDecSoftChar = '↓';
  gcfiledir     = '文件夹';

  ActionTypeName : array [atView..atDelete] of String  =
  ('查看','修改','增加','删除');

  TaskStatusName : array [tsRelass..tsAction] of String =
  ('待分发','执行中','撤消','完成','关闭','激活');

const
  gcMSG_TickCount = $0400{WM_USER} +1;  //发送到mainfrm显示
  gcMSG_GetBugItem = $0400{WM_USER} +2; //发送到bug,显示内容
  gcMSG_GetTestItem = $0400 + 3;        //发送到test ,显示内容
  gcMSG_GetReleaseItem = $0400+4;       //同上
  gcMSG_GetTestItemByCode=$0400+5;      //发送到test ，条件是多个 $123;$234
  gcMSG_GetPlanItem = $0400+6;          //发送到子任务，显示内容
  gcMSG_GetDemandItem = $0400+7;        //发送到需求管理,显示内容
  gcLogDir = 'Log'; //日志目录
  gcTagNewName = '新标签...';


implementation


end.
