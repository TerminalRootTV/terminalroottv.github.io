---
layout: post
title: "Curso Certificação Linux LPI-101: Comandos do editor de texto Vim-Vi"
date: '2011-12-27T18:20:00.000-08:00'
image: '/assets/img/editores/vi-vim.jpg'
description: "O vim é um dos editores de textos mais utilizados no mundo Unix."
tags:
- dicas
---

![Comandos do editor de texto Vim Vi](/assets/img/editores/vi-vim.jpg "Comandos do editor de texto Vim Vi")

## Introdução

> [vi](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=vim) é a sigla para "Visual Interface". A origem desse nome se deve ao seguinte fato: quando o vi foi criado (começo da década de 80), não era comum existirem [editores de textos](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=editores de textos) como nos dias de hoje. Naquela época, você digitava um texto mas não podia vê-lo! Isso mesmo! Em 1992, foi criado o vim (__Vi IMitator__), um clone fiel ao vi, porém com muitas outras funcionaliades, que só foram sendo adicionadas. Algum tempo depois, o vim passou a ser chamado de `__Vi IMproved__' (*vi melhorado*).

O vim é um dos editores de textos mais utilizados no mundo [Unix](http://www.terminalroot.com.br/tags#unix). Em alguns sistemas, existe um link simbólico (__/bin/vi__) apontando para o /usr/vim. Em outros, o /bin/vi é o executável, só que executa diretamente o vim. Muita gente acha que usa vi, mas na verdade utiliza o vim, e eles têm algumas diferenças. O que você verá abaixo fala sobre o vim.

O vim é um editor de textos muito poderoso, ele pode: abrir vários arquivos ao mesmo tempo, possui sistema de autocorreção, auto-identação, seleção visual, macros, seleção vertical de texto, uso de expressões regulares, sintaxe colorida, e muito mais. Ele não é exclusivo do Unix, ou seja, pode ser executado em outras plataformas, como Amiga, MacOS, Sun, Windows entre outras.

Existe também o __gvim__, que é o vim em modo gráfico, com todas as funcionalidades do vim em pleno funcionamento, o que muda é apenas o modo gráfico mesmo.

O vim possui vários modos, ou seja, estados em que ele se encontra. São eles: modo de inserção, [comandos](http://www.terminalroot.com.br/tags#comandos), linha de comando, visual, busca e reposição. Abordarei os dois principais:

## Modo de inserção e de comandos

> Para identificar o modo (estado) do vim, basta visualizar o rodapé da tela.

## Agora, vamos à prática. Para executar o vim, utilize:

* __$ vi__ => Abre o vim vazio, sem nenhum arquivo e exibe a tela de apresentação.
* __$ vi arquivo__ => Abre o arquivo de nome "arquivo".
* __$ vi arquivo +__ => Abre o arquivo de nome "arquivo", com o cursor no final do mesmo.
* __$ vi arquivo +10__ => Abre o arquivo de nome "arquivo", com o cursor na linha 10.
* __$ vi arquivo +/Copag__ => Abre o arquivo de nome "arquivo", na primeira ocorrência da palavra "Copag".

Ao executar o vim, ele inicia diretamente em modo de comando. Para comprovar, é só olhar na última linha (rodapé) e não vai haver nada lá. Isso quer dizer que você não conseguirá escrever nada, pode digitar a vontade que só vai ouvir beeps. Para começar a escrever, pressione "i" em seu teclado. O vim entra em modo de inserção, que você comprova (como falado anteriormente) pelo rodapé da tela, onde fica a seguinte marcação:

- - -- INSERT --

#### Suponha que você já digitou o bastante, e quer salvar, por segurança. Pressione a tecla ESC para voltar em modo de comandos. E veja os comandos para salvar/sair:

* __:w__ => Salva o arquivo que está sendo editado no momento.
* __:q__ => Sai.
* __:wq__ => Salva e sai.
* __:x__ => Idem.
* __ZZ__ => Idem.
* __:w!__ => Salva forçado.
* __:q!__ => Sai forçado.
* __:wq!__ => Salva e sai forçado.

#### Então, você editou uma boa quantidade de textos e quer salvar:

# :w

#### Agora, quer voltar a editar o texto:

# i

> Lembre que utilizando o "i" para inserção, a mesma se inicia inserindo texto antes do cursor. Veja agora outros subcomandos de inserção de texto:

* __A__ => Insere o texto no fim da linha onde se encontra o cursor
* __o__ => Adiciona uma linha vazia abaixo da linha corrente
* __O__ => Adiciona uma linha vazia acima da linha corrente
* __Ctrl + h__ => Apaga último caracter à esquerda

#### Voltando ao modo de comando:

> Veja agora subcomandos para movimentação pelo texto:

* __Ctrl + f__ => Passa para a tela seguinte.
* __Ctrl + b__ => Passa para a tela anterior.
* __H__ => Move o cursor para a primeira linha da tela.
* __M__ => Move o cursor para o meio da tela.
* __L__ => Move o cursor para a última linha da tela.
* __h__ => Move o cursor para caracter a esquerda.
* __j__ => Move o cursor para linha abaixo.
* __k__ => Move o cursor para linha acima.
* __l__ => Move o cursor para caracter a direita.
* __w__ => Move o cursor para o início da próxima palavra (não ignorando a pontuação).
* __W__ => Move o cursor para o início da próxima palavra (ignorando a pontuação).
* __b__ => Move o cursor para o início da palavra anterior (não ignorando a pontuação).
* __B__ => Move o cursor para o início da palavra anterior (ignorando a pontuação).
* __0 (zero)__ => Move o cursor para o início da linha corrente.
* __^__ => Move o cursor para o primeiro caracter não branco da linha.
* __$__ => Move o cursor para o fim da linha corrente.
* __nG__ => Move o cursor para a linha de número "n"

(susbstitua n pelo número da linha)..
* __G__ => Move o cursor para a última linha do arquivo.

## Copiando e colando textos no vim (utilizando o mouse)

Selecione o texto necessário com o botão esquerdo do mouse. Quando você for colar, saiba que o texto será colado a partir de onde se encontra o cursor (esse que aparece, às vezes piscando e às vezes não, quando você está digitando). Para colar, depois de ter selecionado o texto, você pode utilizar uma dessas opções:

* 1) Pressionando o botão direito do mouse;
* 2) Pressionando o botão direito + botão esquerdo juntos;
* 3) Pressionando o botão do meio do mouse (mouse de 3 botões);

> Observação: Lembre-se que o vim deve estar no modo de inserção.

## Usando o modo visual do vim

> Entre no modo visual: v
> Agora, utilize as teclas direcionais (setas) do teclado, para selecionar o texto desejado.
> Pressione e cole, utilizando a tecla "p" (paste).

#### Veja agora como apagar um determinado texto:

Utilizando normalmente as teclas Backspace/Delete, ou entrando em modo visual (v) e pressionando a tecla Delete.

Você pode remover até o final de uma palavra, utilizando: __dw__
Pode também remover até o final de uma frase: __d$__

## Desfazendo uma ação

É claro que você pode desfazer uma ação que você considera errado, ou que errou ao digitar o texto. É só utilizar: u
Se você precisar voltar o texto na tela, utilize as teclas Ctrl + r.

## Subcomandos para localização de texto

* __/palavra__ => Procura pela palavra ou caracter acima ou abaixo do texto.
* __?palavra__ => Move para a ocorrência anterior da palavra (para repetir a busca use "n").
* __n__ => Repete o último comando utilizando / ou ?.
* __N__ => Repete o último comando / ou ? ao contrário (baixo para cima).
* __Ctrl+g__ => Mostra o nome do arquivo, o número da linha corrente e o total de linhas.

## Subcomandos para localização de texto

* __/palavra__ => Procura pela palavra ou caracter acima ou abaixo do texto.
* __?palavra__ => Move para a ocorrência anterior da palavra (para repetir a busca use "n").
* __n__ => Repete o último comando utilizando / ou ?.
* __N__ => Repete o último comando / ou ? ao contrário (baixo para cima).
* __Ctrl+g__ => Mostra o nome do arquivo, o número da linha corrente e o total de linhas.

## Mais opções para remoção de caracteres

* __x__ => Apaga o caracter onde o cursor estiver.
* __dd__ => Apaga a linha inteira onde o cursor estive
* __D__ => Apaga a linha a partir da posição do cursor até o fim.
* __J__ => Une a linha corrente à próxima.
* __:5dd__ => Removeas próximas 7 linhas a partir da posição do atual do cursor (qualquer número).

## Mais para copiar e colar

* __:yy__ => Copia a linha onde o cursor se encontra.
* __:5yy__ => Copia as próximas 5 linhas a partir da posição atual do cursor.
* __:p__ => Cola o que foi copiado na linha abaixo do cursor atual.

## Opções para substituição de textos

* __rCARACTER__ => Substitui o caracter onde o cursor se encontra pelo caracter especificado em CARACTER.
* __RTEXTO__ => Substitui o texto corrente pelo texto digitado (sobrepõe).
* __cw__ => Remove a palavra corrente para substituição.
* __cc__ => Remove a linha corrente para substituição.
* __C__ => Substitui o restante da linha corrente, esperando o texto logo após o comando.
* __J__ => Une a linha corrente à próxima.
* __:s/velho/novo__ => Substitui a primeira ocorrência de "velho" por "novo" na linha corrente.
* __:% s/velho/novo__ => Substitui em todo o arquivo (%) a primeira ocorrência de "velho" por "novo" em cada linha.
* __:% s/velho/novo/g__ => Substitui em todo o arquivo (%), todas (g) as ocorrências de "velho" por "novo".
* __:% s/velho/novo/gc__ => Igual ao anterior, mas pedindo confirmação para cada substituição.
* __:% s/^String[0-9]//gc__ => Expressões regulares também funcionam, como no sed.
* __:% s/./\u&/gc__ => Converte para maiúsculas (\u) o primeiro caracter (.) de cada linha.

## Abreviações

* __:ab__ => Mostra todas as abbr.
* __:abc[lear]__ => Remove todos.
* __:iab__ => Apenas para modo de inserção.
* __:iabc[lear]__ => Tira todos de inserção.
* __:cab__ => Apenas p/modo de comando ( : ).
* __:cabc[lear]__ => Tira todos os modos de comando.
* __:una vc__ => Tira ab para vc.

> Observação: Pontuação, espaço ou o ENTER, disparam a expansão de uma abreviação. Porém, Ctrl+] também pode ser usado, para expandir sem adicionar caracteres.

## Opções para o comando SET

:set
* __autowrite aw__ => Salva a cada alteração.
* __backspace bs__ => Comportamento backspace (1 ou 2).
* __errorbell eb__ => Campainha de erro.
* __expandtab et__ => Troca tab por espacos.
* __fileformat=dos ff__ => Converte o arquivo para DOS.
* __hidden hid__ => Preserva o buffer.
* __hlsearch hls__ => Elumina a última procura.
* __ignorecase ic__ => Case insensitive na busca.
* __incsearch is__ => Ilumina procura enquanto digita.
* __laststatus=2__ => Mostra linha de estado.
* __lazyredraw lz__ => Não redesenha em macros.
* __lines=N__ => Múmero de linhas na tela.
* __magic__ => Usar mágicas na procura de padrões.
* __number nu__ => Mostra núm da linha.
* __report=N__ => Mostra aviso quando N linhas mudaram (0=sempre).
* __showcmd__ => Mostra o comando que se está fazendo.
* __showmatch sm__ => Mostra o casamento de {},[],().
* __smartcase scs__ => Assume "noic" quando tiver maiúsculas.
* __textwidth=N__ => Quebra de linha do texto.
* __undolevels ul=N__ => Guarde os N últimos comandos para desfazer (padrão=1000).
* __vb t_vb=__ => Retira o "beep" de erro.

## Agora invertendo maiúsculas/minúsculas

* __5~__ => Inverte os 5 próximos caracteres.
* __g~$__ => Inverte todos os caracteres até o fim da linha.
* __seleciona, u__ => Converte para minúsculas.
* __seleciona, U__ => Converte para maiúsculas.
* __seleciona, ~__ => Inverte.

> Observação: Onde está escrito "seleciona", é para fazer utilizando o modo visual (v).

### Agora veja como definir coluna de quebra de linha (problema que eu tive quando iniciei no aprendizado do vim):

> :set textwidth=N

#### Se você já estiver num arquivo pronto:

* __:set wm=5__ => O número 5 aqui são as colunas que serão "cortadas".
* __gqG__ => Até o final do arquivo.

### Vamos ver agora o que podemos fazer pressionando a tecla "Ctrl":

> É claro que é segurando Ctrl + .

## No modo de COMANDO:

* __A__ => Incrementa um número (Add)
* __X__ => Decrementa um número
* __S__ => ScrollLock
* __L__ => Redesenha tela
* __V__ => Modo visual (Visual Vertical)
* __G__ => Status do arquivo
* __M__ => Início da próxima linha
* __E__ => Linha abaixo sem mover cursor
* __Y__ => Linha acima sem mover cursor
* __N__ => Próxima linha (Next)
* __P__ => Linha anterior (Previous)
* __F__ => PageDown (Forward)
* __B__ => PageUp (Backyard)
* __U__ => PageUp / 2 (Up)
* __D__ => PageDown / 2 (Down)

## Agora, no modo de INSERÇÃO:

* __A__ => Insere o último texto inserido
* __I__ => TAB
* __S__ => ScrollLock
* __H__ => BackSpace
* __T__ => 2 tab's no início da linha (Two Tabs)
* __V__ => Anula expansão do próximo caractere
* __J__ => Enter - quebra de linha
* __M__ => Enter - quebra de linha
* __L__ => Redesenha tela
* __R__ => Insere conteúdo do registrador [a-z] (Veja abaixo)
* __K__ => Insere um dígrafo (Veja abaixo)
* __N__ => Procura palavra no texto atual (Next)
* __P__ => Procura palavra no texto atual (Previous)
* __Y__ => Copia caractere que está acima (Yank)

## Veja os caracteres especiais:

* __ga__ => Mostra o código da letra sobre o cursor.
* __:dig__ => Mostra todos os dígrafos disponíveis (tabela).

Exemplos: Para fazer um º, use Ctrl+K,-,o ("Ctrl"+"K"+"-"+"o").
Para fazer um ½, use Ctrl+K,1,2 ("Ctrl"+"K"+"1"+"2").

## Trabalhando com arquivos e janelas múltiplas

Você pode abrir múltiplos arquivos, por exemplo:
{% highlight bash %}
vim arquivo1 arquivo2
{% endhighlight %}

## E pode alternar entre as janelas. Veja:

* __:wn__ => Grava o atual e vai ao próximo.
* __:wN__ => Grava o atual e vai ao anterior.
* __:args__ => Mostra todos os arquivos atuais.
* __:qa__ => Sai de todas as janelas de uma vez.
* __:all__ => Abre todos os arquivos em janelas individuais.

Tecla chave das janelas = Crtl+W
* __j, seta abaixo__ => Move para janela abaixo.
* __k, seta acima__ => Move para janela acima.
* __o__ => Apenas esta janela, fecha todas as outras (Only).
* __+, -__ => Muda o tamanho da janela.
* __=__ => Deixa todas as janelas com tamanhos iguais.

## Os registradores

* __"[a-z]__ => Use o registrador [a-z] para o próximo delete, cópia ou cola.
* __:reg__ => Mostra o conteúdo de todos os registradores.
* __:reg [a-z]__ => Mostra o conteúdo do registradores [a-z].

> Observação: O __[a-z]__ pode ser: __0-9a-z%#:.-="__

## Marcas:

* __m[a-z]__ => Marca em [a-z] a posição corrente do cursor.
* __`[a-z]__ => Vai até a marca [a-z].
* __``__ => Vai até a posição anterior ao último pulo (alterna).
* __:marks__ => Mostra as marcas ativas.

## Fazendo gravação de seqüência de comandos

* __q[a-z]__ => Inicia a gravação de uma seqüência no registrador [a-z].
* __q[A-Z]__ => Inicia a gravação, adicionando no registrador [a-z].
* __q__ => Pára a gravação.
* __@[a-z]__ => Executa a seqüência do registrador [a-z] (5 vezes? 5@a)

> Dica: Pode-se colocar o @[a-z] dentro da própria gravação do q[a-z]! Assim ele é executado recursivamente. Muito útil quando há uma procura de padrões na gravação. faz para todas as ocorrências.

### Mapeamentos

* __:map :r!date__ => Mapeamento em modo de comando.
* __:imap :r!date__ => Mapeamento em modo de inserção.
* __:cmap r!date__ => Mapeamento em modo linha de comando.
* __:vmap :r!date__ => Mapeamento em modo visual.

#### Exemplos:

> "html: negrito no trecho selecionado
:vmap d`pa # html: negrito no trecho selecionado

> "liga/desliga autoIndent
> :map ,si :set ai!:echo "autoIndent="&ai

> "mostrar os espaços em branco no fim das linhas
> :map / *$^M

### Através dos mapeamentos é possível "encurtar" comandos, ou seja, abreviá-los. Conheça as sintaxes:

* __Comment__ => Ciano
* __Constant__ => Roxo
* __Identifier__ => Ciano
* __PreProc__ => Azul escuro
* __Special__ => Vermelho
* __Statement__ => Amarelo
* __String__ => Roxo
* __Type__ => Verde

* __Todo__ => Preto, fundo marrom
* __Error__ => Branco, fundo vermelho
* __Ignore__ => Preto, fundo preto! - esconde

## Utilizando o recurso de expandtab

> Mas, o que isso faz? Transforma todos os TABs em espaços. Podemos ativar dentro do próprio vim, utilizando o comando:

> :set expandtab

#### Para desabilitar:

> :set noexpandtab

#### Podemos colocar também no arquivo *~/.vimrc* a seguinte linha:

> set expandtab

#### O arquivo ~/.vimrc pode ser usado para muitas configurações, e essa é uma delas. Existe ainda o arquivo ~/.exrc, mas não entraremos em detalhes.

#### Podemos incluir a saída de um comando no vim, utilizando:

> :r!comando

#### Por exemplo:

> :r!rpm -q kernel

#### Incluiria o seguinte resultado, dentro do seu texto (isso na minha máquina):

> kernel-2.4.18-3

#### Dicas diversas do vim:

* __:xit__ => Igual :wq, mas só grava se tiver sido alterado algo no arquivo.

> :map N_ARQ ^R=expand("%:t:r")^M

Imprime no arquivo o próprio nome do arquivo editado quando N_ARQ é digitado.

#### Agora, veja como alinhar o texto:

> :left
> :right
> :center

> E para fazer uma busca de 2 palavras ao mesmo tempo:
> __/palavra1\|palavra2__

> O vim é um editor de textos com centenas de opções, comandos, strings... Enão dá para abordar tudo aqui. Por isso, a melhor maneira de conhecê-lo a fundo é usando-o.

## Agora, veja quem colaborou com a criação das dicas, e de onde eu tirei tanta informação:

+ Revista do Linux (Ed. 04 - Vi, vim e venci - Aurélio);
+ Página do Aurélio (www.verde666.org);
+ Dicas-L (expandtab) (www.Dicas-L.unicamp.br);
+ Dicas enviadas pelo amigo Uziel (uhfn@ig.com.br)
+ Vários tutoriais recolhidos pela internet.

### Agradeço a todos aqueles que contribuiram direta e/ou indiretamente com os tutoriais.

## Dicas desenvolvidas e gentilmente cedidas por [Copag](mailto:copag@uai.com.br). Publicado em __30_06_2003.__

# Via: [InfoWester](https://www.infowester.com/linuxvi.php)

<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>

<!-- Informat -->
<ins class="adsbygoogle"
 style="display:block"
 data-ad-client="ca-pub-2838251107855362"
 data-ad-slot="2327980059"
 data-ad-format="auto"
 data-full-width-responsive="true"></ins>

<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

