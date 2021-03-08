unit Mercadopago4D.Insight.DTO.BuilderStores;

interface

uses
  Mercadopago4D.Insight.DTO.Interfaces,
  Mercadopago4D.Insight.DTO.Stores;

type
  TBuilderStores = class(TInterfacedObject, iStores)
    private
      FLocation : iLocation<iStores>;
      FBusiness_Hours : iBusiness_Hours;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iStores;
      function Name(Value : String) : iStores;
      function External_Id(Value : String) : iStores;
      function Location : iLocation<iStores>;
      function Business_Hours : iBusiness_Hours;
      function Content : String;
  end;

implementation

function TBuilderStores.Business_Hours: iBusiness_Hours;
begin

end;

function TBuilderStores.Content: String;
begin

end;

constructor TBuilderStores.Create;
begin

end;

destructor TBuilderStores.Destroy;
begin

  inherited;
end;

function TBuilderStores.External_Id(Value: String): iStores;
begin

end;

function TBuilderStores.Location: iLocation<iStores>;
begin

end;

function TBuilderStores.Name(Value: String): iStores;
begin

end;

class function TBuilderStores.New : iStores;
begin
  Result := Self.Create;
end;

end.
