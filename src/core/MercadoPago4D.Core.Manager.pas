unit MercadoPago4D.Core.Manager;

interface

uses
  MercadoPago4D.Core.Interfaces;

type
  TMercadoPago4DManager = class(TInterfacedObject, iMercadoPago4DManager)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iMercadoPago4DManager;
      function Resources : iMercadoPago4DResources;
  end;

implementation

uses
  MercadoPago4D.Resources;

constructor TMercadoPago4DManager.Create;
begin

end;

destructor TMercadoPago4DManager.Destroy;
begin

  inherited;
end;

class function TMercadoPago4DManager.New : iMercadoPago4DManager;
begin
  Result := Self.Create;
end;

function TMercadoPago4DManager.Resources: iMercadoPago4DResources;
begin
  Result := TMercadoPago4DResources.New();
end;

end.
