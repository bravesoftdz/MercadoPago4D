unit MercadoPago4D.Model.Builder.Wednesday;

interface

uses
  MercadoPago4D.Model.Builder.Interfaces,
  Mercadopago4D.Model.DTO.Stores;

type
  TBuilderWednesday<T : IInterface> = class(TInterfacedObject, iWednesday<T>)
    private
      [weak]
      FParent : T;
      FStoresDTO : TStoresDTO;
      FOpen : String;
      FClose : String;
      procedure AddList;
    public
      constructor Create(Parent : T; Value : TStoresDTO);
      destructor Destroy; override;
      class function New(Parent : T; Value : TStoresDTO) : iWednesday<T>;
      function Open(Value : String) : iWednesday<T>;
      function Close(Value : String) : iWednesday<T>;
      function &End : T;
  end;

implementation

{ TBuilderWednesday<T> }

procedure TBuilderWednesday<T>.AddList;
var
  I : Integer;
begin
  FStoresDTO.Business_Hours.Wednesday.Add(TWednesdayDTO.Create);
  I := FStoresDTO.Business_Hours.Wednesday.Count -1;
  FStoresDTO.Business_Hours.Wednesday[I].Open := FOpen;
  FStoresDTO.Business_Hours.Wednesday[I].Close := FClose;
end;

function TBuilderWednesday<T>.Close(Value: String): iWednesday<T>;
begin
  Result := Self;
  FClose := Value;
end;

constructor TBuilderWednesday<T>.Create(Parent : T; Value : TStoresDTO);
begin
  FParent := Parent;
  FStoresDTO := Value;
end;

destructor TBuilderWednesday<T>.Destroy;
begin

  inherited;
end;

function TBuilderWednesday<T>.&End: T;
begin
  Result := FParent;
  AddList;
end;

class function TBuilderWednesday<T>.New(Parent : T; Value : TStoresDTO): iWednesday<T>;
begin
  Result := Self.Create(Parent, Value);
end;

function TBuilderWednesday<T>.Open(Value: String): iWednesday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

end.

