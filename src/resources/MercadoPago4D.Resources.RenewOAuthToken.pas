unit MercadoPago4D.Resources.RenewOAuthToken;

interface

uses
  MercadoPago4D.Resources.Interfaces,
  MercadoPago4D.Core.Interfaces;

type
  TRenewOAuthToken = class(TInterfacedObject, iRenewOAuthToken)
    private
      [weak]
      FParent : iMercadoPago4DConfiguration;
    public
      constructor Create(Parent : iMercadoPago4DConfiguration);
      destructor Destroy; override;
      class function New(Parent : iMercadoPago4DConfiguration) : iRenewOAuthToken;
      function MPConnect : iRenewOAuthToken;
      function AccesToken : iRenewOAuthToken;
      function ExpiresIn : Integer;
      function UserID : Integer;
  end;

implementation

function TRenewOAuthToken.AccesToken: iRenewOAuthToken;
begin
  Result := Self;
end;

constructor TRenewOAuthToken.Create(Parent : iMercadoPago4DConfiguration);
begin
  FParent := Parent;
end;

destructor TRenewOAuthToken.Destroy;
begin

  inherited;
end;

function TRenewOAuthToken.ExpiresIn: Integer;
begin

end;

function TRenewOAuthToken.MPConnect: iRenewOAuthToken;
begin
  Result := Self;
end;

class function TRenewOAuthToken.New (Parent : iMercadoPago4DConfiguration) : iRenewOAuthToken;
begin
  Result := Self.Create(Parent);
end;

function TRenewOAuthToken.UserID: Integer;
begin

end;

end.
