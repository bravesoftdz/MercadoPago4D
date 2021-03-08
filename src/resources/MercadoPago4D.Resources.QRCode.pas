unit MercadoPago4D.Resources.QRCode;

interface

uses
  MercadoPago4D.Resources.Interfaces;

type
  TQRCode = class(TInterfacedObject, iQRCode)
    private
      FExternalId : String;
      FQRId : String;
      FPosID : String;
      FSize : String;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iQRCode;
      function CreateQRCode : iQRCode;
      function UpdateQRCOde : iQRCode;
      function SearchQRCode : iQRCode;
      function SearchQRCodeId : iQRCode;
      function DelQRCode : iQRCode;
      function PrintQRCode : iQRCode;
      function ExternalId(Value : String) : iQRCode;
      function QRId(Value : String) : iQRCode;
      function PosID(Value : String) : iQRCode;
      function Size(Value : String) : iQRCode;
  end;

implementation

constructor TQRCode.Create;
begin

end;

function TQRCode.CreateQRCode: iQRCode;
begin
  Result := Self;
end;

function TQRCode.DelQRCode: iQRCode;
begin
  Result := Self;
end;

destructor TQRCode.Destroy;
begin

  inherited;
end;

function TQRCode.ExternalId(Value: String): iQRCode;
begin
  Result := Self;
  FExternalId := Value;
end;

class function TQRCode.New : iQRCode;
begin
  Result := Self.Create;
end;

function TQRCode.PosID(Value: String): iQRCode;
begin
  Result := Self;
  FPosID := Value;
end;

function TQRCode.PrintQRCode: iQRCode;
begin
  Result := Self;
end;

function TQRCode.QRId(Value: String): iQRCode;
begin
  Result := Self;
  FQRId := Value;
end;

function TQRCode.SearchQRCode: iQRCode;
begin
  Result := Self;
end;

function TQRCode.SearchQRCodeId: iQRCode;
begin
  Result := Self;
end;

function TQRCode.Size(Value: String): iQRCode;
begin
  Result := Self;
  FSize := Value;
end;

function TQRCode.UpdateQRCOde: iQRCode;
begin
  Result := Self;
end;

end.
