unit MercadoPago4D.Resources.Manager;

interface

type
  TMercadoPago4DManager = class(TInterfacedObject, iMercadoPago4DManager)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iMercadoPago4DManager;
  end;

implementation

constructor TMercadoPago4DManager.Create;
begin

end;

destructor TMercadoPago4DManager.Destroy;
begin

  inherited;
end;

class function TMercadoPago4DManager.New : iMercadoPago4DManager;
begin
  Result := Self.Create;
end;

end.
