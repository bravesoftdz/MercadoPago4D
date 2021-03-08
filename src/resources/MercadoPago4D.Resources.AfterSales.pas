unit MercadoPago4D.Resources.AfterSales;

interface

uses
  MercadoPago4D.Resources.Interfaces;

type
  TAfterSales = class(TInterfacedObject, iAfterSales)
    private
      FPaymentId : String;
      FExternalReference : String;
      FPosId : String;
      FPaymentMethodId : String;
      FStatus : String;
      FStatusDetail : String;
      FTransactionAmount : String;
      FInstallments : String;
      FTransactionDetailsInstallmentAmount : Currency;
      FBeginDate : TDateTime;
      FEndDate : TDateTime;
      FRange : String;
      FPaymentTypeId : String;
      FCardFirstSixDigits : String;
      FCardLastFourDigits : String;
      FPayerIdentificationNumber : String;
      FCardExpirationYear : Integer;
      FCardExpirationMonth : Integer;
      FLimit : Integer;
      FOffset : Integer;
      FCriteria : String;
      FSort : String;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iAfterSales;
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

implementation

function TAfterSales.BeginDate(Value: TDateTime): iAfterSales;
begin
  Result := Self;
  FBeginDate := Value;
end;

function TAfterSales.CardExpirationMonth(Value: Integer): iAfterSales;
begin
  Result := Self;
  FCardExpirationMonth := Value;
end;

function TAfterSales.CardExpirationYear(Value: Integer): iAfterSales;
begin
  Result := Self;
  FCardExpirationYear := Value;
end;

function TAfterSales.CardFirstSixDigits(Value: String): iAfterSales;
begin
  Result := Self;
  FCardFirstSixDigits := Value;
end;

function TAfterSales.CardLastFourDigits(Value: String): iAfterSales;
begin
  Result := Self;
  FCardLastFourDigits := Value;
end;

function TAfterSales.ConsultPayment: iAfterSales;
begin
  Result := Self;
end;

constructor TAfterSales.Create;
begin

end;

function TAfterSales.Criteria(Value: String): iAfterSales;
begin
  Result := Self;
  FCriteria := Value;
end;

destructor TAfterSales.Destroy;
begin

  inherited;
end;

function TAfterSales.EndDate(Value: TDateTime): iAfterSales;
begin
  Result := Self;
  FEndDate := Value;
end;

function TAfterSales.ExternalReference(Value: String): iAfterSales;
begin
  Result := Self;
  FExternalReference := Value;
end;

function TAfterSales.Installments(Value: String): iAfterSales;
begin
  Result := Self;
  FInstallments := Value;
end;

function TAfterSales.Limit(Value: Integer): iAfterSales;
begin
  Result := Self;
  FLimit := Value;
end;

class function TAfterSales.New : iAfterSales;
begin
  Result := Self.Create;
end;

function TAfterSales.Offset(Value: Integer): iAfterSales;
begin
  Result := Self;
  FOffset := Value;
end;

function TAfterSales.PartialPaymentReversal: iAfterSales;
begin
  Result := Self;
end;

function TAfterSales.PayerIdentificationNumber(Value: String): iAfterSales;
begin
  Result := Self;
  FPayerIdentificationNumber := Value;
end;

function TAfterSales.PaymentId(Value: String): iAfterSales;
begin
  Result := Self;
  FPaymentId := Value;
end;

function TAfterSales.PaymentMethodId(Value: String): iAfterSales;
begin
  Result := Self;
  FPaymentMethodId := Value;
end;

function TAfterSales.PaymentTypeId(Value: String): iAfterSales;
begin
  Result := Self;
  FPaymentTypeId := Value;
end;

function TAfterSales.PosId(Value: String): iAfterSales;
begin
  Result := Self;
  FPosId := Value;
end;

function TAfterSales.Range(Value: String): iAfterSales;
begin
  Result := Self;
  FRange := Value;
end;

function TAfterSales.ReversalPayment: iAfterSales;
begin
  Result := Self;
end;

function TAfterSales.SeekPayment: iAfterSales;
begin
  Result := Self;
end;

function TAfterSales.Sort(Value: String): iAfterSales;
begin
  Result := Self;
  FSort := Value;
end;

function TAfterSales.Status(Value: String): iAfterSales;
begin
  Result := Self;
  FStatus := Value;
end;

function TAfterSales.StatusDetail(Value: String): iAfterSales;
begin
  Result := Self;
  FStatusDetail := Value;
end;

function TAfterSales.TransactionAmount(Value: String): iAfterSales;
begin
  Result := Self;
  FTransactionAmount := Value;
end;

function TAfterSales.TransactionDetailsInstallmentAmount(
  Value: Currency): iAfterSales;
begin
  Result := Self;
  FTransactionDetailsInstallmentAmount := Value;
end;

end.
