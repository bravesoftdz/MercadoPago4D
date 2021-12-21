unit MercadoPago4D.Model.Builder.Sponsor;

interface

uses
  MercadoPago4D.Model.Builder.Interfaces,
  Mercadopago4D.Model.DTO.Pedido;

type
  TSponsor<T : IInterface> = class(TInterfacedObject, iSponsor<T>)
    private
      [weak]
      FParent : T;
      FOrderDTO : TOrderDTO;

    public
      constructor Create(Parent : T; Value : TOrderDTO);
      destructor Destroy; override;
      class function New(Parent : T; Value : TOrderDTO) : iSponsor<T>;
      function Id(Value : Int64) : iSponsor<T>;
      function &End : T;
  end;

implementation

function TSponsor<T>.&End: T;
begin
  Result := FParent;
end;

constructor TSponsor<T>.Create(Parent : T; Value : TOrderDTO);
begin
  FParent := Parent;
  FOrderDTO := Value;
end;

destructor TSponsor<T>.Destroy;
begin

  inherited;
end;

function TSponsor<T>.Id(Value: Int64): iSponsor<T>;
begin
  Result := Self;
  FOrderDTO.Sponsor.Id := Value;
end;

class function TSponsor<T>.New(Parent : T; Value : TOrderDTO) : iSponsor<T>;
begin
  Result := Self.Create(Parent, Value);
end;

end.
