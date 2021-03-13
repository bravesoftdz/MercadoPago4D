unit MercadoPago4Delphi;

interface

uses
  MercadoPago4D,
  MercadoPago4D.Core.Interfaces;

var
  _MercadoPago4D : iMercadoPago4D;

implementation
  const
    CLIENT_ID = 726225177;
    ACCESS_TOKEN = 'APP_USR-6249164862669891-030920-82c50f2a7c59d49dbc17277462895430-726225177';

initialization
  _MercadoPago4D := TMercadoPago4D.New;

  _MercadoPago4D
    .Configuration
      .ClientID(CLIENT_ID)
      .AccessToken(ACCESS_TOKEN);
end.
