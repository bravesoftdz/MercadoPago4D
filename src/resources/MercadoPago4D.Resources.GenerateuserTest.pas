unit MercadoPago4D.Resources.GenerateuserTest;

interface

uses
  MercadoPago4D.Resources.Interfaces;

type
  TGenerateUserTest = class(TInterfacedObject, iGenerateUserTest)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iGenerateUserTest;
      function Generate : iGenerateUserTest;
  end;

implementation

constructor TGenerateUserTest.Create;
begin

end;

destructor TGenerateUserTest.Destroy;
begin

  inherited;
end;

function TGenerateUserTest.Generate: iGenerateUserTest;
begin
  Result := Self;
end;

class function TGenerateUserTest.New : iGenerateUserTest;
begin
  Result := Self.Create;
end;

end.
