unit MercadoPago4D.DTO.Builder.Monday;

interface

uses
  MercadoPago4D.DTO.Builder.Interfaces,
  Mercadopago4D.Insight.DTO.Stores;

type
  TBuilderMonday<T : IInterface> = class(TInterfacedObject, iBuilderMonday<T>)
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
      class function New(Parent : T; Stores : TStoresDTO) : iBuilderMonday<T>;
      function Open(Value : String) : iBuilderMonday<T>;
      function Close(Value : String) : iBuilderMonday<T>;
      function &End : T;
  end;

implementation

procedure TBuilderMonday<T>.AddList;
var
  I: Integer;
begin
  FStoresDTO.Business_hours.Monday.Add(TMondayDTO.Create);
  I := FStoresDTO.Business_hours.Monday.Count -1;
  FStoresDTO.Business_hours.Monday[I].Open := FOpen;
  FStoresDTO.Business_hours.Monday[I].Close := FClose;
end;

function TBuilderMonday<T>.Close(Value: String): iBuilderMonday<T>;
begin
  Result := Self;
  FClose := Value;
end;

function TBuilderMonday<T>.&End: T;
begin
  Result := FParent;
end;

constructor TBuilderMonday<T>.Create(Parent : T; Stores : TStoresDTO);
begin
  FParent := Parent;
  FStoresDTO := Stores;
end;

destructor TBuilderMonday<T>.Destroy;
begin

  inherited;
end;

class function TBuilderMonday<T>.New(Parent : T; Stores : TStoresDTO) : iBuilderMonday<T>;
begin
  Result := Self.Create(Parent, Stores);
end;

function TBuilderMonday<T>.Open(Value: String): iBuilderMonday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

end.

