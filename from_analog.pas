unit from_analog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBCtrls, Grids, DBGrids, Mask, ExtCtrls,
  DBCtrlsEh, DBLookupEh, DBGridEh, JvCtrls;

type
  TFormAnalog = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    Label37: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    Label34: TLabel;
    Label41: TLabel;
    Label44: TLabel;
    DBGrid1: TDBGridEH;
    DBEdit3: TDBEditEh;
    DBEdit7: TDBEditEh;
    DBNavigator1: TDBNavigator;
    DBEdit9: TDBEditEh;
    DBEdit21: TDBEditEh;
    DBEdit22: TDBEditEh;
    DBEdit23: TDBEditEh;
    DBEdit24: TDBEditEh;
    DBEdit18: TDBEditEh;
    DBEdit20: TDBEditEh;
    DBEdit25: TDBEditEh;
    DBEdit26: TDBEditEh;
    DBEdit27: TDBEditEh;
    DBEdit28: TDBEditEh;
    DBEdit31: TDBEditEh;
    DBEdit32: TDBEditEh;
    DBEdit34: TDBEditEh;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    DBEdit12: TDBEditEh;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    DBLookupComboboxEh8: TDBLookupComboboxEh;
    DBLookupComboboxEh9: TDBLookupComboboxEh;
    DBLookupComboboxEh10: TDBLookupComboboxEh;
    DBLookupComboboxEh11: TDBLookupComboboxEh;
    DBLookupComboboxEh12: TDBLookupComboboxEh;
    Source_form: TDataSource;
    DBEditEh1: TDBEditEh;
    Label5: TLabel;
    JvImgBtn1: TJvImgBtn;
    JvImgBtn3: TJvImgBtn;
    procedure DBLookupComboboxEh3NotInList(Sender: TObject;
      NewText: String; var RecheckInList: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBDateTimeEditEh2Change(Sender: TObject);
    procedure DBEdit34Exit(Sender: TObject);
    procedure DBLookupComboboxEh8NotInList(Sender: TObject;
      NewText: String; var RecheckInList: Boolean);
    procedure DBEditEh1Exit(Sender: TObject);
    procedure JvImgBtn1Click(Sender: TObject);
    procedure JvImgBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAnalog: TFormAnalog;

implementation

uses frm_data, frm_dic, DateUtils, main;

{$R *.dfm}

procedure TFormAnalog.DBLookupComboboxEh3NotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
var
  a:tDBLookupComboboxEh;
begin
    a:=tDBLookupComboboxEh(sender);
    if NewText = '' then
         exit;
    if MessageDlg(format('Значение "%s" не найдено в списке.' + #13 + 'Вы хотите добавить его в справочник ?',[NewText]),
    mtInformation, [mbYes, mbNo], 0) = mrYes
    then
    begin
      try
         if a.ListSource <> nil then
         with a.ListSource.dataset do
         begin
              Append;
              FieldByName(a.ListField).AsString:=newText;
              post;
              RecheckInList := True;
         end
         else
         with a.Field.LookupDataSet do
         begin
              Append;
              FieldByName(a.field.LookupResultField).AsString:=newText;
              post;
              RecheckInList := True;
         end;
      except
          a.style:=csDropDownListEh;
          if a.ListSource <> nil then
          a.ListSource.DataSet.Cancel
          else
          a.Field.LookupDataSet.Cancel;
      end;
    end
    else
      Abort;
    Application.ProcessMessages;
end;

procedure TFormAnalog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    action:=cafree;
     if (Source_form.DataSet.state=dsedit) or (Source_form.DataSet.state=dsinsert) then
       if application.MessageBox('Сохранить изменения ?','Предупреждение',Mb_yesno)=mrYES then
          Source_form.DataSet.post
       else
          Source_form.DataSet.cancel;
end;

procedure TFormAnalog.DBDateTimeEditEh2Change(Sender: TObject);
begin
    DBEdit34.Enabled:=false;
    DBEditEh1.Enabled:=false;
    if DBDateTimeEditEh2.value<>null then
    begin
    if Data.dollar_rate.Locate('date',DBDateTimeEditEh2.Value,[]) then
    DBEdit34.Text:=Data.dollar_rate.fieldbyname('koef').asstring
    else
    DBEdit34.text:='';
    DBEdit34.Enabled:=true;
    with Data.inflation_index do
    begin
        if Locate('year;month',VarArrayOf([YearOf(DBDateTimeEditEh2.Value),monthof(DBDateTimeEditEh2.Value)]),[]) then
        DBEditEh1.Text:=Data.inflation_index.fieldbyname('koef').asstring
        else
        DBEditEh1.Text:='';
    end;
    DBEditEh1.Enabled:=true;
    end;
end;

procedure TFormAnalog.DBEdit34Exit(Sender: TObject);
begin
    if DBDateTimeEditEh2.value<>null then
    if DBEdit34.Text<>'' then
    with Data.dollar_rate do
    if Locate('date',DBDateTimeEditEh2.Value,[]) then
    begin
         Edit;
         fieldbyname('koef').asstring:=DBEdit34.Text;
         post;
    end
    else
    begin
         append;
         fieldbyname('date').value:=DBDateTimeEditEh2.Value;
         fieldbyname('koef').asstring:=DBEdit34.Text;
         post;
    end
end;

procedure TFormAnalog.DBLookupComboboxEh8NotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
var
  a:tDBLookupComboboxEh;
  b:tForm_dictionary;
begin
    a:=tDBLookupComboboxEh(sender);
    if NewText = '' then
         exit;
    if MessageDlg(format('Значение "%s" не найдено в списке.' + #13 + 'Вы хотите добавить его в справочник ?',[NewText]),
    mtInformation, [mbYes, mbNo], 0) = mrYes
    then
    begin
      try
         if a.ListSource <> nil then
         with a.ListSource.dataset do
         begin
              Append;
              FieldByName(a.ListField).AsString:=newText;
              Application.CreateForm(tForm_dictionary,b);
              b.browse(true,10);
              RecheckInList := True;
         end
      except
          a.style:=csDropDownListEh;
          if a.ListSource <> nil then
          a.ListSource.DataSet.Cancel
          else
          a.Field.LookupDataSet.Cancel;
      end;
    end
    else
      Abort;
end;


procedure TFormAnalog.DBEditEh1Exit(Sender: TObject);
begin
    if DBDateTimeEditEh2.value<>null then
    if DBEditeh1.Text<>'' then
    with Data.inflation_index do
    if Locate('year;month',VarArrayOf([YearOf(DBDateTimeEditEh2.Value),monthof(DBDateTimeEditEh2.Value)]),[]) then
    begin
         Edit;
         fieldbyname('koef').asstring:=DBEditeh1.Text;
         post;
    end
    else
    begin
         append;
         fieldbyname('year').value:=YearOf(DBDateTimeEditEh2.Value);
         fieldbyname('month').value:=monthOf(DBDateTimeEditEh2.Value);
         fieldbyname('koef').asstring:=DBEditeh1.Text;
         post;
    end
end;

procedure TFormAnalog.JvImgBtn1Click(Sender: TObject);
begin
   if (Source_form.DataSet.state=dsedit) or (Source_form.DataSet.state=dsinsert) then
      Source_form.DataSet.post;
end;

procedure TFormAnalog.JvImgBtn3Click(Sender: TObject);
var
   b:tForm_dictionary;
begin
    Application.CreateForm(tForm_dictionary,b);
    b.browse(true);
end;

end.
