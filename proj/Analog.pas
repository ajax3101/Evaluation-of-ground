unit Analog;

interface

uses
  Windows, Messages, Classes, SysUtils, Graphics, Controls, StdCtrls, Forms,
  Dialogs, DBCtrls, DB, DBTables, Mask, ExtCtrls, Grids, DBGrids;

type
  TAnalogs = class(TForm)
    Table1ID: TAutoIncField;
    Table1Adress_ground: TStringField;
    Table1Pattern_ownership_ground: TStringField;
    Table1Area_ground: TFloatField;
    Table1Purpose_estimation: TStringField;
    Table1Function_estimation: TStringField;
    Table1Date_Transaction: TDateField;
    Table1Estimated_cost_ground: TFloatField;
    Table1Document_property_right: TStringField;
    Table1Rate_dollar: TFloatField;
    Table1Distance_centre: TFloatField;
    Table1Distance_bus_stationn: TFloatField;
    Table1Distance_railway_station: TFloatField;
    Table1Distance_river_port: TFloatField;
    Table1Relief_ground: TStringField;
    Table1Bog: TStringField;
    Table1Description_buildings: TStringField;
    Table1Maintenance_water: TStringField;
    Table1Maintenance_hot_water: TStringField;
    Table1Maintenance_water_drain: TStringField;
    Table1Maintenance_electricityn: TStringField;
    Table1Maintenance_gas: TStringField;
    Table1Maintenance_telefon: TStringField;
    Table1Heating: TStringField;
    Table1Form_ground: TStringField;
    Table1Oblast: TStringField;
    Table1Rayon: TStringField;
    Table1Selo: TStringField;
    Table1Doc_zem: TStringField;
    Table1Fukt_ispol: TStringField;
    Table1Population: TFloatField;
    Table1Area_NaselenogoPuncta: TFloatField;
    Table1CelevoeIspozovanie: TStringField;
    Table1EconPlanZona: TStringField;
    ScrollBox: TScrollBox;
    Label2: TLabel;
    EditAdress_ground: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    EditArea_ground: TDBEdit;
    Label5: TLabel;
    EditPurpose_estimation: TDBEdit;
    Label6: TLabel;
    EditFunction_estimation: TDBEdit;
    Label7: TLabel;
    EditDate_Transaction: TDBEdit;
    Label8: TLabel;
    EditEstimated_cost_ground: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    EditRate_dollar: TDBEdit;
    Label11: TLabel;
    EditDistance_centre: TDBEdit;
    Label12: TLabel;
    EditDistance_bus_stationn: TDBEdit;
    Label13: TLabel;
    EditDistance_railway_station: TDBEdit;
    Label14: TLabel;
    EditDistance_river_port: TDBEdit;
    Label15: TLabel;
    EditRelief_ground: TDBEdit;
    Label16: TLabel;
    EditBog: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    EditMaintenance_water: TDBEdit;
    Label19: TLabel;
    EditMaintenance_hot_water: TDBEdit;
    Label20: TLabel;
    EditMaintenance_water_drain: TDBEdit;
    Label21: TLabel;
    EditMaintenance_electricityn: TDBEdit;
    Label22: TLabel;
    EditMaintenance_gas: TDBEdit;
    Label23: TLabel;
    EditMaintenance_telefon: TDBEdit;
    Label24: TLabel;
    EditHeating: TDBEdit;
    Label25: TLabel;
    EditForm_ground: TDBEdit;
    Label26: TLabel;
    EditOblast: TDBEdit;
    Label27: TLabel;
    EditRayon: TDBEdit;
    Label28: TLabel;
    EditSelo: TDBEdit;
    Label29: TLabel;
    EditDoc_zem: TDBEdit;
    Label30: TLabel;
    Label31: TLabel;
    EditPopulation: TDBEdit;
    Label32: TLabel;
    EditArea_NaselenogoPuncta: TDBEdit;
    Label33: TLabel;
    Label34: TLabel;
    EditEconPlanZona: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Table1: TTable;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DBComboBox3: TDBComboBox;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBMemo1: TDBMemo;
    DBComboBox4: TDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Analogs: TAnalogs;

implementation

uses AddAnalog;

{$R *.DFM}

procedure TAnalogs.FormCreate(Sender: TObject);
begin
  Table1.Open;
end;

procedure TAnalogs.Button1Click(Sender: TObject);
begin
   Main.Visible:=True;
   Analogs.Visible:=False;
end;

end.
