Zip
================================================================

> [Inicio](../wiki/) > [Programas](index.md#Programas)

O que é?
----------------------------------------------------------------

Programa que compacta e descompacta arquivos e pastas.

Sintaxe
----------------------------------------------------------------

Para compactar arquivos:

`zip arquivo.zip arquivo_original`

Onde:

* `arquivo.zip`: nome do arquivo que será gerado ao fim da compactação.
* `arquivo_original`: nome do arquivo que será comprimido.

Para compactar diretorios e pastas:

`zip -r arquivo.zip local_da_pasta`

Onde:

* `-r`: parâmetro de recursividade. Caso esteja copiando uma pasta ele incluirá as subpastas.
* `arquivo.zip`: nome do arquivo que será gerado ao fim da compactação.
* `local_da_pasta`: endereço do diretório que será comprimido e transformado em arquivo .zip.

Fontes
----------------------------------------------------------------

* <https://www.alura.com.br/artigos/linux-compactando-e-descompactando-arquivos-com-o-zip>