unit AddAnalog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TMain = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

uses Analog;

{$R *.DFM}

procedure TMain.Button1Click(Sender: TObject);
begin
   Main.Visible:=False;
   Analogs.Visible:=True;
end;

end.

