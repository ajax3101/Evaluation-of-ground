object Form_browse: TForm_browse
  Left = 224
  Top = 186
  Width = 584
  Height = 370
  Caption = 'Form_browse'
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 320
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 576
    Height = 324
    Align = alClient
    ColumnDefValues.Title.TitleButton = True
    DataSource = DataSource1
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 324
    Width = 576
    Height = 19
    Panels = <
      item
        Width = 50
      end>
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
  object DataSource1: TDataSource
    Left = 188
    Top = 148
  end
  object PopupMenu1: TPopupMenu
    Images = Main_form.ImageList1
    Left = 50
    Top = 248
    object N1: TMenuItem
      Action = Main_form.append_rec
    end
    object N2: TMenuItem
      Action = Main_form.Edit_action
    end
    object N3: TMenuItem
      Action = Main_form.delete_rec
    end
  end
end
