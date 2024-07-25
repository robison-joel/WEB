CentOS 7
==========

> [Início](index.md) > [Sistemas Operacionais](index.md#Sistemas_Operacionais)

Configurar a rede
------------------------------------------------

Rodar o __nmtui__ para a configuração de rede.

`nmtui`

Restart no serviço de rede para que as mudanças sejam efetivas.

`service network status`

Comandos para administrar o serviço de rede:

Para testar a configuração.

`service network try-restart`

Para reiniciar.

`service network restart`

Para iniciar.

`service network start`

Para parar.

`service network stop`

Para forçar o reinicio.

`service network force-reload`

Atualizar
-------------------------------------------

2.1 Atualizar os repositórios

`yum check-update`

2.2 Atualizar o sistema.

`yum upgrade`
