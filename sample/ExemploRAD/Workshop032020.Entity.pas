unit Workshop032020.Entity;

interface

uses
  System.Generics.Collections;

type
  TLocation = class
    private
      Flatitude: String;
      Fzip_code: String;
      Fstreet_number: String;
      Fcity_name: String;
      Flongitude: String;
      Fstreet_name: String;
      Freference: String;
      Fstate_name: String;
    public
      property Zip_code : String read Fzip_code write Fzip_code;
      property Street_number : String read Fstreet_number write Fstreet_number;
      property Street_name : String read Fstreet_name write Fstreet_name;
      property City_name : String read Fcity_name write Fcity_name;
      property State_name : String read Fstate_name write Fstate_name;
      property Latitude : String read Flatitude write Flatitude;
      property Longitude : String read Flongitude write Flongitude;
      property Reference : String read Freference write Freference;
  end;

  TSunday = class
    private
    FOpen: string;
    FClose: string;
    public
      property Close : string read FClose write FClose;
      property Open : string read FOpen write FOpen;
  end;

  TSaturday = class
    private
    FOpen: string;
    FClose: string;
    public
      property Close : string read FClose write FClose;
      property Open : string read FOpen write FOpen;
  end;

  TFriday = class
    private
    FOpen: string;
    FClose: string;
    public
      property Close : string read FClose write FClose;
      property Open : string read FOpen write FOpen;
  end;

  TThursday = class
    private
    FOpen: string;
    FClose: string;
    public
      property Close : string read FClose write FClose;
      property Open : string read FOpen write FOpen;
  end;

  TWednesday = class
    private
    FOpen: string;
    FClose: string;
    public
      property Close : string read FClose write FClose;
      property Open : string read FOpen write FOpen;
  end;

  TTuesday = class
    private
    FOpen: string;
    FClose: string;
    public
      property Close : string read FClose write FClose;
      property Open : string read FOpen write FOpen;
  end;

  TMonday = class
    private
    FOpen: string;
    FClose: string;
    public
      property Close : string read FClose write FClose;
      property Open : string read FOpen write FOpen;
  end;

  TBusiness_Hour = class
    private
      [JSONName('tuesday')]
      FTuesdayArray: TArray<TTuesday>;
      [GenericListReflect]
      FTuesday: TObjectList<TTuesday>;
      function GetFriday: TObjectList<TFriday>;
      function GetMonday: TObjectList<TMonday>;
      function GetSaturday: TObjectList<TSaturday>;
      function GetSunday: TObjectList<TSunday>;
      function GetThursday: TObjectList<TThursday>;
      function GetTuesday: TObjectList<TTuesday>;
      function GetWednesday: TObjectList<TWednesday>;
    public
      property Friday : TObjectList<TFriday> read GetFriday;
      property Monday : TObjectList<TMonday> read GetMonday;
      property Saturday : TObjectList<TSaturday> read GetSaturday;
      property Sunday : TObjectList<TSunday> read GetSunday;
      property Thursday : TObjectList<TThursday> read GetThursday;
      property Tuesday : TObjectList<TTuesday> read GetTuesday;
      property Wednesday : TObjectList<TWednesday> read GetWednesday;
      destructor Destroy; override;
  end;

implementation

{ TBusiness_Hour }

destructor TBusiness_Hour.Destroy;
begin
  GetFriday.Free;
  GetTuesday.Free;
  GetWednesday.Free;
  GetThursday.Free;
  GetFriday.Free;
  GetSaturday.Free;
  GetSunday.Free;
  inherited;
end;

function TBusiness_Hour.GetFriday: TObjectList<TFriday>;
begin
  if not Assigned(FTuesday) then
  begin
    FTuesday := TObjectList<TTuesday>.Create;
    FTuesday.AddRange(FTuesdayArray);
  end;
  Result := FTuesday;
end;

function TBusiness_Hour.GetMonday: TObjectList<TMonday>;
begin

end;

function TBusiness_Hour.GetSaturday: TObjectList<TSaturday>;
begin

end;

function TBusiness_Hour.GetSunday: TObjectList<TSunday>;
begin

end;

function TBusiness_Hour.GetThursday: TObjectList<TThursday>;
begin

end;

function TBusiness_Hour.GetTuesday: TObjectList<TTuesday>;
begin

end;

function TBusiness_Hour.GetWednesday: TObjectList<TWednesday>;
begin

end;

end.
