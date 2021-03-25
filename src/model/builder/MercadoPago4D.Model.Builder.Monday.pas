unit MercadoPago4D.Model.Builder.Monday;

interface

uses
  MercadoPago4D.Model.Builder.Interfaces,
  Mercadopago4D.Model.DTO.Stores;

type
  TBuilderMonday<T : IInterface> = class(TInterfacedObject, iMonday<T>)
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
      class function New(Parent : T; Value : TStoresDTO) : iMonday<T>;
      function Open(Value : String) : iMonday<T>;
      function Close(Value : String) : iMonday<T>;
      function &End : T;
  end;

implementation

{ TBuilderMonday<T> }

procedure TBuilderMonday<T>.AddList;
var
  I : Integer;
begin
  FStoresDTO.Business_Hours.Monday.Add(TMondayDTO.Create);
  I := FStoresDTO.Business_Hours.Monday.Count -1;
  FStoresDTO.Business_Hours.Monday[I].Open := FOpen;
  FStoresDTO.Business_Hours.Monday[I].Close := FClose;
end;

function TBuilderMonday<T>.Close(Value: String): iMonday<T>;
begin
  Result := Self;
  FClose := Value;
end;

constructor TBuilderMonday<T>.Create(Parent : T; Value : TStoresDTO);
begin
  FParent := Parent;
  FStoresDTO := Value;
end;

destructor TBuilderMonday<T>.Destroy;
begin

  inherited;
end;

function TBuilderMonday<T>.&End: T;
begin
  Result := FParent;
  AddList;
end;

class function TBuilderMonday<T>.New(Parent : T; Value : TStoresDTO): iMonday<T>;
begin
  Result := Self.Create(Parent, Value);
end;

function TBuilderMonday<T>.Open(Value: String): iMonday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

end.
