#!/bin/bash

# Aki pega o que digitar e coloca na variavel user

echo "                                          "
echo "nome de usuario :"
echo "                                          "
read -r VAR_SMBUSER

# Aki ele nao faz nada + do que a saida do comando echo $user ele coloca no arquivo NomeDeUsuario.txt
echo "                                          "
echo "# $(date +%d-%m-%Y) - $VAR_SMBUSER - Usuario foi criado"  | sudo tee -a NomeDeUsuarios.txt
echo "                                          "

# Se usar apenas '>' em vez de '>>' , sempre que for executado , ele ira apagar o conteudo e escrever o que o usuario digitar , se deixar com '>>' ele sempre vai colocar no final do arquivo

echo "                                          "
echo "Digite a sua senha : "
echo "                                          "

read -ers VAR_SMBSENHA # aki ele nao aparece o que digitou e aguarda um enter

echo "                                          "
echo "# $(date +%d-%m-%Y) - Usuário $VAR_SMBUSER com a senha $VAR_SMBSENHA" | sudo tee -a SenhaDeUsuarios.txt
echo "                                          "
