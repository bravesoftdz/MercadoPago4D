unit MercadoPago4D.DTO.Builder.Tuesday;

interface

uses
  MercadoPago4D.DTO.Builder.Interfaces,
  Mercadopago4D.Insight.DTO.Stores;

type
  TBuilderTuesday<T : IInterface> = class(TInterfacedObject, iBuilderTuesday<T>)
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
      class function New(Parent : T; Stores : TStoresDTO) : iBuilderTuesday<T>;
      function Open(Value : String) : iBuilderTuesday<T>; overload;
      function Close(Value : String) : iBuilderTuesday<T>; overload;
      function Open : String; overload;
      function Close : String; overload;
      function &End : T;
  end;

implementation

procedure TBuilderTuesday<T>.AddList;
var
  I: Integer;
begin
  FStoresDTO.Business_hours.Tuesday.Add(TTuesdayDTO.Create);
  I := FStoresDTO.Business_hours.Tuesday.Count -1;
  FStoresDTO.Business_hours.Tuesday[I].Open := FOpen;
  FStoresDTO.Business_hours.Tuesday[I].Close := FClose;
end;

function TBuilderTuesday<T>.Close(Value: String): iBuilderTuesday<T>;
begin
  Result := Self;
  FClose := Value;
end;

function TBuilderTuesday<T>.&End: T;
begin
  Result := FParent;
end;

function TBuilderTuesday<T>.Close: String;
begin
  Result := FClose;
end;

constructor TBuilderTuesday<T>.Create(Parent : T; Stores : TStoresDTO);
begin
  FParent := Parent;
  FStoresDTO := Stores;
end;

destructor TBuilderTuesday<T>.Destroy;
begin

  inherited;
end;

class function TBuilderTuesday<T>.New(Parent : T; Stores : TStoresDTO) : iBuilderTuesday<T>;
begin
  Result := Self.Create(Parent, Stores);
end;

function TBuilderTuesday<T>.Open: String;
begin
  Result := FOpen;
end;

function TBuilderTuesday<T>.Open(Value: String): iBuilderTuesday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

end.

