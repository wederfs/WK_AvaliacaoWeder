unit ClassConexao;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Comp.Client,
  FireDAC.VCLUI.Wait, FireDAC.Phys.MySQL, Data.DB, System.SysUtils;

Type
  TTipoAcao = (tpIndefinido, tpIncluir, tpAlterar, tpExcluir);

  TConexao = class
    private
      FPhysMySQLDriver: TFDPhysMySQLDriverLink;
      procedure ParametrosConexao;
    public
      FConnection : TFdConnection;
      constructor Create;
      destructor Destroy; override;
      function GetConnection : TFdConnection;
      function TQuery : TFdQuery;
  end;

implementation

{TConexao}

constructor TConexao.Create;
begin
  FConnection      := TFDConnection.Create(nil);
  FPhysMySQLDriver := TFDPhysMySQLDriverLink(nil);
  Self.ParametrosConexao();
end;

Destructor TConexao.Destroy;
begin
  FreeAndNil(FConnection);
  FreeAndNil(FPhysMySQLDriver);
  inherited;
end;

function TConexao.GetConnection: TFdConnection;
begin
  Result := FConnection;
end;

procedure TConexao.parametrosconexao;
begin
  Fconnection.LoginPrompt       := false;
  Fconnection.Params.DriverID   := 'MySql';
  Fconnection.Params.UserName   := 'root';
  Fconnection.Params.Password   := 'root';
  Fconnection.Params.Database   := 'db_testewk';
  Fconnection.Params.Add('port=3306');
end;

function TConexao.TQuery: TFdQuery;
var
  VQuery : TFdQuery;
begin
  VQuery            := TFdQuery.Create(nil);
  VQuery.Connection := Fconnection;
  Result := VQuery;
end;

end.
