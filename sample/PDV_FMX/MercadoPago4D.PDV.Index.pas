unit MercadoPago4D.PDV.Index;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, MercadoPago4Delphi;

type
  TForm2 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  _MercadoPago4D
    .Menager
      .Resources
        .Accreditation
          .CreateStore
            .Name('Loja Delphi')
              .Business_Hours
                .Monday
                  .Open('08:00')
                  .Close('11:00')
                .&End
                .Monday
                  .Open('13:00')
                  .Close('21:00')
                .&End
                .Tuesday
                  .Open('11:00')
                  .Close('21:00')
                .&End
                .Wednesday
                  .Open('11:00')
                  .Close('21:00')
                .&End
                .Thursday
                  .Open('11:00')
                  .Close('21:00')
                .&End
                .Friday
                  .Open('11:00')
                  .Close('21:00')
                .&End
                .Saturday
                  .Open('11:00')
                  .Close('21:00')
                .&End
                .Sunday
                  .Open('11:00')
                  .Close('21:00')
                .&End
              .&End
              .Location
                .Zip_Code('06233-903')
                .Street_Number('3003')
                .Street_Name('Av. das Nações Unidas')
                .City_Name('Osasco')
                .State_Name('São Paulo')
                .Latitude(-23.5254383)
                .Longitude(-46.7620313)
                .Reference('Melicidade')
              .&End
            .External_Id('lojadelphi')
          .&End;
end;

end.
