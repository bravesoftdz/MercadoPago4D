unit Workshop032020.Entity.Interfaces;

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

  iStones = interface
    function Name(Value : String) : iStones;
    function External_Id(Value : String) : iStones;
    function Location : iLocation<iStones>;
    function Business_Hours : iBusiness_Hours;
    function Content : String;
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
    function &End : iStones;
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

implementation

end.
