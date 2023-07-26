WINDOWS 10
-------------------------------------------

## GPEDIT

Instalar e ativar o gpedit.msc no Windows 10 e Windows 11.

As versões posteriores ao Windows 8 não contam com o Editor de Política de Grupo Local (gpedit) ativado por padrão. Abaixo o procedimento para ativá-lo no Windows 10 e Windows 11.

Abra o CMD:

* Método 1: Clique no menu iniciar > pesquisar. Na caixa de pesquisa  escreva "cmd.exe" e aperte enter.
* Método 2: Aperte a `Tecla do Windows` + `r` para abrir o pop-up do Executar. Escreva cmd.exe e aperte o enter.

Vai abrir a janela do command.exe ou cmd. Nela escreva o comando abaixo.

> Sim. É possível copiar e colar. Mas não seria mais interessante escrevê-lo?

`FOR %F IN ("%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~*.mum") DO (DISM /Online /NoRestart /Add-Package:"%F")`

Aguarde até aparecer a mensagem “A operação foi concluída com êxito.”

Agora digite o comando abaixo e aperte enter:

`FOR %F IN ("%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~*.mum") DO (DISM /Online /NoRestart /Add-Package:"%F")`

Aguarde a confirmação de instalação com exito.

Para abrir o gpedit escreva `gpedit.msc` no cmd ou no pop-up do Executar.

## Instalar o RDP no Windows 10 Home e Single Language

1. Crie a pasta **RDP Wrapper** onde serão descompactados os arquivos baixados. Posteriormente ela será movida para `C:\Arquivos de programas` (ou C:\\Program Files) pois o programa somente será executado da forma correta neste local.

> Será necessário efetuar ajustes nas excessões no Windows Defender para evitar que os arquivos sejam excluídos.

2. Baixe os arquivos [RDPWrap-v1.6.2.zip](https://github.com/stascorp/rdpwrap/releases/download/v1.6.2/RDPWrap-v1.6.2.zip) e  [autoupdate.zip](https://raw.githubusercontent.com/asmtron/rdpwrap/master/autoupdate.zip) extraindo-os na pasta **RDP Wrapper**.
3. Com os arquivos todos extraídos na pasta “**RDP Wrapper**” vamos copiá-la para `C:\Arquivos de programas`.
4. Dentro de "C:\\Arquivos de programas\\RDP Wrapper" clique com o botão direito no arquivo `autoupdate__enable_autorun_on_startup.bat` e selecione a opção Executar como administrador para ativar a opção de atualização automática do RDP Wrapper.
5. Em seguida clique com o botão direito no arquivo `autoupdate.bat` e selecione a opção “Executar como administrador” para instalar e atualizar a conexão remota do Windows 10 em seu computador.
6. Para testar se a conexão remota está funcionando, execute o arquivo RDPCHeck.exe e na janela aberta, clique em “Conectar”. Ao fazer isso, será exibida a tela de login do Windows.