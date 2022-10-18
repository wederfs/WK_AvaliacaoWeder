object FrmLancamentoPedidos: TFrmLancamentoPedidos
  Left = 0
  Top = 0
  Caption = 'Teste WK - Weder - Lan'#195#167'amento Pedido'
  ClientHeight = 416
  ClientWidth = 704
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 388
    Width = 704
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnGravarPedido: TButton
      Left = 220
      Top = 0
      Width = 104
      Height = 28
      Caption = 'Gravar Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnGravarPedidoClick
    end
    object btnCarregarPedido: TButton
      Left = 2
      Top = 0
      Width = 104
      Height = 28
      Caption = 'Carregar Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnCarregarPedidoClick
    end
    object btnCancelarPedido: TButton
      Left = 111
      Top = 0
      Width = 104
      Height = 28
      Caption = 'Carregar Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnCancelarPedidoClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 74
    Width = 704
    Height = 314
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 131
    ExplicitHeight = 257
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 704
      Height = 314
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitHeight = 257
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 704
        Height = 288
        Align = alClient
        DataSource = dsProdutos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = DBGrid1KeyDown
        OnKeyPress = DBGrid1KeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_UNIT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            ReadOnly = True
            Visible = True
          end>
      end
      object Panel5: TPanel
        Left = 0
        Top = 288
        Width = 704
        Height = 26
        Align = alBottom
        TabOrder = 1
        object Label5: TLabel
          Left = 506
          Top = 6
          Width = 65
          Height = 13
          Caption = 'Total Geral:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtTotalGeral: TMaskEdit
          Left = 577
          Top = 4
          Width = 123
          Height = 18
          TabStop = False
          Alignment = taRightJustify
          AutoSelect = False
          AutoSize = False
          BorderStyle = bsNone
          Color = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Text = ''
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 704
    Height = 74
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 18
      Top = 8
      Width = 42
      Height = 13
      Caption = 'Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 18
      Top = 32
      Width = 45
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 380
      Top = 32
      Width = 23
      Height = 13
      Caption = 'Qtd.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 451
      Top = 32
      Width = 44
      Height = 13
      Caption = 'Vlr Unit.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCliente: TEdit
      Left = 61
      Top = 5
      Width = 38
      Height = 21
      Alignment = taRightJustify
      TabOrder = 0
      OnChange = edtClienteChange
      OnExit = edtClienteExit
      OnKeyPress = edtClienteKeyPress
    end
    object btnPesqCliente: TButton
      Left = 100
      Top = 3
      Width = 23
      Height = 25
      Caption = '...'
      TabOrder = 1
      TabStop = False
      OnClick = btnPesqClienteClick
    end
    object edtNomeCliente: TEdit
      Left = 122
      Top = 5
      Width = 391
      Height = 21
      TabStop = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 2
    end
    object edtProduto: TEdit
      Left = 18
      Top = 47
      Width = 38
      Height = 21
      Alignment = taRightJustify
      TabOrder = 3
      OnExit = edtProdutoExit
      OnKeyPress = edtProdutoKeyPress
    end
    object BtnPesqProduto: TButton
      Left = 57
      Top = 45
      Width = 23
      Height = 25
      Caption = '...'
      TabOrder = 4
      TabStop = False
      OnClick = btnPesqProdutoClick
    end
    object edtNomeProduto: TEdit
      Left = 79
      Top = 47
      Width = 297
      Height = 21
      TabStop = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 5
    end
    object edtQtde: TMaskEdit
      Left = 380
      Top = 47
      Width = 60
      Height = 21
      Alignment = taRightJustify
      TabOrder = 6
      Text = ''
      OnKeyPress = edtQtdeKeyPress
    end
    object edtValorUnit: TMaskEdit
      Left = 451
      Top = 47
      Width = 63
      Height = 21
      TabOrder = 7
      Text = ''
    end
    object BtnAdicionaProduto: TBitBtn
      Left = 520
      Top = 45
      Width = 121
      Height = 25
      Caption = 'Adicionar Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = BtnAdicionaProdutoClick
    end
  end
  object cdsProdutos: TClientDataSet
    PersistDataPacket.Data = {
      9F0000009619E0BD0100000018000000050000000000030000009F0005526563
      4E6F040001000200010007535542545950450200490008004175746F696E6300
      06434F4449474F04000100000000000944455343524943414F01004900000001
      000557494454480200020096000351544404000100000000000A56414C4F525F
      554E4954080004000000000001000C4155544F494E4356414C55450400010001
      000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'RecNo'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'QTD'
        DataType = ftInteger
      end
      item
        Name = 'VALOR_UNIT'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforeDelete = cdsProdutosBeforeDelete
    AfterScroll = cdsProdutosAfterScroll
    OnCalcFields = cdsProdutosCalcFields
    Left = 464
    Top = 153
    object cdsProdutosRecNo: TAutoIncField
      FieldName = 'RecNo'
    end
    object cdsProdutosCODIGO: TIntegerField
      DisplayLabel = 'C'#243'd.Prod.'
      DisplayWidth = 10
      FieldName = 'CODIGO'
    end
    object cdsProdutosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 67
      FieldName = 'DESCRICAO'
      Size = 150
    end
    object cdsProdutosQTD: TIntegerField
      DisplayLabel = 'Qtd.'
      DisplayWidth = 10
      FieldName = 'QTD'
    end
    object cdsProdutosVALOR_UNIT: TFloatField
      DisplayLabel = 'Vlr Unit'
      DisplayWidth = 10
      FieldName = 'VALOR_UNIT'
    end
    object cdsProdutosVALOR_TOTAL: TFloatField
      DisplayLabel = 'Total'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'VALOR_TOTAL'
      Calculated = True
    end
  end
  object dsProdutos: TDataSource
    DataSet = cdsProdutos
    Left = 464
    Top = 201
  end
end
