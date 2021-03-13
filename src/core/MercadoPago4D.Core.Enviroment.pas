unit MercadoPago4D.Core.Enviroment;

interface

uses
  MercadoPago4D.Core.Interfaces;

type
  TEnviroment = class(TInterfacedObject, iEnviroment)
    private
      FClientID : String;
      FClientSecret : String;
      FAccessToken : String;
      const
        BASEURL = 'https://api.mercadopago.com';
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iEnviroment;
      function ClientID(Value : String) : iEnviroment; overload;
      function ClienteID : String; overload;
      function ClientSecret(Value : String) : iEnviroment; overload;
      function ClientSecret : String; overload;
      function AccessToken(Value : String) : iEnviroment; overload;
      function AccessToken : String; overload;
      function Base_URL : String;
  end;

implementation

function TEnviroment.AccessToken(Value: String): iEnviroment;
begin
  Result := Self;
  FAccessToken := Value;
end;

function TEnviroment.AccessToken: String;
begin
  Result := FAccessToken;
end;

function TEnviroment.Base_URL: String;
begin
  Result := BASEURL;
end;

function TEnviroment.ClienteID: String;
begin
  Result := FClientID;
end;

function TEnviroment.ClientSecret: String;
begin
  Result := FClientSecret;
end;

function TEnviroment.ClientSecret(Value: String): iEnviroment;
begin
  Result := Self;
  FClientSecret := Value;
end;

function TEnviroment.ClientID(Value: String): iEnviroment;
begin
  Result := Self;
  FClientID := Value;
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
