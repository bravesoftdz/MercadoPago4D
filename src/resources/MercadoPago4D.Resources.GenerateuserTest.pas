unit MercadoPago4D.Resources.GenerateuserTest;

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
  TGenerateuserTest = class(TInterfacedObject, iGenerateUserTest)
    private
      [weak]
      FParent : iMercadoPago4DConfiguration;
      FUser : TUserTest;
      FEnv : iEnviroment;

      CONST
        CREAT_USER = '/users/test_user';
    public
      constructor Create(Parent : iMercadoPago4DConfiguration);
      destructor Destroy; override;
      class function New(Parent : iMercadoPago4DConfiguration) : iGenerateUserTest;
      function Generate(AccesToken : String) : iGenerateUserTest;
      function Content : String;
  end;

implementation

uses
  MercadoPago4D.Core.Enviroment;

function TGenerateuserTest.Content: String;
begin
  Result := FUser.ToString;
end;

constructor TGenerateuserTest.Create(Parent : iMercadoPago4DConfiguration);
begin
  FParent := Parent;
  FUser := TUserTest.Create;
end;

function TGenerateuserTest.Generate(AccesToken : String) : iGenerateUserTest;
var
  json : Tjsonobject;
begin
  Result := Self;
  FUser := TJSON.JsonToObject<TUserTest>(
    TRequest.New
      .BaseURL(FEnv.Base_URL + CREAT_USER)
      .Accept('application/json')
      .Token(FParent.AccessToken)
      .AddBody('{"site_id":"MLB"}')
      .Post.Content);
end;

destructor TGenerateuserTest.Destroy;
begin
  FUser.Free;
  inherited;
end;

class function TGenerateuserTest.New (Parent : iMercadoPago4DConfiguration) : iGenerateUserTest;
begin
  Result := Self.Create(Parent);
end;

end.
