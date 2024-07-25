Anydesk
================================================================

> [Inicio](index.md) > [Programas](index.md#Programas)

O que é?
-----------------

Programa para acesso remoto.

Instalação
----------------------------------------------------------------

1.1 Crie a pasta que vai receber o arquivo de Instalação.

`sudo mkdir .anydesk`

1.2 Entra na pasta

`cd .anydesk/`

1.3 Faz o download do arquivo deinstalação.

`sudo wget https://download.anydesk.com/linux/anydesk_.deb`

> Caso o link acima esteja desatualizado procure o mais recente em: <https://download.anydesk.com/linux/>

1.4 Concede permissão de execução ao arquivo.

`sudo chmod +x anydesk_.deb`

1.5 Executa

`sudo dpkg -i anydesk_.deb`

1.6 Instala dependêcias, caso hajam.

`sudo apt install -f -y`

1.7 Atualiza.

`sudo apt update ; apt list --upgradable ; sudo apt upgrade -y`

1.8 Caso queira, após a instalação você pode deletar os arquivos de instalação.

`cd ..`

`sudo rm -rf .anydesk`
