Mediawiki
======================================

> [Início](index.md) > [Servidores](index.md#Servidores)

Ascenda a superusuario

`sudo su`

Instalando o vim

`apt install -y vim`

Consulte o IP

`ip a | grep -i inet | grep -v inet6`

Teste de conectividade

`ping 8.8.8.8`

`ping google.com.br`

Atualize

`apt upgrade ; apt full-upgrade ; apt dist-upgrade ; apt autoremove ; apt autoclean ; apt clean`

Hostname da máquina

`echo "wiki.rjgs.net" | tee /etc/hostname`

Conferindo a mudança no Hostname da máquina:

`cat /etc/hostname`

Alterando o arquivo de hosts

`vim /etc/hosts`

Setando IP fixo
----------------------------------------

Cópia de segurança do arquivo netplan.

`cp -rv /etc/netplan/00-installer-config.yaml /etc/netplan/00-installer-config.yaml.bckp`

Aplica a configuração.

`netplan --debug try`

Apache
--------------------------------------------------------

`apt install -y apache2`

`apt install -y apache2-data`

`apt install -y apache2-doc`

`apt install -y apache2-utils`

Setando permissões na pasta

`chmod -R 775 /var/www/html`

`mkdir /var/www/html/wiki/`

Adicionando o usuario atual no grupo de execução do apache

`adduser rjgs www-data`



Status do servidor

Status do servidor

`systemctl status apache2`

Inicia o servidor

`systemctl start apache2`

Reinicia o servidor

`systemctl restart apache2`

PHP
---------------------------------------------------

`apt install -y php`

`apt install -y libapache2-mod-php`

`apt install -y php8.0-intl`

`apt install -y php-intl`

`apt install -y php-mbstring`

`apt install -y php-xml`

`apt install -y php-apcu`

`apt install -y php-curl`

`apt install -y php-mysql`

`apt install -y php-cli`

Conferindo a Instalação
`echo "<?php phpinfo(); ?>" > /var/www/html/wiki/php_info.php`

> após o comando acima, abra a página no navegador e confira os módulos instalados.

Restartar o apache
`systemctl restart apache2`

MariaDB
------------------------------------------------------

### Instalação

`apt install -y mariadb-server`

### Para operar o daemom

Status do servidor

`systemctl status mariadb`

Inicia o servidor

`systemctl start mariadb`

Reinicia o servidor

`systemctl restart mariadb`

### Coonfiguração MARIADB

Cria a Base de dados

`mysql -u root -p -e "CREATE DATABASE my_wiki";`

Mostra a tabela criada

`mysql -u root -p -e "SHOW DATABASES";`

Cria o usuario

`mysql -u root -p -e "CREATE USER 'wikiuser'@'localhost' IDENTIFIED BY 'R0b150n#J03l'";`

Mostra os usuarios

`mysql -u root -p -e "select user,host,host from mysql.user";`

Seta permissões para o usuario

`mysql -u root -p -e "GRANT ALL PRIVILEGES ON my_wiki.* TO 'wikiuser'@'localhost' WITH GRANT OPTION";`

Reescreve os privilégios

`mysql -u root -p -e "FLUSH PRIVILEGES";`
