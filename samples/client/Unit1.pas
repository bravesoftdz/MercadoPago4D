unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  System.Actions, Vcl.ActnList, Vcl.Buttons, Vcl.WinXCtrls, Vcl.ExtCtrls,
  Vcl.CategoryButtons, Vcl.StdCtrls;

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
    procedure Action1Execute(Sender: TObject);
    procedure ViewSplit(Sender: TSplitView);
    procedure SplitClosed(Sender: TObject);
    procedure btn_accreditationExecute(Sender: TObject);
    procedure btn_TransactionalExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_after_salesExecute(Sender: TObject);
    procedure btn_generate_test_userExecute(Sender: TObject);
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

procedure TForm1.btn_generate_test_userExecute(Sender: TObject);
begin
  ViewSplit(SplitViewGenerateuser);
end;

procedure TForm1.btn_TransactionalExecute(Sender: TObject);
begin
  ViewSplit(SplitViewtransactional);
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
