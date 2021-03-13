unit MercadoPago4D.Resources.CreateUser;

interface

uses
  MercadoPago4D.Resources.Interfaces,
  Mercadopago4D.Insight.DTO.UserTest,
  RESTRequest4D,
  System.Classes,
  System.JSON,
  REST.Json,
  System.SysUtils,
  MercadoPago4D.Core.Interfaces;

type
  TCreateUser = class(TInterfacedObject, iGenerateUserTest)
    private
      FUser : TUserTest;
      FEnv : iEnviroment;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iGenerateUserTest;
      function Generate : iGenerateUserTest;
      function Content : String;
  end;

implementation

uses
  MercadoPago4D.Core.Enviroment;

function TCreateUser.Content: String;
begin
  Result := FUser.ToString;
end;

constructor TCreateUser.Create;
begin
  FUser := TUserTest.Create;
  FEnv := TEnviroment.New;
end;

function TCreateUser.Generate: iGenerateUserTest;
var
  json : Tjsonobject;
begin
  Result := Self;
  FUser := TJSON.JsonToObject<TUserTest>(
    TRequest.New
      .BaseURL(FEnv.Base_URL + '/users/test_user')
      .Accept('application/json')
      .AddBody('{"site_id":"MLB"}')
      .Post.Content);
end;

destructor TCreateUser.Destroy;
begin
  FUser.Free;
  inherited;
end;

class function TCreateUser.New : iGenerateUserTest;
begin
  Result := Self.Create;
end;

end.
