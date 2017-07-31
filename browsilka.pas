unit browsilka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, ComCtrls, DB, DBSumLst, Menus, Grids;

type
  TForm_browse = class(TForm)
    DBGridEh1: TDBGridEh;
    DBSumList1: TDBSumList;
    DataSource1: TDataSource;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure DBSumList1SumListChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure browse(modal:boolean;tablename,descr:string);
  end;

var
  Form_browse: TForm_browse;

implementation

uses frm_data, main;

{$R *.dfm}

procedure TForm_browse.browse(modal:boolean;tablename,descr:string);
begin
     DataSource1.DataSet:=tdataset(Data.FindComponent(tablename));
     DBSumList1.DataSet:=DataSource1.DataSet;
     caption:=descr;
     with DBGridEh1 do
     begin
          Columns.AddAllColumns(true);
          data.fix_col(Columns);
     end;
     if modal then
        showmodal
     else
        FormStyle:=fsMDIChild;
end;

procedure TForm_browse.DBSumList1SumListChanged(Sender: TObject);
begin
    StatusBar1.Panels[0].Text:='����� - '+floattostr(DBSumList1.SumCollection.Items[0].sumvalue);
end;

procedure TForm_browse.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     action:=cafree;
end;

end.
