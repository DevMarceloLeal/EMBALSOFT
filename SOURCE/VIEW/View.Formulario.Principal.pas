unit View.Formulario.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  View.Frame.Cadastro,
  View.Frame.Consulta,
  View.Frame.Total,
  Controller.Interfaces,
  Controller.Factory,
  Auxiliar.Forms,
  Auxiliar.Dialogos,
  Auxiliar.Controller.Global,
  Auxiliar.Variaveis.Globais;

type
  TFrmPrincipal = class(TForm)
    FrameCadastros: TFrameCadastros;
    FrameDados: TFrameDados;
    FrameTotal: TFrameTotal;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    bhHint: TBalloonHint;
    procedure Configurar_Ambiente;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Configurar_Ambiente;
end;

procedure TFrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    Char(VK_ESCAPE):
      begin
        Key := #0;
        Close;
      end;

    char(VK_RETURN):
      begin
        Key := #0;
        keybd_event(VK_TAB, 0, 0, 0);
      end;
  end;
end;

procedure TFrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := Msg('Deseja Realmente Sair ?', 4);
  if CanClose then
     ModalResult := mrCancel
  else
     SetFoco(FrameCadastros, 'edtCodigo');
end;

procedure TFrmPrincipal.FormDestroy(Sender: TObject);
begin
  Application.Terminate;
  TerminateProcess(GetCurrentProcess, 0);
end;

procedure TFrmPrincipal.Configurar_Ambiente;
begin
  bhHint         := TBalloonHint.Create(nil);
  bhHint.Delay   := 10;
  bhHint.Style   := bhsBalloon;
  CustomHint     := bhHint;
  ShowHint       := True;
  BorderIcons    := [biSystemMenu];
  Position       := poDesktopCenter;
  Text           := 'EmbalSoft Sistemas';
  gTopo          := Top;
  gEsquerda      := Left;
  gLargura       := Width;
  gComprimento   := Height;
  gPosicao       := poMainFormCenter;
  gControle      := TController.New;

  gControle.Observer.Adicionar(FrameDados);
  gControle.Observer.Adicionar(FrameTotal);
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
