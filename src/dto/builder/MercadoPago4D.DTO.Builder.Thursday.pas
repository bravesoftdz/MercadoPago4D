unit MercadoPago4D.DTO.Builder.Thursday;

interface

uses
  MercadoPago4D.DTO.Builder.Interfaces,
  Mercadopago4D.Insight.DTO.Stores;

type
  TBuilderThursday<T : IInterface> = class(TInterfacedObject, iBuilderThursday<T>)
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
      class function New(Parent : T; Stores : TStoresDTO) : iBuilderThursday<T>;
      function Open(Value : String) : iBuilderThursday<T>;
      function Close(Value : String) : iBuilderThursday<T>;
      function &End : T;
  end;

implementation

procedure TBuilderThursday<T>.AddList;
var
  I: Integer;
begin
  FStoresDTO.Business_hours.Thursday.Add(TThursdayDTO.Create);
  I := FStoresDTO.Business_hours.Thursday.Count -1;
  FStoresDTO.Business_hours.Thursday[I].Open := FOpen;
  FStoresDTO.Business_hours.Thursday[I].Close := FClose;
end;

function TBuilderThursday<T>.Close(Value: String): iBuilderThursday<T>;
begin
  Result := Self;
  FClose := Value;
end;

function TBuilderThursday<T>.&End: T;
begin
  Result := FParent;
end;

constructor TBuilderThursday<T>.Create(Parent : T; Stores : TStoresDTO);
begin
  FParent := Parent;
  FStoresDTO := Stores;
end;

destructor TBuilderThursday<T>.Destroy;
begin

  inherited;
end;

class function TBuilderThursday<T>.New(Parent : T; Stores : TStoresDTO) : iBuilderThursday<T>;
begin
  Result := Self.Create(Parent, Stores);
end;

function TBuilderThursday<T>.Open(Value: String): iBuilderThursday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

end.

