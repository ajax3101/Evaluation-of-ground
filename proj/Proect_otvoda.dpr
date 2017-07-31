program Proect_otvoda;

uses
  Forms,
  Unit1 in 'Unit1.pas' {MainForm},
  Analise in 'Analise.pas' {FormAnalise},
  Mathbox in 'Mathbox.pas',
  MayBox in 'Maybox.pas',
  StrBox in 'Strbox.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFormAnalise, FormAnalise);
  Application.Run;
end.
