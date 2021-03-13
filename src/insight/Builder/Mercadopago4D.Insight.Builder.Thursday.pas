unit Mercadopago4D.Insight.Builder.Thursday;

interface

uses
  Mercadopago4D.Insight.Builder.Interfaces, Mercadopago4D.Insight.DTO.QRCode;

type

  TBuilderThursday<T : IInterface> = class(TInterfacedObject, iBuilderThursday<T>)
    private
      [weak]
      FParent : T;
      FOpen : String;
      FClose : String;
      procedure AddList;
    public
      constructor Create(Parent : T; Root : TRootDTO);
      destructor Destroy; override;
      class function New(Parent : T; Root : TRootDTO) : iBuilderThursday<T>;
      function Open(Value : String) : iBuilderThursday<T>;
      function Close(Value : String) : iBuilderThursday<T>;
      function &End : T;
  end;

implementation

{ TBuilderThursday<T> }

procedure TBuilderThursday<T>.AddList;
begin

end;

function TBuilderThursday<T>.Close(Value: String): iBuilderThursday<T>;
begin

end;

constructor TBuilderThursday<T>.Create(Parent: T; Root: TRootDTO);
begin

end;

destructor TBuilderThursday<T>.Destroy;
begin

  inherited;
end;

function TBuilderThursday<T>.&End: T;
begin

end;

class function TBuilderThursday<T>.New(Parent: T;
  Root: TRootDTO): iBuilderThursday<T>;
begin

end;

function TBuilderThursday<T>.Open(Value: String): iBuilderThursday<T>;
begin

end;

end.
