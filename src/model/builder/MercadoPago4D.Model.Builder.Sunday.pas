unit MercadoPago4D.Model.Builder.Sunday;

interface

uses
  MercadoPago4D.Model.Builder.Interfaces,
  Mercadopago4D.Model.DTO.Stores;

type
  TBuilderSunday<T : IInterface> = class(TInterfacedObject, iSunday<T>)
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
      class function New(Parent : T; Value : TStoresDTO) : iSunday<T>;
      function Open(Value : String) : iSunday<T>;
      function Close(Value : String) : iSunday<T>;
      function &End : T;
  end;

implementation

{ TBuilderSunday<T> }

procedure TBuilderSunday<T>.AddList;
var
  I : Integer;
begin
  FStoresDTO.Business_Hours.Sunday.Add(TSundayDTO.Create);
  I := FStoresDTO.Business_Hours.Sunday.Count -1;
  FStoresDTO.Business_Hours.Sunday[I].Open := FOpen;
  FStoresDTO.Business_Hours.Sunday[I].Close := FClose;
end;

function TBuilderSunday<T>.Close(Value: String): iSunday<T>;
begin
  Result := Self;
  FClose := Value;
end;

constructor TBuilderSunday<T>.Create(Parent : T; Value : TStoresDTO);
begin
  FParent := Parent;
  FStoresDTO := Value;
end;

destructor TBuilderSunday<T>.Destroy;
begin

  inherited;
end;

function TBuilderSunday<T>.&End: T;
begin
  Result := FParent;
  AddList;
end;

class function TBuilderSunday<T>.New(Parent : T; Value : TStoresDTO): iSunday<T>;
begin
  Result := Self.Create(Parent, Value);
end;

function TBuilderSunday<T>.Open(Value: String): iSunday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

end.

