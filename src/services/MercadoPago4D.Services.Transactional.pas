unit MercadoPago4D.Services.Transactional;

interface

uses
  MercadoPago4D.Services.Interfaces,
  MercadoPago4D.Core.Interfaces,
  RESTRequest4D,
  Data.DB,
  System.SysUtils,
  MercadoPago4D.Model.Builder.Interfaces;

type
  TTransactional = class(TInterfacedObject, iTransactional)
    private
      [weak]
      FParent : iConfiguration;
      FDataSet : TDataSet;
      FContent : String;
      FStatusCode : Integer;
      FExternalID : String;
      FPosID : String;
      FOrderID : String;
      FExternalRef : String;

      const
        EP_MPMOBILE = 'mpmobile/instore/qr/';
        EP_MO = 'merchant_orders/';

      procedure ReqResHTTP(vHTTP : THTTPServices; const URL : String; Body : String = '');
    public
      constructor Create(Parent : iConfiguration);
      destructor Destroy; override;
      class function New(Parent : iConfiguration) : iTransactional;
      function ExternalID(Value : String) : iTransactional;
      function PosID(Value : String) : iTransactional;
      function OrderID(Value : String) : iTransactional;
      function ExternalReference(Value : String) : iTransactional;

      function LoadOrderinQR(Value : iOrder) : iTransactional;
      function CheckQRAvailability : iTransactional;
      function DeleteOrderinQR : iTransactional;
      function ViewOrder : iTransactional;
      function SearchOrder : iTransactional;

      function DataSet(Value : TDataSet) : iTransactional;
      function Content : String;
      function StatusCode : Integer;
  end;

implementation

function TTransactional.CheckQRAvailability: iTransactional;
begin
  Result := Self;
  ReqResHTTP(GET,FParent.Enviroment.BaseURL + EP_MPMOBILE + FPosID);
end;

function TTransactional.Content: String;
begin
  Result := FContent;
end;

constructor TTransactional.Create(Parent : iConfiguration);
begin
  FParent := Parent;
end;

function TTransactional.DataSet(Value: TDataSet): iTransactional;
begin
  Result := Self;
  FDataSet := Value;
end;

function TTransactional.DeleteOrderinQR: iTransactional;
begin
  Result := Self;
  ReqResHTTP(DELETE, FParent.Enviroment.BaseURL + EP_MPMOBILE +
              FParent.ClientID + FExternalID);
end;

destructor TTransactional.Destroy;
begin

  inherited;
end;

function TTransactional.ExternalID(Value: String): iTransactional;
begin
  Result := Self;
  FExternalID := Value;
end;

function TTransactional.ExternalReference(Value: String): iTransactional;
begin
  Result := Self;
  FExternalRef := Value;
end;

function TTransactional.LoadOrderinQR(Value : iOrder) : iTransactional;
begin
  Result := Self;
  ReqResHTTP(POST, FParent.Enviroment.BaseURL + EP_MPMOBILE + FParent.ClientID +
            '/' + FExternalID, Value.Content);
end;

class function TTransactional.New (Parent : iConfiguration) : iTransactional;
begin
  Result := Self.Create(Parent);
end;

function TTransactional.OrderID(Value: String): iTransactional;
begin
  Result := Self;
  ReqResHTTP(GET,FParent.Enviroment.BaseURL + EP_MO +
              FOrderID);
end;

function TTransactional.PosID(Value: String): iTransactional;
begin
  Result := Self;
  FPosID := Value;
end;

procedure TTransactional.ReqResHTTP(vHTTP : THTTPServices; const URL : String; Body : String = '');
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
        .Accept('application/json')
        .Token('Bearer '+ FParent.AccessToken);

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

function TTransactional.SearchOrder: iTransactional;
begin
  Result := Self;
  ReqResHTTP(GET, FParent.Enviroment.BaseURL + EP_MO +
              '?external_reference' + FExternalRef);
end;

function TTransactional.StatusCode: Integer;
begin
  Result := FStatusCode;
end;

function TTransactional.ViewOrder: iTransactional;
begin
  Result :=Self;
  ReqResHTTP(GET, FParent.Enviroment.BaseURL + EP_MO + FOrderID);
end;

end.
