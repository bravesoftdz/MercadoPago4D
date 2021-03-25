unit MercadoPago4D.Services.AfterSales;

interface

uses
  MercadoPago4D.Services.Interfaces,
  MercadoPago4D.Core.Interfaces,
  RESTRequest4D,
  Data.DB,
  System.SysUtils, Mercadopago4D.Model.DTO.Partial,
  MercadoPago4D.Model.Builder.Interfaces;

type
  TAfterSales = class(TInterfacedObject, iAfterSales)
    private
      [weak]
      FParent : iConfiguration;
      FDataSet : TDataset;
      FContent : String;
      FStatusCode : Integer;
      FPaymentID : String;

      const
        EP_PAYMENTS = 'v1/payments/';
        EP_REFUNDS = '/refunds';

      procedure ReqResHTTP(vHTTP : THTTPServices; const URL : String; Body : String = '');
    public
      constructor Create(Parent : iConfiguration);
      destructor Destroy; override;
      class function New(Parent : iConfiguration) : iAfterSales;
      function PaymentID(Value : String) : iAfterSales;

      function ConsultPayment : iAfterSales;
      function SearchPayment : iAfterSales;
      function PaymentReturnRefund : iAfterSales;
      function ReturnPartialPaymentRefund(Value : iPartial) : iAfterSales;

      function DataSet(Value : TDataSet) : iAfterSales;
      function Content : String;
      function StatusCode : Integer;
  end;

implementation

function TAfterSales.ConsultPayment: iAfterSales;
begin
  Result := Self;
  ReqResHTTP(GET, FParent.Enviroment.BaseURL + EP_PAYMENTS + FPaymentID);
end;

function TAfterSales.Content: String;
begin
  Result := FContent;
end;

constructor TAfterSales.Create(Parent : iConfiguration);
begin
  FParent := Parent;
end;

function TAfterSales.DataSet(Value: TDataSet): iAfterSales;
begin
  Result := Self;
  FDataSet := Value;
end;

destructor TAfterSales.Destroy;
begin

  inherited;
end;

class function TAfterSales.New (Parent : iConfiguration) : iAfterSales;
begin
  Result := Self.Create(Parent);
end;

function TAfterSales.PaymentID(Value: String): iAfterSales;
begin
  Result := Self;
  FPaymentID := Value;
end;

function TAfterSales.PaymentReturnRefund: iAfterSales;
begin
  Result := Self;
  ReqResHTTP(POST, FParent.Enviroment.BaseURL + EP_PAYMENTS + FPaymentID + EP_REFUNDS);
end;

procedure TAfterSales.ReqResHTTP(vHTTP: THTTPServices; const URL: String;
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
        .Accept('application/json')
        .Token('Bearer '+ FParent.AccessToken);

    case vHTTP of
      GET: lResponse := lRequest.Get;
      POST: lResponse := lRequest.Post;
      PUT: lResponse := lRequest.Put;
      DELETE: lResponse := lRequest.Delete;
    end;

    FStatusCode := lResponse.StatusCode;
    FContent := lResponse.Content;
  except
    raise Exception.Create('Return Server Error ' + lResponse.StatusCode.ToString);
  end;
end;

function TAfterSales.ReturnPartialPaymentRefund(Value : iPartial) : iAfterSales;
begin
  Result := Self;
  ReqResHTTP(POST, FParent.Enviroment.BaseURL + EP_PAYMENTS + FPaymentID + EP_REFUNDS, Value.Content);
end;

function TAfterSales.SearchPayment: iAfterSales;
begin
  Result := Self;
  ReqResHTTP(GET, FParent.Enviroment.BaseURL + EP_PAYMENTS +
            'search?criteria=desc&sort=date_created');
end;

function TAfterSales.StatusCode: Integer;
begin
  Result := FStatusCode;
end;

end.
