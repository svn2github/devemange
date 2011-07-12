unit NewTaskfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, StdCtrls, Buttons, Mask, DBCtrls, DB, DBClient,
  ComCtrls;

type
  TNewTaskDlg = class(TBaseDialog)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBText1: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    dblkcbbName: TDBLookupComboBox;
    dbchkAddWork: TDBCheckBox;
    chkSelf: TCheckBox;
    edtSelfSrce: TEdit;
    dblkcbbZPRO_ID: TDBLookupComboBox;
    cdsCloneProjectName: TClientDataSet;
    dsCloneProjectName: TDataSource;
    dbtxtVer: TDBText;
    dtp1: TDateTimePicker;
    lbl1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewTaskDlg: TNewTaskDlg;

implementation

uses ProjectManageClientfrm;

{$R *.dfm}

end.
