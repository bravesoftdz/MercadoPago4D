unit MercadoPago4D.Core.Configuration;

interface

uses
  MercadoPago4D.Core.Interfaces;

type
  TMercadoPago4DConfiguration = class(TInterfacedObject, iMercadoPago4DConfiguration)
    private
      FClientID : String;
      FAcessToken : String;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iMercadoPago4DConfiguration;
      function ClientID(Value : String) : iMercadoPago4DConfiguration; overload;
      function ClientID : String; overload;
      function AccessToken(Value : String) : iMercadoPago4DConfiguration; overload;
      function AccessToken : String; overload;
  end;

implementation

function TMercadoPago4DConfiguration.AccessToken(
  Value: String): iMercadoPago4DConfiguration;
begin
  Result := Self;
  FAcessToken := Value;
end;

function TMercadoPago4DConfiguration.AccessToken: String;
begin
  Result := FAcessToken;
end;

function TMercadoPago4DConfiguration.ClientID(
  Value: String): iMercadoPago4DConfiguration;
begin
  Result := Self;
  FClientID := Value;
end;

function TMercadoPago4DConfiguration.ClientID: String;
begin
  Result := FClientID;
end;

constructor TMercadoPago4DConfiguration.Create;
begin

end;

destructor TMercadoPago4DConfiguration.Destroy;
begin

  inherited;
end;

class function TMercadoPago4DConfiguration.New : iMercadoPago4DConfiguration;
begin
  Result := Self.Create;
end;

end.
