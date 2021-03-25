unit Workshop032020.Entity.StoresDTO;

interface

uses
  Pkg.Json.DTO,
  System.Generics.Collections,
  REST.Json.Types,
  Workshop032020.Entity.Interfaces,
  System.JSON, REST.Json;

{$M+}

type
  TLocationDTO = class
  private
    FCity_name: string;
    FLatitude: Double;
    FLongitude: Double;
    FReference: string;
    FState_name: string;
    FStreet_name: string;
    FStreet_number: String;
    FZip_code: string;
  published
    property City_Name: string read FCity_name write FCity_name;
    property Latitude: Double read FLatitude write FLatitude;
    property Longitude: Double read FLongitude write FLongitude;
    property Reference: string read FReference write FReference;
    property State_name: string read FState_name write FState_name;
    property Street_name: string read FStreet_name write FStreet_name;
    property Street_number: String read FStreet_number write FStreet_number;
    property Zip_code: string read FZip_code write FZip_code;
  end;

  TSundayDTO = class
  private
    FClose: string;
    FOpen: string;
  published
    property Close: string read FClose write FClose;
    property Open: string read FOpen write FOpen;
  end;

  TSaturdayDTO = class
  private
    FClose: string;
    FOpen: string;
  published
    property Close: string read FClose write FClose;
    property Open: string read FOpen write FOpen;
  end;

  TFridayDTO = class
  private
    FClose: string;
    FOpen: string;
  published
    property Close: string read FClose write FClose;
    property Open: string read FOpen write FOpen;
  end;

  TThursdayDTO = class
  private
    FClose: string;
    FOpen: string;
  published
    property Close: string read FClose write FClose;
    property Open: string read FOpen write FOpen;
  end;

  TWednesdayDTO = class
  private
    FClose: string;
    FOpen: string;
  published
    property Close: string read FClose write FClose;
    property Open: string read FOpen write FOpen;
  end;

  TTuesdayDTO = class
  private
    FClose: string;
    FOpen: string;
  published
    property Close: string read FClose write FClose;
    property Open: string read FOpen write FOpen;
  end;

  TMondayDTO = class
  private
    FClose: string;
    FOpen: string;
  published
    property Close: string read FClose write FClose;
    property Open: string read FOpen write FOpen;
  end;

  TBusiness_hoursDTO = class
  private
    [GenericListReflect]
    FFriday: TObjectList<TFridayDTO>;
    [GenericListReflect]
    FMonday: TObjectList<TMondayDTO>;
    [GenericListReflect]
    FSaturday: TObjectList<TSaturdayDTO>;
    [GenericListReflect]
    FSunday: TObjectList<TSundayDTO>;
    [GenericListReflect]
    FThursday: TObjectList<TThursdayDTO>;
    [GenericListReflect]
    FTuesday: TObjectList<TTuesdayDTO>;
    [GenericListReflect]
    FWednesday: TObjectList<TWednesdayDTO>;
    function GetMonday: TObjectList<TMondayDTO>;
    function GetTuesday: TObjectList<TTuesdayDTO>;
    function GetWednesday: TObjectList<TWednesdayDTO>;
    function GetThursday: TObjectList<TThursdayDTO>;
    function GetFriday: TObjectList<TFridayDTO>;
    function GetSaturday: TObjectList<TSaturdayDTO>;
    function GetSunday: TObjectList<TSundayDTO>;
  published
    property Friday: TObjectList<TFridayDTO> read GetFriday;
    property Monday: TObjectList<TMondayDTO> read GetMonday;
    property Saturday: TObjectList<TSaturdayDTO> read GetSaturday;
    property Sunday: TObjectList<TSundayDTO> read GetSunday;
    property Thursday: TObjectList<TThursdayDTO> read GetThursday;
    property Tuesday: TObjectList<TTuesdayDTO> read GetTuesday;
    property Wednesday: TObjectList<TWednesdayDTO> read GetWednesday;
    destructor Destroy; override;
  end;

  TRootDTO = class(TJsonDTO)
  private
    FBusiness_hours: TBusiness_hoursDTO;
    FExternal_id: string;
    FLocation: TLocationDTO;
    FName: string;
  published
    property Business_hours: TBusiness_hoursDTO read FBusiness_Hours write FBusiness_Hours;
    property External_id: string read FExternal_id write FExternal_id;
    property Location: TLocationDTO read FLocation write FLocation;
    property Name: string read FName write FName;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

  TBuilderStores = class(TInterfacedObject, iStones)
    private
      FLocation : iLocation<iStones>;
      FBusiness_Hours : iBusiness_Hours;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iStones;
      function Name(Value : String) : iStones;
      function External_Id(Value : String) : iStones;
      function Location : iLocation<iStones>;
      function Business_Hours : iBusiness_Hours;
      function Content : String;
  end;

  TBuilderLocation<T : IInterface> = class(TInterfacedObject, iLocation<T>)
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

  TBuilderSunday<T : IInterface> = class(TInterfacedObject, iSunday<T>)
    private
      [weak]
      FParent : T;
      FOpen : String;
      FClose : String;
      procedure AddList;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iSunday<T>;
      function Open(Value : String) : iSunday<T>;
      function Close(Value : String) : iSunday<T>;
      function &End : T;
  end;

  TBuilderSaturday<T : IInterface> = class(TInterfacedObject, iSaturday<T>)
    private
      [weak]
      FParent : T;
      FOpen : String;
      FClose : String;
      procedure AddList;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iSaturday<T>;
      function Open(Value : String) : iSaturday<T>;
      function Close(Value : String) : iSaturday<T>;
      function &End : T;
  end;

  TBuilderFriday<T : IInterface> = class(TInterfacedObject, iFriday<T>)
    private
      [weak]
      FParent : T;
      FOpen : String;
      FClose : String;
      procedure AddList;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iFriday<T>;
      function Open(Value : String) : iFriday<T>;
      function Close(Value : String) : iFriday<T>;
      function &End : T;
  end;

  TBuilderThursday<T : IInterface> = class(TInterfacedObject, iThursday<T>)
    private
      [weak]
      FParent : T;
      FOpen : String;
      FClose : String;
      procedure AddList;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iThursday<T>;
      function Open(Value : String) : iThursday<T>;
      function Close(Value : String) : iThursday<T>;
      function &End : T;
  end;

  TBuilderWednesday<T : IInterface> = class(TInterfacedObject, iWednesday<T>)
    private
      [weak]
      FParent : T;
      FOpen : String;
      FClose : String;
      procedure AddList;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iWednesday<T>;
      function Open(Value : String) : iWednesday<T>;
      function Close(Value : String) : iWednesday<T>;
      function &End : T;
  end;

  TBuilderTuesday<T : IInterface> = class(TInterfacedObject, iTuesday<T>)
    private
      [weak]
      FParent : T;
      FOpen : String;
      FClose : String;
      procedure AddList;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iTuesday<T>;
      function Open(Value : String) : iTuesday<T>;
      function Close(Value : String) : iTuesday<T>;
      function &End : T;
  end;

  TBuilderMonday<T : IInterface> = class(TInterfacedObject, iMonday<T>)
    private
      [weak]
      FParent : T;
      FOpen : String;
      FClose : String;
      procedure AddList;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iMonday<T>;
      function Open(Value : String) : iMonday<T>;
      function Close(Value : String) : iMonday<T>;
      function &End : T;
  end;

  TBuilderBusiness_Hours = class(TInterfacedObject, iBusiness_Hours)
    private
      [weak]
      FParent : iStones;
      FSunday : iSunday<iBusiness_Hours>;
      FSaturday : iSaturday<iBusiness_Hours>;
      FFriday : iFriday<iBusiness_Hours>;
      FThursday : iThursday<iBusiness_Hours>;
      FWednesday : iWednesday<iBusiness_Hours>;
      FTuesday : iTuesday<iBusiness_Hours>;
      FMonday : iMonday<iBusiness_Hours>;
    public
      constructor Create(Parent : iStones);
      destructor Destroy; override;
      class function New(Parent : iStones) : iBusiness_Hours;
      function Sunday : iSunday<iBusiness_Hours>;
      function Saturday : iSaturday<iBusiness_Hours>;
      function Friday : iFriday<iBusiness_Hours>;
      function Thursday : iThursday<iBusiness_Hours>;
      function Wednesday : iWednesday<iBusiness_Hours>;
      function Tuesday : iTuesday<iBusiness_Hours>;
      function Monday : iMonday<iBusiness_Hours>;
      function &End : iStones;
  end;

var
  RootDTO : TRootDTO;

implementation

{ TBusiness_HoursDTO }

destructor TBusiness_HoursDTO.Destroy;
begin
  GetMonday.Free;
  GetTuesday.Free;
  GetWednesday.Free;
  GetThursday.Free;
  GetFriday.Free;
  GetSaturday.Free;
  GetSunday.Free;
  inherited;
end;

function TBusiness_HoursDTO.GetMonday: TObjectList<TMondayDTO>;
begin
  if not Assigned(FMonday) then
    FMonday := TObjectList<TMondayDTO>.Create;

  Result := FMonday;
end;

function TBusiness_HoursDTO.GetTuesday: TObjectList<TTuesdayDTO>;
begin
  if not Assigned(FTuesday) then
    FTuesday := TObjectList<TTuesdayDTO>.Create;

  Result := FTuesday;
end;

function TBusiness_HoursDTO.GetWednesday: TObjectList<TWednesdayDTO>;
begin
  if not Assigned(FWednesday) then
    FWednesday := TObjectList<TWednesdayDTO>.Create;

  Result := FWednesday;
end;

function TBusiness_HoursDTO.GetThursday: TObjectList<TThursdayDTO>;
begin
  if not Assigned(FThursday) then
    FThursday := TObjectList<TThursdayDTO>.Create;

  Result := FThursday;
end;

function TBusiness_HoursDTO.GetFriday: TObjectList<TFridayDTO>;
begin
  if not Assigned(FFriday) then
    FFriday := TObjectList<TFridayDTO>.Create;

  Result := FFriday;
end;

function TBusiness_HoursDTO.GetSaturday: TObjectList<TSaturdayDTO>;
begin
  if not Assigned(FSaturday) then
    FSaturday := TObjectList<TSaturdayDTO>.Create;

  Result := FSaturday;
end;

function TBusiness_HoursDTO.GetSunday: TObjectList<TSundayDTO>;
begin
  if not Assigned(FSunday) then
    FSunday := TObjectList<TSundayDTO>.Create;

  Result := FSunday;
end;

{ TRootDTO }

constructor TRootDTO.Create;
begin
  inherited;
  FBusiness_Hours := TBusiness_HoursDTO.Create;
  FLocation := TLocationDTO.Create;
end;

destructor TRootDTO.Destroy;
begin
  FBusiness_Hours.Free;
  FLocation.Free;
  inherited;
end;

{ TBuilderStores }

function TBuilderStores.Business_Hours: iBusiness_Hours;
begin
  Result := FBusiness_Hours;
end;

function TBuilderStores.Content: String;
var
  json : tjsonobject;
begin
  json := TJSON.ObjectToJsonObject(RootDTO);
  Result := json.format;
end;

constructor TBuilderStores.Create;
begin
  RootDTO := TRootDTO.Create;
  FBusiness_Hours := TBuilderBusiness_Hours.New(Self);
  FLocation := TBuilderLocation<iStones>.New(Self);
end;

destructor TBuilderStores.Destroy;
begin
  RootDTO.free;
  inherited;
end;

function TBuilderStores.External_Id(Value: String): iStones;
begin
  Result := Self;
  RootDTO.External_Id := Value;
end;

function TBuilderStores.Location: iLocation<iStones>;
begin
  Result := FLocation;
end;

function TBuilderStores.Name(Value: String): iStones;
begin
  Result := Self;
  RootDTO.Name := Value;
end;

class function TBuilderStores.New: iStones;
begin
  Result := Self.Create;
end;

{ TBuilderLocation<T> }

function TBuilderLocation<T>.City_Name(Value: string): iLocation<T>;
begin
  Result := Self;
  RootDTO.Location.City_Name := Value;
end;

constructor TBuilderLocation<T>.Create(Parent: T);
begin
  FParent := Parent;
end;

destructor TBuilderLocation<T>.Destroy;
begin

  inherited;
end;

function TBuilderLocation<T>.&End: T;
begin
  Result := FParent;
end;

function TBuilderLocation<T>.Latitude(Value: Double): iLocation<T>;
begin
  Result := Self;
  RootDTO.Location.Latitude := Value;
end;

function TBuilderLocation<T>.Longitude(Value: Double): iLocation<T>;
begin
  result := self;
  RootDTO.Location.Longitude := Value;
end;

class function TBuilderLocation<T>.New(Parent: T): iLocation<T>;
begin
  Result := Self.Create(Parent);
end;

function TBuilderLocation<T>.Reference(Value: string): iLocation<T>;
begin
  Result := Self;
  RootDTO.Location.Reference := Value;
end;

function TBuilderLocation<T>.State_Name(Value: string): iLocation<T>;
begin
  Result := Self;
  RootDTO.Location.State_Name := Value;
end;

function TBuilderLocation<T>.Street_Name(Value: string): iLocation<T>;
begin
  Result := Self;
  RootDTO.Location.Street_Name := Value;
end;

function TBuilderLocation<T>.Street_Number(Value: String): iLocation<T>;
begin
  Result := Self;
  RootDTO.Location.Street_Number := Value;
end;

function TBuilderLocation<T>.Zip_Code(Value: string): iLocation<T>;
begin
  Result := Self;
  RootDTO.Location.Zip_Code := Value;
end;

{ TBuilderSunday<T> }

procedure TBuilderSunday<T>.AddList;
var
  I : Integer;
begin
  RootDTO.Business_Hours.Sunday.Add(TSundayDTO.Create);
  I := RootDTO.Business_Hours.Sunday.Count -1;
  RootDTO.Business_Hours.Sunday[I].Open := FOpen;
  RootDTO.Business_Hours.Sunday[I].Close := FClose;
end;

function TBuilderSunday<T>.Close(Value: String): iSunday<T>;
begin
  Result := Self;
  FClose := Value;
end;

constructor TBuilderSunday<T>.Create(Parent : T);
begin
  FParent := Parent;
end;

destructor TBuilderSunday<T>.Destroy;
begin

  inherited;
end;

function TBuilderSunday<T>.&End: T;
begin
  Result := FParent;
  AddList;
end;

class function TBuilderSunday<T>.New(Parent : T): iSunday<T>;
begin
  Result := Self.Create(Parent);
end;

function TBuilderSunday<T>.Open(Value: String): iSunday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

{ TBuilderSaturday<T> }

procedure TBuilderSaturday<T>.AddList;
var
  I : Integer;
begin
  RootDTO.Business_Hours.Saturday.Add(TSaturdayDTO.Create);
  I := RootDTO.Business_Hours.Saturday.Count -1;
  RootDTO.Business_Hours.Saturday[I].Open := FOpen;
  RootDTO.Business_Hours.Saturday[I].Close := FClose;
end;

function TBuilderSaturday<T>.Close(Value: String): iSaturday<T>;
begin
  Result := Self;
  FClose := Value;
end;

constructor TBuilderSaturday<T>.Create(Parent : T);
begin
  FParent := Parent;
end;

destructor TBuilderSaturday<T>.Destroy;
begin

  inherited;
end;

function TBuilderSaturday<T>.&End: T;
begin
  Result := FParent;
  AddList;
end;

class function TBuilderSaturday<T>.New(Parent : T): iSaturday<T>;
begin
  Result := Self.Create(Parent);
end;

function TBuilderSaturday<T>.Open(Value: String): iSaturday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

{ TBuilderFriday<T> }

procedure TBuilderFriday<T>.AddList;
var
  I : Integer;
begin
  RootDTO.Business_Hours.Friday.Add(TFridayDTO.Create);
  I := RootDTO.Business_Hours.Friday.Count -1;
  RootDTO.Business_Hours.Friday[I].Open := FOpen;
  RootDTO.Business_Hours.Friday[I].Close := FClose;
end;

function TBuilderFriday<T>.Close(Value: String): iFriday<T>;
begin
  Result := Self;
  FClose := Value;
end;

constructor TBuilderFriday<T>.Create(Parent: T);
begin
  FParent := Parent;
end;

destructor TBuilderFriday<T>.Destroy;
begin

  inherited;
end;

function TBuilderFriday<T>.&End: T;
begin
  Result := FParent;
  AddList;
end;

class function TBuilderFriday<T>.New(Parent: T): iFriday<T>;
begin
  Result := Self.Create(Parent);
end;

function TBuilderFriday<T>.Open(Value: String): iFriday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

{ TBuilderThursday<T> }

procedure TBuilderThursday<T>.AddList;
var
  I : Integer;
begin
  RootDTO.Business_Hours.Thursday.Add(TThursdayDTO.Create);
  I := RootDTO.Business_Hours.Thursday.Count -1;
  RootDTO.Business_Hours.Thursday[I].Open := FOpen;
  RootDTO.Business_Hours.Thursday[I].Close := FClose;
end;

function TBuilderThursday<T>.Close(Value: String): iThursday<T>;
begin
  Result := Self;
  FClose := Value;
end;

constructor TBuilderThursday<T>.Create(Parent: T);
begin
  FParent := Parent;
end;

destructor TBuilderThursday<T>.Destroy;
begin

  inherited;
end;

function TBuilderThursday<T>.&End: T;
begin
  Result := FParent;
  AddList;
end;

class function TBuilderThursday<T>.New(Parent: T): iThursday<T>;
begin
  Result := Self.Create(Parent);
end;

function TBuilderThursday<T>.Open(Value: String): iThursday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

{ TBuilderWednesday<T> }

procedure TBuilderWednesday<T>.AddList;
var
  I : Integer;
begin
  RootDTO.Business_Hours.Wednesday.Add(TWednesdayDTO.Create);
  I := RootDTO.Business_Hours.Wednesday.Count -1;
  RootDTO.Business_Hours.Wednesday[I].Open := FOpen;
  RootDTO.Business_Hours.Wednesday[I].Close := FClose;
end;

function TBuilderWednesday<T>.Close(Value: String): iWednesday<T>;
begin
  Result := Self;
  FClose := Value;
end;

constructor TBuilderWednesday<T>.Create(Parent: T);
begin
  FParent := Parent;
end;

destructor TBuilderWednesday<T>.Destroy;
begin

  inherited;
end;

function TBuilderWednesday<T>.&End: T;
begin
  Result := FParent;
  AddList;
end;

class function TBuilderWednesday<T>.New(Parent: T): iWednesday<T>;
begin
  Result := Self.Create(Parent);
end;

function TBuilderWednesday<T>.Open(Value: String): iWednesday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

{ TBuilderTuesday<T> }

procedure TBuilderTuesday<T>.AddList;
var
  I : Integer;
begin
  RootDTO.Business_Hours.Tuesday.Add(TTuesdayDTO.Create);
  I := RootDTO.Business_Hours.Tuesday.Count -1;
  RootDTO.Business_Hours.Tuesday[I].Open := FOpen;
  RootDTO.Business_Hours.Tuesday[I].Close := FClose;
end;

function TBuilderTuesday<T>.Close(Value: String): iTuesday<T>;
begin
  result := Self;
  FClose := Value;
end;

constructor TBuilderTuesday<T>.Create(Parent : T);
begin
  FParent := Parent;
end;

destructor TBuilderTuesday<T>.Destroy;
begin

  inherited;
end;

function TBuilderTuesday<T>.&End: T;
begin
  Result := FParent;
  AddList;
end;

class function TBuilderTuesday<T>.New(Parent : T): iTuesday<T>;
begin
  Result := Self.Create(parent);
end;

function TBuilderTuesday<T>.Open(Value: String): iTuesday<T>;
begin
  Result:= Self;
  FOpen := Value;
end;

{ TBuilderMonday<T> }

procedure TBuilderMonday<T>.AddList;
var
  I : Integer;
begin
  RootDTO.Business_Hours.Monday.Add(TMondayDTO.Create);
  I := RootDTO.Business_Hours.Monday.Count -1;
  RootDTO.Business_Hours.Monday[I].Open := FOpen;
  RootDTO.Business_Hours.Monday[I].Close := FClose;
end;

function TBuilderMonday<T>.Close(Value: String): iMonday<T>;
begin
  Result := Self;
  FClose := Value;
end;

constructor TBuilderMonday<T>.Create(Parent: T);
begin
  FParent := Parent;
end;

destructor TBuilderMonday<T>.Destroy;
begin

  inherited;
end;

function TBuilderMonday<T>.&End: T;
begin
  Result := FParent;
  AddList;
end;

class function TBuilderMonday<T>.New(Parent: T): iMonday<T>;
begin
  Result := Self.Create(Parent);
end;

function TBuilderMonday<T>.Open(Value: String): iMonday<T>;
begin
  Result := Self;
  FOpen := Value;
end;

{ TBuilderBusiness_Hours }

constructor TBuilderBusiness_Hours.Create(Parent : iStones);
begin
  FParent := Parent;
  FSunday := TBuilderSunday<iBusiness_Hours>.New(Self);
  FSaturday := TBuilderSaturday<iBusiness_Hours>.New(Self);
  FFriday := TBuilderFriday<iBusiness_Hours>.New(Self);
  FThursday := TBuilderThursday<iBusiness_Hours>.New(Self);
  FWednesday := TBuilderWednesday<iBusiness_Hours>.New(Self);
  FTuesday := TBuilderTuesday<iBusiness_Hours>.New(Self);
  FMonday := TBuilderMonday<iBusiness_Hours>.New(Self);
end;

destructor TBuilderBusiness_Hours.Destroy;
begin

  inherited;
end;

function TBuilderBusiness_Hours.&End: iStones;
begin
  Result := FParent;
end;

function TBuilderBusiness_Hours.Friday: iFriday<iBusiness_Hours>;
begin
  Result := FFriday;
end;

function TBuilderBusiness_Hours.Monday: iMonday<iBusiness_Hours>;
begin
  Result := FMonday;
end;

class function TBuilderBusiness_Hours.New(Parent : iStones): iBusiness_Hours;
begin
  Result := Self.Create(Parent);
end;

function TBuilderBusiness_Hours.Saturday: iSaturday<iBusiness_Hours>;
begin
  Result := FSaturday;
end;

function TBuilderBusiness_Hours.Sunday: iSunday<iBusiness_Hours>;
begin
  Result := FSunday;
end;

function TBuilderBusiness_Hours.Thursday: iThursday<iBusiness_Hours>;
begin
  Result := FThursday;
end;

function TBuilderBusiness_Hours.Tuesday: iTuesday<iBusiness_Hours>;
begin
  Result := FTuesday;
end;

function TBuilderBusiness_Hours.Wednesday: iWednesday<iBusiness_Hours>;
begin
  result := FWednesday;
end;

end.

