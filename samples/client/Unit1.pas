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
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Panel2: TPanel;
    CategoryButtons1: TCategoryButtons;
    SplitView1: TSplitView;
    btnPrintQRManually: TSpeedButton;
    btndeleteqrcode: TSpeedButton;
    btnSearchQRExternal_ID: TSpeedButton;
    btnsearchgeneralqr: TSpeedButton;
    btnUpdateQRCode: TSpeedButton;
    btnGenerateQRCode: TSpeedButton;
    btndeletestore: TSpeedButton;
    btnsearchstore: TSpeedButton;
    btnupdatestore: TSpeedButton;
    btncreatestore: TSpeedButton;
    btnOAuthAuthorization: TSpeedButton;
    btnOAuthRenovation: TSpeedButton;
    Memo1: TMemo;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btncreatestoreClick(Sender: TObject);
    procedure btnupdatestoreClick(Sender: TObject);
    procedure btnsearchstoreClick(Sender: TObject);
    procedure btndeletestoreClick(Sender: TObject);
    procedure btnGenerateQRCodeClick(Sender: TObject);
    procedure btnUpdateQRCodeClick(Sender: TObject);
    procedure btnsearchgeneralqrClick(Sender: TObject);
    procedure btnSearchQRExternal_IDClick(Sender: TObject);
    procedure btndeleteqrcodeClick(Sender: TObject);
    procedure btnPrintQRManuallyClick(Sender: TObject);
    procedure btnOAuthAuthorizationClick(Sender: TObject);
    procedure btnOAuthRenovationClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Action1Execute(Sender: TObject);
begin
  ShowMessage('ok');
end;

procedure TForm1.Action2Execute(Sender: TObject);
begin
  if SplitView1.Opened then
    SplitView1.close
  else
    SplitView1.open;
end;


procedure TForm1.btncreatestoreClick(Sender: TObject);
begin
//implementar o Criar Store
end;

procedure TForm1.btndeleteqrcodeClick(Sender: TObject);
begin
//implementar Apagar QR Code
end;

procedure TForm1.btndeletestoreClick(Sender: TObject);
begin
//implementar Apagar Stores
end;

procedure TForm1.btnGenerateQRCodeClick(Sender: TObject);
begin
//implementar Gerar QR Code
end;

procedure TForm1.btnOAuthAuthorizationClick(Sender: TObject);
begin
//implementar OAuth - Autorização
end;

procedure TForm1.btnOAuthRenovationClick(Sender: TObject);
begin
//implementar OAuth - Renovação
end;

procedure TForm1.btnPrintQRManuallyClick(Sender: TObject);
begin
//implementar Imprimir QR manualmente
end;

procedure TForm1.btnsearchgeneralqrClick(Sender: TObject);
begin
//implementar Buscar QRs Geral
end;

procedure TForm1.btnSearchQRExternal_IDClick(Sender: TObject);
begin
//implementar Buscar QR por External_ID
end;

procedure TForm1.btnsearchstoreClick(Sender: TObject);
begin
//implementar Buscar Stores
end;

procedure TForm1.btnUpdateQRCodeClick(Sender: TObject);
begin
//implementar Atualizar QR Code
end;

procedure TForm1.btnupdatestoreClick(Sender: TObject);
begin
//implementar Atualizar Store
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
SplitView1.Close;
end;

end.
