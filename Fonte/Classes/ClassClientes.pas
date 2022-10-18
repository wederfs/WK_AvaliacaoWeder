unit ClassClientes;

interface

uses FireDac.Comp.Client, System.SysUtils, ClassControle, ClassConexao; 

type

  TClassClientes = class
  private
    FCODIGO :Integer;
    FNOME   :String;
    FCIDADE :String;
    FUF     :String;
    procedure SetCODIGO(const Value: Integer);
    procedure SetNOME(const Value: String);
    procedure SetCIDADE(const Value: String);
    procedure SetUF(const Value: String);
  public
    FConexao: TConexao;
    Constructor Create();
    destructor Destroy; override;
    Function CarregarClientes : TFDQuery;
    Function PesquisaCliente( CODIGO: Integer ) : TFDQuery;
    procedure Limpar;
    property CODIGO :Integer read FCODIGO write SetCODIGO;
    property NOME   :String read FNOME write SetNOME;
    property CIDADE :String read FCIDADE write SetCIDADE;
    property UF     :String read FUF write SetUF;
  end;

implementation

{ TClassClientes }

Constructor TClassClientes.Create;
begin
  FConexao := TClassControle.GetInstancia.Conexao;
end;

Destructor TClassClientes.Destroy;
begin
  FreeAndNil(FConexao);
  inherited;
end;

procedure TClassClientes.Limpar;
begin
  Self.CODIGO := 0;
  Self.NOME   := '';
  Self.CIDADE := '';
  Self.UF     := '';
end;

function TClassClientes.PesquisaCliente(CODIGO: Integer): TFDQuery;
var
  VQuery : TFDQuery;
begin
  VQuery := FConexao.TQuery();
  VQuery.open('SELECT * FROM TB_CLIENTES WHERE CODIGO = ' + IntToStr(CODIGO));

  if not VQuery.IsEmpty then
  begin
    with VQuery do
    begin
      Self.CODIGO := FieldByName('CODIGO').Value;
      Self.NOME   := FieldByName('NOME').Value;
      Self.CIDADE := FieldByName('CIDADE').Value;
      Self.UF     := FieldByName('UF').Value;
    end;
  end
  else
  begin
    Self.CODIGO := 0;
    Self.NOME   := '';
    Self.CIDADE := '';
    Self.UF     := '';
  end;
  Result := VQuery;
end;

function TClassClientes.CarregarClientes: TFDQuery;
var
  VQuery : TFDQuery;
begin
  VQuery := FConexao.TQuery();
  VQuery.open('SELECT * FROM TB_CLIENTES ORDER BY NOME');
  Result := VQuery;
end;

procedure TClassClientes.SetCIDADE(const Value: String);
begin
  FCIDADE := value;
end;

procedure TClassClientes.SetCODIGO(const Value: Integer);
begin
  FCODIGO := value
end;

procedure TClassClientes.SetNOME(const Value: String);
begin
  FNOME := value;
end;

procedure TClassClientes.SetUF(const Value: String);
begin
  FUF := value;
end;

end.
