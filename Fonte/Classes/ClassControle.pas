unit ClassControle;

interface

uses ClassConexao, System.SysUtils;// {ClassPedidos,} ClassPedidosProdutos;

Type
  TClassControle = class
  private
     FConexao          : TConexao;
     //FPedido           : TClassPedidos;
     //FPedidosProdutos  : TClassPedidosProdutos;
     class var FInstancia : TClassControle;
     public
      Constructor Create();
      Destructor Destroy;override;
      function GravarPedido          : boolean;
      function GravarPedidosProdutos : boolean;
      procedure CarregarPedido(ANumeroPedido : Integer);
      procedure CarregarPedidoProdutos(ANumeroPedido : Integer);
      class function GetInstancia : TClassControle;
      property Conexao         : TConexao read FConexao write FConexao;
      //property Pedido          : TClassPedidos read FPedido write FPedido;
      //property PedidoProdutos  : TClassPedidosProdutos read FPedidosProdutos write FPedidosProdutos;
  end;

implementation

{TClassControle}

procedure TClassControle.CarregarPedido(ANumeroPedido : Integer);
begin
  //FPedido.Carregar(ANumeroPedido);
end;

procedure TClassControle.CarregarPedidoProdutos(ANumeroPedido : Integer);
begin
  //FPedidosProdutos.Carregar(ANumeroPedido);
end;

Constructor TClassControle.Create;
begin
  FConexao         := TConexao.Create;
  //FPedido          := TPedidos.Create;
  //FPedidosProdutos := TPedidosProdutos.Create;
end;

class function TClassControle.GetInstancia: TClassControle;
begin
  if not Assigned(Self.FInstancia) then
    Self.FInstancia := TClassControle.create();
  Result := Self.FInstancia;
end;

function TClassControle.GravarPedido: boolean;
begin
  //Result := FPedido.Salvar;
end;

function TClassControle.GravarPedidosProdutos: boolean;
begin
 //result := FPedidosProdutos.Salvar;
end;

Destructor TClassControle.Destroy;
begin
  //FreeAndNil(FPedidosProdutos);
  //FreeAndNil(FPedido);
  FreeAndNil(FConexao);
  inherited;
end;

end.
