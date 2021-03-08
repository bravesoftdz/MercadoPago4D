unit MercadoPago4D.Resources.OAuthToken;

interface

uses
  MercadoPago4D.Resources.Interfaces;

type
  TOAuthToken = class(TInterfacedObject, iOAuthToken)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iOAuthToken;
      function MPConnect : iOAuthToken;
      function AccesToken : String;
      function ExpiresIn : Integer;
      function UserID : Integer;
  end;

implementation

function TOAuthToken.AccesToken: String;
begin

end;

constructor TOAuthToken.Create;
begin

end;

destructor TOAuthToken.Destroy;
begin

  inherited;
end;

function TOAuthToken.ExpiresIn: Integer;
begin

end;

function TOAuthToken.MPConnect: iOAuthToken;
begin
  Result := Self;
end;

class function TOAuthToken.New : iOAuthToken;
begin
  Result := Self.Create;
end;

function TOAuthToken.UserID: Integer;
begin

end;

end.
