program TESTEWK_Weder;

uses
  Vcl.Forms,
  ClassClientes in 'Fonte\Classes\ClassClientes.pas',
  ClassConexao in 'Fonte\Classes\ClassConexao.pas',
  ClassControle in 'Fonte\Classes\ClassControle.pas',
  ClassPedidos in 'Fonte\Classes\ClassPedidos.pas',
  ClassPedidosProdutos in 'Fonte\Classes\ClassPedidosProdutos.pas',
  untPrincipal in 'Fonte\untPrincipal.pas' {FrmPrincipal},
  untLancamentoPedidos in 'Fonte\untLancamentoPedidos.pas' {FrmLancamentoPedidos},
  ClassProdutos in 'Fonte\Classes\ClassProdutos.pas',
  untPesquisa in 'Fonte\untPesquisa.pas' {frmPesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
