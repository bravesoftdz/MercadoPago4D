unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus;

type
  TForm3 = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Image1: TImage;
    MainMenu1: TMainMenu;
    Credenciamento1: TMenuItem;
    CriarStore1: TMenuItem;
    BuscarStores1: TMenuItem;
    GerarQRCode1: TMenuItem;
    ApagarStore1: TMenuItem;
    ApagarStore2: TMenuItem;
    BuscarQRsgeral1: TMenuItem;
    BuscarQRporExternalID1: TMenuItem;
    ApagarQRCOde1: TMenuItem;
    ImprimirQRmanualmente1: TMenuItem;
    OAuthAutorizaoMPConnectMarketplace1: TMenuItem;
    OauthRenovaoMPConnectMarketplace1: TMenuItem;
    ransacional1: TMenuItem;
    CarregarPedidonoQR1: TMenuItem;
    ConsultardisponibilidadenoQR1: TMenuItem;
    ApagarPedidonoQR1: TMenuItem;
    ConsultarPedido1: TMenuItem;
    ProcurarPedido1: TMenuItem;
    PsVenda1: TMenuItem;
    ConsultarPagamento1: TMenuItem;
    ProcurarPagamento1: TMenuItem;
    DevoluoEstornodePagamento1: TMenuItem;
    DevoluoEstornoParcialdePagamento1: TMenuItem;
    Gerarusurioteste1: TMenuItem;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses MercadoPago4Delphi;

procedure TForm3.Button1Click(Sender: TObject);
begin
  _MercadoPago4D
    .Manager
      .Resources
      .Store
      .CreateStore(
        _MercadoPago4D.Manager
          .Builder
            .BuilderStores
              .Name('Alessandro')
              .External_Id('123')
              .Location
                .City_Name('teste')
                .Latitude(123123)
              .&End
            .&End
        );
end;

end.
