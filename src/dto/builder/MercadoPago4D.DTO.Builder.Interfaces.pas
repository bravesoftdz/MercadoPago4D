unit MercadoPago4D.DTO.Builder.Interfaces;

interface

type
  iBuilderBusiness_Hours = interface;
  iBuilderLocation<T> = interface;
  iBuilderSunday<T> = interface;
  iBuilderSaturday<T> = interface;
  iBuilderFriday<T> = interface;
  iBuilderThursday<T> = interface;
  iBuilderWednesday<T> = interface;
  iBuilderTuesday<T> = interface;
  iBuilderMonday<T> = interface;

  iBuilderStores = interface
    function Name(Value : String) : iBuilderStores;
    function External_Id(Value : String) : iBuilderStores;
    function Location : iBuilderLocation<iBuilderStores>;
    function Business_Hours : iBuilderBusiness_Hours;
    function Content : String;
    function &End : iBuilderStores;
  end;

  iBuilderLocation<T> = interface
    function City_Name(Value : string) : iBuilderLocation<T>;
    function Latitude(Value : Double) : iBuilderLocation<T>;
    function Longitude(Value : Double) : iBuilderLocation<T>;
    function Reference(Value : string) : iBuilderLocation<T>;
    function State_Name(Value : string) : iBuilderLocation<T>;
    function Street_Name(Value : string) : iBuilderLocation<T>;
    function Street_Number(Value : string) : iBuilderLocation<T>;
    function Zip_Code(Value : string) : iBuilderLocation<T>;
    function &End : T;
  end;

  iBuilderBusiness_Hours = interface
    function Sunday : iBuilderSunday<iBuilderBusiness_Hours>;
    function Saturday : iBuilderSaturday<iBuilderBusiness_Hours>;
    function Friday : iBuilderFriday<iBuilderBusiness_Hours>;
    function Thursday : iBuilderThursday<iBuilderBusiness_Hours>;
    function Wednesday : iBuilderWednesday<iBuilderBusiness_Hours>;
    function Tuesday : iBuilderTuesday<iBuilderBusiness_Hours>;
    function Monday : iBuilderMonday<iBuilderBusiness_Hours>;
    function &End : iBuilderStores;
  end;

  iBuilderSunday<T> = interface
    function Open(Value : String) : iBuilderSunday<T>;
    function Close(Value : String) : iBuilderSunday<T>;
    function &End : T;
  end;

  iBuilderSaturday<T> = interface
    function Open(Value : String) : iBuilderSaturday<T>;
    function Close(Value : String) : iBuilderSaturday<T>;
    function &End : T;
  end;

  iBuilderFriday<T> = interface
    function Open(Value : String) : iBuilderFriday<T>;
    function Close(Value : String) : iBuilderFriday<T>;
    function &End : T;
  end;

  iBuilderThursday<T> = interface
    function Open(Value : String) : iBuilderThursday<T>;
    function Close(Value : String) : iBuilderThursday<T>;
    function &End : T;
  end;

  iBuilderWednesday<T> = interface
    function Open(Value : String) : iBuilderWednesday<T>;
    function Close(Value : String) : iBuilderWednesday<T>;
    function &End : T;
  end;

  iBuilderTuesday<T> = interface
    function Open(Value : String) : iBuilderTuesday<T>;
    function Close(Value : String) : iBuilderTuesday<T>;
    function &End : T;
  end;

  iBuilderMonday<T> = interface
    function Open(Value : String) : iBuilderMonday<T>;
    function Close(Value : String) : iBuilderMonday<T>;
    function &End : T;
  end;

implementation

end.
