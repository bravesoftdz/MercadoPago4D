unit MercadoPago4D.DTO.Builder.Location;

interface

uses
  MercadoPago4D.DTO.Builder.Interfaces, Mercadopago4D.Insight.DTO.Stores;

type
  TBuilderLocation<T : IInterface> = class(TInterfacedObject, iBuilderLocation<T>)
    private
      [weak]
      FParent : T;
      FStoresDTO : TStoresDTO;
    public
      constructor Create(Parent : T; Stores : TStoresDTO);
      destructor Destroy; override;
      class function New(Parent : T; Stores : TStoresDTO) : iBuilderLocation<T>;
      function City_Name(Value : string) : iBuilderLocation<T>;
      function Latitude(Value : Double) : iBuilderLocation<T>;
      function Longitude(Value : Double) : iBuilderLocation<T>;
      function Reference(Value : string) : iBuilderLocation<T>;
      function State_Name(Value : string) : iBuilderLocation<T>;
      function Street_Name(Value : string) : iBuilderLocation<T>;
      function Street_Number(Value : string) : iBuilderLocation<T>;
      function Zip_Code(Value : string) : iBuilderLocation<T>;
      function &End : T;
  end;

implementation

function TBuilderLocation<T>.City_Name(Value: string): iBuilderLocation<T>;
begin
  Result := Self;
  FStoresDTO.Location.City_name := Value;
end;

function TBuilderLocation<T>.&End: T;
begin
  Result := FParent;
end;

constructor TBuilderLocation<T>.Create(Parent : T; Stores : TStoresDTO);
begin
  FParent := Parent;
  FStoresDTO := Stores;
end;

destructor TBuilderLocation<T>.Destroy;
begin

  inherited;
end;

function TBuilderLocation<T>.Latitude(Value: Double): iBuilderLocation<T>;
begin
  Result := Self;
  FStoresDTO.Location.Latitude := Value;
end;

function TBuilderLocation<T>.Longitude(Value: Double): iBuilderLocation<T>;
begin
  Result := Self;
  FStoresDTO.Location.Longitude := Value;
end;

class function TBuilderLocation<T>.New(Parent : T; Stores : TStoresDTO) : iBuilderLocation<T>;
begin
  Result := Self.Create(Parent, Stores);
end;

function TBuilderLocation<T>.Reference(Value: string): iBuilderLocation<T>;
begin
  Result := Self;
  FStoresDTO.Location.Reference := Value;
end;

function TBuilderLocation<T>.State_Name(Value: string): iBuilderLocation<T>;
begin
  Result := Self;
  FStoresDTO.Location.State_name := Value;
end;

function TBuilderLocation<T>.Street_Name(Value: string): iBuilderLocation<T>;
begin
  Result := Self;
  FStoresDTO.Location.Street_name := Value;
end;

function TBuilderLocation<T>.Street_Number(Value: string): iBuilderLocation<T>;
begin
  Result := Self;
  FStoresDTO.Location.Street_number := Value;
end;

function TBuilderLocation<T>.Zip_Code(Value: string): iBuilderLocation<T>;
begin
  Result := Self;
  FStoresDTO.Location.Zip_code := Value;
end;

end.
