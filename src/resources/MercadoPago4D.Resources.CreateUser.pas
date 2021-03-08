unit MercadoPago4D.Resources.CreateUser;

interface

uses
  MercadoPago4D.Resources.Interfaces,
  Mercadopago4D.Insight.DTO.UserTest,
  RESTRequest4D,
  System.Classes,
  System.JSON,
  REST.Json,
  System.SysUtils;

type
  TCreateUser = class(TInterfacedObject, iCreateUser)
    private

      FUser : TUserTest;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iCreateUser;
      function ListaInfo : String;
      function CreateUser : iCreateUser;
  end;

implementation

constructor TCreateUser.Create;
begin
  FUser := TUserTest.Create;
end;

function TCreateUser.CreateUser: iCreateUser;
var
  json : Tjsonobject;
begin
  Result := Self;
  FUser := TJSON.JsonToObject<TUserTest>(
    TRequest.New
      .BaseURL('/users/test_user')
      .Accept('application/json')
      .AddBody('{"site_id":"MLB"}')
      .Post.Content);
end;

destructor TCreateUser.Destroy;
begin
  FUser.Free;
  inherited;
end;

function TCreateUser.ListaInfo: String;
var
  Lista : TStringList;
begin
  Lista := TStringList.Create;
  try
    Lista.Add('ID: ' + FUser.Id.ToString);
    Lista.Add('Email: ' + FUser.Email);
    Lista.Add('Password: ' + FUser.Password);
    Result := Lista.Text;
  finally
    Lista.Free;
  end;
end;

class function TCreateUser.New : iCreateUser;
begin
  Result := Self.Create;
end;

end.
