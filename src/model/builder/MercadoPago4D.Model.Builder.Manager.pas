unit MercadoPago4D.Model.Builder.Manager;

interface

uses
  MercadoPago4D.Model.Builder.Interfaces,
  MercadoPago4D.Model.Builder.Stores,
  MercadoPago4D.Model.Builder.QrCode,
  MercadoPago4D.Model.Builder.Order,
  MercadoPago4D.Model.Builder.Partial,
  MercadoPago4D.Model.Builder.TestUser;

type
  TBuilderManager = class(TInterfacedObject, iBuilderManager)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iBuilderManager;
      function Stores : iStores;
      function QrCode : iQrCode;
      function Order : iOrder;
      function Partial : iPartial;
      function TestUser : iTestUser;
  end;

implementation

constructor TBuilderManager.Create;
begin

end;

destructor TBuilderManager.Destroy;
begin

  inherited;
end;

class function TBuilderManager.New : iBuilderManager;
begin
  Result := Self.Create;
end;

function TBuilderManager.Order: iOrder;
begin
  Result := TOrder.New;
end;

function TBuilderManager.Partial: iPartial;
begin
  Result := TPartial.New;
end;

function TBuilderManager.QrCode: iQrCode;
begin
  Result := TQrCode.New;
end;

function TBuilderManager.Stores: iStores;
begin
  Result := TBuilderStores.New;
end;

function TBuilderManager.TestUser: iTestUser;
begin
  Result := TTesteUser.New;
end;

end.
