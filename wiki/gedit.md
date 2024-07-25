Gedit
=============================

> [Inicio](index.md) > [Inicio](index.md#Programas)

Instalação
-----------------------------

### Ubuntu (Debian e derivados)

`sudo apt install gedit -y`

### Arch e derivados

`pamac -S gedit`

### Fedora e derivados

`sudo dnf install gedit -y`

Plugins
------------------------------

### Markdown

#### Dependências

**Ubuntu**

`sudo apt install python3-markdown pandoc gir1.2-webkit2-4.0 git`

**Fedora**

`sudo dnf install python3-markdown pandoc webkit2gtk3 git # Fedora`

#### Instalação

`sudo git clone https://github.com/maoschanz/gedit-plugin-markdown_preview`

`cd gedit-plugin-markdown_preview`

`./install.sh`

#### Habilitando o plugin

Depois, você deve navegar nas preferências do gedit para habilitar o plugin e estilizar as configurações dele.

> Menu sanduíche > Preferências > Plug-ins > Markdown preview

FONTE
------------------------------

* <https://terminalroot.com.br/2020/03/como-visualizar-markdown-no-gedit.html>
