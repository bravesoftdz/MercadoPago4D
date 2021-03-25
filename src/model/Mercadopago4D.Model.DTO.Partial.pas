unit Mercadopago4D.Model.DTO.Partial;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TPartialDTO = class(TJsonDTO)
  private
    FAmount: Double;
  published
    property Amount: Double read FAmount write FAmount;
  end;
  
implementation

end.
