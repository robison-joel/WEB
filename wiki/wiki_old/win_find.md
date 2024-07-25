Findstr
=============================

O que faz?
--------------

Procura cadeias de caracteres em arquivos. correspondente ao "grep" do bash linux.

Sintaxe
--------------

`findstr [opções][parâmetro]`

### Comando de ajuda (help)

`findstr /?`

`/B` - Corresponde ao padrão se estiver no início de uma linha.
`/E` - Corresponde ao padrão se estiver no final de uma linha.
`/L` - Usa cadeias de caracteres de pesquisa literalmente.
`/R` - Usa cadeias de caracteres de pesquisa como expressões regulares.
`/S` - Procura por arquivos correspondentes na pasta atual e em todas as subpastas.
`/I` - Especifica que a pesquisa não diferenciará maiusculas de minúsculas.
`/X` - Imprime as linhas que têm correspondência exata.
`/V` - Imprime somente as linhas que não contêm uma correspondência.
`/N` - Imprime o número da linha antes de cada linha correspondente.
`/M` - Imprime somente o nome do arquivo se um arquivo contiver uma  correspondência.
`/O` - Imprime o deslocamento de caractere antes de cada linha correspondente.
`/P` - Ignora arquivos com caracteres não imprimíveis.
`/OFF[LINE]` - Não ignora caracteres com conjunto de atributos offline.
`/A:atributos` - Especifica atributo de cor com dois dígitos hexadecimais. Consulte "color /?"
`/F:arquivo` - Lê a lista de arquivos do arquivo especificado (/ significa console).
`/C:cadeia de caracteres` - Usa uma cadeia de caracteres especificada como uma cadeia de caracteres de pesquisa literal.
`/G:arquivo` - Obtém cadeias de caracteres de pesquisa do arquivo especificado (/ significa console).
`/D:lista_de_pastas` - Procura uma lista de pastas delimitada por ponto-e-vírgula cadeias de caracteres Texto a ser procurado.
Referência rápida de expressões regulares:
  * Curinga: qualquer caractere
  * Repetir: zero ou mais ocorrências do caractere anterior ou classe
  * `^`: Posição na linha: início da linha
  * `$`: Posição na linha: final da linha
  * `[class]`:  Classe de caractere: qualquer caractere no conjunto
  * `[^class]`: Classe inversa: qualquer caractere que não esteja no conjunto
  * `[x-y]`: Intervalo: qualquer caractere dentro do intervalo especificado
  * `\x`: Escape: uso literal de metacaractere x
  * `\<xyz`: Posição na palavra: início da palavra
  * `xyz\>`: Posição na palavra: final da palavra

### Exemplo

```
C:\Users\robisonjoel>ipconfig | findstr /I ipv4
   Endereço IPv4. . . . . . . .  . . . . . . . : 192.168.100.15

C:\Users\robisonjoel>ipconfig | findstr /I 192
   Endereço IPv4. . . . . . . .  . . . . . . . : 192.168.100.15
                                                 192.168.100.1
```
