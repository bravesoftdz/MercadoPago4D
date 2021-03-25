unit MercadoPago4D.Services.Interfaces;

interface

uses
  MercadoPago4D.Model.Builder.Interfaces, Data.DB;

type
  THTTPServices = (GET, POST, PUT, DELETE);

    iAccreditation = interface
      function StoreID(Value : String) : iAccreditation;
      function QrID(Value : String) : iAccreditation;
      function ExternalID(Value : String) : iAccreditation;
      function PosID(Value : String) : iAccreditation;
      function Size(Value : String) : iAccreditation;

      function DataSet(Value : TDataSet) : iAccreditation;
      function Content : String;
      function StatusCode : Integer;

      function CreateStore(Value : iStores) : iAccreditation;
      function UpdateStore(Value : iStores) : iAccreditation;
      function SearchStores : iAccreditation;
      function DeleteStore : iAccreditation;
      function GenerateQRCode(Value : iQrCode) : iAccreditation;
      function UpdateQRCode(Value : iQrCode) : iAccreditation;
      function SearchGeneralQRs : iAccreditation;
      function SearchQRforExternal_ID : iAccreditation;
      function DeleteQrCode : iAccreditation;
      function PrintQRManually : iAccreditation;
      function OAuthAuthorization : iAccreditation;
      function OAuthRenewal : iAccreditation;
    end;

    iTransactional = interface
      function ExternalID(Value : String) : iTransactional;
      function PosID(Value : String) : iTransactional;
      function OrderID(Value : String) : iTransactional;
      function ExternalReference(Value : String) : iTransactional;

      function LoadOrderinQR(Value : iOrder) : iTransactional;
      function CheckQRAvailability : iTransactional;
      function DeleteOrderinQR : iTransactional;
      function ViewOrder : iTransactional;
      function SearchOrder : iTransactional;

      function DataSet(Value : TDataSet) : iTransactional;
      function Content : String;
      function StatusCode : Integer;
    end;

    iAfterSales = interface
      function PaymentID(Value : String) : iAfterSales;

      function ConsultPayment : iAfterSales;
      function SearchPayment : iAfterSales;
      function PaymentReturnRefund : iAfterSales;
      function ReturnPartialPaymentRefund(Value : iPartial) : iAfterSales;

      function DataSet(Value : TDataSet) : iAfterSales;
      function Content : String;
      function StatusCode : Integer;
    end;

    iGenerateTestUser = interface
      function GenerateTestUser(Value : iTestUser) : iGenerateTestUser;

      function DataSet(Value : TDataSet) : iGenerateTestUser;
      function Content : String;
      function StatusCode : Integer;
    end;

implementation

end.
