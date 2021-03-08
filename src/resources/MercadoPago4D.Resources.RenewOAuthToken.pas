unit MercadoPago4D.Resources.RenewOAuthToken;

interface

uses
  MercadoPago4D.Resources.Interfaces;

type
  TRenewOAuthToken = class(TInterfacedObject, iRenewOAuthToken)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iRenewOAuthToken;
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

constructor TRenewOAuthToken.Create;
begin

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

class function TRenewOAuthToken.New : iRenewOAuthToken;
begin
  Result := Self.Create;
end;

function TRenewOAuthToken.UserID: Integer;
begin

end;

end.
