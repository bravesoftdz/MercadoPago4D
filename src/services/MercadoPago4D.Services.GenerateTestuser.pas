unit MercadoPago4D.Services.GenerateTestuser;

interface

uses
  MercadoPago4D.Services.Interfaces,
  MercadoPago4D.Core.Interfaces,
  Data.DB,
  RESTRequest4D,
  System.SysUtils,
  MercadoPago4D.Model.Builder.Interfaces;

type
  TGenerateTestUser = class(TInterfacedObject, iGenerateTestUser)
    private
      [weak]
      FParent : iConfiguration;
      FDataSet : TDataSet;
      FContent : String;
      FStatusCode : Integer;

      const
        EP_USERS = 'users/test_user';

      procedure ReqResHTTP(vHTTP : THTTPServices; const URL : String; Body : String = '');
    public
      constructor Create(Parent : iCOnfiguration);
      destructor Destroy; override;
      class function New(Parent : iConfiguration) : iGenerateTestUser;
      function GenerateTestUser(Value : iTestUser) : iGenerateTestUser;

      function DataSet(Value : TDataSet) : iGenerateTestUser;
      function Content : String;
      function StatusCode : Integer;
  end;

implementation

function TGenerateTestUser.Content: String;
begin
  Result := FContent;
end;

constructor TGenerateTestUser.Create(Parent : iCOnfiguration);
begin
  FParent := Parent;
end;

function TGenerateTestUser.DataSet(Value: TDataSet): iGenerateTestUser;
begin
  Result := Self;
  FDataSet := Value;
end;

destructor TGenerateTestUser.Destroy;
begin

  inherited;
end;

function TGenerateTestUser.GenerateTestUser(Value : iTestUser) : iGenerateTestUser;
begin
  Result := Self;
  ReqResHTTP(POST, FParent.Enviroment.BaseURL + EP_USERS, Value.Content);
end;

class function TGenerateTestUser.New (Parent : iConfiguration) : iGenerateTestUser;
begin
  Result := Self.Create(Parent);
end;

procedure TGenerateTestUser.ReqResHTTP(vHTTP: THTTPServices; const URL: String;
  Body: String);
var
  lRequest : iRequest;
  lResponse : iResponse;
begin
  lRequest := TRequest.New;
  try
    if Assigned(FDataSet) then
      lRequest.DataSetAdapter(FDataSet);

    lRequest
        .BaseURL(URL)
        .Accept('application/json');

    case vHTTP of
      GET: lResponse := lRequest.Get;
      POST: begin
        lRequest.AddBody(Body);
        lResponse := lRequest.Post;
      end;
      PUT: begin
        lRequest.AddBody(Body);
        lResponse := lRequest.Put;
      end;
      DELETE: lResponse := lRequest.Delete;
    end;

    FStatusCode := lResponse.StatusCode;
    FContent := lResponse.Content;
  except
    raise Exception.Create('Return Server Error ' + lResponse.StatusCode.ToString);
  end;
end;

function TGenerateTestUser.StatusCode: Integer;
begin
  Result := FStatusCode;
end;

end.
