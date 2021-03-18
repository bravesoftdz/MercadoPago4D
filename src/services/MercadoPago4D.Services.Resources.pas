unit MercadoPago4D.Services.Resources;

interface

uses
  MercadoPago4D.Core.Interfaces;

type
  TMercadoPago4DResources = class(TInterfacedObject, iMercadoPago4DResources)
    private
      [weak]
      FParent : iMercadoPago4DConfiguration;
    public
      constructor Create(Parent : iMercadoPago4DConfiguration);
      destructor Destroy; override;
      class function New(Parent : iMercadoPago4DConfiguration) : iMercadoPago4DResources;
  end;

implementation

constructor TMercadoPago4DResources.Create(Parent : iMercadoPago4DConfiguration);
begin
  FParent := Parent;
end;

destructor TMercadoPago4DResources.Destroy;
begin

  inherited;
end;

class function TMercadoPago4DResources.New (Parent : iMercadoPago4DConfiguration) : iMercadoPago4DResources;
begin
  Result := Self.Create(Parent);
end;

end.
