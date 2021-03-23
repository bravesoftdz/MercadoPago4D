unit MercadoPago4D.Core.Enviroment;

interface

uses
  MercadoPago4D.Core.Interfaces;

type
  TEnviroment = class(TInterfacedObject, iEnviroment)
    private
      const
        BASEURL = 'https://api.mercadopago.com/';
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iEnviroment;
      function Base_URL : String;
  end;

implementation

function TEnviroment.Base_URL: String;
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

end.
