# PREPARA&Ccedil;&Atilde;O DO APPLIANCE

LOCALIDADE             | Senha            | Respons&aacute;vel
:----------------------|:----------------:|:----------
Alvorada               | Allvor4d4*2k22   | Flavio Porto
Chapada                | X4p4d4*2k22      | Paulo Lobato
Itacoatiara            | It4c04t14r4*2k22 | Jailson Berger
Japiim                 | J4p11m*2k22      | Marcio Mendon&ccedil;a
Manacapuru             | M4n4kpuru*2k22   | Taffarel
Maues                  | M4u35*2k22       | Emerson Maia
Pra&ccedil;a14         | Pr4c414*2k22     | Hudson Lucas
S&atilde;o Jos&eacute; | S40j053*2k22     | Otacilio Neto
JCB                    | dlZE4oIR5sus     | Ribamar

### PR&Eacute; INSTALA&Ccedil;&Atilde;O

> Antes de tudo, Certifique-se de ter em m&atilde;os um __pendrive boot&aacute;vel contendo uma imagem da versão correspondente__ do pfsense. Assegure-se tamb&eacute;m de como acessar a BIOS e o menu de boot. Tenha em m&atilde;os tamb&eacute;m, a documenta&ccedil;&atilde;o que contenha as informa&ccedil;&otilde;es específicas deste Firewall e/ou um arquivo XML editado previamente para o restore.

### 1 - Instala&ccedil;&atilde;o

Normalmente o appliance j&aacute; vir&aacute; com algum S.O. pr&eacute;-instalado. Ent&atilde;o, acesse a BIOS do aparelho para configurar o boot no pendrive que contem a instala&ccedil;&atilde;o do pfsense.

### 2 - Editar o XML 

* Nome da m&aacute;quina,  

* Atribui&ccedil;&atilde;o das Interfaces

* Trocar o IP da LAN pelo da localidade,

* Range DHCP, na interface LAN. 

* Endere&ccedil;o d aplliance 

* zabbix

* Regras e Alias

* Pacotes Instalados

* IPSEC's e VLAN's

### 3 - Zabbix agente e Proxy

### 4 - Imagem

### 5 - Senha

### 6 - Conferir DHCP (lan)

### 7 - Comandos 



Acessar o firewall pelo ssh e rode esses comandos em sequência (lembrando da porta correta).

> fetch https://www.4trust.com.br/scripts/4trust_vpn.sh
> fetch https://www.4trust.com.br/scripts/4trust_links.sh
> mv 4trust_vpn.sh /usr/bin/
> mv 4trust_links.sh /usr/bin/
> chmod 777 /usr/bin/4trust_vpn.sh
> chmod 777 /usr/bin/4trust_links.sh
> fetch https://www.4trust.com.br/packages/zabbix/ipsec-firewall/scripts/check_ipsec.sh
> fetch https://www.4trust.com.br/packages/zabbix/ipsec-firewall/scripts/check_ipsec_traffic.sh
> fetch https://www.4trust.com.br/packages/zabbix/ipsec-firewall/scripts/zabbix-ipsec.py
> fetch https://www.4trust.com.br/packages/zabbix/ipsec-firewall/zabbix_sudoers
> mkdir /usr/local/etc/sudoers.d
> mv zabbix_sudoers /usr/local/etc/sudoers.d/
> mv check_ipsec.sh /usr/local/bin/
> mv check_ipsec_traffic.sh /usr/local/bin/
> mv zabbix-ipsec.py /usr/local/bin/
> chmod +x /usr/local/bin/zabbix-ipsec.py
> chmod +x /usr/local/bin/check_ipsec.sh
> chmod +x /usr/local/bin/check_ipsec_traffic.sh
> fetch https://www.4trust.com.br/packages/zabbix/servicos.sh
> mv servicos.sh /usr/local/bin
> chmod +x /usr/local/bin/servicos.sh


### Configuração do Zabbix

Na interface web do pfsense, acesse no menu do cabeçalho _Servi&ccedil;os_ > _Zabbix Agente_. Navegue na p&aacute;gina at&eacute; o seu fim, clicando do bot&atilde;o verde com a descrição _Avan&ccedil;ado_. Isto abrirá uma caixa de texto ao qual deverá ser inserido os par&acirc;metros abaixo:

> UserParameter=4trust.vpn[*],/usr/bin/4trust_vpn.sh $1 $230
> UserParameter=4trust.links[*],/usr/bin/4trust_links.sh $1 $2 $3
> UserParameter=ipsec.discover,/usr/local/bin/python3.8 /usr/local/bin/zabbix-ipsec.py
> UserParameter=ipsec.tunnel[*],/usr/local/bin/sudo /usr/local/bin/check_ipsec.sh $1
> UserParameter=ipsec.traffic[*],/usr/local/bin/sudo /usr/local/bin/check_ipsec_traffic.sh $1 $2
> UserParameter=servicos.status[*],/usr/local/bin/servicos.sh $1
> UserParameter=icmp[*],fping -t 300 $1 | grep alive | wc -l

