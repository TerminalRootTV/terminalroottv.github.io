---
layout: page
title: "ncurses - Guia de Utilização"
permalink: "/ncurses/"
description: 'A melhor biblioteca para TUI'
image: '/assets/img/cpp/ncurses.jpg'
---

![{{ page.title }}]({{ page.image }})
# COMO PROGRAMAR COM NCURSES
+ <https://terminalroot.com.br/ncurses/>
+ <https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/>

---

# 1. Introdução
Nos velhos tempos dos terminais de teletipo, os terminais ficavam longe dos computadores e eram conectados a eles por meio de cabos seriais. Os terminais podem ser configurados enviando uma série de bytes. Todos os recursos (como mover o cursor para um novo local, apagar parte da tela, rolar a tela, alterar os modos, etc.) dos terminais podem ser acessados por meio dessas séries de bytes. Essas funções de controle são geralmente chamadas de sequências de escape, porque começam com um caractere de escape (0x1B). Ainda hoje, com a emulação adequada, podemos enviar sequências de escape para o emulador e obter o mesmo efeito em uma janela de terminal.

Suponha que você queira imprimir uma linha colorida. Tente digitar isso em seu console.
```sh
echo -e "\e[0;31;40mIn Color"
```

O primeiro caractere é um caractere de escape, que se parece com `\e[`. Todos os outros são caracteres normais para impressão. Você deve conseguir ver a string "In Color" em vermelho. Permanece assim e para voltar ao modo original digite isto.
```sh
echo -e "\e[0;3740m"
```

Agora, o que esses caracteres mágicos significam? Difícil de compreender? Eles podem até ser diferentes para terminais diferentes. Portanto, os designers do UNIX inventaram um mecanismo chamado termcap. É um arquivo que lista todos os recursos de um terminal específico, junto com as sequências de escape necessárias para atingir um determinado efeito. Nos últimos anos, foi substituído pelo terminfo. Sem se aprofundar muito em detalhes, este mecanismo permite que programas de aplicativos consultem o banco de dados terminfo e obtenham os caracteres de controle a serem enviados a um terminal ou emulador de terminal.

## 1.1. O que é NCURSES ?
Você deve estar se perguntando qual é a importância de todo esse jargão técnico. No cenário acima, todo programa de aplicação deve consultar o terminfo e realizar as coisas necessárias (enviar caracteres de controle, etc.). Logo se tornou difícil administrar essa complexidade e isso deu origem a 'CURSES'. Curses é um trocadilho com o nome "otimização do cursor". A biblioteca Curses forma um invólucro sobre o trabalho com códigos de terminal brutos e fornece API (Interface de Programação de Aplicativo) altamente flexível e eficiente. Ele fornece funções para mover o cursor, criar janelas, produzir cores, brincar com o mouse, etc. Os programas aplicativos não precisam se preocupar com as capacidades subjacentes do terminal.

Então, o que é NCURSES? NCURSES é um clone da `curses` originais do SystemV Release 4.0 (SVr4). É uma biblioteca de distribuição gratuita, totalmente compatível com versões anteriores de `curses`. Resumindo, é uma biblioteca de funções que gerencia a exibição de um aplicativo em terminais de células de caracteres. No restante do documento, os termos `curses` e ncurses são usados alternadamente.

Um histórico detalhado do NCURSES pode ser encontrado no arquivo NEWS da distribuição de origem. O pacote atual é mantido por Thomas Dickey. Você pode contactar os mantenedores em <bug-ncurses@gnu.org>.

## 1.2. O que podemos fazer com NCURSES
NCURSES não apenas cria um invólucro sobre os recursos do terminal, mas também oferece uma estrutura robusta para criar UI (Interface de usuário) de boa aparência em modo de texto. Ele fornece funções para criar janelas, etc. Seu painel de bibliotecas irmãs, menu e formulário fornecem uma extensão para a biblioteca básica de `curses`. Essas bibliotecas geralmente vêm com `curses`. Pode-se criar aplicativos que contenham várias janelas, menus, painéis e formulários. O Windows pode ser gerenciado de forma independente, pode fornecer "capacidade de rolagem" e até mesmo pode ser escondido.

Os menus fornecem ao usuário uma opção de seleção de comando fácil. Os formulários permitem a criação de janelas de entrada e exibição de dados fáceis de usar. Os painéis estendem os recursos de ncurses para lidar com janelas sobrepostas e empilhadas.

Essas são apenas algumas das coisas básicas que podemos fazer com ncurses. À medida que avançamos, veremos todos os recursos dessas bibliotecas.

## 1.3. Onde conseguir
Tudo bem, agora que você sabe o que pode fazer com as `curses`, deve estar se preparando para começar. NCURSES geralmente já está presente em todos os sistemas tipo UNIX. Caso você não tenha a biblioteca ou queira compilá-la por conta própria, continue lendo.

+ Compilando o pacote

NCURSES pode ser obtido em <ftp://ftp.gnu.org/pub/gnu/ncurses/ncurses.tar.gz> ou em qualquer um dos sites de ftp mencionados em <http://www.gnu.org/order/ftp.html>.

Leia os arquivos `README` e `INSTALL` para obter detalhes sobre como instalá-lo. Geralmente envolve as seguintes operações.
```sh
tar zxvf ncurses<version>.tar.gz  # unzip and untar the archive
cd ncurses<version>               # cd to the directory
./configure                       # configure the build according to your 
                                  # environment
make                              # make it
su root                           # become root
make install                      # install it
```

+ Usando variados sistemas de gerenciamento de pacotes de distribuições Linux
```sh
emerge ncurses # Gentoo, Funtoo, ...
apt install ncurses # Debian, Ubuntu, ...
pacman -S ncurses # Arch Linux ...
dnf install ncurses # Red Hat, CentOS, Fedora, ...
```

## 1.4. Objetivo/Escopo desse documento
Este documento pretende ser um guia "Tudo em Um" para programação com ncurses e suas bibliotecas irmãs. Passamos de um programa simples "Hello World" para uma manipulação de formulários mais complexa. Nenhuma experiência anterior em ncurses é necessária. O texto é informal, mas muitos detalhes são fornecidos para cada um dos exemplos.

## 1.5. Sobre os programas
Todos os programas do documento estão disponíveis em formato compactado [aqui](http://www.tldp.org/HOWTO/NCURSES-Programming-HOWTO/ncurses_programs.tar.gz). Descompacte o zip ou tar. A estrutura do diretório é semelhante a esta.
```sh
ncurses
   |
   |----> JustForFun     -- just for fun programs
   |----> basics         -- basic programs
   |----> demo           -- output files go into this directory after make
   |          |
   |          |----> exe -- exe files of all example programs
   |----> forms          -- programs related to form library
   |----> menus          -- programs related to menus library
   |----> panels         -- programs related to panels library
   |----> perl           -- perl equivalents of the examples (contributed
   |                            by Anuradha Ratnaweera)
   |----> Makefile       -- the top level Makefile
   |----> README         -- the top level README file. contains instructions
   |----> COPYING        -- copyright notice
```
Os diretórios individuais contêm os seguintes arquivos.
```sh
Description of files in each directory
--------------------------------------
JustForFun
    |
    |----> hanoi.c   -- The Towers of Hanoi Solver
    |----> life.c    -- The Game of Life demo
    |----> magic.c   -- An Odd Order Magic Square builder 
    |----> queens.c  -- The famous N-Queens Solver
    |----> shuffle.c -- A fun game, if you have time to kill
    |----> tt.c      -- A very trivial typing tutor

  basics
    |
    |----> acs_vars.c            -- ACS_ variables example
    |----> hello_world.c         -- Simple "Hello World" Program
    |----> init_func_example.c   -- Initialization functions example
    |----> key_code.c            -- Shows the scan code of the key pressed
    |----> mouse_menu.c          -- A menu accessible by mouse
    |----> other_border.c        -- Shows usage of other border functions apa
    |                               -- rt from box()
    |----> printw_example.c      -- A very simple printw() example
    |----> scanw_example.c       -- A very simple getstr() example
    |----> simple_attr.c         -- A program that can print a c file with 
    |                               -- comments in attribute
    |----> simple_color.c        -- A simple example demonstrating colors
    |----> simple_key.c          -- A menu accessible with keyboard UP, DOWN 
    |                               -- arrows
    |----> temp_leave.c          -- Demonstrates temporarily leaving `curses` mode
    |----> win_border.c          -- Shows Creation of windows and borders
    |----> with_chgat.c          -- chgat() usage example

  forms 
    |
    |----> form_attrib.c     -- Usage of field attributes
    |----> form_options.c    -- Usage of field options
    |----> form_simple.c     -- A simple form example
    |----> form_win.c        -- Demo of windows associated with forms

  menus 
    |
    |----> menu_attrib.c     -- Usage of menu attributes
    |----> menu_item_data.c  -- Usage of item_name() etc.. functions
    |----> menu_multi_column.c    -- Creates multi columnar menus
    |----> menu_scroll.c     -- Demonstrates scrolling capability of menus
    |----> menu_simple.c     -- A simple menu accessed by arrow keys
    |----> menu_toggle.c     -- Creates multi valued menus and explains
    |                           -- REQ_TOGGLE_ITEM
    |----> menu_userptr.c    -- Usage of user pointer
    |----> menu_win.c        -- Demo of windows associated with menus

  panels 
    |
    |----> panel_browse.c    -- Panel browsing through tab. Usage of user 
    |                           -- pointer
    |----> panel_hide.c      -- Hiding and Un hiding of panels
    |----> panel_resize.c    -- Moving and resizing of panels
    |----> panel_simple.c    -- A simple panel example

  perl
    |----> 01-10.pl          -- Perl equivalents of first ten example programs
```
Há um `Makefile` de nível superior incluído no diretório principal. Ele constrói todos os arquivos e coloca os *exes* prontos para uso no diretório `demo/exe`. Você também pode fazer um `make` seletivo no diretório correspondente. Cada diretório contém um arquivo README explicando o propósito de cada arquivo `c` no diretório.

Para cada exemplo, incluí o nome do caminho para o arquivo relativo ao diretório de exemplos.

Se você preferir navegar por programas individuais, vá até o link <http://tldp.org/HOWTO/NCURSES-Programming-HOWTO/ncurses_programs/>

Todos os programas estão sob a mesma licença que é usada por `ncurses` (estilo MIT). Isso lhe dá a capacidade de fazer praticamente qualquer coisa além de reivindicá-los como seus. Sinta-se à vontade para usá-los em seus programas conforme apropriado.

## 1.6. Outros formatos do documento
Este tutorial também está disponível em vários outros formatos no site <tldp.org>. Aqui estão os links para outros formatos deste documento.

## 1.6.1. Formatos prontamente disponíveis em [tldp.org]
+  [Acrobat PDF](http://www.ibiblio.org/pub/Linux/docs/HOWTO/other-formats/pdf/NCURSES-Programming-HOWTO.pdf)
+  [PostScript](http://www.ibiblio.org/pub/Linux/docs/HOWTO/other-formats/ps/NCURSES-Programming-HOWTO.ps.gz)
+  [Múltiplas páginas HTML](http://www.ibiblio.org/pub/Linux/docs/HOWTO/other-formats/html/NCURSES-Programming-HOWTO-html.tar.gz)
+  [Página única HTML](http://www.ibiblio.org/pub/Linux/docs/HOWTO/other-formats/html_single/NCURSES-Programming-HOWTO.html)

## 1.6.2. Construindo da fonte
Se os links acima estiverem quebrados ou se você quiser experimentar o sgml, continue lendo.
```sh
Get both the source and the tar,gzipped programs, available at
    http://cvsview.tldp.org/index.cgi/LDP/howto/docbook/
    NCURSES-HOWTO/NCURSES-Programming-HOWTO.sgml
    http://cvsview.tldp.org/index.cgi/LDP/howto/docbook/
    NCURSES-HOWTO/ncurses_programs.tar.gz

Unzip ncurses_programs.tar.gz with
tar zxvf ncurses_programs.tar.gz

Use jade to create various formats. For example if you just want to create
the multiple html files, you would use
    jade -t sgml -i html -d <path to docbook html stylesheet>
    NCURSES-Programming-HOWTO.sgml
to get pdf, first create a single html file of the HOWTO with 
    jade -t sgml -i html -d <path to docbook html stylesheet> -V nochunks
    NCURSES-Programming-HOWTO.sgml > NCURSES-ONE-BIG-FILE.html
then use htmldoc to get pdf file with
    htmldoc --size universal -t pdf --firstpage p1 -f <output file name.pdf>
    NCURSES-ONE-BIG-FILE.html
for ps, you would use
    htmldoc --size universal -t ps --firstpage p1 -f <output file name.ps>
    NCURSES-ONE-BIG-FILE.html
```
Consulte o [guia do autor do LDP](http://www.tldp.org/LDP/LDP-Author-Guide/) para obter mais detalhes. Se tudo mais falhar, envie-me um e-mail para <ppadala@gmail.com>

## 1.7. Créditos
Agradecimentos a **Sharath**, **Emre Akbas**, **Anuradha Ratnaweera** e **Ravi Parimi**. Tradução em Português Brasileiro: **Marcos Oliveira**.

## 1.8. Lista de Desejos
Esta é a lista de desejos, em ordem de prioridade. Se você tiver um desejo ou se quiser trabalhar para realizá-lo, envie-me um email.
+ Adicione exemplos às últimas partes da seção de formulários.
+ Prepare um Demo mostrando todos os programas e permita ao usuário navegar pela descrição de cada programa. Deixe o usuário compilar e ver o programa em ação. É preferível uma interface baseada em diálogo.
+ Adicione informações de depuração. _tracef, _tracemouse stuff.
+ Acessando termcap, terminfo usando funções fornecidas pelo pacote ncurses.
+ Trabalhando em dois terminais simultaneamente.
+ Adicione mais coisas à seção diversos.

## 1.9. Direito autoral
Copyright Š 2001 by Pradeep Padala.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, distribute with modifications, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE ABOVE COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Except as contained in this notice, the name(s) of the above copyright holders shall not be used in advertising or otherwise to promote the sale, use or other dealings in this Software without prior written authorization._

---

# 2. Hello World !!! 
Bem-vindo ao mundo das `ncurses`. Antes de mergulharmos na biblioteca e examinarmos seus vários recursos, vamos escrever um programa simples e dizer olá para o mundo.

## 2.1. Compilando com a Biblioteca NCURSES
Para usar as funções da biblioteca `ncurses`, você deve incluir `<ncurses.h>` em seus programas. Para vincular o programa com ncurses, os sinalizadores `-lncurses` e `ltinfo` devem ser adicionados.
+ Exemplo de um `Hello, World!`


```cpp
#include <ncurses.h>

int main(){	
  initscr();			
  printw("Hello World !!!");	
  refresh();			
  getch();			
  endwin();			

  return 0;
}
```

> Para compilar: `g++ helloworld.cpp -o helloworld.o -lncurses -ltinfo`
> 
> E então rode: `./helloworld.o`

Caso queria simplificar a compilação, use um `Makefile` e compile rodando somente com o comando: `marke`, exemplo:
> `vim Makefile`

```make
TARGET=helloworld
CC=g++
DEBUG=-g
OPT=-O0
WARN=-Wall
CURSES=-lncurses
TINFO=-ltinfo
CCFLAGS=$(DEBUG) $(OPT) $(WARN)
LD=g++
OBJS=helloworld.cpp
all: helloworld.cpp
	$(LD) -o $(TARGET) $(OBJS) $(DEBUG) $(OPT) $(WARN) $(CURSES) $(TINFO)
```
Compile: `make`, rode: `./helloworld`

## 2.2. Dissecação
O programa acima imprime "Hello World !!!" para a tela e sai. Este programa mostra como inicializar `curses` e fazer manipulação de tela e finalizar o modo `curses`. Vamos dissecar linha por linha.

### 2.2.1. Sobre o `initscr()`
A função `initscr()` inicializa o terminal no modo `curses`. Em algumas implementações, ele limpa a tela e apresenta uma tela em branco. Para fazer qualquer manipulação de tela usando o pacote `curses`, isso deve ser chamado primeiro. Esta função inicializa o sistema `curses` e aloca memória para nossa janela atual (chamada `stdscr`) e algumas outras estruturas de dados. Em casos extremos, esta função pode falhar devido à memória insuficiente para alocar memória para as estruturas de dados da biblioteca de `curses`.

Depois que isso for feito, podemos fazer uma variedade de inicializações para personalizar nossas configurações de `curses`. Esses detalhes serão explicados posteriormente.

### 2.2.2. A misteriosa `refresh()`
A próxima linha `printw` imprime a string *"Hello World !!!"* na tela. Esta função é análoga a `printf` e `std::cout` em todos os aspectos, exceto que ela imprime os dados em uma janela chamada `stdscr` nas coordenadas atuais (y, x). Como nossas coordenadas atuais estão em 0,0, a string é impressa no canto esquerdo da janela.

> **Quando chamamos `printw`, os dados são na verdade gravados em uma janela imaginária, que ainda não é atualizada na tela. O trabalho de printw é atualizar alguns sinalizadores e estruturas de dados e gravar os dados em um buffer correspondente a `stdscr`. Para mostrá-lo na tela, precisamos chamar `refresh()` e dizer ao sistema `curses` para despejar o conteúdo na tela.**

A filosofia por trás de tudo isso é permitir que o programador faça várias atualizações na tela ou *janelas imaginárias* e faça uma atualização quando toda a atualização da tela estiver concluída. `refresh()` verifica a janela e atualiza apenas a parte que foi alterada. Isso melhora o desempenho e também oferece maior flexibilidade. Mas, às vezes, é frustrante para iniciantes. Um erro comum cometido por iniciantes é esquecer de chamar `refresh()` depois de fazer alguma atualização por meio da classe de funções `printw()`. 

### 2.2.3. Sobre `getch()`
A função `getch()` aguarda que o usuário tecle algo para que ela possa *escutar* a tecla digitada e proceder conforme definido.

### 2.2.4. Sobre `endwin()`
E, finalmente, não se esqueça de encerrar o modo de `curses`. Caso contrário, seu terminal pode se comportar de maneira estranha após o encerramento do programa. `endwin()` libera a memória tomada pelo subsistema `curses` e suas estruturas de dados e coloca o terminal no modo normal. Esta função deve ser chamada depois de terminar com o modo `curses`.

---

# 3. Inicialização
Agora sabemos que para inicializar o sistema `curses`, a função `initscr()` deve ser chamada. Existem funções que podem ser chamadas após esta inicialização para personalizar nossa sessão de `curses`. Podemos pedir ao sistema `curses` para definir o terminal em modo bruto ou inicializar a cor ou inicializar o mouse, etc. Vamos discutir algumas das funções que normalmente são chamadas imediatamente após `initscr()`;

## 3.1. `raw()` e `cbreak()`
Normalmente, o driver do terminal armazena os caracteres que um usuário digita até que uma nova linha ou retorno de carro seja encontrado. Mas a maioria dos programas exige que os caracteres estejam disponíveis assim que o usuário os digitar. As duas funções acima são usadas para desativar o buffer de linha. A diferença entre essas duas funções está na maneira como os caracteres de controle como suspender (CTRL-Z), interromper e sair (CTRL-C) são passados para o programa. No modo `raw()`, esses caracteres são passados diretamente para o programa sem gerar um sinal. No modo `cbreak()`, esses caracteres de controle são interpretados como qualquer outro caractere pelo driver do terminal. Eu pessoalmente prefiro usar `raw()` porque posso exercer maior controle sobre o que o usuário faz.

## 3.2. `echo()` e `noecho()`
Essas funções exibem caracteres digitados pelo usuário no terminal. `noecho()` desativa a exibição. O motivo pelo qual você pode querer fazer isso é para obter mais controle sobre imprimir ou suprimir a exibição desnecessária enquanto recebe a entrada do usuário por meio das funções `getch()` etc. A maioria dos programas interativos chama `noecho()` na inicialização e faz a impressão de caracteres de uma maneira controlada. Dá ao programador a flexibilidade de imprimir caracteres em qualquer lugar da janela sem atualizar as coordenadas atuais (y, x).


## 3.3. `keypad()`
Esta é minha função de inicialização favorita. Ele permite a leitura de teclas de função como `F1`, `F2`, teclas de seta(← ↓ →), etc. Quase todo programa interativo permite isso, já que as teclas de seta são uma parte importante de qualquer interface de usuário. Faça o teclado (`stdscr`, `TRUE`) para habilitar este recurso para a tela normal (`stdscr`). Você aprenderá mais sobre gerenciamento de teclas em seções posteriores deste documento.

## 3.4. `halfdelay()`
Esta função, embora não seja usada com muita freqüência, é útil às vezes. `halfdelay()` é chamado para habilitar o *modo com atraso*(half-delay), que é semelhante ao modo `cbreak()` em que os caracteres digitados estão imediatamente disponíveis para programação. No entanto, ele espera por 'X' décimos de segundo pela entrada e retorna ERR, se nenhuma entrada estiver disponível. 'X' é o valor de tempo limite passado para a função `halfdelay()`. Esta função é útil quando você deseja solicitar uma entrada do usuário, e se ele não responder em um determinado tempo, podemos fazer outra coisa. Um exemplo possível é um tempo limite no prompt de senha.

## 3.5. Funções diversas de inicialização
Existem mais algumas funções que são chamadas na inicialização para personalizar o comportamento dos `curses`. Elas não são usadas tão extensivamente quanto os mencionados acima. Alguns deles são explicados quando apropriado.

## 3.6. Um exemplo
Vamos escrever um programa que irá esclarecer o uso dessas funções.
+ Exemplo de uso da função de inicialização

```cpp
#include <ncurses.h>

int main(){
  int ch;

  initscr();			
  raw();				
  keypad(stdscr, TRUE);		
  noecho();			

  printw("Pressione alguma tecla e a mesma será exibida em negrito.\n");
  ch = getch();			
                                   
  if(ch == KEY_F(1)){		
          printw("A tecla F1 foi pressionada!");
  }else{
          printw("A tecla que você pressionou foi: ");
          attron(A_BOLD);
          printw("%c", ch);
          attroff(A_BOLD);
  }
  refresh();			
  getch();			
  endwin();			

  return 0;
}
```
Este programa é autoexplicativo. Mas forma usadas funções que ainda não foram explicadas. As funções `attron` e` attroff` são usadas para ativar e desativar alguns atributos, respectivamente. No exemplo, foram usadas para imprimir o caractere em negrito. Essas funções são explicadas em detalhes posteriormente.

# 4. Sobre janelas
Uma janela é uma tela imaginária definida pelo sistema de `curses`. Quando `curses` é inicializado, ele cria uma janela padrão chamada `stdscr` que representa sua tela. Se estiver realizando tarefas simples, como imprimir algumas strings, ler dados de entrada, etc., você pode usar com segurança esta única janela para todos os seus propósitos. Você também pode criar janelas e chamar funções que funcionam explicitamente na janela especificada.

Por exemplo, se você chamar:
```cpp
printw("Olá !!!");
refresh();
```
Ele imprime a string em `stdscr` na posição atual do cursor. Da mesma forma, a chamada para `refresh()` funciona apenas em `stdscr`.

Digamos que você tenha criado janelas e então tenha que chamar uma função com um 'w' adicionado à função usual.
```cpp
wprintw(win, "Olá !!!");
wrefresh(win);
```
Como você verá no restante do documento, a nomenclatura das funções segue a mesma convenção. Para cada função, geralmente há mais três funções.
```cpp
printw(string);
mvprintw(y, x, string);
wprintw(win, string);  
mvwprintw(win, y, x, string);   
```

# 5. Funções de saída
Existem três classes de funções que você pode usar para fazer a saída na tela.
+ classe `addch()`: Imprime um único caractere com atributos
+ classe `printw()`: Imprimir saída formatada semelhante a `printf()`
+ classe `addstr()`: Imprimir strings
Essas funções podem ser usadas alternadamente e é uma questão de estilo de qual classe é usada. Vamos ver cada um em detalhes.

## 5.1. classe de funções `addch()`
Essas funções colocam um único caractere na localização atual do cursor e avançam a posição do cursor. Você pode fornecer o caractere a ser impresso, mas eles geralmente são usados para imprimir um caractere com alguns atributos. Os atributos são explicados em detalhes nas seções posteriores do documento. Se um caractere estiver associado a um atributo (negrito, vídeo reverso etc.), quando `curses` imprime o caractere, ele é impresso naquele atributo.

Para combinar um caractere com alguns atributos, você tem duas opções:

+ Ordenando um único caractere com as macros de atributo desejadas. Essas macros de atributo podem ser encontradas no arquivo de cabeçalho `ncurses.h`. Por exemplo, se você deseja imprimir um caractere `ch` (do tipo `char`) em **negrito** e ~sublinhado~, você chamaria `addch()` conforme abaixo.
```cpp
addch(ch | A_BOLD | A_UNDERLINE);
```
+ Usando funções como `attrset()`, `attron()`, `attroff()`. Essas funções são explicadas na seção Atributos. Resumidamente, eles manipulam os atributos atuais da janela fornecida. Uma vez definido, o caractere impresso na janela é associado aos atributos até que seja desativado.

Além disso, `curses` fornece alguns caracteres especiais para gráficos baseados em caracteres. Você pode desenhar tabelas, linhas horizontais ou verticais, etc. Você pode encontrar todos os caracteres disponíveis no arquivo de cabeçalho` ncurses.h`. Tente procurar macros começando com `ACS_` neste arquivo.

## 5.2. `mvaddch()`, `waddch()` and `mvwaddch()`
`mvaddch()` é usado para mover o cursor para um determinado ponto e então imprimir. Assim, as chamadas:
```cpp
move(row,col);    
addch(ch);
```
pode ser substituído por:
```cpp
mvaddch(row,col,ch);
```
`waddch()` é semelhante a `addch()`, exceto que adiciona um caractere na janela fornecida. (Observe que `addch()` adiciona um caractere no stdscr da janela.)

De forma semelhante, a função `mvwaddch()` é usada para adicionar um caractere na janela fornecida nas coordenadas fornecidas.

Agora, estamos familiarizados com a função de saída básica `addch()`. Mas, se quisermos imprimir uma string, seria muito chato imprimi-la caractere por caractere. Felizmente, ncurses fornece funções semelhantes a `printf` ou `puts`.
+ `printw()` - Imprime dados na tela;
+ `mvprintw` - Pode ser usado para mover o cursor para uma posição e então imprimir. Se você quiser mover o cursor primeiro e depois imprimir usando a função `printw()`, use `move()` primeiro e depois use `printw()` embora eu não veja nenhum motivo para evitar o uso de `mvprintw()`, você tem a flexibilidade de manipular.
+ `wprintw()` e `mvwprintw` - Essas duas funções são semelhantes às duas anteriores, exceto pelo fato de serem impressas na janela correspondente fornecida como argumento.
+ `vwprintw()` - Isso pode ser usado quando um número variável de argumentos deve ser impresso.

Um exemplo simple: `vim simple.cpp`
```cpp
#include <ncurses.h>			  
#include <cstring> 

int main(){
  char mesg[]="Alguma string";		
  int row,col;				

  initscr();				
  getmaxyx(stdscr,row,col);		
  mvprintw(row/2,(col-strlen(mesg))/2,"%s",mesg);

  mvprintw(row-2,0,"Essa tela tem %d linhas e %d colunas\n",row,col);
  printw("Tente redimensionar sua janela (se possível) e execute este programa novamente.");
  refresh();
  getch();
  endwin();

  return 0;
}
```

O programa acima demonstra como é fácil usar `printw`. Basta alimentar as coordenadas e a mensagem que aparecerá na tela, então ele faz o que você quiser.

O programa acima nos apresenta uma nova função `getmaxyx()`, uma macro definida em `ncurses.h`. Fornece o número de colunas e o número de linhas em uma determinada janela. `getmaxyx()` faz isso atualizando as variáveis fornecidas a ele. Como `getmaxyx()` não é uma função, não passamos ponteiros para ela, apenas fornecemos duas variáveis inteiras.

## 5.3. `addstr()`
Usada para colocar uma string de caracteres em uma determinada janela. Esta função é semelhante a chamar `addch()` uma vez para cada caractere em uma determinada string. Isso é verdadeiro para todas as funções de saída. Existem outras funções desta família, como `mvaddstr()`, `mvwaddstr()` e `waddstr()`, que obedecem à convenção de nomenclatura de `curses`. (Por exemplo, `mvaddstr()` é semelhante às respectivas chamadas `move()` e depois `addstr()`.) Outra função desta família é `addnstr()`, que recebe um parâmetro inteiro (digamos n) adicionalmente. Esta função coloca no máximo n caracteres na tela. Se *n* for negativo, toda a string será adicionada.

## 5.4. Uma palavra de cautela
Todas essas funções recebem a coordenada y primeiro e depois x em seus argumentos. Um erro comum dos iniciantes é passar x, y nessa ordem. Se você estiver fazendo muitas manipulações de (y, x) coordenadas, pense em dividir a tela em janelas e manipular cada uma separadamente. As janelas são explicadas na seção de janelas.

---

# 6. Funções de entrada 
Classes:
+ `getch()`: Obtenha um caractere
+ `scanw()`: Obtenha uma entrada formatada
+ `getstr()`: Obtenha *strings*

## 6.1. classe de funções `getch()`
Essas funções lêem um único caractere do terminal. Mas existem vários fatos sutis a serem considerados. Por exemplo, se você não usar a função `cbreak()`, ncurses não irá ler seus caracteres de entrada de forma contígua, mas começarão a lê-los somente depois que uma nova linha ou um **EOF** for encontrado. Para evitar isso, a função `cbreak()` deve ser usada para que os caracteres estejam imediatamente disponíveis para seu programa. Outra função amplamente usada é `noecho()`. Como o nome sugere, quando esta função é configurada (utilizada), os caracteres que são digitados pelo usuário não aparecem na tela. As duas funções `cbreak()` e `noecho()` são exemplos típicos de gerenciamento de chaves.

6.2. classe de funções `scanw()`
Essas funções são semelhantes a `scanf()` com a capacidade adicional de obter a entrada de qualquer local da tela.

### 6.2.1. `scanw()` e mvscanw
O uso dessas funções é semelhante ao de `sscanf()` , onde a linha a ser verificada é fornecida pela função `wgetstr()` . Ou seja, essas funções chamam a função `wgetstr()` (explicada abaixo) e usa a linha resultante para uma varredura.

6.2.2. `wscanw()` e `mvwscanw()`
Essas funções são semelhantes às duas funções acima, exceto pelo fato de serem lidas em uma janela, que é fornecida como um dos argumentos para essas funções.

### 6.2.3. `vwscanw()`
Esta função é semelhante a `vscanf()` . Isso pode ser usado quando um número variável de argumentos deve ser verificado.

### 6.3. `getstr()` classe de funções
Essas funções são usadas para obter strings do terminal. Em essência, essa função executa a mesma tarefa que seria realizada por uma série de chamadas para `getch()` até que uma nova linha, retorno de carro ou fim de arquivo seja recebido. A seqüência de caracteres resultante é apontada por str , que é um ponteiro de caractere fornecido pelo usuário.
7,4 Alguns exemplos

#### Exemplo 4. Um exemplo de varredura simples
```cpp
#include <ncurses.h>
#include <string.h>

int main( int argc, char ** argv ){

    // Mensagem aparece na tela
    char mesg[]="Digite uma mensagem: ";
    char str[80];

    // para armazenar o número de linhas e o número de colunas da tela
    int row,col;

    // inicia a ncurses
    initscr();

    // obtém o número de linhas e colunas
    getmaxyx(stdscr,row,col);

    // imprime a mensagem no centro da tela
    mvprintw(row/2,(col-strlen(mesg))/2,"%s",mesg);
    getstr(str);
    mvprintw(LINES - 2, 0, "You Entered: %s", str);
    getch();
    endwin();

    return 0;
}
```

---

# CHEAT SHEET NCURSES

## Funções de inicialização

| Funções | Descrição |
| ------------- | ------------- |
| **initscr()** | Inicializa o terminal no modo cursor. Ele deve ser chamado primeiro para fazer qualquer manipulação com o pacote ncurses.
| **refresh()** | Diz ao sistema curses para descarregar o conteúdo da tela. Ele verifica a janela e atualiza apenas a parte que foi alterada.
| **wrefresh()** | Diz ao sistema curses para descarregar o conteúdo da janela fornecida. Ele verifica a janela fornecida e atualiza apenas a parte que foi alterada.
| **endwin()** | Termina o modo de cursor do terminal.
| **raw()** | Desativar buffer embutido. Os caracteres de controle são passados diretamente para o programa sem gerar um sinal.
| **cbreak()** | Desativa o buffer embutido. Os caracteres de controle são interpretados como qualquer outro caractere pelo driver de terminal.
| **echo()** | Ligue o eco. |
| **noecho()** | Desative o eco. |
| **keypad(stdscr, TRUE)** | Habilita a leitura das teclas de função.
| **halfdelay()** | Habilita o modo de meio-retardo, ele espera por 'X' décimos de segundo pela entrada e retorna **ERR**, se nenhuma entrada estiver disponível |

## Funções diversas

| Funções | Descrição |
| ------------- | ------------- |
| **clear()** | Limpa a janela stdscr. |
| **wclear()** | Limpa a janela fornecida. |
| **move(y, x)** | Mova o cursor para a posição x, y na janela.
| **wmove(win, y, x)** | Mova o cursor para a posição x, y na janela fornecida. |
| **getmaxyx(stdscr, y, x)** | Obter os limites da tela, ou seja, o número de linhas e colunas |
| **getyx(stdscr, y, x)** | Obtenha a posição atual do cusor |

## Funções de saída

| Funções | Descrição |
| ------------- | ------------- |
| **addch()** | Imprime um caractere com os atributos fornecidos na posição atual do cursor e avança a posição do cursor. |
| **mvaddch()** | Mova o cursor para uma determinada posição e imprima como por **addch()** .
| **waddch()** | Imprime um caractere como por **addch()**, mas na janela fornecida.
| **mvwaddch()** | Mova o cursor para uma determinada posição e, em seguida, imprima como por **addch()**, mas na janela fornecida.
| **printw()** | Imprime semelhante a **printf()**, mas em qualquer posição na janela, ou seja, a posição atual do cursor e avança a posição do cursor. |
| **mvprintw()** | Mova o cursor para uma determinada posição e depois imprima como por **printw()** .
| **wprintw()** | Imprime como em **printw()**, mas na janela fornecida.
| **mvwprintw()** | Mova o cursor para uma determinada posição e, em seguida, imprima como por **printw()**, mas para a janela fornecida.
| **addstr()** | Imprime uma cadeia de caracteres com os atributos fornecidos na posição atual do cursor e avança a posição do cursor. |
| **mvaddstr()** | Mova o cursor para uma determinada posição e imprima como por **addstr()** .
| **waddstr()** | Imprime uma cadeia de caracteres como em **addstr()**, mas na janela fornecida.
| **mvwaddstr()** | Mova o cursor para uma determinada posição e, em seguida, imprima como por **addstr()**, mas na janela fornecida.

## Funções de entrada

| Funções | Descrição |
| ------------- | ------------- |
| **getch()** | Insira um caractere com os atributos fornecidos da posição atual do cursor e avance a posição do cursor. |
| **mvgetch()** | Mova o cursor para uma determinada posição e insira como por **getch()** .
| **whetch()** | Insira um caractere como **getch()**, mas a partir da janela fornecida.
| **mvwgetch()** | Mova o cursor para uma determinada posição e, em seguida, insira como por **getch()**, mas na janela fornecida.
| **scanw()** | Recebe entrada semelhante a **scanf()**, mas de qualquer posição na janela, ou seja, a posição atual do cursor e avança a posição do cursor. |
| **mvscanw()** | Mova o cursor para uma determinada posição e insira como por **scanw()** .
| **wscanw()** | Recebe entrada como por **scanw()**, mas da janela fornecida.
| **mvwscanw()** | Mova o cursor para uma determinada posição e, em seguida, insira como por **scanw()**, mas a partir da janela fornecida.
| **getstr()** | Insira uma cadeia de caracteres com os atributos fornecidos a partir da posição atual do cursor e avance a posição do cursor. |
| **mvgetstr()** | Mova o cursor para uma determinada posição e insira como por **getstr()** .
| **wgetstr()** | Insira uma cadeia de caracteres como em **getstr()**, mas a partir da janela fornecida.
| **mvwgetstr()** | Mova o cursor para uma determinada posição e insira como por **getstr()** mas a partir da janela fornecida.

## Funções de Atributo

| Funções | Descrição |
| ------------- | ------------- |
| **attron()** | Alterna os atributos dados a ele. |
| **wattron()** | Ativa **o(s)** **atributo(s)** **fornecido(s)** a ele, na janela fornecida.
| **attrset()** | Sobrescreve totalmente quaisquer atributos que a janela tinha anteriormente e os define para os novos atributos. |
| **wattrset()** | Substitui totalmente quaisquer atributos que a janela fornecida tinha anteriormente e os define como os novos atributos.
| **attroff()** | Desativa os atributos dados a ele. |
| **wattroff()** | Desativa o(s) **atributo(s)** fornecido(s) a ele, na janela fornecida.
| **standend()** | Desativa todos os atributos e leva você ao modo normal. |
| **attr_get()** | Obtém os atributos atuais e o par de cores da janela. |
| **wattr_get()** | Obtém os atributos atuais e o par de cores da janela fornecida.
| **chgat()** | Altere **atributo(s)** para caracteres que já estão na tela. |
| **mvchgat()** | Mova o cursor para a posição fornecida e, em seguida, execute o trabalho como por **chgat()** .
| **wchgat()** | Realiza o trabalho feito por **chgat()** na janela fornecida. |
| **mvwchgat()** | Mova o cursor para a posição fornecida e execute o trabalho como por **chgat()** na janela fornecida.

## Lista de Atributos

Podemos **OR**(`|`) qualquer número dos atributos acima para obter um efeito combinado.

| Funções | Descrição |
| ------------- | ------------- |
| **A_NORMAL** | Exibição **normal(sem destaque)** .
| **A_STANDOUT** | Melhor modo de destaque do terminal.
| **A_UNDERLINE** | Sublinhado.
| **A_REVERSE** | Vídeo reverso.
| **A_BLINK** | Piscando.
| **A_DIM** | Meio brilhante.
| **A_BOLD** | Extra brilhante ou negrito.
| **A_PROTECT** | Modo protegido.
| **A_INVIS** | Modo invisível ou em branco.
| **A_ALTCHARSET** | Conjunto de caracteres alternativos.
| **A_CHARTEXT** | Máscara de bits para extrair um caractere.
| **COLOR_PAIR**(n) | Número do par de cores n. |

## Funções de cor

| Funções | Descrição |
| ------------- | ------------- |
| **start_color()** | Precisa ser chamado antes de usar cores.
| **has_colors()** | Verifique se o terminal tem recursos de cores.
| **init_pair()** | Inicie um número de par de cores n com cor de primeiro e segundo plano, que pode ser usado em **COLOR_PAIR**(n).
| **init_color()** | Altere os valores rgb para as cores definidas por curses inicialmente.
| **can_change_color()** | Verifique se o terminal tem capacidade de mudar de cor.

## Colors

As seguintes cores são definidas em curses.h. Você pode usá-los como parâmetros para várias funções de cores.

| Cores | Código |
| ------------- | ------------- |
| **COLOR_BLACK** | 0 |
| **COLOR_RED** | 1 |
| **COLOR_GREEN** | 2 |
| **COLOR_YELLOW** | 3 |
| **COLOR_BLUE** | 4
| **COLOR_MAGENTA** | 5 |
| **COLOR_CYAN** | 6
| **COLOR_WHITE** | 7

---

## Funções de Janelas
| Funções | Descrição |
| ------------- | ------------- |
| **box()** | Desenhe uma borda ao redor das janelas.
| **newwin()** | Cria uma nova janela.
| **create_newwin()** | Cria uma nova janela com **newwin()** e exibe uma borda ao redor com **box()** .
| **delwin()** | Desalocar memória relacionada à janela.
| **destroy_win()** | Apaga a janela da tela a dn e a exclui chamando **delwin()** |
| **wborder()** | Desenha uma borda ao redor da janela pelos caracteres fornecidos a ela.

---

> Essa página ainda está incompleta, o capítulo 7(8 tldp) e demais ainda serão adicionados a partir [daqui](https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/attrib.html).

<style>
div.pagina p { text-align: left; }
</style>
