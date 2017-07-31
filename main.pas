unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvPlacemnt, ActnMan, ActnColorMaps, ActnCtrls, ToolWin,
  ActnMenus, XPStyleActnCtrls, ActnList, ExtCtrls, ImgList,DBGridEh,ADODB,
  ComCtrls, DB, StdCtrls, Menus;

type
  TMain_form = class(TForm)
    ActionToolBar1: TActionToolBar;
    ActionManager1: TActionManager;
    exit_prog: TAction;
    append_rec: TAction;
    delete_rec: TAction;
    Edit_action: TAction;
    refreshAction: TAction;
    XPColorMap1: TXPColorMap;
    ImageList1: TImageList;
    JvFormStorage1: TJvFormStorage;
    Dic: TAction;
    Analog: TAction;
    arialand: TAction;
    Memo1: TMemo;
    Memo2: TMemo;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure exit_progExecute(Sender: TObject);
    procedure append_recExecute(Sender: TObject);
    procedure append_recUpdate(Sender: TObject);
    procedure delete_recExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit_actionExecute(Sender: TObject);
    procedure Edit_actionUpdate(Sender: TObject);
    procedure refreshActionUpdate(Sender: TObject);
    procedure refreshActionExecute(Sender: TObject);
    procedure DicExecute(Sender: TObject);
    procedure AnalogExecute(Sender: TObject);
    procedure arialandExecute(Sender: TObject);
    procedure delete_recUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
    Main_Form: TMain_Form;
    mode_work:integer=0;

implementation

uses frm_dic, frm_data, from_arialand, from_analog,
  browsilka;

{$R *.dfm}

procedure TMain_form.exit_progExecute(Sender: TObject);
begin
     close;
end;

procedure TMain_form.append_recExecute(Sender: TObject);
begin
     if ActiveMDIChild is TForm_browse then
     if TForm_browse(ActiveMDIChild).caption='Список Земельных участков' then
     begin
         Data.AriaLand.Append;
         Application.CreateForm(TFormAriaLand,FormAriaLand);
         FormAriaLand.showmodal;
     end
     else
     begin
         Data.Analog.Append;
         Application.CreateForm(TFormAnalog,FormAnalog);
         formanalog.showmodal;
     end
     else
         tForm_dictionary(ActiveMDIChild).Data_dic.DataSet.append;
end;

procedure TMain_form.append_recUpdate(Sender: TObject);
begin
  taction(sender).Enabled:=(ActiveMDIChild<>nil);
end;

procedure TMain_form.delete_recExecute(Sender: TObject);
begin
     if application.MessageBox('Вы уверены что хотите удалить запись?','Удаление',Mb_yesno)=mrYES then
     if ActiveMDIChild is TForm_browse then
     if TForm_browse(ActiveMDIChild).caption='Список Земельных участков' then
         Data.AriaLand.delete
     else
         Data.Analog.delete
     else
         tForm_dictionary(ActiveMDIChild).Data_dic.DataSet.delete;
end;

procedure TMain_form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Data.baza.Connected:=false;
end;

procedure TMain_form.FormShow(Sender: TObject);
var
i,j:integer;
begin
  Data.baza.Connected:=true;
  for i:=0 to Data.ComponentCount-1 do
  if Data.Components[i] is tadoquery then
  with tadoquery(Data.Components[i]) do
  begin
   active:=true;
   for j:=0 to FieldCount-1 do
   if Memo1.Lines.IndexOf(Fields[j].FieldName)<>-1 then
     Fields[j].DisplayLabel:=Memo2.Lines[Memo1.Lines.IndexOf(Fields[j].FieldName)];
  end;
end;

procedure TMain_form.Edit_actionExecute(Sender: TObject);
begin
     if ActiveMDIChild is TForm_browse then
     if TForm_browse(ActiveMDIChild).caption='Список Земельных участков' then
     begin
         Application.CreateForm(TFormAriaLand,FormAriaLand);
         FormAriaLand.showmodal;
     end
     else
     begin
         Application.CreateForm(TFormAnalog,FormAnalog);
         formanalog.showmodal;
     end
end;

procedure TMain_form.Edit_actionUpdate(Sender: TObject);
begin
  taction(sender).Enabled:=(ActiveMDIChild is TForm_browse);
end;

procedure TMain_form.refreshActionUpdate(Sender: TObject);
begin
  taction(sender).Enabled:=(ActiveMDIChild<>nil);
end;

procedure TMain_form.refreshActionExecute(Sender: TObject);
begin
     if ActiveMDIChild is TForm_browse then
     if TForm_browse(ActiveMDIChild).caption='Список Земельных участков' then
         Data.AriaLand.Requery
     else
         Data.Analog.Requery
     else
         tadoquery(tForm_dictionary(ActiveMDIChild).Data_dic.DataSet).Requery;
end;

procedure TMain_form.DicExecute(Sender: TObject);
var
   a:tForm_dictionary;
   i:integer;
begin
     with application do
     for i:=0 to MainForm.MDIChildCount-1 do
     try
        if MainForm.MDIChildren[i] is tForm_dictionary then
        begin
            tForm_dictionary(MainForm.MDIChildren[i]).show;
            exit;
        end;
     except
     end;
    Application.CreateForm(tForm_dictionary,a);
    a.browse();
end;

procedure TMain_form.AnalogExecute(Sender: TObject);
var
   a:TForm_browse;
   i:integer;
begin
     with application do
     for i:=0 to MainForm.MDIChildCount-1 do
     try
        if MainForm.MDIChildren[i] is TForm_browse then
            if TForm_browse(MainForm.MDIChildren[i]).caption='Список Аналогов' then
            begin
                TForm_browse(MainForm.MDIChildren[i]).show;
                exit;
            end;
     except
     end;
     Application.CreateForm(TForm_browse,a);
     a.browse(false,'analog','Список Аналогов');
end;

procedure TMain_form.arialandExecute(Sender: TObject);
var
   a:TForm_browse;
   i:integer;
begin
     with application do
     for i:=0 to MainForm.MDIChildCount-1 do
     try
        if MainForm.MDIChildren[i] is TForm_browse then
            if TForm_browse(MainForm.MDIChildren[i]).caption='Список Земельных участков' then
            begin
                TForm_browse(MainForm.MDIChildren[i]).show;
                exit;
            end;
     except
     end;
    Application.CreateForm(TForm_browse,a);
    a.browse(false,'AriaLand','Список Земельных участков');
end;

procedure TMain_form.delete_recUpdate(Sender: TObject);
begin
  taction(sender).Enabled:=(ActiveMDIChild<>nil);
end;

end.
