unit MercadoPago4D.Resources.Interfaces;

interface

type
  //Credentials
  iOAuthToken = interface
    function MPConnect : iOAuthToken;
    function AccesToken : String;
    function ExpiresIn : Integer;
    function UserID : Integer;
  end;

  iRenewOAuthToken = interface
    function MPConnect : iRenewOAuthToken;
    function AccesToken : iRenewOAuthToken;
    function ExpiresIn : Integer;
    function UserID : Integer;
  end;

  iStore = interface
    function CreateStore : iStore;
    function UpdateStore : iStore;
    function SearchStores : iStore;
    function DelSotre : iStore;
    function StoreId(Value : String) : iStore;
  end;

  iQRCode = interface
    function CreateQRCode : iQRCode;
    function UpdateQRCOde : iQRCode;
    function SearchQRCode : iQRCode;
    function SearchQRCodeId : iQRCode;
    function DelQRCode : iQRCode;
    function PrintQRCode : iQRCode;
    function ExternalId(Value : String) : iQRCode;
    function QRId(Value : String) : iQRCode;
    function PosID(Value : String) : iQRCode;
    function Size(Value : String) : iQRCode;
  end;


  //Transational
  iChargeOrderQR = interface
    function LoadOrderQR : iChargeOrderQR;
    function CheckAvailability : iChargeOrderQR;
    function DelOrder : iChargeOrderQR;
    function ConsultationRequest : iChargeOrderQR;
    function SearchOrder : iChargeOrderQR;
    function ExternalId(Value : String) : iChargeOrderQR;
    function PosId(Value : String) : iChargeOrderQR;
    function OrderId(Value : String) : iChargeOrderQR;
    function ExternalReference(Value : String) : iChargeOrderQR;
    function DateCreatedFrom(Value : TDateTime) : iChargeOrderQR;
    function DateCreatedTo(Value : TDateTime) : iChargeOrderQR;
  end;

  //After Sales
  iAfterSales = interface
    function ConsultPayment : iAfterSales;
    function SeekPayment : iAfterSales;
    function ReversalPayment : iAfterSales;
    function PartialPaymentReversal : iAfterSales;
    function PaymentId(Value : String) : iAfterSales;
    function ExternalReference(Value : String) : iAfterSales;
    function PosId(Value : String) : iAfterSales;
    function PaymentMethodId(Value : String) : iAfterSales;
    function Status(Value : String) : iAfterSales;
    function StatusDetail(Value : String) : iAfterSales;
    function TransactionAmount(Value : String) : iAfterSales;
    function Installments(Value : String) : iAfterSales;
    function TransactionDetailsInstallmentAmount(Value : Currency) : iAfterSales;
    function BeginDate(Value : TDateTime) : iAfterSales;
    function EndDate(Value : TDateTime) : iAfterSales;
    function Range(Value : String) : iAfterSales;
    function PaymentTypeId(Value : String) : iAfterSales;
    function CardFirstSixDigits(Value : String) : iAfterSales;
    function CardLastFourDigits(Value : String) : iAfterSales;
    function PayerIdentificationNumber(Value : String) : iAfterSales;
    function CardExpirationYear(Value : Integer) : iAfterSales;
    function CardExpirationMonth(Value : Integer) : iAfterSales;
    function Limit(Value : Integer) : iAfterSales;
    function Offset(Value : Integer) : iAfterSales;
    function Criteria(Value : String) : iAfterSales;
    function Sort(Value : String) : iAfterSales;
  end;

  //Generate test user
  iGenerateUserTest = interface
    function Generate : iGenerateUserTest;
  end;

implementation

end.
