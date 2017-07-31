unit from_arialand;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBCtrls, ExtCtrls, Mask, Grids, DBGrids,
  DBCtrlsEh, DBLookupEh, DBGridEh, JvPlacemnt, JvCtrls,analoganalize,comobj;


type
  TFormAriaLand = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
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
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    Label34: TLabel;
    Label41: TLabel;
    DBGrid1: TDBGridEh;
    DBEdit1: TDBEditEh;
    DBEdit2: TDBEditEh;
    DBEdit3: TDBEditEh;
    DBEdit7: TDBEditEh;
    DBEdit8: TDBEditEh;
    DBNavigator1: TDBNavigator;
    DBEdit9: TDBEditEh;
    DBEdit11: TDBEditEh;
    DBEdit16: TDBEditEh;
    DBEdit21: TDBEditEh;
    DBEdit22: TDBEditEh;
    DBEdit23: TDBEditEh;
    DBEdit24: TDBEditEh;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBEdit18: TDBEditEh;
    DBEdit20: TDBEditEh;
    DBEdit25: TDBEditEh;
    DBEdit26: TDBEditEh;
    DBEdit27: TDBEditEh;
    DBEdit28: TDBEditEh;
    DBEdit29: TDBEditEh;
    DBEdit31: TDBEditEh;
    DBEdit32: TDBEditEh;
    DBEdit34: TDBEditEh;
    DBEdit38: TDBEditEh;
    DBEdit40: TDBEditEh;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    DBDateTimeEditEh3: TDBDateTimeEditEh;
    DBEdit12: TDBEditEh;
    Label44: TLabel;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    DBLookupComboboxEh8: TDBLookupComboboxEh;
    DBLookupComboboxEh9: TDBLookupComboboxEh;
    DBLookupComboboxEh10: TDBLookupComboboxEh;
    DBLookupComboboxEh11: TDBLookupComboboxEh;
    DBLookupComboboxEh12: TDBLookupComboboxEh;
    DBDateTimeEditEh4: TDBDateTimeEditEh;
    Source_form: TDataSource;
    JvFormStorage1: TJvFormStorage;
    DBEditEh1: TDBEditEh;
    Label9: TLabel;
    DBDateTimeEditEh5: TDBDateTimeEditEh;
    JvImgBtn1: TJvImgBtn;
    JvImgBtn2: TJvImgBtn;
    JvImgBtn3: TJvImgBtn;
    procedure DBLookupComboboxEh3NotInList(Sender: TObject;
      NewText: String; var RecheckInList: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBDateTimeEditEh2Change(Sender: TObject);
    procedure DBEdit34Exit(Sender: TObject);
    procedure DBLookupComboboxEh8NotInList(Sender: TObject;
      NewText: String; var RecheckInList: Boolean);
    procedure JvImgBtn1Click(Sender: TObject);
    procedure JvImgBtn2Click(Sender: TObject);
    procedure JvImgBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAriaLand: TFormAriaLand;

implementation

uses frm_data, frm_dic, main;

{$R *.dfm}


Function Val_func(St : String): Longint;
 var Code : integer;
     I    : Longint;
begin
 Val(St, I, Code);
 Val_func:=I;
End;

Function Trim(strVar :String): String;
begin
 while Pos(' ', strVar) > 0 do Delete(strVar,Pos(' ', strVar),1);
 Trim:=strVar;
End;

Function TrimPoint(strVar :String): String;
var i : integer;
begin
i:= Pos('.',strVar);
if i=0 Then i:= Pos(',',strVar);
if i > 0 Then  TrimPoint:= Copy(strVar, 1, i-1)
         Else  TrimPoint:= strVar;
End;
Function InChar(s_str : String; mode : Integer; L : Char): String;
Var ret_symb : String;
begin
ret_symb:='';
if Val_func(Copy(s_str, 1, 1)) > 0 Then
 begin
 Case Val_func(Copy(s_str, 1, 1)) of
   1: ret_symb:= ' сто ';
   2: if L='R' Then ret_symb:= ' двести ' Else
      if L='U' Then ret_symb:= ' двiстi ';
   3: ret_symb:= ' триста ';
   4: if L='R' Then ret_symb:= ' четыреста 'Else
      if L='U' Then ret_symb:= ' чoтириста ';
   5: if L='R' Then ret_symb:= ' п€тьсот ' Else
      if L='U' Then ret_symb:= ' п`€тьсот ';
   6: if L='R' Then ret_symb:= ' шестьсот ' Else
      if L='U' Then ret_symb:= ' шiстьсот ';
   7: if L='R' Then ret_symb:= ' семьсот ' Else
      if L='U' Then ret_symb:= ' сiмьсот ';
   8: if L='R' Then ret_symb:= ' восемьсот ' Else
      if L='U' Then ret_symb:= ' вiсiмьсот ';
   9: if L='R' Then ret_symb:= ' дев€тьсот ' Else
      if L='U' Then ret_symb:= ' дев`€тьсот '
  end;
  end;
if Val_func(Copy(s_str, 2, 1)) > 0 Then
 Case Val_func(Copy(s_str, 2, 1)) of
   1: Case Val_func(Copy(s_str, 3, 1)) of
          0: if L='R' Then ret_symb:= ret_symb + ' дес€ть ' Else
             if L='U' Then ret_symb:= ret_symb + ' дес€ть ';
          1: if L='R' Then ret_symb:= ret_symb + ' одинадцать ' Else
             if L='U' Then ret_symb:= ret_symb + ' одинадц€ть ';
          2: if L='R' Then ret_symb:= ret_symb + ' двенадцать ' Else
             if L='U' Then ret_symb:= ret_symb + ' дванадц€ть ';
          3: if L='R' Then ret_symb:= ret_symb + ' тринадцать ' Else
             if L='U' Then ret_symb:= ret_symb + ' тринадц€ть ';
          4: if L='R' Then ret_symb:= ret_symb + ' четырнадцать ' Else
             if L='U' Then ret_symb:= ret_symb + ' чотирнадц€ть ';
          5: if L='R' Then ret_symb:= ret_symb + ' п€тнадцать ' Else
             if L='U' Then ret_symb:= ret_symb + ' п`€тнадц€ть ';
          6: if L='R' Then ret_symb:= ret_symb + ' шестнадцать ' Else
             if L='U' Then ret_symb:= ret_symb + ' шicтьнадц€ть ';
          7: if L='R' Then ret_symb:= ret_symb + ' семнадцать ' Else
             if L='U' Then ret_symb:= ret_symb + ' сiмнадц€ть ';
          8: if L='R' Then ret_symb:= ret_symb + ' восемнадцать ' Else
             if L='U' Then ret_symb:= ret_symb + ' вiсiмнадц€ть ';
          9: if L='R' Then ret_symb:= ret_symb + ' дев€тнадцать ' Else
             if L='U' Then ret_symb:= ret_symb + ' дев`€тнадц€ть ';
          End;
   2: if L='R' Then ret_symb:= ret_symb + ' двадцать ' Else
      if L='U' Then ret_symb:= ret_symb + ' двадц€ть ';
   3: if L='R' Then ret_symb:= ret_symb + ' тридцать ' Else
      if L='U' Then ret_symb:= ret_symb + ' тридц€ть ';
   4: if L='R' Then ret_symb:= ret_symb + ' сорок '    Else
      if L='U' Then ret_symb:= ret_symb + ' сорок ';
   5: if L='R' Then ret_symb:= ret_symb + ' п€тьдес€т ' Else
      if L='U' Then ret_symb:= ret_symb + ' п`€тьдес€т ';
   6: if L='R' Then ret_symb:= ret_symb + ' шестьдес€т 'Else
      if L='U' Then ret_symb:= ret_symb + ' шiстьдес€т ';
   7: if L='R' Then ret_symb:= ret_symb + ' семьдес€т ' Else
      if L='U' Then ret_symb:= ret_symb + ' сiмьдес€т ';
   8: if L='R' Then ret_symb:= ret_symb + ' восемьдес€т 'Else
      if L='U' Then ret_symb:= ret_symb + ' вiсiмьдес€т ';
   9: if L='R' Then ret_symb:= ret_symb + ' дев€носто '  Else
      if L='U' Then ret_symb:= ret_symb + ' дев`€носто ';
  End;
if (Val_func(Copy(s_str,Length(s_str),1)) > 0)And(Copy(s_str, 2, 1) <> '1') Then
  Case Val_func(Copy(s_str,Length(s_str),1)) of
   1: if mode = 0 Then ret_symb:= ret_symb + ' один '
                  Else ret_symb:= ret_symb + ' одна ';
   2: if mode = 0 Then
                   begin
        if L='R' Then ret_symb:= ret_symb + ' два ' Else
        if L='U' Then ret_symb:= ret_symb + ' два '
                   end Else
        if L='R' Then ret_symb:= ret_symb + ' две ' Else
        if L='U' Then ret_symb:= ret_symb + ' двi ';
   3: ret_symb:= ret_symb + ' три ';
   4: if L='R' Then ret_symb:= ret_symb + ' четыре ' Else
      if L='U' Then ret_symb:= ret_symb + ' чотири ';
   5: if L='R' Then ret_symb:= ret_symb + ' п€ть ' Else
      if L='U' Then ret_symb:= ret_symb + ' п`€ть ';
   6: if L='R' Then ret_symb:= ret_symb + ' шесть ' Else
      if L='U' Then ret_symb:= ret_symb + ' шiсть ';
   7: if L='R' Then ret_symb:= ret_symb + ' семь ' Else
      if L='U' Then ret_symb:= ret_symb + ' сiм ';
   8: if L='R' Then ret_symb:= ret_symb + ' восемь ' Else
      if L='U' Then ret_symb:= ret_symb + ' вiсiм ';
   9: if L='R' Then ret_symb:= ret_symb + ' дев€ть ' Else
      if L='U' Then ret_symb:= ret_symb + ' дев`€ть ';
  End;
InChar:= ret_symb;
End;

Function MoneyString(Summa : Real; L : Char) : String;
 Var st_symb, str_many, kop_many, str_space,
     mlrd_str, mil_str,tus_str, ed_str, ret_many : String;
     LenStr,i,j : Word;
     sum_str:string;
begin
ret_many:='';mlrd_str:=''; mil_str:=''; tus_str:=''; ed_str:='';
str_many:=''; kop_many:='';
 Str(summa:6:2,sum_str);
 str_many:= Trim(sum_str);
 j:=Pos('.',str_many);
 if j=0 then j:=Pos(',',str_many);
 if j > 0 Then kop_many:= Copy(str_many, j+1, 2)
                          Else kop_many:= '00';
 str_many:= TrimPoint(str_many);
 LenStr:= Length(str_many);
 if LenStr < 12 Then LenStr:= 12 - LenStr;
str_space:='';
for i:=1 to LenStr do str_space:= str_space + ' ';
str_many:= str_space + str_many;
if Val_func(Copy(str_many, 1, 3)) > 0 Then
 begin
  mlrd_str:= InChar(Copy(str_many, 1, 3), 0,L);
   if L='R' Then
    begin
   if mlrd_str=' один ' Then mlrd_str:= mlrd_str + ' миллиард ' Else
   if mlrd_str=' два '  Then mlrd_str:= mlrd_str + ' миллиарда 'Else
   if mlrd_str=' три '  Then mlrd_str:= mlrd_str + ' миллиарда 'Else
   if mlrd_str=' четыре ' Then mlrd_str:= mlrd_str + ' миллиарда 'Else
                               mlrd_str:= mlrd_str + ' миллиардов ';
    end     Else
   if L='U' Then
    begin
   if mlrd_str=' один ' Then mlrd_str:= mlrd_str + ' мiль`€рд ' Else
   if mlrd_str=' два '  Then mlrd_str:= mlrd_str + ' мiль`€рда 'Else
   if mlrd_str=' три '  Then mlrd_str:= mlrd_str + ' мiль`€рда 'Else
   if mlrd_str=' чотири ' Then mlrd_str:= mlrd_str + ' мiль`€рда 'Else
                               mlrd_str:= mlrd_str + ' мiль`€рдов ';
    end;
 End;
If Val_func(Copy(str_many, 4, 3)) > 0 Then
 begin
   mil_str:= InChar(Copy(str_many, 4, 3), 0,L);
   if L='R' Then
    begin
   if mil_str=' один ' Then mil_str:= mil_str + ' миллион ' Else
   if mil_str=' два '  Then mil_str:= mil_str + ' миллиона 'Else
   if mil_str=' три '  Then mil_str:= mil_str + ' миллиона 'Else
   if mil_str=' четыре ' Then mil_str:= mil_str + ' миллиона 'Else
                              mil_str:= mil_str + ' миллионов ';
    end  ELse
   if L='U' Then
    begin
   if mil_str=' один 'Then mil_str:= mil_str + ' мiльйон ' Else
   if mil_str=' два ' Then mil_str:= mil_str + ' мiльйона 'Else
   if mil_str=' три ' Then mil_str:= mil_str + ' мiльйона 'Else
   if mil_str=' чотири' Then mil_str:= mil_str + ' мiльйона 'Else
                              mil_str:= mil_str + ' мiльйонiв ';
    end
 End;
If Val_func(Copy(str_many, 7, 3)) > 0 Then
 begin
   tus_str:= InChar(Copy(str_many, 7, 3), 1,L);
   if L='R' Then
    begin
   if Pos(' одна ',tus_str)>0 Then tus_str:= tus_str + ' тыс€ча 'Else
   if Pos(' две ',tus_str)>0 Then tus_str:= tus_str + ' тыс€чи 'Else
   if Pos(' три ',tus_str)>0 Then tus_str:= tus_str + ' тыс€чи 'Else
   if Pos(' четыре ',tus_str)>0 Then tus_str:= tus_str + ' тыс€чи 'Else
                              tus_str:= tus_str + ' тыс€ч ';
    end  ELse
   if L='U' Then
    begin
   if Pos(' одна ',tus_str)>0 Then tus_str:= tus_str + ' тис€ча 'Else
   if Pos(' двi ',tus_str)>0 Then tus_str:= tus_str + ' тис€чi 'Else
   if Pos(' три ',tus_str)>0 Then tus_str:= tus_str + ' тис€чi 'Else
   if Pos(' чотири ',tus_str)>0 Then tus_str:= tus_str + ' тис€чi 'Else
                              tus_str:= tus_str + ' тис€ч ';
    end
 End;
 If Val_func(Copy(str_many, 10, 3)) > 0 Then
  ed_str:= InChar(Copy(str_many, 10, 3), 1,L);
if summa < 1 Then st_symb:= ' Ќуль' Else
 st_symb:= mlrd_str + mil_str + tus_str + ed_str;
ret_many:= st_symb + ' грн. ' + kop_many + ' коп.';
result:=AnsiUpperCase(ret_many[2])+Copy(ret_many,3,Length(ret_many));
End;






procedure TFormAriaLand.DBLookupComboboxEh3NotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
var
  a:tDBLookupComboboxEh;
begin
    a:=tDBLookupComboboxEh(sender);
    if NewText = '' then
         exit;
    if MessageDlg(format('«начение "%s" не найдено в списке.' + #13 + '¬ы хотите добавить его в справочник ?',[NewText]),
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

procedure TFormAriaLand.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    action:=cafree;
     if (Source_form.DataSet.state=dsedit) or (Source_form.DataSet.state=dsinsert) then
       if application.MessageBox('—охранить изменени€ ?','ѕредупреждение',Mb_yesno)=mrYES then
          Source_form.DataSet.post
       else
          Source_form.DataSet.cancel;
end;

procedure TFormAriaLand.DBDateTimeEditEh2Change(Sender: TObject);
begin
    DBEdit34.Enabled:=false;
    if DBDateTimeEditEh2.value<>null then
    begin
    if Data.dollar_rate.Locate('date',DBDateTimeEditEh2.Value,[]) then
    DBEdit34.Text:=Data.dollar_rate.fieldbyname('koef').asstring
    else
    DBEdit34.text:='';
    DBEdit34.Enabled:=true;
    end;
end;

procedure TFormAriaLand.DBEdit34Exit(Sender: TObject);
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

procedure TFormAriaLand.DBLookupComboboxEh8NotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
var
  a:tDBLookupComboboxEh;
  b:tForm_dictionary;
begin
    a:=tDBLookupComboboxEh(sender);
    if NewText = '' then
         exit;
    if MessageDlg(format('«начение "%s" не найдено в списке.' + #13 + '¬ы хотите добавить его в справочник ?',[NewText]),
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

procedure TFormAriaLand.JvImgBtn1Click(Sender: TObject);
begin
   if (Source_form.DataSet.state=dsedit) or (Source_form.DataSet.state=dsinsert) then
      Source_form.DataSet.post;
end;

procedure TFormAriaLand.JvImgBtn2Click(Sender: TObject);
type
  TWordReplaceFlags = set of (wrfReplaceAll, wrfMatchCase, wrfMatchWildcards);
const
  wdStory = $00000006;
  wdCell = $0000000C;
  wdLine = $00000005;
  wdCharacter = $00000001;
  wdExtend = $00000001;
  wdFindContinue = 1;
  wdReplaceOne = 1;
  wdReplaceAll = 2;
  wdDoNotSaveChanges = 0;
var
   rez:double;
   i:integer;
   MsWord: oleVariant;
   Flags: TWordReplaceFlags;

procedure repl(SearchString, ReplaceString: string);
begin
    flags:=[wrfReplaceAll];
//    SearchString:=repl('['+Fields[i].FieldName+']';
//    ReplaceString:=Fields[i].AsString;
    msword.Selection.Find.ClearFormatting;
    msword.Selection.Find.Text := SearchString;
    msword.Selection.Find.Replacement.Text := ReplaceString;
    msword.Selection.Find.Forward := True;
    msword.Selection.Find.Wrap := wdFindContinue;
    msword.Selection.Find.Format := False;
    msword.Selection.Find.MatchCase := wrfMatchCase in Flags;
    msword.Selection.Find.MatchWholeWord := False;
    msword.Selection.Find.MatchWildcards := wrfMatchWildcards in Flags;
    msword.Selection.Find.MatchSoundsLike := False;
    msword.Selection.Find.MatchAllWordForms := False;
    try
    msword.Selection.Find.Execute(Replace := wdReplaceAll)
    except
    end;
end;

begin
   if (Source_form.DataSet.state=dsedit) or (Source_form.DataSet.state=dsinsert) then
      Source_form.DataSet.post;
  with Data.AriaLand do
  if Form_analize.analize(strtoint(DBEditEh1.text),fieldbyname('id').AsInteger,fieldbyname('selo').AsInteger,fieldbyname('_rayon').LookupDataSet.FieldByName('rayon').asinteger,data.baza,rez) then
  begin
    DBEdit29.Text:=floattostr(rez);
    DBEdit28.Text:=floattostr(DBEdit7.Value*rez);
    DBEdit40.Text:=moneystring(DBEdit28.Value,'U');
    Source_form.DataSet.post;
///////////////////////////////
    try
       MsWord:=CreateOleObject('Word.Application');
       MsWord.Visible := true;
       MsWord.Documents.add(Template:=ExtractFilePath(paramstr(0))+'\Report.dot',NewTemplate:=0);
    except
       MessageDlg('MS Word не доступен', mtError,[mbOk], 0);
    end;
    with Source_form.DataSet do
    try
       for i:=0 to Fields.Count-1 do
          repl('['+Fields[i].FieldName+']',Fields[i].asstring);
       repl('[Rate_dollar]',DBEdit34.Text);
       msword.Selection.Find.ClearFormatting;;
       msword.Selection.Find.Text := '[AnalogAnalizeTable]';
       msword.Selection.Find.Replacement.Text := '';
       msword.Selection.Find.Forward := True;
       msword.Selection.Find.Wrap := wdFindContinue;
       msword.Selection.Find.Format := False;
       msword.Selection.Find.MatchCase := False;
       msword.Selection.Find.MatchWholeWord := False;
       msword.Selection.Find.MatchWildcards := False;
       msword.Selection.Find.MatchSoundsLike := False;
       msword.Selection.Find.MatchAllWordForms := False;
       msword.Selection.Find.Execute;
       msword.Selection.MoveRight( Unit:=wdCharacter, Count:=1);
       msword.Selection.Paste;
       msword.Selection.Find.ClearFormatting;;
       msword.Selection.Find.Text := '[AnalogAnalizeTable]';
       msword.Selection.Find.Replacement.Text := '';
       msword.Selection.Find.Forward := True;
       msword.Selection.Find.Wrap := wdFindContinue;
       msword.Selection.Find.Format := False;
       msword.Selection.Find.MatchCase := False;
       msword.Selection.Find.MatchWholeWord := False;
       msword.Selection.Find.MatchWildcards := False;
       msword.Selection.Find.MatchSoundsLike := False;
       msword.Selection.Find.MatchAllWordForms := False;
       msword.Selection.Find.Execute;
       msword.Selection.HomeKey( Unit:=wdLine);
       msword.Selection.MoveDown( Unit:=wdLine, Count:=1);
       msword.Selection.MoveRight( Unit:=wdCell);
       msword.Selection.MoveRight( Unit:=wdCell);
       msword.Selection.MoveRight( Unit:=wdCharacter, Count:=strtoint(DBEditEh1.text), Extend:=wdExtend);
       msword.Selection.Cells.Merge;
       msword.Selection.MoveLeft( Unit:=wdCell);
       msword.Selection.MoveDown( Unit:=wdLine, Count:=1, Extend:=wdExtend);
       msword.Selection.Cells.Merge;
       msword.Selection.MoveLeft( Unit:=wdCell);
       msword.Selection.MoveDown( Unit:=wdLine, Count:=1, Extend:=wdExtend);
       msword.Selection.Cells.Merge;
       repl('[AnalogAnalizeTable]','');
       msword.Selection.HomeKey(Unit:=wdStory);
    except
    end;
  end;
end;

procedure TFormAriaLand.JvImgBtn3Click(Sender: TObject);
var
   b:tForm_dictionary;
begin
    Application.CreateForm(tForm_dictionary,b);
    b.browse(true);
end;

end.
