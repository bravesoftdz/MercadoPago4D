unit MercadoPago4D.Model.Builder.Items;

interface

uses
  MercadoPago4D.Model.Builder.Interfaces,
  Mercadopago4D.Model.DTO.Pedido;

type
  TITems<T : IInterface> = class(TInterfacedObject, iItems<T>)
    private
      [weak]
      FParent : T;
      FSku_Number : String;
      FCategory : String;
      FID : String;
      FTitle : String;
      FCurrencyID : String;
      FUnit_Measure : String;
      FUnitPrice : Double;
      FDescription : String;
      FQuantity : Double;
      FPictureURL : String;
      FTotal_Amount : Double;
      FOrderDTO : TOrderDTO;

      procedure AddList;
    public
      constructor Create(Parent : T; Value : TOrderDTO);
      destructor Destroy; override;
      class function New(Parent : T; Value : TOrderDTO) : iItems<T>;
      function Sku_Number(Value : string) : iItems<T>;
      function Category(Value : String) : iItems<T>;
      function ID(Value : String) : iItems<T>;
      function Title(Value : String) :iItems<T>;
      function CurrencyID(Value : String) : iItems<T>;
      function Unit_Measure(Value : String) : iItems<T>;
      function UnitPrice(Value : Double) : iItems<T>;
      function Description(Value : String) : iItems<T>;
      function Quantity(Value : Double) : iItems<T>;
      function PictureURL(Value : String) : iItems<T>;
      function Total_Amount(Value : Double) : iItems<T>;
      function &End : T;
  end;

implementation

function TITems<T>.&End: T;
begin
  Result := FParent;
  AddList;
end;

procedure TITems<T>.AddList;
var
  I : Integer;
begin
  FOrderDTO.Items.Add(TItemsDTO.Create);
  I := FOrderDTO.Items.Count -1;
  FOrderDTO.Items[I].Id := FID;
  FOrderDTO.Items[I].Title := FTitle;
  FOrderDTO.Items[I].Currency_Id := FCurrencyID;
  FOrderDTO.Items[I].Unit_Price := FUnitPrice;
  FOrderDTO.Items[I].Description := FDescription;
  FOrderDTO.Items[I].Quantity := FQuantity;
  FOrderDTO.Items[I].Picture_Url := FPictureURL;
  FOrderDTO.Items[I].Sku_number := FSku_Number;
  FOrderDTO.Items[I].Category := FCategory;
  FOrderDTO.Items[I].Unit_measure := FUnit_Measure;
  FOrderDTO.Items[I].Total_amount := FTotal_Amount;
end;

function TITems<T>.Category(Value: String): iItems<T>;
begin
  Result := Self;
  FCategory := Value;
end;

constructor TITems<T>.Create(Parent : T; Value : TOrderDTO);
begin
  FParent := Parent;
  FOrderDTO := Value;
end;

function TITems<T>.CurrencyID(Value: String): iItems<T>;
begin
  Result := Self;
  FCurrencyID := Value;
end;

function TITems<T>.Description(Value: String): iItems<T>;
begin
  Result := Self;
  FDescription := Value;
end;

destructor TITems<T>.Destroy;
begin

  inherited;
end;

function TITems<T>.ID(Value: String): iItems<T>;
begin
  Result := Self;
  FID := Value;
end;

class function TITems<T>.New(Parent : T; Value : TOrderDTO) : iItems<T>;
begin
  Result := Self.Create(Parent, Value);
end;

function TITems<T>.PictureURL(Value: String): iItems<T>;
begin
  Result := Self;
  FPictureURL := Value;
end;

function TITems<T>.Quantity(Value: Double): iItems<T>;
begin
  Result := Self;
  FQuantity := Value;
end;

function TITems<T>.Sku_Number(Value: string): iItems<T>;
begin
  Result := Self;
  FSku_Number := Value;
end;

function TITems<T>.Title(Value: String): iItems<T>;
begin
  Result := Self;
  FTitle := Value;
end;

function TITems<T>.Total_Amount(Value: Double): iItems<T>;
begin
  Result := Self;
  FTotal_Amount := Value;
end;

function TITems<T>.UnitPrice(Value: Double): iItems<T>;
begin
  Result := Self;
  FUnitPrice := Value;
end;

function TITems<T>.Unit_Measure(Value: String): iItems<T>;
begin
  Result := Self;
  FUnit_Measure := Value;
end;

end.
