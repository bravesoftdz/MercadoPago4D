unit MercadoPago4D.Services.Resources;

interface

uses
  MercadoPago4D.Core.Interfaces,
  MercadoPago4D.Services.Accreditation.Interfaces,
  MercadoPago4D.DTO.Builder.Interfaces,
  MercadoPago4D.DTO.Builder.Manager;

type
  TMercadoPago4DResources = class(TInterfacedObject, iMercadoPago4DResources)
    private
      [weak]
      FParent : iMercadoPago4DConfiguration;
    public
      constructor Create(Parent : iMercadoPago4DConfiguration);
      destructor Destroy; override;
      class function New(Parent : iMercadoPago4DConfiguration) : iMercadoPago4DResources;
      function Builder : iBuilder;
      function Accreditation : iAccreditation;
  end;

implementation

function TMercadoPago4DResources.Accreditation: iAccreditation;
begin

end;

function TMercadoPago4DResources.Builder: iBuilder;
begin
  Result := TBuilder.New;
end;

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
