unit MercadoPago4D.DTO.Builder.Saturday;

interface

uses
  MercadoPago4D.DTO.Builder.Interfaces,
  Mercadopago4D.Insight.DTO.Stores;

type
  TBuilderSaturday<T : IInterface> = class(TInterfacedObject, iBuilderSaturday<T>)
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
      class function New(Parent : T; Stores : TStoresDTO) : iBuilderSaturday<T>;
      function Open(Value : String) : iBuilderSaturday<T>; overload;
      function Close(Value : String) : iBuilderSaturday<T>; overload;
      function Open : String; overload;
      function Close : String; overload;
      function &End : T;
  end;

implementation

procedure TBuilderSaturday<T>.AddList;
var
  I: Integer;
begin
  FStoresDTO.Business_hours.Saturday.Add(TSaturdayDTO.Create);
  I := FStoresDTO.Business_hours.Saturday.Count -1;
  FStoresDTO.Business_hours.Saturday[I].Open := FOpen;
  FStoresDTO.Business_hours.Saturday[I].Close := FClose;
end;

function TBuilderSaturday<T>.Close(Value: String): iBuilderSaturday<T>;
begin
  Result := Self;
  FClose := Value;
end;

function TBuilderSaturday<T>.&End: T;
begin
  Result := FParent;
end;

function TBuilderSaturday<T>.Close: String;
begin
  Result := FClose;
end;

constructor TBuilderSaturday<T>.Create(Parent : T; Stores : TStoresDTO);
begin
  FParent := Parent;
  FStoresDTO := Stores;
end;

destructor TBuilderSaturday<T>.Destroy;
begin

  inherited;
end;

class function TBuilderSaturday<T>.New(Parent : T; Stores : TStoresDTO) : iBuilderSaturday<T>;
begin
  Result := Self.Create(Parent, Stores);
end;

function TBuilderSaturday<T>.Open: String;
begin
  Result := FOpen;
end;

function TBuilderSaturday<T>.Open(Value: String): iBuilderSaturday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

end.

