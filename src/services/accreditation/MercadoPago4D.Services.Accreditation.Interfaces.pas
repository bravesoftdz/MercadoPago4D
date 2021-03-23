unit MercadoPago4D.Services.Accreditation.Interfaces;

interface

uses
  MercadoPago4D.DTO.Builder.Interfaces;

type
  iAccreditation = interface
    function CreateStore(Value : iBuilderStores) : iAccreditation;
//    function UpdateStore : iBuilderStores;
//    function SearchStores : iBuilderStores;
//    function DeleteStores : iBuilderStores;
//    function GenerateQRCode : iBuilderStores;
//    function UpdateQRCode : iBuilderStores;
//    function SearchQRsCode : iBuilderStores;
//    function SearchQRExternalID : iBuilderStores;
//    function DeleteQRCode : iBuilderStores;
//    function PrintQRManually : iBuilderStores;
//    function OAuthAutorization : iBuilderStores;
//    function OAuthRenovation : iBuilderStores;
  end;

implementation

end.
