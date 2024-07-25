NextCloud Server
===================================

> [Início](index.md) > [Sevidores](index.md#Servidores)

Instalação
------------------

Atualiza:

`sudo apt update`

`apt list --upgradable`

`sudo apt upgrade -y`

Instalando o Vim

`sudo apt install vim -y`

Instalando o zip e unzip

`sudo apt install zip unzip -y`

Trocando o HOSTNAME do Server.

`echo "nextcloud" | tee /etc/hostname`

Instalando os pacotes necessários.

`sudo apt install apache2 -y`

`sudo apt install mariadb-server -y`

`sudo apt install libapache2-mod-php7.4 -y`

`sudo apt install php7.4-gd -y`

`sudo apt install php7.4-mysql -y`

`sudo apt install php7.4-curl -y`

`sudo apt install php7.4-mbstring -y`

`sudo apt install php7.4-intl -y`

`sudo apt install php7.4-gmp -y`

`sudo apt install php7.4-bcmath -y`

`sudo apt install php-imagick -y`

`sudo apt install php7.4-xml -y`

`sudo apt install php7.4-zip -y`

Operação do Daemon

`sudo systemctl status apache2`

`sudo systemctl restart apache2`

`sudo systemctl start apache2`

`sudo systemctl stop apache2`

Banco de Dados
-----------------------------

`sudo /etc/init.d/mysql start`

`sudo mysql -uroot -p`

`CREATE USER 'rjgs'@'localhost' IDENTIFIED BY 'R0b150nJ03l';`

`CREATE DATABASE IF NOT EXISTS nextcloud CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;`

`GRANT ALL PRIVILEGES ON nextcloud.* TO 'rjgs'@'localhost';`

`FLUSH PRIVILEGES;`

`quit;`

Download
-------------------------------------------

`sudo mkdir .nextcloud/`

`cd .nextcloud/`

`sudo wget https://download.nextcloud.com/server/releases/latest.zip`

`unzip latest.zip`

`sudo cp -vur nextcloud /var/www`

`sudo chown -R www-data:www-data /var/www/html/nextcloud/config/`

`sudo chmod -R 770 /var/www/html/nextcloud/config/`

`sudo chown -R www-data:www-data nextcloud/`

`sudo chmod -R 775 nextcloud/`

Fonte
------------------------------

* <https://docs.nextcloud.com/server/23/admin_manual/installation/example_ubuntu.html>

* <https://help.nextcloud.com/t/this-problem-is-usually-solved-by-giving-the-web-server-write-access-to-the-config-directory/26322>

