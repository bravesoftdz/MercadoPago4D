unit MercadoPago4D.Core.Configuration;

interface

uses
  MercadoPago4D.Core.Interfaces,
  MercadoPago4D.Resources.Interfaces;

type
  TMercadoPago4DConfiguration = class(TInterfacedObject, iMercadoPago4DConfiguration)
    private
      FAccessToken : String;
      FClientID : Integer;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iMercadoPago4DConfiguration;
      function AccessToken(Value : String) : iMercadoPago4DConfiguration; overload;
      function AccessToken : String; overload;
      function ClientID(Value : Integer) : iMercadoPago4DConfiguration; overload;
      function ClientID : Integer; overload;
      function Enviroment : iEnviroment;
  end;

implementation

uses
  MercadoPago4D.Core.Enviroment;


function TMercadoPago4DConfiguration.AccessToken: String;
begin
  Result := FAccessToken;
end;

function TMercadoPago4DConfiguration.AccessToken(
  Value: String): iMercadoPago4DConfiguration;
begin
  Result := Self;
  FAccessToken := Value;
end;

function TMercadoPago4DConfiguration.ClientID: Integer;
begin
  Result := FClientID;
end;

function TMercadoPago4DConfiguration.ClientID(
  Value: Integer): iMercadoPago4DConfiguration;
begin
  Result := Self;
  FClientID := Value;
end;

constructor TMercadoPago4DConfiguration.Create;
begin

end;

destructor TMercadoPago4DConfiguration.Destroy;
begin

  inherited;
end;

function TMercadoPago4DConfiguration.Enviroment: iEnviroment;
begin
  Result := TEnviroment.New;
end;

class function TMercadoPago4DConfiguration.New : iMercadoPago4DConfiguration;
begin
  Result := Self.Create;
end;

end.
