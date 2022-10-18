unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    P1: TMenuItem;
    P2: TMenuItem;
    pnlBarraOpcoes: TPanel;
    Button1: TButton;
    StatusBar1: TStatusBar;
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    procedure P2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  untLancamentoPedidos;

{$R *.dfm}

procedure TFrmPrincipal.P2Click(Sender: TObject);
begin
  try
    FrmLancamentoPedidos := TFrmLancamentoPedidos.Create(Self);
    FrmLancamentoPedidos.ShowModal;
  finally
    FreeAndNil(FrmLancamentoPedidos);
  end;
end;

end.
