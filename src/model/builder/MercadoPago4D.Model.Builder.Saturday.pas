unit MercadoPago4D.Model.Builder.Saturday;

interface

uses
  MercadoPago4D.Model.Builder.Interfaces,
  Mercadopago4D.Model.DTO.Stores;

type
  TBuilderSaturday<T : IInterface> = class(TInterfacedObject, iSaturday<T>)
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
      class function New(Parent : T; Value : TStoresDTO) : iSaturday<T>;
      function Open(Value : String) : iSaturday<T>;
      function Close(Value : String) : iSaturday<T>;
      function &End : T;
  end;

implementation

{ TBuilderSaturday<T> }

procedure TBuilderSaturday<T>.AddList;
var
  I : Integer;
begin
  FStoresDTO.Business_Hours.Saturday.Add(TSaturdayDTO.Create);
  I := FStoresDTO.Business_Hours.Saturday.Count -1;
  FStoresDTO.Business_Hours.Saturday[I].Open := FOpen;
  FStoresDTO.Business_Hours.Saturday[I].Close := FClose;
end;

function TBuilderSaturday<T>.Close(Value: String): iSaturday<T>;
begin
  Result := Self;
  FClose := Value;
end;

constructor TBuilderSaturday<T>.Create(Parent : T; Value : TStoresDTO);
begin
  FParent := Parent;
  FStoresDTO := Value;
end;

destructor TBuilderSaturday<T>.Destroy;
begin

  inherited;
end;

function TBuilderSaturday<T>.&End: T;
begin
  Result := FParent;
  AddList;
end;

class function TBuilderSaturday<T>.New(Parent : T; Value : TStoresDTO): iSaturday<T>;
begin
  Result := Self.Create(Parent, Value);
end;

function TBuilderSaturday<T>.Open(Value: String): iSaturday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

end.

