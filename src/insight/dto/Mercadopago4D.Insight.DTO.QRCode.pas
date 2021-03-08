unit Mercadopago4D.Insight.DTO.QRCode;

interface

uses
  Pkg.Json.DTO,
  System.Generics.Collections,
  REST.Json.Types;

{$M+}

type
  TRootDTO = class(TJsonDTO)
  private
    FExternal_Id: string;
    FFixed_Amount: Boolean;
    FName: string;
  published
    property External_Id: string read FExternal_Id write FExternal_Id;
    property Fixed_Amount: Boolean read FFixed_Amount write FFixed_Amount;
    property Name: string read FName write FName;
  end;
  
implementation

end.
