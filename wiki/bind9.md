Bind 9
=============================================================

> [Início](index.md) > [Servidores](index.md#Servidores)

Instalação
-------------------------------------------------------------

Verifique o status do firewall do sistema.

`sudo ufw status`

Caso ele esteja ativo, permita o serviço.

`sudo ufw allow Bind9`

Atualize

`sudo apt update`

`apt list --upgradable`

`sudo apt upgrade`

Instale os pacotes á seguir

`apt install bind9 -y`

`apt install bind9utils -y`

`apt install bind9-doc -y`

`apt install dnsutils -y`

Configuração
-------------------------------------------------------------

Arquivos de configuração em /etc/bind

named.conf.options

`/etc/bind/named.conf.options`

Edição

`sudo vim /etc/bind/named.conf.options`

A diretiva "listen-on" permite especificar as redes que o DNS servidor servirá. Não escreva isso ou escreva "Any"; funcionar para todos os endereços.

<pre>
listen-on {

10.10.10.0/24;

10.1.0.0/16;

...

};
</pre>

Os encaminhadores contêm os endereços IP de DNS servidores para os quais a solicitação é redirecionada se nosso servidor não contiver os dados necessários.

<pre>

forwarders {

8.8.8.8;

8.8.4.4;

};
</pre>

__named.conf__

`sudo vim /etc/bind/named.conf`

__named.conf.local__

`sudo vim /etc/bind/named.conf.local`

<pre>

zone "grayguide.local" IN { // Domain name
type master; // Primary DNS
file "/etc/bind/forward.grayguide.local.db"; // Forward lookup file
allow-update { none; }; // Since this is the primary DNS, it should be none.
}

zone "grayguide.local" IN { // Domain name
type master; // Primary DNS
file "/etc/bind/forward.grayguide.local.db"; // Forward lookup file
allow-update { none; }; // Since this is the primary DNS, it should be none.
}
</pre>

Verifique a configuração:

`sudo named-checkconf`

> Se nenhum erro aparecer, então tudo está em ordem. Reinicie o serviço para que as alterações tenham efeito.

`sudo systemctl restart bind9`

#### Operação do daemon

Inicia

`sudo systemctl start bind9`

Status

`sudo systemctl status bind9`

Parar

`sudo systemctl stop bind9`

Fonte
---------------------------------------------------------------------

* <https://www.digitalocean.com/community/tutorials/how-to-configure-bind-as-a-private-network-dns-server-on-ubuntu-18-04-pt>

* <https://serverspace.io/pt/support/help/configure-bind9-dns-server-on-ubuntu/>
