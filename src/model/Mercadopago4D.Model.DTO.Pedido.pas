unit Mercadopago4D.Model.DTO.Pedido;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TPayment_MethodsDTO = class
  private
    FInstallments: Integer;
  published
    property Installments: Integer read FInstallments write FInstallments;
  end;
  
  TItemsDTO = class
  private
    FCurrency_id: string;
    FDescription: string;
    FId: string;
    FPicture_url: string;
    FQuantity: Integer;
    FTitle: string;
    FUnit_price: Double;
  published
    property Currency_id: string read FCurrency_id write FCurrency_id;
    property Description: string read FDescription write FDescription;
    property Id: string read FId write FId;
    property Picture_url: string read FPicture_url write FPicture_url;
    property Quantity: Integer read FQuantity write FQuantity;
    property Title: string read FTitle write FTitle;
    property Unit_price: Double read FUnit_price write FUnit_price;
  end;
  
  TOrderDTO = class(TJsonDTO)
  private
    FExternal_reference: string;
    [GenericListReflect]
    FItems: TObjectList<TItemsDTO>;
    FNotification_url: string;
    FPayment_methods: TPayment_MethodsDTO;
    function GetItems: TObjectList<TItemsDTO>;
  published
    property External_reference: string read FExternal_reference write FExternal_reference;
    property Items: TObjectList<TItemsDTO> read GetItems;
    property Notification_url: string read FNotification_url write FNotification_url;
    property Payment_methods: TPayment_MethodsDTO read FPayment_methods write FPayment_methods;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;
  
implementation

{ TOrderDTO }

constructor TOrderDTO.Create;
begin
  inherited;
  FPayment_Methods := TPayment_MethodsDTO.Create;
end;

destructor TOrderDTO.Destroy;
begin
  FPayment_Methods.Free;
  GetItems.Free;
  inherited;
end;

function TOrderDTO.GetItems: TObjectList<TItemsDTO>;
begin
  if not Assigned(FItems) then
    FItems := TObjectList<TItemsDTO>.Create;

  Result := FItems;
end;

end.
