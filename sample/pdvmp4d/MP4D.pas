unit MP4D;

interface

uses
  MercadoPago4D;

var
  _MercadoPago4D : iMercadoPago4D;

implementation

const
  CLientID = '726225177';
  AccessToken = 'APP_USR-6249164862669891-030920-82c50f2a7c59d49dbc17277462895430-726225177';

initialization
  _MercadoPago4D := TMercadoPago4D.New;

  _MercadoPago4D
      .Configuration
        .ClientID(CLientID)
        .AccessToken(AccessToken);
end.
