unit MercadoPago4D.Core.Credentials;

interface

type
  TAccessToken = class
    private
      FLive_mode: Boolean;
      FScope: String;
      FExpires_in: Integer;
      FToken_type: String;
      FUser_id: Integer;
      FAccess_token: String;
    public
      property Access_token : String read FAccess_token write FAccess_token;
      property Token_type : String read FToken_type write FToken_type;
      property Expires_in : Integer read FExpires_in write FExpires_in;
      property Scope : String read FScope write FScope;
      property User_id : Integer read FUser_id write FUser_id;
      property Live_mode : Boolean read FLive_mode write FLive_mode;
  end;

  TToken = class
    private
      FCliente_id: String;
      FClient_secret: String;
      FGrant_type: String;
    public
      property Client_id : String read FCliente_id write FCliente_id;
      property Client_secret : String read FClient_secret write FClient_secret;
      property Grant_type : String read FGrant_type write FGrant_type;
  end;

  iBuilderToken = interface
    function Client_id(Value : String) : iBuilderToken;
    function Client_sercret(Value : String) : iBuilderToken;
    function AccesToken : String;
    function UserID : Integer;
  end;

  TBuilderToken = class(TInterfacedObject, iBuilderToken)
    private
      FToken : TToken;
      FAccessToken : TAccessToken;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iBuilderToken;
      function Client_id(Value : String) : iBuilderToken;
      function Client_sercret(Value : String) : iBuilderToken;
      function AccesToken : String;
      function UserID : Integer;
  end;

implementation

{ TBuilderToken }

function TBuilderToken.AccesToken: String;
begin
  Result := FAccessToken.Access_token;
end;

function TBuilderToken.Client_id(Value: String): iBuilderToken;
begin
  FToken.Client_id := Value;
end;

function TBuilderToken.Client_sercret(Value: String): iBuilderToken;
begin
  FToken.Client_secret := Value;
end;

constructor TBuilderToken.Create;
begin
  FToken := TToken.Create;
  FToken.Grant_type := 'client_credentials';

  FAccessToken := TAccessToken.Create;
end;

destructor TBuilderToken.Destroy;
begin
  FToken.DisposeOf;
  FAccessToken.DisposeOf;
  inherited;
end;

class function TBuilderToken.New: iBuilderToken;
begin
  Result := Self.Create;
end;

function TBuilderToken.UserID: Integer;
begin
  Result := FAccessToken.User_id;
end;

end.
