unit Mercadopago4D.Insight.Builder.Tuesday;

interface

uses
  Mercadopago4D.Insight.Builder.Interfaces, Mercadopago4D.Insight.DTO.Pedido;

type

  TBuilderTuesday<T : IInterface> = class(TInterfacedObject, iBuilderTuesday<T>)
    private
      [weak]
      FParent : T;
      FOpen : String;
      FClose : String;
      procedure AddList;
    public
      constructor Create(Parent : T; Root : TRootDTO);
      destructor Destroy; override;
      class function New(Parent : T; Root : TRootDTO) : iBuilderTuesday<T>;
      function Open(Value : String) : iBuilderTuesday<T>;
      function Close(Value : String) : iBuilderTuesday<T>;
      function &End : T;
  end;

implementation

{ TBuilderTuesday<T> }

procedure TBuilderTuesday<T>.AddList;
begin

end;

function TBuilderTuesday<T>.Close(Value: String): iBuilderTuesday<T>;
begin

end;

constructor TBuilderTuesday<T>.Create(Parent: T; Root: TRootDTO);
begin

end;

destructor TBuilderTuesday<T>.Destroy;
begin

  inherited;
end;

function TBuilderTuesday<T>.&End: T;
begin

end;

class function TBuilderTuesday<T>.New(Parent: T;
  Root: TRootDTO): iBuilderTuesday<T>;
begin

end;

function TBuilderTuesday<T>.Open(Value: String): iBuilderTuesday<T>;
begin

end;

end.
