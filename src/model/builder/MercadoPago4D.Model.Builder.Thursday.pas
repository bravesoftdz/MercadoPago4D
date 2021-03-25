unit MercadoPago4D.Model.Builder.Thursday;

interface

uses
  MercadoPago4D.Model.Builder.Interfaces,
  Mercadopago4D.Model.DTO.Stores;

type
  TBuilderThursday<T : IInterface> = class(TInterfacedObject, iThursday<T>)
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
      class function New(Parent : T; Value : TStoresDTO) : iThursday<T>;
      function Open(Value : String) : iThursday<T>;
      function Close(Value : String) : iThursday<T>;
      function &End : T;
  end;

implementation

{ TBuilderThursday<T> }

procedure TBuilderThursday<T>.AddList;
var
  I : Integer;
begin
  FStoresDTO.Business_Hours.Thursday.Add(TThursdayDTO.Create);
  I := FStoresDTO.Business_Hours.Thursday.Count -1;
  FStoresDTO.Business_Hours.Thursday[I].Open := FOpen;
  FStoresDTO.Business_Hours.Thursday[I].Close := FClose;
end;

function TBuilderThursday<T>.Close(Value: String): iThursday<T>;
begin
  Result := Self;
  FClose := Value;
end;

constructor TBuilderThursday<T>.Create(Parent : T; Value : TStoresDTO);
begin
  FParent := Parent;
  FStoresDTO := Value;
end;

destructor TBuilderThursday<T>.Destroy;
begin

  inherited;
end;

function TBuilderThursday<T>.&End: T;
begin
  Result := FParent;
  AddList;
end;

class function TBuilderThursday<T>.New(Parent : T; Value : TStoresDTO): iThursday<T>;
begin
  Result := Self.Create(Parent, Value);
end;

function TBuilderThursday<T>.Open(Value: String): iThursday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

end.

