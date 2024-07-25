Debian
============================================

> [Inicio](index.md) > [Linux](index.md#linux)

Comandos
-------------------------------------------------------------

Desligar

`systemctl poweroff`

Reiniciar

`systemctl reboot`

Habilitar o "sudo"
----------------------------

Por questão de segurança o usuario do debian somente o root tem direitos de *superusuario*.
Para que outros usuarios tenham a capacidade de executar comandos como superusuario, utilizando o prefixo `sudo` devemos habilitar essa funcionalidade, como descrito abaixo.

### Instalação

ascenda a root

`su`

Após colocar a senha, aperte enter.

Instale o pacote sudo:

`apt install sudo -y`

### Configuração

Durante a insatalação do pacote, será criado o arquivo /etc/sudoers. Vamos editá-lo:

`vim /etc/sudoers`

Nele, procure a expressão

> root    ALL=(ALL:ALL) ALL.

Abaixo dela acrescente o seu registro, conforme o seu usuario (não root), respeitando a sintaxe do registro de root.

<pre>
root    ALL=(ALL:ALL) ALL
usuario ALL=(ALL:ALL) ALL
</pre>

Salve e feche o arquivo.

Á partir de agora, o "usuario" terá a possibilidade de usar o "sudo" para executar tarefas administrativas.

Fonte
-----------------------------------------

* <https://www.edivaldobrito.com.br/como-ativar-o-sudo-no-debian/>