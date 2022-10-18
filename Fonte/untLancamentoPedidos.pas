unit untLancamentoPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, Datasnap.DBClient,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ClassConexao, ClassControle,
  ClassClientes, ClassProdutos, ClassPedidos, ClassPedidosProdutos, Vcl.Mask,
  Vcl.Buttons;

type
  TFrmLancamentoPedidos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    btnGravarPedido: TButton;
    Panel3: TPanel;
    Label1: TLabel;
    edtCliente: TEdit;
    btnPesqCliente: TButton;
    edtNomeCliente: TEdit;
    Label2: TLabel;
    edtProduto: TEdit;
    BtnPesqProduto: TButton;
    edtNomeProduto: TEdit;
    Label3: TLabel;
    edtQtde: TMaskEdit;
    Label4: TLabel;
    edtValorUnit: TMaskEdit;
    BtnAdicionaProduto: TBitBtn;
    cdsProdutos: TClientDataSet;
    dsProdutos: TDataSource;
    cdsProdutosCODIGO: TIntegerField;
    cdsProdutosDESCRICAO: TStringField;
    cdsProdutosQTD: TIntegerField;
    cdsProdutosVALOR_UNIT: TFloatField;
    cdsProdutosVALOR_TOTAL: TFloatField;
    Panel5: TPanel;
    Label5: TLabel;
    edtTotalGeral: TMaskEdit;
    cdsProdutosRecNo: TAutoIncField;
    btnCarregarPedido: TButton;
    btnCancelarPedido: TButton;
    procedure btnGravarPedidoClick(Sender: TObject);
    procedure btnPesqClienteClick(Sender: TObject);
    procedure btnPesqProdutoClick(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure RetornaCliente(Codigo: string = '');
    procedure RetornaProduto(Codigo: string = '');
    procedure edtProdutoExit(Sender: TObject);
    procedure edtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure BtnAdicionaProdutoClick(Sender: TObject);
    procedure edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure cdsProdutosCalcFields(DataSet: TDataSet);
    procedure cdsProdutosAfterScroll(DataSet: TDataSet);
    procedure cdsProdutosBeforeDelete(DataSet: TDataSet);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure btnCarregarPedidoClick(Sender: TObject);
    procedure btnCancelarPedidoClick(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure LimparDados;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FProduto_RecNo: Integer;
    procedure SetProduto_RecNo(const Value: Integer);    { Private declarations }
  public
    { Public declarations }
    property Produto_RecNo : Integer read FProduto_RecNo write SetProduto_RecNo;
  end;

var
  FrmLancamentoPedidos: TFrmLancamentoPedidos;
  Cliente : TClassClientes;
  Produto : TClassProdutos;
  Pedido         : TClassPedidos;
  Pedido_Produto : TClassPedidosProdutos;

implementation

uses
  untPesquisa;

{$R *.dfm}

{TFrmLancamentoPedidos}

procedure TFrmLancamentoPedidos.BtnAdicionaProdutoClick(Sender: TObject);
begin
  if edtQtde.Text = EmptyStr then
  begin
    Application.MessageBox('Informe a quantidade !','Aviso',mb_Ok+MB_ICONINFORMATION);
    Exit;
  end;
  if edtValorUnit.Text = EmptyStr then
  begin
    Application.MessageBox('Informe o valor unitário !','Aviso',mb_Ok+MB_ICONINFORMATION);
    Exit;
  end;
  with cdsProdutos do
  begin
    if Active then
    begin
      if (Self.Produto_RecNo > 0) and (not IsEmpty) then
        Edit
      else
      begin
        Insert;
        cdsProdutosCODIGO.Value      := Produto.CODIGO;
        cdsProdutosDESCRICAO.Value   := Produto.DESCRICAO;
      end;
      cdsProdutosQTD.Value         := StrToInt(edtQtde.Text);
      cdsProdutosVALOR_UNIT.Value  := StrToFloat(edtValorUnit.Text);
      cdsProdutosVALOR_TOTAL.Value := (StrToFloat(edtValorUnit.Text) * StrToInt(edtQtde.Text));
      Post;

      Pedido.Valor_Total := Pedido.Valor_Total + cdsProdutosVALOR_TOTAL.AsCurrency;

      edtTotalGeral.Text := FormatFloat('0.00', Pedido.Valor_Total);
    end;
    edtProduto.Clear;
    edtNomeProduto.Clear;
    edtQtde.Clear;
    edtValorUnit.Clear;
  end;
end;

Procedure TFrmLancamentoPedidos.btnPesqClienteClick(Sender: TObject);
begin
  try
    frmPesquisa := TfrmPesquisa.Create(Self);
    frmPesquisa.Conexao := Cliente.FConexao;
    frmPesquisa.CampoRetorno := 'CODIGO';
    frmPesquisa.SQLText := 'SELECT * FROM TB_CLIENTES';
    frmPesquisa.ShowModal;
    RetornaCliente( frmPesquisa.ValorRetorno );
  finally
    frmPesquisa.Free;
  end;
end;

procedure TFrmLancamentoPedidos.btnPesqProdutoClick(Sender: TObject);
begin
  try
    frmPesquisa := TfrmPesquisa.Create(Self);
    frmPesquisa.Conexao := Produto.FConexao;
    frmPesquisa.CampoRetorno := 'CODIGO';
    frmPesquisa.SQLText := 'SELECT * FROM TB_PRODUTOS';
    frmPesquisa.ShowModal;
    RetornaProduto( frmPesquisa.ValorRetorno );
  finally
    frmPesquisa.Free;
  end;
end;

procedure TFrmLancamentoPedidos.btnCancelarPedidoClick(Sender: TObject);
var
  NumPedido : Integer;
begin
  try
    NumPedido := StrToInt( InputBox('Pedidos', 'Informe o número do pedido para cancelamento:', '0') );
    Pedido.Carregar(NumPedido);
    RetornaCliente( IntToStr(Pedido.Codigo_Cliente) );
    Pedido_Produto.Carregar(Pedido.NumeroPedido,cdsProdutos);

    Pedido_Produto.TipoAcao := tpExcluir;
    Pedido.TipoAcao := tpExcluir;

    Pedido_Produto.Salvar;
    Pedido.Salvar;

    LimparDados;

    ShowMessage('Pedido cancelado com sucesso');

  finally
    Pedido_Produto.TipoAcao := tpIncluir;
    Pedido.TipoAcao := tpIncluir;
  end;
end;

procedure TFrmLancamentoPedidos.btnCarregarPedidoClick(Sender: TObject);
var
  NumPedido : Integer;
begin
  NumPedido := StrToInt( InputBox('Pedidos', 'Informe o número do pedido:', '0') );
  Pedido.Carregar(NumPedido);
  RetornaCliente( IntToStr(Pedido.Codigo_Cliente) );
  Pedido_Produto.Carregar(Pedido.NumeroPedido,cdsProdutos);
end;

procedure TFrmLancamentoPedidos.btnGravarPedidoClick(Sender: TObject);
var
  QueryTemp      : TFDQuery;
  bConfirmaSalvar: Boolean;
begin
  if Cliente.CODIGO <= 0 then
  begin
    Application.MessageBox('Informe o cliente !','Aviso',mb_Ok+MB_ICONINFORMATION);
    Exit;
  end;

  if cdsProdutos.IsEmpty then
  begin
    Application.MessageBox('Necessário adicionar produto(s) !','Aviso',mb_Ok+MB_ICONINFORMATION);
    Exit;
  end;

  bConfirmaSalvar := False;

  Pedido.Codigo_Cliente := Cliente.CODIGO;
  QueryTemp  := TClassControle.GetInstancia.Conexao.TQuery;
  try
    QueryTemp.ExecSQL('START TRANSACTION');
    if (Pedido.Salvar) then
    begin
      Pedido_Produto.TipoAcao              := tpIncluir;
      Pedido_Produto.NumeroPedido          := Pedido.NumeroPedido;

      cdsProdutos.First;
      while not cdsProdutos.Eof do
      begin
        Pedido_Produto.Codigo_Produto        := cdsProdutosCODIGO.Value;
        Pedido_Produto.Valor_Unitario        := cdsProdutosVALOR_UNIT.Value;
        Pedido_Produto.Quantidade            := cdsProdutosQTD.Value;
        Pedido_Produto.Valor_Total           := (cdsProdutosVALOR_UNIT.Value * cdsProdutosQTD.Value);

        bConfirmaSalvar := (Pedido_Produto.Salvar);

        cdsProdutos.Next;
      end;
    end;

    if bConfirmaSalvar then
    begin
      QueryTemp.close;
      QueryTemp.sql.Clear;
      QueryTemp.ExecSQL('COMMIT');
      ShowMessage('Pedido gravado com sucesso');
    end;

  Except
    on msg: Exception do
    begin
      QueryTemp.close;
      QueryTemp.sql.Clear;
      QueryTemp.ExecSQL('COMMIT');
      showmessage('Erro ao gravar o pedido: ' + msg.Message);
    end;
  end;
end;

procedure TFrmLancamentoPedidos.cdsProdutosAfterScroll(DataSet: TDataSet);
begin
  edtTotalGeral.Text := FormatFloat('0.00', Pedido.Valor_Total);
end;

procedure TFrmLancamentoPedidos.cdsProdutosBeforeDelete(DataSet: TDataSet);
begin
 Pedido.Valor_Total := Pedido.Valor_Total - cdsProdutosVALOR_TOTAL.AsCurrency;
 if Pedido.Valor_Total < 0 then
    Pedido.Valor_Total := 0;
end;

procedure TFrmLancamentoPedidos.cdsProdutosCalcFields(DataSet: TDataSet);
begin
  cdsProdutosVALOR_TOTAL.AsCurrency := cdsProdutosVALOR_UNIT.AsCurrency * cdsProdutosQTD.AsInteger;
end;

procedure TFrmLancamentoPedidos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 46 then
  begin
    if Application.messagebox('Deseja excluir este Registro','Atenção',36) = 6 then
       cdsProdutos.Delete;
  end;
end;

procedure TFrmLancamentoPedidos.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (not cdsProdutos.IsEmpty) then
  begin
    Self.Produto_RecNo   := cdsProdutosRecNo.Value;
    RetornaProduto( cdsProdutosCODIGO.AsString );
    Self.edtQtde.Text    := cdsProdutosQTD.AsString;
    Self.edtValorUnit.Text      := cdsProdutosVALOR_UNIT.AsString;
    Self.edtProduto.ReadOnly    := (Self.Produto_RecNo > 0);
    Self.BtnPesqProduto.Enabled := (Self.Produto_RecNo = 0);
    Self.edtQtde.SetFocus;
  end;
end;

procedure TFrmLancamentoPedidos.edtClienteChange(Sender: TObject);
begin
  btnCarregarPedido.Enabled := (edtCliente.Text = EmptyStr);
  btnCancelarPedido.Enabled := (edtCliente.Text = EmptyStr);
end;

procedure TFrmLancamentoPedidos.edtClienteExit(Sender: TObject);
begin
  if edtCliente.Text <> EmptyStr then
     RetornaCliente;
end;

procedure TFrmLancamentoPedidos.edtClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) and (edtCliente.Text <> EmptyStr) then
  begin
    RetornaCliente;
    Screen.ActiveForm.Perform(WM_NextDlgCtl, 0, 0);
  end;
end;

procedure TFrmLancamentoPedidos.FormCreate(Sender: TObject);
begin
  Cliente := TClassClientes.Create;
  Produto := TClassProdutos.Create;
  Self.Produto_RecNo := 0;
  Pedido  := TClassPedidos.Create;
  Pedido.TipoAcao     := TpIncluir;
  Pedido.Data_Emissao := Now;
  Pedido.Valor_Total  := 0;
  Pedido_Produto      := TClassPedidosProdutos.Create;
end;

procedure TFrmLancamentoPedidos.LimparDados;
begin
  Cliente.Limpar;
  Pedido.Limpar;
  Pedido_Produto.Limpar;
  cdsProdutos.EmptyDataSet;
  edtCliente.Clear;
  edtNomeCliente.Clear;
  edtProduto.Clear;
  edtNomeProduto.Clear;
  edtQtde.Clear;
  edtValorUnit.Clear;
  edtTotalGeral.Clear;
end;

procedure TFrmLancamentoPedidos.RetornaCliente(Codigo: string = '');
begin
  if Codigo <> EmptyStr then
    Cliente.PesquisaCliente( StrToInt( Codigo ) )
  else
    Cliente.PesquisaCliente( StrToInt( edtCliente.Text ) );
  edtCliente.Text     := IntToStr(Cliente.CODIGO);
  edtNomeCliente.Text := Cliente.NOME;
end;

procedure TFrmLancamentoPedidos.RetornaProduto(Codigo: string = '');
begin
  if Codigo <> EmptyStr then
    Produto.PesquisaProduto( StrToInt( Codigo ) )
  else
    Produto.PesquisaProduto( StrToInt( edtProduto.Text ) );
  edtProduto.Text     := IntToStr(Produto.CODIGO);
  edtNomeProduto.Text := Produto.DESCRICAO;
  edtValorUnit.Text   := FormatFloat('0.00', Produto.PRECO_VENDA);
end;

procedure TFrmLancamentoPedidos.SetProduto_RecNo(const Value: Integer);
begin
  FProduto_RecNo := Value;
end;

procedure TFrmLancamentoPedidos.edtProdutoExit(Sender: TObject);
begin
  if edtProduto.Text <> EmptyStr then
     RetornaProduto;
end;

procedure TFrmLancamentoPedidos.edtProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (edtProduto.Text <> EmptyStr) then
  begin
    RetornaProduto;
    Screen.ActiveForm.Perform(WM_NextDlgCtl, 0, 0);
  end;
end;

procedure TFrmLancamentoPedidos.edtQtdeKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    if (key in ['0'..'9'] = false) then
       Key := #0
    else
      Screen.ActiveForm.Perform(WM_NextDlgCtl, 0, 0);
  end;
end;

end.
