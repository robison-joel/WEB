pfSense
===========================================

> [Inicio](index.md) > [Sistemas Operacionais](index.md#Sistemas Operacionais)

Autenticação em dois fatores
-------------------------------------------

Procedimento de instalação de autenticação em dois fatores no pfSense

### 1 Instala o FreeRADIUS

Acesse no menu superior na Dashboard do Firewall Sistema > Gerenciador de Pacotes
(System > Package Manager). faça uma busca por "freeradius". Instale o pacote correspondente ao
serviço.

### 2 Configuração

No mesmo menu do passo 1, acesse Serviços > FreeRADIUS (Services > FreeRADIUS). Na
página que abrirá, inicie clicando em "Configurações" (Settings). Aqui, você deverá habilitar o suporte para Mobile One-Time-Password (OTP). Deixe todos os outros valores como padrão e
salve.

### 3 Criar a Listener Port

Nesse ponto, clicamos em "interface" e no botão verde para criar uma nova interface para o
FreeRADIUS. Nessa parte, nao é necessário nenhuma alteração. Somente recomendamos inserir uma
descrição para a interface. e clique em salvar.

### 4 Criando o client

Em “NAS/Clientes” e clique em Add. Você só precisa preencher a parte superior do
formulário e clicar em Salvar. Atribua uma chave do “Segredo compartilhado do cliente” (“Client Shared Secret”) inserido aqui. Não esqueça desta informação pois ela será necessária mais adiante.

### 5 Criando o usuário

Aqui, devemos criar dois usuários: Um no FreeRADIUS para a autenticação em si e outro
no pfSense (User manager) por motivos de permissão. Ambos deverão ser iguais.
No FreeRADIUS, clique em "User" e adicione um usuario clicando no botão verde (Add).

Parâmetros:

- Username: atribua o seu usuario
- Password: Não atribua nenhuma senha aqui nesse espaço.
- Password Encryption: Cleartext-Password.
- One-Time Password Configuration: habilite-o clicando no checkbox.
- OTP Auth Method: Google-Authenticator.
- Init-Secret: Clique em "Generate OTP Secret" para gerar o Segredo OTP.
- PIN: Atribua um PIN simples (4 a 6 caracteres - preferencialmente números).
- QR Code: Clique no botão azul "Generate QR Code" e ele mostrará o qrcode que deverá ser
scaneado pelo aplicativo do Google Authentication no dispositivo. Esse processo adicionará o
pfSense no app e iniciará a rotina de criação de senhas aleatórias com um tempo definido.

Clique em salvar, no fim da página.

Acesso Sistema > Usuarios (System > User manager) e crie um novo usuario local no
Firewall (com a mesma denominação do usuario FreeRADIUS). Lembre-se de adicioná-lo no grupo
de "admins".

### 6 Servidor de Autenticação

Ainda em Sistema > Usuarios (System > User manager) clique em "Authentication Servers"
para setar o FreeRADIUS como servidor de autenticação padrão no seu pfSense, você deverá clicar no botão "Add".

Parâmetros:

- Descriptive name: Crie um nome para o seu Servidor de Autenticação
- Type: RADIUS
- Protocol: PAP
- Hostname or IP address: IP do Pfsense
- Shared Secret: “Segredo compartilhado do cliente” criado no passo 4.
- Services offered: Authentication and Accounting
As demais configurações ficam como padrão. Clique em "Save".

### 7 Testando o FreeRADIUS

Antes de configurar um serviço para autenticação no FreeRADIUS, é uma boa ideia testá-lo primeiro. Você pode testar sua configuração navegando até Diagnóstico > Autenticação (Diagnostics > Authentication) e escolhendo FreeRADIUS como servidor de autenticação.
Digite seu nome de usuário que foi criado anteriormente, e no campo de senha digite o PIN
de 4 dígitos (exemplo: 2545) junto com o código de 6 dígitos do Google Authenticator
(exemplo:693 953), tornando todo o campo de senha para ser “2545693953” e clique em Testar. Se
tudo correr bem, você deverá ver a faixa verde indicando sucesso.

Lightsquid
------------------------

### O que é

LightSquid é um analisador de log para o Squid rodando no pfSense. Através da análise dos logs de acesso de pacote de proxy é capaz de gerar relatórios baseados nos acessos à Web que detalham as URLs acessadas pelos usuários da rede.
Neste post veja como criar relatórios no pfSense.

> Pré-requisitos:
>
> 1. O pfSense já deve estar com o Squid Proxy Server instalado e configurado.
>
> 2. Liberação para a porta 7445 na LAN e para qualquer outra rede que acessará os relatórios.

### Instalação

Para instalar a ferramenta Lightsquid, siga os passos:

1. Acesse System > Package Manager. Clique em "Available Packages" e pesquise por “Liquidsquid”. Instale o pacote;

2. Após a instalação, acesse Status > Squid Proxy Reports. O Lightsquid já está praticamente configurado, contudo, ao acessar a página do Ligthsquid, você deverá atentar-se a algumas Instruções que aparecerão quando você clicar i ícone azul em "Instruções":
Nele haverão instruções imprescindíveis, para o funcionamento do LigthSquid, tais como:

- Habilitar e configurar o log do Squid
Marque 'Habilitar log de acesso' e configure 'Diretório de armazenamento de log' na página Squid Proxy Server > Geral.
Dica: É altamente recomendável deixar o 'Log Store Directory' como padrão

- Habilitar e configurar o registro do Squid
Marque 'Ativar registro de acesso' e configure 'Log Store Directory' na página Squid Proxy Server> Geral.
Dica: É altamente recomendável deixar o 'Log Store Directory' com o valor padrão /var/squid/logs.
(SOMENTE se o Squid NÃO estiver configurado como proxy transparente)
Configure 'Interface(s) Proxy' na página Squid Proxy Server > Geral para incluir a interface 'loopback' (além de quaisquer outras interfaces que você deseja que o Squid vincule). Isso é necessário para que o sqstat funcione.

- Configurar o Lightsquid
Preencha as seções 'Configurações do modelo de relatório' e 'Configurações de relatório e agendador' abaixo e salve quando terminar.

### Gerando relatórios

Crie relatórios iniciais do Lightsquid

Caminho: MENU > Status > Squid Proxy Reports

1. Use o botão "Refresh" (ou "Atualizar") na seção "Atualização manual"

2. Em "Web Service Settings", na seção "Links" clique no botão azul escrito "Open Lightsquid.

3. Você será redirecionado para os relatórios á partir da autenticação.

> Importante: Se você pular esta etapa, receberá uma página de erro de diagnóstico ao clicar em ‘Abrir Lightsquid’.
