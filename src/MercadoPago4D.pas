unit MercadoPago4D;

interface

uses
  MercadoPago4D.Core.Interfaces,
  MercadoPago4D.Core.Manager,
  MercadoPago4D.Core.Configuration,
  MercadoPago4D.Model.Builder.Interfaces,
  MercadoPago4D.Model.Builder.Manager;

type
  iMercadoPago4D = interface
    function Configuration : iConfiguration;
    function BuilderManager : iBuilderManager;
    function Manager : iManager;
  end;

  TMercadoPago4D = class(TInterfacedObject, iMercadoPago4D)
    private
      FConfig : iConfiguration;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iMercadoPago4D;
      function Configuration : iConfiguration;
      function BuilderManager : iBuilderManager;
      function Manager : iManager;
  end;

implementation

function TMercadoPago4D.BuilderManager: iBuilderManager;
begin
  Result := TBuilderManager.New;
end;

function TMercadoPago4D.Configuration: iConfiguration;
begin
  FConfig := TConfiguration.New;
  Result := FConfig;
end;

constructor TMercadoPago4D.Create;
begin

end;

destructor TMercadoPago4D.Destroy;
begin

  inherited;
end;

function TMercadoPago4D.Manager: iManager;
begin
  Result := TManager.New(FConfig);
end;

class function TMercadoPago4D.New : iMercadoPago4D;
begin
  Result := Self.Create;
end;

end.
