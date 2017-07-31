unit frm_data;

interface

uses
   SysUtils, Classes, DB, ADODB,DBGridEh;
type
  TData = class(TDataModule)
    baza: TADOConnection;
    AriaLand: TADOQuery;
    Function_estimation: TADOQuery;
    Analog: TADOQuery;
    Relief_ground: TADOQuery;
    Form_ground: TADOQuery;
    Doc_zem: TADOQuery;
    Pattern_ownership_ground: TADOQuery;
    Purpose_estimation: TADOQuery;
    dollar_rate: TADOQuery;
    inflation_index: TADOQuery;
    Fukt_ispol: TADOQuery;
    CelevoeIspozovanie: TADOQuery;
    region: TADOQuery;
    selsovet: TADOQuery;
    rayon: TADOQuery;
    nas_punkt: TADOQuery;
    AriaLandID: TAutoIncField;
    AriaLandName_client_IP: TWideStringField;
    AriaLandName_client_RP: TWideStringField;
    AriaLandAdress_ground: TWideStringField;
    AriaLandPattern_ownership_ground: TIntegerField;
    AriaLandArea_ground: TFloatField;
    AriaLandPurpose_estimation: TIntegerField;
    AriaLandFunction_estimation: TIntegerField;
    AriaLandDate_report: TDateTimeField;
    AriaLandDate_estimation: TDateTimeField;
    AriaLandEstimated_cost_ground: TFloatField;
    AriaLandEstimated_cost_meter: TFloatField;
    AriaLandNumber_contract: TWideStringField;
    AriaLandDate_contract: TDateTimeField;
    AriaLandDate_Decision_prop_right: TDateTimeField;
    AriaLandNumbe_Decision_prop_right: TWideStringField;
    AriaLandDistance_centre: TFloatField;
    AriaLandDistance_bus_stationn: TFloatField;
    AriaLandDistance_railway_station: TFloatField;
    AriaLandDistance_river_port: TFloatField;
    AriaLandRelief_ground: TIntegerField;
    AriaLandDescription_buildings: TMemoField;
    AriaLandArea_buildings: TFloatField;
    AriaLandForm_ground: TIntegerField;
    AriaLandNormative_estimation: TFloatField;
    AriaLandSelo: TIntegerField;
    AriaLandSelo_Arrangement: TMemoField;
    AriaLandDoc_zem: TIntegerField;
    AriaLandData_doc_zem: TDateTimeField;
    AriaLandNum_doc_zem: TWideStringField;
    AriaLandFukt_ispol: TIntegerField;
    AriaLandPrice_propisom: TWideStringField;
    AriaLandCelevoeIspozovanie: TIntegerField;
    AriaLandDate_Transaction: TDateTimeField;
    AriaLandanalog: TBooleanField;
    AriaLand_Pattern_ownership_ground: TStringField;
    AriaLand_Function_estimation: TStringField;
    AriaLand_Relief_ground: TStringField;
    AriaLand_Form_ground: TStringField;
    AriaLand_Doc_zem: TStringField;
    AriaLand_Purpose_estimation: TStringField;
    AriaLand_Fukt_ispol: TStringField;
    AriaLand_CelevoeIspozovanie: TStringField;
    AriaLandMaintenance_water: TWideStringField;
    AriaLandMaintenance_hot_water: TWideStringField;
    AriaLandMaintenance_water_drain: TWideStringField;
    AriaLandMaintenance_electricityn: TWideStringField;
    AriaLandMaintenance_gas: TWideStringField;
    AriaLandMaintenance_telefon: TWideStringField;
    AriaLandHeating: TWideStringField;
    AriaLandBog: TWideStringField;
    nas_punktkey_: TAutoIncField;
    nas_punktdescr: TWideStringField;
    nas_punktarea: TIntegerField;
    nas_punktpopulation: TIntegerField;
    nas_punktrayon: TIntegerField;
    nas_punktregion: TIntegerField;
    nas_punktselsovet: TIntegerField;
    nas_punkt_region: TStringField;
    nas_punkt_rayon: TStringField;
    nas_punkt_selsovet: TStringField;
    AnalogID: TAutoIncField;
    AnalogName_client_IP: TWideStringField;
    AnalogName_client_RP: TWideStringField;
    AnalogAdress_ground: TWideStringField;
    AnalogPattern_ownership_ground: TIntegerField;
    AnalogArea_ground: TFloatField;
    AnalogPurpose_estimation: TIntegerField;
    AnalogFunction_estimation: TIntegerField;
    AnalogDate_report: TDateTimeField;
    AnalogDate_estimation: TDateTimeField;
    AnalogEstimated_cost_ground: TFloatField;
    AnalogEstimated_cost_meter: TFloatField;
    AnalogNumber_contract: TWideStringField;
    AnalogDate_contract: TDateTimeField;
    AnalogDate_Decision_prop_right: TDateTimeField;
    AnalogNumbe_Decision_prop_right: TWideStringField;
    AnalogDistance_centre: TFloatField;
    AnalogDistance_bus_stationn: TFloatField;
    AnalogDistance_railway_station: TFloatField;
    AnalogDistance_river_port: TFloatField;
    AnalogRelief_ground: TIntegerField;
    AnalogDescription_buildings: TMemoField;
    AnalogArea_buildings: TFloatField;
    AnalogForm_ground: TIntegerField;
    AnalogNormative_estimation: TFloatField;
    AnalogSelo: TIntegerField;
    AnalogSelo_Arrangement: TMemoField;
    AnalogDoc_zem: TIntegerField;
    AnalogData_doc_zem: TDateTimeField;
    AnalogNum_doc_zem: TWideStringField;
    AnalogFukt_ispol: TIntegerField;
    AnalogPrice_propisom: TWideStringField;
    AnalogCelevoeIspozovanie: TIntegerField;
    AnalogDate_Transaction: TDateTimeField;
    Analoganalog: TBooleanField;
    Analog_Pattern_ownership_ground: TStringField;
    Analog_Function_estimation: TStringField;
    Analog_Relief_ground: TStringField;
    Analog_Form_ground: TStringField;
    Analog_Doc_zem: TStringField;
    Analog_Purpose_estimation: TStringField;
    Analog_Fukt_ispol: TStringField;
    Analog_CelevoeIspozovanie: TStringField;
    AnalogMaintenance_water: TWideStringField;
    AnalogMaintenance_hot_water: TWideStringField;
    AnalogMaintenance_water_drain: TWideStringField;
    AnalogMaintenance_electricityn: TWideStringField;
    AnalogMaintenance_gas: TWideStringField;
    AnalogMaintenance_telefon: TWideStringField;
    AnalogHeating: TWideStringField;
    AnalogBog: TWideStringField;
    DataSource_region: TDataSource;
    DataSource_rayon: TDataSource;
    DataSource_selsovet: TDataSource;
    DataSource_nas_punkt: TDataSource;
    Function_estimationkey_: TAutoIncField;
    Function_estimationdescr: TWideStringField;
    Relief_groundkey_: TAutoIncField;
    Relief_grounddescr: TWideStringField;
    Form_groundkey_: TAutoIncField;
    Form_grounddescr: TWideStringField;
    Doc_zemkey_: TAutoIncField;
    Doc_zemdescr: TWideStringField;
    inflation_indexkey_: TAutoIncField;
    inflation_indexyear: TIntegerField;
    inflation_indexmonth: TIntegerField;
    inflation_indexkoef: TFloatField;
    Pattern_ownership_groundkey_: TAutoIncField;
    Pattern_ownership_grounddescr: TWideStringField;
    Purpose_estimationkey_: TAutoIncField;
    Purpose_estimationdescr: TWideStringField;
    dollar_ratekey_: TAutoIncField;
    dollar_ratedate: TDateTimeField;
    dollar_ratekoef: TFloatField;
    Fukt_ispolkey_: TAutoIncField;
    Fukt_ispoldescr: TWideStringField;
    Fukt_ispolkoef: TFloatField;
    CelevoeIspozovaniekey_: TAutoIncField;
    CelevoeIspozovaniedescr: TWideStringField;
    CelevoeIspozovaniekoef: TFloatField;
    regionkey_: TAutoIncField;
    regiondescr: TWideStringField;
    selsovetkey_: TAutoIncField;
    selsovetdescr: TWideStringField;
    rayonkey_: TAutoIncField;
    rayondescr: TWideStringField;
    rayonregion: TIntegerField;
    AriaLand_rayon: TStringField;
    AriaLand_region: TStringField;
    AriaLand_selsovet: TStringField;
    AriaLand_selo: TStringField;
    Analog_rayon: TStringField;
    Analog_region: TStringField;
    Analog_selsovet: TStringField;
    Analog_selo: TStringField;
    AriaLand_population: TIntegerField;
    AriaLand_AreaNaselenogoPuncta: TFloatField;
    rayon_region: TStringField;
    procedure LineItemsCalcFields(DataSet: TDataSet);
    procedure AnalogBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure fix_col(t:TDBGridColumnsEh);
  end;
function iif(a:boolean;b,c:variant):variant;

var
  Data: TData;
implementation

{$R *.dfm}

function iif(a:boolean;b,c:variant):variant;
begin
     if a then result:=b else result:=c;
end;

procedure TData.fix_col(t:TDBGridColumnsEh);
var
   i:integer;
begin
   for i:=0 to t.count-1 do
   begin
     t[i].visible:=t[i].field.visible;
     t[i].Width:=iif(t[i].Width>150,150,t[i].Width);
     t[i].minwidth:=35;
     if t[i].Field.FieldKind=fkLookup then
     t[i].Title.TitleButton:=false;
   end;
end;

procedure TData.LineItemsCalcFields(DataSet: TDataSet);
begin
 { LineItemsExtendedPrice.Value := LineItemsPrice.Value *
    ((100 - LineItemsDiscount.Value) / 100);
  LineItemsTotal.Value := LineItemsExtendedPrice.Value *
    LineItemsQty.Value;
}
end;

procedure TData.AnalogBeforePost(DataSet: TDataSet);
begin
     DataSet.FieldByName('analog').AsBoolean:=true;
end;

end.
