unit MercadoPago4D.DTO.Builder.Manager;

interface

uses
  MercadoPago4D.Core.Interfaces,
  MercadoPago4D.DTO.Builder.Stores,
  MercadoPago4D.DTO.Builder.Interfaces;

type
  TBuilder = class(TInterfacedObject, iBuilder)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iBuilder;
      function BuilderStore : iBuilderStores;
  end;

implementation

function TBuilder.BuilderStore: iBuilderStores;
begin
  Result := TMercadoPago4DBuilderStores.New;
end;

constructor TBuilder.Create;
begin

end;

destructor TBuilder.Destroy;
begin

  inherited;
end;

class function TBuilder.New : iBuilder;
begin
  Result := Self.Create;
end;

end.
