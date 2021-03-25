unit Mercadopago4D.Model.DTO.Test_user;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TTestUserDTO = class(TJsonDTO)
  private
    FSite_Id: string;
  published
    property Site_Id: string read FSite_Id write FSite_Id;
  end;
  
implementation

end.
