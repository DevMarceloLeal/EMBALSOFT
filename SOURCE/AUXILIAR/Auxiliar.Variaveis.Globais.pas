unit Auxiliar.Variaveis.Globais;

interface

uses
  Vcl.Forms;

type
  TNotificacao = record
    Codigo: Integer;
    Descricao: String;
  end;

var
  gTopo: Integer;
  gEsquerda: Integer;
  gLargura: Integer;
  gComprimento: Integer;
  gPosicao: TPosition = poMainFormCenter;
  gRegistros: Integer = 0;

implementation

end.
