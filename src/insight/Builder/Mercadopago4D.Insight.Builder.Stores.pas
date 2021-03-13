unit Mercadopago4D.Insight.Builder.Stores;

interface

uses
  Mercadopago4D.Insight.Builder.Interfaces,
  Mercadopago4D.Insight.DTO.Stores;

type
  TBuilderStores = class(TInterfacedObject, iBuilderStores)
      private
        FLocation : iBuilderLocation<iBuilderStores>;
        FBusiness_Hours : iBuilderBusiness_Hours;
        FStoresDTO : TStoresDTO;
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
  Mercadopago4D.Insight.Builder.Location,
  Mercadopago4D.Insight.Builder.Business_Hours;

{ TBuilderStores }

function TBuilderStores.&End: iBuilderStores;
begin
  Result := Self;
end;

function TBuilderStores.Business_Hours: iBuilderBusiness_Hours;
begin
  Result := FBusiness_Hours;
end;

function TBuilderStores.Content: String;
begin

end;

constructor TBuilderStores.Create;
begin
  FStoresDTO := TStoresDTO.Create;
  FLocation := TBuilderLocation<iBuilderStores>.Create(Self, FStoresDTO);
  FBusiness_Hours := TBuilderBusiness_Hours.Create(Self, FStoresDTO);
end;

destructor TBuilderStores.Destroy;
begin
  FStoresDTO.Free;
  inherited;
end;

function TBuilderStores.External_Id(Value: String): iBuilderStores;
begin
  Result := Self;
  FStoresDTO.External_id := Value;
end;

function TBuilderStores.Location: iBuilderLocation<iBuilderStores>;
begin
  Result := FLocation;
end;

function TBuilderStores.Name(Value: String): iBuilderStores;
begin
  Result := Self;
  FStoresDTO.Name := Value;
end;

class function TBuilderStores.New: iBuilderStores;
begin
  Result := Self.Create;
end;

end.
