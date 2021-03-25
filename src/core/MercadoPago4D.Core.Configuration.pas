unit MercadoPago4D.Core.Configuration;

interface

uses
  MercadoPago4D.Core.Interfaces,
  MercadoPago4D.Core.Enviroment;

type
  TConfiguration = class(TInterfacedObject, iConfiguration)
    private
      FClientID : String;
      FAccessToken : String;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iConfiguration;
      function ClientID(Value : String) : iConfiguration; overload;
      function AccessToken(Value : String) : iConfiguration; overload;
      function ClientID  : String; overload;
      function AccessToken : String; overload;
      function Enviroment : iEnviroment;
  end;

implementation

function TConfiguration.AccessToken(Value: String): iConfiguration;
begin
  Result := Self;
  FAccessToken := Value;
end;

function TConfiguration.AccessToken: String;
begin
  Result := FAccessToken;
end;

function TConfiguration.ClientID(Value: String): iConfiguration;
begin
  Result := Self;
  FClientID := Value;
end;

function TConfiguration.ClientID: String;
begin
  Result := FClientID;
end;

constructor TConfiguration.Create;
begin

end;

destructor TConfiguration.Destroy;
begin

  inherited;
end;

function TConfiguration.Enviroment: iEnviroment;
begin
  Result := TEnviroment.New;
end;

class function TConfiguration.New : iConfiguration;
begin
  Result := Self.Create;
end;

end.
