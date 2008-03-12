unit ClientTypeUnits;

interface
uses
  windows,ExcelUnits;
type

  //
  // 权限管理的内容
  //
  TModuleType = (mtFile=100,mtBug=200,mtProject=300,mtUser=400,mtDoc=500);
  //文件的子模块
  TFileSubModuleStype = (fsmDir=1,fsmfile=2);
  //BUG项目管理
  TBugSubModuleStype = (bsBugTree=1
                         );
  //项目管理
  TProjectSubModuleStype = (psVersion=1
    );
  //项目文档
  TDocSubModuleStype = (bsDocTree=1);


  //权限操作权限
  TActionType = (atView,atUpdate,atInsert,atDelete);
  TActionTypes = set of  TActionType;


  //文件管理内类型
  TFileStype = (fsFile,fsBug,fsDoc);

  //BUG的状态
  TBugStatus = (bgsAction,bgsDeath); //活动的，已修改的

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

const
  gcMSG_TickCount = $0400{WM_USER} +1;  //发送到mainfrm显示
  gcLogDir = 'Log'; //日志目录


implementation


end.
