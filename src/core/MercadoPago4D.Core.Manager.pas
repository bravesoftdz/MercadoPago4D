unit MercadoPago4D.Core.Manager;

interface

uses
  MercadoPago4D.Core.Interfaces,
  MercadoPago4D.Core.Configuration,
  MercadoPago4D.Services.Resources;

type
  TManager = class(TInterfacedObject, iManager)
    private
      [weak]
      FParent : iConfiguration;
    public
      constructor Create(Parent : iConfiguration);
      destructor Destroy; override;
      class function New(Parent : iConfiguration) : iManager;
      function Resources : iResources;
  end;

implementation


constructor TManager.Create(Parent : iConfiguration);
begin
  FParent := Parent;
end;

destructor TManager.Destroy;
begin

  inherited;
end;

class function TManager.New (Parent : iConfiguration) : iManager;
begin
  Result := Self.Create(Parent);
end;

function TManager.Resources: iResources;
begin
  Result := TResources.New(FParent);
end;

end.
