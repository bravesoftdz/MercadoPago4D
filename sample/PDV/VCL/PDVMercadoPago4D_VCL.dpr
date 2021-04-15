program PDVMercadoPago4D_VCL;

uses
  Vcl.Forms,
  Unit3 in 'Unit3.pas' {Form3},
  MercadoPago4Delphi in 'MercadoPago4Delphi.pas',
  Componente.Lista.Itens in 'Componente.Lista.Itens.pas' {CtrlListaVenda: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
