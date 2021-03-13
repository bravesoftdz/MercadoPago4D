unit MercadoPago4D.Resources;

interface

uses
  MercadoPago4D.Core.Interfaces,
  MercadoPago4D.Resources.Interfaces;

type
  TMercadoPago4DResources = class(TInterfacedObject, iMercadoPago4DResources)
    private
      [weak]
      FParent : iMercadoPago4DConfiguration;
    public
      constructor Create(Parent : iMercadoPago4DConfiguration);
      destructor Destroy; override;
      class function New(Parent : iMercadoPago4DConfiguration) : iMercadoPago4DResources;
      function OAuthToken : iOAuthToken;
      function RenewOAuthToken : iRenewOAuthToken;
      function Store : iStore;
      function QRCode : iQRCode;
      function ChargeOrderQR : iChargeOrderQR;
      function AfterSales : iAfterSales;
      function GenerateUserTest : iGenerateUserTest;
  end;

implementation

uses
  MercadoPago4D.Resources.OAuthToken,
  MercadoPago4D.Resources.RenewOAuthToken,
  MercadoPago4D.Resources.Store,
  MercadoPago4D.Resources.QRCode,
  MercadoPago4D.Resources.ChargeOrderQR,
  MercadoPago4D.Resources.AfterSales,
  MercadoPago4D.Resources.GenerateuserTest;

function TMercadoPago4DResources.AfterSales: iAfterSales;
begin
  Result := TAfterSales.New(FParent);
end;

function TMercadoPago4DResources.ChargeOrderQR: iChargeOrderQR;
begin
  Result := TChargeOrderQR.New(FParent);
end;

constructor TMercadoPago4DResources.Create(Parent : iMercadoPago4DConfiguration);
begin
  FParent := Parent;
end;

destructor TMercadoPago4DResources.Destroy;
begin

  inherited;
end;

function TMercadoPago4DResources.GenerateUserTest: iGenerateUserTest;
begin
  Result := TGenerateuserTest.New(FParent);
end;

class function TMercadoPago4DResources.New(Parent : iMercadoPago4DConfiguration) : iMercadoPago4DResources;
begin
  Result := Self.Create(Parent);
end;

function TMercadoPago4DResources.OAuthToken: iOAuthToken;
begin
  Result := TOAuthToken.New(FParent);
end;

function TMercadoPago4DResources.QRCode: iQRCode;
begin
  Result := TQRCode.New(FParent);
end;

function TMercadoPago4DResources.RenewOAuthToken: iRenewOAuthToken;
begin
  Result := TRenewOAuthToken.New(FParent);
end;

function TMercadoPago4DResources.Store: iStore;
begin
  Result := TStore.New(FParent);
end;

end.
