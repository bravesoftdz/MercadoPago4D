unit MercadoPago4D.DTO.Builder.Stores;

interface

uses
  MercadoPago4D.DTO.Builder.Interfaces,
  Mercadopago4D.Insight.DTO.Stores,
  MercadoPago4D.DTO.Builder.Location,
  MercadoPago4D.DTO.Builder.Business_Hours;

type
  TMercadoPago4DBuilderStores = class(TInterfacedObject, iBuilderStores)
    private
      FStoresDTO : TStoresDTO;
      FLocation : iBuilderLocation<iBuilderStores>;
      FBusiness_Hours : iBuilderBusiness_Hours;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iBuilderStores;
      function Name(Value : String) : iBuilderStores;
      function External_Id(Value : String) : iBuilderStores;
      function Location : iBuilderLocation<iBuilderStores>;
      function Business_Hours : iBuilderBusiness_Hours;
      function Content : String;
      function &End : iBuilderStores;
  end;

implementation

uses
  System.JSON, REST.Json;

function TMercadoPago4DBuilderStores.Business_Hours: iBuilderBusiness_Hours;
begin
  Result := FBusiness_Hours;
end;

function TMercadoPago4DBuilderStores.Content: String;
var
  lJSON : TJSONobject;
begin
  lJSON := TJSON.ObjectToJsonObject(FStoresDTO);
  Result := lJSON.Format;
end;

function TMercadoPago4DBuilderStores.&End: iBuilderStores;
begin
  Result := Self;
end;

constructor TMercadoPago4DBuilderStores.Create;
begin
  FStoresDTO := TStoresDTO.Create;
  FLocation := TBuilderLocation<iBuilderStores>.New(Self, FStoresDTO);
  FBusiness_Hours := TBuilderBusiness_Hours.New(Self, FStoresDTO);
end;

destructor TMercadoPago4DBuilderStores.Destroy;
begin
    FStoresDTO.DisposeOf;
  inherited;
end;

function TMercadoPago4DBuilderStores.External_Id(Value: String): iBuilderStores;
begin
  Result := Self;
  FStoresDTO.External_id := Value;
end;

function TMercadoPago4DBuilderStores.Location: iBuilderLocation<iBuilderStores>;
begin
  Result := FLocation;
end;

function TMercadoPago4DBuilderStores.Name(Value: String): iBuilderStores;
begin
  Result := Self;
  FStoresDTO.Name := Value;
end;

class function TMercadoPago4DBuilderStores.New : iBuilderStores;
begin
  Result := Self.Create;
end;

end.