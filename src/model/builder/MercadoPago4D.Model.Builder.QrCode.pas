unit MercadoPago4D.Model.Builder.QrCode;

interface

uses
  MercadoPago4D.Model.Builder.Interfaces,
  Mercadopago4D.Model.DTO.QRCode,
  System.JSON,
  REST.Json;

type
  TQrCode = class(TInterfacedObject, iQrCode)
    private
      FQrCode : TQrCodeDTO;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iQrCode;
      function External_Id(Value : String) : iQrCode;
      function Fixed_Amount(Value : Boolean) : iQrCode;
      function Name(Value : String) : iQrCode;
      function Content : String;
      function &End : iQrCode;
  end;

implementation

function TQrCode.&End: iQrCode;
begin
  Result := Self;
end;

function TQrCode.Content: String;
var
  JSON : TJSONObject;
begin
  JSON := TJSON.ObjectToJsonObject(FQrCode);
  Result := JSON.format;
end;

constructor TQrCode.Create;
begin
  FQrCode := TQrCodeDTO.Create;
end;

destructor TQrCode.Destroy;
begin
  FQrCode.Free;
  inherited;
end;

function TQrCode.External_Id(Value: String): iQrCode;
begin
  Result := Self;
  FQrCode.External_Id := Value;
end;

function TQrCode.Fixed_Amount(Value: Boolean): iQrCode;
begin
  Result := Self;
  FQrCode.Fixed_Amount := Value;
end;

function TQrCode.Name(Value: String): iQrCode;
begin
  Result := Self;
  FQrCode.Name := Value;
end;

class function TQrCode.New : iQrCode;
begin
  Result := Self.Create;
end;

end.
