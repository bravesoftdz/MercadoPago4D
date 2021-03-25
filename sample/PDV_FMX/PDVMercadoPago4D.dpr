program PDVMercadoPago4D;

uses
  Vcl.Forms,
  MercadoPago4D.PDV.Index in 'MercadoPago4D.PDV.Index.pas' {Form2},
  MercadoPago4Delphi in 'MercadoPago4Delphi.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
