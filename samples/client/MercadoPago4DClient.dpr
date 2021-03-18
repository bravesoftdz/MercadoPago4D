program MercadoPago4DClient;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  MercadoPago4Delphi in 'MercadoPago4Delphi.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
