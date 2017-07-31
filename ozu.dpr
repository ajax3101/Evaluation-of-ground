program ozu;

uses
  Forms,
  main in 'main.pas' {Main_form},
  frm_dic in 'frm_dic.pas' {Form_dictionary},
  frm_data in 'frm_data.pas' {Data: TDataModule},
  from_analog in 'from_analog.pas' {FormAnalog},
  from_arialand in 'from_arialand.pas' {FormAriaLand},
  browsilka in 'browsilka.pas' {Form_browse};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Учет земельных участков';
  Application.CreateForm(TMain_form, Main_form);
  Application.CreateForm(TData, Data);
  Application.Run;
end.
