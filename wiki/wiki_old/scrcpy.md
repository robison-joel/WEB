Scrcpy
===============

> Antes de iniciar, será preciso ativar o MODO DE DESENVOLVEDOR em seu celular e habilitar a DEPURAÇÃO USB. No Android 5.0 e superiores, você vai em "Configurações" > "Sistema" > "Sobre o telefone" e toque repetidamente (por volta de 7 ou 8 vezes) no número de série do aparelho e ele abrirá a possibilidade de habilitar o modo de desenvolvedor.

Instalação
-----------------------

`sudo apt install snapd`

`sudo snap refresh`

`sudo snap install scrcpy`

Utilização
--------------------

Com o smartphone conectado via USB, rode o comando:

`scrcpy`

### Opções

Ajuda do comando:

`scrcpy --help`

Diminuir a definição para aumentar performance

`scrcpy --max-size 1024`

O bit-rate padrão é 8Mbps, no exemplo abaixo, reduzimos para 2.

`scrcpy --bit-rate 2M`

Espelha apenas uma parte da tela.

`scrcpy --crop 1224:1440:0:0`

Gravar a tela enquanto espelha

`scrcpy –r /local_do_arquivo/nome_do_arquivo.mp4`

Fonte
------------------

* <https://sempreupdate.com.br/como-controlar-seu-android-pelo-linux-usando-scrcpy/>
