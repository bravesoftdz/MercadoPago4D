unit MercadoPago4D.Services.Accreditation;

interface

uses
  MercadoPago4D.Services.Interfaces,
  MercadoPago4D.Core.Interfaces,
  MercadoPago4D.Model.Builder.Interfaces,
  MercadoPago4D.Model.Builder.Stores,
  RESTRequest4D,
  System.SysUtils,
  Data.DB,
  System.Classes;

type
  TAccreditation = class(TInterfacedObject, iAccreditation)
    private
      [weak]
      FParent : iConfiguration;
      FStoreID : String;
      FQrID : String;
      FExternalID : String;
      FPosID : String;
      FSize : String;
      FContentStream : TStream;

      FDataSet : TDataset;
      FContent : String;
      FStatusCode : Integer;

      const
        EP_TP = 'users/';
        EP_STORES = '/stores';
        EP_QRCODE = 'pos';
        EP_AUTH = 'oauth/token';
        EP_PRINTQR = 'create-qr-code/';
        EP_MPAGO = 'https://mpago.la/pos/';

      procedure ReqResHTTP(vHTTP : THTTPServices; const URL : String; Body : String = ''; Stream : Boolean = False);
    public
      constructor Create(Parent : iConfiguration);
      destructor Destroy; override;
      class function New(Parent : iConfiguration) : iAccreditation;

      //Filters
      function StoreID(Value : String) : iAccreditation;
      function QrID(Value : String) : iAccreditation;
      function ExternalID(Value : String) : iAccreditation;
      function PosID(Value : String) : iAccreditation;
      function Size(Value : String) : iAccreditation;

      //Returns
      function DataSet(Value : TDataSet) : iAccreditation;
      function Content : String;
      function ContentStream : TStream;
      function StatusCode : Integer;

      //Stores
      function CreateStore(Value : iStores) : iAccreditation;
      function UpdateStore(Value : iStores) : iAccreditation;
      function SearchStores : iAccreditation;
      function DeleteStore : iAccreditation;

      //QrCode
      function GenerateQRCode(Value : iQrCode) : iAccreditation;
      function UpdateQRCode(Value : iQrCode) : iAccreditation;
      function SearchGeneralQRs : iAccreditation;
      function SearchQRforExternal_ID : iAccreditation;
      function DeleteQrCode : iAccreditation;
      function PrintQRManually : iAccreditation;

      //Authorization
      function OAuthAuthorization : iAccreditation;
      function OAuthRenewal : iAccreditation;
  end;

implementation


function TAccreditation.Content: String;
begin
  Result := FContent;
end;

function TAccreditation.ContentStream: TStream;
begin
  Result := FContentStream;
end;

constructor TAccreditation.Create(Parent : iConfiguration);
begin
  FParent := Parent;
end;

function TAccreditation.CreateStore(Value : iStores) : iAccreditation;
begin
  Result := self;
  ReqResHTTP(POST,FParent.Enviroment.BaseURL +
                  EP_TP +
                  FParent.ClientID +
                  EP_STORES,
                  Value.Content);
end;

function TAccreditation.DataSet(Value: TDataSet): iAccreditation;
begin
  Result := Self;
  FDataSet := Value;
end;

function TAccreditation.DeleteQrCode: iAccreditation;
begin
  Result := Self;
  ReqResHTTP(DELETE, FParent.Enviroment.BaseURL + EP_QRCODE + '/' + FQrID);
end;

function TAccreditation.DeleteStore: iAccreditation;
begin
  Result := Self;
  ReqResHTTP(DELETE,FParent.Enviroment.BaseURL +
                  EP_TP +
                  FParent.ClientID +
                  EP_STORES +
                  FStoreID);
end;

destructor TAccreditation.Destroy;
begin

  inherited;
end;

function TAccreditation.ExternalID(Value: String): iAccreditation;
begin
  Result := Self;
  FExternalID := Value;
end;

function TAccreditation.GenerateQRCode(Value: iQrCode): iAccreditation;
begin
  Result := self;
  ReqResHTTP(POST,FParent.Enviroment.BaseURL +
                  EP_QRCODE, Value.Content);
end;

class function TAccreditation.New (Parent : iConfiguration) : iAccreditation;
begin
  Result := Self.Create(Parent);
end;

function TAccreditation.OAuthAuthorization: iAccreditation;
begin
  Result := Self;
end;

function TAccreditation.OAuthRenewal: iAccreditation;
begin
  Result := Self;
end;

function TAccreditation.PosID(Value: String): iAccreditation;
begin
  Result := Self;
  FPosID := Value;
end;

function TAccreditation.PrintQRManually: iAccreditation;
begin
  Result := Self;
  ReqResHTTP(GET,FParent.Enviroment.QrServerURL + EP_PRINTQR + '?'+FSize+'&data=https://mpago.la/pos/'+FQrID);
end;

function TAccreditation.QrID(Value: String): iAccreditation;
begin
  Result := Self;
  FQrID := Value;
end;

procedure TAccreditation.ReqResHTTP(vHTTP : THTTPServices; const URL : String; Body : String = ''; Stream : Boolean = False);
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

    if Stream then
      FContentStream := lRequest.Get.ContentStream;

    FStatusCode := lResponse.StatusCode;
    FContent := lResponse.Content;
  except
    raise Exception.Create('Return Server Error ' + lResponse.StatusCode.ToString);
  end;
end;

function TAccreditation.SearchGeneralQRs: iAccreditation;
begin
  Result := Self;
  ReqResHTTP(GET,FParent.Enviroment.BaseURL + EP_QRCODE);
end;

function TAccreditation.SearchQRforExternal_ID: iAccreditation;
begin
  Result := Self;
  ReqResHTTP(GET,FParent.Enviroment.BaseURL + EP_QRCODE,FExternalID);
end;

function TAccreditation.SearchStores : iAccreditation;
begin
  Result := Self;
  ReqResHTTP(GET,FParent.Enviroment.BaseURL +
                  FParent.ClientID +
                  EP_STORES +
                  '/search');
end;

function TAccreditation.Size(Value: String): iAccreditation;
begin
  Result := Self;
  FSize := Value;
end;

function TAccreditation.StatusCode: Integer;
begin
  Result := FStatusCode;
end;

function TAccreditation.StoreID(Value: String): iAccreditation;
begin
  Result := Self;
  FStoreId := Value;
end;

function TAccreditation.UpdateQRCode(Value: iQrCode): iAccreditation;
begin
  Result := Self;
  ReqResHTTP(PUT,FParent.Enviroment.BaseURL +
                  EP_QRCODE + '/' + FQrID,Value.Content);
end;

function TAccreditation.UpdateStore(Value: iStores): iAccreditation;
begin
  Result := Self;
  ReqResHTTP(PUT,FParent.Enviroment.BaseURL + EP_TP +
                  FParent.ClientID + EP_STORES + FStoreID,Value.Content);
end;

end.
