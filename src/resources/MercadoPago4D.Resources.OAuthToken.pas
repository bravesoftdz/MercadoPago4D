unit MercadoPago4D.Resources.OAuthToken;

interface

uses
  MercadoPago4D.Resources.Interfaces,
  MercadoPago4D.Core.Interfaces;

type
  TOAuthToken = class(TInterfacedObject, iOAuthToken)
    private
      [weak]
      FParent : iMercadoPago4DConfiguration;
    public
      constructor Create(Parent : iMercadoPago4DConfiguration);
      destructor Destroy; override;
      class function New(Parent : iMercadoPago4DConfiguration) : iOAuthToken;
      function MPConnect : iOAuthToken;
      function AccesToken : String;
      function ExpiresIn : Integer;
      function UserID : Integer;
  end;

implementation

function TOAuthToken.AccesToken: String;
begin

end;

constructor TOAuthToken.Create(Parent : iMercadoPago4DConfiguration);
begin
  FParent := Parent;
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

class function TOAuthToken.New (Parent : iMercadoPago4DConfiguration) : iOAuthToken;
begin
  Result := Self.Create(Parent);
end;

function TOAuthToken.UserID: Integer;
begin

end;

end.
