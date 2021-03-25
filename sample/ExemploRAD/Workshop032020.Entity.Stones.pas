unit Workshop032020.Entity.Stones;

interface

uses
  Workshop032020.Entity.Interfaces,
  Workshop032020.Entity.StoresDTO,
  System.JSON,
  REST.Json;

type
  TBuilderStones = class(TInterfacedObject, iStones)
    private
      FRootDTO : TRootDTO;
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

implementation

function TBuilderStones.Business_Hours: iBusiness_Hours;
begin
  Result := FBusiness_Hours;
end;

function TBuilderStones.Content: String;
var
  json : tjsonobject;
begin
  json := TJSON.ObjectToJsonObject(RootDTO);
  Result := json.format;
end;

constructor TBuilderStones.Create;
begin
  FRootDTO := TRootDTO.Create;
  FLocation := TBuilderLocation<iStones>.New(Self);
  FBusiness_Hours := TBuilderBusoness_Hours.New(FRootDTO);
end;

destructor TBuilderStones.Destroy;
begin
  FRootDTO.Free;
  inherited;
end;

function TBuilderStones.External_Id(Value: String): iStones;
begin
  Result := Self;
  FRootDTO.External_Id := Value;
end;

function TBuilderStones.Location: iLocation<iStones>;
begin
  Result := FLocation;
end;

function TBuilderStones.Name(Value: String): iStones;
begin
  Result := Self;
  FRootDTO.Name := Value;
end;

class function TBuilderStones.New : iStones;
begin
  Result := Self.Create;
end;

end.
