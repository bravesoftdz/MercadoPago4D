unit MercadoPago4D.DTO.Builder.Wednesday;

interface

uses
  MercadoPago4D.DTO.Builder.Interfaces,
  Mercadopago4D.Insight.DTO.Stores;

type
  TBuilderWednesday<T : IInterface> = class(TInterfacedObject, iBuilderWednesday<T>)
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
      class function New(Parent : T; Stores : TStoresDTO) : iBuilderWednesday<T>;
      function Open(Value : String) : iBuilderWednesday<T>; overload;
      function Close(Value : String) : iBuilderWednesday<T>; overload;
      function Open : String; overload;
      function Close : String; overload;
      function &End : T;
  end;

implementation

procedure TBuilderWednesday<T>.AddList;
var
  I: Integer;
begin
  FStoresDTO.Business_hours.Wednesday.Add(TWednesdayDTO.Create);
  I := FStoresDTO.Business_hours.Wednesday.Count -1;
  FStoresDTO.Business_hours.Wednesday[I].Open := FOpen;
  FStoresDTO.Business_hours.Wednesday[I].Close := FClose;
end;

function TBuilderWednesday<T>.Close(Value: String): iBuilderWednesday<T>;
begin
  Result := Self;
  FClose := Value;
end;

function TBuilderWednesday<T>.&End: T;
begin
  Result := FParent;
end;

function TBuilderWednesday<T>.Close: String;
begin
  Result := FClose;
end;

constructor TBuilderWednesday<T>.Create(Parent : T; Stores : TStoresDTO);
begin
  FParent := Parent;
  FStoresDTO := Stores;
end;

destructor TBuilderWednesday<T>.Destroy;
begin

  inherited;
end;

class function TBuilderWednesday<T>.New(Parent : T; Stores : TStoresDTO) : iBuilderWednesday<T>;
begin
  Result := Self.Create(Parent, Stores);
end;

function TBuilderWednesday<T>.Open: String;
begin
  Result := FOpen;
end;

function TBuilderWednesday<T>.Open(Value: String): iBuilderWednesday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

end.

