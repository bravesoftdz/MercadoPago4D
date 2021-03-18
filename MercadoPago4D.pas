unit MercadoPago4D;

interface

uses
  MercadoPago4D.Core.Interfaces,
  MercadoPago4D.Core.Manager;

type
  TMercadoPago4D = class(TInterfacedObject, iMercadoPago4D)
    private
      FConfig : iMercadoPago4DConfiguration;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iMercadoPago4D;
      function Menager : iMercadoPago4DManger;
      function Config : iMercadoPago4DConfiguration;
  end;

implementation

uses
  MercadoPago4D.Core.Configuration;

function TMercadoPago4D.Config: iMercadoPago4DConfiguration;
begin
  FConfig := TMercadoPago4DConfiguration.New;
  Result := FConfig;
end;

constructor TMercadoPago4D.Create;
begin

end;

destructor TMercadoPago4D.Destroy;
begin

  inherited;
end;

function TMercadoPago4D.Menager: iMercadoPago4DManger;
begin
  Result := TMercadoPago4DManger.New(FConfig);
end;

class function TMercadoPago4D.New : iMercadoPago4D;
begin
  Result := Self.Create;
end;

end.
