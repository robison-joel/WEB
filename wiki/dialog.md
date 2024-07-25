Dialog
======================

[Inicio](index.md) > [Programas](index.md#Programas)

O que faz?
------------------------------------------------

Cria interfaces em shellcript

Instalação
------------------------------------------------

`sudo apt install dialog`

Sintaxe
------------------------------------------------

O comando `dialog` deve vir acompanhado da instrução do tipo de "caixa" que ela se refere.

### Caixas

Tipo da caixa | Desenha uma caixa onde o usuário...
--------------|-------------------------------------
calendar      | Vê um calendário e escolhe uma data
checklist     | Vê uma lista de opções e escolhe várias
fselect       | Digita ou escolhe um arquivo
gauge         | Vê uma barra de progresso (porcentagem)
infobox       | Vê uma mensagem, sem botões
inputbox      | Digita um texto qualquer
menu          | Vê um menu e escolhe um item
msgbox        | Vê uma mensagem e aperta o botão OK
passwordbox   | Digita uma senha
radiolist     | Vê uma lista de opções e escolhe uma
tailbox       | Vê a saída do comando tail -f
tailboxbg     | Vê a saída do comando tail -f (em segundo plano)
textbox       | Vê o conteúdo de um arquivo
timebox       | Escolhe um horário
yesno         | Vê uma pergunta e aperta o botão YES ou o NO

Dialog Tour
-------------------------

[Clique aqui](scripts/Shell/Dialog/dialog-tour.sh) e baixe um script que mostra todas as opções de janelas disponíveis pelo programa.

Fontes
-------------------------

* <https://aurelio.net/shell/dialog/#prefacio>
