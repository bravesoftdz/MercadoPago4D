unit Mercadopago4D.Insight.Builder.Saturday;

interface

uses
  Mercadopago4D.Insight.Builder.Interfaces, Mercadopago4D.Insight.DTO.QRCode;

type

  TBuilderSaturday<T : IInterface> = class(TInterfacedObject, iBuilderSaturday<T>)
    private
      [weak]
      FParent : T;
      FOpen : String;
      FClose : String;
      procedure AddList;
    public
      constructor Create(Parent : T; Root : TRootDTO);
      destructor Destroy; override;
      class function New(Parent : T; Root : TRootDTO) : iBuilderSaturday<T>;
      function Open(Value : String) : iBuilderSaturday<T>;
      function Close(Value : String) : iBuilderSaturday<T>;
      function &End : T;
  end;

implementation

{ TBuilderSaturday<T> }

procedure TBuilderSaturday<T>.AddList;
begin

end;

function TBuilderSaturday<T>.Close(Value: String): iBuilderSaturday<T>;
begin

end;

constructor TBuilderSaturday<T>.Create(Parent: T; Root: TRootDTO);
begin

end;

destructor TBuilderSaturday<T>.Destroy;
begin

  inherited;
end;

function TBuilderSaturday<T>.&End: T;
begin

end;

class function TBuilderSaturday<T>.New(Parent: T;
  Root: TRootDTO): iBuilderSaturday<T>;
begin

end;

function TBuilderSaturday<T>.Open(Value: String): iBuilderSaturday<T>;
begin

end;

end.
