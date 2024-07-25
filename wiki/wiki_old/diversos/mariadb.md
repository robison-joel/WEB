# MARIADB

## 1 Instalação

1.1 Atualiza os repositórios.

`sudo apt update`

1.2 Instala dependências.

`sudo apt install -y software-properties-common`

1.3 Baixar e inserir a key.

`sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'`

1.4 Adiciona o repositório.

`sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] https://mirrors.bkns.vn/mariadb/repo/10.6/ubuntu focal main'`

1.5 Atualiza os repositórios.

`sudo apt update`



## FONTES:

* <https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-ubuntu-20-04-pt>
