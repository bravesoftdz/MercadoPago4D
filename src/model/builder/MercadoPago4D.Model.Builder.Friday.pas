unit MercadoPago4D.Model.Builder.Friday;

interface

uses
  MercadoPago4D.Model.Builder.Interfaces,
  Mercadopago4D.Model.DTO.Stores;

type
  TBuilderFriday<T : IInterface> = class(TInterfacedObject, iFriday<T>)
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
      class function New(Parent : T; Value : TStoresDTO) : iFriday<T>;
      function Open(Value : String) : iFriday<T>;
      function Close(Value : String) : iFriday<T>;
      function &End : T;
  end;

implementation

{ TBuilderFriday<T> }

procedure TBuilderFriday<T>.AddList;
var
  I : Integer;
begin
  FStoresDTO.Business_Hours.Friday.Add(TFridayDTO.Create);
  I := FStoresDTO.Business_Hours.Friday.Count -1;
  FStoresDTO.Business_Hours.Friday[I].Open := FOpen;
  FStoresDTO.Business_Hours.Friday[I].Close := FClose;
end;

function TBuilderFriday<T>.Close(Value: String): iFriday<T>;
begin
  Result := Self;
  FClose := Value;
end;

constructor TBuilderFriday<T>.Create(Parent : T; Value : TStoresDTO);
begin
  FParent := Parent;
  FStoresDTO := Value;
end;

destructor TBuilderFriday<T>.Destroy;
begin

  inherited;
end;

function TBuilderFriday<T>.&End: T;
begin
  Result := FParent;
  AddList;
end;

class function TBuilderFriday<T>.New(Parent : T; Value : TStoresDTO): iFriday<T>;
begin
  Result := Self.Create(Parent, Value);
end;

function TBuilderFriday<T>.Open(Value: String): iFriday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

end.

