Docker
===============================================

> [Inicio](index.md) > [Servidores](index.md#Servidores)

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

Em geral o comando para uso do Docker tem a seguinte sintaxe:

`docker [OPTIONS] COMMAND`

Para procurar uma imagem a ser instalada:

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


A self-sufficient runtime for containers

**Common Commands**


* `run`: Create and run a new container from an image
* `exec`: Execute a command in a running container
* `ps`: List containers
* `build`: Build an image from a Dockerfile
* `pull`: Download an image from a registry
* `push`: Upload an image to a registry
* `images`: List images
* `login`: Log in to a registry
* `logout`: Log out from a registry
* `search`: Search Docker Hub for images
* `version`: Show the Docker version information
* `info`: Display system-wide information

**Management Commands**

* `builder`: Manage builds
* `buildx`: Docker Buildx (Docker Inc., v0.10.2)
* `compose`: Docker Compose (Docker Inc., v2.16.0)
* `container`: Manage containers
* `context`: Manage contexts
* `image`: Manage images
* `manifest`: Manage Docker image manifests and manifest lists
* `network`: Manage networks
* `plugin`: Manage plugins
* `scan`: Docker Scan (Docker Inc., v0.23.0)
* `system`: Manage Docker
* `trust`: Manage trust on Docker images
* `volume`: Manage volumes

**Swarm Commands**

* `swarm`: Manage Swarm

Commands

* `attach`: Attach local standard input, output, and error streams to a running container
* `commit`: Create a new image from a container's changes
* `cp`: Copy files/folders between a container and the local filesystem
* `create`: Create a new container
* `diff`: Inspect changes to files or directories on a container's filesystem
* `events`: Get real time events from the server
* `export`: Export a container's filesystem as a tar archive
* `history`: Show the history of an image
* `import`: Import the contents from a tarball to create a filesystem image
* `inspect`: Return low-level information on Docker objects
* `kill`: Kill one or more running containers
* `load`: Load an image from a tar archive or STDIN
* `logs`: Fetch the logs of a container
* `pause`: Pause all processes within one or more containers
* `port`: List port mappings or a specific mapping for the container
* `rename`: Rename a container
* `restart`: Restart one or more containers
* `rm`: Remove one or more containers
* `rmi`: Remove one or more images
* `save`: Save one or more images to a tar archive (streamed to STDOUT by default)
* `start`: Start one or more stopped containers
* `stats`: Display a live stream of container(s) resource usage statistics
* `stop`: Stop one or more running containers
* `tag`: Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
* `top`: Display the running processes of a container
* `unpause`: Unpause all processes within one or more containers
* `update`: Update configuration of one or more containers
* `wait`: Block until one or more containers stop, then print their exit codes

**Global Options**

* `--config string`: Location of client config files (default "/home/robisonjoel/.docker")
* `-c,` ou `--context string`: Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set with "docker context use")
* `-D` ou `--debug`: Enable debug mode
* `-H` ou `--host list`: Daemon socket(s) to connect to
* `-l`, `--log-level string`: Set the logging level ("debug", "info", "warn", "error", "fatal") (default "info")
  * `--tls`: Use TLS; implied by --tlsverify
  * `--tlscacert string`: Trust certs signed only by this CA (default "/home/robisonjoel/.docker/ca.pem")
  * `--tlscert string`: Path to TLS certificate file (default "/home/robisonjoel/.docker/cert.pem")
  * `--tlskey string`: Path to TLS key file (default "/home/robisonjoel/.docker/key.pem")
  * `--tlsverify`: Use TLS and verify the remote
* `-v` ou `--version`: Print version information and quit

Run `docker COMMAND --help' for more information on a command`.

FONTE
-------------------------------------------

* <https://docs.docker.com/go/guides/>
  
* <https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04>
