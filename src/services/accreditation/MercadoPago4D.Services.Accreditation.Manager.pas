unit MercadoPago4D.Services.Accreditation.Manager;

interface

uses
  MercadoPago4D.Services.Accreditation.Interfaces,
  MercadoPago4D.Core.Interfaces,
  RESTRequest4D,
  MercadoPago4D.DTO.Builder.Interfaces;

type
  TServicesManagerAccreditation = class(TInterfacedObject, iAccreditation)
    private
      [weak]
      FParent : iMercadoPago4DConfiguration;

      const
        ENDPOINT = '/stores';
    public
      constructor Create(Parent : iMercadoPago4DConfiguration);
      destructor Destroy; override;
      class function New(Parent : iMercadoPago4DConfiguration) : iAccreditation;
      function CreateStore(Value : iBuilderStores) : iAccreditation;
  end;

implementation

uses
  System.SysUtils;

constructor TServicesManagerAccreditation.Create(Parent : iMercadoPago4DConfiguration);
begin
  FParent := Parent;
end;

function TServicesManagerAccreditation.CreateStore(
  Value: iBuilderStores): iAccreditation;
begin
  try
    TRequest.New
      .BaseURL(FParent.Enviroment.Base_URL+FParent.ClientID+ENDPOINT)
      .Accept('application/json')
      .Token('Bearer '+FParent.AccessToken)
      .AddBody(Value.Content)
      .Post;
  except on E: Exception do
    raise Exception.Create('Error ' + E.Message);
  end;
end;

destructor TServicesManagerAccreditation.Destroy;
begin

  inherited;
end;

class function TServicesManagerAccreditation.New (Parent : iMercadoPago4DConfiguration) : iAccreditation;
begin
  Result := Self.Create(Parent);
end;

end.
