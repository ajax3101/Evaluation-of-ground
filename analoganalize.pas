unit AnalogAnalize;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, DB, DBClient, JvMemDS, ADODB, Mask,
  DBCtrlsEh,DBGridEhImpExp;

type
  TForm_analize = class(TForm)
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    JvMemoryData1: TJvMemoryData;
    ADOQuery1: TADOQuery;
    infindex: TADOQuery;
    Button2: TButton;
    okBUTON: TButton;
    GroupBox1: TGroupBox;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBCheckBoxEh1: TDBCheckBoxEh;
    Label2: TLabel;
    Label3: TLabel;
    procedure JvMemoryData1AfterScroll(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    n_analog:integer;
    procedure calc_ves_all();
    function analize(analog_number,id,selo,rayon:integer;a:tadoconnection;var metr:double):boolean;
    procedure calc();
  end;

var
  Form_analize: TForm_analize;

implementation

uses Math;

{$R *.dfm}

{
1.		Индекс инфляции
2.		Курс доллара
3.		Площадь  (по граничным коефф. и по весу)
4.		Место расположения (ручной метод)
5.		Функциональное использование
6.		Численность населения (как в 2)
7.		Плотность населения численн/площадь (как в 2)
8.		Расстояние до центра (как в 2)
9.		….. от порта (как в 2)
10.		….. от автостанции (как в 2)
11.		….. от жел. дороги (как в 2)
12.		електричество (есть/нет)  1-1 -> 1, 0-1->0.95, 1-0 ->1.05
13.		Заболоченность
14.		вода (как в 13)
15.		гар. Вода (как в 13)
16.		газ (как в 13)
17.		канализация (как в 13)
18.		телефон (как в 13)
19.		опалювання (как в 13)
20.		нормативная оценка (как в 2)
}


function mapping(a:string):string;
begin
  result:='';
  if a='mny' then result := 'cena' else
  if a='mkv' then result := 'cena_kv_m' else
  if a='dta' then result := 'data_prodaji' else
  if a='k1' then result := 'inflation_index' else
  if a='d2' then result := 'dollar_rate' else
  if a='d3' then result := 'Area_ground' else
  if a='d4' then result := 'mesto_raspoloj' else
  if a='d5' then result := 'Fukt_ispol_descr' else
  if a='k5' then result := 'Fukt_ispol_koef' else
  if a='d6' then result := 'population' else
  if a='d7' then result := 'plotnost' else
  if a='d8' then result := 'Distance_centre' else
  if a='d9' then result := 'Distance_river_port' else
  if a='d10' then result := 'Distance_bus_stationn' else
  if a='d11' then result := 'Distance_railway_station' else
  if a='d12' then result := 'Maintenance_electricityn' else
  if a='d13' then result := 'bog' else
  if a='d14' then result := 'Maintenance_water' else
  if a='d15' then result := 'Maintenance_hot_water' else
  if a='d16' then result := 'Maintenance_gas' else
  if a='d17' then result := 'Maintenance_water_drain' else
  if a='d18' then result := 'Maintenance_telefon' else
  if a='d19' then result := 'Heating' else
  if a='d20' then result := 'Normative_estimation';
end;

procedure tForm_analize.calc();
var
   i,j,Imin,Imax:integer;
   tmp,min,max:double;
begin
     calc_ves_all();
     with JvMemoryData1 do
     begin
         for j:=1 to n_analog do
         begin
             Locate('key_','mkv',[]);
             if Fields[2+j].AsString='' then continue;
             tmp:=Fields[2+j].AsCurrency;
             for i:=1 to 20 do
             begin
                 Locate('key_','k'+inttostr(i),[]);
                 if not fieldbyname('deactivate').AsBoolean then
                 begin
                     if Fields[2+j].AsCurrency<10 then
                     tmp:=tmp*Fields[2+j].AsCurrency;
                     Locate('key_','m'+inttostr(i),[]);
                     edit;
                     Fields[2+j].ascurrency:=tmp;
                     post;
                 end;
             end;
         end;
         Locate('key_','m20',[]);
         imin:=1;
         imax:=1;
         min:=fields[3].AsCurrency;
         max:=fields[3].AsCurrency;
         for i:=1 to n_analog do
         begin
             if fields[2+i].AsCurrency>max then
             begin
                max:=fields[2+i].AsCurrency;
                imax:=i;
             end;
             if fields[2+i].AsCurrency<min then
             begin
                imin:=i;
                min:=fields[2+i].AsCurrency;
             end;
         end;
         tmp:=0;
         for i:=1 to n_analog do
         if (i<>imax) and (i<>imin) then
             tmp:=tmp+fields[2+i].AsCurrency;
         tmp:=FloatToCurr(tmp/(n_analog-2));
         Locate('key_','rez',[]);
         edit;
         Fields[2].ascurrency:=tmp;
         post
     end;
end;

procedure TForm_analize.calc_ves_all();
procedure calc_by_ves(key_:integer);
var
   Adelta,Bdelta:double;
   tmp,maxv,minv,min_koef,max_koef:double;
   i:integer;
begin
     with JvMemoryData1 do
     begin
         adelta:=0;bdelta:=0;
         Locate('key_','k'+inttostr(key_),[]);
         if fieldbyname('deactivate').AsBoolean then exit;
         min_koef:=fieldbyname('min_koef').AsFloat;
         max_koef:=fieldbyname('max_koef').AsFloat;
         Locate('key_','d'+inttostr(key_),[]);
         if fields[2].AsString='' then exit;
         MaxV:=fields[2].AsFloat;
         MinV:=fields[2].AsFloat;
         for i:=0 to n_analog do
         if fields[2+i].AsString<>'' then
         begin
              if fields[2+i].asfloat<minv then minv:=fields[2+i].asfloat;
              if fields[2+i].asfloat>maxv then maxv:=fields[2+i].asfloat;
         end;
         if MinV<>fields[2].AsFloat then
         adelta:=(1-min_koef)/(fields[2].AsFloat-minv);
         if MaxV<>fields[2].AsFloat then
         bdelta:=(max_koef-1)/(maxv-fields[2].AsFloat);
         for i:=1 to n_analog do
         if fields[2+i].AsString<>'' then
         begin
              Locate('key_','d'+inttostr(key_),[]);
              if fields[2+i].asfloat>fields[2].AsFloat then
              tmp:=bdelta*(fields[2+i].asfloat-fields[2].AsFloat)+1
              else
              if fields[2+i].asfloat<fields[2].AsFloat then
              tmp:=1-adelta*(fields[2].AsFloat-fields[2+i].asfloat)
              else
              tmp:=1;
              Locate('key_','k'+inttostr(key_),[]);
              edit;
              fields[2+i].ascurrency:=tmp;
              post;
         end;
     end;
end;
begin
     calc_by_ves(2);
     calc_by_ves(6);
     calc_by_ves(7);
     calc_by_ves(8);
     calc_by_ves(9);
     calc_by_ves(10);
     calc_by_ves(11);
     calc_by_ves(20);
end;

function TForm_analize.analize(analog_number,id,selo,rayon:integer;a:tadoconnection;var metr:double):boolean;
var
   i,j:integer;
   koef:double;
   myform:TForm_analize;
function createfld(maindataset:tdataset;size:integer;displaylabel,fieldname:string;visible:boolean=true;datatype:TFieldType=ftstring):tfield;
var
   f:tfield;
begin
     if datatype=ftboolean then
        f:=TBooleanField.create(maindataset.Owner)
     else
     if datatype=ftCurrency then
     begin
         f:=TCurrencyField.create(maindataset.Owner);
         TCurrencyField(f).DisplayFormat:='0.##';
         f.alignment:=taLeftJustify;
     end
     else
     begin
         f:=tstringfield.create(maindataset.Owner);
         f.size:=size;
         f.alignment:=taCenter;
     end;
     f.displaywidth:=size;
     f.readonly:=false;
     f.visible:=visible;
     f.tag:=0;
     f.displaylabel:=displaylabel;
     f.fieldname:=fieldname;
     f.required:=false;
     f.name:=maindataset.Name+fieldname;
     f.dataset:=maindataset;
     result:=f;
end;
procedure setlimits(key_:string);
begin
     with myform do
     with JvMemoryData1 do
     begin
         Locate('key_',key_,[]);
         edit;
         fieldbyname('min_koef').asfloat:=0.9;
         fieldbyname('max_koef').asfloat:=1.1;
         post;
     end;
end;
procedure calc_dallar_rate();
var
   tmp:double;
   i:integer;
begin
     with myform do
     with JvMemoryData1 do
     begin
         if fields[2].Asstring<>'' then
         for i:=0 to n_analog do
         if fields[2+i].Asstring<>'' then
         begin
              Locate('key_','d2',[]);
              tmp:=fields[2+i].asfloat/fields[2].asfloat;
              Locate('key_','k2',[]);
              edit;
              fields[2+i].ascurrency:=tmp;
              post;
         end;
     end;
end;

procedure calc_by_bool(key_:integer);
var
   tmp:double;
   i:integer;
begin
     with myform do
     with JvMemoryData1 do
     begin
         for i:=1 to n_analog do
         begin
              Locate('key_','d'+inttostr(key_),[]);
              if (fields[2].asstring='') or (ansilowercase(trim(fields[2].asstring))='немає') then
              begin
                   if (fields[2+i].asstring='') or (ansilowercase(trim(fields[2+i].asstring))='немає') then
                   tmp:=1
                   else
                   tmp:=0.95;
              end
              else
              begin
                   if (fields[2+i].asstring='') or (ansilowercase(trim(fields[2+i].asstring))='немає') then
                   tmp:=1.05
                   else
                   tmp:=1;
              end;
              Locate('key_','k'+inttostr(key_),[]);
              edit;
              fields[2+i].ascurrency:=tmp;
              post;
         end;
     end;
end;

procedure calc_bool_all();
begin
     calc_by_bool(12);
     calc_by_bool(13);
     calc_by_bool(14);
     calc_by_bool(15);
     calc_by_bool(16);
     calc_by_bool(17);
     calc_by_bool(18);
     calc_by_bool(19);
end;

begin
     Application.CreateForm(TForm_analize,myform);
     with myform do
     begin
     result:=false;
     n_analog:=analog_number;
     with adoquery1 do
     begin
         Connection:=a;
         infindex.Connection:=a;
         Parameters[0].DataType:=ftInteger;
         Parameters[1].DataType:=ftInteger;
         Parameters[2].DataType:=ftInteger;
         Parameters[3].DataType:=ftInteger;
         Parameters[0].Value:=id;
         Parameters[1].Value:=selo;
         Parameters[2].Value:=selo;
         Parameters[3].Value:=rayon;
         Active:=true;
         if RecordCount<4 then
         begin
              showmessage('Аналогов слишком мало!');
              exit;
         end;
         if RecordCount<n_analog+1 then
         begin
              showmessage('Аналогов недостаточно!');
              n_analog:=RecordCount-1;
         end;
     end;
     createfld(JvMemoryData1,100,'key_','key_',false);
     createfld(JvMemoryData1,100,'Показники','pokazniki');
     createfld(JvMemoryData1,50,'Ділянка, що оцінюється','dilianka');
     for i:=1 to n_analog do
        createfld(JvMemoryData1,50,'Ділянки, що порівнюються|'+inttostr(i),'analog'+inttostr(i));
     createfld(JvMemoryData1,100,'min_koef','min_koef',false,ftCurrency);
     createfld(JvMemoryData1,100,'max_koef','max_koef',false,ftCurrency);
     createfld(JvMemoryData1,100,'deactivate','deactivate',false,ftboolean);
     with JvMemoryData1 do
     begin
         DisableControls;
         active:=true;
         with DBGridEh1 do
         for i:=0 to Columns.Count-1 do
         begin
         Columns[i].WordWrap:=true;
         Columns[i].Alignment:=taCenter;
         end;
//     for j:=1 to
         AppendRecord(['mny','Ціна, грн.']);
         AppendRecord(['mkv','Ціна за 1 кв. м., грн.']);
         AppendRecord(['dta','Дата продажу']);
         AppendRecord(['k1','Поправка на дату продажу (індекс інляції)']);
         AppendRecord(['m1','Скоригована ціна, грн.']);
         AppendRecord(['d2','Курс доллара']);
         AppendRecord(['k2','Поправка']);
         AppendRecord(['m2','Скоригована ціна, грн.']);
         AppendRecord(['d3','Площа ділянки, кв. м.']);
         AppendRecord(['k3','Поправка']);
         AppendRecord(['m3','Скоригована ціна, грн.']);
         AppendRecord(['d4','Місце розташування']);
         AppendRecord(['k4','Поправка']);
         AppendRecord(['m4','Скоригована ціна, грн.']);
         AppendRecord(['d5','Функціональне використання']);
         AppendRecord(['k5','Поправка']);
         AppendRecord(['m5','Скоригована ціна, грн.']);
         AppendRecord(['d6','Чисельність населення']);
         AppendRecord(['k6','Поправка']);
         AppendRecord(['m6','Скоригована ціна, грн.']);
         AppendRecord(['d7','Щільність населення']);
         AppendRecord(['k7','Поправка']);
         AppendRecord(['m7','Скоригована ціна, грн.']);
         AppendRecord(['d8','Віддаленість від центру, км.']);
         AppendRecord(['k8','Поправка']);
         AppendRecord(['m8','Скоригована ціна, грн.']);
         AppendRecord(['d9','Віддаленість від порту, км.']);
         AppendRecord(['k9','Поправка']);
         AppendRecord(['m9','Скоригована ціна, грн.']);
         AppendRecord(['d10','Віддаленість від автостанції, км.']);
         AppendRecord(['k10','Поправка']);
         AppendRecord(['m10','Скоригована ціна, грн.']);
         AppendRecord(['d11','Віддаленість від залізн. станції, км.']);
         AppendRecord(['k11','Поправка']);
         AppendRecord(['m11','Скоригована ціна, грн.']);
         AppendRecord(['d12','Електропостачання']);
         AppendRecord(['k12','Поправка']);
         AppendRecord(['m12','Скоригована ціна, грн.']);
         AppendRecord(['d13','Заболоченність']);
         AppendRecord(['k13','Поправка']);
         AppendRecord(['m13','Скоригована ціна, грн.']);
         AppendRecord(['d14','Вода']);
         AppendRecord(['k14','Поправка']);
         AppendRecord(['m14','Скоригована ціна, грн.']);
         AppendRecord(['d15','Гаряча вода']);
         AppendRecord(['k15','Поправка']);
         AppendRecord(['m15','Скоригована ціна, грн.']);
         AppendRecord(['d16','Газ']);
         AppendRecord(['k16','Поправка']);
         AppendRecord(['m16','Скоригована ціна, грн.']);
         AppendRecord(['d17','Каналізація']);
         AppendRecord(['k17','Поправка']);
         AppendRecord(['m17','Скоригована ціна, грн.']);
         AppendRecord(['d18','Телефон']);
         AppendRecord(['k18','Поправка']);
         AppendRecord(['m18','Скоригована ціна, грн.']);
         AppendRecord(['d19','Опалювання']);
         AppendRecord(['k19','Поправка']);
         AppendRecord(['m19','Скоригована ціна, грн.']);
         AppendRecord(['d20','Нормативна оцінка']);
         AppendRecord(['k20','Поправка']);
         AppendRecord(['m20','Скоригована ціна, грн.']);
         AppendRecord(['rez','Середнє значення для ранжованного ряду вартості:']);
         ADOQuery1.First;
         for j:=0 to n_analog do
         begin
             First;
             for i:=0 to RecordCount-1 do
             begin
                  edit;
                  Fieldbyname('deactivate').AsBoolean:=false;
                  post;
                  if mapping(Fields[0].asstring)<>'' then
                  begin
                     edit;
                     Fields[2+j].AsString:=adoquery1.fieldbyname(mapping(Fields[0].asstring)).asstring;
                     post;
                  end;
                  if Fields[0].asstring[1]='k' then
                  if (Fields[2+j].AsString='')or(Fields[2+j].AsFloat=0) then
                  begin
                     edit;
                     Fields[2+j].AsString:='1';
                     post;
                  end;
                  next;
             end;
             ADOQuery1.next;
         end;
         Locate('key_','mny',[]);
         edit;
         fields[2].asstring:='';
         post;
         Locate('key_','mkv',[]);
         edit;
         for i:=1 to n_analog do
         fields[2+i].ascurrency:=fields[2+i].asfloat;
         fields[2].asstring:='';
         post;
//////////////////  set limits ()
         setlimits('k2');
         setlimits('k6');
         setlimits('k7');
         setlimits('k8');
         setlimits('k9');
         setlimits('k10');
         setlimits('k11');
         setlimits('k20');
//////////////////  calc infation index
         for i:=1 to n_analog do
         begin
              Locate('key_','dta',[]);
              infindex.SQL.clear;
              infindex.sql.add('select koef from inflation_index');
              infindex.sql.add('where dateserial([year],[month],1)>=dateserial(year('''+Fields[2+i].asstring+'''),month('''+Fields[2+i].asstring+'''),1) and');
              infindex.sql.add('dateserial([year],[month],1)<dateserial(year('''+Fields[2].asstring+'''),month('''+Fields[2].asstring+'''),1)');
              infindex.Active:=false;
              infindex.Active:=true;
              infindex.First;
              koef:=1;
              for j:=0 to infindex.RecordCount-1 do
              begin
                   koef:=koef*infindex.Fields[0].AsFloat;
                   infindex.next;
              end;
              Locate('key_','k1',[]);
              edit;
              Fields[2+i].ascurrency:=koef;
              post;
         end;
////////////// calc all
         calc_dallar_rate();
         calc_bool_all();
         calc();
////////////////////////////////////////
         first;
         EnableControls;
         if ShowModal=mrok then
         begin
             result:=true;
             for i:=1 to 20 do
             begin
                 Locate('key_','k'+inttostr(i),[]);
                 if FieldByName('deactivate').AsBoolean then
                 begin
                    delete;
                    if Locate('key_','d'+inttostr(i),[]) then delete;
                    if Locate('key_','m'+inttostr(i),[]) then delete;
                 end;
             end;
             Locate('key_','rez',[]);
             metr:=fields[2].asfloat;
             DBGridEh_DoCopyAction(DBGridEh1,true);
             myform.Release;
         end;
     end;
     end;
end;

procedure TForm_analize.JvMemoryData1AfterScroll(DataSet: TDataSet);
begin
     if JvMemoryData1.Fields[0].AsString[1]='k' then
     begin
          DBEditEh1.Enabled:=strtoint(copy(JvMemoryData1.Fields[0].AsString,2,3)) in [2,6,7,8,9,10,11,20];
          DBEditEh2.Enabled:=DBEditEh1.Enabled;
     end
     else
     begin
          DBEditEh1.Enabled:=false;
          DBEditEh2.Enabled:=false;
     end;
     DBCheckBoxEh1.Enabled:=JvMemoryData1.Fields[0].AsString[1]='k';
end;

procedure TForm_analize.Button2Click(Sender: TObject);
begin
     calc;
end;

procedure TForm_analize.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if ModalResult<>mrok then action:=cafree;
end;

end.
