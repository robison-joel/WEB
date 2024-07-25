Ubuntu
========================================

> [Inicio](index.md) > [Sistemas Operacionais](index.md#SistemasOperacionais)

Usuarios
----------------------------------------------

### Criar usuario

Para criar um usuario no linux.

`sudo useradd nomedousuario`

Parâmtros:

* `-a` - Adiciona o usuario.

* `-m` - Cria o usuario juntamente com o seu diretório padrão em __/home__.

* `-d` - Determina o caminho (absouto) da pasta home de um usuario.
* 

Mudar o diretório padrão.

`sudo useradd -m -d /novo_local nomedousuario`

### Deletar ou remover usuarios

Sintaxe

`sudo delusaer nomedousuario`

Man page do deluser

<pre>
NAME
       userdel - delete a user account and related files

SYNOPSIS
       userdel [options] LOGIN

DESCRIPTION
       userdel is a low level utility for removing users. On Debian, administrators should usually use deluser(8) instead.

       The userdel command modifies the system account files, deleting all entries that refer to the user name LOGIN. The named user must exist.

OPTIONS
       The options which apply to the userdel command are:

       -f, --force
           This option forces the removal of the user account, even if the user is still logged in. It also forces userdel to remove the user's home directory and mail spool, even if another user uses the same home directory or if
           the mail spool is not owned by the specified user. If USERGROUPS_ENAB is defined to yes in /etc/login.defs and if a group exists with the same name as the deleted user, then this group will be removed, even if it is
           still the primary group of another user.

           Note: This option is dangerous and may leave your system in an inconsistent state.

       -h, --help
           Display help message and exit.

       -r, --remove
           Files in the user's home directory will be removed along with the home directory itself and the user's mail spool. Files located in other file systems will have to be searched for and deleted manually.

           The mail spool is defined by the MAIL_DIR variable in the login.defs file.

       -R, --root CHROOT_DIR
           Apply changes in the CHROOT_DIR directory and use the configuration files from the CHROOT_DIR directory.

       -P, --prefix PREFIX_DIR
           Apply changes in the PREFIX_DIR directory and use the configuration files from the PREFIX_DIR directory. This option does not chroot and is intended for preparing a cross-compilation target. Some limitations: NIS and
           LDAP users/groups are not verified. PAM authentication is using the host files. No SELINUX support.

       -Z, --selinux-user
           Remove any SELinux user mapping for the user's login.

CONFIGURATION
       The following configuration variables in /etc/login.defs change the behavior of this tool:

       MAIL_DIR (string)
           The mail spool directory. This is needed to manipulate the mailbox when its corresponding user account is modified or deleted. If not specified, a compile-time default is used.

       MAIL_FILE (string)
           Defines the location of the users mail spool files relatively to their home directory.

       The MAIL_DIR and MAIL_FILE variables are used by useradd, usermod, and userdel to create, move, or delete the user's mail spool.

       MAX_MEMBERS_PER_GROUP (number)
           Maximum members per group entry. When the maximum is reached, a new group entry (line) is started in /etc/group (with the same name, same password, and same GID).

           The default value is 0, meaning that there are no limits in the number of members in a group.

           This feature (split group) permits to limit the length of lines in the group file. This is useful to make sure that lines for NIS groups are not larger than 1024 characters.

           If you need to enforce such limit, you can use 25.

           Note: split groups may not be supported by all tools (even in the Shadow toolsuite). You should not use this variable unless you really need it.

       USERDEL_CMD (string)
           If defined, this command is run when removing a user. It should remove any at/cron/print jobs etc. owned by the user to be removed (passed as the first argument).

           The return code of the script is not taken into account.

           Here is an example script, which removes the user's cron, at and print jobs:

               #! /bin/sh

               # Check for the required argument.
               if [ $# != 1 ]; then
                    echo "Usage: $0 username"
                    exit 1
               fi

               # Remove cron jobs.
               crontab -r -u $1

               # Remove at jobs.
               # Note that it will remove any jobs owned by the same UID,
               # even if it was shared by a different username.
               AT_SPOOL_DIR=/var/spool/cron/atjobs
               find $AT_SPOOL_DIR -name "[^.]*" -type f -user $1 -delete \;

               # Remove print jobs.
               lprm $1

               # All done.
               exit 0

       USERGROUPS_ENAB (boolean)
           If set to yes, userdel will remove the user's group if it contains no more members, and useradd will create by default a group with the name of the user.

FILES
       /etc/group
           Group account information.

       /etc/login.defs
           Shadow password suite configuration.

       /etc/passwd
           User account information.

       /etc/shadow
           Secure user account information.

       /etc/subgid
           Per user subordinate group IDs.

       /etc/subuid
           Per user subordinate user IDs.

EXIT VALUES
       The userdel command exits with the following values:

       0
           success

       1
           can't update password file

       2
           invalid command syntax

       6
           specified user doesn't exist

       8
           user currently logged in

       10
           can't update group file

       12
           can't remove home directory

CAVEATS
       userdel will not allow you to remove an account if there are running processes which belong to this account. In that case, you may have to kill those processes or lock the user's password or account and remove the account
       later. The -f option can force the deletion of this account.

       You should manually check all file systems to ensure that no files remain owned by this user.

       You may not remove any NIS attributes on a NIS client. This must be performed on the NIS server.

       If USERGROUPS_ENAB is defined to yes in /etc/login.defs, userdel will delete the group with the same name as the user. To avoid inconsistencies in the passwd and group databases, userdel will check that this group is not
       used as a primary group for another user, and will just warn without deleting the group otherwise. The -f option can force the deletion of this group.

SEE ALSO
       chfn(1), chsh(1), passwd(1), login.defs(5), gpasswd(8), groupadd(8), groupdel(8), groupmod(8), subgid(5), subuid(5), useradd(8), usermod(8).
</pre>

Senhas
--------------------------------------

### Senhas

Atribuir ou trocar a senha de um usuario.

`sudo passwd nomedousuario senha`

### Recuperação de senha

Caso você esqueça a senha do seu linux, você pode resetar a senha do seu usuario.

Ligue o computador e aguarde aparecer o menu do gerenciador de boot GRUB;

> Se o menu do GRUB não aparecer, experimente pressionar e segurar a tecla `Shift` depois que apertar o botão “Power” para ligar o computador. Teclas como F8, F3 e F10 também podem te ajudar;

No menu do GRUB, use as teclas de direção e vá até a opção “Advanced Options for Ubuntu” ou “Opções avançadas para Ubuntu” e então tecle **enter**;

Na tela que será exibida, selecione uma das opções de boot que possui **“recovery mode”** no final do nome e tecle **enter**;

Quando aparecer a tela do **"Menu de recuperação"**, use as teclas de direção e vá até a opção `root- Drop to root shell prompt` ou `root- Desistir e ir para terminal em modo root` e pressione **enter**. Com isso, você verá o prompt de comando no final da tela.

Aperte Ctrl + l para limpar a tela.

Digite o comando a seguir e tecle **enter**, para montar o sistema de arquivos com permissão de leitura e escrita;

`mount -o rw,remount/`

Para alterar a senha do usuário, use o comando `passwd NOME_USUARIO` (substituindo NOME_USUARIO pelo seu nome de usuário). Será solicitado inserir a nova senha, digite-a e tecle **enter**.

> Caso você não se lembre do nome de usuário, para descobrir, digite o comando `ls /home` e tecle **enter**:

Depois confirme essa senha, digitando-a novamente e teclando **enter**. No final, será exibida a mensagem `passwd: password updated successfully` ou `passwd: senha atualizada com sucesso`, confirmando que a senha de usuário foi redefinida com êxito;

Por fim, execute o comando exit para voltar ao “Menu de recuperação” e nele, selecione e tecle **enter** na opção “resume Resume normal boot” ou “resume Continuar inicialização normal”, para sair do modo de recuperação.

Grupos
---------------------------------------

Criar um grupo

`sudo addgroup nomedogrupo`

Incluir um usuario em um grupo.

`sudo adduser nomedousuario nomedogrupo`

Excluir usuario no grupo.

`deluser nomedousuario nomedogrupo`

Incluir usuario no grupo sudo (deve ser executado como root).

`usermod -a -G sudo nomedousuario`

Excluir um grupo

`groupdel nomedogrupo`

Permissões
------------------------------------------------------

Para saber os parâmetros de permissões de um arquivo ou diretório devemos devemos utilizar o comando:

`ls -la`

Abaixo um exemplo de saída do comando `la -la`. A primeira coluna mostra as permissões de acesso dos subdiretórios e arquivos

As informacoes de permissões aparecerão no inicio da linha como no exemplo a seguir:

<pre>
usuario@userver:~$ ls -la
total 32
drwxr-xr-x 4 usuario grupo 4096 Jan 22 18:00 .
drwxr-xr-x 3 root root 4096 Jul 11  2022 ..
-rw------- 1 usuario grupo  112 Jan 17 23:11 .bash_history
-rw-r--r-- 1 usuario grupo  220 Feb 25  2020 .bash_logout
-rw-r--r-- 1 usuario grupo 3771 Feb 25  2020 .bashrc
drwx------ 2 usuario grupo 4096 Jul 11  2022 .cache
-rw-r--r-- 1 usuario grupo  807 Feb 25  2020 .profile
drwx------ 2 usuario grupo 4096 Jul 11  2022 .ssh
-rw-r--r-- 1 usuario grupo    0 Jul 11  2022 .sudo_as_admin_successful
</pre>

O primeiro caractere diz qual é o tipo do objeto:

* – para arquivo comum;
* b para dispositivos de bloco (oferecem grandes quantidades de dados de cada vez).
* c para dispositivo de caracteres (oferecem dados de um caractere de cada vez);
* d para diretório;
* l para link simbólico;
* p para FIFO ou Named Pipe;
* s para socket mapeado em arquivo;

### Permissões de usuários

Os três caracteres seguintes mostram as permissões do dono (permissão de leitura e escrita).

### Permissões para grupos

O quinto, o sexto e o sétimo caracteres dizem quais as permissões do grupo (permissão de leitura e escrita).
Os três últimos caracteres especificam as permissões dos outros (permissão de leitura).

### Permissões para outros

Por sua vez, os últimos três caracteres (8º, 9º e 10º) são os que determinam as permissões para outros (que não são o usuário dono e o grupo corespondente.)

NTFS no Linux
-------------------------------------------

Para abrir, montar e visualizar partições NTFS no linux devemos instalar o Driver **ntfs-3g**.

Instalação

`sudo apt install ntfs-3g -y`

Apagar pastas vazias
----------------------------------------------------------------

Para apagar as pasta vazias de um diretório.

Primeiro podemos lisar os diretórios vazios

`find -type d -empty -print`

E com o seguinte comando podemos então apagar todas às pastas que se encontram vazias:

`find -type d -empty -delete`

Colocar o Ubuntu no dominio
-----------------------------------

> Nesse tutorial, utilizaremos o domínio `dominio.local` como exemplo, o editor `vim` e um user chamado `usuario` com direitos de  e o IP do servidor `192.168.168.10.10`
> instalar o vim: `apt install vim -y`
> Para conceder direitos de root ao usuario: `adduser usuario root` e `usermod -G $USER root`

Agora iremos configurar o FQDN

`vim /etc/hosts`

<pre>
127.0.0.1       localhost localhost
192.168.10.10   servidor servidor.dominio.local
</pre>

Vamos instalar os pacotes necessários.

`apt-get install samba -y`

`apt-get install smbclient -y`

`apt-get install cifs-utils -y`

`apt-get install winbind -y`

`apt-get install libpam-mount -y`

`apt-get install ntp -y`

`apt-get install ntpdate  -y`

`apt-get install libnss-winbind  -y`

`apt-get install libpam-winbind  -y`

`apt-get install krb5-kdc -y`

Após o final da instalação, faça o download do CID neste [link](https://sourceforge.net/projects/c-i-d/)

Drivers Nvidia no Ubuntu
--------------------------------------

### Atualize os programas e o sistema

`sudo apt update && sudo apt upgrade`

### Identifique qual é a sua placa vídeo e qual o driver recomendado

`ubuntu-drivers devices | grep "recommended" | awk '{print $3}'`

o comando acima vai retornar qual a versão do driver recomendado para o seu componente.

### Instale o driver recomendado

`sudo apt install nvidia-driver-'driverrecomendado'`

Ubuntu extras
--------------------------------------------------------

Extras para desktops ubuntu

### Instalação

#### Atualiza

`sudo apt update`

#### Instala

`sudo apt install ubuntu-restricted-addons -y`

`sudo apt install ubuntu-restricted-extras -y`

#### Atualiza

`sudo apt update ; apt list --upgradable ; sudo apt upgrade -y`

Manutenção Linux
---------------------------------------------------

### Temperatura do CPU

Para a verificação da temperatura da CPU e seus núcleos utilizamos a ferramenta "lm-sensors".

Instalação

`sudo apt install lm-sensors`

Utilização

O comando abaixo faz uma varredura de todos os sensores que o seu computador ou servidor possuem.

`sudo sensors-detect`

Após a varredura, exibimos os valores na tela do terminal

`sensors`

O comando abaixo mostra os índices em tempo real.

`watch sensors`

### Temperatura do HD

Para a verificação da temperatura do HD, devemos utilizar o recurso hddtemp.

Instalação.

`apt install hddtemp`

Uso

Para usá-lo é preciso saber o nome do disco que você vai monitorar, usando o comando abaixo:

`lsblk`

A saída do comando será similar a essa:

<pre>
NAME                     MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                        8:0    0 21,9T  0 disk
├─sda1                     8:1    0  512M  0 part /boot/efi
├─sda2                     8:2    0  732M  0 part /boot
└─sda3                     8:3    0 21,8T  0 part
  ├─srvmaster--vg-root   252:0    0 21,8T  0 lvm  /
  └─srvmaster--vg-swap_1 252:1    0  976M  0 lvm  [SWAP]
sr0                       11:0    1 1024M  0 rom  
</pre>

Agora que você já sabe qual disco, execute o comando com o caminho do mesmo.

`hddtemp /dev/xxx`

Troubleshooting
----------------

### Erro de Chave Pública GPG

Ao rodar um `sudo apt update` no terminal apresenta-se um erro "As assinaturas a seguir não puderam ser verificadas devido à chave pública não estar disponível: NO_PUBKEY XXXXXXXXXXXXXXXX".

No exemplo abaixo, estou postando o erro que aconteceu na desinstalação do navegador Brave.

<pre>
user@suporte:~$ sudo apt update
Atingido:1 https://linux.teamviewer.com/deb stable InRelease
Obter:2 https://brave-browser-apt-release.s3.brave.com stable InRelease [7.546B]
Obter:3 https://download.docker.com/linux/ubuntu bionic InRelease [64,4 kB]
Err:2 https://brave-browser-apt-release.s3.brave.com stable InRelease
  As assinaturas a seguir não puderam ser verificadas devido à chave pública não estar disponível: NO_PUBKEY XXXXXXXXXXXXXXXX
Atingido:4 http://archive.ubuntu.com/ubuntu jammy InRelease
Obter:5 https://packages.microsoft.com/repos/ms-teams stable InRelease [5.931 B]
Atingido:6 http://archive.ubuntu.com/ubuntu jammy-updates InRelease
Atingido:7 https://esm.ubuntu.com/apps/ubuntu jammy-apps-security InRelease
Atingido:8 https://esm.ubuntu.com/apps/ubuntu jammy-apps-updates InRelease
Obter:9 http://archive.ubuntu.com/ubuntu jammy-backports InRelease [109 kB]
Atingido:10 https://ppa.launchpadcontent.net/audio-recorder/ppa/ubuntu jammy InRelease
Atingido:11 https://esm.ubuntu.com/infra/ubuntu jammy-infra-security InRelease
Atingido:12 https://esm.ubuntu.com/infra/ubuntu jammy-infra-updates InRelease
Atingido:13 http://archive.ubuntu.com/ubuntu jammy-security InRelease
Atingido:14 https://ppa.launchpadcontent.net/danielrichter2007/grub-customizer/ubuntu jammy InRelease
Atingido:15 https://ppa.launchpadcontent.net/elboulangero/goodvibes/ubuntu jammy InRelease
Baixados 187 kB em 3s (62,2 kB/s)
Lendo listas de pacotes... Pronto
Construindo árvore de dependências... Pronto
Lendo informação de estado... Pronto
4 pacotes podem ser atualizados. Corra 'apt list --upgradable' para vê-los.
W: An error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: https://brave-browser-apt-release.s3.brave.com stable InRelease: As assinaturas a seguir não puderam ser verificadas devido à chave pública não estar disponível: NO_PUBKEY XXXXXXXXXXXXXXXX
W: Falhou ao buscar https://brave-browser-apt-release.s3.brave.com/dists/stable/InRelease  As assinaturas a seguir não puderam ser verificadas devido à chave pública não estar disponível: NO_PUBKEY XXXXXXXXXXXXXXXX
W: Falhou o download de alguns ficheiros de índice. Foram ignorados ou os antigos foram usados em seu lugar.
</pre>

#### Solução 1

Em primeira instância, você pode tentar simplesmente reinstalar a chave com o comando abaixo, substituindo o "XXXXXXXXXXXXXXXX" pela chave que está no erro acima (sem aspas).

`sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys XXXXXXXXXXXXXXXX`

#### Solução 2

Rode o apt purge para o programa

`sudo apt purge brave`

Remova o repositório

`sudo rm -r /etc/apt/sources.list.d/brave-browser-release.list`

limpe o cache do apt

`sudo apt clean`

Para validar a solução, rode o update e repare se o erro persiste.

`sudo apt update`

### Falha na Interface Gráfica

#### Problema

Iniciar, reiniciar e desligar o modo gráfico através do terminal (Gnome)

> Dica para ambientes Gnome.

Existe momentos que a interface gráfica do Linux, por algum motivo "estranho", pode travar ou então você deseja que a mesma seja reiniciada. Uma maneira de fazer isso é:

Abra o terminal e vá até o diretório "/etc/init.d":

`cd /etc/init.d`

Neste diretório tem um arquivo que se chama "gdm", é com esse arquivo que vamos manipular a interface gráfica.

No nosso caso vamos reiniciar a interface. Para isso é basta usar o seguinte comando:

`sudo service gdm restart`

Com isso a interface gráfica será reiniciada.

#### Conteúdo adicional

Parar a interface gráfica:

`sudo service gdm stop`

Iniciar:

`sudo service gdm start`

Reiniciar:

`sudo service gdm restart`

### Iniciar em modo terminal

Como configurar o linux para iniciar diretamente em modo texto, diminuindo a energia, maximizando o desempenho da máquina.

Abra um terminal (Usando o Dash ou pressionando as teclas CTRL+ALT+T);

Copie e cole o comando abaixo no terminal e aperte enter:

`sudo gedit /etc/default/grub`

Edite o arquivo de configuração, fazendo as seguintes mudanças:

Comente a linha GRUB_CMDLINE_LINUX_DEFAULT=”quiet splash”, adicionando # no início. Isso irá desativar a tela colorida do Ubuntu;

Mude GRUB_CMDLINE_LINUX=”” para GRUB_CMDLINE_LINUX=”text”. Isso fará com que o Ubuntu inicialize diretamente em modo de texto;

Descomente essa linha #GRUB_TERMINAL=console, removendo o # no início. Isso faz com que o menu do GRUB fique em modo de texto (tela preto e branco, sem imagem de fundo)

Salve e feche o arquivo;

Atualize o Grub com o comando abaixo:

`sudo update-grub`

Para ver o resultado, reinicie o computador.

Fonte
-------------------------------------------------

* <https://www.linuxnaweb.com/ingressando-ubuntu-no-dominio/>

* <https://br.ccm.net/faq/15768-linux-ver-a-temperatura-do-cpu>

* <https://www.youtube.com/watch?v=ygwbi7gJCh0>

* <https://dicasrapidas.com.br/dicas-linux/como-saber-a-temperatura-do-hd-no-linux.html>

* <https://community.brave.com/t/how-to-remove-brave-from-apt-get/143302>

* <https://elias.praciano.com/2015/01/como-montar-particao-ntfs-ou-vfat-no-linux/>

* <http://maguscode.blogspot.com>

* <https://canaltech.com.br/linux/entendendo-e-configurando-permissoes-de-arquivos-e-pastas-no-linux/>

* <https://guialinux.uniriotec.br/permissao-de-acesso/>
