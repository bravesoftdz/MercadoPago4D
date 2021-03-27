unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids,
  FireDAC.DApt, FireDAC.Stan.StorageBin, Vcl.Buttons;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Image1: TImage;
    Panel13: TPanel;
    Panel14: TPanel;
    Shape1: TShape;
    Panel15: TPanel;
    Shape2: TShape;
    Label7: TLabel;
    Panel19: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    FDConnection1: TFDConnection;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    FDQuery2: TFDQuery;
    FDMemTable1: TFDMemTable;
    FDMemTable1ID_PRODUTO: TStringField;
    FDMemTable1DESCRICAO: TStringField;
    FDMemTable1PRECO: TCurrencyField;
    FDMemTable1QUANTIDADE: TIntegerField;
    FDMemTable1URL: TStringField;
    FDQuery2ID: TWideStringField;
    FDQuery2Title: TWideStringField;
    FDQuery2Preco: TLargeintField;
    FDQuery2Descricao: TWideStringField;
    FDQuery2URLImagem: TWideMemoField;
    FDQuery2ProdID: TWideMemoField;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure inserverproduto;
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses MercadoPago4Delphi;

procedure TForm3.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    FDQuery2.SQL.Clear;
    FDQuery2.SQL.Text := 'SELECT * FROM PRODUTO WHERE PRODID='+Edit1.Text;
    FDQuery2.Open;
    inserverproduto;
  end;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
Edit1.SetFocus;
end;

procedure TForm3.inserverproduto;
begin
  FDMemTable1.Open;
  FDMemTable1.Insert;
  FDMemTable1.FieldByName('ID_PRODUTO').AsString := FDQuery2.FieldByName('ID').AsString;
  FDMemTable1.FieldByName('DESCRICAO').AsString := FDQuery2.FieldByName('TITLE').AsString;
  FDMemTable1.FieldByName('PRECO').AsCurrency := FDQuery2.FieldByName('PRECO').AsCurrency;
  FDMemTable1.FieldByName('QUANTIDADE').AsInteger := StrToInt(Edit2.Text);
  FDMemTable1.FieldByName('URL').AsString := FDQuery2.FieldByName('URLImagem').AsString;
  FDMemTable1.Post;
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
    var
  image : TPNGImage;
begin
  ShowMessage(
  _MercadoPago4D
    .Manager
      .Resources
        .Transactional
          .ExternalID('caixaD03')
          .LoadOrderinQR(
            _MercadoPago4D
              .BuilderManager
                .Order
                  .External_Reference('PedidoD')
                  .Notification_Url('https://hookb.in/eKP3WRLqaPUeYYRdX7dl')
                    .Items
                      .ID(FDMemTable1.FieldByName('ID_PRODUTO').AsString)
                      .Title(FDMemTable1.FieldByName('DESCRICAO').AsString)
                      .CurrencyID('BRL')
                      .UnitPrice(FDMemTable1.FieldByName('PRECO').AsCurrency)
                      .Description(FDMemTable1.FieldByName('DESCRICAO').AsString)
                      .Quantity(1)
                      .PictureURL(FDMemTable1.FieldByName('URL').AsString)
                    .&End
                  .Payment_Methods
                    .Installments(12)
                  .&End
                .&End
          )
          .Content);

image1.Picture.LoadFromFile('C:\Users\Criacao\Pictures\PixMercadoPago\qrcaixaD03.png');

end;

end.
