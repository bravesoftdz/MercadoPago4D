unit Workshop032020.Entity.Location;

interface

uses
  Workshop032020.Entity.Interfaces;

type
   TLocation<T : IInterface> = class(TInterfacedObject, iLocation<T>)
    private
      [weak]
      FParent : T;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iLocation<T>;
      function City_Name(Value : string) : iLocation<T>;
      function Latitude(Value : Double) : iLocation<T>;
      function Longitude(Value : Double) :iLocation<T>;
      function Reference(Value : string) : iLocation<T>;
      function State_Name(Value : string) : iLocation<T>;
      function Street_Name(Value : string) : iLocation<T>;
      function Street_Number(Value : String) : iLocation<T>;
      function Zip_Code(Value : string) : iLocation<T>;
      function &End : T;
  end;

implementation

function TLocation<T>.City_Name(Value: string): iLocation<T>;
begin
  Result := Self;
end;

constructor TLocation<T>.Create(Parent: T);
begin

end;

destructor TLocation<T>.Destroy;
begin

  inherited;
end;

function TLocation<T>.&End: T;
begin

end;

function TLocation<T>.Latitude(Value: Double): iLocation<T>;
begin

end;

function TLocation<T>.Longitude(Value: Double): iLocation<T>;
begin

end;

class function TLocation<T>.New(Parent: T): iLocation<T>;
begin

end;

function TLocation<T>.Reference(Value: string): iLocation<T>;
begin

end;

function TLocation<T>.State_Name(Value: string): iLocation<T>;
begin

end;

function TLocation<T>.Street_Name(Value: string): iLocation<T>;
begin

end;

function TLocation<T>.Street_Number(Value: String): iLocation<T>;
begin

end;

function TLocation<T>.Zip_Code(Value: string): iLocation<T>;
begin

end;

end.
