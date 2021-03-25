unit MercadoPago4D.Core.Enviroment;

interface

uses
  MercadoPago4D.Core.Interfaces;

type
  TEnviroment = class(TInterfacedObject, iEnviroment)
    private
      const
        BASE_URL = 'https://api.mercadopago.com/';
        QRSERVER_URL = 'https://api.qrserver.com/v1/';
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iEnviroment;
      function BaseURL : String;
      function QrServerURL : String;
  end;

implementation

function TEnviroment.BaseURL: String;
begin
  Result := BASE_URL;
end;

constructor TEnviroment.Create;
begin

end;

destructor TEnviroment.Destroy;
begin

  inherited;
end;

class function TEnviroment.New : iEnviroment;
begin
  Result := Self.Create;
end;

function TEnviroment.QrServerURL: String;
begin
  Result := QRSERVER_URL;
end;

end.
