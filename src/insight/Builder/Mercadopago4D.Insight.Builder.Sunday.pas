unit Mercadopago4D.Insight.Builder.Sunday;

interface

uses
  Mercadopago4D.Insight.Builder.Interfaces, Mercadopago4D.Insight.DTO.Stores;

type
  TBuilderSunday<T : IInterface> = class(TInterfacedObject, iBuilderSunday<T>)
    private
      [weak]
      FParent : T;
      FRoot : TStoresDTO;
      FOpen : String;
      FClose : String;
      procedure AddList;
    public
      constructor Create(Parent : T; Root : TStoresDTO);
      destructor Destroy; override;
      class function New(Parent : T; Root : TStoresDTO) : iBuilderSunday<T>;
      function Open(Value : String) : iBuilderSunday<T>;
      function Close(Value : String) : iBuilderSunday<T>;
      function &End : T;
  end;

implementation

{ TBuilderSunday<T> }

procedure TBuilderSunday<T>.AddList;
var
  I: Integer;
begin
  FRoot.Business_hours.Sunday.Add(TSundayDTO.Create);
  I := FRoot.Business_hours.Sunday.Count -1;
  FRoot.Business_hours.Sunday[I].Open := FOpen;
  FRoot.Business_hours.Sunday[I].Close := FClose;
end;

function TBuilderSunday<T>.Close(Value: String): iBuilderSunday<T>;
begin
  Result := Self;
  FClose := Value;
end;

constructor TBuilderSunday<T>.Create(Parent: T; Root: TStoresDTO);
begin
  FParent := Parent;
  FRoot := Root;
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

class function TBuilderSunday<T>.New(Parent: T;
  Root: TStoresDTO): iBuilderSunday<T>;
begin
  Result := Self.Create(Parent, Root);
end;

function TBuilderSunday<T>.Open(Value: String): iBuilderSunday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

end.
