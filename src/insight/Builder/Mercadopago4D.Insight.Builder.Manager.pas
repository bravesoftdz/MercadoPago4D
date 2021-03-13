unit Mercadopago4D.Insight.Builder.Manager;

interface

uses
  Mercadopago4D.Insight.Builder.Interfaces;

type
  TManagerBuilder = class(TInterfacedObject, iManagerBuilder)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iManagerBuilder;
      function BuilderStores : iBuilderStores;
  end;

implementation

function TManagerBuilder.BuilderStores: iBuilderStores;
begin

end;

constructor TManagerBuilder.Create;
begin

end;

destructor TManagerBuilder.Destroy;
begin

  inherited;
end;

class function TManagerBuilder.New : iManagerBuilder;
begin
  Result := Self.Create;
end;

end.
