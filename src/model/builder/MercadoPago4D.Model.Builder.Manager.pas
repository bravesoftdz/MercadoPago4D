unit MercadoPago4D.Model.Builder.Manager;

interface

uses
  MercadoPago4D.Model.Builder.Interfaces, MercadoPago4D.Model.Builder.Stores;

type
  TBuilderManager = class(TInterfacedObject, iBuilderManager)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iBuilderManager;
      function Stores : iStores;
  end;

implementation

constructor TBuilderManager.Create;
begin

end;

destructor TBuilderManager.Destroy;
begin

  inherited;
end;

class function TBuilderManager.New : iBuilderManager;
begin
  Result := Self.Create;
end;

function TBuilderManager.Stores: iStores;
begin
  Result := TBuilderStores.New;
end;

end.
