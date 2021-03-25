unit MercadoPago4D.Model.Builder.PaymentsMethod;

interface

uses
  MercadoPago4D.Model.Builder.Interfaces,
  Mercadopago4D.Model.DTO.Pedido;

type
  TPaymentsMethods<T : IInterface> = class(TInterfacedObject, iPaymentsMethods<T>)
    private
      [weak]
      FParent : T;
      FOrderDTO : TOrderDTO;

    public
      constructor Create(Parent : T; Value : TOrderDTO);
      destructor Destroy; override;
      class function New(Parent : T; Value : TOrderDTO) : iPaymentsMethods<T>;
      function Installments(Value : Integer) : iPaymentsMethods<T>;
      function &End : T;
  end;

implementation

function TPaymentsMethods<T>.&End: T;
begin
  Result := FParent;
end;

constructor TPaymentsMethods<T>.Create(Parent : T; Value : TOrderDTO);
begin
  FParent := Parent;
end;

destructor TPaymentsMethods<T>.Destroy;
begin

  inherited;
end;

function TPaymentsMethods<T>.Installments(Value: Integer): iPaymentsMethods<T>;
begin
  Result := Self;
  FOrderDTO.Payment_Methods.Installments := Value;
end;

class function TPaymentsMethods<T>.New(Parent : T; Value : TOrderDTO) : iPaymentsMethods<T>;
begin
  Result := Self.Create(Parent, Value);
end;

end.
