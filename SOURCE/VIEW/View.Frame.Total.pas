unit View.Frame.Total;

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
  Controller.Interfaces,
  Auxiliar.Forms,
  Auxiliar.Conversoes,
  Auxiliar.Controller.Global,
  Auxiliar.Variaveis.Globais;

type
  TFrameTotal = class(TFrame, iObserver)
    Label1: TLabel;
    edtTotalRegistros: TEdit;
  public
    constructor Create(AOwner: TComponent) ; override;
    destructor Destroy; override;
    procedure Atualizar(Notificacao: TNotificacao);
  end;

implementation

{$R *.dfm}

constructor TFrameTotal.Create(AOwner: TComponent);
begin
  inherited;
  edtTotalRegistros.Text := '0';
end;

destructor TFrameTotal.Destroy;
begin
  inherited;
end;

procedure TFrameTotal.Atualizar(Notificacao: TNotificacao);
begin
  edtTotalRegistros.Text := FormatFloat('###,##0', gRegistros);
end;

end.
