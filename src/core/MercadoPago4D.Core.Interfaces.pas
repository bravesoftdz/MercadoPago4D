unit MercadoPago4D.Core.Interfaces;

interface

type
  iMercadoPago4DManger = interface;
  iMercadoPago4DResources = interface;
  iMercadoPago4DConfiguration = interface;

  iMercadoPago4D = interface
    function Menager : iMercadoPago4DManger;
    function Config : iMercadoPago4DConfiguration;
  end;

  iMercadoPago4DManger = interface
    function Reources : iMercadoPago4DResources;
  end;

  iMercadoPago4DResources = interface

  end;

  iMercadoPago4DConfiguration = interface
    function ClientID(Value : String) : iMercadoPago4DConfiguration; overload;
    function ClientID : String; overload;
    function AccessToken(Value : String) : iMercadoPago4DConfiguration; overload;
    function AccessToken : String; overload;
  end;

implementation

end.
