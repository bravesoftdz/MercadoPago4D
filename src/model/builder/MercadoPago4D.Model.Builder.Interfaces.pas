unit MercadoPago4D.Model.Builder.Interfaces;

interface

type
  iLocation<T> = interface;
  iBusiness_Hours = interface;
  iSunday<T> = interface;
  iSaturday<T> = interface;
  iFriday<T> = interface;
  iThursday<T> = interface;
  iWednesday<T> = interface;
  iTuesday<T> = interface;
  iMonday<T> = interface;
  iItems<T> = interface;
  iPaymentsMethods<T> = interface;
  iSponsor<T> = interface;
  iQrCode = interface;
  iOrder = interface;
  iPartial = interface;
  iTestUser = interface;

  iStores = interface
    function Name(Value : String) : iStores;
    function External_Id(Value : String) : iStores;
    function Location : iLocation<iStores>;
    function Business_Hours : iBusiness_Hours;
    function Content : String;
    function &End : iStores;
  end;

  iLocation<T> = interface
    function City_Name(Value : string) : iLocation<T>;
    function Latitude(Value : Double) : iLocation<T>;
    function Longitude(Value : Double) : iLocation<T>;
    function Reference(Value : string) : iLocation<T>;
    function State_Name(Value : string) : iLocation<T>;
    function Street_Name(Value : string) : iLocation<T>;
    function Street_Number(Value : String) : iLocation<T>;
    function Zip_Code(Value : string) : iLocation<T>;
    function &End : T;
  end;

  iBusiness_Hours = interface
    function Sunday : iSunday<iBusiness_Hours>;
    function Saturday : iSaturday<iBusiness_Hours>;
    function Friday : iFriday<iBusiness_Hours>;
    function Thursday : iThursday<iBusiness_Hours>;
    function Wednesday : iWednesday<iBusiness_Hours>;
    function Tuesday : iTuesday<iBusiness_Hours>;
    function Monday : iMonday<iBusiness_Hours>;
    function &End : iStores;
  end;

  iSunday<T> = interface
    function Open(Value : String) : iSunday<T>;
    function Close(Value : String) : iSunday<T>;
    function &End : T;
  end;

  iSaturday<T> = interface
    function Open(Value : String) : iSaturday<T>;
    function Close(Value : String) : iSaturday<T>;
    function &End : T;
  end;

  iFriday<T> = interface
    function Open(Value : String) : iFriday<T>;
    function Close(Value : String) : iFriday<T>;
    function &End : T;
  end;

  iThursday<T> = interface
    function Open(Value : String) : iThursday<T>;
    function Close(Value : String) : iThursday<T>;
    function &End : T;
  end;

  iWednesday<T> = interface
    function Open(Value : String) : iWednesday<T>;
    function Close(Value : String) : iWednesday<T>;
    function &End : T;
  end;

  iTuesday<T> = interface
    function Open(Value : String) : iTuesday<T>;
    function Close(Value : String) : iTuesday<T>;
    function &End : T;
  end;

  iMonday<T> = interface
    function Open(Value : String) : iMonday<T>;
    function Close(Value : String) : iMonday<T>;
    function &End : T;
  end;

  iBuilderManager = interface
    function Stores : iStores;
    function QrCode : iQrCode;
    function Order : iOrder;
    function Partial : iPartial;
    function TestUser : iTestUser;
  end;

  iQrCode = interface
    function External_Id(Value : String) : iQrCode;
    function Fixed_Amount(Value : Boolean) : iQrCode;
    function Name(Value : String) : iQrCode;
    function Content : String;
    function &End : iQrCode;
  end;

  iOrder = interface
    function External_Reference(Value : String) : iOrder;
    function Total_Amount(Value : Double) : iOrder;
    function Title(Value : String ) : iOrder;
    function Description(Value : String ) : iOrder;
    function Items : iItems<iOrder>;
    function Expiration_Date(Value : TDateTime) : iOrder;
    function Notification_Url(Value : String) : iOrder;
    function Payment_Methods : iPaymentsMethods<iOrder>;
    function Sponsor : iSponsor<iOrder>;
    function Content : String;
    function &End : iOrder;
  end;

  iItems<T> = interface
    function SKU_Number(Value : string) : iItems<T>;
    function Category(Value : String) : iItems<T>;
    function ID(Value : String) : iItems<T>;
    function Title(Value : String) :iItems<T>;
    function CurrencyID(Value : String) : iItems<T>;
    function Unit_Measure(Value : String) : iItems<T>;
    function UnitPrice(Value : Double) : iItems<T>;
    function Description(Value : String) : iItems<T>;
    function Quantity(Value : Double) : iItems<T>;
    function PictureURL(Value : String) : iItems<T>;
    function Total_Amount(Value : Double) : iItems<T>;
    function &End : T;
  end;

  iPaymentsMethods<T> = interface
    function Installments(Value : Integer) : iPaymentsMethods<T>;
    function &End : T;
  end;

  iSponsor<T> = interface
    function Id(Value : Int64 ) : iSponsor<T>;
    function &End : T;
  end;

  iPartial = interface
    function Amount(Value : Double) : iPartial;
    function Content : String;
    function &End : iPartial;
  end;

  iTestUser = interface
    function SiteID(Value : String) : iTestUser;
    function Content : String;
    function &End : iTestUser;
  end;

implementation

end.
