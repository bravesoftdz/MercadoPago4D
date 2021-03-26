unit MercadoPago4D.Model.Builder.Location;

interface

uses
  MercadoPago4D.Model.Builder.Interfaces, Mercadopago4D.Model.DTO.Stores;

type
  TBuilderLocation<T : IInterface> = class(TInterfacedObject, iLocation<T>)
    private
      [weak]
      FParent : T;
      FStoreDTO : TStoresDTO;
    public
      constructor Create(Parent : T; Value : TStoresDTO);
      destructor Destroy; override;
      class function New(Parent : T; Value : TStoresDTO) : iLocation<T>;
      function City_Name(Value : string) : iLocation<T>;
      function Latitude(Value : Double) : iLocation<T>;
      function Longitude(Value : Double) :iLocation<T>;
      function Reference(Value : string) : iLocation<T>;
      function State_Name(Value : string) : iLocation<T>;
      function Street_Name(Value : string) : iLocation<T>;
      function Street_Number(Value : String) : iLocation<T>;
      function Zip_Code(Value : string) : iLocation<T>;
      function &End : T;
  end;

implementation

{ TBuilderLocation<T> }

function TBuilderLocation<T>.City_Name(Value: string): iLocation<T>;
begin
  Result := Self;
  FStoreDTO.Location.City_name := Value;
end;

constructor TBuilderLocation<T>.Create(Parent: T; Value : TStoresDTO);
begin
  FParent := Parent;
  FStoreDTO := Value;
end;

destructor TBuilderLocation<T>.Destroy;
begin

  inherited;
end;

function TBuilderLocation<T>.&End: T;
begin
  Result := FParent;
end;

function TBuilderLocation<T>.Latitude(Value: Double): iLocation<T>;
begin
  Result := Self;
  FStoreDTO.Location.Latitude := Value;
end;

function TBuilderLocation<T>.Longitude(Value: Double): iLocation<T>;
begin
  Result := Self;
  FStoreDTO.Location.Longitude := Value;
end;

class function TBuilderLocation<T>.New(Parent: T; Value : TStoresDTO): iLocation<T>;
begin
  Result := Self.Create(Parent, Value);
end;

function TBuilderLocation<T>.Reference(Value: string): iLocation<T>;
begin
  Result := Self;
  FStoreDTO.Location.Reference := Value;
end;

function TBuilderLocation<T>.State_Name(Value: string): iLocation<T>;
begin
  Result := Self;
  FStoreDTO.Location.State_name := Value;
end;

function TBuilderLocation<T>.Street_Name(Value: string): iLocation<T>;
begin
  Result := Self;
  FStoreDTO.Location.Street_name := Value;
end;

function TBuilderLocation<T>.Street_Number(Value: String): iLocation<T>;
begin
  Result := SElf;
  FStoreDTO.Location.Street_number := Value;
end;

function TBuilderLocation<T>.Zip_Code(Value: string): iLocation<T>;
begin
  Result := Self;
  FStoreDTO.Location.Zip_code := Value;
end;

end.
