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

  TSponsorDTO = class
  private
    Fid: Double;
  published
    property Id: Double read Fid write Fid;
  end;
  
  TItemsDTO = class
  private
    FCurrency_id: string;
    FDescription: string;
    FId: string;
    FPicture_url: string;
    FQuantity: Double;
    FTitle: string;
    FUnit_price: Double;
    FSku_number : String;
    FCategory : String;
    FUnit_measure : String;
    FTotal_amount : Double;
  published
    property Currency_id: string read FCurrency_id write FCurrency_id;
    property Description: string read FDescription write FDescription;
    property Id: string read FId write FId;
    property Picture_url: string read FPicture_url write FPicture_url;
    property Quantity: Double read FQuantity write FQuantity;
    property Title: string read FTitle write FTitle;
    property Unit_price: Double read FUnit_price write FUnit_price;
    property Sku_number: String read FSku_number write FSku_number;
    property Category: String read FCategory write FCategory;
    property Unit_measure: String read FUnit_measure write FUnit_measure;
    property Total_amount: Double read FTotal_amount write FTotal_amount;
  end;
  
  TOrderDTO = class(TJsonDTO)
  private
    FExternal_reference: string;
    FTotal_amount : Double;
    FTitle : String;
    FDescription : string;
    [GenericListReflect]
    FItems: TObjectList<TItemsDTO>;
    FExpiration_date : TDateTime;
    FNotification_url: string;
    [JSONMarshalledAttribute(False)]
    FPayment_methods: TPayment_MethodsDTO;
    [JSONMarshalledAttribute(False)]
    FSponsor : TSponsorDTO;
    function GetItems: TObjectList<TItemsDTO>;
  published
    property External_reference: string read FExternal_reference write FExternal_reference;
    property Total_amount: Double read FTotal_amount write FTotal_amount;
    property Title: string read FTitle write FTitle;
    property Description: string read FDescription write FDescription;
    property Items: TObjectList<TItemsDTO> read GetItems;
    property Expiration_date: TDateTime read FExpiration_date write FExpiration_date;
    property Notification_url: string read FNotification_url write FNotification_url;
    property Payment_methods: TPayment_MethodsDTO read FPayment_methods write FPayment_methods;
    property Sponsor : TSponsorDTO read FSponsor write FSponsor;
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
  FSponsor := TSponsorDTO.Create;
end;

destructor TOrderDTO.Destroy;
begin
  FSponsor.Free;
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
