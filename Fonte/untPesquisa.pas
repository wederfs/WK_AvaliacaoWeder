unit untPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ClassConexao, FireDAC.Phys.FBDef, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB;

type
  TfrmPesquisa = class(TForm)
    Label1: TLabel;
    cbxPesquisaPor: TComboBox;
    Label2: TLabel;
    edtPesquisa: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    FDQryPesquisa: TFDQuery;
    dsPesquisa: TDataSource;
    procedure Button2Click(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FSQLText: string;
    FCampoRetorno: string;
    FValorRetorno: string;
    procedure SetSQLText(const Value: string);
    procedure SetCampoRetorno(const Value: string);
    procedure SetValorRetorno(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    Conexao : TConexao;
    property SQLText : string read FSQLText write SetSQLText;
    property CampoRetorno : string read FCampoRetorno write SetCampoRetorno;
    property ValorRetorno : string read FValorRetorno write SetValorRetorno;
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

{$R *.dfm}

procedure TfrmPesquisa.Button1Click(Sender: TObject);
var
  i : Integer;
begin
  With FDQryPesquisa do
  begin
    if Not IsEmpty then
    begin
      for I := 0 to (FieldCount) - 1 do
      begin
        if Fields[i].FieldName = CampoRetorno then
          ValorRetorno := Fields[i].AsString;
      end;
      cbxPesquisaPor.ItemIndex := 0;
    end;
  end;
  Close;
end;

procedure TfrmPesquisa.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPesquisa.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
   begin
     if (cbxPesquisaPor.Text <> EmptyStr) and  (cbxPesquisaPor.Text <> EmptyStr) then
     begin
       With FDQryPesquisa do
       begin
         Close;
         SQL.Text := SQLText + ' WHERE ' + cbxPesquisaPor.Text+ ' LIKE '+QuotedStr(edtPesquisa.Text+'%');
         Open;
       end;
     end;
   end;
end;

procedure TfrmPesquisa.FormCreate(Sender: TObject);
begin
  ValorRetorno := '';
end;

procedure TfrmPesquisa.FormShow(Sender: TObject);
var i : Integer;
begin
  if SQLText <> EmptyStr then
  begin
    With FDQryPesquisa do
    begin
      Connection := Self.Conexao.FConnection;
      Close;
      SQL.Text := SQLText;
      Open;

      if Not IsEmpty then
      begin
        for I := 0 to (FieldCount) - 1 do
        begin
          if Fields[I].DataType in [ftString,ftWideString,ftFixedChar] then
            cbxPesquisaPor.Items.Add(Fields[I].FieldName);
        end;
        cbxPesquisaPor.ItemIndex := 0;
      end;
    end;
  end;
end;

procedure TfrmPesquisa.SetCampoRetorno(const Value: string);
begin
  FCampoRetorno := Value;
end;

procedure TfrmPesquisa.SetSQLText(const Value: string);
begin
  FSQLText := Value;
end;

procedure TfrmPesquisa.SetValorRetorno(const Value: string);
begin
  FValorRetorno := Value;
end;

end.
