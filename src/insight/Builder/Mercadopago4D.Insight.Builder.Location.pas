unit Mercadopago4D.Insight.Builder.Location;

interface

uses
  Mercadopago4D.Insight.Builder.Interfaces,
  Mercadopago4D.Insight.DTO.Stores;

type

  TBuilderLocation<T : IInterface> = class(TInterfacedObject, iBuilderLocation<T>)
    private
      [weak]
      FParent : T;
      FRoot : TStoresDTO;
    public
      constructor Create(Parent : T; Root : TStoresDTO);
      destructor Destroy; override;
      class function New(Parent : T; Root : TStoresDTO) : iBuilderLocation<T>;
      function City_Name(Value : string) : iBuilderLocation<T>;
      function Latitude(Value : Double) : iBuilderLocation<T>;
      function Longitude(Value : Double) :iBuilderLocation<T>;
      function Reference(Value : string) : iBuilderLocation<T>;
      function State_Name(Value : string) : iBuilderLocation<T>;
      function Street_Name(Value : string) : iBuilderLocation<T>;
      function Street_Number(Value : string) : iBuilderLocation<T>;
      function Zip_Code(Value : string) : iBuilderLocation<T>;
      function &End : T;
  end;

implementation

{ TBuilderLocation<T> }

function TBuilderLocation<T>.City_Name(Value: string): iBuilderLocation<T>;
begin
  Result := Self;
  FRoot.Location.City_name := Value;
end;

constructor TBuilderLocation<T>.Create(Parent: T; Root: TStoresDTO);
begin
  FParent := Parent;
  FRoot := Root;
end;

destructor TBuilderLocation<T>.Destroy;
begin

  inherited;
end;

function TBuilderLocation<T>.&End: T;
begin
  Result := FParent;
end;

function TBuilderLocation<T>.Latitude(Value: Double): iBuilderLocation<T>;
begin
  Result := Self;
  FRoot.Location.Latitude := Value;
end;

function TBuilderLocation<T>.Longitude(Value: Double): iBuilderLocation<T>;
begin
  Result := Self;
  FRoot.Location.Longitude := Value;
end;

class function TBuilderLocation<T>.New(Parent: T;
  Root: TStoresDTO): iBuilderLocation<T>;
begin
  Result := Self.Create(Parent, Root);
end;

function TBuilderLocation<T>.Reference(Value: string): iBuilderLocation<T>;
begin
  Result := Self;
  FRoot.Location.Reference := Value;
end;

function TBuilderLocation<T>.State_Name(Value: string): iBuilderLocation<T>;
begin
  Result := Self;
  FRoot.Location.State_name := Value;
end;

function TBuilderLocation<T>.Street_Name(Value: string): iBuilderLocation<T>;
begin
  Result := Self;
  FRoot.Location.Street_name := Value;
end;

function TBuilderLocation<T>.Street_Number(Value: string): iBuilderLocation<T>;
begin
  Result := Self;
  FRoot.Location.Street_number := Value;
end;

function TBuilderLocation<T>.Zip_Code(Value: string): iBuilderLocation<T>;
begin
  Result := Self;
  FRoot.Location.Zip_code := Value;
end;

end.
