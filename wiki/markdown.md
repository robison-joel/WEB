MANUAL DO MARKDOWN
================================================================

> [início](index.md) > [Geral](index.md#Geral)

TITULAÇÃO
---------------------------------------------------------------

# Título 1 
## Título 2
### Título 3
#### Título 4
##### Título 5

<pre>
# Título 1
## Título 2
### Título 3
#### Título 4
##### Título 5
</pre>

Texto comum
-------------------------------------------------------------------

Para texto comum não é necessário nenhum caracter.

Negrito
-------------------------------------------------------------------

Para negrito, utiliza-se dois "*" (asteríscos) ou "_"(underscore).

<pre>
**negrito** ou __negrito__
</pre>

Itálico
-------------------------------------------------------------------

Para itálico, utiliza-se um "*" (asterísco) ou "_"(underscore).

<pre>
*itálico* ou _itálico_
</pre>

Negritálico
-------------------------------------------------------------------

Para negrito e itálico juntos, utiliza-se três "*" (asteríscos) ou "_"(underscore).

<pre>
***negritoitalico***
</pre>

Link's
-------------------------------------------------------------------

Existem duas formas de escrever um link com o Markdown. Link direto e link com texto:

### 6.1 Link direto

<https://www.google.com.br>

<pre>

<https://www.google.com.br>

</pre>

### 6.2 Link com texto

[Google](http://google.com.br)

<pre>
[Google](http://google.com.br)
</pre>>

Listas
--------------------------------

Usam-se o "*" (asterísco) ou no caso das listas ordenadas, "número." número acompanhado do ponto á direita.

### Lista normal

* Ítem
* Ítem
* Ítem
* Ítem
* Ítem

<pre>
* Ítem
* Ítem
* Ítem
* Ítem
* Ítem
</pre>

### Listas ordenadas

1. Primeiro ítem
2. Segundo ítem
3. Terceiro ítem
4. Quarto ítem
5. Quinto ítem

<pre>
1. Primeiro ítem
2. Segundo ítem
3. Terceiro ítem
4. Quarto ítem
5. Quinto ítem
</pre>

Citações
----------------------------------------------------------------

Para escrever uma citação, basta colocar o caracter ">" no início da linha.

> Essa é uma citação.

<pre>
> Essa é uma citação.
</pre>

Bloco de código
---------------------------------------------------

### Código em linha

O código em uma linha só é estilizado com três "~" (tils) ou três "`" (acento agudo) no início e no fim da linha.

<pre>
~~~ ou ```Linha de código~~~ ou ```
</pre>

### Código em bloco

O Bloco de código é delimitado por três "~" (tils) ou três "`" (acento agudo) no início e no fim do bloco.

```
Esse é um
Exemplo de
Bloco de Código
```

<pre>
``` ou ~~~
Esse é um
Exemplo de
Bloco de Código
``` ou ~~~
</pre>

Tabelas
-----------------------------------------------------------

N  | Descição      | Quantidade 
--:|:------------: | ----------:
1  | Item 1        | Muitos     
2  | Item 2        | Vários     
2  | Item 2        | Vários     
2  | Item 2        | Vários     
2  | Item 2        | Vários     

<pre>
N  | Descição      | Quantidade 
--:|:------------: | :----------
1  | Item 1        | Muitos     
2  | Item 2        | Vários     
2  | Item 2        | Vários     
2  | Item 2        | Vários     
2  | Item 2        | Vários     
</pre>

Fontes
----------------------------------------------------------------

* https://markdown.net.br/sintaxe-estendida/