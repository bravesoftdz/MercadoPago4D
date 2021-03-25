unit MercadoPago4D.Model.Builder.Stores;

interface

uses
  MercadoPago4D.Model.Builder.Interfaces,
  Mercadopago4D.Model.DTO.Stores, MercadoPago4D.Model.Builder.Location,
  MercadoPago4D.Model.Builder.Business_Hours,
  System.JSON,
  REST.Json;

type
  TBuilderStores = class(TInterfacedObject, iStores)
    private
      FStoresDTO : TStoresDTO;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iStores;
      function Name(Value : String) : iStores;
      function External_Id(Value : String) : iStores;
      function Location : iLocation<iStores>;
      function Business_Hours : iBusiness_Hours;
      function Content : String;
      function &End : iStores;
  end;

implementation

{ TBuilderStores }

function TBuilderStores.&End: iStores;
begin
  Result := Self;
end;

function TBuilderStores.Business_Hours: iBusiness_Hours;
begin
  Result := TBuilderBusiness_Hours.New(Self, FStoresDTO);
end;

function TBuilderStores.Content: String;
var
  JSON : TJSONObject;
begin
  JSON := TJSON.ObjectToJsonObject(FStoresDTO);
  Result := JSON.format;
end;

constructor TBuilderStores.Create;
begin
  FStoresDTO := TStoresDTO.Create;
end;

destructor TBuilderStores.Destroy;
begin
  FStoresDTO.Free;
  inherited;
end;

function TBuilderStores.External_Id(Value: String): iStores;
begin
  Result := Self;
  FStoresDTO.External_id := Value;
end;

function TBuilderStores.Location: iLocation<iStores>;
begin
  Result := TBuilderLocation<iStores>.New(Self, FStoresDTO);
end;

function TBuilderStores.Name(Value: String): iStores;
begin
  Result := Self;
  FStoresDTO.Name := Value;
end;

class function TBuilderStores.New: iStores;
begin
  Result := Self.Create;
end;

end.
