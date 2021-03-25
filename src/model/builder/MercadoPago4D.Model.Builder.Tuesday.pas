unit MercadoPago4D.Model.Builder.Tuesday;

interface

uses
  MercadoPago4D.Model.Builder.Interfaces,
  Mercadopago4D.Model.DTO.Stores;

type
  TBuilderTuesday<T : IInterface> = class(TInterfacedObject, iTuesday<T>)
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
      class function New(Parent : T; Value : TStoresDTO) : iTuesday<T>;
      function Open(Value : String) : iTuesday<T>;
      function Close(Value : String) : iTuesday<T>;
      function &End : T;
  end;

implementation

{ TBuilderTuesday<T> }

procedure TBuilderTuesday<T>.AddList;
var
  I : Integer;
begin
  FStoresDTO.Business_Hours.Tuesday.Add(TTuesdayDTO.Create);
  I := FStoresDTO.Business_Hours.Tuesday.Count -1;
  FStoresDTO.Business_Hours.Tuesday[I].Open := FOpen;
  FStoresDTO.Business_Hours.Tuesday[I].Close := FClose;
end;

function TBuilderTuesday<T>.Close(Value: String): iTuesday<T>;
begin
  Result := Self;
  FClose := Value;
end;

constructor TBuilderTuesday<T>.Create(Parent : T; Value : TStoresDTO);
begin
  FParent := Parent;
  FStoresDTO := Value;
end;

destructor TBuilderTuesday<T>.Destroy;
begin

  inherited;
end;

function TBuilderTuesday<T>.&End: T;
begin
  Result := FParent;
  AddList;
end;

class function TBuilderTuesday<T>.New(Parent : T; Value : TStoresDTO): iTuesday<T>;
begin
  Result := Self.Create(Parent, Value);
end;

function TBuilderTuesday<T>.Open(Value: String): iTuesday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

end.

