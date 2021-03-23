unit MercadoPago4D.Core.Manager;

interface

uses
  MercadoPago4D.Core.Interfaces;

type
  TMercadoPago4DManger = class(TInterfacedObject, iMercadoPago4DManger)
    private
      [weak]
      FParent : iMercadoPago4DConfiguration;
    public
      constructor Create(Parent : iMercadoPago4DConfiguration);
      destructor Destroy; override;
      class function New(Parent : iMercadoPago4DConfiguration) : iMercadoPago4DManger;
      function Resources : iMercadoPago4DResources;
  end;

implementation

uses
  MercadoPago4D.Core.Configuration, MercadoPago4D.Services.Resources;

constructor TMercadoPago4DManger.Create(Parent : iMercadoPago4DConfiguration);
begin
  FParent := Parent;
end;

destructor TMercadoPago4DManger.Destroy;
begin

  inherited;
end;

class function TMercadoPago4DManger.New (Parent : iMercadoPago4DConfiguration) : iMercadoPago4DManger;
begin
  Result := Self.Create(Parent);
end;

function TMercadoPago4DManger.Resources: iMercadoPago4DResources;
begin
  Result := TMercadoPago4DResources.New(FParent);
end;

end.
