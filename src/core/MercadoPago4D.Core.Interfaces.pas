unit MercadoPago4D.Core.Interfaces;

interface

uses
  MercadoPago4D.Resources.Interfaces, Mercadopago4D.Insight.Builder.Interfaces;

type
  iMercadoPago4DConfiguration = interface;
  iMercadoPago4DResources = interface;
  iMercadoPago4DManager = interface;

  iEnviroment = interface
    function Base_URL : String;
  end;

  iMercadoPago4D = interface
    function Configuration : iMercadoPago4DConfiguration;
    function Manager : iMercadoPago4DManager;
  end;

  iMercadoPago4DConfiguration = interface
    function AccessToken(Value : String) : iMercadoPago4DConfiguration; overload;
    function AccessToken : String; overload;
    function ClientID(Value : Integer) : iMercadoPago4DConfiguration; overload;
    function ClientID : Integer; overload;
    function Enviroment : iEnviroment;
  end;

  iMercadoPago4DManager = interface
    function Resources : iMercadoPago4DResources;
    function Builder : iManagerBuilder;
  end;

  iMercadoPago4DResources = interface
    function OAuthToken : iOAuthToken;
    function RenewOAuthToken : iRenewOAuthToken;
    function Store : iStore;
    function QRCode : iQRCode;
    function ChargeOrderQR : iChargeOrderQR;
    function AfterSales : iAfterSales;
    function GenerateUserTest : iGenerateUserTest;
  end;

implementation

end.
