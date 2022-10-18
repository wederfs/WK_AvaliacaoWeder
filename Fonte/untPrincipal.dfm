object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Teste WK Weder'
  ClientHeight = 433
  ClientWidth = 764
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBarraOpcoes: TPanel
    Left = 0
    Top = 0
    Width = 764
    Height = 33
    Align = alTop
    TabOrder = 0
    object Button1: TButton
      Left = 1
      Top = 1
      Width = 104
      Height = 31
      Align = alLeft
      Caption = 'Lan'#231'. Pedidos'
      TabOrder = 0
      OnClick = P2Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 414
    Width = 764
    Height = 19
    Panels = <>
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 64
    object P1: TMenuItem
      Caption = 'Lan'#231'amentos'
      object P2: TMenuItem
        Caption = 'Pedido de Vendas'
        OnClick = P2Click
      end
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=db_testewk'
      'User_Name=root'
      'Password=root'
      'DriverID=MySQL'
      'Compress=False')
    LoginPrompt = False
    Left = 264
    Top = 232
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Teste\Teste_WK\TesteWK_WEDER\libmysql.dll'
    Left = 408
    Top = 192
  end
end
