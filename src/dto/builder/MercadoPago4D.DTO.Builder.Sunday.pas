unit MercadoPago4D.DTO.Builder.Sunday;

interface

uses
  MercadoPago4D.DTO.Builder.Interfaces, Mercadopago4D.Insight.DTO.Stores;

type
  TBuilderSunday<T : IInterface> = class(TInterfacedObject, iBuilderSunday<T>)
    private
      [weak]
      FParent : T;
      FStoresDTO : TStoresDTO;
      FOpen : String;
      FClose : String;
      procedure AddList;
    public
      constructor Create(Parent : T; Stores : TStoresDTO);
      destructor Destroy; override;
      class function New(Parent : T; Stores : TStoresDTO) : iBuilderSunday<T>;
      function Open(Value : String) : iBuilderSunday<T>;
      function Close(Value : String) : iBuilderSunday<T>;
      function &End : T;
  end;

implementation

procedure TBuilderSunday<T>.AddList;
var
  I: Integer;
begin
  FStoresDTO.Business_hours.Sunday.Add(TSundayDTO.Create);
  I := FStoresDTO.Business_hours.Sunday.Count -1;
  FStoresDTO.Business_hours.Sunday[I].Open := FOpen;
  FStoresDTO.Business_hours.Sunday[I].Close := FClose;
end;

function TBuilderSunday<T>.Close(Value: String): iBuilderSunday<T>;
begin
  Result := Self;
  FClose := Value;
end;

function TBuilderSunday<T>.&End: T;
begin
  Result := FParent;
end;

constructor TBuilderSunday<T>.Create(Parent : T; Stores : TStoresDTO);
begin
  FParent := Parent;
  FStoresDTO := Stores;
end;

destructor TBuilderSunday<T>.Destroy;
begin

  inherited;
end;

class function TBuilderSunday<T>.New(Parent : T; Stores : TStoresDTO) : iBuilderSunday<T>;
begin
  Result := Self.Create(Parent, Stores);
end;

function TBuilderSunday<T>.Open(Value: String): iBuilderSunday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

end.
