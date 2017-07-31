object Form_analize: TForm_analize
  Left = 206
  Top = 99
  Width = 684
  Height = 502
  Caption = #1040#1085#1072#1083#1080#1079
  Color = clBtnFace
  Constraints.MinHeight = 502
  Constraints.MinWidth = 684
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 676
    Height = 41
    Align = alTop
    Caption = #1055#1086#1087#1088#1072#1074#1082#1072
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 74
      Height = 13
      Caption = #1052#1080#1085'. '#1079#1085#1072#1095#1077#1085#1080#1077
    end
    object Label3: TLabel
      Left = 152
      Top = 16
      Width = 80
      Height = 13
      Caption = #1052#1072#1082#1089'. '#1079#1085#1072#1095#1077#1085#1080#1077
    end
    object DBEditEh1: TDBEditEh
      Left = 88
      Top = 12
      Width = 57
      Height = 21
      DataField = 'min_koef'
      DataSource = DataSource1
      EditButtons = <>
      Enabled = False
      TabOrder = 0
      Visible = True
    end
    object DBEditEh2: TDBEditEh
      Left = 236
      Top = 12
      Width = 57
      Height = 21
      DataField = 'max_koef'
      DataSource = DataSource1
      EditButtons = <>
      Enabled = False
      TabOrder = 1
      Visible = True
    end
    object DBCheckBoxEh1: TDBCheckBoxEh
      Left = 300
      Top = 16
      Width = 81
      Height = 17
      Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1100
      DataField = 'deactivate'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 2
      TabStop = True
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 676
    Height = 434
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    AutoFitColWidths = True
    DataSource = DataSource1
    EditActions = [geaCopyEh, geaSelectAllEh]
    FixedColor = clWindow
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    RowHeight = 2
    RowLines = 2
    RowSizingAllowed = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
  end
  object Button2: TButton
    Left = 400
    Top = 12
    Width = 119
    Height = 25
    Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1074#1089#1105
    TabOrder = 1
    OnClick = Button2Click
  end
  object okBUTON: TButton
    Left = 524
    Top = 12
    Width = 129
    Height = 25
    Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1086#1090#1095#1077#1090
    ModalResult = 1
    TabOrder = 2
  end
  object DataSource1: TDataSource
    DataSet = JvMemoryData1
    Left = 364
    Top = 360
  end
  object JvMemoryData1: TJvMemoryData
    FieldDefs = <>
    AfterScroll = JvMemoryData1AfterScroll
    Left = 316
    Top = 360
  end
  object ADOQuery1: TADOQuery
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'id'
        Attributes = [paNullable]
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'selo'
        Attributes = [paNullable]
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'selo1'
        Attributes = [paNullable]
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'rayon'
        Attributes = [paNullable]
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'select 0 as poriadok,'
      'ccur(0) as cena,'
      'ccur(0) as cena_kv_m,'
      'Date_estimation as data_prodaji, '
      '1 as  inflation_index,'
      
        '(select koef from dollar_rate where [date]=Date_estimation) as d' +
        'ollar_rate,'
      'Area_ground,'
      
        '(select descr from nas_punkt where key_=selo)+'#39', '#39'+Adress_ground' +
        ' as mesto_raspoloj,'
      
        '(select descr from Fukt_ispol where AriaLand.Fukt_ispol=key_) as' +
        '  Fukt_ispol_descr,'
      
        '(select koef from Fukt_ispol where AriaLand.Fukt_ispol=key_) as ' +
        ' Fukt_ispol_koef,'
      
        '(select population from nas_punkt where key_=selo) as population' +
        ','
      
        '(select CDbl(CCur([population]/[area])) from nas_punkt where key' +
        '_=selo) as plotnost,'
      'Distance_centre,'
      'Distance_river_port,'
      'Distance_bus_stationn,'
      'Distance_railway_station,'
      'bog,'
      'Maintenance_electricityn,'
      'Maintenance_water,'
      'Maintenance_hot_water,'
      'Maintenance_gas,'
      'Maintenance_water_drain,'
      'Maintenance_telefon,'
      'Heating,'
      'Normative_estimation'
      'from AriaLand'
      'where id=:id'
      'union '
      'select 1 as poriadok,'
      'Estimated_cost_ground as cena,'
      'Estimated_cost_ground/Area_ground as cena_kv_m,'
      'Date_transaction as data_prodaji, '
      '1 as  inflation_index,'
      
        '(select koef from dollar_rate where [date]=Date_transaction) as ' +
        'dollar_rate,'
      'Area_ground,'
      
        '(select descr from nas_punkt where key_=selo)+'#39', '#39'+Adress_ground' +
        ' as mesto_raspoloj,'
      
        '(select descr from Fukt_ispol where AriaLand.Fukt_ispol=key_) as' +
        '  Fukt_ispol_descr,'
      
        '(select koef from Fukt_ispol where AriaLand.Fukt_ispol=key_) as ' +
        ' Fukt_ispol_koef,'
      
        '(select population from nas_punkt where key_=selo) as population' +
        ','
      
        '(select CDbl(CCur([population]/[area])) from nas_punkt where key' +
        '_=selo) as plotnost,'
      'Distance_centre,'
      'Distance_river_port,'
      'Distance_bus_stationn,'
      'Distance_railway_station,'
      'bog,'
      'Maintenance_electricityn,'
      'Maintenance_water,'
      'Maintenance_hot_water,'
      'Maintenance_gas,'
      'Maintenance_water_drain,'
      'Maintenance_telefon,'
      'Heating,'
      'Normative_estimation'
      'from AriaLand'
      'where selo=:selo and analog=true'
      'union'
      'select 2 as poriadok,'
      'Estimated_cost_ground as cena,'
      'Estimated_cost_ground/Area_ground as cena_kv_m,'
      'Date_transaction as data_prodaji, '
      '1 as  inflation_index,'
      
        '(select koef from dollar_rate where [date]=Date_transaction) as ' +
        'dollar_rate,'
      'Area_ground,'
      
        '(select descr from nas_punkt where key_=selo)+'#39', '#39'+Adress_ground' +
        ' as mesto_raspoloj,'
      
        '(select descr from Fukt_ispol where AriaLand.Fukt_ispol=key_) as' +
        '  Fukt_ispol_descr,'
      
        '(select koef from Fukt_ispol where AriaLand.Fukt_ispol=key_) as ' +
        ' Fukt_ispol_koef,'
      
        '(select population from nas_punkt where key_=selo) as population' +
        ','
      
        '(select CDbl(CCur([population]/[area])) from nas_punkt where key' +
        '_=selo) as plotnost,'
      'Distance_centre,'
      'Distance_river_port,'
      'Distance_bus_stationn,'
      'Distance_railway_station,'
      'bog,'
      'Maintenance_electricityn,'
      'Maintenance_water,'
      'Maintenance_hot_water,'
      'Maintenance_gas,'
      'Maintenance_water_drain,'
      'Maintenance_telefon,'
      'Heating,'
      'Normative_estimation'
      'from AriaLand'
      
        'where selo<>:selo1 and selo in (select selo from nas_punkt where' +
        ' rayon=:rayon) and analog=true '
      'order by poriadok, cena_kv_m, Area_ground'
      ';')
    Left = 264
    Top = 360
  end
  object infindex: TADOQuery
    Parameters = <
      item
        Name = 'dateanalog'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'dateanalog'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'data'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'data'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select koef from inflation_index '
      
        'where dateserial([year],[month],1)>=dateserial(year(:dateanalog)' +
        ',month(:dateanalog),1) and '
      
        'dateserial([year],[month],1)<dateserial(year(:data),month(:data)' +
        ',1)')
    Left = 408
    Top = 360
  end
end
