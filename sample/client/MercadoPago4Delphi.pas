unit MercadoPago4Delphi;

interface

uses
  MercadoPago4D;

var
  _MercadoPago4D : iMercadoPago4D;

implementation

const
  CLientID = '17552238';
  AccessToken = 'APP_USR-8656261441103947-020220-7aee7ec199adcbd1f4fc047883053119-17552238';

initialization
  _MercadoPago4D := TMercadoPago4D.New;

  _MercadoPago4D
    .Configuration
      .ClientID(CLientID)
      .AccessToken(AccessToken);

end.
