unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Objects, FMX.Layouts, FMX.ListBox, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, System.Math.Vectors, FMX.Controls3D,
  FMX.Layers3D;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Rectangle3: TRectangle;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Rectangle4: TRectangle;
    ListBox1: TListBox;
    Layout12: TLayout;
    Layout13: TLayout;
    Layout14: TLayout;
    Image1: TImage;
    Rectangle2: TRectangle;
    Layout15: TLayout;
    Rectangle5: TRectangle;
    Edit1: TEdit;
    ShadowEffect1: TShadowEffect;
    Layout16: TLayout;
    Layout17: TLayout;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Edit2: TEdit;
    Edit3: TEdit;
    ShadowEffect3: TShadowEffect;
    ShadowEffect4: TShadowEffect;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Layout18: TLayout;
    Rectangle8: TRectangle;
    Layout8: TLayout;
    ShadowEffect5: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    ShadowEffect6: TShadowEffect;
    Label1: TLabel;
    Layout9: TLayout;
    procedure FormResize(Sender: TObject);
  private
    procedure AjustaLayout;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}


{ TForm1 }

procedure TForm1.AjustaLayout;
const
  col_left = 36.26;
  col_qtd = 50;
begin
  Layout4.Width := round((Layout3.Width * col_left) / 100);
  Layout16.Width := round((Layout13.Width * col_qtd)/ 100);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
 AjustaLayout;
end;

end.
