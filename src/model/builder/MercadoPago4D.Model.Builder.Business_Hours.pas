unit MercadoPago4D.Model.Builder.Business_Hours;

interface

uses
  MercadoPago4D.Model.Builder.Interfaces,
  Mercadopago4D.Model.DTO.Stores,
  MercadoPago4D.Model.Builder.Sunday,
  MercadoPago4D.Model.Builder.Saturday,
  MercadoPago4D.Model.Builder.Friday,
  MercadoPago4D.Model.Builder.Thursday,
  MercadoPago4D.Model.Builder.Wednesday,
  MercadoPago4D.Model.Builder.Tuesday,
  MercadoPago4D.Model.Builder.Monday;

type
  TBuilderBusiness_Hours = class(TInterfacedObject, iBusiness_Hours)
    private
      [weak]
      FParent : iStores;
      FStoresDTO : TStoresDTO;
      FSunday : iSunday<iBusiness_Hours>;
      FSaturday : iSaturday<iBusiness_Hours>;
      FFriday : iFriday<iBusiness_Hours>;
      FThursday : iThursday<iBusiness_Hours>;
      FWednesday : iWednesday<iBusiness_Hours>;
      FTuesday : iTuesday<iBusiness_Hours>;
      FMonday : iMonday<iBusiness_Hours>;
    public
      constructor Create(Parent : iStores; Value : TStoresDTO);
      destructor Destroy; override;
      class function New(Parent : iStores; Value : TStoresDTO) : iBusiness_Hours;
      function Sunday : iSunday<iBusiness_Hours>;
      function Saturday : iSaturday<iBusiness_Hours>;
      function Friday : iFriday<iBusiness_Hours>;
      function Thursday : iThursday<iBusiness_Hours>;
      function Wednesday : iWednesday<iBusiness_Hours>;
      function Tuesday : iTuesday<iBusiness_Hours>;
      function Monday : iMonday<iBusiness_Hours>;
      function &End : iStores;
  end;

implementation

{ TBuilderBusiness_Hours }

constructor TBuilderBusiness_Hours.Create(Parent : iStores; Value : TStoresDTO);
begin
  FParent := Parent;
  FStoresDTO := Value;
  FSunday := TBuilderSunday<iBusiness_Hours>.New(Self,FStoresDTO);
  FSaturday := TBuilderSaturday<iBusiness_Hours>.New(Self,FStoresDTO);
  FFriday := TBuilderFriday<iBusiness_Hours>.New(Self,FStoresDTO);
  FThursday := TBuilderThursday<iBusiness_Hours>.New(Self,FStoresDTO);
  FWednesday := TBuilderWednesday<iBusiness_Hours>.New(Self,FStoresDTO);
  FTuesday := TBuilderTuesday<iBusiness_Hours>.New(Self,FStoresDTO);
  FMonday := TBuilderMonday<iBusiness_Hours>.New(Self,FStoresDTO);
end;

destructor TBuilderBusiness_Hours.Destroy;
begin

  inherited;
end;

function TBuilderBusiness_Hours.&End: iStores;
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

class function TBuilderBusiness_Hours.New(Parent : iStores; Value : TStoresDTO) : iBusiness_Hours;
begin
  Result := Self.Create(Parent, Value);
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
  Result := FWednesday;
end;

end.
