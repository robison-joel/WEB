MDWiki
==========

> [Inicio](index.md) > [Servidores](index.md#Servidores)

Instruções com passo-a-passo para a implantação da wikipédia em Markdown.

Requeriments
--------------------------------------

* Ubuntu 18.04 (ou superior), CentOS 7 (ou superior).
* Apache Server.
* 1GB RAM.
* 1 Core.
* 20GB em disco.
* Conexão com a internet.
* Suporte a Javascript

Criar a pasta
--------------------------------------

Crie a pasta que vai receber os arquivos

`sudo mkdir /var/www/html/wiki`

Concede permissões á esta pasta

`sudo chmod 777 /var/www/html/wiki`

Baixar arquivos
--------------------------------------

Entrar na pasta e baixar os arquivos do mdwiki:

`cd pastamd`

Baixa o arquivo:

`wget https://github.com/Dynalon/mdwiki/releases/download/0.6.2/mdwiki-0.6.2.zip`

mdwiki.html
--------------------------------------

Renomeie __"mdwiki.html"__ como __"index.html"__.

`sudo mv mdwiki.html index.html`

Editar index.html
--------------------------------------

O conteúdo do arquivo __index.html__ é o layout da página inicial. Nele existe uma "div" identificada por __id="md-all"__, no pé da página. Nela será exibido o conteúdo da página que será consultada.

Abaixo uma amostra de como a div vai estar em seu código

<pre>

<td>

    <div id="md-all">

    </div>

</td>

</pre>

criar index.md
--------------------------------------

Arquivo que se apresenta na div __id="md-all"__ inicialmente.

Fontes
--------------------------------

* <http://dynalon.github.io/mdwiki/#!index.md>
