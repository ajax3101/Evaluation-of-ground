unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons,//OleAuto,
  ComCtrls,maybox;

type
  TMainForm = class(TForm)
    SpeedButton1: TSpeedButton;
    DataSource1: TDataSource;
    Table1: TTable;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBEdit9: TDBEdit;
    Label1: TLabel;
    DBEdit10: TDBEdit;
    Label2: TLabel;
    DBEdit11: TDBEdit;
    Label3: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBEdit18: TDBEdit;
    Label17: TLabel;
    DBEdit20: TDBEdit;
    Label18: TLabel;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit33: TDBEdit;
    Label27: TLabel;
    DBEdit34: TDBEdit;
    Label28: TLabel;
    DBEdit35: TDBEdit;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label35: TLabel;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    Label36: TLabel;
    Label37: TLabel;
    DBEdit40: TDBEdit;
    Label38: TLabel;
    DBEdit41: TDBEdit;
    Label39: TLabel;
    DBEdit42: TDBEdit;
    Label40: TLabel;
    DBComboBox1: TDBComboBox;
    Label42: TLabel;
    Label43: TLabel;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    Label45: TLabel;
    DBComboBox4: TDBComboBox;
    Label34: TLabel;
    Label41: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    SpeedButton2: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
   private
     { Private declarations }
  public


    { Public declarations }
  end;

var
  MainForm: TMainForm;
  path:string;
  StringList:TStrings;//глобальный каркас точек из in4

implementation

uses Analise;

{$R *.DFM}



procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      StringList.Free;
      Application.Terminate;
end;



procedure TMainForm.SpeedButton1Click(Sender: TObject);
var
   MsWord: Variant;
begin
{  try
    MsWord:=CreateOleObject('Word.Basic');
    MsWord.AppShow;
    MsWord.FileNew(Template:='c:\Programs_D\Evaluation_of_ground\Report.dot',NewTemplate:=0);
  except
    MessageDlg('Word''95  не доступен', mtError,[mbOk], 0);
  end;
//создание и заполнение полей отчета
      MSWord.Font('Times New Roman Cyr',12);
      MsWord.SetFormResult('Adress_ground',DBEdit3.Text);
      MsWord.SetFormResult('Selo',DBEdit4.Text);
      MsWord.SetFormResult('Rayon',DBEdit5.Text);
      MsWord.SetFormResult('Oblast',DBEdit6.Text);
      MsWord.SetFormResult('Client_IP',DBEdit1.Text);
      MsWord.SetFormResult('Client_RP',DBEdit2.Text);
      MsWord.SetFormResult('Pattern_ownership_gr',DBComboBox1.Text);
      MsWord.SetFormResult('Name_client_RP',DBEdit2.Text);
      MsWord.SetFormResult('Purpose_estimation',DBEdit33.Text);
      MsWord.SetFormResult('function_of_evaluati',DBEdit30.Text);
      MsWord.SetFormResult('Date_contract',DBEdit10.Text);
      MsWord.SetFormResult('Number_contract',DBEdit11.Text);
      MsWord.SetFormResult('Date_report',DBEdit13.Text);
      MsWord.SetFormResult('Date_estimation',DBEdit12.Text);
      MsWord.SetFormResult('Area_ground',DBEdit7.Text);
      MsWord.SetFormResult('Self_management',DBEdit17.Text);
      MsWord.SetFormResult('Description_building',DBMemo2.Text);
      MsWord.SetFormResult('Area_buildings',DBEdit8.Text);
      MsWord.SetFormResult('Date_Decision_prop_r',DBEdit14.Text);
      MsWord.SetFormResult('Numbe_Decision_prop',DBEdit16.Text);
      MsWord.SetFormResult('Rate_dollar',DBEdit34.Text);
      MsWord.SetFormResult('Form_ground',DBEdit19.Text);
      MsWord.SetFormResult('Relief_ground',DBEdit35.Text);
      //MsWord.SetFormResult('pokritie_podezd_dor',DBEdit39.Text);
      MsWord.SetFormResult('Distance_centre',DBEdit22.Text);
      MsWord.SetFormResult('Distance_bus_st',DBEdit21.Text);
      MsWord.SetFormResult('Distance_railway',DBEdit23.Text);
      MsWord.SetFormResult('Bog',DBEdit9.Text);
      MsWord.SetFormResult('Maintenance_water',DBEdit26.Text);
      MsWord.SetFormResult('Maintenance_water_dr',DBEdit27.Text);
      MsWord.SetFormResult('Maintenance_hot_water',DBEdit25.Text);
      MsWord.SetFormResult('Maintenance_electric',DBEdit18.Text);
      MsWord.SetFormResult('Maintenance_gas',DBEdit20.Text);
      MsWord.SetFormResult('Normative_estimation',DBEdit32.Text);
      MsWord.SetFormResult('cena_propisom',DBEdit40.Text);
      MsWord.SetFormResult('Distance_river_port',DBEdit24.Text);
      MsWord.SetFormResult('Population',DBEdit41.Text);
      MsWord.SetFormResult('AreaNaselenogoPuncta',DBEdit42.Text);
      MsWord.SetFormResult('Func_naznachen',DBComboBox2.Text);
      MsWord.SetFormResult('Fact_ispolzovanie',DBComboBox4.Text);
//переход к закладке "marker_1"
      MsWord.EditGoto('marker_1'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_2'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_3'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_4'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_5'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_6'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_7'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_8'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_9'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_10'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_11'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_12'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_13'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_14'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_15'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_16'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_17'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_18'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_19'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_20'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_21'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_22'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_23'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_24'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_25'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_26'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_27'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_28'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_29'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_30'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_31'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_32'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_33'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_34'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_35'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_36'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_37'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_38'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_39'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_40'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_41'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_42'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_43'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_44'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_45'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_46'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_47'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_48'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_49'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_50'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_51'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_52'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_53'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_54'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_55'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_56'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_57'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_58'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_59'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_60'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_61'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_62'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_63'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_64'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_65'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_66'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_67'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_68'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_69'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_70'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_71'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_72'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_73'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_74'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_75'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_76'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_77'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_78'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_79'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_80'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_81'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_82'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_83'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_84'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_85'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_86'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_87'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_88'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_89'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_90'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_91'); MsWord.CharRight;MsWord.UpdateFields;
      MsWord.EditGoto('marker_92'); MsWord.CharRight;MsWord.UpdateFields;
//      MsWord.EditSelectAll;
      MsWord.UpdateFields;
      MsWord.FileSave('c:\tmp.doc');}
end;


procedure TMainForm.SpeedButton2Click(Sender: TObject);
begin
   MainForm.Visible:=false;
   FormAnalise.Visible:=true;
end;

end.

