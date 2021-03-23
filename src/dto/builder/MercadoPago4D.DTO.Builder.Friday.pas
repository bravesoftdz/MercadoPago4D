unit MercadoPago4D.DTO.Builder.Friday;

interface

uses
  MercadoPago4D.DTO.Builder.Interfaces,
  Mercadopago4D.Insight.DTO.Stores;

type
  TBuilderFriday<T : IInterface> = class(TInterfacedObject, iBuilderFriday<T>)
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
      class function New(Parent : T; Stores : TStoresDTO) : iBuilderFriday<T>;
      function Open(Value : String) : iBuilderFriday<T>; overload;
      function Close(Value : String) : iBuilderFriday<T>; overload;
      function Open : String; overload;
      function Close : String; overload;
      function &End : T;
  end;

implementation

procedure TBuilderFriday<T>.AddList;
var
  I: Integer;
begin
  FStoresDTO.Business_hours.Friday.Add(TFridayDTO.Create);
  I := FStoresDTO.Business_hours.Friday.Count -1;
  FStoresDTO.Business_hours.Friday[I].Open := FOpen;
  FStoresDTO.Business_hours.Friday[I].Close := FClose;
end;

function TBuilderFriday<T>.Close(Value: String): iBuilderFriday<T>;
begin
  Result := Self;
  FClose := Value;
end;

function TBuilderFriday<T>.&End: T;
begin
  Result := FParent;
end;

function TBuilderFriday<T>.Close: String;
begin
  Result := FClose;
end;

constructor TBuilderFriday<T>.Create(Parent : T; Stores : TStoresDTO);
begin
  FParent := Parent;
  FStoresDTO := Stores;
end;

destructor TBuilderFriday<T>.Destroy;
begin

  inherited;
end;

class function TBuilderFriday<T>.New(Parent : T; Stores : TStoresDTO) : iBuilderFriday<T>;
begin
  Result := Self.Create(Parent, Stores);
end;

function TBuilderFriday<T>.Open: String;
begin
  Result := FOpen;
end;

function TBuilderFriday<T>.Open(Value: String): iBuilderFriday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

end.

