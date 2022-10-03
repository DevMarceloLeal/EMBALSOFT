program EMBALSOFT;

uses
  Vcl.Forms,
  View.Formulario.Principal in 'SOURCE\VIEW\View.Formulario.Principal.pas' {FrmPrincipal},
  View.Frame.Cadastro in 'SOURCE\VIEW\View.Frame.Cadastro.pas' {FrameCadastros: TFrame},
  View.Frame.Consulta in 'SOURCE\VIEW\View.Frame.Consulta.pas' {FrameDados: TFrame},
  View.Frame.Total in 'SOURCE\VIEW\View.Frame.Total.pas' {FrameTotal: TFrame},
  Vcl.Themes,
  Vcl.Styles,
  Auxiliar.Dialogos in 'SOURCE\AUXILIAR\Auxiliar.Dialogos.pas',
  Auxiliar.Controller.Global in 'SOURCE\AUXILIAR\Auxiliar.Controller.Global.pas',
  Auxiliar.Conversoes in 'SOURCE\AUXILIAR\Auxiliar.Conversoes.pas',
  Auxiliar.DataGrid in 'SOURCE\AUXILIAR\Auxiliar.DataGrid.pas',
  Auxiliar.Forms in 'SOURCE\AUXILIAR\Auxiliar.Forms.pas',
  Auxiliar.Fundo.Esmaecido in 'SOURCE\AUXILIAR\Auxiliar.Fundo.Esmaecido.pas',
  Auxiliar.Validacoes in 'SOURCE\AUXILIAR\Auxiliar.Validacoes.pas',
  Auxiliar.Variaveis.Globais in 'SOURCE\AUXILIAR\Auxiliar.Variaveis.Globais.pas',
  Controller.Factory in 'SOURCE\CONTROLLER\Controller.Factory.pas',
  Controller.Interfaces in 'SOURCE\CONTROLLER\Controller.Interfaces.pas',
  Model.Observer in 'SOURCE\MODEL\Model.Observer.pas',
  View.BackTransparent in 'SOURCE\VIEW\View.BackTransparent.pas' {frmBlack},
  Model.Cadastro in 'SOURCE\MODEL\Model.Cadastro.pas',
  Model.Dados in 'SOURCE\MODEL\Model.Dados.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Smokey Quartz Kamri');
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TfrmBlack, frmBlack);
  Application.Run;
end.
