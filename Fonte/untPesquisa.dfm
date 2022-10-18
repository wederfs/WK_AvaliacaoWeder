object frmPesquisa: TfrmPesquisa
  Left = 0
  Top = 0
  Caption = 'Pesquisa'
  ClientHeight = 345
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 10
    Width = 80
    Height = 13
    Caption = 'Pesquisar por:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 165
    Top = 10
    Width = 55
    Height = 13
    Caption = 'Pesquisar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cbxPesquisaPor: TComboBox
    Left = 8
    Top = 27
    Width = 145
    Height = 21
    TabOrder = 0
    Text = 'cbxPesquisaPor'
  end
  object edtPesquisa: TEdit
    Left = 165
    Top = 27
    Width = 380
    Height = 21
    TabOrder = 1
    TextHint = 'Informe neste campo o dado a ser pesquisado..'
    OnKeyPress = edtPesquisaKeyPress
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 54
    Width = 537
    Height = 251
    DataSource = dsPesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 8
    Top = 311
    Width = 75
    Height = 25
    Caption = 'Selecionar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 89
    Top = 311
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = Button2Click
  end
  object FDQryPesquisa: TFDQuery
    Left = 64
    Top = 136
  end
  object dsPesquisa: TDataSource
    DataSet = FDQryPesquisa
    Left = 136
    Top = 136
  end
end
