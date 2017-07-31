unit frm_dic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, Grids, DBGridEh, JvComCtrls,EhLibADO, DBCtrlsEh,
  JvComponent, JvxCtrls, StdCtrls, Mask, ExtCtrls, Menus, DBLookupEh,
  JvToolEdit, JvDBCtrl, DBSumLst, DBCtrls, JvCtrls, ADODB,JclFileUtils,JclDateTime;


type
  TForm_dictionary = class(TForm)
    PopupMenu1: TPopupMenu;
    appendrec1: TMenuItem;
    deleterec1: TMenuItem;
    N2: TMenuItem;
    Data_dic: TDataSource;
    TabControl1: TTabControl;
    DBGridEh1: TDBGridEh;
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    DBSumList1: TDBSumList;
    procedure JvPageControl1Change(Sender: TObject);
    procedure DBSumList1SumListChanged(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure appendrec1Click(Sender: TObject);
    procedure deleterec1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure browse(modal:boolean=false;index:integer=0);
  end;

var
  Form_dictionary: TForm_dictionary;
  colors:array [1..2] of array of integer;
implementation

uses main, frm_data;

{$R *.dfm}

procedure TForm_dictionary.JvPageControl1Change(Sender: TObject);
begin
//  if main_form.ActiveControl is tDBGridEh then
//  DBSumList1.DataSet:=tDBGridEh(main_form.ActiveControl).DataSource.DataSet;
end;

procedure TForm_dictionary.DBSumList1SumListChanged(Sender: TObject);
begin
    StatusBar1.Panels[0].Text:='Всего - '+floattostr(DBSumList1.SumCollection.Items[0].sumvalue);
end;

procedure TForm_dictionary.browse(modal:boolean=false;index:integer=0);
begin
     TabControl1.TabIndex:=index;
     if modal then
        showmodal
     else
        FormStyle:=fsMDIChild;
end;

procedure TForm_dictionary.TabControl1Change(Sender: TObject);
begin
  Data_dic.DataSet:=tdataset(Data.FindComponent(Memo1.Lines[TabControl1.tabindex]));
  DBSumList1.DataSet:=Data_dic.DataSet;
  DBSumList1.DataSet.Filtered:=false;
  DBGridEh1.Columns.AddAllColumns(true);
  data.fix_col(DBGridEh1.Columns);
  tabcontrol1.Realign;
end;

procedure TForm_dictionary.FormShow(Sender: TObject);
begin
    TabControl1Change(nil);
end;

procedure TForm_dictionary.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TForm_dictionary.appendrec1Click(Sender: TObject);
begin
    Data_dic.DataSet.Append;
end;

procedure TForm_dictionary.deleterec1Click(Sender: TObject);
begin
    Data_dic.DataSet.Delete;
end;

end.
