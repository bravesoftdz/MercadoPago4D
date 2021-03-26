unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  System.Actions, Vcl.ActnList, Vcl.Buttons, Vcl.WinXCtrls, Vcl.ExtCtrls,
  Vcl.CategoryButtons, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,pngimage,RestRequest4D;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    ImageList1: TImageList;
    ActionListMain: TActionList;
    Action1: TAction;
    btn_accreditation: TAction;
    btn_Transactional: TAction;
    btn_after_sales: TAction;
    btn_generate_test_user: TAction;
    CategoryButtons1: TCategoryButtons;
    Memo1: TMemo;
    ActionListAccreditation: TActionList;
    btn_create_store: TAction;
    btn_update_store: TAction;
    btn_search_stores: TAction;
    btn_delete_store: TAction;
    btn_generate_qr_code: TAction;
    btn_update_qr_code: TAction;
    btn_search_qrs_general: TAction;
    btn_search_qr_external_id: TAction;
    btn_delete_qr_code: TAction;
    btn_print_qr_manually: TAction;
    btn_oath_authorization: TAction;
    btn_oauth_renovartion: TAction;
    SplitViewMain: TSplitView;
    SplitViewAccreditation: TSplitView;
    CategoryButtons2: TCategoryButtons;
    SplitViewtransactional: TSplitView;
    ActionListTransactional: TActionList;
    btn_load_order_qr: TAction;
    btn_check_qr_availability: TAction;
    btn_delete_order_qr: TAction;
    btn_consult_order: TAction;
    btn_search_order: TAction;
    CategoryButtons3: TCategoryButtons;
    SplitViewAftersales: TSplitView;
    SplitViewGenerateuser: TSplitView;
    CategoryButtons4: TCategoryButtons;
    ActionListAftersales: TActionList;
    btn_consult_payment: TAction;
    btn_seek_payment: TAction;
    btn_return_refund_payment: TAction;
    btn_return_refund_partial_payment: TAction;
    ActionListGeneratetestuser: TActionList;
    CategoryButtons5: TCategoryButtons;
    btn_generate_test_user2: TAction;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    Image1: TImage;
    Panel2: TPanel;
    edtStoreID: TLabeledEdit;
    edtQrID: TLabeledEdit;
    edtExternalID: TLabeledEdit;
    edtPosID: TLabeledEdit;
    edtOrderID: TLabeledEdit;
    edtPaymentID: TLabeledEdit;
    procedure Action1Execute(Sender: TObject);
    procedure ViewSplit(Sender: TSplitView);
    procedure SplitClosed(Sender: TObject);
    procedure btn_accreditationExecute(Sender: TObject);
    procedure btn_TransactionalExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_after_salesExecute(Sender: TObject);
    procedure btn_generate_test_userExecute(Sender: TObject);
    procedure btn_create_storeExecute(Sender: TObject);
    procedure btn_update_storeExecute(Sender: TObject);
    procedure btn_search_storesExecute(Sender: TObject);
    procedure btn_delete_storeExecute(Sender: TObject);
    procedure btn_generate_qr_codeExecute(Sender: TObject);
    procedure btn_update_qr_codeExecute(Sender: TObject);
    procedure btn_search_qrs_generalExecute(Sender: TObject);
    procedure btn_search_qr_external_idExecute(Sender: TObject);
    procedure btn_delete_qr_codeExecute(Sender: TObject);
    procedure btn_print_qr_manuallyExecute(Sender: TObject);
    procedure btn_oath_authorizationExecute(Sender: TObject);
    procedure btn_oauth_renovartionExecute(Sender: TObject);
    procedure btn_load_order_qrExecute(Sender: TObject);
    procedure btn_check_qr_availabilityExecute(Sender: TObject);
    procedure btn_delete_order_qrExecute(Sender: TObject);
    procedure btn_consult_orderExecute(Sender: TObject);
    procedure btn_search_orderExecute(Sender: TObject);
    procedure btn_consult_paymentExecute(Sender: TObject);
    procedure btn_seek_paymentExecute(Sender: TObject);
    procedure btn_return_refund_paymentExecute(Sender: TObject);
    procedure btn_return_refund_partial_paymentExecute(Sender: TObject);
    procedure btn_generate_test_user2Execute(Sender: TObject);
  private
    FSplitExibir : TSplitView;
    FSplitAtual : TSplitView;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses MercadoPago4Delphi;

procedure TForm1.Action1Execute(Sender: TObject);
begin
if SplitViewMain.Opened then
    SplitViewMain.close
  else
    SplitViewMain.open;
end;

procedure TForm1.btn_accreditationExecute(Sender: TObject);
begin
  ViewSplit(SplitViewAccreditation);
end;

procedure TForm1.btn_after_salesExecute(Sender: TObject);
begin
  ViewSplit(SplitViewAftersales);
end;

procedure TForm1.btn_check_qr_availabilityExecute(Sender: TObject);
begin
  Memo1.Lines.Add(
  _MercadoPago4D
    .Manager
      .Resources
        .Transactional
          .PosID(edtPosID.Text)//pegar o id do retorno do post
          .CheckQRAvailability
          .DataSet(FDMemTable1)
          .Content);
end;

procedure TForm1.btn_consult_orderExecute(Sender: TObject);
begin
  Memo1.Lines.Add(
    _MercadoPago4D
      .Manager
        .Resources
          .Transactional
            .OrderID(edtOrderID.Text)
            .ViewOrder
          .DataSet(FDMemTable1)
          .Content);
end;

procedure TForm1.btn_consult_paymentExecute(Sender: TObject);
begin
  Memo1.Lines.Add(
    _MercadoPago4D
      .Manager
        .Resources
          .AfterSales
            .PaymentID(edtPaymentID.Text)
            .ConsultPayment
          .DataSet(FDMemTable1)
          .Content);
end;

procedure TForm1.btn_create_storeExecute(Sender: TObject);
begin
  Memo1.Lines.Add(
  _MercadoPago4D
    .Manager
      .Resources
        .Accreditation
          .CreateStore(_MercadoPago4D
                        .BuilderManager
                          .Stores
                            .Name('Loja Delphi')
                            .Business_Hours
                              .Monday
                                .Open('08:00')
                                .Close('11:00')
                              .&End
                              .Monday
                                .Open('13:00')
                                .Close('21:00')
                              .&End
                              .Tuesday
                                .Open('11:00')
                                .Close('21:00')
                              .&End
                              .Wednesday
                                .Open('11:00')
                                .Close('21:00')
                              .&End
                              .Thursday
                                .Open('11:00')
                                .Close('21:00')
                              .&End
                              .Friday
                                .Open('11:00')
                                .Close('21:00')
                              .&End
                              .Saturday
                                .Open('11:00')
                                .Close('21:00')
                              .&End
                              .Sunday
                                .Open('11:00')
                                .Close('21:00')
                              .&End
                            .&End
                            .Location
                              .Zip_Code('06233-903')
                              .Street_Number('3003')
                              .Street_Name('Av. das Nações Unidas')
                              .City_Name('Osasco')
                              .State_Name('São Paulo')
                              .Latitude(-23.5254383)
                              .Longitude(-46.7620313)
                              .Reference('Melicidade')
                            .&End
                          .External_Id('lojadelphi')
                        .&End)
                        .DataSet(FDMemTable1)
                        .Content);
end;

procedure TForm1.btn_delete_order_qrExecute(Sender: TObject);
begin
  Memo1.Lines.Add(
    _MercadoPago4D
      .Manager
        .Resources
          .Transactional
            .ExternalID(edtExternalID.Text)
            .DeleteOrderinQR
          .DataSet(FDMemTable1)
          .Content);
end;

procedure TForm1.btn_delete_qr_codeExecute(Sender: TObject);
begin
  Memo1.Lines.Add(
    _MercadoPago4D
      .Manager
        .Resources
          .Accreditation
            .QrID(edtQrID.Text)
            .DeleteQrCode
            .DataSet(FDMemTable1)
            .Content);
end;

procedure TForm1.btn_delete_storeExecute(Sender: TObject);
begin
  Memo1.Lines.Add(
    _MercadoPago4D
      .Manager
        .Resources
          .Accreditation
            .SearchStores
            .DataSet(FDMemTable1)
            .Content);
end;

procedure TForm1.btn_generate_qr_codeExecute(Sender: TObject);
begin
  Memo1.Lines.Add(
  _MercadoPago4D
    .Manager
      .Resources
        .Accreditation
          .GenerateQRCode(
            _MercadoPago4D
              .BuilderManager
                .QrCode
                  .Name('Caixa principal 01')
                  .Fixed_Amount(true)
                  .External_Id('caixa 01')
                .&End)
          .DataSet(FDMemTable1)
          .Content);
end;

procedure TForm1.btn_generate_test_user2Execute(Sender: TObject);
begin
  Memo1.Lines.Add(
  _MercadoPago4D
    .Manager
      .Resources
        .GenerateTestUser
          .GenerateTestUser(
            _MercadoPago4D
              .BuilderManager
                .TestUser
                  .SiteID('MLB')
                .&End
          )
        .DataSet(FDMemTable1)
        .Content);
end;

procedure TForm1.btn_generate_test_userExecute(Sender: TObject);
begin
  ViewSplit(SplitViewGenerateuser);
end;

procedure TForm1.btn_load_order_qrExecute(Sender: TObject);
begin
  Memo1.Lines.Add(
  _MercadoPago4D
    .Manager
      .Resources
        .Transactional
          .ExternalID('caixaD01')
          .LoadOrderinQR(
            _MercadoPago4D
              .BuilderManager
                .Order
                  .External_Reference('PedidoD')
                  .Notification_Url('https://hookb.in/Z2dkoGWQRjFR33eLJzMN')
                    .Items
                      .ID('Produto0001')
                      .Title('Viagem ao caribe')
                      .CurrencyID('BRL')
                      .UnitPrice(0.1)
                      .Description('Lorem ipsum lorem ipsum')
                      .Quantity(1)
                      .PictureURL('https://s3-sa-east-1.amazonaws.com/homolog.rdcferias/media/2156/thumb-rdcferias-rdcviagens.jpg')
                    .&End
                    .Items
                      .ID('Produto0002')
                      .Title('Translado aeroporto ida')
                      .CurrencyID('BRL')
                      .UnitPrice(0.1)
                      .Description('Lorem ipsum lorem ipsum')
                      .Quantity(2)
                      .PictureURL('https://www.criatives.com.br/wp-content/uploads/2019/04/carro-chinês-capa.jpg')
                    .&End
                    .Items
                      .ID('Produto0003')
                      .Title('Translado aeroporto volta')
                      .CurrencyID('BRL')
                      .UnitPrice(0.1)
                      .Description('Lorem ipsum lorem ipsum')
                      .Quantity(2)
                      .PictureURL('https://i2.wp.com/www.eurodicas.com.br/wp-content/uploads/2019/02/comprar-carro-em-portugal.jpg')
                    .&End
                  .Payment_Methods
                    .Installments(12)
                  .&End
                .&End
          )
          .DataSet(FDMemTable1)
          .Content);
end;

procedure TForm1.btn_oath_authorizationExecute(Sender: TObject);
begin
  //To-Do Implementar
end;

procedure TForm1.btn_oauth_renovartionExecute(Sender: TObject);
begin
  //To-Do Implementar
end;

procedure TForm1.btn_print_qr_manuallyExecute(Sender: TObject);
var
  strm : TMemoryStream;
  image : TPNGImage;
begin
  strm := TMemoryStream.Create;
  try
    strm.LoadFromStream(
    TRequest.New
    .BaseURL('https://api.qrserver.com/v1/create-qr-code/')
    .Token('Bearer '+_MercadoPago4D.Configuration.AccessToken)
    .AddParam('size','300x300')
    .AddParam('data','https://mpago.la/pos/'+edtPosID.Text)
    .Get.ContentStream
    );
    image := TPngImage.Create;
    try
      strm.Position := 0;
      image.LoadFromStream(strm);
      Image1.Picture.Graphic := image;
    finally
      image.Free;
    end;
  finally
    strm.Free;
  end;
end;
//var
//  strm : TMemoryStream;
//  image : TPNGImage;
//begin
//  strm := TMemoryStream.Create();
//  try
//    strm.LoadFromStream(
//     _MercadoPago4D
//      .Manager
//        .Resources
//          .Accreditation
//            .PosID(edtPosID.Text)//id deve ser pego no retorno do post
//            .Size('300x300')
//            .PrintQRManually
//            .ContentStream);
//    image := TPngImage.Create;
//    try
//      strm.Position := 0;
//      image.LoadFromStream(strm);
//      Image1.Picture.Graphic := image;
//    finally
//      image.Free;
//    end;
//  finally
//    strm.Free;
//  end;
//end;

procedure TForm1.btn_return_refund_partial_paymentExecute(Sender: TObject);
begin
 Memo1.Lines.Add(
  _MercadoPago4D
    .Manager
      .Resources
        .AfterSales
          .ReturnPartialPaymentRefund(
            _MercadoPago4D
              .BuilderManager
                .Partial
                  .Amount(10.50)
                .&End)
        .DataSet(FDMemTable1)
        .Content);
end;

procedure TForm1.btn_return_refund_paymentExecute(Sender: TObject);
begin
 Memo1.Lines.Add(
  _MercadoPago4D
    .Manager
      .Resources
        .AfterSales
          .PaymentID(edtPaymentID.Text)
          .PaymentReturnRefund
        .DataSet(FDMemTable1)
        .Content);
end;

procedure TForm1.btn_search_orderExecute(Sender: TObject);
begin
  Memo1.Lines.Add(
    _MercadoPago4D
      .Manager
        .Resources
          .Transactional
            .ExternalReference('Pedido12345')
            .SearchOrder
          .DataSet(FDMemTable1)
          .Content);
end;

procedure TForm1.btn_search_qrs_generalExecute(Sender: TObject);
begin
  Memo1.Lines.Add(
    _MercadoPago4D
      .Manager
        .Resources
          .Accreditation
            .SearchGeneralQRs
            .DataSet(FDMemTable1)
            .Content);
end;

procedure TForm1.btn_search_qr_external_idExecute(Sender: TObject);
begin
  Memo1.Lines.Add(
    _MercadoPago4D
      .Manager
        .Resources
          .Accreditation
            .ExternalID(edtExternalID.Text)//id deve ser pego no retorno do post
            .SearchQRforExternal_ID
            .DataSet(FDMemTable1)
            .Content);
end;

procedure TForm1.btn_search_storesExecute(Sender: TObject);
begin
  Memo1.Lines.Add(
    _MercadoPago4D
      .Manager
        .Resources
          .Accreditation
            .SearchStores
            .DataSet(FDMemTable1)
            .Content);
end;

procedure TForm1.btn_seek_paymentExecute(Sender: TObject);
begin
 Memo1.Lines.Add(
  _MercadoPago4D
    .Manager
      .Resources
        .AfterSales
          .SearchPayment
        .DataSet(FDMemTable1)
        .Content);
end;

procedure TForm1.btn_TransactionalExecute(Sender: TObject);
begin
  ViewSplit(SplitViewtransactional);
end;

procedure TForm1.btn_update_qr_codeExecute(Sender: TObject);
begin
  Memo1.Lines.Add(
  _MercadoPago4D
    .Manager
      .Resources
        .Accreditation
          .QrID(edtQrID.Text)//id deve ser pego no retorno do post
          .GenerateQRCode(
            _MercadoPago4D
              .BuilderManager
                .QrCode
                  .Name('Nome novo')
                  .Fixed_Amount(true)
                .&End)
          .DataSet(FDMemTable1)
          .Content);
end;

procedure TForm1.btn_update_storeExecute(Sender: TObject);
begin
  Memo1.Lines.Add(
  _MercadoPago4D
    .Manager
      .Resources
        .Accreditation
          .StoreID(edtStoreID.Text)
          .UpdateStore(
            _MercadoPago4D
              .BuilderManager
                .Stores
                .Name('Loja Delphi')
                .Business_Hours
                  .Monday
                    .Open('08:00')
                    .Close('11:00')
                  .&End
                  .Monday
                    .Open('13:00')
                    .Close('21:00')
                  .&End
                  .Tuesday
                    .Open('11:00')
                    .Close('21:00')
                  .&End
                  .Wednesday
                    .Open('11:00')
                    .Close('21:00')
                  .&End
                  .Thursday
                    .Open('11:00')
                    .Close('21:00')
                  .&End
                  .Friday
                    .Open('11:00')
                    .Close('21:00')
                  .&End
                  .Saturday
                    .Open('11:00')
                    .Close('21:00')
                  .&End
                  .Sunday
                    .Open('11:00')
                    .Close('21:00')
                  .&End
                .&End
                .Location
                  .Zip_Code('28940-000')
                  .Street_Number('16')
                  .Street_Name('R. Pres. Juscelino K. de Oliveira')
                  .City_Name('São Pedro da Aldeia')
                  .State_Name('Rio de Janeiro')
                  .Latitude(-22.8746978)
                  .Longitude(-42.1132626)
                  .Reference('Boqueirão')
                .&End
              .External_Id('lojadelphi')
            .&End)
            .DataSet(FDMemTable1)
            .Content);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FSplitAtual := SplitViewAccreditation;
end;

procedure TForm1.SplitClosed(Sender: TObject);
begin
  if not TSplitView(Sender).Equals(FSplitExibir) and Assigned(FSplitExibir) then
    FSplitExibir.Open;
end;

procedure TForm1.ViewSplit(Sender: TSplitView);
begin
  if Sender <> FSplitAtual then
  begin
    FSplitExibir := Sender;
    FSplitAtual.Close;
    FSplitAtual := FSplitExibir;
  end
  else
  begin
    if Sender.Opened then
      Sender.Close
    else
      Sender.Open;
  end;
end;

end.
