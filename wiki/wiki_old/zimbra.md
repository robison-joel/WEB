Zimbra
======================================

Instalação
----------------------------------

1.1 Ascende a root

`sudo su`

1.2 Cria a pasta

`mkdir zimbra_app`

1.3 Entra na pasta

`cd zimbra_app/`

1.4 Download do pacote

`wget https://files.zimbra.com/downloads/8.8.15_GA/zcs-8.8.15_GA_4179.UBUNTU20_64.20211118033954.tgz`

1.5 Descompacta

`tar -vzxf zcs-8.8.15_GA_4179.UBUNTU20_64.20211118033954.tgz`

1.6 Apaga o arquivo compactado

`cd zcs-8.8.15_GA_4179.UBUNTU20_64.20211118033954.tgz`

1.7 Entra na pasta Descompactada

`cd zcs-8.8.15_GA_4179.UBUNTU20_64.20211118033954/`

1.8 Confere permissões no arquivo de Instalação

`chmod +x install.sh`

1.9 Roda o script de Instalação

`./install.sh`

Principais comandos
------------------------------------------

Comandos úteis na administração do Zimbra.

Descobrir qual é a versão e arquitetura do seu Zimbra:

`zmcontrol -v`

Comando para Iniciar o server:

`/etc/init.d/zimbra start` ou `zmcontrol start`

Parar o servidor

`/etc/init.d/zimbra stop` ou `zmcontrol stop`

Reiniciar o servidor:

`/etc/init.d/zimbra restart` ou `zmcontrol restart`

Checar o status do servidor:

`/etc/init.d/zimbra status` ou `zmcontrol status`

Obter ajuda do comando zmprov

`zmprov help commands`

Obter opções de uso do e a sintaxe de comandos do zmprov:

`zmprov -h`

Trocar o nome da máquina do Zimbra:

`/etc/init.d/zimbra stop ; /opt/zimbra/libexec/zmsetservername -o antigo.dominio.com -n novo.dominio.com`

Obter nome da máquina do Zimbra:

`zmhostname`

Listar todos os domínios no Zimbra:

`zmprov gad`

Criar outro domínio:

`zmprov cd dominio.org.br`

Renomear um domínio:

`zmprov -l rd dominio.org.br dominio.net.br`

Criar alias para domínio:

`zmprov cad alias_dominio.com.br dominio.com.br`

Verificar qual o domínio padrão do Zimbra:

`zmprov gacf zimbraDefaultDomainName`

Para remover um domínio ou um alias de domínio:

`zmprov dd alias_dominio.com.br`

Criar usuario:

`zmprov ca usuario@dominio.com.br 'senhaaqui'`

Alterar a senha de um usuário:

`zmprov sp usuario@dominio.com.br 'dominio.usuario'`

Listar todos usuarios:

`zmprov -l gaa`

Listar todos os usuários de um domínio:

`zmprov -l gaa dominio.com.br`

Listar usuários que são administradores:

`zmprov -l gaaa`

Transformar um usuario em administrador:

`zmprov -l gaaa dominio.com.br`

Criar um usuario com o atributo de administrador

`zmprov ma usuario@dominio.com.br zimbraIsAdminAccount TRUE`

Renomear conta:

`zmprov ca usuario@dominio.com.br 'senhaaqui' zimbraIsAdminAccount TRUE`

Renomer conta mudando de domínio:

`zmprov ra usuario@dominio.com.br usuario1@dominio.com.br`

Deletar Conta:

zmpra da <usuario@dominio.com.br>

Visualizar atributos de uma conta:

`zmprov ga usuario@dominio.com.br`

Adicionar alias a uma conta:

`zmprov aaa usuario@dominio.com.br alias_usuario@dominio.com.br`

Listar os alias:

`for i in $(zmprov -l gaa); do echo -e "\n$i:"; zmprov ga $i | grep MailAlias; done`

Listar os alias de um determinado domínio:

`for i in $(zmprov -l gaa dominio.com); do echo -e "\n$i:"; zmprov ga $i | grep MailAlias; done`

Remover alias

`zmprov raa usuario@dominio.com.br alias_usuario@dominio.com.br`

Para criar uma lista:

`zmprov cdl lista@dominio.com.br`

Visualizar listas de distribuição:

`zmprov gadl`

Adicionar membros à lista de distribuição:

`zmprov adlm lista@dominio.com.br usuario@dominio.com.br`

Adicionar um usuario a todas as listas de distribuição:

`for listas in $(zmprov gadl); do zmprov adlm $listas usuario@dominio.com.br; done`

Ver todas as informações de uma lista:

`zmprov gdlm lista@dominio.com.br`

Ver todas as informações de uma lista:

`zmprov gdl lista@dominio.com.br`

Remover membro de uma lista:

`zmprov rdlm lista@dominio.com.br lista@dominio.com.br`

Renomear uma lista de distribuição:

`zmprov rdl lista@dominio.com.br novalista@dominio.com.br`

Ocultar uma lista de distribuição da GAL:

`zmprov mdl lista@dominio.com.br  zimbraHideInGal TRUE`

Exibir uma lista de distribuição da GAL:

`zmprov mdl lista@dominio.com.br  zimbraHideInGal FALSE`

Remover uma lista:

`zmprov ddl lista@dominio.com.br`

Listar Classes:

`zmprov gac`

Criar uma nova COS:

`zmprov cc nome_da_classe`

Ver todos os atributos de uma classe:

`zmprov gc nome_da_classe`

Alterar a COS de um usuário:

`zmprov sac usuario@dominio.com.br nova_classe`

Para ver quantos usuários de um dominio estão em classes:

`zmprov cta dominio.com.br`

Obter o atributo da quota da COS:

`zmprov gc nome_classe zimbraMailQuota`

Obter cuota utilizada por cada usuário de um domínio (Formato Conta Quota Quota Utilizada):

`zmprov gqu localhost`

Alterar attribute de quota para o valor de 80M, este número deve ser em
bytes

`zmprov mc nome_da_classe zimbraMailQuota 83886080`

Checar se a quota foi alterada

`zmprov gc nome_da_classe zimbraMailQuota`

Para ver a cuota de cada usuario, vocee pode usar o comando:

`for i in $(zmprov -l gaa); do zmprov ga $i zimbraMailQuota; done`

Trocar a senha de administrador:

`zmprov sp admin@dominio.com.br 'senhaaqui'`

Logs de entrega de email na caixa (LMTP) Login e Logout Imap/Pop/Mapi, Erros
na aplicação java, operações de indexação, lentidão no banco de dados (slow
queries) e outros

`tail -f /opt/zimbra/log/mailbox.log`

Logs de atividade do postfix, status dos serviços, atividades do antivirus e antispam e outros:

`tail -f /opt/zimbra/log/zimbra.log`

Logs de autenticação:

`tail -f /opt/zimbra/log/audit.log`

Logs do antivirus db:

`tail -f /opt/zimbra/log/clamd.log`

Logs de atualizaçao do Antivirus Clamav

`tail -f /opt/zimbra/log/freshclam.log`

Logs ao DB do store que estão demorando

`tail -f /opt/zimbra/log/myslow.log`

Logs de treinamento do Antispam

`tail -f /opt/zimbra/log/spamtrain.log`

Ativar somente o acesso http:

`zmtlsctl http ; zmcontrol restart`

Ativar somente o acesso https:

`zmtlsctl https ; zmcontrol restart`

Ativa o acesso http e https:

`zmtlsctl mixed ; zmcontrol restart`

Logs
----------------------

Pastas de logs do zimbra

`/var/zimbra/log/audit.log`

`/var/zimbra/log/zimbra.log`

`/opt/zimbra/log/mailbox.log`

### Ubuntu e Debian

`/var/zimbra/log/mail.log`

### CentOS

`/var/zimbra/log/maillog`

Tipos de status de conta
--------------------------------------

* ___Ativa:___ Ativo é o estado normal para uma conta de caixa de correio. As mensagens são entregues e os usuários podem fazer logon na interface cliente normalmente.

* ___Manutenção:___ Quando um estado de caixa de correio está definido para a manutenção, o login é desativado , e e-mails endereçados para a conta são enfileirados no MTA (Postfix). Uma conta pode ser configurada para o modo de manutenção para fazer o backup , importação ou restaurar a caixa de correio.

* ___Pendente:___ Status pendente é um status que pode ser atribuído quando uma nova conta é criada e ainda não está pronto para se tornar ativa . O login é desativado e as mensagens são devolvidas aos remetentes.

* ___Bloqueada:___ Quando um status de uma conta é ‘bloqueado’, o usuário não pode entrar, mas as mensagens ainda são entregues a caixa. O status bloqueado pode ser definido, se você suspeitar que uma conta de email foi hackeada ou está sendo usado de forma não autorizada.

* ___Fechada:___ Quando o status do usuário é ‘fechado’, o login é desativado, e as mensagens são devolvidas . Este status é utilizado para inativar uma conta antes de excluir a mesma do servidor. A conta fechada não deixa de consumir uma licença.

* ___Bloqueio:___ Isso é definido automaticamente quando os usuários que tentam logar, não digitam sua senha correta e tem, então, sua conta bloqueada temporariamente. Você não pode definir esse status manualmente. Você configura uma política de login com um determinado número de tentativas de login falhas consecutivas que são permitidos antes que a conta seja bloqueada. Quanto tempo a conta é bloqueada é definido pelo COS ou configuração de conta, mas você pode alterar o status de bloqueio a qualquer momento.

Exemplos:

Para obter o status de uma conta:

`zmprov ga usuario@dominio.com.br | grep -ir zimbraaccountstatus`

Alterar o status da conta do usuário <usuario@dominio.com.br> para ativo:

`zmprov ma usuario@dominio.com.br zimbraaccountstatus active`

Lembrando que a função zimbraAccountStatus aceita como argumento os seguintes valores:

* active,
* maintenance,
* pending,
* locked,
* closed.

Listas de distribuição
-------------------------------------

### Tarefas básicas

#### Mostrar as listas existentes

`zmprov gadl`

#### Ver todas as informações de uma lista

`zmprov gdl lista@dominio.com.br`

#### Para criar uma lista

`zmprov cdl lista@dominio.com.br`

#### Renomear uma lista de distribuição

`zmprov rdl lista@dominio.com.br novalista@dominio.com.br`

#### Exclui uma lista

`zmprov ddl lista@dominio.com.br`

#### Exibir uma lista de distribuição da GAL

`zmprov mdl lista@dominio.com.br  zimbraHideInGal FALSE`

#### Ocultar uma lista de distribuição da GAL

`zmprov mdl lista@dominio.com.br  zimbraHideInGal TRUE`

#### Retorna todas as listas de distribuição

`zmprov -l gadl dominio.com.br`

### USUÁRIOS E MEMBROS

#### Adicionar membros à lista de distribuição

`zmprov adlm lista@dominio.com.br usuario@dominio.com.br`

#### Adicionar um usuario (<usuario@dominio.com.br>) a todas as listas de distribuição

`for listas in $(zmprov gadl); do zmprov adlm $listas usuario@dominio.com.br; done`

#### Visualizar membros de uma lista

`zmprov gdlm lista@dominio.com.br`

#### Remover membro de uma lista

`zmprov rdlm lista@dominio.com.br lista@dominio.com.br`

### PERMISSÕES

#### VERIFICAR PERMISSÕES de uma lista especifica

`zmprov gg -t dl lista@dominio.com.br`

#### Permissões de ENVIO PARA A LISTA

Utiliza-se sempre a instrução "sendToDistList" ao fim do comando.

#### Permitir envio

`zmprov grr dl lista@dominio.com.br usr usuario@dominio.com.br sendToDistList`

##### Concede permissão de envio para um usuario

`zmprov grr dl lista@dominio.com.br usr usuario@dominio.com.br sendToDistList`

##### Concessão de permissão de envio para um grupo - grp

`zmprov grr dl lista@dominio.com.br grp dl-group@test.com sendToDistList`

##### Concessão depermissão de envio para um domínio - dom

`zmprov grr dl lista@dominio.com.br dom test.com sendToDistList`

##### Concessão de permissão de envio para todos os usuários (internos) - all

`zmprov grr dl lista@dominio.com.br all sendToDistList`

##### Concessão para todos os usuários (internos e externos) - pub

`zmprov grr dl lista@dominio.com.br pub sendToDistList`

#### Remover permissão

Para remover a permissão utiliza-se o parâmetro "zmprov rvr dl" em qualquer um dos casos de permissão listados acima

`zmprov rvr dl lista@dominio.com.br usr contato@dominio.com.br sendToDistList`

#### Lista pública

Toda lista quando criada, já tem o status de "pública" até que se atribua alguém com essa permissão.
Para torná-la pública, depois de algupem já ter sido autorizado, basta retirar todas as contas com permissão e ela voltará a ter o status de pública onde qualquer pessoa poderá enviar mensagens para ela.

#### Lista dinâmica

A lista dinâmica se caracteriza por contar todos os usuarios ativos de um dominio ou grupo específico.

`zmprov cddl __nome_da_lista__`

#### VERIFICA se um usuario é INTEGRANTE da lista

`zmprov ckr dl __lista@dominio.com.br__ __usuario@dominio.com.br__ sendToDistList`

#### CONSULTAR a lista

`zmprov gdlm __lista@dominio.com.br__ | grep __usuario@dominio.com.br__`

#### PERMISSÕES DE ENVIO EM NOME DA LISTA

Para as autorizações de envio EM NOME DA LISTA usamos ao final o parâmetro "sendAsDistList"

##### Conceder permissão para que um determinado usuário possa enviar EM NOME DA LSITA

`zmprov grr dl lista@dominio.com.br usr usuario@dominio.com.br sendAsDistList`

##### Concessão permissão de envio para um grupo - grp

`zmprov grr dl lista@dominio.com.br grp dl-group@test.com sendAsDistList`

##### Concessão permissão de envio para um domínio - dom

`zmprov grr dl lista@dominio.com.br dom test.com sendAsDistList`

##### Concessão permissão de envio para todos os usuários (internos) - all

`zmprov grr dl lista@dominio.com.br all sendAsDistList`

##### Concessão de permissão de envio para todos os usuários (internos e externos) - pub

`zmprov grr dl lista@dominio.com.br pub sendAsDistList`

### Lista geral de comandos e parâmetros

* ddAccountAlias(aaa) {name@domain|id} {alias@domain}
* addAccountLogger(aal) [-s/--server hostname] {name@domain|id} {logging-category} {trace|debug|info|warn|error}
* addDistributionListAlias(adla) {list@domain|id} {alias@domain}
* addDistributionListMember(adlm) {list@domain|id} {member@domain}+
* autoCompleteGal(acg) {domain} {name}
* autoProvControl(apc) {start|status|stop}
* checkPasswordStrength(cps) {name@domain|id} {password}
* checkRight(ckr) {target-type} [{target-id|target-name}] {grantee-id|grantee-name (note:can only check internal user)} {right}
* copyCos(cpc) {src-cos-name|id} {dest-cos-name}
* countAccount(cta) {domain|id}
* countObjects(cto) {userAccount|account|alias|dl|domain|cos|server|calresource|accountOnUCService|cosOnUCService|domainOnUCService|internalUserAccount|internalArchivingAccount|internalUserAccountX} [-d {domain|id}] [-u {UCService|id}]
* createAccount(ca) {name@domain} {password} [attr1 value1 [attr2 value2...]]
* createAliasDomain(cad) {alias-domain-name} {local-domain-name|id} [attr1 value1 [attr2 value2...]]
* createAlwaysOnCluster(caoc) {name} [attr1 value1 [attr2 value2...]]
* createBulkAccounts(cabulk) {domain} {namemask} {number of accounts to create}
* createCalendarResource(ccr) {name@domain} {password} [attr1 value1 [attr2 value2...]]
* createCos(cc) {name} [attr1 value1 [attr2 value2...]]
* createDataSource(cds) {name@domain} {ds-type} {ds-name} zimbraDataSourceEnabled {TRUE|FALSE} zimbraDataSourceFolderId {folder-id} [attr1 value1 [attr2 value2...]]
* createDistributionList(cdl) {list@domain}
* createDynamicDistributionList(cddl) {list@domain}
* createDomain(cd) {domain} [attr1 value1 [attr2 value2...]]
* createServer(cs) {name} [attr1 value1 [attr2 value2...]]
* createUCService(cucs) {name} [attr1 value1 [attr2 value2...]]
* createIdentity(cid) {name@domain} {identity-name} [attr1 value1 [attr2 value2...]]
* createSignature(csig) {name@domain} {signature-name} [attr1 value1 [attr2 value2...]]
* createXMPPComponent(cxc) {short-name} {domain}  {server} {classname} {category} {type} [attr value1 [attr2 value2...]]
* deleteAccount(da) {name@domain|id}
* deleteAlwaysOnCluster(daoc) {name|id}
* deleteCalendarResource(dcr) {name@domain|id}
* deleteCos(dc) {name|id}
* deleteDataSource(dds) {name@domain|id} {ds-name|ds-id}
* deleteDistributionList(ddl) {list@domain|id} [true|false]
* deleteDomain(dd) {domain|id}
* deleteIdentity(did) {name@domain|id} {identity-name}
* deleteSignature(dsig) {name@domain|id} {signature-name}
* deleteServer(ds) {name|id}
* deleteUCService(ducs) {name|id}
* deleteXMPPComponent(dxc) {xmpp-component-name}
* describe(desc) [[-v] [-ni] [{entry-type}]] | [-a {attribute-name}]
* exit(quit)
* flushCache(fc) [-a] {acl|locale|skin|uistrings|license|all|account|config|globalgrant|cos|domain|galgroup|group|mime|server|alwaysOnCluster|zimlet|<extension-cache-type>} [name1|id1 [name2|id2...]]
* generateDomainPreAuth(gdpa) {domain|id} {name|id|foreignPrincipal} {by} {timestamp|0} {expires|0}
* generateDomainPreAuthKey(gdpak) [-f] {domain|id}
* getAccount(ga) [-e] {name@domain|id} [attr1 [attr2...]]
* getAlwaysOnCluster(gaoc) {name|id} [attr1 [attr2...]]
* getDataSources(gds) {name@domain|id} [arg1 [arg2...]]
* getIdentities(gid) {name@domain|id} [arg1 [arg...]]
* getSignatures(gsig) {name@domain|id} [arg1 [arg...]]
* getAccountMembership(gam) {name@domain|id}
* getAllAccounts(gaa) [-v] [-e] [-s server] [{domain}] -- NOTE: getAllAccounts can only be used with "zmprov -l/--ldap"
* getAccountLoggers(gal) [-s/--server hostname] {name@domain|id}
* getAllActiveServers(gaas) [-v]
* getAllAccountLoggers(gaal) [-s/--server hostname]
* getAllAdminAccounts(gaaa) [-v] [-e] [attr1 [attr2...]]
* getAllAlwaysOnClusters(gaaoc) [-v]
* getAllCalendarResources(gacr) [-v] [-e] [-s server] [{domain}]
* getAllConfig(gacf) [attr1 [attr2...]]
* getAllCos(gac) [-v]
* getAllDistributionLists(gadl) [-v] [{domain}]
* getAllDomains(gad) [-v] [-e] [attr1 [attr2...]]
* getAllEffectiveRights(gaer) {grantee-type} {grantee-id|grantee-name} [expandSetAttrs] [expandGetAttrs]
* getAllFbp(gafbp) [-v]
* getAllRights(gar) [-v] [-t {target-type}] [-c ALL|ADMIN|USER]
* getAllServers(gas) [-v] [-e] [service]
* getAllUCServices(gaucs) [-v]
* getAllXMPPComponents(gaxcs)
* getAuthTokenInfo(gati) {auth-token}
* getCalendarResource(gcr) {name@domain|id} [attr1 [attr2...]]
* getConfig(gcf) {name}
* getCos(gc) {name|id} [attr1 [attr2...]]
* getDistributionList(gdl) {list@domain|id} [attr1 [attr2...]]
* getDistributionListMembership(gdlm) {name@domain|id}
* getDomain(gd) [-e] {domain|id} [attr1 [attr2...]]
* getDomainInfo(gdi) name|id|virtualHostname {value} [attr1 [attr2...]]
* getConfigSMIMEConfig(gcsc) [configName]
* getDomainSMIMEConfig(gdsc) name|id [configName]
* getEffectiveRights(ger) {target-type} [{target-id|target-name}] {grantee-id|grantee-name} [expandSetAttrs] [expandGetAttrs]
* getCreateObjectAttrs(gcoa) {target-type} {domain-id|domain-name} {cos-id|cos-name} {grantee-id|grantee-name}
* getFreebusyQueueInfo(gfbqi) [{provider-name}]
* getGrants(gg) [-t {target-type} [{target-id|target-name}]] [-g {grantee-type} {grantee-id|grantee-name} [{0|1 (whether to include grants granted to groups the grantee belongs)}]]
* getMailboxInfo(gmi) {account}
* getQuotaUsage(gqu) {server}
* getRight(gr) {right} [-e] (whether to expand combo rights recursively)
* getRightsDoc(grd) [java packages]
* getServer(gs) [-e] {name|id} [attr1 [attr2...]]
* getUCService(gucs) [-e] {name|id} [attr1 [attr2...]]
* getShareInfo(gsi) {owner-name|owner-id}
* getSpnegoDomain(gsd)
* getXMPPComponent(gxc) {name|id} [attr1 [attr2...]]
* grantRight(grr) {target-type} [{target-id|target-name}] {grantee-type} [{grantee-id|grantee-name} [secret]] {right}
* help(?) commands
* modifyAccount(ma) {name@domain|id} [attr1 value1 [attr2 value2...]]
* modifyAlwaysOnCluster(maoc) {name|id} [attr1 value1 [attr2 value2...]]
* modifyCalendarResource(mcr) {name@domain|id} [attr1 value1 [attr2 value2...]]
* modifyConfig(mcf) attr1 value1 [attr2 value2...]
* modifyCos(mc) {name|id} [attr1 value1 [attr2 value2...]]
* modifyDataSource(mds) {name@domain|id} {ds-name|ds-id} [attr1 value1 [attr2 value2...]]
* modifyDistributionList(mdl) {list@domain|id} attr1 value1 [attr2 value2...]
* modifyDomain(md) {domain|id} [attr1 value1 [attr2 value2...]]
* modifyConfigSMIMEConfig(mcsc) configName [attr2 value2...]]
* modifyDomainSMIMEConfig(mdsc) name|id configName [attr2 value2...]]
* modifyIdentity(mid) {name@domain|id} {identity-name} [attr1 value1 [attr2 value2...]]
* modifySignature(msig) {name@domain|id} {signature-name|signature-id} [attr1 value1 [attr2 value2...]]
* modifyServer(ms) {name|id} [attr1 value1 [attr2 value2...]]
* modifyUCService(mucs) {name|id} [attr1 value1 [attr2 value2...]]
* modifyXMPPComponent(mxc) {name@domain} [attr1 value1 [attr value2...]]
* pushFreebusy(pfb) [account-id ...]
* pushFreebusyDomain(pfbd) {domain}
* purgeAccountCalendarCache(pacc) {name@domain|id} [...]
* purgeFreebusyQueue(pfbq) [{provider-name}]
* recalculateMailboxCounts(rmc) {name@domain|id}
* removeAccountAlias(raa) {name@domain|id} {alias@domain}
* removeAccountLogger(ral) [-s/--server hostname] [{name@domain|id}] [{logging-category}]
* removeDistributionListAlias(rdla) {list@domain|id} {alias@domain}
* removeDistributionListMember(rdlm) {list@domain|id} {member@domain}
* removeConfigSMIMEConfig(rcsc) configName
* removeDomainSMIMEConfig(rdsc) name|id configName
* renameAccount(ra) {name@domain|id} {newName@domain}
* changePrimaryEmail(cpe) {name@domain|id} {newName@domain}
* renameCalendarResource(rcr) {name@domain|id} {newName@domain}
* renameCos(rc) {name|id} {newName}
* renameDistributionList(rdl) {list@domain|id} {newName@domain}
* renameDomain(rd) {domain|id} {newDomain} -- NOTE: renameDomain can only be used with "zmprov -l/--ldap"
* renameUCService(rucs) {name|id} {newName}
* reIndexMailbox(rim) {name@domain|id} {start|status|cancel} [{types|ids} {type or id} [,type or id...]]
* compactIndexMailbox(cim) {name@domain|id} {start|status}
* verifyIndex(vi) {name@domain|id}
* getIndexStats(gis) {name@domain|id}
* revokeRight(rvr) {target-type} [{target-id|target-name}] {grantee-type} [{grantee-id|grantee-name}] {right}
* searchAccounts(sa) [-v] {ldap-query} [limit {limit}] [offset {offset}] [sortBy {attr}] [sortAscending 0|1*] [domain {domain}]
* searchCalendarResources(scr) [-v] domain attr op value [attr op value...] -- NOTE: searchCalendarResources can only be used with "zmprov -l/--ldap"
* searchGal(sg) {domain} {name} [limit {limit}] [offset {offset}] [sortBy {attr}]
* setLocalServerOnline(slso)
* selectMailbox(sm) {account-name} [{zmmailbox commands}]
* setAccountCos(sac) {name@domain|id} {cos-name|cos-id}
* setPassword(sp) {name@domain|id} {password}
* setServerOffline(sso) {name|id}
* getAllMtaAuthURLs(gamau)
* getAllReverseProxyURLs(garpu)
* getAllReverseProxyBackends(garpb)
* getAllReverseProxyDomains(garpd) -- NOTE: getAllReverseProxyDomains can only be used with "zmprov -l/--ldap"
* getAllMemcachedServers(gamcs)
* reloadMemcachedClientConfig(rmcc) all | mailbox-server [...]
* getMemcachedClientConfig(gmcc) all | mailbox-server [...]
* syncGal(syg) {domain} [{token}]
* updatePresenceSessionId(upsid) {UC service name or id} {app-username} {app-password}
* resetAllLoggers(rlog) [-s/--server hostname]
* unlockMailbox(ulm) {name@domain|id} [hostname (When unlocking a mailbox after a failed move attempt provide the hostname of the server that was the target for the failed move. Otherwise, do not include hostname parameter)]
* createHABOrgUnit(chou) {domain} {ouName}
* listHABOrgUnit(lhou) {domain}
* renameHABOrgUnit(rhou) {domain} {ouName} {newName}
* deleteHABOrgUnit(dhou) {domain} {ouName}
* createHABGroup(chg) {groupName} {ouName} {name@domain} {TRUE|FALSE} [attr1 value1 [attr2 value2...]]
* getHAB(ghab) {habRootGrpId}
* moveHABGroup(mhg) {habRootGrpId} {habParentGrpId} {targetHabParentGrpId}
* addHABGroupMember(ahgm) {name@domain|id} {member@domain}+
* removeHABGroupMember(rhgm) {name@domain|id} {member@domain}
* deleteHABGroup(dhg) {name@domain|id} [true|false]
* modifyHABGroupSeniority(mhgs) {habGrpId} {seniorityIndex}
* getHABGroupMembers(ghgm) {name@domain|id}

FONTE
--------------------------

* <https://linuxrede.wordpress.com/2014/02/22/lista-de-comandos-zimbra/https://linuxrede.wordpress.com/2014/02/22/lista-de-comandos-zimbra/>

* <https://www.youtube.com/watch?v=ozR7cDYFJsU>

* <https://linuxrede.wordpress.com/2014/02/22/lista-de-comandos-zimbra/>

* <https://mauricionh.wordpress.com/2018/02/09/especificar-contas-que-podem-enviar-e-mails-em-nome-da-lista-de-distribuicao-no-zimbra-sendasdistlist/>

* <https://respirandolinux.com.br/2014/10/14/zimbra-enviando-e-mails-em-nome-de-lista-de-distribuicao/>
