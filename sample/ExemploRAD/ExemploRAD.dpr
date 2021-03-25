program ExemploRAD;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Pkg.Json.DTO in 'Pkg.Json.DTO.pas',
  Workshop032020.Entity.StoresDTO in 'Workshop032020.Entity.StoresDTO.pas',
  Workshop032020.Entity.Interfaces in 'Workshop032020.Entity.Interfaces.pas',
  Workshop032020.Entity.Location in 'Workshop032020.Entity.Location.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
