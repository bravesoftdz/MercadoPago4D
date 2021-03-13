unit Mercadopago4D.Insight.Builder.Friday;

interface

uses
  Mercadopago4D.Insight.Builder.Interfaces, Mercadopago4D.Insight.DTO.Stores;

type

  TBuilderFriday<T : IInterface> = class(TInterfacedObject, iBuilderFriday<T>)
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
      class function New(Parent : T; Root : TStoresDTO) : iBuilderFriday<T>;
      function Open(Value : String) : iBuilderFriday<T>;
      function Close(Value : String) : iBuilderFriday<T>;
      function &End : T;
  end;

implementation

{ TBuilderFriday<T> }

procedure TBuilderFriday<T>.AddList;
var
  I : Integer;
begin
FRoot.Business_hours.Sunday.Add(TSundayDTO.Create);
  I := FRoot.Business_hours.Friday.Count -1;
  FRoot.Business_hours.Friday[I].Open := FOpen;
  FRoot.Business_hours.Friday[I].Close := FClose;
end;

function TBuilderFriday<T>.Close(Value: String): iBuilderFriday<T>;
begin
  Result := Self;
  FClose := Value;
end;

constructor TBuilderFriday<T>.Create(Parent: T; Root: TStoresDTO);
begin
  FParent := Parent;
  FRoot := Root;
end;

destructor TBuilderFriday<T>.Destroy;
begin

  inherited;
end;

function TBuilderFriday<T>.&End: T;
begin
  Result := FParent;
end;

class function TBuilderFriday<T>.New(Parent: T;
  Root: TStoresDTO): iBuilderFriday<T>;
begin
  Result := Self.Create(Parent, Root);
end;

function TBuilderFriday<T>.Open(Value: String): iBuilderFriday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

end.
