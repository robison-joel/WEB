Discord
================================================================

Mensageiro que possibilita criação de grupos, reuniões e Videoconferências.

Instalação
----------------------------------------------------------------

### Via pacote ".deb"

Crie a pasta que vai receber o arquivo de Instalação.

`sudo mkdir .discord`

Entra na pasta

`cd .discord/`

Faz o download do arquivo deinstalação.

`sudo wget https://dl.discordapp.net/apps/linux/0.0.17/discord-0.0.17.deb`

> Caso o link acima esteja desatualizado procure o mais recente em: 

Concede permissão de execução ao arquivo.

`sudo chmod +x discord-0.0.17.deb`

Executa

`sudo dpkg -i discord-0.0.17.deb`

Instala dependêcias, caso hajam.

`sudo apt install -f -y`

Atualiza.

`sudo apt update ; apt list --upgradable ; sudo apt upgrade -y`

Caso queira, após a instalação você pode deletar os arquivos de instalação.

`cd ..`

`sudo rm -rf .discord`

### Via Snap

Há a opção de instalar o Discord pelo Snap.

> Caso não tenha o snap instalado:
> `sudo apt install snap`

Após a instalação do Snap

´sudo snap install discord`