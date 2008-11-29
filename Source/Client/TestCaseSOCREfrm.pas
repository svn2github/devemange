////////////////////////////////////////////////////////////////////////////////
//
// 项目: 测试用例管理
// 模块: 测试打分功能
// 作者: 龙仕云 创建时间: 2008-11-29
//
//
// 修改:       
//
//
//
////////////////////////////////////////////////////////////////////////////////
unit TestCaseSOCREfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialogfrm, StdCtrls, Buttons, DBCtrls, DB, DBClient, Mask;

type
  TTestCaseSOCREDlg = class(TBaseDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    dblkcbbZCLOSESTATUS: TDBLookupComboBox;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    cds1: TClientDataSet;
    ds1: TDataSource;
    lbl3: TLabel;
    edt1: TEdit;
    lbl4: TLabel;
    dbedtZREMORK: TDBEdit;
    procedure cds1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation
uses
  TestManageClient;

{$R *.dfm}

procedure TTestCaseSOCREDlg.cds1AfterScroll(DataSet: TDataSet);
begin
  case DataSet.FieldByName('ZID').AsInteger of
    0: edt1.Text := '5';
    1: edt1.Text := '2';
    2: edt1.Text := '1';
    3: edt1.Text := '0';
    4: edt1.Text := '-2';
  end;
end;

end.
