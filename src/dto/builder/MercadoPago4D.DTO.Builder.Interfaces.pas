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
    function Name(Value : String) : iBuilderStores; overload;
    function Name : String; overload;
    function Date_Creation(Value : TDateTime) : iBuilderStores; overload;
    function Date_Creation : TDateTime; overload;
    function External_Id(Value : String) : iBuilderStores; overload;
    function External_Id : String; overload;
    function Location : iBuilderLocation<iBuilderStores>;
    function Business_Hours : iBuilderBusiness_Hours;
    function Content : String;
    function &End : iBuilderStores;
  end;

  iBuilderLocation<T> = interface
    function City_Name(Value : string) : iBuilderLocation<T>; overload;
    function City_Name : string; overload;
    function Latitude(Value : Double) : iBuilderLocation<T>; overload;
    function Latitude : Double; overload;
    function Longitude(Value : Double) : iBuilderLocation<T>; overload;
    function Longitude : Double; overload;
    function Reference(Value : string) : iBuilderLocation<T>; overload;
    function Reference : string; overload;
    function State_Name(Value : string) : iBuilderLocation<T>; overload;
    function State_Name : string; overload;
    function Street_Name(Value : string) : iBuilderLocation<T>; overload;
    function Street_Name : string; overload;
    function Street_Number(Value : string) : iBuilderLocation<T>; overload;
    function Street_Number : string; overload;
    function Zip_Code(Value : string) : iBuilderLocation<T>; overload;
    function Zip_Code : string; overload;
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
    function Open(Value : String) : iBuilderSunday<T>; overload;
    function Open : String; overload;
    function Close(Value : String) : iBuilderSunday<T>; overload;
    function Close : String; overload;
    function &End : T;
  end;

  iBuilderSaturday<T> = interface
    function Open(Value : String) : iBuilderSaturday<T>; overload;
    function Close(Value : String) : iBuilderSaturday<T>; overload;
    function Open : String; overload;
    function Close : String; overload;
    function &End : T;
  end;

  iBuilderFriday<T> = interface
    function Open(Value : String) : iBuilderFriday<T>; overload;
    function Close(Value : String) : iBuilderFriday<T>; overload;
    function Open : String; overload;
    function Close : String; overload;
    function &End : T;
  end;

  iBuilderThursday<T> = interface
    function Open(Value : String) : iBuilderThursday<T>; overload;
    function Close(Value : String) : iBuilderThursday<T>; overload;
    function Open : String; overload;
    function Close : String; overload;
    function &End : T;
  end;

  iBuilderWednesday<T> = interface
    function Open(Value : String) : iBuilderWednesday<T>; overload;
    function Close(Value : String) : iBuilderWednesday<T>; overload;
    function Open : String; overload;
    function Close : String; overload;
    function &End : T;
  end;

  iBuilderTuesday<T> = interface
    function Open(Value : String) : iBuilderTuesday<T>; overload;
    function Close(Value : String) : iBuilderTuesday<T>; overload;
    function Open : String; overload;
    function Close : String; overload;
    function &End : T;
  end;

  iBuilderMonday<T> = interface
    function Open(Value : String) : iBuilderMonday<T>; overload;
    function Close(Value : String) : iBuilderMonday<T>; overload;
    function Open : String; overload;
    function Close : String; overload;
    function &End : T;
  end;

  iBuilder = interface
    function BuilderStore : iBuilderStores;
  end;

implementation

end.
