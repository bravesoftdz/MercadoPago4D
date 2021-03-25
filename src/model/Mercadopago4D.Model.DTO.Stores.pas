unit Mercadopago4D.Model.DTO.Stores;

interface

uses
  Pkg.Json.DTO,
  System.Generics.Collections,
  REST.Json.Types;

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
    FZip_Code: string;
  published
    property City_name: string read FCity_name write FCity_name;
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
  
  TStoresDTO = class(TJsonDTO)
  private
    FBusiness_hours: TBusiness_hoursDTO;
    FDate_Creation: TDateTime;
    FExternal_id: string;
    FLocation: TLocationDTO;
    FName: string;
  published
    property Business_hours: TBusiness_hoursDTO read FBusiness_hours write FBusiness_hours;
    property Date_Creation: TDateTime read FDate_Creation write FDate_Creation;
    property External_id: string read FExternal_id write FExternal_id;
    property Location: TLocationDTO read FLocation write FLocation;
    property Name: string read FName write FName;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

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

{ TStoresDTO }

constructor TStoresDTO.Create;
begin
  inherited;
  FBusiness_hours := TBusiness_hoursDTO.Create;
  FLocation := TLocationDTO.Create;
end;

destructor TStoresDTO.Destroy;
begin
  FBusiness_Hours.Free;
  FLocation.Free;
  inherited;
end;

end.
