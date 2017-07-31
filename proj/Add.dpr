program Add;

uses
  Forms,
  AddAnalog in 'AddAnalog.pas' {Main},
  Analog in 'Analog.pas' {Analogs};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TAnalogs, Analogs);
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
