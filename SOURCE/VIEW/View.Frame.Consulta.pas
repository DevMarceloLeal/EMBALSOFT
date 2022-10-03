unit View.Frame.Consulta;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Variants,
  System.Classes,
  System.Generics.Collections,
  System.SysUtils,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Data.DB,
  Controller.Interfaces,
  Auxiliar.Forms,
  Auxiliar.Conversoes,
  Auxiliar.Controller.Global,
  Auxiliar.Variaveis.Globais,
  Model.Dados;

type
  TFrameDados = class(TFrame, iObserver)
    dbgCadastros: TDBGrid;
  private
    FControle: TModelDados;
  public
    constructor Create(AOwner: TComponent) ; override;
    destructor Destroy; override;
    procedure Atualizar(Notificacao: TNotificacao);
  end;

implementation

{$R *.dfm}

constructor TFrameDados.Create(AOwner: TComponent);
begin
  inherited;
  FControle := TModelDados.New;
  FControle.Formulario(Self).Dados;
end;

destructor TFrameDados.Destroy;
begin
  inherited;
end;

procedure TFrameDados.Atualizar(Notificacao: TNotificacao);
begin
  FControle.Formulario(Self).EfetuarLancamentos(Notificacao);
end;

end.
