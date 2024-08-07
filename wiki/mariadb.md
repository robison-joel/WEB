MARIADB
=====================================

Instalação
------------------------------

Atualiza os repositórios.

`sudo apt update`

Instala dependências.

`sudo apt install -y software-properties-common`

Atualiza os repositórios.

`sudo apt update`

Instalação

`sudo apt install mariadb-server -y`

Verifique se o serviço está ativo:

`/etc/init.d/mysql status`

Caso a resposta seja negativa

`/etc/init.d/mysql start`

Configuração inicial
------------------------------

`sudo mysql_secure_installation`

Nesta tela pode apertar `ENTER` ou colocar a senha root do banco de dados.

<pre>
Output
NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

In order to log into MariaDB to secure it, we'll need the current
password for the root user.  If you've just installed MariaDB, and
you haven't set the root password yet, the password will be blank,
so you should just press enter here.

Enter current password for root (enter for none):
</pre>

Caso você coloque a senha de root correta:

> OK, successfully used password, moving on...

Senha de root.

Aqui vai ser perguntado se você quer trocar a senha de root. Caso não tenha definido uma ainda, este é o momento:

<pre>
Setting the root password ensures that nobody can log into the MariaDB
root user without the proper authorisation.

You already have a root password set, so you can safely answer 'n'.

Change the root password? [Y/n] 

</pre>

Usuario anônimo.

Aqui você vai responder se quer excluir o usuário anônimo (criado por padrão no inicio da instalação). No âmbito da segurança da informação é interessante excluir usuários assim.

<pre>
By default, a MariaDB installation has an anonymous user, allowing anyone
to log into MariaDB without having to have a user account created for
them.  This is intended only for testing, and to make the installation
go a bit smoother.  You should remove them before moving into a
production environment.

Remove anonymous users? [Y/n] y
</pre>

Login remoto

Aqui você vai optar por desativar o acesso remoto ao banco de dados. Mais uma vez, aconselha-se a manter desativado este recurso.

<pre>
Normally, root should only be allowed to connect from 'localhost'.  This
ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n] n
</pre>

Banco de teste.

Aqui o instalador dá a opção de apagar o **Banco de Dados de teste**, criado no inicio da instalação.

<pre>
By default, MariaDB comes with a database named 'test' that anyone can
access.  This is also intended only for testing, and should be removed
before moving into a production environment.

Remove test database and access to it? [Y/n] 
</pre>

Privilégios

Aqui você escolhe se vai reescrever a tabela de privilégios e permissões de usuários e dados.

<pre>
Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n]
</pre>

Final

Caso tudo tenha corrido bem, você verá esta tela ao final.

<pre>
All done!  If you've completed all of the above steps, your MariaDB
installation should now be secure.

Thanks for using MariaDB!
</pre>

Testando o mariaDB.

`sudo systemctl status mariadb`

Caso a resposta seja negativa

`sudo systemctl start mariadb`

Para saber a versão do server.

`sudo mysqladmin version`

FONTES
---------------------------------------------

* <https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-ubuntu-20-04-pt>
