unit Mercadopago4D.Insight.DTO.UserTest;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TUserTest = class(TJsonDTO)
  private
    FEmail: string;
    FId: Integer;
    FNickname: string;
    FPassword: string;
    FSite_Status: string;
  published
    property Email: string read FEmail write FEmail;
    property Id: Integer read FId write FId;
    property Nickname: string read FNickname write FNickname;
    property Password: string read FPassword write FPassword;
    property Site_Status: string read FSite_Status write FSite_Status;
  end;
  
implementation

end.
