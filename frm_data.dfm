object Data: TData
  OldCreateOrder = True
  Left = 260
  Top = 172
  Height = 371
  Width = 542
  object baza: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=.\dat' +
      'a\database.mdb;Mode=Share Deny None;Extended Properties="";Persi' +
      'st Security Info=False;Jet OLEDB:System database="";Jet OLEDB:Re' +
      'gistry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine T' +
      'ype=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial' +
      ' Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New D' +
      'atabase Password="";Jet OLEDB:Create System Database=False;Jet O' +
      'LEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Compa' +
      'ct=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLED' +
      'B:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 16
  end
  object AriaLand: TADOQuery
    Connection = baza
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from AriaLand'
      'where analog=false')
    Left = 112
    Top = 16
    object AriaLandID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object AriaLandName_client_IP: TWideStringField
      FieldName = 'Name_client_IP'
      Size = 255
    end
    object AriaLandName_client_RP: TWideStringField
      FieldName = 'Name_client_RP'
      Size = 255
    end
    object AriaLandAdress_ground: TWideStringField
      FieldName = 'Adress_ground'
      Size = 255
    end
    object AriaLandPattern_ownership_ground: TIntegerField
      FieldName = 'Pattern_ownership_ground'
      Visible = False
    end
    object AriaLandArea_ground: TFloatField
      FieldName = 'Area_ground'
    end
    object AriaLandPurpose_estimation: TIntegerField
      FieldName = 'Purpose_estimation'
      Visible = False
    end
    object AriaLandFunction_estimation: TIntegerField
      FieldName = 'Function_estimation'
      Visible = False
    end
    object AriaLandDate_report: TDateTimeField
      FieldName = 'Date_report'
    end
    object AriaLandDate_estimation: TDateTimeField
      FieldName = 'Date_estimation'
    end
    object AriaLandEstimated_cost_ground: TFloatField
      FieldName = 'Estimated_cost_ground'
    end
    object AriaLandEstimated_cost_meter: TFloatField
      FieldName = 'Estimated_cost_meter'
    end
    object AriaLandNumber_contract: TWideStringField
      FieldName = 'Number_contract'
      Size = 10
    end
    object AriaLandDate_contract: TDateTimeField
      FieldName = 'Date_contract'
    end
    object AriaLandDate_Decision_prop_right: TDateTimeField
      FieldName = 'Date_Decision_prop_right'
    end
    object AriaLandNumbe_Decision_prop_right: TWideStringField
      FieldName = 'Numbe_Decision_prop_right'
      Size = 10
    end
    object AriaLandDistance_centre: TFloatField
      FieldName = 'Distance_centre'
    end
    object AriaLandDistance_bus_stationn: TFloatField
      FieldName = 'Distance_bus_stationn'
    end
    object AriaLandDistance_railway_station: TFloatField
      FieldName = 'Distance_railway_station'
    end
    object AriaLandDistance_river_port: TFloatField
      FieldName = 'Distance_river_port'
    end
    object AriaLandRelief_ground: TIntegerField
      FieldName = 'Relief_ground'
      Visible = False
    end
    object AriaLandDescription_buildings: TMemoField
      FieldName = 'Description_buildings'
      Visible = False
      BlobType = ftMemo
    end
    object AriaLandArea_buildings: TFloatField
      FieldName = 'Area_buildings'
    end
    object AriaLandForm_ground: TIntegerField
      FieldName = 'Form_ground'
      Visible = False
    end
    object AriaLandNormative_estimation: TFloatField
      FieldName = 'Normative_estimation'
    end
    object AriaLandSelo: TIntegerField
      FieldName = 'Selo'
      Visible = False
    end
    object AriaLandSelo_Arrangement: TMemoField
      FieldName = 'Selo_Arrangement'
      Visible = False
      BlobType = ftMemo
    end
    object AriaLandDoc_zem: TIntegerField
      FieldName = 'Doc_zem'
      Visible = False
    end
    object AriaLandData_doc_zem: TDateTimeField
      FieldName = 'Data_doc_zem'
    end
    object AriaLandNum_doc_zem: TWideStringField
      FieldName = 'Num_doc_zem'
      Size = 10
    end
    object AriaLandFukt_ispol: TIntegerField
      FieldName = 'Fukt_ispol'
      Visible = False
    end
    object AriaLandPrice_propisom: TWideStringField
      FieldName = 'Price_propisom'
      Size = 255
    end
    object AriaLandCelevoeIspozovanie: TIntegerField
      FieldName = 'CelevoeIspozovanie'
      Visible = False
    end
    object AriaLandDate_Transaction: TDateTimeField
      FieldName = 'Date_Transaction'
      Visible = False
    end
    object AriaLandanalog: TBooleanField
      FieldName = 'analog'
      Visible = False
    end
    object AriaLand_Pattern_ownership_ground: TStringField
      FieldKind = fkLookup
      FieldName = '_Pattern_ownership_ground'
      LookupDataSet = Pattern_ownership_ground
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'Pattern_ownership_ground'
      Size = 255
      Lookup = True
    end
    object AriaLand_Function_estimation: TStringField
      FieldKind = fkLookup
      FieldName = '_Function_estimation'
      LookupDataSet = Function_estimation
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'Function_estimation'
      Size = 255
      Lookup = True
    end
    object AriaLand_Relief_ground: TStringField
      FieldKind = fkLookup
      FieldName = '_Relief_ground'
      LookupDataSet = Relief_ground
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'Relief_ground'
      Size = 255
      Lookup = True
    end
    object AriaLand_Form_ground: TStringField
      FieldKind = fkLookup
      FieldName = '_Form_ground'
      LookupDataSet = Form_ground
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'Form_ground'
      Size = 255
      Lookup = True
    end
    object AriaLand_Doc_zem: TStringField
      FieldKind = fkLookup
      FieldName = '_Doc_zem'
      LookupDataSet = Doc_zem
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'Doc_zem'
      Size = 255
      Lookup = True
    end
    object AriaLand_Purpose_estimation: TStringField
      FieldKind = fkLookup
      FieldName = '_Purpose_estimation'
      LookupDataSet = Purpose_estimation
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'Purpose_estimation'
      Size = 255
      Lookup = True
    end
    object AriaLand_Fukt_ispol: TStringField
      FieldKind = fkLookup
      FieldName = '_Fukt_ispol'
      LookupDataSet = Fukt_ispol
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'Fukt_ispol'
      Size = 255
      Lookup = True
    end
    object AriaLand_CelevoeIspozovanie: TStringField
      FieldKind = fkLookup
      FieldName = '_CelevoeIspozovanie'
      LookupDataSet = CelevoeIspozovanie
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'CelevoeIspozovanie'
      Size = 255
      Lookup = True
    end
    object AriaLandMaintenance_water: TWideStringField
      FieldName = 'Maintenance_water'
      Size = 255
    end
    object AriaLandMaintenance_hot_water: TWideStringField
      FieldName = 'Maintenance_hot_water'
      Size = 255
    end
    object AriaLandMaintenance_water_drain: TWideStringField
      FieldName = 'Maintenance_water_drain'
      Size = 255
    end
    object AriaLandMaintenance_electricityn: TWideStringField
      FieldName = 'Maintenance_electricityn'
      Size = 255
    end
    object AriaLandMaintenance_gas: TWideStringField
      FieldName = 'Maintenance_gas'
      Size = 255
    end
    object AriaLandMaintenance_telefon: TWideStringField
      FieldName = 'Maintenance_telefon'
      Size = 255
    end
    object AriaLandHeating: TWideStringField
      FieldName = 'Heating'
      Size = 255
    end
    object AriaLandBog: TWideStringField
      FieldName = 'Bog'
      Size = 255
    end
    object AriaLand_rayon: TStringField
      FieldKind = fkLookup
      FieldName = '_rayon'
      LookupDataSet = nas_punkt
      LookupKeyFields = 'key_'
      LookupResultField = '_rayon'
      KeyFields = 'Selo'
      ReadOnly = True
      Size = 255
      Lookup = True
    end
    object AriaLand_region: TStringField
      FieldKind = fkLookup
      FieldName = '_region'
      LookupDataSet = nas_punkt
      LookupKeyFields = 'key_'
      LookupResultField = '_region'
      KeyFields = 'Selo'
      ReadOnly = True
      Lookup = True
    end
    object AriaLand_selsovet: TStringField
      FieldKind = fkLookup
      FieldName = '_selsovet'
      LookupDataSet = nas_punkt
      LookupKeyFields = 'key_'
      LookupResultField = '_selsovet'
      KeyFields = 'Selo'
      ReadOnly = True
      Size = 255
      Lookup = True
    end
    object AriaLand_selo: TStringField
      FieldKind = fkLookup
      FieldName = '_selo'
      LookupDataSet = nas_punkt
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'Selo'
      Size = 255
      Lookup = True
    end
    object AriaLand_population: TIntegerField
      FieldKind = fkLookup
      FieldName = '_population'
      LookupDataSet = nas_punkt
      LookupKeyFields = 'key_'
      LookupResultField = 'population'
      KeyFields = 'Selo'
      ReadOnly = True
      Lookup = True
    end
    object AriaLand_AreaNaselenogoPuncta: TFloatField
      FieldKind = fkLookup
      FieldName = '_AreaNaselenogoPuncta'
      LookupDataSet = nas_punkt
      LookupKeyFields = 'key_'
      LookupResultField = 'area'
      KeyFields = 'selo'
      ReadOnly = True
      Lookup = True
    end
  end
  object Function_estimation: TADOQuery
    Connection = baza
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from Function_estimation')
    Left = 224
    Top = 16
    object Function_estimationkey_: TAutoIncField
      FieldName = 'key_'
      ReadOnly = True
      Visible = False
    end
    object Function_estimationdescr: TWideStringField
      FieldName = 'descr'
      Size = 255
    end
  end
  object Analog: TADOQuery
    Connection = baza
    CursorLocation = clUseServer
    BeforePost = AnalogBeforePost
    Parameters = <>
    SQL.Strings = (
      'select * from AriaLand'
      'where analog=true')
    Left = 112
    Top = 64
    object AnalogID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object AnalogName_client_IP: TWideStringField
      FieldName = 'Name_client_IP'
      Visible = False
      Size = 255
    end
    object AnalogName_client_RP: TWideStringField
      FieldName = 'Name_client_RP'
      Visible = False
      Size = 255
    end
    object AnalogAdress_ground: TWideStringField
      FieldName = 'Adress_ground'
      Size = 255
    end
    object AnalogPattern_ownership_ground: TIntegerField
      FieldName = 'Pattern_ownership_ground'
      Visible = False
    end
    object AnalogArea_ground: TFloatField
      FieldName = 'Area_ground'
    end
    object AnalogPurpose_estimation: TIntegerField
      FieldName = 'Purpose_estimation'
      Visible = False
    end
    object AnalogFunction_estimation: TIntegerField
      FieldName = 'Function_estimation'
      Visible = False
    end
    object AnalogDate_report: TDateTimeField
      FieldName = 'Date_report'
      Visible = False
    end
    object AnalogDate_estimation: TDateTimeField
      FieldName = 'Date_estimation'
      Visible = False
    end
    object AnalogEstimated_cost_ground: TFloatField
      FieldName = 'Estimated_cost_ground'
    end
    object AnalogEstimated_cost_meter: TFloatField
      FieldName = 'Estimated_cost_meter'
    end
    object AnalogNumber_contract: TWideStringField
      FieldName = 'Number_contract'
      Size = 10
    end
    object AnalogDate_contract: TDateTimeField
      FieldName = 'Date_contract'
    end
    object AnalogDate_Decision_prop_right: TDateTimeField
      FieldName = 'Date_Decision_prop_right'
    end
    object AnalogNumbe_Decision_prop_right: TWideStringField
      FieldName = 'Numbe_Decision_prop_right'
      Size = 10
    end
    object AnalogDistance_centre: TFloatField
      FieldName = 'Distance_centre'
    end
    object AnalogDistance_bus_stationn: TFloatField
      FieldName = 'Distance_bus_stationn'
    end
    object AnalogDistance_railway_station: TFloatField
      FieldName = 'Distance_railway_station'
    end
    object AnalogDistance_river_port: TFloatField
      FieldName = 'Distance_river_port'
    end
    object AnalogRelief_ground: TIntegerField
      FieldName = 'Relief_ground'
      Visible = False
    end
    object AnalogDescription_buildings: TMemoField
      FieldName = 'Description_buildings'
      Visible = False
      BlobType = ftMemo
    end
    object AnalogArea_buildings: TFloatField
      FieldName = 'Area_buildings'
    end
    object AnalogForm_ground: TIntegerField
      FieldName = 'Form_ground'
      Visible = False
    end
    object AnalogNormative_estimation: TFloatField
      FieldName = 'Normative_estimation'
    end
    object AnalogSelo: TIntegerField
      FieldName = 'Selo'
      Visible = False
    end
    object AnalogSelo_Arrangement: TMemoField
      FieldName = 'Selo_Arrangement'
      Visible = False
      BlobType = ftMemo
    end
    object AnalogDoc_zem: TIntegerField
      FieldName = 'Doc_zem'
      Visible = False
    end
    object AnalogData_doc_zem: TDateTimeField
      FieldName = 'Data_doc_zem'
    end
    object AnalogNum_doc_zem: TWideStringField
      FieldName = 'Num_doc_zem'
      Size = 10
    end
    object AnalogFukt_ispol: TIntegerField
      FieldName = 'Fukt_ispol'
      Visible = False
    end
    object AnalogPrice_propisom: TWideStringField
      FieldName = 'Price_propisom'
      Size = 255
    end
    object AnalogCelevoeIspozovanie: TIntegerField
      FieldName = 'CelevoeIspozovanie'
      Visible = False
    end
    object AnalogDate_Transaction: TDateTimeField
      FieldName = 'Date_Transaction'
    end
    object Analoganalog: TBooleanField
      FieldName = 'analog'
      Visible = False
    end
    object Analog_Pattern_ownership_ground: TStringField
      FieldKind = fkLookup
      FieldName = '_Pattern_ownership_ground'
      LookupDataSet = Pattern_ownership_ground
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'Pattern_ownership_ground'
      Size = 255
      Lookup = True
    end
    object Analog_Function_estimation: TStringField
      FieldKind = fkLookup
      FieldName = '_Function_estimation'
      LookupDataSet = Function_estimation
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'Function_estimation'
      Size = 255
      Lookup = True
    end
    object Analog_Relief_ground: TStringField
      FieldKind = fkLookup
      FieldName = '_Relief_ground'
      LookupDataSet = Relief_ground
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'Relief_ground'
      Size = 255
      Lookup = True
    end
    object Analog_Form_ground: TStringField
      FieldKind = fkLookup
      FieldName = '_Form_ground'
      LookupDataSet = Form_ground
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'Form_ground'
      Size = 255
      Lookup = True
    end
    object Analog_Doc_zem: TStringField
      FieldKind = fkLookup
      FieldName = '_Doc_zem'
      LookupDataSet = Doc_zem
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'Doc_zem'
      Size = 255
      Lookup = True
    end
    object Analog_Purpose_estimation: TStringField
      FieldKind = fkLookup
      FieldName = '_Purpose_estimation'
      LookupDataSet = Purpose_estimation
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'Purpose_estimation'
      Size = 255
      Lookup = True
    end
    object Analog_Fukt_ispol: TStringField
      FieldKind = fkLookup
      FieldName = '_Fukt_ispol'
      LookupDataSet = Fukt_ispol
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'Fukt_ispol'
      Size = 255
      Lookup = True
    end
    object Analog_CelevoeIspozovanie: TStringField
      FieldKind = fkLookup
      FieldName = '_CelevoeIspozovanie'
      LookupDataSet = CelevoeIspozovanie
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'CelevoeIspozovanie'
      Size = 255
      Lookup = True
    end
    object AnalogMaintenance_water: TWideStringField
      FieldName = 'Maintenance_water'
      Size = 255
    end
    object AnalogMaintenance_hot_water: TWideStringField
      FieldName = 'Maintenance_hot_water'
      Size = 255
    end
    object AnalogMaintenance_water_drain: TWideStringField
      FieldName = 'Maintenance_water_drain'
      Size = 255
    end
    object AnalogMaintenance_electricityn: TWideStringField
      FieldName = 'Maintenance_electricityn'
      Size = 255
    end
    object AnalogMaintenance_gas: TWideStringField
      FieldName = 'Maintenance_gas'
      Size = 255
    end
    object AnalogMaintenance_telefon: TWideStringField
      FieldName = 'Maintenance_telefon'
      Size = 255
    end
    object AnalogHeating: TWideStringField
      FieldName = 'Heating'
      Size = 255
    end
    object AnalogBog: TWideStringField
      FieldName = 'Bog'
      Size = 255
    end
    object Analog_rayon: TStringField
      FieldKind = fkLookup
      FieldName = '_rayon'
      LookupDataSet = nas_punkt
      LookupKeyFields = 'key_'
      LookupResultField = '_rayon'
      KeyFields = 'Selo'
      ReadOnly = True
      Size = 255
      Lookup = True
    end
    object Analog_region: TStringField
      FieldKind = fkLookup
      FieldName = '_region'
      LookupDataSet = nas_punkt
      LookupKeyFields = 'key_'
      LookupResultField = '_region'
      KeyFields = 'Selo'
      ReadOnly = True
      Size = 255
      Lookup = True
    end
    object Analog_selsovet: TStringField
      FieldKind = fkLookup
      FieldName = '_selsovet'
      LookupDataSet = nas_punkt
      LookupKeyFields = 'key_'
      LookupResultField = '_selsovet'
      KeyFields = 'Selo'
      ReadOnly = True
      Size = 255
      Lookup = True
    end
    object Analog_selo: TStringField
      FieldKind = fkLookup
      FieldName = '_selo'
      LookupDataSet = nas_punkt
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'Selo'
      Size = 255
      Lookup = True
    end
  end
  object Relief_ground: TADOQuery
    Connection = baza
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from Relief_ground')
    Left = 312
    Top = 16
    object Relief_groundkey_: TAutoIncField
      FieldName = 'key_'
      ReadOnly = True
      Visible = False
    end
    object Relief_grounddescr: TWideStringField
      FieldName = 'descr'
      Size = 255
    end
  end
  object Form_ground: TADOQuery
    Connection = baza
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from Form_ground')
    Left = 400
    Top = 16
    object Form_groundkey_: TAutoIncField
      FieldName = 'key_'
      ReadOnly = True
      Visible = False
    end
    object Form_grounddescr: TWideStringField
      FieldName = 'descr'
      Size = 255
    end
  end
  object Doc_zem: TADOQuery
    Connection = baza
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from Doc_zem')
    Left = 224
    Top = 64
    object Doc_zemkey_: TAutoIncField
      FieldName = 'key_'
      ReadOnly = True
      Visible = False
    end
    object Doc_zemdescr: TWideStringField
      FieldName = 'descr'
      Size = 255
    end
  end
  object Pattern_ownership_ground: TADOQuery
    Connection = baza
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from Pattern_ownership_ground')
    Left = 112
    Top = 120
    object Pattern_ownership_groundkey_: TAutoIncField
      FieldName = 'key_'
      ReadOnly = True
      Visible = False
    end
    object Pattern_ownership_grounddescr: TWideStringField
      FieldName = 'descr'
      Size = 255
    end
  end
  object Purpose_estimation: TADOQuery
    Connection = baza
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from Purpose_estimation')
    Left = 224
    Top = 120
    object Purpose_estimationkey_: TAutoIncField
      FieldName = 'key_'
      ReadOnly = True
      Visible = False
    end
    object Purpose_estimationdescr: TWideStringField
      FieldName = 'descr'
      Size = 255
    end
  end
  object dollar_rate: TADOQuery
    Connection = baza
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from dollar_rate ')
    Left = 312
    Top = 120
    object dollar_ratekey_: TAutoIncField
      FieldName = 'key_'
      ReadOnly = True
      Visible = False
    end
    object dollar_ratedate: TDateTimeField
      FieldName = 'date'
    end
    object dollar_ratekoef: TFloatField
      FieldName = 'koef'
    end
  end
  object inflation_index: TADOQuery
    Connection = baza
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from inflation_index')
    Left = 400
    Top = 64
    object inflation_indexkey_: TAutoIncField
      FieldName = 'key_'
      ReadOnly = True
      Visible = False
    end
    object inflation_indexyear: TIntegerField
      FieldName = 'year'
    end
    object inflation_indexmonth: TIntegerField
      FieldName = 'month'
    end
    object inflation_indexkoef: TFloatField
      FieldName = 'koef'
    end
  end
  object Fukt_ispol: TADOQuery
    Connection = baza
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from Fukt_ispol')
    Left = 400
    Top = 120
    object Fukt_ispolkey_: TAutoIncField
      FieldName = 'key_'
      ReadOnly = True
      Visible = False
    end
    object Fukt_ispoldescr: TWideStringField
      FieldName = 'descr'
      Size = 255
    end
    object Fukt_ispolkoef: TFloatField
      FieldName = 'koef'
    end
  end
  object CelevoeIspozovanie: TADOQuery
    Connection = baza
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from CelevoeIspozovanie')
    Left = 112
    Top = 176
    object CelevoeIspozovaniekey_: TAutoIncField
      FieldName = 'key_'
      ReadOnly = True
      Visible = False
    end
    object CelevoeIspozovaniedescr: TWideStringField
      FieldName = 'descr'
      Size = 255
    end
    object CelevoeIspozovaniekoef: TFloatField
      FieldName = 'koef'
    end
  end
  object region: TADOQuery
    Connection = baza
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from region')
    Left = 224
    Top = 176
    object regionkey_: TAutoIncField
      FieldName = 'key_'
      ReadOnly = True
      Visible = False
    end
    object regiondescr: TWideStringField
      FieldName = 'descr'
      Size = 255
    end
  end
  object selsovet: TADOQuery
    Connection = baza
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from selsovet')
    Left = 400
    Top = 176
    object selsovetkey_: TAutoIncField
      FieldName = 'key_'
      ReadOnly = True
      Visible = False
    end
    object selsovetdescr: TWideStringField
      FieldName = 'descr'
      Size = 255
    end
  end
  object rayon: TADOQuery
    Connection = baza
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from rayon')
    Left = 112
    Top = 232
    object rayonkey_: TAutoIncField
      FieldName = 'key_'
      ReadOnly = True
      Visible = False
    end
    object rayondescr: TWideStringField
      FieldName = 'descr'
      Size = 255
    end
    object rayonregion: TIntegerField
      FieldName = 'region'
      Visible = False
    end
    object rayon_region: TStringField
      FieldKind = fkLookup
      FieldName = '_region'
      LookupDataSet = region
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'region'
      Size = 255
      Lookup = True
    end
  end
  object nas_punkt: TADOQuery
    Connection = baza
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from nas_punkt')
    Left = 312
    Top = 176
    object nas_punktkey_: TAutoIncField
      FieldName = 'key_'
      ReadOnly = True
      Visible = False
    end
    object nas_punktregion: TIntegerField
      FieldName = 'region'
      Visible = False
    end
    object nas_punktrayon: TIntegerField
      FieldName = 'rayon'
      Visible = False
    end
    object nas_punktselsovet: TIntegerField
      FieldName = 'selsovet'
      Visible = False
    end
    object nas_punktdescr: TWideStringField
      FieldName = 'descr'
      Size = 255
    end
    object nas_punktarea: TIntegerField
      FieldName = 'area'
    end
    object nas_punktpopulation: TIntegerField
      FieldName = 'population'
    end
    object nas_punkt_region: TStringField
      FieldKind = fkLookup
      FieldName = '_region'
      LookupDataSet = region
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'region'
      Size = 255
      Lookup = True
    end
    object nas_punkt_rayon: TStringField
      FieldKind = fkLookup
      FieldName = '_rayon'
      LookupDataSet = rayon
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'rayon'
      Size = 255
      Lookup = True
    end
    object nas_punkt_selsovet: TStringField
      FieldKind = fkLookup
      FieldName = '_selsovet'
      LookupDataSet = selsovet
      LookupKeyFields = 'key_'
      LookupResultField = 'descr'
      KeyFields = 'selsovet'
      Size = 255
      Lookup = True
    end
  end
  object DataSource_region: TDataSource
    DataSet = region
    Left = 212
    Top = 276
  end
  object DataSource_rayon: TDataSource
    DataSet = rayon
    Left = 240
    Top = 276
  end
  object DataSource_selsovet: TDataSource
    DataSet = selsovet
    Left = 296
    Top = 276
  end
  object DataSource_nas_punkt: TDataSource
    DataSet = nas_punkt
    Left = 268
    Top = 276
  end
end
