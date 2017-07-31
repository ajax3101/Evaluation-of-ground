object Form_dictionary: TForm_dictionary
  Left = 210
  Top = 161
  Width = 647
  Height = 467
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TabControl1: TTabControl
    Left = 0
    Top = 0
    Width = 639
    Height = 440
    Align = alClient
    MultiLine = True
    TabOrder = 0
    Tabs.Strings = (
      #1050#1091#1088#1089' '#1076#1086#1083#1083#1072#1088#1072
      #1048#1085#1076#1077#1082#1089' '#1080#1085#1092#1083#1103#1094#1080#1080
      #1056#1072#1081#1086#1085
      #1054#1073#1083#1072#1089#1090#1100
      #1054#1088#1075#1072#1085' '#1089#1072#1084#1086#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103
      #1062#1077#1083#1077#1074#1086#1077' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077
      #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072' '#1079#1077#1084#1083#1102
      #1060#1086#1088#1084#1072' '#1091#1095#1072#1089#1090#1082#1072
      #1060#1072#1082#1090#1080#1095#1077#1089#1082#1086#1077' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077
      #1092#1091#1085#1082#1094#1080#1103' '#1086#1094#1077#1085#1082#1080
      #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
      #1060#1086#1088#1084#1072' '#1089#1086#1073#1089#1090#1074#1077#1085#1086#1089#1090#1080
      #1062#1077#1083#1100' '#1086#1094#1077#1085#1082#1080
      #1056#1077#1083#1100#1077#1092' '#1091#1095#1072#1089#1090#1082#1072)
    TabIndex = 0
    OnChange = TabControl1Change
    object DBGridEh1: TDBGridEh
      Left = 4
      Top = 60
      Width = 631
      Height = 357
      Align = alClient
      AutoFitColWidths = True
      ColumnDefValues.Title.TitleButton = True
      DataSource = Data_dic
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDblClickOptimizeColWidth]
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
    end
    object Memo1: TMemo
      Left = 360
      Top = 396
      Width = 273
      Height = 17
      Lines.Strings = (
        'dollar_rate'
        'inflation_index'
        'rayon'
        'region'
        'selsovet'
        'CelevoeIspozovanie'
        'Doc_zem'
        'Form_ground'
        'Fukt_ispol'
        'Function_estimation'
        'nas_punkt'
        'Pattern_ownership_ground'
        'Purpose_estimation'
        'Relief_ground')
      TabOrder = 1
      Visible = False
    end
    object StatusBar1: TStatusBar
      Left = 4
      Top = 417
      Width = 631
      Height = 19
      Panels = <
        item
          Width = 50
        end>
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 28
    Top = 192
    object appendrec1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 2
      OnClick = appendrec1Click
    end
    object deleterec1: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnClick = deleterec1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
  end
  object Data_dic: TDataSource
    DataSet = Data.dollar_rate
    Left = 28
    Top = 140
  end
  object DBSumList1: TDBSumList
    ExternalRecalc = False
    SumCollection = <
      item
        GroupOperation = goCount
      end>
    VirtualRecords = False
    SumListChanged = DBSumList1SumListChanged
    Left = 192
    Top = 224
  end
end
