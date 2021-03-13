unit Mercadopago4D.Insight.Builder.Monday;

interface

uses
  Mercadopago4D.Insight.Builder.Interfaces, Mercadopago4D.Insight.DTO.Stores;

type

  TBuilderMonday<T : IInterface> = class(TInterfacedObject, iBuilderMonday<T>)
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
      class function New(Parent : T; Root : TStoresDTO) : iBuilderMonday<T>;
      function Open(Value : String) : iBuilderMonday<T>;
      function Close(Value : String) : iBuilderMonday<T>;
      function &End : T;
  end;

implementation

{ TBuilderMonday<T> }

procedure TBuilderMonday<T>.AddList;
var
  I : Integer;
begin
  FRoot.Business_hours.Monday.Add(TMondayDTO.Create);
  I := FRoot.Business_hours.Monday.Count -1;
  FRoot.Business_hours.Monday[I].Open := FOpen;
  FRoot.Business_hours.Monday[I].Close := FClose;
end;

function TBuilderMonday<T>.Close(Value: String): iBuilderMonday<T>;
begin
  Result := Self;
  FClose := Value;
end;

constructor TBuilderMonday<T>.Create(Parent: T; Root: TStoresDTO);
begin
  FParent := Parent;
  FRoot := Root;
end;

destructor TBuilderMonday<T>.Destroy;
begin

  inherited;
end;

function TBuilderMonday<T>.&End: T;
begin
  Result := FParent;
end;

class function TBuilderMonday<T>.New(Parent: T;
  Root: TStoresDTO): iBuilderMonday<T>;
begin
  Result := Self.Create(Parent, Root);
end;

function TBuilderMonday<T>.Open(Value: String): iBuilderMonday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

end.
