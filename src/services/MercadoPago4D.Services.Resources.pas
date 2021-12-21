unit MercadoPago4D.Services.Resources;

interface

uses
  MercadoPago4D.Core.Interfaces,
  MercadoPago4D.Services.Interfaces,
  MercadoPago4D.Services.Accreditation,
  MercadoPago4D.Services.Transactional,
  MercadoPago4D.Services.AfterSales;

type
  TResources = class(TInterfacedObject, iResources)
    private
      [weak]
      FParent : iConfiguration;
    public
      constructor Create(Parent : iConfiguration);
      destructor Destroy; override;
      class function New(Parent : iConfiguration) : iResources;
      function Accreditation : iAccreditation;
      function Transactional : iTransactional;
      function AfterSales : iAfterSales;
      function GenerateTestUser : iGenerateTestUser;
  end;

implementation

function TResources.Accreditation: iAccreditation;
begin
  Result := TAccreditation.New(FParent);
end;

function TResources.AfterSales: iAfterSales;
begin
  Result := TAfterSales.New( FParent );
end;

constructor TResources.Create(Parent : iConfiguration);
begin
  FParent := Parent;
end;

destructor TResources.Destroy;
begin

  inherited;
end;

function TResources.GenerateTestUser: iGenerateTestUser;
begin

end;

class function TResources.New (Parent : iConfiguration) : iResources;
begin
  Result := Self.Create(Parent);
end;

function TResources.Transactional: iTransactional;
begin
  Result := TTransactional.New(FParent);
end;

end.
