unit Mercadopago4D.Model.DTO.QRCode;

interface

uses
  Pkg.Json.DTO,
  System.Generics.Collections,
  REST.Json.Types;

{$M+}

type
  TQrCodeDTO = class(TJsonDTO)
  private
    FExternal_id: string;
    FFixed_amount: Boolean;
    FName: string;
  published
    property External_id: string read FExternal_id write FExternal_id;
    property Fixed_amount: Boolean read FFixed_amount write FFixed_amount;
    property Name: string read FName write FName;
  end;
  
implementation

end.
