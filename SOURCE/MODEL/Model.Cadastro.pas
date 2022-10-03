unit Model.Cadastro;

interface

uses
  System.SysUtils,
  Vcl.Forms,
  Auxiliar.Forms,
  Auxiliar.Dialogos,
  Auxiliar.Validacoes,
  Auxiliar.Variaveis.Globais,
  Controller.Interfaces;

type
  TModelOperacoes = class(TInterfacedObject, iModel)
  private
    FFrame: TFrame;
    FObserver: iSubject;
    FCodigo: Integer;
    FMsg,
    FDescricao: String;
    Notificacao: TNotificacao;
    procedure Atualizar;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModel;
    function Observer(pObserver: iSubject): iModel;
    function Formulario(pFrame: TFrame): iModel;
    procedure EfetuarLancamentos;
  end;

implementation

{ TModelOperacoes }

constructor TModelOperacoes.Create;
begin
end;

destructor TModelOperacoes.Destroy;
begin
  inherited;
end;

class function TModelOperacoes.New: iModel;
begin
  Result := Self.Create;
end;

function TModelOperacoes.Observer(pObserver: iSubject): iModel;
begin
  Result    := Self;
  FObserver := pObserver;
end;

function TModelOperacoes.Formulario(pFrame: TFrame): iModel;
begin
  Result := Self;
  FFrame := pFrame;
end;

procedure TModelOperacoes.EfetuarLancamentos;
begin
  FMsg       := '';
  FDescricao := GetValor(FFrame,'edtDescricao');
  if GetValor(FFrame,'edtCodigo').IsEmpty then
     FCodigo := 0
  else
     FCodigo := StrToInt(GetValor(FFrame,'edtCodigo'));

  if ((FCodigo > 0) and (FDescricao <> ''))  then
     Atualizar
  else
     begin
       if FCodigo = 0 then
          FMsg := #13 + 'C�digo [ ' + FCodigo.ToString + ' ] n�o aceito.' + #13;

       if GetValor(FFrame,'edtDescricao') = '' then
          FMsg := FMsg + #13 + 'Descri��o n�o pode ficar em branco' + #13;

       Msg('Lan�amento Incorreto !!!' + #13 + FMsg, 3);
     end;

  ClearEdits(FFrame);
  SetFoco(FFrame,'edtCodigo');
end;

procedure TModelOperacoes.Atualizar;
begin
  Notificacao.Codigo    := FCodigo;
  Notificacao.Descricao := FDescricao;

  FObserver.Notificar(Notificacao);
end;

end.
