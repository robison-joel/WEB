Docker
======================================

Instalando o Docker
--------------------------------------

Atualize os repositórios.

`sudo apt update`

Em seguida, instale alguns pacotes de pré-requisitos que permitem usar pacotes via HTTPS.

`sudo apt install apt-transport-https ca-certificates curl software-properties-common`

Em seguida, adicione a chave GPG do repositório oficial do Docker ao seu sistema.

`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg`

Adicione o repositório Docker às fontes APT.

`echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`

Atualize sua lista existente de pacotes novamente para que a adição seja reconhecida:

`sudo apt update`

Certifique-se de instalar a partir do repositório Docker em vez do repositório padrão do Ubuntu:

`apt-cache policy docker-ce`

E por fim, instale o Docker.

`sudo apt install docker-ce`

O Docker agora deve estar instalado, o daemon iniciado e o processo habilitado para iniciar na inicialização. Verifique se está funcionando:

`sudo systemctl status docker`

Se você quiser evitar digitar sudo sempre que executar o docker comando, adicione seu nome de usuário ao dockergrupo:

`sudo usermod -aG docker ${USER}`

Usando o docker
----------------------------------------

`docker serach *termo de pesquisa*`

Para baixar alguma imagem:

`docker pull *nome da imagem*`

Para listar as imagens já baixadas:

`docker images`

Para iniciar uma imagem e ter acesso ao seu terminal:

`docker run -it *nome da imagem*`

Para listar os docker's ativos no momento:

`docker ps`

Para listar todos os docker's do seu computador:

`docker ps -a`

Para iniciar um container parado:

`docker start *id ou nome do container*`

Para parar um container:

`docker stop *id ou nome do container*`

Para remover um container:

`docker rm *id ou nome do container*`

FONTE
------------------------------------------

* <https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04>
