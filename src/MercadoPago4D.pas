unit MercadoPago4D;

interface

uses
  MercadoPago4D.Core.Interfaces;

type
  TMercadoPago4D = class(TInterfacedObject, iMercadoPago4D)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iMercadoPago4D;
    function Configuration: iMercadoPago4DConfiguration;
    function Manager : iMercadoPago4DManager;
  end;

implementation

function TMercadoPago4D.Configuration: iMercadoPago4DConfiguration;
begin
  Result := TMercadoPago4DConfiguration.New;
end;

constructor TMercadoPago4D.Create;
begin

end;

destructor TMercadoPago4D.Destroy;
begin

  inherited;
end;

function TMercadoPago4D.Manager: iMercadoPago4DManager;
begin
  Result := TMercadoPago4DManager.New;
end;

class function TMercadoPago4D.New: iMercadoPago4D;
begin
  Result := Self.Create;
end;

end.
