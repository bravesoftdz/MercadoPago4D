unit MercadoPago4D.Model.DTO.QRs;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TQrDTO = class
  private
    FImage: string;
    FTemplate_Document: string;
    FTemplate_Image: string;
  published
    property Image: string read FImage write FImage;
    property Template_Document: string read FTemplate_Document write FTemplate_Document;
    property Template_Image: string read FTemplate_Image write FTemplate_Image;
  end;
  
  TResultsDTO = class
  private
    FDate_Created: TDateTime;
    FDate_Last_Updated: TDateTime;
    FExternal_Id: string;
    FFixed_Amount: Boolean;
    FId: Integer;
    FName: string;
    FQr: TQrDTO;
    FUser_Id: Integer;
  published
    property Date_Created: TDateTime read FDate_Created write FDate_Created;
    property Date_Last_Updated: TDateTime read FDate_Last_Updated write FDate_Last_Updated;
    property External_Id: string read FExternal_Id write FExternal_Id;
    property Fixed_Amount: Boolean read FFixed_Amount write FFixed_Amount;
    property Id: Integer read FId write FId;
    property Name: string read FName write FName;
    property Qr: TQrDTO read FQr write FQr;
    property User_Id: Integer read FUser_Id write FUser_Id;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TPagingDTO = class
  private
    FLimit: Integer;
    FOffset: Integer;
    FTotal: Integer;
  published
    property Limit: Integer read FLimit write FLimit;
    property Offset: Integer read FOffset write FOffset;
    property Total: Integer read FTotal write FTotal;
  end;
  
  TRootDTO = class(TJsonDTO)
  private
    FPaging: TPagingDTO;
    [JSONName('results')]
    FResultsArray: TArray<TResultsDTO>;
    [GenericListReflect]
    FResults: TObjectList<TResultsDTO>;
    function GetResults: TObjectList<TResultsDTO>;
  published
    property Paging: TPagingDTO read FPaging write FPaging;
    property Results: TObjectList<TResultsDTO> read GetResults;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;
  
implementation

{ TResultsDTO }

constructor TResultsDTO.Create;
begin
  inherited;
  FQr := TQrDTO.Create;
end;

destructor TResultsDTO.Destroy;
begin
  FQr.Free;
  inherited;
end;

{ TRootDTO }

constructor TRootDTO.Create;
begin
  inherited;
  FPaging := TPagingDTO.Create;
end;

destructor TRootDTO.Destroy;
begin
  FPaging.Free;
  GetResults.Free;
  inherited;
end;

function TRootDTO.GetResults: TObjectList<TResultsDTO>;
begin
  if not Assigned(FResults) then
  begin
    FResults := TObjectList<TResultsDTO>.Create;
    FResults.AddRange(FResultsArray);
  end;
  Result := FResults;
end;

end.
