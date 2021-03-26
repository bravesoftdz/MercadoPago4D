unit MercadoPago4D.Model.Builder.Order;

interface

uses
  MercadoPago4D.Model.Builder.Interfaces,
  Mercadopago4D.Model.DTO.Pedido, MercadoPago4D.Model.Builder.Items,
  MercadoPago4D.Model.Builder.PaymentsMethod, System.JSON, REST.Json;

type
  TOrder = class(TInterfacedObject, iOrder)
    private
      FOrderDTO : TOrderDTO;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iOrder;
      function External_Reference(Value : String) : iOrder;
      function Items : iItems<iOrder>;
      function Notification_Url(Value : String) : iOrder;
      function Payment_Methods : iPaymentsMethods<iOrder>;
      function Content : String;
      function &End : iOrder;
  end;

implementation

function TOrder.Content: String;
var
  JSON : TJSONObject;
begin
  JSON := TJSON.ObjectToJsonObject(FOrderDTO);
  Result := JSON.format;
end;

function TOrder.&End: iOrder;
begin
  Result := Self;
end;

constructor TOrder.Create;
begin
  FOrderDTO := TOrderDTO.Create;
end;

destructor TOrder.Destroy;
begin
  FOrderDTO.Free;
  inherited;
end;

function TOrder.External_Reference(Value : String) : iOrder;
begin
  Result := Self;
  FOrderDTO.External_Reference := Value;
end;

function TOrder.Items: iItems<iOrder>;
begin
  Result := TITems<iOrder>.New(Self, FOrderDTO);
end;

class function TOrder.New : iOrder;
begin
  Result := Self.Create;
end;

function TOrder.Notification_Url(Value : String) : iOrder;
begin
  Result := Self;
  FOrderDTO.Notification_Url := Value;
end;

function TOrder.Payment_Methods: iPaymentsMethods<iOrder>;
begin
  Result := TPaymentsMethods<iOrder>.New(Self, FOrderDTO);
end;

end.
