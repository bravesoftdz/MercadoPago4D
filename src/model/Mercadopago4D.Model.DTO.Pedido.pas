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
    FCurrency_Id: string;
    FDescription: string;
    FId: string;
    FPicture_Url: string;
    FQuantity: Integer;
    FTitle: string;
    FUnit_Price: Double;
  published
    property Currency_Id: string read FCurrency_Id write FCurrency_Id;
    property Description: string read FDescription write FDescription;
    property Id: string read FId write FId;
    property Picture_Url: string read FPicture_Url write FPicture_Url;
    property Quantity: Integer read FQuantity write FQuantity;
    property Title: string read FTitle write FTitle;
    property Unit_Price: Double read FUnit_Price write FUnit_Price;
  end;
  
  TOrderDTO = class(TJsonDTO)
  private
    FExternal_Reference: string;
    [JSONName('items')]
    FItemsArray: TArray<TItemsDTO>;
    [GenericListReflect]
    FItems: TObjectList<TItemsDTO>;
    FNotification_Url: string;
    FPayment_Methods: TPayment_MethodsDTO;
    function GetItems: TObjectList<TItemsDTO>;
  published
    property External_Reference: string read FExternal_Reference write FExternal_Reference;
    property Items: TObjectList<TItemsDTO> read GetItems;
    property Notification_Url: string read FNotification_Url write FNotification_Url;
    property Payment_Methods: TPayment_MethodsDTO read FPayment_Methods write FPayment_Methods;
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
  begin
    FItems := TObjectList<TItemsDTO>.Create;
    FItems.AddRange(FItemsArray);
  end;
  Result := FItems;
end;

end.
