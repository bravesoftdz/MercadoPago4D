unit MercadoPago4D.Services.Accreditation.Interfaces;

interface

uses
  MercadoPago4D.DTO.Builder.Interfaces;

type
  iCreateStore = interface
    function CreateStore : iBuilderStores;
  end;

implementation

end.
