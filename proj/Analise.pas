unit Analise;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, Db, DBTables, Grids, DBGrids, MathBox;

type
  TFormAnalise = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label5: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label7: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label4: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    SpeedButton1: TSpeedButton;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    DBEdit15: TDBEdit;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    DBEdit16: TDBEdit;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    DBEdit17: TDBEdit;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    DBEdit18: TDBEdit;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    DBEdit9: TDBEdit;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    DBEdit10: TDBEdit;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    DBEdit11: TDBEdit;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Table1: TTable;
    DataSource2: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Query1: TQuery;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit29: TEdit;
    Edit30: TEdit;
    Label55: TLabel;
    DBEdit20: TDBEdit;
    Edit31: TEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    Edit34: TEdit;
    Edit35: TEdit;
    Label56: TLabel;
    Edit36: TEdit;
    Edit37: TEdit;
    Edit38: TEdit;
    Edit39: TEdit;
    Edit40: TEdit;
    Edit41: TEdit;
    Edit42: TEdit;
    Edit43: TEdit;
    Edit44: TEdit;
    Edit45: TEdit;
    DBEdit21: TDBEdit;
    Label57: TLabel;
    DBEdit22: TDBEdit;
    Label58: TLabel;
    DBEdit23: TDBEdit;
    Label59: TLabel;
    Edit46: TEdit;
    Edit47: TEdit;
    Edit48: TEdit;
    Edit49: TEdit;
    Edit50: TEdit;
    Edit51: TEdit;
    Edit52: TEdit;
    Edit53: TEdit;
    Edit54: TEdit;
    Edit55: TEdit;
    Edit56: TEdit;
    Edit57: TEdit;
    Edit58: TEdit;
    Edit59: TEdit;
    Edit60: TEdit;
    Edit61: TEdit;
    Edit62: TEdit;
    Edit63: TEdit;
    Edit64: TEdit;
    Edit65: TEdit;
    Edit66: TEdit;
    Edit67: TEdit;
    Edit68: TEdit;
    Edit69: TEdit;
    Edit70: TEdit;
    Edit71: TEdit;
    Edit72: TEdit;
    Edit73: TEdit;
    Edit74: TEdit;
    Edit75: TEdit;
    Edit76: TEdit;
    Edit77: TEdit;
    Edit78: TEdit;
    Edit79: TEdit;
    Edit80: TEdit;
    Edit81: TEdit;
    Edit82: TEdit;
    Edit83: TEdit;
    Edit84: TEdit;
    Edit85: TEdit;
    Edit86: TEdit;
    Edit87: TEdit;
    Edit88: TEdit;
    Edit89: TEdit;
    Edit90: TEdit;
    Edit91: TEdit;
    Edit92: TEdit;
    Edit93: TEdit;
    Edit94: TEdit;
    Edit95: TEdit;
    Edit96: TEdit;
    Edit97: TEdit;
    Edit98: TEdit;
    Edit99: TEdit;
    Edit100: TEdit;
    Edit101: TEdit;
    Edit102: TEdit;
    Edit103: TEdit;
    Edit104: TEdit;
    Edit105: TEdit;
    Edit106: TEdit;
    Edit107: TEdit;
    Edit108: TEdit;
    Edit109: TEdit;
    Edit110: TEdit;
    Label52: TLabel;
    Edit111: TEdit;
    Edit112: TEdit;
    Edit113: TEdit;
    Edit114: TEdit;
    Edit115: TEdit;
    DBEdit19: TDBEdit;
    Edit116: TEdit;
    Edit117: TEdit;
    Edit118: TEdit;
    Edit119: TEdit;
    Edit120: TEdit;
    GroupBox1: TGroupBox;
    Label17: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAnalise: TFormAnalise;

implementation

uses Unit1;

{$R *.DFM}

procedure TFormAnalise.SpeedButton1Click(Sender: TObject);
begin
   MainForm.Visible:=true;
   FormAnalise.Visible:=false;
end;

procedure TFormAnalise.FormShow(Sender: TObject);
var
   S1,S2,S3,S4,S5,C1,C2,C3,C4,C5: Variant;
   Resalt: Real;
   AdresField, AreaGroundField, DateTransactionField,
   EconPlanZonaField, CelevoeIspozovanieField, PopulationField,
   Area_NaselenogoPunctaField, Distance_centreField, Distance_railway_stationField,
   Distance_bus_stationnField, Distance_river_portField, Document_property_rightField,
   Maintenance_electricitynField, Maintenance_waterField, Maintenance_hot_waterField,
   Maintenance_gasField, Maintenance_water_drainField, Maintenance_telefonField,
   SeloField, RayonField, OblastField, Estimated_cost_groundField
   : TField;
begin
   with query1 do
   begin
      AdresField:=FieldByName('Adress_ground');
      AreaGroundField:=FieldByName('Area_ground');
      DateTransactionField:=FieldByName('Date_Transaction');
      EconPlanZonaField:=FieldByName('EconPlanZona');
      CelevoeIspozovanieField:=FieldByName('CelevoeIspozovanie');
      PopulationField:=FieldByName('Population');
      Area_NaselenogoPunctaField:=FieldByName('Area_NaselenogoPuncta');
      Distance_centreField:=FieldByName('Distance_ centre');
      Distance_railway_stationField:=FieldByName('Distance_ railway_station');
      Distance_bus_stationnField:=FieldByName('Distance_ bus_stationn');
      Distance_river_portField:=FieldByName('Distance_ river_port');
      Document_property_rightField:=FieldByName('Document_property_right');
      Maintenance_electricitynField:=FieldByName('Maintenance_electricityn');
      Maintenance_waterField:=FieldByName('Maintenance_water');
      Maintenance_hot_waterField:=FieldByName('Maintenance_hot_water');
      Maintenance_gasField:=FieldByName('Maintenance_gas');
      Maintenance_water_drainField:=FieldByName('Maintenance_water_drain');
      Maintenance_telefonField:=FieldByName('Maintenance_telefon');
      SeloField:=FieldByName('Selo');
      RayonField:=FieldByName('Rayon');
      OblastField:=FieldByName('Oblast');
      Estimated_cost_groundField:=FieldByName('Estimated_cost_ground');
//Первый столбец
      First;
      Edit1.text:=AdresField.AsString;
      Edit6.text:=InttoStr(AreaGroundField.AsInteger);
      Edit111.text:=InttoStr(Estimated_cost_groundField.AsInteger);
//Вычисление площади квадратного метра
      C1:=AreaGroundField.AsInteger;S1:=Estimated_cost_groundField.AsInteger;
      if C1=0 then
      begin
         C1:=0.000000000000000000001;
      end
      else if C1<>0 then
         Resalt:=S1/C1;
         Edit116.text:=Real2Str(Resalt, 8, 2);

      Edit11.text:=DateTransactionField.AsString;
      Edit16.text:=EconPlanZonaField.AsString;
      Edit21.text:=CelevoeIspozovanieField.AsString;
      Edit26.text:=InttoStr(PopulationField.AsInteger);
      Edit31.text:=InttoStr(Area_NaselenogoPunctaField.AsInteger);
      Edit41.text:=InttoStr(Distance_centreField.AsInteger);
      Edit46.text:=InttoStr(Distance_railway_stationField.AsInteger);
      Edit51.text:=InttoStr(Distance_bus_stationnField.AsInteger);
      Edit56.text:=InttoStr(Distance_river_portField.AsInteger);
      Edit61.text:=Document_property_rightField.AsString;
      Edit66.text:=Maintenance_electricitynField.AsString;
      Edit71.text:=Maintenance_waterField.AsString;
      Edit76.text:=Maintenance_hot_waterField.AsString;
      Edit81.text:=Maintenance_gasField.AsString;
      Edit86.text:=Maintenance_water_drainField.AsString;
      Edit91.text:=Maintenance_telefonField.AsString;
      Edit96.text:=SeloField.AsString;
      Edit101.text:=RayonField.AsString;
      Edit106.text:=OblastField.AsString;
//Второй столбец
      Next;
      Edit2.text:=AdresField.AsString;
      Edit7.text:=InttoStr(AreaGroundField.AsInteger);
      Edit112.text:=InttoStr(Estimated_cost_groundField.AsInteger);
//Вычисление площади квадратного метра
      C2:=AreaGroundField.AsInteger;S2:=Estimated_cost_groundField.AsInteger;
      if C2=0 then
      begin
         C2:=0.000000000000000000001;
      end
      else if C2<>0 then
         Resalt:=S2/C2;
         Edit117.text:=Real2Str(Resalt, 8, 2);


      Edit12.text:=DateTransactionField.AsString;
      Edit17.text:=EconPlanZonaField.AsString;
      Edit22.text:=CelevoeIspozovanieField.AsString;
      Edit27.text:=InttoStr(PopulationField.AsInteger);
      Edit32.text:=InttoStr(Area_NaselenogoPunctaField.AsInteger);
      Edit42.text:=InttoStr(Distance_centreField.AsInteger);
      Edit47.text:=InttoStr(Distance_railway_stationField.AsInteger);
      Edit52.text:=InttoStr(Distance_bus_stationnField.AsInteger);
      Edit57.text:=InttoStr(Distance_river_portField.AsInteger);
      Edit62.text:=Document_property_rightField.AsString;
      Edit67.text:=Maintenance_electricitynField.AsString;
      Edit72.text:=Maintenance_waterField.AsString;
      Edit77.text:=Maintenance_hot_waterField.AsString;
      Edit82.text:=Maintenance_gasField.AsString;
      Edit87.text:=Maintenance_water_drainField.AsString;
      Edit92.text:=Maintenance_telefonField.AsString;
      Edit97.text:=SeloField.AsString;
      Edit102.text:=RayonField.AsString;
      Edit107.text:=OblastField.AsString;
//Третий столбец
      Next;
      Edit3.text:=AdresField.AsString;
      Edit8.text:=InttoStr(AreaGroundField.AsInteger);
      Edit113.text:=InttoStr(Estimated_cost_groundField.AsInteger);
//Вычисление площади квадратного метра
      C3:=AreaGroundField.AsInteger;S3:=Estimated_cost_groundField.AsInteger;
      if C3=0 then
      begin
         C3:=0.000000000000000000001;
      end
      else if C3<>0 then
         Resalt:=S3/C3;
         Edit118.text:=Real2Str(Resalt, 8, 2);


      Edit13.text:=DateTransactionField.AsString;
      Edit18.text:=EconPlanZonaField.AsString;
      Edit23.text:=CelevoeIspozovanieField.AsString;
      Edit28.text:=InttoStr(PopulationField.AsInteger);
      Edit33.text:=InttoStr(Area_NaselenogoPunctaField.AsInteger);
      Edit43.text:=InttoStr(Distance_centreField.AsInteger);
      Edit48.text:=InttoStr(Distance_railway_stationField.AsInteger);
      Edit53.text:=InttoStr(Distance_bus_stationnField.AsInteger);
      Edit58.text:=InttoStr(Distance_river_portField.AsInteger);
      Edit63.text:=Document_property_rightField.AsString;
      Edit68.text:=Maintenance_electricitynField.AsString;
      Edit73.text:=Maintenance_waterField.AsString;
      Edit78.text:=Maintenance_hot_waterField.AsString;
      Edit83.text:=Maintenance_gasField.AsString;
      Edit88.text:=Maintenance_water_drainField.AsString;
      Edit93.text:=Maintenance_telefonField.AsString;
      Edit98.text:=SeloField.AsString;
      Edit103.text:=RayonField.AsString;
      Edit108.text:=OblastField.AsString;
//Четвертый столбец
      Next;
      Edit4.text:=AdresField.AsString;
      Edit9.text:=InttoStr(AreaGroundField.AsInteger);
      Edit114.text:=InttoStr(Estimated_cost_groundField.AsInteger);
//Вычисление площади квадратного метра
      C4:=AreaGroundField.AsInteger;S4:=Estimated_cost_groundField.AsInteger;
      if C4=0 then
      begin
         C4:=0.000000000000000000001;
      end
      else if C4<>0 then
         Resalt:=S4/C4;
         Edit119.text:=Real2Str(Resalt, 8, 2);


      Edit14.text:=DateTransactionField.AsString;
      Edit19.text:=EconPlanZonaField.AsString;
      Edit24.text:=CelevoeIspozovanieField.AsString;
      Edit29.text:=InttoStr(PopulationField.AsInteger);
      Edit34.text:=InttoStr(Area_NaselenogoPunctaField.AsInteger);
      Edit44.text:=InttoStr(Distance_centreField.AsInteger);
      Edit49.text:=InttoStr(Distance_railway_stationField.AsInteger);
      Edit54.text:=InttoStr(Distance_bus_stationnField.AsInteger);
      Edit59.text:=InttoStr(Distance_river_portField.AsInteger);
      Edit64.text:=Document_property_rightField.AsString;
      Edit69.text:=Maintenance_electricitynField.AsString;
      Edit74.text:=Maintenance_waterField.AsString;
      Edit79.text:=Maintenance_hot_waterField.AsString;
      Edit84.text:=Maintenance_gasField.AsString;
      Edit89.text:=Maintenance_water_drainField.AsString;
      Edit94.text:=Maintenance_telefonField.AsString;
      Edit99.text:=SeloField.AsString;
      Edit104.text:=RayonField.AsString;
      Edit109.text:=OblastField.AsString;
//Пятый столбец
      Next;
      Edit5.text:=AdresField.AsString;
      Edit10.text:=InttoStr(AreaGroundField.AsInteger);
      Edit115.text:=InttoStr(Estimated_cost_groundField.AsInteger);
//Вычисление площади квадратного метра
      C5:=AreaGroundField.AsInteger;S5:=Estimated_cost_groundField.AsInteger;
            if C5=0 then
      begin
         C5:=0.000000000000000000001;
      end
      else if C4<>0 then
         Resalt:=S5/C5;
         Edit120.text:=Real2Str(Resalt, 8, 2);


      Edit15.text:=DateTransactionField.AsString;
      Edit20.text:=EconPlanZonaField.AsString;
      Edit25.text:=CelevoeIspozovanieField.AsString;
      Edit30.text:=InttoStr(PopulationField.AsInteger);
      Edit35.text:=InttoStr(Area_NaselenogoPunctaField.AsInteger);
      Edit45.text:=InttoStr(Distance_centreField.AsInteger);
      Edit50.text:=InttoStr(Distance_railway_stationField.AsInteger);
      Edit55.text:=InttoStr(Distance_bus_stationnField.AsInteger);
      Edit60.text:=InttoStr(Distance_river_portField.AsInteger);
      Edit65.text:=Document_property_rightField.AsString;
      Edit70.text:=Maintenance_electricitynField.AsString;
      Edit75.text:=Maintenance_waterField.AsString;
      Edit80.text:=Maintenance_hot_waterField.AsString;
      Edit85.text:=Maintenance_gasField.AsString;
      Edit90.text:=Maintenance_water_drainField.AsString;
      Edit95.text:=Maintenance_telefonField.AsString;
      Edit100.text:=SeloField.AsString;
      Edit105.text:=RayonField.AsString;
      Edit110.text:=OblastField.AsString;

   end;











   
end;

end.
