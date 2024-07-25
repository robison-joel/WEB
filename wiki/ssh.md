SSH
=============================================================

[Inicio](index.md) > [Servidores](index.md#Servidores).

O que é?
----------------------------------------------

Acrônimo de *Secure Socket Shell* É um protocolo de rede que permite acesso a um determinado sistema (Server ou PC), via shell.

Qual a função?
----------------------------------------------

O mais difundido e utilizado, no mundo linux, é o [OpenSSH](https://www.openssh.com/). E é sobre ele que vamos direcionar esse howto.

![Logo do OpenSSH](https://www.openssh.com/images/openssh.gif)

-------------------

Instalação
----------------------------------------------

**Antes de instalar, pense nisso:**

> Qual a minha finalidade para o uso do ssh?
O SSH permite conexões ssh entre um "client" e um "server". Se você queira **acessar o seu computador á partir de outro**, deve instalar ambos os pacotes. Caso queira **apenas acessar outro computador**, por motivos de segurança o mais recomendado é instalar somente o pacote "client".

### Terminal

Abra uma sessão no terminal e digite:

#### No Ubuntu e derivados

`sudo apt-get install openssh-client openssh-server`

#### No ArchLinux e derivados

`pacman -S openssh`

Aperte ENTER e insira a sua senha de sudo. Espere a instalação acabar.

### Pós-intalação

Para se certificar que foi instalado e que está rodando corretamente no seu sistema, use um esses dois comandos:

Para verificar o status do serviço SSH:

`service ssh status`  ou `service ssh status | grep Active`

Para iniciar o o servico SSH:

`service ssh start`

Para reiniciar o o servico SSH:

`service ssh restart`

Para parar o o servico SSH:

`service ssh stop`

Instruções para conexão
----------------------------------------------

### Sintaxe:

Basicamente, a conexão ssh é feita, por escrito no shell, respeitando essa sintaxe:

`ssh user@servidor`

Onde:

* user = usuário real e habilitado á fazer login no sistema que está sendo acessado.

* servidor = IP ou dominio do computador que será acessado.

Após o request lhe será solicitado inserir a senha do usuário e...BINGO!

Customização
----------------------------------------------

Para customizar o acesso ssh do seu servidor vocẽ deve editar dois arquivos distintos:

### Edite o arquivo /etc/issue.net

O arquivo ***issue.net*** contém a mensagem que vai aprecer antes do usuário.

`sudo vim /etc/issue.net`

### Edite o arquivo /etc/motd

O arquivo ***/etc/motd***, por sua vez, contém a mensagem que será exibida logo após a autenticação.

`sudo vim /etc/motd`

### Habilítar os banners

Para habilitar os banners criados nos arquivos acima, vocẽ deve habilitá-los no arquivo ***/etc/ssh/sshd_conf***.

No arquivo , procure por uma linha que diz:

>__#Banner__

descomente e insira o nome do arquivo issue ao lado

>__Banner /etc/issue.net__

### Reinicie o serviços

Reinicie o serviço ssh para que as aterações entrem em vigor.

`sudo service ssh restart`

Chaves SSH
---------------------------------

### Criando a chave

Para a conexão com chave, primeiro gere a chave em seu computador.

`ssh-keygen`

Você pode criar a sua chave com a criptografia RSA:

`ssh-keygen -t rsa`

Caso queira identificar o arquivo podes indicar o caminho absoluto para o aqruivo. Por exemplo:

`ssh-keygen /home/usuario/.ssh/arquivo`

Durante a criação da chave será necessário determinar uma frase de acesso. trata-se de uma "frase" de segurança: escolha com sabedoria.

### Obtendo a chave

Copie o conteúdo da sua chave pública, em um notepad ou editor de texto qualquer. Para abtê-lo, utilize o seguinte comando:

`cat /home/usuario/.ssh/arquivo.pub`

#### Enviando a chave

Para enviar a chave para o host que deverá ser acessado, pode-se utilizar dois métodos:

#### Metodo direto

`ssh-copy-id usuario@ip_do_servidor`

`ssh-copy-id -i /home/usuario/.ssh/arquivo.pub usuario@ip_do_servidor`

#### Metodo tradicional

Incluir a sua chave publica no arquivo `/home/usuario/.ssh/authorized_keys`.

Para isso, siga esses passos:

Acesse o servidor em questão via ssh (inicialmnte com a senha), e adicione a sua chave ao arquivo `/home/usuario/.ssh/authorized_keys`:

`sudo echo "*conteúdo do arquivo .pub copiado" >> /home/usuario/.ssh/authorized_keys`

Fontes
----------------------------------------------

* <https://pt.linkedin.com/pulse/mensagem-de-banner-em-servidores-linux-atrav%C3%A9s-do-ssh-marculino>

* <https://www.guiafoca.org/guiaonline/intermediario/ch27s29.html>

* <https://ivanix.wordpress.com/2008/12/04/arquivos-de-inicializacao-do-linux/>

* <https://gnulinuxbr.wordpress.com/2009/07/21/arquivos-etcissue-e-etcmotd/>

* <http://www.linhadecodigo.com.br/artigo/2974/dicas-avancadas-de-seguranca-para-ssh.aspx#ixzz7QaODMw7p>
