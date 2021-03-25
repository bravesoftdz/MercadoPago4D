unit MercadoPago4D.Model.Builder.Partial;

interface

uses
  MercadoPago4D.Model.Builder.Interfaces,
  Mercadopago4D.Model.DTO.Partial,
  System.JSON,
  REST.Json;

type
  TPartial = class(TInterfacedObject, iPartial)
    private
      FPartialDTO : TPartialDTO;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iPartial;
      function Amount(Value : Double) : iPartial;
      function Content : String;
      function &End : iPartial;
  end;

implementation

function TPartial.&End: iPartial;
begin
  Result := Self;
end;

function TPartial.Amount(Value: Double): iPartial;
begin
  Result := Self;
  FPartialDTO.Amount := Value;
end;

function TPartial.Content: String;
var
  JSON : TJSONObject;
begin
  JSON := TJSON.ObjectToJsonObject(FPartialDTO);
  Result := JSON.format;
end;

constructor TPartial.Create;
begin
  FPartialDTO := TPartialDTO.Create;
end;

destructor TPartial.Destroy;
begin
  FPartialDTO.Free;
  inherited;
end;

class function TPartial.New : iPartial;
begin
  Result := Self.Create;
end;

end.
