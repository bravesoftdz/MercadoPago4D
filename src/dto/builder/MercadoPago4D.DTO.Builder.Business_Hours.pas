unit MercadoPago4D.DTO.Builder.Business_Hours;

interface

uses
  MercadoPago4D.DTO.Builder.Interfaces, Mercadopago4D.Insight.DTO.Stores;

type
  TBuilderBusiness_Hours = class(TInterfacedObject, iBuilderBusiness_Hours)
    private
      [weak]
      FParent : iBuilderStores;
      FStoresDTO : TStoresDTO;
      FSunday : iBuilderSunday<iBuilderBusiness_Hours>;
      FSaturday : iBuilderSaturday<iBuilderBusiness_Hours>;
      FFriday : iBuilderFriday<iBuilderBusiness_Hours>;
      FThursday : iBuilderThursday<iBuilderBusiness_Hours>;
      FWednesday : iBuilderWednesday<iBuilderBusiness_Hours>;
      FTuesday : iBuilderTuesday<iBuilderBusiness_Hours>;
      FMonday : iBuilderMonday<iBuilderBusiness_Hours>;
    public
      constructor Create(Parent : iBuilderStores; Stores : TStoresDTO);
      destructor Destroy; override;
      class function New(Parent : iBuilderStores; Stores : TStoresDTO) : iBuilderBusiness_Hours;
      function Sunday : iBuilderSunday<iBuilderBusiness_Hours>;
      function Saturday : iBuilderSaturday<iBuilderBusiness_Hours>;
      function Friday : iBuilderFriday<iBuilderBusiness_Hours>;
      function Thursday : iBuilderThursday<iBuilderBusiness_Hours>;
      function Wednesday : iBuilderWednesday<iBuilderBusiness_Hours>;
      function Tuesday : iBuilderTuesday<iBuilderBusiness_Hours>;
      function Monday : iBuilderMonday<iBuilderBusiness_Hours>;
      function &End : iBuilderStores;
  end;

implementation

uses
  MercadoPago4D.DTO.Builder.Sunday,
  MercadoPago4D.DTO.Builder.Saturday,
  MercadoPago4D.DTO.Builder.Thursday,
  MercadoPago4D.DTO.Builder.Friday,
  MercadoPago4D.DTO.Builder.Wednesday,
  MercadoPago4D.DTO.Builder.Tuesday,
  MercadoPago4D.DTO.Builder.Monday;

function TBuilderBusiness_Hours.&End: iBuilderStores;
begin
  Result := FParent;
end;

constructor TBuilderBusiness_Hours.Create(Parent : iBuilderStores; Stores : TStoresDTO);
begin
  FParent := Parent;
  FStoresDTO := Stores;

  FSunday := TBuilderSunday<iBuilderBusiness_Hours>.New(Self, FStoresDTO);
  FSaturday := TBuilderSaturday<iBuilderBusiness_Hours>.New(Self, FStoresDTO);
  FFriday := TBuilderFriday<iBuilderBusiness_Hours>.New(Self, FStoresDTO);
  FThursday := TBuilderThursday<iBuilderBusiness_Hours>.New(Self, FStoresDTO);
  FWednesday := TBuilderWednesday<iBuilderBusiness_Hours>.New(Self, FStoresDTO);
  FTuesday := TBuilderTuesday<iBuilderBusiness_Hours>.New(Self, FStoresDTO);
  FMonday := TBuilderMonday<iBuilderBusiness_Hours>.New(Self, FStoresDTO);
end;

destructor TBuilderBusiness_Hours.Destroy;
begin

  inherited;
end;

function TBuilderBusiness_Hours.Friday: iBuilderFriday<iBuilderBusiness_Hours>;
begin
  Result := FFriday;
end;

function TBuilderBusiness_Hours.Monday: iBuilderMonday<iBuilderBusiness_Hours>;
begin
  Result := FMonday;
end;

class function TBuilderBusiness_Hours.New (Parent : iBuilderStores; Stores : TStoresDTO) : iBuilderBusiness_Hours;
begin
  Result := Self.Create(Parent, Stores);
end;

function TBuilderBusiness_Hours.Saturday: iBuilderSaturday<iBuilderBusiness_Hours>;
begin
  Result := FSaturday;
end;

function TBuilderBusiness_Hours.Sunday: iBuilderSunday<iBuilderBusiness_Hours>;
begin
  Result := FSunday;
end;

function TBuilderBusiness_Hours.Thursday: iBuilderThursday<iBuilderBusiness_Hours>;
begin
  Result := FThursday;
end;

function TBuilderBusiness_Hours.Tuesday: iBuilderTuesday<iBuilderBusiness_Hours>;
begin
  Result := FTuesday;
end;

function TBuilderBusiness_Hours.Wednesday: iBuilderWednesday<iBuilderBusiness_Hours>;
begin
  Result := FWednesday;
end;

end.
