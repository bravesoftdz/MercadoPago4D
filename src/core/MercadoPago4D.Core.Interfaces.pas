unit MercadoPago4D.Core.Interfaces;

interface

uses
  MercadoPago4D.Resources.Interfaces;

type
  iMercadoPago4DConfiguration = interface;
  iMercadoPago4DResources = interface;

  iEnviroment = interface
    function Base_URL : String;
  end;

  iMercadoPago4D = interface
    function Configuration : iMercadoPago4DConfiguration;
  end;

  iMercadoPago4DConfiguration = interface
    function ClientID(Value : String) : iMercadoPago4DConfiguration;
    function ClientScret(Value : String) : iMercadoPago4DConfiguration;
    function AccessToken : String;
    function ExpiresIN : Integer;
    function UserID : Integer;
  end;

  iMercadoPago4DManager = interface
    function Resources : iMercadoPago4DResources;
  end;

  iMercadoPago4DResources = interface
    function OAuthToken : iOAuthToken;
    function RenewOAuthToken : iRenewOAuthToken;
    function Store : iStore;
    function QRCode : iQRCode;
    function ChargeOrderQR : iChargeOrderQR;
    function QueryAvailableQR : iQueryAvailableQR;
    function DelOrderQR : iDelOrderQR;
    function QueryMerchantOrder : iQueryMerchantOrder;
    function SearchMerchantOrder : iSearchMerchantOrder;
    function QueryPayment : iQueryPayment;
    function SearchPayment : iSearchPayment;
    function ReservalPayment : iReservalPayment;
    function GenerateUserTest : iGenerateUserTest;
  end;

implementation

end.
