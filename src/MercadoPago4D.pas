unit MercadoPago4D;

interface

uses
  MercadoPago4D.Core.Interfaces;

type
  TMercadoPago4D = class(TInterfacedObject, iMercadoPago4D)
    private
      FConfiguration : iConfiguration;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iMercadoPago4D;
      function Configuration : iConfiguration;
  end;

implementation

function TMercadoPago4D.Configuration: iConfiguration;
begin
  Result := FConfiguration;
end;

constructor TMercadoPago4D.Create;
begin
//  FConfiguration := TMercadoPago4DConfiguration.New;
end;

destructor TMercadoPago4D.Destroy;
begin

  inherited;
end;

class function TMercadoPago4D.New : iMercadoPago4D;
begin
  Result := Self.Create;
end;

end.
