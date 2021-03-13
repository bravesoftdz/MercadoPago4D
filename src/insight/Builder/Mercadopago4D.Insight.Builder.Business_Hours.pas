unit Mercadopago4D.Insight.Builder.Business_Hours;

interface

uses
  Mercadopago4D.Insight.Builder.Interfaces, Mercadopago4D.Insight.DTO.Stores;

type

  TBuilderBusiness_Hours = class(TInterfacedObject, iBuilderBusiness_Hours)
    private
      [weak]
      FParent : iBuilderStores;
      FRoot : TStoresDTO;
      FSunday : iBuilderSunday<iBuilderBusiness_Hours>;
      FSaturday : iBuilderSaturday<iBuilderBusiness_Hours>;
      FFriday : iBuilderFriday<iBuilderBusiness_Hours>;
      FThursday : iBuilderThursday<iBuilderBusiness_Hours>;
      FWednesday : iBuilderWednesday<iBuilderBusiness_Hours>;
      FTuesday : iBuilderTuesday<iBuilderBusiness_Hours>;
      FMonday : iBuilderMonday<iBuilderBusiness_Hours>;
    public
      constructor Create(Parent : iBuilderStores; Root : TStoresDTO);
      destructor Destroy; override;
      class function New(Parent : iBuilderStores; Root : TStoresDTO) : iBuilderBusiness_Hours;
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

{ TBuilderBusiness_Hours }

constructor TBuilderBusiness_Hours.Create(Parent : iBuilderStores; Root : TStoresDTO);
begin
  FParent := Parent;
  FRoot := Root;
end;

destructor TBuilderBusiness_Hours.Destroy;
begin

  inherited;
end;

function TBuilderBusiness_Hours.&End: iBuilderStores;
begin
  Result := FParent;
end;

function TBuilderBusiness_Hours.Friday: iBuilderFriday<iBuilderBusiness_Hours>;
begin
  Result := FFriday;
end;

function TBuilderBusiness_Hours.Monday: iBuilderMonday<iBuilderBusiness_Hours>;
begin
  Result := FMonday;
end;

class function TBuilderBusiness_Hours.New(Parent : iBuilderStores; Root : TStoresDTO) : iBuilderBusiness_Hours;
begin
  Result := Self.Create(Parent, Root);
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
