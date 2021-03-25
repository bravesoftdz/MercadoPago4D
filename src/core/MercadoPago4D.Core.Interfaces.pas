unit MercadoPago4D.Core.Interfaces;

interface

uses
  MercadoPago4D.Services.Interfaces;

type
  iResources = interface;
  iEnviroment = interface;

  iConfiguration = interface
    function ClientID(Value : String) : iConfiguration; overload;
    function AccessToken(Value : String) : iConfiguration; overload;
    function ClientID  : String; overload;
    function AccessToken : String; overload;
    function Enviroment : iEnviroment;
  end;

  iManager = interface
    function Resources : iResources;
  end;

  iResources = interface
    function Accreditation : iAccreditation;
    function Transactional : iTransactional;
    function AfterSales : iAfterSales;
    function GenerateTestUser : iGenerateTestUser;
  end;

  iEnviroment = interface
    function BaseURL : String;
    function QrServerURL : String;
  end;

implementation

end.
