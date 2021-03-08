unit Unit1;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  RESTRequest4D,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  pngimage, Vcl.Menus, Workshop032020.Entity.StoresDTO, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    Memo2: TMemo;
    Edit1: TEdit;
    Image1: TImage;
    MainMenu1: TMainMenu;
    Credenciamento1: TMenuItem;
    CriarStore1: TMenuItem;
    AtualizarStore1: TMenuItem;
    BuscarStores1: TMenuItem;
    ApagarStore1: TMenuItem;
    ApagarStore2: TMenuItem;
    ApagarStore3: TMenuItem;
    BuscarQRgeral1: TMenuItem;
    BuscarQRporExternalID1: TMenuItem;
    ApagarQRCode1: TMenuItem;
    ImprimirQRManualmente1: TMenuItem;
    ImprimirQRManualmente2: TMenuItem;
    OAuthRenovaoMPConnectMarketplace1: TMenuItem;
    ransacional1: TMenuItem;
    CarregarPedidonoQR1: TMenuItem;
    ConsultardisponibilidadedoQR1: TMenuItem;
    ApagarPedidonoQR1: TMenuItem;
    ConsultaPedidomerchantorder1: TMenuItem;
    ProcurarPedidomerchantorder1: TMenuItem;
    PsVenda1: TMenuItem;
    ConsultarPagamento1: TMenuItem;
    ProcurarPagamento1: TMenuItem;
    DevoluoEstornodePagamento1: TMenuItem;
    DevoluoEstornoParcialdePagamento1: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure CriarStore1Click(Sender: TObject);
    procedure AtualizarStore1Click(Sender: TObject);
    procedure BuscarStores1Click(Sender: TObject);
    procedure ApagarStore1Click(Sender: TObject);
    procedure ApagarStore2Click(Sender: TObject);
    procedure ApagarStore3Click(Sender: TObject);
    procedure BuscarQRgeral1Click(Sender: TObject);
    procedure BuscarQRporExternalID1Click(Sender: TObject);
    procedure ApagarQRCode1Click(Sender: TObject);
    procedure ImprimirQRManualmente1Click(Sender: TObject);
    procedure CarregarPedidonoQR1Click(Sender: TObject);
    procedure ConsultardisponibilidadedoQR1Click(Sender: TObject);
    procedure ApagarPedidonoQR1Click(Sender: TObject);
    procedure ConsultaPedidomerchantorder1Click(Sender: TObject);
    procedure ProcurarPedidomerchantorder1Click(Sender: TObject);
    procedure ConsultarPagamento1Click(Sender: TObject);
    procedure ProcurarPagamento1Click(Sender: TObject);
    procedure DevoluoEstornodePagamento1Click(Sender: TObject);
    procedure DevoluoEstornoParcialdePagamento1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    Json:String;
  public
    { Public declarations }
  end;

  iLocation<T> = interface;

  iStones = interface
    function Name(Value : String) : iStones;
    function External_Id(Value : String) : iStones;
    function Location : iLocation<iStones>;
    function Content : String;
  end;

  iLocation<T> = interface
    function City_Name(Value : string) : iLocation<T>;
    function Latitude(Value : Double) : iLocation<T>;
    function Longitude(Value : Double) :iLocation<T>;
    function Reference(Value : string) : iLocation<T>;
    function State_Name(Value : string) : iLocation<T>;
    function Street_Name(Value : string) : iLocation<T>;
    function Street_Number(Value : String) : iLocation<T>;
    function Zip_Code(Value : string) : iLocation<T>;
    function &End : T;
  end;


  TLocation<T : IInterface> = class(TInterfacedObject, iLocation<T>)
    private
      [weak]
      FParent : T;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iLocation<T>;
      function City_Name(Value : string) : iLocation<T>;
      function Latitude(Value : Double) : iLocation<T>;
      function Longitude(Value : Double) :iLocation<T>;
      function Reference(Value : string) : iLocation<T>;
      function State_Name(Value : string) : iLocation<T>;
      function Street_Name(Value : string) : iLocation<T>;
      function Street_Number(Value : String) : iLocation<T>;
      function Zip_Code(Value : string) : iLocation<T>;
      function &End : T;
  end;

  TStones = class(TInterfacedObject, iStones)
    private
      FLocation : iLocation<iStones>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iStones;
      function Name(Value : String) : iStones;
      function External_Id(Value : String) : iStones;
      function Location : iLocation<iStones>;
      function Content : String;
  end;

CONST
  CREDENCIAMENTO_URL = 'https://api.mercadopago.com/users/';
  TRANSACIONAL_URL = 'https://api.mercadopago.com/mpmobile/instore/qr/';
  MERCHANT_ORDERS = 'https://api.mercadopago.com/merchant_orders/';
  POS_VENDA_URL = 'https://api.mercadopago.com/v1/payments';
  COLLECTOR_ID = '713237572';
  ACCESS_TOKEN = 'APP_USR-4246549739045822-020920-f0456b2e076a37b0c83a793682b7887d-713237572';
  QRCODE_POS = 'https://api.mercadopago.com/pos';

var
  Form1: TForm1;
  JSONRoot : TRootDTO;

implementation

uses
  REST.Json, System.JSON;

{$R *.dfm}

procedure TForm1.ApagarPedidonoQR1Click(Sender: TObject);
begin
  Memo2.Lines.Text :=
  TRequest.New
    .BaseURL(TRANSACIONAL_URL+COLLECTOR_ID+'/'+Edit1.Text)
    .Accept('application/json')
    .Token('Bearer '+ACCESS_TOKEN)
    .Delete.Content;
end;

procedure TForm1.ApagarQRCode1Click(Sender: TObject);
begin
  Memo2.Lines.Text :=
  TRequest.New
    .BaseURL(QRCODE_POS+'/'+Edit1.Text)
    .Accept('application/json')
    .Token('Bearer '+ACCESS_TOKEN)
    .Get.Content;
end;

procedure TForm1.ApagarStore1Click(Sender: TObject);
begin
Memo2.Lines.Text :=
  TRequest.New
    .BaseURL(CREDENCIAMENTO_URL+COLLECTOR_ID+'/stores/'+Edit1.Text)
    .Accept('application/json')
    .Token('Bearer '+ACCESS_TOKEN)
    .Get.Content;
end;

procedure TForm1.ApagarStore2Click(Sender: TObject);
begin
  JSON := '';
  JSON :=
  '{'+
  '"name":"Caixa principal 01",'+
  '"fixed_amount": true,'+
  '"category": null,'+
  '"external_id": "caixa01",'+
  '"store_id": null,'+
  '"url": null'+
  '}';
 Memo2.Lines.Text :=
  TRequest.New
    .BaseURL(QRCODE_POS)
    .Accept('application/json')
    .Token('Bearer '+ACCESS_TOKEN)
    .AddBody(JSON)
    .Post.Content;
end;

procedure TForm1.ApagarStore3Click(Sender: TObject);
begin
  JSON := '';
  JSON :=
    '{'+
    '"name":"Nome novo",'+
    '"fixed_amount": true,'+
    '"category": null,'+
    '"store_id": null'+
    '}';
 Memo2.Lines.Text :=
  TRequest.New
    .BaseURL(QRCODE_POS+'/'+Edit1.Text)
    .Accept('application/json')
    .Token('Bearer '+ACCESS_TOKEN)
    .AddBody(JSON)
    .Post.Content;
end;

procedure TForm1.AtualizarStore1Click(Sender: TObject);
begin
  Json := '';
  Json :=
    '{'+
    '"name": "Teste nome novo",'+
    '"business_hours": {'+
    '"monday": ['+
    '{'+
    '"open": "08:00",'+
    '"close": "23:00"'+
    '}'+
    ']'+
    '},'+
    '"location": {'+
    '"zip_code": "06233-903",'+
    '"street_number": "6003",'+
    '"street_name": "Av. das Nações Unidas",'+
    '"city_name": "Osasco",'+
    '"state_name": "São Paulo",'+
    '"latitude": -23.5254003,'+
    '"longitude": -46.7620003,'+
    '"reference": "Outro lugar"'+
    '},'+
    '"external_id": "123"'+
    '}';

  Memo2.Lines.Text :=
  TRequest.New
    .BaseURL(CREDENCIAMENTO_URL+COLLECTOR_ID+'/stores/'+Edit1.Text)
    .Accept('application/json')
    .Token('Bearer '+ACCESS_TOKEN)
    .AddBody(Memo2.Text)
    .Put.Content;
end;

procedure TForm1.BuscarQRgeral1Click(Sender: TObject);
begin
  Memo2.Lines.Text :=
  TRequest.New
    .BaseURL(QRCODE_POS)
    .Accept('application/json')
    .Token('Bearer '+ACCESS_TOKEN)
    .Get.Content;
end;

procedure TForm1.BuscarQRporExternalID1Click(Sender: TObject);
begin
  Memo2.Lines.Text :=
  TRequest.New
    .BaseURL(QRCODE_POS)
    .Accept('application/json')
    .Token('Bearer '+ACCESS_TOKEN)
    .AddParam('external_id',Edit1.Text)
    .Get.Content;
end;

procedure TForm1.BuscarStores1Click(Sender: TObject);
begin
Memo2.Lines.Text :=
  TRequest.New
    .BaseURL(CREDENCIAMENTO_URL+COLLECTOR_ID+'/stores/search')
    .Accept('application/json')
    .Token('Bearer '+ACCESS_TOKEN)
    .Get.Content;
end;



procedure TForm1.Button1Click(Sender: TObject);
var
  a : TRootDTO;
  json : tjsonobject;
begin
Memo2.Clear;
  a := TRootDTO.Create;
  a.Name := 'Loja Delphi';
    a.Business_Hours.Monday.Add(TMondayDTO.Create);
    a.Business_Hours.Monday[0].Close := '11:00';
    a.Business_Hours.Monday[0].Open := '08:00';

    a.Business_Hours.Monday.Add(TMondayDTO.Create);
    a.Business_Hours.Monday[1].Close := '21:00';
    a.Business_Hours.Monday[1].Open := '13:00';

    a.Business_Hours.Tuesday.Add(TTuesdayDTO.Create);
    a.Business_Hours.Tuesday[0].Close := '21:00';
    a.Business_Hours.Tuesday[0].Open := '11:00';

    a.Business_Hours.Wednesday.Add(TWednesdayDTO.Create);
    a.Business_Hours.Wednesday[0].Close := '21:00';
    a.Business_Hours.Wednesday[0].Open := '11:00';

    a.Business_Hours.Thursday.Add(TThursdayDTO.Create);
    a.Business_Hours.Thursday[0].Close := '21:00';
    a.Business_Hours.Thursday[0].Open := '11:00';

    a.Business_Hours.Friday.Add(TFridayDTO.Create);
    a.Business_Hours.Friday[0].Close := '21:00';
    a.Business_Hours.Friday[0].Open := '11:00';

    a.Business_Hours.Saturday.Add(TSaturdayDTO.Create);
    a.Business_Hours.Saturday[0].Close := '21:00';
    a.Business_Hours.Saturday[0].Open := '11:00';

    a.Business_Hours.Sunday.Add(TSundayDTO.Create);
    a.Business_Hours.Sunday[0].Close := '21:00';
    a.Business_Hours.Sunday[0].Open := '11:00';

    a.Location.Zip_Code := '06233-903';
    a.Location.Street_Number := '3003';
    a.Location.Street_Name := 'Av. das Nações Unidas';
    a.Location.City_Name := 'Osasco';
    a.Location.State_Name := 'São Paulo';
    a.Location.Latitude := -23.5254383;
    a.Location.Longitude := -46.7620313;
    a.Location.Reference := 'Melicidade';
  a.External_Id := 'lojadelphi';

  json := TJSON.ObjectToJsonObject(a);
  Memo2.Lines.Add(json.format);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
Memo2.Clear;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
Memo2.Clear;
  Memo2.Lines.Add(
    TBuilderStores.New
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
    .Content
  );
end;

procedure TForm1.CarregarPedidonoQR1Click(Sender: TObject);
var
  JSON : String;
begin
  JSON := '';
  JSON :=
  '{'+
  '"external_reference": "Pedido12345",'+
  '"notification_url": "https://hookb.in/r1nObgxaMMcY1YJeZ3PQ",'+
  '"items" :[{'+
  '"id": "Produto0001",'+
  '"title" : "Viagem ao caribe",'+
  '"currency_id" : "BRL",'+
  '"unit_price" : 4.25,'+
  '"description": "Lorem ipsum lorem ipsum",'+
  '"quantity" : 1,'+
  '"picture_url": "https://s3-sa-east-1.amazonaws.com/homolog.rdcferias/media/2156/thumb-rdcferias-rdcviagens.jpg"'+
  '},'+
  '{'+
  '"id": "Produto0002",'+
  '"title" : "Translado aeroporto ida",'+
  '"currency_id" : "BRL",'+
  '"unit_price" : 3.4,'+
  '"description": "Lorem ipsum lorem ipsum 2",'+
  '"quantity" : 2,'+
  '"picture_url": "https://www.criatives.com.br/wp-content/uploads/2019/04/carro-chinês-capa.jpg"'+
  '},'+
  '{'+
  '"id": "Produto0003",'+
  '"title" : "Translado aeroporto volta",'+
  '"currency_id" : "BRL",'+
  '"unit_price" : 2.0,'+
  '"description": "Lorem ipsum lorem ipsum 3",'+
  '"quantity" : 2,'+
  '"picture_url": "https://i2.wp.com/www.eurodicas.com.br/wp-content/uploads/2019/02/comprar-carro-em-portugal.jpg"'+
  '}],'+
  '"payment_methods": {'+
  '"installments": 12'+
  '}'+
  '}';
  Memo2.Lines.Text :=
  TRequest.New
    .BaseURL(TRANSACIONAL_URL+COLLECTOR_ID+'/'+Edit1.Text)
    .Accept('application/json')
    .Token('Bearer '+ACCESS_TOKEN)
    .AddBody(JSON)
    .Post.Content;
end;

procedure TForm1.ConsultaPedidomerchantorder1Click(Sender: TObject);
begin
  Memo2.Lines.Text :=
  TRequest.New
    .BaseURL(MERCHANT_ORDERS+Edit1.Text)
    .Accept('application/json')
    .Token('Bearer '+ACCESS_TOKEN)
    .Get.Content;
end;

procedure TForm1.ConsultardisponibilidadedoQR1Click(Sender: TObject);
begin
  Memo2.Lines.Text :=
  TRequest.New
    .BaseURL(TRANSACIONAL_URL+Edit1.Text)
    .Accept('application/json')
    .Token('Bearer '+ACCESS_TOKEN)
    .Get.Content;
end;

procedure TForm1.ConsultarPagamento1Click(Sender: TObject);
begin
  Memo2.Lines.Text :=
  TRequest.New
    .BaseURL(POS_VENDA_URL+Edit1.Text)
    .Accept('application/json')
    .Token('Bearer '+ACCESS_TOKEN)
    .Get.Content;
end;

procedure TForm1.CriarStore1Click(Sender: TObject);
begin
  Json := '';
  JSon :=TBuilderStores.New
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
    .Content;
  Memo2.Lines.Text :=
  TRequest.New
    .BaseURL(CREDENCIAMENTO_URL+COLLECTOR_ID+'/stores')
    .Accept('application/json')
    .Token('Bearer '+ACCESS_TOKEN)
    .AddBody(JSON)
    .Post.Content;
end;

procedure TForm1.DevoluoEstornodePagamento1Click(Sender: TObject);
begin
  Memo2.Lines.Text :=
  TRequest.New
    .BaseURL(POS_VENDA_URL+edit1.Text+'/refounds')
    .Accept('application/json')
    .Token('Bearer '+ACCESS_TOKEN)
    .Post.Content;
end;

procedure TForm1.DevoluoEstornoParcialdePagamento1Click(Sender: TObject);
var
  JSON : String;
begin
  JSON := '';
  JSON := '{ "amount": 10.50 }';
  Memo2.Lines.Text :=
  TRequest.New
    .BaseURL(POS_VENDA_URL+Edit1.Text+'/refounds')
    .Accept('application/json')
    .Token('Bearer '+ACCESS_TOKEN)
    .AddBody(JSON)
    .Post.Content;
end;

procedure TForm1.ImprimirQRManualmente1Click(Sender: TObject);
var
  strm : TMemoryStream;
  image : TPNGImage;
begin
  strm := TMemoryStream.Create;
  try
    strm.LoadFromStream(
    TRequest.New
    .BaseURL('https://api.qrserver.com/v1/create-qr-code/')
    .Token('Bearer '+ACCESS_TOKEN)
    .AddParam('size','300x300')
    .AddParam('data','https://mpago.la/pos/'+Edit1.Text)
    .Get.ContentStream
    );
    image := TPngImage.Create;
    try
      strm.Position := 0;
      image.LoadFromStream(strm);
      Image1.Picture.Graphic := image;
    finally
      image.Free;
    end;
  finally
    strm.Free;
  end;
end;

procedure TForm1.ProcurarPagamento1Click(Sender: TObject);
begin
  Memo2.Lines.Text :=
  TRequest.New
    .BaseURL(POS_VENDA_URL+'search')
    .Accept('application/json')
    .Token('Bearer '+ACCESS_TOKEN)
    .AddParam('external_reference','Pedido12345')
    .AddParam('id','{{payment_id}}')
    .AddParam('pos_id','{{qr_id}}')
    .AddParam('collector.id','{{collector_id}}')
    .AddParam('payment_method_id','visa')
    .AddParam('status','rejected')
    .AddParam('status_detail','cc_rejected_high_risk')
    .AddParam('transaction_amount','10')
    .AddParam('installments','4')
    .AddParam('transaction_details.installment_amount','10.78')
    .AddParam('begin_date','2019-07-30T00:00:00.000-04:00')
    .AddParam('end_date','2019-07-30T23:59:59.000-04:00')
    .AddParam('range','date_created')
    .AddParam('payment_type_id','credit_card')
    .AddParam('card.first_six_digits','464611')
    .AddParam('card.last_four_digits','3875')
    .AddParam('payer.identification.number','19119119100')
    .AddParam('card.expiration_year','2022')
    .AddParam('card.expiration_month','10')
    .AddParam('limit','150')
    .AddParam('offset','600')
    .AddParam('criteria','desc')
    .AddParam('sort','date_created')
    .Get.Content;
end;

procedure TForm1.ProcurarPedidomerchantorder1Click(Sender: TObject);
begin
Memo2.Lines.Add(
 TRequest.New
    .BaseURL(MERCHANT_ORDERS)
    .Token('Bearer '+ACCESS_TOKEN)
    .AddParam('data_created_from','2019-08-28T09:30:00.000-01:00')
    .AddParam('data_created_to','2019-08-30T10:00:00.000-01:00')
    .AddParam('external_reference',Edit1.Text)
    .Get.Content);
end;

{ TLocation<T> }

function TLocation<T>.&End: T;
begin
  Result := FParent;
end;

function TLocation<T>.City_Name(Value: string): iLocation<T>;
begin
  Result := Self;
  JSONRoot.Location.City_Name := Value;
end;

constructor TLocation<T>.Create(Parent: T);
begin
  FParent := Parent;
end;

destructor TLocation<T>.Destroy;
begin

  inherited;
end;

function TLocation<T>.Latitude(Value: Double): iLocation<T>;
begin
  Result := Self;
  JSONRoot.Location.Latitude := Value;
end;

function TLocation<T>.Longitude(Value: Double): iLocation<T>;
begin
  Result := Self;
  JSONRoot.Location.Longitude := Value;
end;

class function TLocation<T>.New(Parent: T): iLocation<T>;
begin
  Result := Self.Create(Parent);
end;

function TLocation<T>.Reference(Value: string): iLocation<T>;
begin
  Result := Self;
  JSONRoot.Location.Reference := Value;
end;

function TLocation<T>.State_Name(Value: string): iLocation<T>;
begin
  Result := Self;
  JSONRoot.Location.State_Name := Value;
end;

function TLocation<T>.Street_Name(Value: string): iLocation<T>;
begin
  Result := Self;
  JSONRoot.Location.Street_Name := Value;
end;

function TLocation<T>.Street_Number(Value: String): iLocation<T>;
begin
  Result := Self;
  JSONRoot.Location.Street_Number := Value;
end;

function TLocation<T>.Zip_Code(Value: string): iLocation<T>;
begin
  Result := Self;
  JSONRoot.Location.Zip_Code := Value;
end;

{ TStones }

function TStones.Content: String;
var
  json : tjsonobject;
begin
  json := TJSON.ObjectToJsonObject(JSONRoot);
  Result := json.format;
end;

constructor TStones.Create;
begin
  FLocation := TLocation<iStones>.New(Self);
end;

destructor TStones.Destroy;
begin

  inherited;
end;

function TStones.External_Id(Value: String): iStones;
begin
  Result := Self;
  JSONRoot.External_Id := Value;
end;

function TStones.Location: iLocation<iStones>;
begin
  Result := FLocation;
end;

function TStones.Name(Value: String): iStones;
begin
  Result := Self;
  JSONRoot.Name := Value;
end;

class function TStones.New: iStones;
begin
  Result := Self.Create;
end;

initialization
  JSONRoot := TRootDTO.Create;

finalization
  JSONRoot.Free;

end.
