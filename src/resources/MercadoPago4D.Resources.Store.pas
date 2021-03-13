unit MercadoPago4D.Resources.Store;

interface

uses
  MercadoPago4D.Resources.Interfaces,
  MercadoPago4D.Core.Interfaces,
  RESTRequest4D,
  System.SysUtils;

type
  TStore = class(TInterfacedObject, iStore)
    private
      [weak]
      FParent : iMercadoPago4DConfiguration;
    public
      constructor Create(Parent : iMercadoPago4DConfiguration);
      destructor Destroy; override;
      class function New(Parent : iMercadoPago4DConfiguration) : iStore;
      function CreateStore(Builder : IInterface) : iStore;
      function UpdateStore(Builder : IInterface) : iStore;
      function SearchStores : String;
      function DelSotre(Value : String) : iStore;
      function GenerateQRCode(Builder : IInterface) : iStore;
      function UpdateQRCode(Builder : IInterface; Value : String) : iStore;
      function SearchQRs : String;
      function SearchQRExternalID(Value : String) : String;
      function DelQRCode(Value : String) : iStore;
      function &End : iStore;
  end;

implementation


{ TStore }

constructor TStore.Create(Parent: iMercadoPago4DConfiguration);
begin

end;

function TStore.CreateStore(Builder: IInterface): iStore;
begin

end;

function TStore.DelQRCode(Value: String): iStore;
begin

end;

function TStore.DelSotre(Value: String): iStore;
begin

end;

destructor TStore.Destroy;
begin

  inherited;
end;

function TStore.&End: iStore;
begin

end;

function TStore.GenerateQRCode(Builder: IInterface): iStore;
begin

end;

class function TStore.New(Parent: iMercadoPago4DConfiguration): iStore;
begin

end;

function TStore.SearchQRExternalID(Value: String): String;
begin

end;

function TStore.SearchQRs: String;
begin

end;

function TStore.SearchStores: String;
begin

end;

function TStore.UpdateQRCode(Builder: IInterface; Value: String): iStore;
begin

end;

function TStore.UpdateStore(Builder: IInterface): iStore;
begin

end;

end.
