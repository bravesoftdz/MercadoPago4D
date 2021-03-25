program MP4DPDV;

uses
  Vcl.Forms,
  MP4D.PDV.Index in 'MP4D.PDV.Index.pas' {Form2},
  MP4D in 'MP4D.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
