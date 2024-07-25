Diff
============================================

> [Início](index.md) > [Programas](indice.md#Programas)

O que é?
------------------------------------------------

Compara ARQUIVOS linha por linha.

Instalação
------------------------------------------------

`sudo apt install diffutils -y`

Sintaxe
------------------------------------------------

`diff [OPcaO] arquivo_1 arquivo_2`

Opcoes:

* `--normal`: cria um diff no formato normal (padrao).
* `-q` ou `--brief`: indica apenas se os arquivos forem diferentes.
* `-s` ou `--report-identical-files`: indica quando dois arquivos forem o identicos.
* `-c` ou `-C NUM` ou `--context[=NUM]`: cria NUM (padrao 3) linhas de contexto copiado.
* `-u` ou `-U NUM` ou `--unified[=NUM]`: cria NUM (padrao 3) linhas de contexto unificado.
* `-e` ou `--ed`: cria um script para o editor ed.
* `-n` ou `--rcs`: cria um diff no formato RCS.
* `-y` ou `--side-by-side`: cria em duas colunas.
* `-W` ou `--width=NUM`: limita a saida a NUM colunas por linha (padrao 130).
  * `--left-column`: emite apenas a coluna da esquerda das linhas identicas.
  * `--suppress-common-lines`: nao exibe as linhas identicas.
* `-p` ou `--show-c-function`: mostra em qual funcao C esta cada alteracao.
* `-F` ou `--show-function-line=ER`: mostra a linha mais recente correspondendo da ER.
* `-t` ou `--expand-tabs`: expande as tabulacoes para espacos na saida.
* `-T` ou `--initial-tab`: alinha tabulacoes introduzindo uma tabulacao no inicio.
* `--tabsize=NUM`: paradas de tabulacao a cada NUM colunas.
* `--suppress-blank-empty`: suprime espaco ou tabulacao antes de linhas vazias na saida.
* `-l, --paginate`: passa a saida por meio de "pr" para pagina-la.
* -r, --recursive compara recursivamente os subdiretorios encontrados

