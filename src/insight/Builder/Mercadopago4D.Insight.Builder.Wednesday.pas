unit Mercadopago4D.Insight.Builder.Wednesday;

interface

uses
  Mercadopago4D.Insight.Builder.Interfaces, Mercadopago4D.Insight.DTO.QRCode;

type

  TBuilderWednesday<T : IInterface> = class(TInterfacedObject, iBuilderWednesday<T>)
    private
      [weak]
      FParent : T;
      FOpen : String;
      FClose : String;
      procedure AddList;
    public
      constructor Create(Parent : T; Root : TRootDTO);
      destructor Destroy; override;
      class function New(Parent : T; Root : TRootDTO) : iBuilderWednesday<T>;
      function Open(Value : String) : iBuilderWednesday<T>;
      function Close(Value : String) : iBuilderWednesday<T>;
      function &End : T;
  end;

implementation

{ TBuilderWednesday<T> }

procedure TBuilderWednesday<T>.AddList;
begin

end;

function TBuilderWednesday<T>.Close(Value: String): iBuilderWednesday<T>;
begin

end;

constructor TBuilderWednesday<T>.Create(Parent: T; Root: TRootDTO);
begin

end;

destructor TBuilderWednesday<T>.Destroy;
begin

  inherited;
end;

function TBuilderWednesday<T>.&End: T;
begin

end;

class function TBuilderWednesday<T>.New(Parent: T;
  Root: TRootDTO): iBuilderWednesday<T>;
begin

end;

function TBuilderWednesday<T>.Open(Value: String): iBuilderWednesday<T>;
begin

end;

end.
