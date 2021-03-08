unit MercadoPago4D.Resources.Store;

interface

uses
  MercadoPago4D.Resources.Interfaces;

type
  TStore = class(TInterfacedObject, iStore)
    private
      FStoreId := String;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iStore;
      function CreateStore : iStore;
      function UpdateStore : iStore;
      function SearchStores : iStore;
      function DelSotre : iStore;
      function StoreId(Value : String) : iStore;
  end;

implementation

constructor TStore.Create;
begin

end;

function TStore.CreateStore: iStore;
begin
  Result := Self;
end;

function TStore.DelSotre: iStore;
begin
  Result := Self;
end;

destructor TStore.Destroy;
begin

  inherited;
end;

class function TStore.New : iStore;
begin
  Result := Self.Create;
end;

function TStore.SearchStores: iStore;
begin
  Result := Self;
end;

function TStore.StoreId(Value: String): iStore;
begin
  Result := Self;
  FStoreId := Value;
end;

function TStore.UpdateStore: iStore;
begin
  Result := Self;
end;

end.
