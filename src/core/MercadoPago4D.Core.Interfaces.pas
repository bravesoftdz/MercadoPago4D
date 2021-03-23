unit MercadoPago4D.Core.Interfaces;

interface

uses
  MercadoPago4D.Services.Accreditation.Interfaces;

type
  iMercadoPago4DManger = interface;
  iMercadoPago4DResources = interface;
  iMercadoPago4DConfiguration = interface;
  iEnviroment = interface;

  iMercadoPago4D = interface
    function Menager : iMercadoPago4DManger;
    function Config : iMercadoPago4DConfiguration;
  end;

  iMercadoPago4DManger = interface
    function Resources : iMercadoPago4DResources;
  end;

  iMercadoPago4DResources = interface
    function Accreditation : iAccreditation;
  end;

  iMercadoPago4DConfiguration = interface
    function ClientID(Value : String) : iMercadoPago4DConfiguration; overload;
    function ClientID : String; overload;
    function AccessToken(Value : String) : iMercadoPago4DConfiguration; overload;
    function AccessToken : String; overload;
    function Enviroment : iEnviroment;
  end;

  iEnviroment = interface
    function Base_URL : String;
  end;

implementation

end.
