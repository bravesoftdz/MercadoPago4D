program MercadoPago4DClient;

uses
  Vcl.Forms,
  Unit3 in 'Unit3.pas' {Form3},
  MercadoPago4Delphi in 'MercadoPago4Delphi.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
