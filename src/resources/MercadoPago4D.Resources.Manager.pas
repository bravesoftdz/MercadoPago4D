unit MercadoPago4D.Resources.Manager;

interface

uses
  MercadoPago4D.Core.Interfaces, Mercadopago4D.Insight.Builder.Interfaces;

type
  TMercadoPago4DManager = class(TInterfacedObject, iMercadoPago4DManager)
    private
      [weak]
      FParent : iMercadoPago4DConfiguration;
    public
      constructor Create(Parent : iMercadoPago4DConfiguration);
      destructor Destroy; override;
      class function New(Parent : iMercadoPago4DConfiguration) : iMercadoPago4DManager;
      function Resources : iMercadoPago4DResources;
      function Builder : iManagerBuilder;
  end;

implementation

uses
  MercadoPago4D.Resources;

function TMercadoPago4DManager.Builder: iManagerBuilder;
begin

end;

constructor TMercadoPago4DManager.Create(Parent : iMercadoPago4DConfiguration);
begin
  FParent := Parent;
end;

destructor TMercadoPago4DManager.Destroy;
begin

  inherited;
end;

class function TMercadoPago4DManager.New (Parent : iMercadoPago4DConfiguration) : iMercadoPago4DManager;
begin
  Result := Self.Create(Parent);
end;

function TMercadoPago4DManager.Resources: iMercadoPago4DResources;
begin
  Result := TMercadoPago4DResources.New(FParent);
end;

end.
