unit MercadoPago4D.Model.Builder.TestUser;

interface

uses
  MercadoPago4D.Model.Builder.Interfaces,
  Mercadopago4D.Model.DTO.Test_user,
  System.JSON,
  REST.Json;

type
  TTesteUser = class(TInterfacedObject, iTestUser)
    private
      FTestUserDTO : TTestUserDTO;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iTestUser;
      function SiteID(Value : String) : iTestUser;
      function Content : String;
      function &End : iTestUser;
  end;

implementation

function TTesteUser.Content: String;
var
  JSON : TJSONObject;
begin
  JSON := TJSON.ObjectToJsonObject(FTestUserDTO);
  Result := JSON.format;
end;

function TTesteUser.&End: iTestUser;
begin
  Result := Self;
end;

constructor TTesteUser.Create;
begin
  FTestUserDTO := TTestUserDTO.Create;
end;

destructor TTesteUser.Destroy;
begin
  FTestUserDTO.Free;
  inherited;
end;

class function TTesteUser.New : iTestUser;
begin
  Result := Self.Create;
end;

function TTesteUser.SiteID(Value: String): iTestUser;
begin
  Result := Self;
  FTestUserDTO.Site_Id := Value;
end;

end.
