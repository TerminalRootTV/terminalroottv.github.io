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

# Índice
+ [1. Introdução](#1-introdução)
+ [2. Hello-World-!!!-](#2-hello-world-)
+ [3. Inicialização](#3-inicialização)
+ [4. Sobre-janelas](#4-sobre-janelas)
+ [5. Funções-de-saída](#5-funções-de-saída)
+ [6. Funções-de-entrada-](#6-funções-de-entrada-)
+ [7. Atributos](#7-atributos)
+ [8. Janelas](#8-janelas)
+ [9. Cores](#9-cores)
+ [10. Interface-com-o-teclado](#10-interface-com-o-teclado)
+ [11. Interface-com-o-mouse](#11-interface-com-o-mouse)
+ [12. Manipulação-de-tela](#12-manipulação-de-tela)
+ [13. Recursos-diversos](#13-recursos-diversos)
+ [14. Biblioteca-do-painel](#14-biblioteca-do-painel)
+ [15. Biblioteca-de-Menus](#15-biblioteca-de-menus)
+ [16. Biblioteca-de-Formulários](#16-biblioteca-de-formulários)
+ [17. Ferramentas-e-bibliotecas-de-widgets](#17-ferramentas-e-bibliotecas-de-widgets)
+ [18. Apenas-por-diversão!!!](#18-apenas-por-diversão-)
+ [19. Referências](#19-referências)
+ [20. Cheat Sheet Ncurses](#20-cheat-sheet-ncurses)

---

# 1. Introdução
Nos velhos tempos dos terminais de teletipo, os terminais ficavam longe dos computadores e eram conectados a eles por meio de cabos seriais. Os terminais podem ser configurados enviando uma série de bytes.

Todos os recursos (como mover o cursor para um novo local, apagar parte da tela, rolar a tela, alterar os modos,etc.) dos terminais podem ser acessados por meio dessas séries de bytes.

Essas funções de controle são geralmente chamadas de sequências de escape, porque começam com um caractere de escape (`0x1B`). Ainda hoje, com a emulação adequada, podemos enviar sequências de escape para o emulador e obter o mesmo efeito em uma janela de terminal.

Suponha que você queira imprimir uma linha colorida. Tente digitar isso em seu console.
```sh
echo -e "\e[0;31;40mIn Color"
```

O primeiro caractere é um caractere de escape, que se parece com `\e[`. Todos os outros são caracteres normais para impressão. Você deve conseguir ver a string "In Color" em vermelho. Permanece assim e para voltar ao modo original digite isto.
```sh
echo -e "\e[0;3740m"
```

Agora, o que esses caracteres mágicos significam? Difícil de compreender? Eles podem até ser diferentes para terminais diferentes. Portanto, os designers do UNIX inventaram um mecanismo chamado termcap.

É um arquivo que lista todos os recursos de um terminal específico, junto com as sequências de escape necessárias para atingir um determinado efeito. Nos últimos anos, foi substituído pelo terminfo.

Sem se aprofundar muito em detalhes, este mecanismo permite que programas de aplicativos consultem o banco de dados terminfo e obtenham os caracteres de controle a serem enviados a um terminal ou emulador de terminal.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## 1.1. O que é NCURSES ?
Você deve estar se perguntando qual é a importância de todo esse jargão técnico. No cenário acima, todo programa de aplicação deve consultar o terminfo e realizar as coisas necessárias (enviar caracteres de controle, etc.).

Logo se tornou difícil administrar essa complexidade e isso deu origem a 'CURSES'. Curses é um trocadilho com o nome "otimização do cursor". A biblioteca Curses forma um invólucro sobre o trabalho com códigos de terminal brutos e fornece API (Interface de Programação de Aplicativo) altamente flexível e eficiente.

Ele fornece funções para mover o cursor, criar janelas, produzir cores, brincar com o mouse, etc. Os programas aplicativos não precisam se preocupar com as capacidades subjacentes do terminal.

Então, o que é NCURSES? NCURSES é um clone da `curses` originais do SystemV Release 4.0 (SVr4). É uma biblioteca de distribuição gratuita, totalmente compatível com versões anteriores de `curses`.

Resumindo, é uma biblioteca de funções que gerencia a exibição de um aplicativo em terminais de células de caracteres. No restante do documento, os termos `curses` e ncurses são usados alternadamente.

Um histórico detalhado do NCURSES pode ser encontrado no arquivo NEWS da distribuição de origem. O pacote atual é mantido por Thomas Dickey. Você pode contactar os mantenedores em <bug-ncurses@gnu.org>.

## 1.2. O que podemos fazer com NCURSES
NCURSES não apenas cria um invólucro sobre os recursos do terminal, mas também oferece uma estrutura robusta para criar UI (Interface de usuário) de boa aparência em modo de texto. Ele fornece funções para criar janelas, etc.

Seu painel de bibliotecas irmãs, menu e formulário fornecem uma extensão para a biblioteca básica de `curses`. Essas bibliotecas geralmente vêm com `curses`. Pode-se criar aplicativos que contenham várias janelas, menus, painéis e formulários. O Windows pode ser gerenciado de forma independente, pode fornecer "capacidade de rolagem" e até mesmo pode ser escondido.

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

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


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

<!-- RETANGULO LARGO 2 -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:block; text-align:center;"
data-ad-layout="in-article"
data-ad-format="fluid"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="8549252987"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


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
Agradecimentos a **Sharath**, **Emre Akbas**, **Anuradha Ratnaweera** e **Ravi Parimi**. Tradução em Português Brasileiro: **Marcos Oliveira** e **Jovane Rocha**.

> A Tradução dos capítulos: `3. The Gory Details(Os Detalhes Sangrentos)` e `15. Other libraries(Outras Bibliotecas)` não foram feitas por se tratar de capítulos sem tópicos e menos que uma linha, ou seja, só informativo. Logo esses números foram pulados e por esse motivo nesse documento você encontrará 2 capítulos a menos que a documentação original.

## 1.8. Lista de Desejos
Esta é a lista de desejos, em ordem de prioridade. Se você tiver um desejo ou se quiser trabalhar para realizá-lo, envie-me um email.
+ Adicione exemplos às últimas partes da seção de formulários.
+ Prepare um Demo mostrando todos os programas e permita ao usuário navegar pela descrição de cada programa. Deixe o usuário compilar e ver o programa em ação. É preferível uma interface baseada em diálogo.
+ Adicione informações de depuração. _tracef, _tracemouse stuff.
+ Acessando termcap, terminfo usando funções fornecidas pelo pacote ncurses.
+ Trabalhando em dois terminais simultaneamente.
+ Adicione mais coisas à seção diversos.

<!-- RETANGULO LARGO -->
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


## 1.9. Direito autoral

```txt
Copyright Š 2001 by Pradeep Padala.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, distribute with modifications, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE ABOVE COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Except as contained in this notice, the name(s) of the above copyright holders shall not be used in advertising or otherwise to promote the sale, use or other dealings in this Software without prior written authorization._
```

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
A função `initscr()` inicializa o terminal no modo `curses`. Em algumas implementações, ele limpa a tela e apresenta uma tela em branco. Para fazer qualquer manipulação de tela usando o pacote `curses`, isso deve ser chamado primeiro.

Esta função inicializa o sistema `curses` e aloca memória para nossa janela atual (chamada `stdscr`) e algumas outras estruturas de dados. Em casos extremos, esta função pode falhar devido à memória insuficiente para alocar memória para as estruturas de dados da biblioteca de `curses`.

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
Agora sabemos que para inicializar o sistema `curses`, a função `initscr()` deve ser chamada. Existem funções que podem ser chamadas após esta inicialização para personalizar nossa sessão de `curses`.

Podemos pedir ao sistema `curses` para definir o terminal em modo bruto ou inicializar a cor ou inicializar o mouse, etc. Vamos discutir algumas das funções que normalmente são chamadas imediatamente após `initscr()`;

## 3.1. `raw()` e `cbreak()`
Normalmente, o driver do terminal armazena os caracteres que um usuário digita até que uma nova linha ou retorno de carro seja encontrado. Mas a maioria dos programas exige que os caracteres estejam disponíveis assim que o usuário os digitar. As duas funções acima são usadas para desativar o buffer de linha. 

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

A diferença entre essas duas funções está na maneira como os caracteres de controle como suspender (CTRL-Z), interromper e sair (CTRL-C) são passados para o programa. No modo `raw()`, esses caracteres são passados diretamente para o programa sem gerar um sinal.

No modo `cbreak()`, esses caracteres de controle são interpretados como qualquer outro caractere pelo driver do terminal. Eu pessoalmente prefiro usar `raw()` porque posso exercer maior controle sobre o que o usuário faz.

## 3.2. `echo()` e `noecho()`
Essas funções exibem caracteres digitados pelo usuário no terminal. `noecho()` desativa a exibição. O motivo pelo qual você pode querer fazer isso é para obter mais controle sobre imprimir ou suprimir a exibição desnecessária enquanto recebe a entrada do usuário por meio das funções `getch()` etc.

A maioria dos programas interativos chama `noecho()` na inicialização e faz a impressão de caracteres de uma maneira controlada. Dá ao programador a flexibilidade de imprimir caracteres em qualquer lugar da janela sem atualizar as coordenadas atuais (y, x).


## 3.3. `keypad()`
Esta é minha função de inicialização favorita. Ele permite a leitura de teclas de função como `F1`, `F2`, teclas de seta(← ↓ →), etc. Quase todo programa interativo permite isso, já que as teclas de seta são uma parte importante de qualquer interface de usuário.

Faça o teclado (`stdscr`, `TRUE`) para habilitar este recurso para a tela normal (`stdscr`). Você aprenderá mais sobre gerenciamento de teclas em seções posteriores deste documento.

## 3.4. `halfdelay()`
Esta função, embora não seja usada com muita freqüência, é útil às vezes. `halfdelay()` é chamado para habilitar o *modo com atraso*(half-delay), que é semelhante ao modo `cbreak()` em que os caracteres digitados estão imediatamente disponíveis para programação.

No entanto, ele espera por 'X' décimos de segundo pela entrada e retorna ERR, se nenhuma entrada estiver disponível. 'X' é o valor de tempo limite passado para a função `halfdelay()`. Esta função é útil quando você deseja solicitar uma entrada do usuário, e se ele não responder em um determinado tempo, podemos fazer outra coisa.

Um exemplo possível é um tempo limite no prompt de senha.

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
Uma janela é uma tela imaginária definida pelo sistema de `curses`. Quando `curses` é inicializado, ele cria uma janela padrão chamada `stdscr` que representa sua tela. Se estiver realizando tarefas simples, como imprimir algumas strings, ler dados de entrada, etc., você pode usar com segurança esta única janela para todos os seus propósitos.

Você também pode criar janelas e chamar funções que funcionam explicitamente na janela especificada.

Por exemplo, se você chamar:
```cpp
printw("Olá !!!");
refresh();
```
Ele imprime a string em `stdscr` na posição atual do cursor. Da mesma forma, a chamada para `refresh()` funciona apenas em `stdscr`.

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

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
Essas funções colocam um único caractere na localização atual do cursor e avançam a posição do cursor. Você pode fornecer o caractere a ser impresso, mas eles geralmente são usados para imprimir um caractere com alguns atributos.

Os atributos são explicados em detalhes nas seções posteriores do documento. Se um caractere estiver associado a um atributo (negrito, vídeo reverso etc.), quando `curses` imprime o caractere, ele é impresso naquele atributo.

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
Usada para colocar uma string de caracteres em uma determinada janela. Esta função é semelhante a chamar `addch()` uma vez para cada caractere em uma determinada string. Isso é verdadeiro para todas as funções de saída. Existem outras funções desta família, como `mvaddstr()`, `mvwaddstr()` e `waddstr()`, que obedecem à convenção de nomenclatura de `curses`. 

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

(Por exemplo, `mvaddstr()` é semelhante às respectivas chamadas `move()` e depois `addstr()`.) Outra função desta família é `addnstr()`, que recebe um parâmetro inteiro (digamos n) adicionalmente. Esta função coloca no máximo n caracteres na tela. Se *n* for negativo, toda a string será adicionada.

## 5.4. Uma palavra de cautela
Todas essas funções recebem a coordenada y primeiro e depois x em seus argumentos. Um erro comum dos iniciantes é passar x, y nessa ordem. Se você estiver fazendo muitas manipulações de (y, x) coordenadas, pense em dividir a tela em janelas e manipular cada uma separadamente. As janelas são explicadas na seção de janelas.

---

# 6. Funções de entrada 
Classes:
+ `getch()`: Obtenha um caractere
+ `scanw()`: Obtenha uma entrada formatada
+ `getstr()`: Obtenha *strings*

## 6.1. classe de funções `getch()`
Essas funções lêem um único caractere do terminal. Mas existem vários fatos sutis a serem considerados. Por exemplo, se você não usar a função `cbreak()`, ncurses não irá ler seus caracteres de entrada de forma contígua, mas começarão a lê-los somente depois que uma nova linha ou um **EOF** for encontrado.

Para evitar isso, a função `cbreak()` deve ser usada para que os caracteres estejam imediatamente disponíveis para seu programa. Outra função amplamente usada é `noecho()`. Como o nome sugere, quando esta função é configurada (utilizada), os caracteres que são digitados pelo usuário não aparecem na tela.

As duas funções `cbreak()` e `noecho()` são exemplos típicos de gerenciamento de chaves.

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
    mvprintw(LINES - 2, 0, "Você digitou: %s", str);
    getch();
    endwin();

    return 0;
}
```

---

# 7. Atributos
Vimos um exemplo de como os atributos podem ser usados para imprimir caracteres com alguns efeitos especiais. Os atributos, quando definidos com prudência, podem apresentar informações de uma maneira fácil e compreensível. O programa a seguir pega um arquivo C como entrada e imprime o arquivo com comentários em negrito. Leia o código.

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

### Exemplo 5. Um exemplo de atributos simples
```cpp
#include <ncurses.h>
#include <iostream>

int main(int argc, char ** argv ){ 
  int ch, prev, row, col;
  prev = EOF;
  FILE *fp;
  int y, x;

  if(argc != 2){
    std::cout << "Use um nome de arquivo: " << argv[0] << '\n';
    exit(1);
  }
  fp = fopen(argv[1], "r");
  if(fp == NULL)  {
    perror("Não foi possível abrir o arquivo.");
    exit(1);
  }
  initscr();				
  getmaxyx(stdscr, row, col);		
  while((ch = fgetc(fp)) != EOF)  {
    getyx(stdscr, y, x);		
    if(y == (row - 1)){
      printw("<-Pressione qualquer tecla->");	
      getch();
      clear();				
      move(0, 0);			
    }
    
    if(prev == '/' && ch == '*'){
      attron(A_BOLD);			
      getyx(stdscr, y, x);		
      move(y, x - 1);			
      printw("%c%c", '/', ch); 		
    }else{
      printw("%c", ch);
    }
    
    refresh();
    if(prev == '*' && ch == '/'){
      attroff(A_BOLD);
    }
    prev = ch;
  }
  endwin();                       	
  fclose(fp);
  return 0;
}
```

Não se preocupe com toda a inicialização e outras parafernalhas. Concentre-se no loop `while`. Ele lê cada caractere no arquivo e procura o padrão `/*`. Depois de localizar o padrão, ele alterna o atributo **BOLD** com `attron()` . Quando obtemos o padrão `*/`, ele é desativado por `attroff()` .

O programa acima também nos apresenta duas funções úteis `getyx()` e `move()` . A primeira função obtém as coordenadas do cursor atual nas variáveis **y**, **x**. Como `getyx()` é uma macro, não precisamos passar ponteiros para variáveis. A função `move()` move o cursor para as coordenadas fornecidas a ele.

## 7.1 - Os detalhes
Vamos entrar em mais detalhes sobre os atributos. As funções `attron()`, `attroff()`, `attrset()` e suas funções irmãs `attr_get()` etc. podem ser usadas para ligar/desligar atributos, obter atributos e produzir uma exibição colorida.

As funções `attron` e `attroff` pegam uma máscara de bits de atributos e os ativam ou desativam, respectivamente. Os seguintes atributos de vídeo, que são definidos em `<ncurses.h>`, podem ser passados para essas funções.

| Atributo | Explicação |
|----------|------------|
| A_NORMAL | Exibição normal (sem destaque) |
| A_STANDOUT | Melhor modo de destaque do terminal. |
| A_UNDERLINE | Sublinhado |
| A_REVERSE | Vídeo reverso |
| A_BLINK | Piscando |
| A_DIM | meio brilhante |
| A_BOLD | Extra brilhante ou negrito |
| A_PROTECT | Modo protegido |
| A_INVIS | modo invisível ou em branco |
| A_ALTCHARSET | Conjunto de caracteres alternativos |
| A_CHARTEXT | Bit-mask para extrair um caractere |
| COLOR_PAIR | (n) Número do par de cores n  |

O último é o mais colorido 😃 . As cores são explicadas nas próximas seções.

Podemos usar `OR`(`|`) ou qualquer número dos atributos acima para obter um efeito combinado. Se você quisesse vídeo reverso com caracteres piscando, você pode usar
```cpp
attron(A_REVERSE | A_BLINK);
```

---

## 7.2 `attron()` vs `attrset()`
Então, qual é a diferença entre `attron()` e `attrset()`? attrset define os atributos de janela, enquanto attron apenas ativa o atributo fornecido a ele.

Assim, `attrset()` sobrescreve totalmente quaisquer atributos que a janela tinha anteriormente e os define para o(s) nov (s) atributo(s). Similarmente, `attroff()` apenas desliga o(s) atributo(s) fornecido(s) a ele como um argumento.

Isso nos dá a flexibilidade de gerenciar atributos facilmente. Mas se você usá-los sem cuidado, pode perder o controle de quais atributos a janela tem e distorcer a exibição.

Isso é especialmente verdadeiro durante o gerenciamento de menus com cores e realces. Portanto, decida uma política consistente e cumpra-a. Você sempre pode usar `standend()`, que é equivalente a `attrset(A_NORMAL)`, que desativa todos os atributos e leva você ao modo normal.

## 7.3. attr_get()
A função `attr_get()` obtém os atributos atuais e o par de cores da janela. Embora possamos não usar isso tão freqüentemente quanto as funções acima, isso é útil para escanear áreas da tela.

Digamos que queremos fazer alguma atualização complexa na tela e não temos certeza de qual atributo cada personagem está associado. Então, essa função pode ser usada com `attrset` ou `attron` para produzir o efeito desejado.

## 7.4. attr_ functions
Existem séries de funções como `attr_set()`, `attr_on`, etc. Estas são semelhantes às funções acima, exceto que tomam parâmetros do tipo `attr_t`.

## 7.5. funções wattr
Para cada uma das funções acima, temos uma função correspondente com 'w' que opera em uma janela específica. As funções acima operam em `stdscr`.

## 7.6. funções chgat()
A função `chgat()` está listada no final da página do manual `curs_attr`. Na verdade, é útil. Esta função pode ser usada para definir atributos para um grupo de personagens sem se mover. Quero dizer !!! sem mover o cursor 😃 . Ele muda os atributos de um determinado número de caracteres começando na posição atual do cursor.

Podemos dar **-1** como a contagem de caracteres para atualizar até o final da linha. Se você quiser alterar os atributos dos caracteres da posição atual até o final da linha, basta usar isso.
```cpp
chgat(-1, A_REVERSE, 0, NULL);
```

Esta função é útil ao alterar atributos de caracteres que já estão na tela. Vá até o caractere do qual deseja alterar e altere o atributo.

Outras funções `wchgat()`, `mvchgat()`, `wchgat()` se comportam de maneira semelhante, exceto que as funções `w` operam na janela específica. As funções `m`v primeiro movem o cursor e depois executam o trabalho que lhes foi atribuído. Na verdade, `chgat` é uma macro que é substituída por `wchgat()` com stdscr como janela. A maioria das funções "w-less" são macros.

*Exemplo 6. Usando `chgat`*

```cpp
#include <ncurses.h>

int main(int argc, char ** argv){
  initscr();
  start_color();

  init_pair(1, COLOR_CYAN, COLOR_BLACK);
  printw("Uma string grande que eu não me importei em digitar completamente ...");
  mvchgat(0, 0, -1, A_BLINK, 1, NULL);	

  refresh();
  getch();
  endwin();
  return 0;
}
```

Este exemplo também nos apresenta ao mundo das cores das Ncurses. As cores serão explicadas em detalhes posteriormente. Use 0 para nenhuma cor.

---

# 8. Janelas
As janelas constituem o conceito mais importante em curses. Você viu a janela padrão stdscr acima, onde todas as funções operavam implicitamente nessa janela. Agora, para tornar o design ainda mais simples da GUI, você precisa recorrer a janelas.

O principal motivo pelo qual você pode querer usar janelas é manipular partes da tela separadamente, para melhor eficiência, atualizando apenas as janelas que precisam ser alteradas e para um melhor design.

Eu diria que o último motivo é o mais importante na escolha de janelas. Você deve sempre se esforçar para ter um design melhor e fácil de gerenciar em seus programas. Se você estiver escrevendo GUIs grandes e complexas, isso é de fundamental importância antes de começar a fazer qualquer coisa.

## 8.1. O básico
Uma janela pode ser criada chamando a função `newwin()`. Na verdade, isso não cria nada na tela. Ela aloca memória para uma estrutura para manipular a janela e atualiza a estrutura com dados relativos à janela como seu tamanho, `beginy`, `beginx`, etc.

Portanto, em curses, uma janela é apenas uma abstração de uma janela imaginária, que pode ser manipulada independentemente de outras partes da tela. A função `newwin()` retorna um ponteiro para a estrutura **WINDOW**, que pode ser passado para funções relacionadas à janela como `wprintw()` etc.

Finalmente, a janela pode ser destruída com `delwin()`. Isso irá desalocar a memória associada à estrutura da janela.

## 8.2. Que haja uma janela!!!
Qual a graça de criar uma janela  e não vê-la? Portanto, a parte divertida começa exibindo a janela. A função `box()` pode ser usada para desenhar uma borda ao redor da janela. Vamos explorar essas funções com mais detalhes neste exemplo.

*Exemplo 7. Exemplo de Borda da janela*

```cpp
#include <ncurses.h>

WINDOW *create_newwin(int height, int width, int starty, int startx);
void destroy_win(WINDOW *local_win);

int main(int argc, char *argv[]){
  WINDOW *my_win;
  int startx, starty, width, height;
  int ch;

  initscr();			/* Inicia o modo curses */
  cbreak();		    	/* Buffer de linha desativado, passe tudo para mim  */
  keypad(stdscr, TRUE);		/* Eu preciso daquele F1 bacana	*/
  noecho();
  curs_set( false );

  height = 3;
  width = 10;
  starty = (LINES - height) / 2;  /* Calculando para um posicionamento central */
  startx = (COLS - width) / 2;	  /* da janela */
  printw("Pressione F1 para sair");
  refresh();
  my_win = create_newwin(height, width, starty, startx);

  while((ch = getch()) != KEY_F(1)){
    switch(ch){
      case KEY_LEFT:
        destroy_win(my_win);
        my_win = create_newwin(height, width, starty,--startx);
        break;
      case KEY_RIGHT:
        destroy_win(my_win);
        my_win = create_newwin(height, width, starty,++startx);
        break;
      case KEY_UP:
        destroy_win(my_win);
        my_win = create_newwin(height, width, --starty,startx);
        break;
      case KEY_DOWN:
        destroy_win(my_win);
        my_win = create_newwin(height, width, ++starty,startx);
        break;	
    }
  }

  endwin();			/* Termina o modo curses */
  return 0;
}

WINDOW *create_newwin(int height, int width, int starty, int startx){
  WINDOW *local_win;

  local_win = newwin(height, width, starty, startx);
  box(local_win, 0 , 0);		/* 0, 0 dá caracteres padrão para as linhas verticais and horizontais	*/
  wrefresh(local_win);		/* Mostra aquela caixa 	*/

  return local_win;
}

void destroy_win(WINDOW *local_win){	
  /* box (local_win, '', ''); : Isso não produzirá o resultado
    *  desejado de apagar a janela. Vai deixar seus quatro cantos,
    * e uma lembrança feia da janela.
  */
      wborder (local_win, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ');
  /* Os parâmetros usados são
    * 1. win: a janela na qual operar
    * 2. ls: caractere a ser usado para o lado esquerdo da janela
    * 3. rs: caractere a ser usado para o lado direito da janela
    * 4. ts: caractere a ser usado na parte superior da janela
    * 5. bs: caractere a ser usado na parte inferior da janela
    * 6. tl: caractere a ser usado para o canto superior esquerdo da janela
    * 7. tr: caractere a ser usado no canto superior direito da janela
    * 8. bl: caractere a ser usado no canto inferior esquerdo da janela
    * 9. br: caractere a ser usado no canto inferior direito da janela
    */
    wrefresh(local_win);
    delwin(local_win);
}
```

## 8.3. Explicação
Não grite. Eu sei que é um exemplo grande. Mas tenho que explicar algumas coisas importantes aqui 😃 . Este programa cria uma janela retangular que pode ser movida com as teclas de seta para a esquerda, para a direita, para cima e para baixo.

Ele cria e destrói repetidamente janelas quando o usuário pressiona uma tecla. Não ultrapasse os limites da tela. Verificar esses limites fica como um exercício para o leitor. Vamos dissecar linha por linha.

A função `create_newwin()` cria uma janela com `newwin()` e exibe uma borda ao redor com uma caixa. A função `destroy_win()` primeiro apaga a janela da tela pintando uma borda com o caractere `''` e, em seguida, chamando `delwin()` para desalocar a memória relacionada a ela. Dependendo da tecla que o usuário pressionar, `starty` ou `startx` é alterado e uma nova janela é criada.

No `destroy_win`, como você pode ver, usei `wborder` em vez de `box`. O motivo está escrito nos comentários (Você pulou. Eu sei. Leia o código 😃 ). `wborder` desenha uma borda ao redor da janela com os caracteres atribuídos a ela como os 4 pontos de canto e as 4 linhas. Para ser mais claro, se você tiver chamado wborder conforme abaixo:

`wborder(win, '|', '|', '-', '-', '+', '+', '+', '+')`;

isso produz algo como
```sh
    +------------+
    |            |
    |            |
    |            |
    |            |
    |            |
    |            |
    +------------+
```

## 8.4. As outras coisas no exemplo
Você também pode ver nos exemplos acima, que usei as variáveis `COLS`, `LINES` que são inicializadas para os tamanhos de tela após `initscr()`. Elas podem ser úteis para encontrar as dimensões da tela e encontrar a coordenada central da tela como acima. A função `getch()`, como de costume, pega a tecla do teclado e de acordo com a tecla faz o trabalho correspondente.

Este tipo de switch-case é muito comum em qualquer programa baseado em GUI.

## 8.5. Outras funções de Borda
O programa acima é extremamente ineficiente, pois a cada pressionamento de uma tecla, uma janela é destruída e outra é criada. Então, vamos escrever um programa mais eficiente que use outras funções relacionadas a bordas.

O programa a seguir usa `mvhline()` e `mvvline()` para obter um efeito semelhante. Essas duas funções são simples. Elas criam uma linha horizontal ou vertical do comprimento especificado na posição especificada.

*Exemplo 8. Mais funções de bordas*

```cpp
#include <ncurses.h>

typedef struct _win_border_struct {
  chtype 	ls, rs, ts, bs,
                tl, tr, bl, br;
}WIN_BORDER;

typedef struct _WIN_struct {

  int startx, starty;
  int height, width;
  WIN_BORDER border;
}WIN;

void init_win_params(WIN *p_win);
void print_win_params(WIN *p_win);
void create_box(WIN *win, bool flag);

int main(int argc, char *argv[]){
  WIN win;
  int ch;

  initscr();
  start_color(); /* Começa a funcionalidade das cores */
  cbreak();      /* Buffer de linha desativado, passe tudo para mim */
  keypad(stdscr, TRUE);		/* Preciso daquele F1 bacana */
  noecho();
  curs_set( false );
  init_pair(1, COLOR_CYAN, COLOR_BLACK);

  /* Inicializa os parâmetros da janela */
  init_win_params(&win);
  print_win_params(&win);

  attron(COLOR_PAIR(1));
  printw("Pressione F1 para sair");
  refresh();
  attroff(COLOR_PAIR(1));

  create_box(&win, TRUE);
  while( (ch = getch()) != KEY_F(1) ){
    switch(ch){
      case KEY_LEFT:
      create_box(&win, FALSE);
      --win.startx;
      create_box(&win, TRUE);
      break;
      case KEY_RIGHT:
      create_box(&win, FALSE);
      ++win.startx;
      create_box(&win, TRUE);
      break;
      case KEY_UP:
      create_box(&win, FALSE);
      --win.starty;
      create_box(&win, TRUE);
      break;
      case KEY_DOWN:
      create_box(&win, FALSE);
      ++win.starty;
      create_box(&win, TRUE);
      break;
    }
  }
  endwin();
  return 0;
}

void init_win_params(WIN *p_win){

  p_win->height = 3;
  p_win->width = 10;
  p_win->starty = (LINES - p_win->height)/2;
  p_win->startx = (COLS - p_win->width)/2;

  p_win->border.ls = '|';
  p_win->border.rs = '|';
  p_win->border.ts = '-';
  p_win->border.bs = '-';
  p_win->border.tl = '+';
  p_win->border.tr = '+';
  p_win->border.bl = '+';
  p_win->border.br = '+';

}
void print_win_params(WIN *p_win){
#ifdef _DEBUG
  mvprintw(25, 0, "%d %d %d %d", p_win->startx, p_win->starty,
      p_win->width, p_win->height);
  refresh();
#endif
}

void create_box(WIN *p_win, bool flag){
  int i, j;
  int x, y, w, h;

  x = p_win->startx;
  y = p_win->starty;
  w = p_win->width;
  h = p_win->height;

  if(flag == TRUE){
    mvaddch(y, x, p_win->border.tl);
    mvaddch(y, x + w, p_win->border.tr);
    mvaddch(y + h, x, p_win->border.bl);
    mvaddch(y + h, x + w, p_win->border.br);
    mvhline(y, x + 1, p_win->border.ts, w - 1);
    mvhline(y + h, x + 1, p_win->border.bs, w - 1);
    mvvline(y + 1, x, p_win->border.ls, h - 1);
    mvvline(y + 1, x + w, p_win->border.rs, h - 1);

  }else{
    for(j = y; j <= y + h; ++j){
      for(i = x; i <= x + w; ++i){
        mvaddch(j, i, ' ');
      }
    }

    refresh();
  }
}
```

---

# 9. Cores
## 9.1. O básico
A vida parece monótona sem cores. Ncurses tem um bom mecanismo para lidar com cores. Vamos entrar no assunto com um pequeno programa.

*Exemplo 9. Um simples exemplo com cores*

```cpp
#include <ncurses.h>
#include <cstring>

void print_in_middle(WINDOW *win, int starty, int startx, int width, char *string);
int main(int argc, char ** argv ){
  initscr();
  if(has_colors() == FALSE){
    endwin();
    printf("Seu terminal não suporta cores.\n");
    return 1;
  }
  start_color(); // Inicia as cores
  init_pair(1, COLOR_RED, COLOR_BLACK);

  char str[] = "Se liga nessa, mermão!";
  attron(COLOR_PAIR(1));
  print_in_middle(stdscr, LINES / 2, 0, 0, str);
  attroff(COLOR_PAIR(1));
  getch();
  endwin();
}

void print_in_middle(WINDOW *win, int starty, int startx, int width, char *string){
  int length, x, y;
  float temp;

  if(win == NULL)
    win = stdscr;
  getyx(win, y, x);
  if(startx != 0)
    x = startx;
  if(starty != 0)
    y = starty;
  if(width == 0)
    width = 80;

  length = strlen(string);
  temp = (width - length)/ 2;
  x = startx + (int)temp;
  mvwprintw(win, y, x, "%s", string);
  refresh();
}
```

Como você pode ver, para começar a usar cores, você deve primeiro chamar a função `start_color()`.

Depois disso, você pode usar os recursos de cores de seus terminais usando várias funções. Para descobrir se um terminal tem cor capacidades ou não, você pode usar `has_colors()` função, que retorna *FALSE* se o terminal não suportar cores.

Ncurses inicializa todas as cores suportadas pelo terminal quando `start_color()` é chamado. Elas podem ser acessados pelas constantes de definição, como *COLOR_BLACK* etc. Agora, para realmente começar a usar cores, você deve definir pares. As cores são sempre usadas em pares. 

Isso significa que você tem que usar a função `init_pair()` para definir o primeiro plano e o fundo para o número do par que você fornecer. Depois disso, o número do par pode ser usado como um atributo normal com a função `COLOR_PAIR()`.

Isso pode parecer complicado no início. Mas esta solução elegante nos permite gerenciar pares de cores muito facilmente. Para apreciá-lo, você tem que olhar para o código fonte de "diálogo", um utilitário para exibir caixas de diálogo a partir de scripts [shell](https://terminalroot.com.br/shell).

Os desenvolvedores definiram combinações de primeiro e segundo plano para todas as cores de que podem precisar e inicializaram no início. Isso torna muito fácil definir atributos apenas acessando um par que já definimos como uma constante. 

As seguintes cores são definidas em curses.h. Você pode usá-las como parâmetros para várias funções de cor.
```sh
COLOR_BLACK 	0
COLOR_RED   	1
COLOR_GREEN 	2
COLOR_YELLOW 	3
COLOR_BLUE	4
COLOR_MAGENTA   5
COLOR_CYAN	6
COLOR_WHITE	7
```

## 9.2. Alterando definições de cores
A função `init_color()`pode ser usada para alterar os valores rgb para as cores definidas por curses inicialmente.

Digamos que você queira aumentar a intensidade da cor vermelha de uma forma ínfima. Então você pode usar esta função como
```cpp
 init_color(COLOR_RED, 700, 0, 0);
    /* param 1     : color name
     * param 2, 3, 4 : rgb content min = 0, max = 1000 */
```

Se o seu terminal não puder alterar as definições de cor, a função retornará *ERR*. A função `can_change_color()` pode ser usada para descobrir se o terminal tem a capacidade de alterar o conteúdo de cores ou não. O conteúdo **rgb** é dimensionado de 0 a 1000. Inicialmente a cor RED (VERMELHA) é definida com conteúdo 1000(r), 0(g), 0(b).

## 9.3. Conteúdo de cores
As funções `color_content()` e `pair_content()` podem ser usadas para encontrar o conteúdo de cores e a combinação de primeiro e segundo plano para o par.

---

# 10. Interface com o teclado
## 10.1. Princípios Básicos
Nenhuma GUI é completa sem uma interface de usuário forte para interagir com o usuário, um programa em curses deve ser sensível ao pressionar das teclas ou às ações do mouse feitas pelo usuário. Vamos lidar com as teclas primeiro.

Como você já viu em quase todos os exemplos acima, é muito fácil obter entrada do usuário pelo teclado. Uma maneira simples de obter as teclas pressionadas é usar a função `getch()`.

O modo `cbreak` deve ser habilitado para ler as teclas quando você estiver interessado em ler teclas individuais pressionadas em vez de linhas de texto completas (que geralmente terminam com um retorno de carro). `keypad` deve ser habilitado para obter as teclas Functions, teclas de seta etc. Consulte a seção de inicialização para obter detalhes.

`getch()` retorna um inteiro correspondente à tecla pressionada. Se for um caractere normal, o valor inteiro será equivalente ao caractere. Caso contrário, ele retorna um número que pode ser combinado com as constantes definidas em `curses.h`. Por exemplo, se o usuário pressionar `F1`, o inteiro retornado é **265**. Isso pode ser verificado usando a macro `KEY_F()` definida em `curses.h`. 

Isso torna as teclas de leitura portáteis e fáceis de gerenciar. 

Por exemplo, se você chamar `getch()` assim
```cpp
int ch;
ch = getch();
```

`getch()` aguardará que o usuário pressione uma tecla (a menos que você tenha especificado um tempo limite) e quando o usuário pressionar uma tecla, o inteiro correspondente é devolvido. Em seguida, você pode verificar o valor devolvido com as constantes definidas em curses.h para combinar com as teclas que você deseja.

O código a seguir fará esse trabalho.

```cpp
if(ch == KEY_LEFT)
printw ("Seta esquerda está pressionada\n");
```

Vamos escrever um pequeno programa que cria um menu que pode ser navegado por setas para cima e para baixo.

## 10.2. Um exemplo de uso simples de teclas

Example 10. Um exemplo de uso simples de teclas
```cpp
#include <iostream>
#include <ncurses.h>
#include <vector>

#define WIDTH 30
#define HEIGHT 10

int startx = 0;
int starty = 0;

//char * choices[] = {
//  "Escolha 1",
//  "Escolha 2",
//  "Escolha 3",
//  "Escolha 4",
//  "Sair"
//};

std::vector<std::string> choices = {"Uma", "Duas", "Três", "Quatro", "Sair"};

//int n_choices = sizeof(choices) / sizeof(char *);
int n_choices = choices.size();
void print_menu(WINDOW *menu_win, int highlight);

int main(){
  WINDOW *menu_win;
  int highlight = 1;
  int choice = 0;
  int c;

  initscr();
  clear();
  noecho();
  cbreak();       /* Buffer de linha desativado. passa tudo */
  startx = (80 - WIDTH) / 2;
  starty = (24 - HEIGHT) / 2;

  menu_win = newwin(HEIGHT, WIDTH, starty, startx);
  keypad(menu_win, TRUE);
  mvprintw(0, 0, "Use as setas para subir e descer, pressione Enter para selecionar uma escolha");
  refresh();
  print_menu(menu_win, highlight);
  while( true ){
    c = wgetch(menu_win);
    switch(c){
      case KEY_UP:
        if(highlight == 1){
          highlight = n_choices;
        }else{
          --highlight;
        }

        break;
      case KEY_DOWN:
        if(highlight == n_choices)
          highlight = 1;
        else
          ++highlight;
        break;
      case 10:
        choice = highlight;
        break;
      default:
        mvprintw(24, 0, "                                                                       ");
        refresh();
        mvprintw(24, 0, "O número do caractere que você digitou é = %3d e corresponde à: '%c'", c, c);
        refresh();
        break;
    }

    print_menu(menu_win, highlight);

    if( choice != 0 ){
      mvprintw(23, 0, "                            ");
      refresh();
      mvprintw(23, 0, "Você escolheu o número: %d", choice);
      refresh();
    }

    if(choice == 5){ /* O usuário fez uma escolha que saiu do loop infinito */
      break;
    }
  }


  clrtoeol();
  refresh();
  endwin();
  return 0;
}


void print_menu(WINDOW *menu_win, int highlight){
  int x, y, i;

  x = 2;
  y = 2;
  box(menu_win, 0, 0);
  for(i = 0; i < n_choices; ++i){
    if(highlight == i + 1){ /* Destaca a escolha atual */
      wattron(menu_win, A_REVERSE);
      mvwprintw(menu_win, y, x, "%s", &choices[i][0]);
      wattroff(menu_win, A_REVERSE);
    }else{
      mvwprintw(menu_win, y, x, "%s", &choices[i][0]);
    }
    ++y;
  }
  wrefresh(menu_win);
}
```

---

# 11. Interface com o mouse
Agora que você viu como obter as teclas, vamos fazer a mesma coisa do mouse. Geralmente, cada UI (interface do usuário) permite que o usuário interaja tanto com o teclado quanto com o mouse.

## 11.1. O Básico
Antes de fazer qualquer outra coisa, os eventos que você deseja receber devem ser habilitados com  mousemask().
```cpp
mousemask  (mmask_t newmask,   /* Os eventos que você quer ouvir */
mmask_t *oldmask)  /* A máscara de eventos antigos */
```

O primeiro parâmetro da função acima é uma máscara de bits de eventos que você gostaria de ouvir. Por padrão, todos os eventos estão desligados. A máscara de bits `ALL_MOUSE_EVENTS` pode ser usada para obter todos os eventos.

A seguir, todas as máscaras de evento:
```txt
Nome  Descrição
---------------------------------------------------------------------

BUTTON1_PRESSED           botão do mouse 1 para baixo

BUTTON1_RELEASED          botão do mouse 1 para cima

BUTTON1_CLICKED           botão 1 do mouse clicado

BUTTON1_DOUBLE_CLICKED    botão 1 do mouse clicado duas vezes

BUTTON1_TRIPLE_CLICKED    botão 1 do mouse clicado três vezes

BUTTON2_PRESSED           botão 2 do mouse para baixo

BUTTON2_RELEASED          botão 2 do mouse para cima

BUTTON2_CLICKED           botão 2 do mouse clicado

BUTTON2_DOUBLE_CLICKED    botão 2 do mouse clicado duas vezes

BUTTON2_TRIPLE_CLICKED    botão 2 do mouse clicado três vezes

BUTTON3_PRESSED           botão 3 do mouse para baixo

BUTTON3_RELEASED          botão 3 do mouse para cima

BUTTON3_CLICKED           botão 3 do mouse clicado

BUTTON3_DOUBLE_CLICKED    botão 3 do mouse clicado duas vezes

BUTTON3_TRIPLE_CLICKED    botão 3 do mouse clicado três vezes

BUTTON4_PRESSED           botão 4 do mouse para baixo

BUTTON4_RELEASED          botão 4 do mouse para cima

BUTTON4_CLICKED           botão 4 do mouse clicado

BUTTON4_DOUBLE_CLICKED    botão 4 do mouse clicado duas vezes

BUTTON4_TRIPLE_CLICKED    botão 4 do mouse clicado três vezes

BUTTON_SHIFT              shift pressionado durante a mudança de estado do botão

BUTTON_CTRL               ctrl pressionado durante a mudança de estado do botão

BUTTON_ALT                alt pressionado urante a mudança de estado de botão

ALL_MOUSE_EVENTS          relata todas as alterações do estado de botão

REPORT_MOUSE_POSITION     relata movimento do mouse
```

## 11.2. Obtendo os eventos
Uma vez que uma classe de eventos de mouse tenham sido habilitados, a classe getch() de funções retorna KEY_MOUSE cada vez que algum evento do mouse acontece. Em seguida, o evento do mouse pode ser recuperado com getmouse().

O código fica assim aproximadamente:

```cpp
MEVENT event;

ch = getch();
if(ch == KEY_MOUSE){
  if(getmouse(&event) == OK){
    /* Faça algo com esse evento */
  }
}
```
`getmouse()` retorna o evento para o ponteiro dado a ele. É uma estrutura que contém 

```cpp
typedef struct{
  short id;         /* ID para distinguir vários dispositivos */
  int x, y, z;      /* coordenadas do evento */
  mmask_t bstate;   /* bits de estado do botão */
}
```

O `bstate` é a principal variável que nos interessa. Isso informa o estado do botão do mouse. Então, com um trecho de código como o seguinte, podemos descobrir o que aconteceu.

## 11.3. Resumindo Tudo
Isso é basicamente uma interface com o mouse. Vamos  criar o mesmo menu e permitir interação com o menu. Para fazer as coisas mais simples, o manuseio de tecla é removido.

*Exemplo 11. Acesse o menu com mouse!!!*

```sh
#include <ncurses.h>

#define WIDTH 30
#define HEIGHT 10 

int startx = 0;
int starty = 0;

char *choices[] = {
  "Escolha 1",
  "Escolha 2",
  "Escolha 3",
  "Escolha 4",
  "Sair",
};

int n_choices = sizeof(choices) / sizeof(char *);

void print_menu(WINDOW *menu_win, int highlight);
void report_choice(int mouse_x, int mouse_y, int *p_choice);

int main(){
  int c, choice = 0;
  WINDOW *menu_win;
  MEVENT event;

  /* Initialize curses */
  initscr();
  clear();
  noecho();
  cbreak();	// Buffer de linha desativado. passa tudo

  /* Tenta colocar a janela no meio da tela */
  startx = (80 - WIDTH) / 2;
  starty = (24 - HEIGHT) / 2;

  attron(A_REVERSE);
  mvprintw(23, 1, "Clique em Sair para sair (funciona melhor em um console virtual)");
  refresh();
  attroff(A_REVERSE);

  /* Imprime o menu pela primeira vez */
  menu_win = newwin(HEIGHT, WIDTH, starty, startx);
  print_menu(menu_win, 1);
  /* Get all the mouse events */
  mousemask(ALL_MOUSE_EVENTS, NULL);

  while(1){
    c = wgetch(menu_win);
    switch(c){
      case KEY_MOUSE:
        if(getmouse(&event) == OK){
          /* Quando o usuário clica com o botão esquerdo do mouse */
          if(event.bstate & BUTTON1_PRESSED){
            report_choice(event.x + 1, event.y + 1, &choice);
            if(choice == -1) //Exit chosen
              goto end;
            mvprintw(22, 1, "A escolha feita é :% d String escolhida é\"%10s\"", choice, choices[choice - 1]);
            refresh(); 
          }
        }
        print_menu(menu_win, choice);
        break;
    }
  }		
end:
  endwin();
  return 0;
}


void print_menu(WINDOW *menu_win, int highlight){
  int x, y, i;	

  x = 2;
  y = 2;
  box(menu_win, 0, 0);
  for(i = 0; i < n_choices; ++i){
    if(highlight == i + 1){
      wattron(menu_win, A_REVERSE); 
      mvwprintw(menu_win, y, x, "%s", choices[i]);
      wattroff(menu_win, A_REVERSE);
    }else{
      mvwprintw(menu_win, y, x, "%s", choices[i]);
    }
    ++y;
  }
  wrefresh(menu_win);
}

/* Relata a escolha de acordo com a posição do mouse */
void report_choice(int mouse_x, int mouse_y, int *p_choice){
  int i,j, choice;

  i = startx + 2;
  j = starty + 3;

  for(choice = 0; choice < n_choices; ++choice){
    if(mouse_y == j + choice && mouse_x >= i && mouse_x <= i + strlen(choices[choice])){
      if(choice == n_choices - 1)
        *p_choice = -1;		
      else
        *p_choice = choice + 1;	
      break;
    }
  }
}
```

## 11.4. Funções diversas
As funções `mouse_trafo()` e `wmouse_trafo()` podem ser usadas para converter em coordenadas de mouse para coordenadas relativas à tela. 
Consulte a página do manual `curs_mouse` (3X) para obter detalhes.

A função `mouseinterval` define o tempo máximo (em milhares de segundo) que pode decorrer entre eventos de pressionamento e de liberação para que eles sejam reconhecidos como um clique. Esta função retorna o valor do intervalo anterior. O padrão é um quinto de segundo.

---

# 12. Manipulação de tela
Nesta seção, vamos olhar para algumas funções, que nos permitem gerenciar a tela de forma eficiente e escrever alguns programas extravagantes. Isso é especialmente importante na escrita de jogos.

## 12.1. funções `getyx()`
A função `getyx()` pode ser usada para descobrir as coordenadas do cursor atual. Ela preencherá os valores das coordenadas **x** e **y** nos argumentos que lhe foram dados. Uma vez que `getyx()` é uma macro você não precisa passar o endereço das variáveis.

Ela pode ser chamada assim
```cpp
getyx(win, y, x);
/* win: ponteiro da janela
*   y, x: as coordenadas y, x serão colocadas nestas variáveis
*/
```

A função `getparyx()` recebe as coordenadas iniciais da subjanela em relação à janela principal. Isso é algumas vezes útil para atualizar uma subjanela. Ao projetar coisas extravagantes como escrever vários menus, torna-se difícil armazenar as posições do menu, sua primeira opção de coordenada, etc.

Uma simples solução para esse problema é criar menus nas subjanelas e depois encontrar as coordenadas iniciais dos menus ao usar `getparyx()`.

As funções `getbegyx()` e `getmaxyx()` armazenam as coordenadas de início e máximo da janela atual. Essas funções são úteis da mesma forma que as acima, para gerenciar as janelas e subjanelas de maneira eficaz.

## 12.2. Dumping (Despejo) de tela
Ao escrever jogos, às vezes se torna necessário armazenar o estado da tela e restaurá-lo ao mesmo estado. A função `scr_dump()` pode ser usada para despejar o conteúdo da tela em um arquivo fornecido como argumento.

Depois, escrever duas funções simples podem ser usadas de forma eficaz para manter um jogo em movimento rápido com cenários variáveis.

## 12.3. Dumping (Despejo) de janelas
Para armazenar e restaurar janelas, as funções `putwin()` e `getwin()` podem ser usadas. `putwin()` coloca o estado atual da janela em um arquivo, que pode ser restaurado posteriormente por `getwin()`.

 A função `copywin()` pode ser usado para copiar uma janela inteira para outra janela. Ela toma as janelas de origem e destino como parâmetros e, de acordo com o retângulo especificado, copia a região retangular da janela de origem para a de destino.

Seu último parâmetro especifica se se deve sobrescrever ou apenas se sobrepor o conteúdo na janela de destino. Se esse argumento for verdadeiro, a cópia não é destrutiva.

---

# 13. Recursos diversos
Agora você conhece recursos suficientes para escrever um bom programa com curses, com todos esses enfeites. Existem algumas funções diversas que são úteis em vários casos. Vamos direto a alguns deles.

## 13.1. `curs_set()`

Esta função pode ser usada para tornar o cursor invisível. O parâmetro para esta função deve ser
```sh
0 : invisível ou
1 : normal ou
2 : muito visível.
```

## 13.2. Saindo temporariamente do modo Curses
Algumas vezes você pode querer voltar ao modo cooked (modo de buffer de linha normal) temporariamente. Nesse caso, você primeiro precisa salvar os modos `tty` com uma chamada para `def_prog_mode()` e então chamar `endwin()` para encerrar o modo curses.

Isso o deixará no modo `tty` original. Para voltar ao curses uma vez estiver pronto, chame `reset_prog_mode()`.

Esta função retorna o `tty` ao estado armazenado por `def_prog_mode()`. Depois, chame `refreh()`, e você está de volta ao modo curses. Aqui está um exemplo mostrando a sequência de coisas a serem feitas.

*Exemplo 12. Saindo temporariamente do modo curses*

```cpp
#include <ncurses.h>
#include <cstdlib>

int main(){	

  initscr();			// Inicia o modo curses 		  
  printw("Hello World !!!\n");	// Imprime Hello World		  
  refresh();			// Imprime na tela real 
  def_prog_mode();		// Salva o modo tty 		  
  endwin();			// Termina o modo curses temporariamente	  
  system("/bin/sh");		// Faça o que quiser no modo cooked 
  reset_prog_mode();		// Retornar ao modo tty anterior armazenado por def_prog_mode() 	  
  refresh();			// Faça refresh() para restaurar os conteúdos da tela		  
  printw("Another String\n");	// De volta ao curses, use a capacidade    
  refresh();			//  completa do curses 
  endwin();			// Termina o modo curses		  

  return 0;
}
```

## 13.3. Variáveis `ACS`
Se você já programou no **DOS**, você sabe sobre esses caracteres bacanas no conjunto de caracteres estendidos. Eles podem ser impressos apenas em alguns terminais. Funções NCURSES como `box()` usam esses caracteres.

Todas essas variáveis começam com `ACS`, significando um conjunto de caracteres alternativos. Você deve ter me notado usando esses caracteres em alguns dos programas acima. Aqui está um exemplo mostrando todos os caracteres.

*Exemplo 13. Exemplo de variáveis ACS*

```sh
#include <ncurses.h>

int main(){
  initscr ();

  printw("Canto superior esquerdo"); addch(ACS_ULCORNER); printw("\n");
  printw("Canto inferior esquerdo"); addch(ACS_LLCORNER); printw("\n");
  printw("Canto inferior direito"); addch(ACS_LRCORNER); printw("\n");
  printw("Tee apontando para a direita"); addch(ACS_LTEE); printw("\n");
  printw("Tee apontando para a esquerda"); addch(ACS_RTEE); printw("\n");
  printw("Tee apontando para cima"); addch(ACS_BTEE); printw("\n");
  printw("Tee apontando para baixo"); addch(ACS_TTEE); printw("\n");
  printw("Linha horizontal"); addch(ACS_HLINE); printw("\n");
  printw("Linha vertical"); addch(ACS_VLINE); printw("\n");
  printw("Large Plus ou cross over"); addch(ACS_PLUS); printw("\n");
  printw("Scan Line 1"); addch(ACS_S1); printw("\n");
  printw("Scan Line 3"); addch(ACS_S3); printw("\n");
  printw("Scan Line 7"); addch(ACS_S7); printw("\n");
  printw("Scan Line 9"); addch(ACS_S9); printw("\n");
  printw("Diamante"); addch(ACS_DIAMOND); printw("\n");
  printw("Tabuleiro de damas (pontilhado)"); addch(ACS_CKBOARD); printw("\n");
  printw("Símbolo de grau"); addch(ACS_DEGREE); printw("\n");
  printw("Símbolo de mais / menos"); addch(ACS_PLMINUS); printw("\n");
  printw("Marca"); addch(ACS_BULLET); printw("\n");
  printw("Seta apontando para a esquerda"); addch(ACS_LARROW); printw("\n");
  printw("Seta apontando para a direita"); addch(ACS_RARROW); printw("\n");
  printw("Seta apontando para baixo"); addch(ACS_DARROW); printw("\n");
  printw("Seta apontando para cima"); addch(ACS_UARROW); printw("\n");
  printw("Tabuleiro de quadrados"); addch(ACS_BOARD); printw("\n");
  printw("Símbolo da Lanterna"); addch(ACS_LANTERN); printw("\n");
  printw("Bloco Quadrado Sólido"); addch(ACS_BLOCK); printw("\n");
  printw("Sinal de menos/igual"); addch(ACS_LEQUAL); printw("\n");
  printw("Sinal maior/igual"); addch(ACS_GEQUAL); printw("\n");
  printw("Pi"); addch(ACS_PI); printw("\n");
  printw("Diferente"); addch(ACS_NEQUAL); printw("\n");
  printw("Sinal de libra do Reino Unido"); addch(ACS_STERLING); printw("\n");

  refresh();
  getch ();
  endwin ();

  return 0;
}
```

---

# 14. Biblioteca do painel
Agora que você é perito em curses, talvez você queira fazer algo grande. Você criou muitas janelas sobrepostas para dar uma aparência profissional do tipo janela. Infelizmente, logo se torna difícil gerenciá-las. As múltiplas atualizações, mergulham você em um pesadelo.

As janelas sobrepostas criam manchas, sempre que você se esquece de atualizar as janelas na ordem adequada.

Não se desespere. Existe uma solução elegante fornecida na biblioteca de painéis. Nas palavras de desenvolvedores do ncurses.

Quando o design de sua interface é tal que as janelas podem mergulhar mais fundo na pilha de visibilidade ou aparecer no topo no tempo de execução, a contabilidade resultante pode ser entediante e difícil de acertar. Daí a biblioteca de painéis.

Se você tiver muitas janelas sobrepostas, a biblioteca de painéis é o caminho a seguir. Isso elimina a necessidade de fazer uma série de `wnoutrefresh()`, `doupdate()` e alivia o fardo de fazer isso corretamente (de baixo para cima).

A biblioteca mantém informações sobre a ordem das janelas, sua sobreposição e atualiza a tela de forma adequada. Então, por que esperar? Vamos dar uma olhada de perto nos painéis.

## 14.1 O Básico
O objeto de painel é uma janela implicitamente tratada como parte de um deck, incluindo todos os outros objetos de painel. O deck é tratado como uma pilha com o painel superior totalmente visível, podendo os outros painéis serem ou não obscurecidos de acordo com suas posições.

Portanto, a ideia básica é criar uma pilha de painéis sobrepostos e usar a biblioteca de painéis para exibi-los corretamente. Existe uma função semelhante a `refresh()` que, quando chamada, exibe os painéis na ordem correta.

São fornecidas funções para ocultar ou mostrar painéis, mover painéis, alterar seu tamanho etc. O problema de sobreposição é gerenciado pela biblioteca de painéis durante todas as chamadas para essas funções.

O fluxo geral de um programa de painel é assim:

+ **1.** Criar as janelas (com `newwin()`) a serem anexadas aos painéis.
+ **2.** Criar painéis com a ordem de visibilidade escolhida. Empilhá-los de acordo com a visibilidade desejada. A função `new_panel()` é usada para criar painéis.
+ **3.** Chame `update_panels()` para gravar os painéis na tela virtual na ordem de visibilidade correta. Faça um `doupdate()` para mostrá-lo na tela.
+ **4.** Manipular os painéis com `show_panel()`, `hide_panel()`, `move_panel()` etc. Use funções auxiliares como `panel_hidden()` e `panel_window()`. Use o ponteiro do usuário para armazenar dados personalizados para um painel. Use as funções `set_panel_userptr()` e `panel_userptr()` para definir e obter o ponteiro do usuário para um painel.
+ **5.** Quando terminar de usar o painel, use `del_panel()` para excluí-lo.

Vamos deixar os conceitos claros com alguns programas. O seguinte é um simples programa que cria 3 painéis sobrepostos e os mostra na tela.

## 14.2. Compilando com a biblioteca de painéis
Para usar as funções da biblioteca de painéis, você deve incluir `panel.h` e vincular o programa à biblioteca de painéis, o sinalizador `-lpanel` deve ser adicionado junto com `-lncurses` nessa ordem.
```cpp
#include <panel.h>
  .
  .
  .
```
> Compilar e vincular: `g++ arquivo.cpp -lpanel -lncurses -ltinfo`

*Exemplo 14. O básico de painéis*

```cpp
#include <panel.h>

int main(){
  WINDOW *my_wins[3];
  PANEL  *my_panels[3];
  int lines = 10, cols = 40, y = 2, x = 4;

  initscr();
  cbreak();
  noecho();
  curs_set( false );

  // Cria janelas para os painéis 
  my_wins[0] = newwin(lines, cols, y, x);
  my_wins[1] = newwin(lines, cols, y + 1, x + 5);
  my_wins[2] = newwin(lines, cols, y + 2, x + 10);

  // Cria bordas ao redor das janelas para que você possa ver o efeito dos painéis
  for(int i = 0; i < 3; ++i){
    box(my_wins[i], 0, 0);
  }

  // Anexa um painel a cada janela
  // A ordem é de baixo para cima 
  for (int i = 0; i < 3; ++i) {
    my_panels[i] = new_panel (my_wins[i]);   // Move 0, ordem: stdscr-i-[i]-[i] 
  }

  // Atualiza a ordem de empilhamento. O 2º painel ficará no topo 
  update_panels();

  // Mostra-o na tela 
  doupdate();

  getch();
  endwin();
}
```

Como você pode ver, o programa acima segue um fluxo simples conforme explicado. As janelas são criadas com `newwin()` e, em seguida, são anexadas aos painéis com `new_panel()`. Conforme anexamos um painel após o outro, a pilha de painéis é atualizada. Para colocá-los na tela, `update_panels()` e `doupdate()` são chamados.


## 14.3. Navegação na janela do painel
Um exemplo ligeiramente complicado é fornecido abaixo. Este programa cria 3 janelas que podem ser alternadas usando a guia. Dê uma olhada no código.

*Exemplo 15. Exemplo de navegação na janela do painel*

```cpp
#include <panel.h>
#include <cstring>

#define NLINES 10
#define NCOLS 40

void init_wins(WINDOW **wins, int n);
void win_show(WINDOW *win, char *label, int label_color);
void print_in_middle(WINDOW *win, int starty, int startx, int width, char *string, chtype color);

int main(){
  WINDOW *my_wins[3];
  PANEL  *my_panels[3];
  PANEL  *top;
  int ch;

  // Inicializa curses
  initscr();
  start_color();
  cbreak();
  noecho();
  keypad(stdscr, TRUE);

  // Inicializa todas as cores
  for (int i = 1; i <= 4; ++i) {
    init_pair(i, COLOR_RED, COLOR_BLACK);
  }

  init_wins(my_wins, 3);

  // Anexa um painel a cada janela
  // A ordem é de baixo para cima
  for (int i = 0; i <= 2; ++i) {
    my_panels[i] = new_panel (my_wins[i]);   // Move 0, ordem: stdscr-0-[i]-[i]
  }

  // Configura os ponteiros do usuário para o próximo painel
  for (size_t i = 0; i <= 2; ++i) {
   i < 2 ? set_panel_userptr(my_panels[i], my_panels[i + 1]) : set_panel_userptr(my_panels[i], my_panels[i - 2]);
  }

  // Atualiza a ordem de empilhamento. O 2º painel ficará no topo
  update_panels();

  // Mostra-o na tela
  attron(COLOR_PAIR(4));
  mvprintw (0, 0, "Use tab para navegar pelas janelas (F1 para sair)");
  attroff(COLOR_PAIR(4));
  doupdate();

  top = my_panels[2];
  while((ch = getch()) != KEY_F(1)){
    switch(ch){
      case 9:
        top = (PANEL *)panel_userptr(top);
        top_panel(top);
        break;
    }
    update_panels();
    doupdate();
  }
  endwin();
  return 0;
}

// Coloca todas as janelas
void init_wins(WINDOW **wins, int n){
  int x, y, i;
  char label[80];

  y = 2;
  x = 10;
  for(i = 0; i < n; ++i){
    wins[i] = newwin(NLINES, NCOLS, y, x);
    sprintf(label, "Window Number %d", i + 1);
    win_show(wins[i], label, i + 1);
    y += 3;
    x += 7;
  }
}

// Mostra a janela com uma borda e um rótulo
void win_show(WINDOW *win, char *label, int label_color){
  int startx, starty, height, width;

  getbegyx(win, starty, startx);
  getmaxyx(win, height, width);

  box(win, 0, 0);
  mvwaddch(win, 2, 0, ACS_LTEE);
  mvwhline(win, 2, 1, ACS_HLINE, width - 2);
  mvwaddch(win, 2, width - 1, ACS_RTEE);

  print_in_middle(win, 1, 0, width, label, COLOR_PAIR(label_color));
}

void print_in_middle(WINDOW *win, int starty, int startx, int width, char *string, chtype color){
  int length, x, y;
  float temp;

  if(win == NULL){
    win = stdscr;
  }

  getyx(win, y, x);
  if(startx != 0){
    x = startx;
  }

  if(starty != 0){
    y = starty;
  }

  if(width == 0){
    width = 80;
  }

  length = strlen(string);
  temp = (width - length)/ 2;
  x = startx + (int)temp;
  wattron(win, color);
  mvwprintw(win, y, x, "%s", string);
  wattroff(win, color);
  refresh();
}
```


## 14.4. Usando ponteiros do usuário
No exemplo acima, usei ponteiros de usuário para descobrir a próxima janela do ciclo. Podemos anexar informações personalizadas ao painel especificando um ponteiro do usuário, que pode apontar para qualquer informação que você deseja armazenar.

Neste caso, armazenei o ponteiro para o próximo painel do ciclo. O ponteiro do usuário para um painel pode ser definido com a função `set_panel_userptr()` . Ele pode ser acessado usando a função `panel_userptr()` que retornará o ponteiro do usuário para o painel fornecido como argumento.

Depois de encontrar o próximo painel no ciclo, ele é levado ao topo pela função `top_panel()`. Essa função traz o painel fornecido como argumento para o topo da pilha de painéis.

## 14.5. Movendo e redimensionando painéis
A função `move_panel()` pode ser usada para mover um painel para o local desejado. Ela não altera a posição do painel na pilha. Certifique-se de usar `move_panel()` em vez de `mvwin()` na janela associada ao painel.

O redimensionamento de um painel é um pouco complexo. Não existe uma função direta apenas para redimensionar a janela associada a um painel. Uma solução para redimensionar um painel é criar uma nova janela com os tamanhos desejados, alterar a janela associada ao painel usando `replace_panel()`.

Não se esqueça de excluir a janela antiga. A janela associada a um painel pode ser encontrada usando a função `panel_window()`.

O programa a seguir mostra esses conceitos, em um programa supostamente simples. Você pode alternar a janela com `<TAB>` como de costume.`</TAB>` Para redimensionar ou mover o painel ativo, pressione 'r' para redimensionar 'm' para movimentação.

Depois, use as teclas de seta para redimensionar ou movê-la para a maneira desejada e pressione Enter para terminar sua redimensionamento ou movimento. Este exemplo faz uso de dados do usuário para obter os dados necessários para fazer as operações.

*Exemplo 16. Exemplo de movimentação e redimensionamento do painel*

```cpp
#include <panel.h>
#include <cstring>
#include <cstdlib>

typedef struct _PANEL_DATA {
  int x, y, w, h;
  char label[80]; 
  int label_color;
  PANEL *next;
}PANEL_DATA;

#define NLINES 10
#define NCOLS 40

void init_wins(WINDOW ** wins, int n);
void win_show(WINDOW * win, char * label, int label_color);
void print_in_middle(WINDOW * win, int starty, int startx, int width, char * string, chtype color);
void set_user_ptrs(PANEL ** panels, int n);

int main(){
  WINDOW * my_wins[3];
  PANEL  * my_panels[3];
  PANEL_DATA  * top;
  PANEL * stack_top;
  WINDOW * temp_win, * old_win;
  int ch;
  int newx, newy, neww, newh;
  int size = FALSE, ismove = FALSE;

  // Inicializa curses
  initscr();
  start_color();
  cbreak();
  noecho();
  keypad(stdscr, TRUE);

  // Inicializa todas as cores
  init_pair(1, COLOR_RED, COLOR_BLACK);
  init_pair(2, COLOR_GREEN, COLOR_BLACK);
  init_pair(3, COLOR_BLUE, COLOR_BLACK);
  init_pair(4, COLOR_CYAN, COLOR_BLACK);

  init_wins(my_wins, 3);

  // Anexa um painel a cada janela
  // A ordem é de baixo para cima
  my_panels[0] = new_panel (my_wins[0]);   // Move 0, ordem: stdscr-0
  my_panels[1] = new_panel (my_wins[1]);   // Move 1, ordem: stdscr-0-1
  my_panels[2] = new_panel (my_wins[2]);   // Move 2, ordem: stdscr-0-1-2

  set_user_ptrs(my_panels, 3);
  // Atualiza a ordem de empilhamento. O 2º painel ficará no topo
  update_panels();

  // Mostra-o na tela
  //attron(COLOR_PAIR(4));
  //mvprintw (NLINES - 3, 0, "Use 'm' para mover, 'r' para redimensionar");
  //mvprintw (NLINES - 2, 0, "Use tab para navegar pelas janelas (F1 para sair)");
  //attroff(COLOR_PAIR(4));
  doupdate();

  stack_top = my_panels[2];
  top = (PANEL_DATA *)panel_userptr(stack_top);
  newx = top->x;
  newy = top->y;
  neww = top->w;
  newh = top->h;
  while((ch = getch()) != KEY_F(1)){
    switch(ch){
      case 9:         // Tab 
        top = (PANEL_DATA *)panel_userptr(stack_top);
        top_panel(top->next);
        stack_top = top->next;
        top = (PANEL_DATA *)panel_userptr(stack_top);
        newx = top->x;
        newy = top->y;
        neww = top->w;
        newh = top->h;
        break;
      case 'r':       // Redimensionar
        size = TRUE;
        //attron(COLOR_PAIR(4));
        mvprintw (20, 0, "Redimensionamento inserido: Use as setas para redimensionar e pressione <ENTER> para encerrar o redimensionamento ");
        refresh();
        //attroff(COLOR_PAIR(4));
        break;
      case 'm':       // Move 
        //attron(COLOR_PAIR(4));
        mvprintw (21, 0, "Movimento inserido: Use as setas para mover e pressione <ENTER> para parar de se mover ");
        refresh();
        //attroff(COLOR_PAIR(4));
        ismove = TRUE;
        break;
      case KEY_LEFT:
        if(size == TRUE){
          --newx;
          ++neww;
        }
        if(ismove == TRUE)
          --newx;
        break;
      case KEY_RIGHT:
        if(size == TRUE){
          ++newx;
          --neww;
        }
        if(ismove == TRUE){
          ++newx;
        }
        break;
      case KEY_UP:
        if(size == TRUE){
          --newy;
          ++newh;
        }
        if(ismove == TRUE){
          --newy;
        }
        break;
      case KEY_DOWN:
        if(size == TRUE){
          ++newy;
          --newh;
        }
        if(ismove == TRUE){
          ++newy;
        }
        break;
      case 10: // ENTER
        //move(NLINES - 4, 0);
        clrtoeol();
        refresh();
        if(size == TRUE){
          old_win = panel_window(stack_top);
          temp_win = newwin(newh, neww, newy, newx);
          replace_panel(stack_top, temp_win);
          win_show(temp_win, top->label, top->label_color); 
          delwin(old_win);
          size = FALSE;
        }
        if(ismove == TRUE){
          move_panel(stack_top, newy, newx);
          ismove = FALSE;
        }
        break;

    }
    //attron(COLOR_PAIR(4));
    mvprintw (22, 0, "Use 'm' para mover, 'r' para redimensionar");
    mvprintw (23, 0, "Use tab para navegar pelas janelas (F1 para sair)");
    //attroff(COLOR_PAIR(4));
    refresh();      
    update_panels();
    doupdate();
  }
  endwin();
  return 0;
}

// Coloca todas as janelas
void init_wins(WINDOW **wins, int n){
  int x, y, i;
  char label[80];

  y = 2;
  x = 10;
  for(i = 0; i < n; ++i){
    wins[i] = newwin(NLINES, NCOLS, y, x);
    sprintf(label, "Janela %d", i + 1);
    win_show(wins[i], label, i + 1);
    y += 3;
    x += 7;
  }
}

// Define as estruturas PANEL_DATA para painéis individuais
void set_user_ptrs(PANEL **panels, int n){
  PANEL_DATA *ptrs;
  WINDOW *win;
  int x, y, w, h, i;
  char temp[80];

  ptrs = (PANEL_DATA *)calloc(n, sizeof(PANEL_DATA));

  for(i = 0;i < n; ++i){
    win = panel_window(panels[i]);
    getbegyx(win, y, x);
    getmaxyx(win, h, w);
    ptrs[i].x = x;
    ptrs[i].y = y;
    ptrs[i].w = w;
    ptrs[i].h = h;
    sprintf(temp, "JANELA %d", i + 1);
    strcpy(ptrs[i].label, temp);
    ptrs[i].label_color = i + 1;
    if(i + 1 == n)
      ptrs[i].next = panels[0];
    else
      ptrs[i].next = panels[i + 1];
    set_panel_userptr(panels[i], &ptrs[i]);
  }
}

// Mostra a janela com uma borda e um rótulo
void win_show(WINDOW *win, char *label, int label_color){
  int startx, starty, height, width;

  getbegyx(win, starty, startx);
  getmaxyx(win, height, width);

  box(win, 0, 0);
  mvwaddch(win, 2, 0, ACS_LTEE); 
  mvwhline(win, 2, 1, ACS_HLINE, width - 2); 
  mvwaddch(win, 2, width - 1, ACS_RTEE); 

  print_in_middle(win, 1, 0, width, label, COLOR_PAIR(label_color));
}

void print_in_middle(WINDOW *win, int starty, int startx, int width, char *string, chtype color){
  int length, x, y;
  float temp;

  if(win == NULL)
    win = stdscr;
  getyx(win, y, x);
  if(startx != 0)
    x = startx;
  if(starty != 0)
    y = starty;
  if(width == 0)
    width = 80;

  length = strlen(string);
  temp = (width - length)/ 2;
  x = startx + (int)temp;
  wattron(win, color);
  mvwprintw(win, y, x, "%s", string);
  wattroff(win, color);
  refresh();
}
```

Concentre-se no loop `while` principal. Depois de descobrir o tipo de tecla pressionada, ele executa as ações apropriadas.Se 'r' for pressionado, o modo de redimensionamento é iniciado.

Depois disso, os novos tamanhos são atualizados conforme o usuário pressiona as teclas de seta. Quando o usuário pressiona `<ENTER>`, a seleção atual termina e o painel é redimensionado usando o conceito explicado.

No modo de redimensionamento, o programa não mostra como a janela está sendo redimensionada. Fica como exercício para o leitor imprimir uma borda pontilhada enquanto ela é redimensionada para uma nova posição.

Quando o usuário pressiona 'm', o modo de movimentação é iniciado. Isso é um pouco mais simples do que redimensionar. Conforme as teclas de seta são pressionadas, a nova posição é atualizada e o pressionamento de `<ENTER>` faz com que o painel seja movido chamando a função `move_panel()`.

Neste programa, os dados do usuário, representados como `PANEL_DATA`, desempenham um papel muito importante na localização das informações associadas a um painel. Conforme escrito nos comentários, o `PANEL_DATA` armazena os tamanhos do painel, rótulo, cor do rótulo e um ponteiro para o próximo painel no ciclo.

## 14.6. Escondendo e mostrando painéis
Um painel pode ser escondido usando a função `hide_panel()`. Esta função apenas o remove da pilha de painéis, ocultando-o, assim, na tela uma vez que você fizer `update_panels()` e `doupdate()`. Não destrói a estrutura `PANEL` associada ao painel oculto. Ele pode ser mostrado novamente usando a função `show_panel()`.

O programa a seguir mostra a ocultação de painéis. Pressione 'a' ou 'b' ou 'c' para mostrar ou ocultar a primeira, segunda e terceira janelas, respectivamente. Ele usa dados do usuário com uma pequena variável oculta, que controla se a janela está oculta ou não. Por algum motivo, a função `panel_hidden()` que informa se um painel está oculto ou não, não está funcionando. 

*Exemplo 17. Exemplo de ocultar e mostrar painel*

```cpp
#include <panel.h>
#include <cstring>

typedef struct _PANEL_DATA {
  int hide;       // TRUE se o painel estiver oculto
}PANEL_DATA;

#define NLINES 10
#define NCOLS 40

void init_wins(WINDOW **wins, int n);
void win_show(WINDOW *win, char *label, int label_color);
void print_in_middle(WINDOW *win, int starty, int startx, int width, char *string, chtype color);

int main(){
  WINDOW * my_wins[3];
  PANEL  * my_panels[3];
  PANEL_DATA panel_datas[3];
  PANEL_DATA *temp;
  int ch, row, col;

  // Inicializa curses
  initscr();
  start_color();
  cbreak();
  noecho();
  keypad(stdscr, TRUE);
  getmaxyx( stdscr, row, col );

  // Inicializa todas as cores
  init_pair(1, COLOR_RED, COLOR_BLACK);
  init_pair(2, COLOR_GREEN, COLOR_BLACK);
  init_pair(3, COLOR_BLUE, COLOR_BLACK);
  init_pair(4, COLOR_CYAN, COLOR_BLACK);

  init_wins(my_wins, 3);

  // Anexa um painel a cada janela
  // A ordem é de baixo para cima
  my_panels [0] = new_panel (my_wins [0]);   // Move 0, ordem: stdscr-0
  my_panels [1] = new_panel (my_wins [1]);   // Move 1, ordem: stdscr-0-1
  my_panels [2] = new_panel (my_wins [2]);   // Move 2, ordem: stdscr-0-1-2

  // Inicializa dados do painel informando que nada está oculto
  panel_datas[0].hide = FALSE;
  panel_datas[1].hide = FALSE;
  panel_datas[2].hide = FALSE;

  set_panel_userptr(my_panels[0], &panel_datas[0]);
  set_panel_userptr(my_panels[1], &panel_datas[1]);
  set_panel_userptr(my_panels[2], &panel_datas[2]);

  // Atualiza a ordem de empilhamento. O 2º painel ficará no topo
  update_panels();

  // Mostra-o na tela
  attron(COLOR_PAIR(4));
  mvprintw (row - 2, 0, "Mostrar ou ocultar uma janela com 'a' (primeira janela)  'b' (segunda janela)  'c' (Terceira janela) ");
  mvprintw( row - 1, 0, "F1 to Exit");

  attroff(COLOR_PAIR(4));
  doupdate();

  while((ch = getch()) != KEY_F(1)){
    switch(ch){
      case 'a':
        temp = (PANEL_DATA *)panel_userptr(my_panels[0]);

        if(temp->hide == FALSE){
          hide_panel(my_panels[0]);
          temp->hide = TRUE;
        }else{
          show_panel(my_panels[0]);
          temp->hide = FALSE;
        }

        break;
      case 'b':
        temp = (PANEL_DATA *)panel_userptr(my_panels[1]);
        if(temp->hide == FALSE){
          hide_panel(my_panels[1]);
          temp->hide = TRUE;
        }else{
          show_panel(my_panels[1]);
          temp->hide = FALSE;
        }

        break;
      case 'c':
        temp = (PANEL_DATA *)panel_userptr(my_panels[2]);
        if(temp->hide == FALSE){
          hide_panel(my_panels[2]);
          temp->hide = TRUE;
        }else{
          show_panel(my_panels[2]);
          temp->hide = FALSE;
        }
        break;
    }
    update_panels();
    doupdate();
  }
  endwin();
  return 0;
}

// Coloca todas as janelas
void init_wins(WINDOW **wins, int n){
  int x, y, i;
  char label[80];

  y = 2;
  x = 10;
  for(i = 0; i < n; ++i){
    wins[i] = newwin(NLINES, NCOLS, y, x);
    sprintf(label, "JANELA %d", i + 1);
    win_show(wins[i], label, i + 1);
    y += 3;
    x += 7;
  }
}

// Mostra a janela com uma borda e um rótulo
void win_show(WINDOW *win, char *label, int label_color){
  int startx, starty, height, width;

  getbegyx(win, starty, startx);
  getmaxyx(win, height, width);

  box(win, 0, 0);
  mvwaddch(win, 2, 0, ACS_LTEE);
  mvwhline(win, 2, 1, ACS_HLINE, width - 2);
  mvwaddch(win, 2, width - 1, ACS_RTEE);

  print_in_middle(win, 1, 0, width, label, COLOR_PAIR(label_color));
}

void print_in_middle(WINDOW *win, int starty, int startx, int width, char *string, chtype color){
  int length, x, y;
  float temp;

  if(win == NULL)
    win = stdscr;
  getyx(win, y, x);
  if(startx != 0){
    x = startx;
  }

  if(starty != 0){
    y = starty;
  }

  if(width == 0){
    width = 80;
  }

  length = strlen(string);
  temp = (width - length)/ 2;
  x = startx + (int)temp;
  wattron(win, color);
  mvwprintw(win, y, x, "%s", string);
  wattroff(win, color);
  refresh();
}
```

## 14.7. Funções `panel_above()` e `panel_below()`
As funções `panel_above()` e `panel_below()` podem ser usadas para descobrir o painel acima e abaixo de um painel. Se o argumento para essas funções for `NULL`, elas retornarão um ponteiro para o painel inferior e o painel superior, respectivamente.

---

# 15. Biblioteca de Menus
A biblioteca de menus fornece uma boa extensão para o básico de curses, por meio do qual você pode criar menus. Ela fornece um conjunto de funções para criar menus. Mas eles precisam ser personalizados para dar uma aparência mais bonita, com cores etc. Vamos entrar em detalhes.

Um menu é uma exibição de tela que auxilia o usuário a escolher algum subconjunto de um determinado conjunto de itens. Para simplificar, um menu é uma coleção de itens dos quais um ou mais itens podem ser escolhidos.

Alguns leitores podem não estar cientes da capacidade de seleção de vários itens. A biblioteca de menus fornece funcionalidade para escrever menus a partir dos quais o usuário pode escolher mais de um item como sua escolha preferida. Isso é tratado em uma seção posterior. Agora é hora para as primeiras noções.

## 15.1. O Básico
Para criar menus, primeiro você cria itens e, em seguida, publica o menu no display. Depois disso, todo o processamento das respostas do usuário é feito em uma elegante função `menu_driver()` que é o burro de carga de qualquer programa de menu.

O fluxo geral de controle de um programa de menu é semelhante a este.
+ **1.** Inicialize curses
+ **2.** Crie itens usando `new_item()`. Você pode especificar um nome e uma descrição para os itens.
+ **3.** Crie o menu com `new_menu()` especificando os itens a serem anexados.
+ **4.** Poste o menu com `menu_post()` e atualize a tela.
+ **5.** Processe as solicitações do usuário com um loop e faça as atualizações necessárias no menu com `menu_driver`.
+ **6.** Desfaça o post do menu com `menu_unpost()`
+ **7.** Libere a memória alocada ao menu por `free_menu()`
+ **8.** Libere a memória alocada para os itens com `free_item()`
+ **9.** Finalize curses

Vamos ver um programa que imprime um menu simples e atualiza a seleção atual com setas para cima e para baixo.

## 15.2. Compilando com a Biblioteca do Menu
Para usar as funções da biblioteca de menus, você deve incluir menu.h e vincular o programa à biblioteca de menus, o sinalizador `-lmenu` deve ser adicionado junto com `-lncurses` nessa ordem.

## 15.3. Menu Driver: O burro de carga do sistema de menu
Como você viu no exemplo acima, `menu_driver` desempenha um papel importante na atualização do menu. É muito importante entender as várias opções necessárias e o que elas fazem.

Como explicado acima, o segundo parâmetro para `menu_driver()` pode ser uma solicitação de navegação, um caractere imprimível ou uma chave `KEY_MOUSE`. Vamos dissecar as diferentes solicitações de navegação.
+ `REQ_LEFT_ITEM` e `REQ_RIGHT_ITEM`
+ Um menu pode ser exibido com várias colunas para mais de um item. Isso pode ser feito usando o `menu_format()` função. Quando um menu com várias colunas é exibido, essas solicitações fazem com que o driver do menu mova a seleção atual para a esquerda ou direita.
+ `REQ_UP_ITEM` e `REQ_DOWN_ITEM`
+ Essas duas opções você viu no exemplo acima. Essas opções, quando fornecidas, fazem com que o menu_driver mova a seleção atual para um item para cima ou para baixo.
+ `REQ_SCR_*` options
+ As quatro opções `REQ_SCR_ULINE`, `REQ_SCR_DLINE`, `REQ_SCR_DPAGE`, `REQ_SCR_UPAGE` estão relacionadas à rolagem. Se todos os itens do menu não puderem ser exibidos na subjanela do menu, o menu poderá ser rolado. Essas solicitações podem ser fornecidas ao `menu_driver` para fazer a rolagem de uma linha para cima, para baixo ou uma página para baixo ou para cima, respectivamente.
+ `REQ_FIRST_ITEM`, `REQ_LAST_ITEM`, `REQ_NEXT_ITEM` e `REQ_PREV_ITEM` Essas solicitações são autoexplicativas.
+ `REQ_TOGGLE_ITEM` Esta solicitação, quando fornecida, alterna a seleção atual. Esta opção deve ser usada apenas em um menu de vários valores. Portanto, para usar esta solicitação, a opção `O_ONEVALUE` deve estar desligada. Esta opção pode ser ativada ou desativada com `set_menu_opts()`.

#### Solicitações Padrão
Cada menu tem um buffer de padrão associado, que é usado para encontrar a correspondência mais próxima aos caracteres [ASCII](https://pt.wikipedia.org/wiki/ASCII) inseridos pelo usuário.

Sempre que caracteres `ascii` são fornecidos a `menu_driver`, ele é colocado no buffer de padrão. Ele também tenta encontrar a correspondência mais próxima ao padrão na lista de itens e move a seleção atual para esse item.

A solicitação `REQ_CLEAR_PATTERN` limpa o buffer de padrão. A solicitação `REQ_BACK_PATTERN` exclui o caractere anterior no buffer de padrão. No caso de o padrão corresponder a mais de um item, os itens combinados podem ser alternados entre `REQ_NEXT_MATCH e REQ_PREV_MATCH`, que movem a seleção atual para a próxima correspondência e a anterior, respectivamente.

#### Solicitações de mouse
No caso de solicitações `KEY_MOUSE`, de acordo com a posição do mouse, uma ação é realizada em conformidade. A ação a ser executada é explicada na página de manual como, se o segundo argumento é a chave especial `KEY_MOUSE`, o evento de mouse associado é traduzido em uma das solicitações acima predefinidas.

Atualmente, apenas clicks na janela do usuário (por exemplo, dentro da área de exibição do menu ou  da janela de  decoração ) são manuseados. Se você clicar acima da região de exibição do menu, um `REQ_SCR_ULINE` é gerado.

E se  você der um duplo click um `REQ_SCR_UPAGE` é gerado e E se você der um clique triplo, um `REQ_FIRST_ITEM` é gerado. Se você der um clique abaixo da região de exibição do menu, um `REQ_SCR_DLINE` é gerado, se você clicar duas vezes, um `REQ_SCR_DPAGE` é gerado e  se  você  der um clique triplo, um `REQ_LAST_ITEM` é gerado.

Se você clicar em um item dentro da área de exibição do menu, o cursor do menu é posicionado nesse item.

Cada uma das solicitações acima será explicada nas linhas a seguir com vários exemplos, sempre que apropriado.

## 15.4. Janelas de menu
Cada menu criado está associado a uma janela e a uma subjanela. A janela do menu exibe qualquer título ou borda associada ao menu. A subjanela do menu exibe os itens do menu atualmente disponíveis para seleção.

Mas não especificamos nenhuma janela ou subjanela no exemplo simples. Quando uma janela não é especificada, stdscr é considerado a janela principal e, em seguida, o sistema de menus calcula o tamanho da subjanela necessário para a exibição de itens.

Em seguida, os itens são exibidos na subjanela calculada. Então, vamos brincar com essas janelas e exibir um menu com uma borda e um título.

*Exemplo 18. Exemplo de uso do menu de Janelas*

```cpp
#include <menu.h>
#include <cstdlib>
#include <cstring>
#include <vector>
#include <iostream>

//#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
//#define CTRLD 4

//char * choices[] = {
//  "Escolha 1",
//  "Escolha 2",
//  "Escolha 3",
//  "Escolha 4",
//  "Sair",
//};

std::vector<const char *> choices = {"Item 1", "Item 2", "Item 3", "Item 4", (const char *)NULL};

void print_in_middle(WINDOW *win, int starty, int startx, int width, const char *string, chtype color);

int main(){
  ITEM **my_items;
  int c;
  MENU *my_menu;
  WINDOW *my_menu_win;
  int n_choices, i;

  // Inicializa curses
  initscr();
  start_color();
  cbreak();
  noecho();
  keypad(stdscr, TRUE);
  init_pair(1, COLOR_RED, COLOR_BLACK);

  // Cria itens
  //n_choices = ARRAY_SIZE(choices);
  n_choices =choices.size();
  my_items = (ITEM **)calloc(n_choices, sizeof(ITEM *));
  for(i = 0; i < n_choices; ++i){
    my_items[i] = new_item( choices[i], choices[i] );
  }

  // Menu da caixa
  my_menu = new_menu((ITEM **)my_items);

  // Cria a janela a ser associada ao menu
  my_menu_win = newwin(10, 40, 4, 4);
  keypad(my_menu_win, TRUE);

  // Define a janela principal e a subjanela
  set_menu_win(my_menu, my_menu_win);
  set_menu_sub(my_menu, derwin(my_menu_win, 6, 38, 3, 1));

  // Define a marca de menu para a string "*"
  set_menu_mark(my_menu, " * ");

  // Imprime uma borda ao redor da janela principal e imprime um título
  box(my_menu_win, 0, 0);
  const char * meu_menu = "Meu Menu";
  print_in_middle (my_menu_win, 1, 0, 40, meu_menu, COLOR_PAIR (1));
  mvwaddch(my_menu_win, 2, 0, ACS_LTEE);
  mvwhline(my_menu_win, 2, 1, ACS_HLINE, 38);
  mvwaddch(my_menu_win, 2, 39, ACS_RTEE);
  mvprintw(LINES - 2, 0, "Tecle F1 para sair");
  refresh();

  // Posta o menu
  post_menu(my_menu);
  wrefresh(my_menu_win);

  while((c = wgetch(my_menu_win)) != KEY_F(1)){
    switch(c){
      case KEY_DOWN:
        menu_driver(my_menu, REQ_DOWN_ITEM);
        break;
      case KEY_UP:
        menu_driver(my_menu, REQ_UP_ITEM);
        break;
    }
    wrefresh(my_menu_win);
  }

  // Desmarca e libera toda a memória ocupada
  unpost_menu(my_menu);
  free_menu(my_menu);

  for(i = 0; i < n_choices; ++i){
    free_item(my_items[i]);
  }

  endwin();
}

void print_in_middle(WINDOW *win, int starty, int startx, int width, const char *string, chtype color){
  int length, x, y;
  float temp;

  if(win == NULL){
    win = stdscr;
  }

  getyx(win, y, x);
  if(startx != 0){
    x = startx;
  }

  if(starty != 0){
    y = starty;
  }

  if(width == 0){
    width = 80;
  }

  length = strlen(string);
  temp = (width - length)/ 2;
  x = startx + (int)temp;
  wattron(win, color);
  mvwprintw(win, y, x, "%s", string);
  wattroff(win, color);
  refresh();
}
```

Este exemplo cria um menu com um título, uma borda, uma linha elegante que separa o título e os itens. Como você pode ver, para anexar uma janela a um menu, a função `set_menu_win()` deve ser usada. Em seguida, anexamos a subjanela também.

Isso exibe os itens na subjanela. Você também pode definir a string de marca que é exibida à esquerda do item selecionado com `set_menu_mark()`.

## 15.5. Menus de rolagem
Se a subjanela fornecida para uma janela não for grande o suficiente para mostrar todos os itens, o menu será rolável. Quando você está no último item na lista presente, se você enviar `REQ_DOWN_ITEM`, ele é traduzido para `REQ_SCR_DLINE` e o menu rola por um item.

Você pode fornecer manualmente operações `REQ_SCR_` para fazer a rolagem. Vamos ver como isso pode ser feito.

## 15.6. Menus Multi Colunares
No exemplo acima, você viu como usar a função `set_menu_format()`. Não mencionei o que a variável cols (terceiro parâmetro) faz. Bem, se sua subjanela for grande o suficiente, você pode optar por exibir mais de um item por linha.

## 15.7. Menus de vários valores
Você pode estar se perguntando o que aconteceria se desativar a opção `O_ONEVALUE`. Então, o menu passa a ter vários valores. Isso significa que você pode selecionar mais de um item. Isso nos leva à solicitação `REQ_TOGGLE_ITEM`. 

## 15.8. Opções do menu
Bem, a esta altura você deve estar ansioso por alguma diferença em seu menu, com muitas funcionalidades. Eu sei. Você quer cores!!!. Você deseja criar menus legais semelhantes aos do modo de texto dos jogos do dos .

As funções `set_menu_fore()` e `set_menu_back()` podem ser usadas para alterar o atributo do item selecionado e do item não selecionado. Os nomes são enganosos. Eles não mudam o primeiro plano ou o fundo do menu, o que seria inútil.

A função `set_menu_grey()` pode ser usada para definir o atributo display para os itens não selecionáveis no menu. Isso nos leva à opção interessante para um item, o primeiro e único: `O_SELECTABLE`.

Podemos desligá-lo pela função `item_opts_off()` e depois disso esse item não é selecionável. É como um item acinzentado nos menus sofisticados do Windows.

## 15.9. O útil ponteiro do usuário
Podemos associar um ponteiro do usuário a cada item do menu. Funciona da mesma forma que o ponteiro do usuário nos painéis. Não é tocado pelo sistema de menu. Você pode armazenar qualquer coisa que quiser nele.

Eu costumo usá-lo para armazenar a função a ser executada quando a opção do menu é escolhida (está selecionada e pode ser o usuário pressionado `<ENTER>` 😃 .

---

# 16. Biblioteca de Formulários
Bem. Se você viu esses formulários em páginas da web que recebem informações dos usuários e fazem vários tipos de coisas, pode estar se perguntando como alguém criaria esses formulários na exibição em modo de texto. É muito difícil escrever essas formas bacanas no ncurses cru.

A biblioteca de formulários tenta fornecer uma estrutura básica para construir e manter formulários com facilidade. ela possui muitos recursos (funções) que gerenciam a validação, expansão dinâmica de campos etc. Vamos ver em pleno fluxo.

Um formulário é uma coleção de campos; cada campo pode ser um rótulo (texto estático) ou um local de entrada de dados. A biblioteca de formulários também fornece funções para dividir os formulários em várias páginas.

## 16.1. O Básico
Os formulários são criados praticamente da mesma maneira que os menus. Primeiro, os campos relacionados ao formulário são criados com `new_field()`. Você pode definir opções para os campos, de modo que eles possam ser exibidos com alguns atributos sofisticados, validados antes que o campo perca o foco etc.

Em seguida, os campos são anexados ao formulário. Depois disso, o formulário pode ser postado para exibição e está pronto para receber entradas. Nas linhas semelhantes a `menu_driver()`, o formulário é manipulado com `form_driver()`.

Podemos enviar solicitações para form_driver para mover o foco para um determinado campo, mover o cursor para o final do campo etc. Depois que o usuário insere os valores nos campos e a validação é feita, o formulário pode ser não postado e a memória alocada pode ser liberada.

O fluxo geral de controle de um programa de formulários se parece com isto.

1. Inicializar curses
1. Criar campos usando `new_field()`. Você pode especificar a altura e largura do campo e sua posição no formulário.
1. Criar os formulários com `new_form()` especificando os campos a serem anexados.
1. Publicar o formulário com `form_post()` e atualizar a tela.
1. Processar as solicitações do usuário com um loop e fazer as atualizações necessárias para o formulário com `form_driver`.
1. Desfazer o menu com `form_unpost()`
1. Liberar a memória alocada ao menu por `free_form()`
1. Liberar a memória alocada para os itens com `free_field()`
1. Finalizar curses

Como você pode ver, trabalhar com a biblioteca de formulários é muito semelhante a lidar com a biblioteca de menus. Os exemplos a seguir explorarão vários aspectos do processamento de formulários. Vamos começar a jornada com um exemplo simples.

## 16.2. Compilando com a Biblioteca de Formulários
Para usar as funções da biblioteca de formulários, você deve incluir form.h e vincular o programa à biblioteca de formulários, o sinalizador `-lfor`m deve ser adicionado junto com `-lncurses` nessa ordem.
```cpp
#include <form.h>
.
.
.
```
> Compile e link: `g++ <program file> -lform -lncurses`

Exemplo 25. O básico de formulários
```cpp
#include <form.h>

int main(){
  FIELD *field[3];
  FORM  *my_form;
  int ch;

  // Inicializa curses 
  initscr();
  cbreak();
  noecho();
  keypad(stdscr, TRUE);

  // Initialize the fields 
  field[0] = new_field(1, 10, 4, 18, 0, 0);
  field[1] = new_field(1, 10, 6, 18, 0, 0);
  field[2] = NULL;

  // Define opções de campo 
  set_field_back(field[0], A_UNDERLINE);  // Imprima a linha para a opção
  field_opts_off (campo [0], O_AUTOSKIP);   // Não vá para o próximo campo quando este 
  // campo estiver preenchido           
  set_field_back(field[1], A_UNDERLINE); 
  field_opts_off(field[1], O_AUTOSKIP);

  // Cria o formulário e o publica 
  my_form = new_form(field);
  post_form(my_form);
  refresh();

  mvprintw (4, 10, "Valor 1:");
  mvprintw (6, 10, "Valor 2:");
  refresh();

  // Loop para obter as solicitações do usuário 
  while((ch = getch()) != KEY_F(1)){
    switch(ch){
      case KEY_DOWN:
      // Vai para o próximo campo 
      form_driver(my_form, REQ_NEXT_FIELD);
      // Vai para o final do buffer presente 
      // Sai bem no último caractere 
      form_driver(my_form, REQ_END_LINE);
      break;
      case KEY_UP:
      // Vai para o campo anterior 
      form_driver(my_form, REQ_PREV_FIELD);
      form_driver(my_form, REQ_END_LINE);
      break;
      default:
      // Se este for um caractere normal, ele é 
      // Impresso                                   
      form_driver(my_form, ch);
      break;
    }
  }

  // Retire o formulário de postagem e libere a memória 
  unpost_form(my_form);
  free_form(my_form);
  free_field(field[0]);
  free_field(field[1]); 

  endwin();
  return 0;
}
```

O exemplo acima é bastante direto. Ele cria dois campos com `new_field()` . `new_field()` leva `altura`, `largura`, `starty`, `startx`, número de linhas fora da tela e número de buffers de trabalho adicionais.

O quinto argumento o número de linhas fora da tela especifica quanto do campo deve ser mostrado. Se for zero, todo o campo será sempre exibido, caso contrário o formulário será rolável quando o usuário acessar partes não exibidas do campo.

A biblioteca de formulários aloca um buffer por campo para armazenar os dados inseridos pelo usuário. Usando o último parâmetro para `new_field()`, podemos especificá-lo para alocar alguns buffers adicionais. Eles podem ser usados para qualquer finalidade que você desejar.

Depois de criar os campos, o atributo de fundo de ambos é definido como um sublinhado com `set_field_back()`. A opção `AUTOSKIP` é desligada usando `field_opts_off()`. Se essa opção estiver ativada, o foco passará para o próximo campo do formulário assim que o campo ativo for totalmente preenchido.

Após anexar os campos ao formulário, ele é postado. Daqui em diante, as entradas do usuário serão processadas no loop while, fazendo solicitações correspondentes para `form_driver`. Os detalhes de todas as solicitações ao `form_driver()` serão explicados posteriormente.

## 16.3. Brincando com Campos
Cada campo de formulário está associado a vários atributos. Eles podem ser manipulados para obter o efeito desejado e se divertir!!!. Então, por que esperar?

### 18.3.1. Buscando tamanho e localização do campo
Os parâmetros que fornecemos no momento da criação de um campo podem ser recuperados com `field_info()`. Ela retorna `altura`, `largura`, `starty`, `startx`, número de linhas fora da tela e número de buffers adicionais nos parâmetros fornecidos a ela. É uma espécie de inverso de `new_field()`.

```cpp
int field_info (     FIELD *field,              // campo do qual buscar 
    int *height, *int width,   // tamanho do campo 
    int *top, int *left,       // canto superior esquerdo
    int *offscreen,            // número de linhas fora da tela
    int *nbuf);                // número de buffers de trabalho 
```

### 18.3.2. Movendo o campo
A localização do campo pode ser movida para uma posição diferente com `move_field()`.
```cpp
int move_field (    FIELD *field,              // campo para alterar 
    int top, int left);        // novo canto superior esquerdo
```

Como de costume, a posição alterada pode ser consultada com `field_infor()`.

## 16.3.3. Justificativa de campo
A justificativa a ser feita para o campo pode ser corrigida usando a função `set_field_just(`).

```cpp
int set_field_just(FIELD *field,          // campo para alterar
    int justmode);         // modo para definir 
int field_just (FIELD *field);          // buscar modo justificar do campo 
```

O modo de justificação com valor aceito e retornado por essas funções são `NO_JUSTIFICATION`, `JUSTIFY_RIGHT`, `JUSTIFY_LEFT` ou `JUSTIFY_CENTER`.

### 18.3.4. Atributos de exibição de campo
Como você viu, no exemplo acima, o atributo display para os campos pode ser definido com `set_field_fore()` e `setfield_back()`. Essas funções definem os atributos de primeiro e segundo plano dos campos.

Você também pode especificar um caractere de teclado que será preenchido na parte não preenchida do campo. O caractere pad é definido com uma chamada para `set_field_pad()`. O valor padrão do teclado é um espaço.

As funções `field_fore()`, `field_back`, `field_pad()` podem ser usadas para consultar o primeiro plano atual, os atributos de fundo e o caractere de teclado do campo. A lista a seguir fornece o uso de funções.
```cpp

int set_field_fore (FIELD *field,        // campo para alterar 
    chtype attr);        // atributo para definir 

chtype field_fore(FIELD *field);        // campo para consultar 
// retorna o atributo de primeiro plano 

int set_field_back (FIELD field*,        // campo para alterar 
    chtype attr);        // atributo para definir 

chtype field_back (FIELD *field);        // campo para consultar 
// retorna o atributo de fundo 

int set_field_pad(FIELD *field,         // campo para alterar 
    int pad);             // pad caractere para definir 

chtype field_pad(FIELD *field);         // campo para consultar  
// retorna o caractere do teclado atual 
```

Embora as funções acima pareçam bastante simples, usar cores com `set_field_fore()` pode ser frustrante no início. Deixe-me primeiro explicar sobre os atributos de primeiro e segundo plano de um campo. O atributo foreground está associado ao caractere.

Isso significa que um caractere no campo é impresso com o atributo que você configurou com `set_field_fore(`). Atributo de fundo é o atributo usado para preencher o fundo do campo, esteja algum caractere lá ou não.

E quanto às cores? Como as cores são sempre definidas em pares, qual é a maneira correta de exibir os campos coloridos? Aqui está um exemplo que esclarece os atributos de cores.

Exemplo 26. Exemplo de atributos de formulário
```cpp
#include <form.h>

int main(){
  FIELD *field[3];
  FORM  *my_form;
  int ch;

  // Inicializa curses 
  initscr();
  start_color();
  cbreak();
  noecho();
  keypad(stdscr, TRUE);

  // Inicializa alguns pares de cores 
  init_pair(1, COLOR_WHITE, COLOR_BLUE);
  init_pair(2, COLOR_WHITE, COLOR_BLUE);

  // Initialize the fields 
  field[0] = new_field(1, 10, 4, 18, 0, 0);
  field[1] = new_field(1, 10, 6, 18, 0, 0);
  field[2] = NULL;

  // Define opções de campo 
  set_field_fore (field [0], COLOR_PAIR (1)); // Coloca o campo com fundo azul 
  set_field_back (field [0], COLOR_PAIR (2)); // e primeiro plano branco (caracteres 
  // são impressos em branco         
  field_opts_off (campo [0], O_AUTOSKIP);   // Não vá para o próximo campo quando este 
  // campo estiver preenchido           
  set_field_back(field[1], A_UNDERLINE); 
  field_opts_off(field[1], O_AUTOSKIP);

  // Cria o formulário e o publica 
  my_form = new_form(field);
  post_form(my_form);
  refresh();

  set_current_field (my_form, field [0]); // Define o foco para o campo colorido 
  mvprintw (4, 10, "Valor 1:");
  mvprintw (6, 10, "Valor 2:");
  mvprintw (LINHAS - 2, 0, "Use as teclas de seta PARA CIMA e PARA BAIXO para alternar entre os campos");
  refresh();

  // Loop para obter as solicitações do usuário 
  while((ch = getch()) != KEY_F(1)){
    switch(ch){
      case KEY_DOWN:
        // Vai para o próximo campo 
        form_driver(my_form, REQ_NEXT_FIELD);
        // Vai para o final do buffer presente 
        // Sai bem no último caractere 
        form_driver(my_form, REQ_END_LINE);
        break;
      case KEY_UP:
        // Vai para o campo anterior 
        form_driver(my_form, REQ_PREV_FIELD);
        form_driver(my_form, REQ_END_LINE);
        break;
      default:
        // Se este for um caractere normal, ele é 
        // Impresso                                   
        form_driver(my_form, ch);
        break;
    }
  }

  // Retire o formulário de postagem e libere a memória 
  unpost_form(my_form);
  free_form(my_form);
  free_field(field[0]);
  free_field(field[1]); 

  endwin();
  return 0;
}
```

Brinque com os pares de cores e tente entender os atributos de primeiro e segundo plano. Em meus programas que usam atributos de cor, geralmente defino apenas o plano de fundo com `set_field_back()`. Curses simplesmente não permite definir atributos de cores individuais.

### 18.3.5. Bits de opção de campo
Há também uma grande coleção de bits de opção de campo que você pode definir para controlar vários aspectos do processamento de formulários. Você pode manipulá-los com estas funções:
```cpp
int set_field_opts(FIELD *field,          // campo a alterar 
    int attr);             // atributo para definir 

int field_opts_on(FIELD *field,           // campo a alterar 
    int attr);              // atributos para ligar 

int field_opts_off(FIELD *field,          // campo a alterar 
    int attr);              // atributos para desligar 

int field_opts(FIELD *field);             // campo a alterar 
```

A função `set_field_opts(`) pode ser usada para definir diretamente os atributos de um campo ou você pode escolher ativar e desativar alguns atributos com `field_opts_on()` e `field_opts_off()` seletivamente. A qualquer tempo, você pode consultar os atributos de um campo com `field_opts()`. A seguir está a lista de opções disponíveis. Por padrão, todas as opções estão ativadas.

+ `O_VISIBLE` - Controla se o campo está visível na tela. Pode ser usado durante o processamento do formulário para ocultar ou exibir campos dependendo do valor dos campos pais.
+ `O_ACTIVE` - Controla se o campo está ativo durante o processamento de formulários (ou seja, visitado por teclas de navegação de formulário). Pode ser usado para fazer rótulos ou campos derivados com valores de buffer alteráveis pelo aplicativo de formulários, não pelo usuário.
+ `O_PUBLIC` - Controla se os dados são exibidos durante a entrada no campo. Se esta opção estiver desativada em um campo, a biblioteca aceitará e editará os dados naquele campo, mas não será exibido e o cursor do campo visível não se moverá. Você pode desligar o bit `O_PUBLIC` para definir os campos de senha.
+ `O_EDIT` - Controla se os dados do campo podem ser modificados. Quando esta opção está desligada, todas as solicitações de edição, exceto `REQ_PREV_CHOICE` e `REQ_NEXT_CHOICE` vai falhar. Esses campos somente leitura podem ser úteis para mensagens de ajuda.
+ `O_WRAP` - Controla a quebra de linha em campos com várias linhas. Normalmente, quando qualquer caractere de uma palavra (separada por espaços em branco) atinge o final da linha atual, a palavra inteira é quebrada para a próxima linha (assumindo que haja uma). Quando esta opção está desativada, a palavra será dividida na quebra de linha.
+ `O_BLANK` - Controla a supressão de campo. Quando esta opção está ativada, inserir um caractere na primeira posição do campo apaga todo o campo (exceto para o caractere recém-inserido).
+ `O_AUTOSKIP` - Controla o salto automático para o próximo campo quando este for preenchido. Normalmente, quando o usuário de formulários tenta digitar mais dados em um campo do que cabem, o local de edição pula para o próximo campo. Quando esta opção está desligada, o cursor do usuário ficará pendurado no final do campo. Esta opção é ignorada em campos dinâmicos que não atingiram seu limite de tamanho.
+ `O_NULLOK` - Controla se a validação é aplicada a campos em branco. Normalmente, não é; o usuário pode deixar um campo em branco sem invocar a verificação de validação usual na saída. Se esta opção estiver desativada em um campo, sair dele invocará uma verificação de validação.
+ `O_PASSOK` - Controla se a validação ocorre em cada saída ou somente após o campo ser modificado. Normalmente, o último é verdadeiro. A configuração de O_PASSOK pode ser útil se a função de validação do seu campo pode mudar durante o processamento de formulários.
+ `O_STATIC` - Controla se o campo é fixo em suas dimensões iniciais. Se você desligar isso, o campo se tornará dinâmico e se expandirá para caber nos dados inseridos.

As opções de um campo não podem ser alteradas enquanto o campo estiver selecionado no momento. No entanto, as opções podem ser alteradas em campos postados que não são atuais.
Os valores das opções são máscaras de bits e podem ser compostos de forma lógica ou óbvia.

Você viu o uso de desligar a opção `O_AUTOSKIP`. O exemplo a seguir esclarece o uso de mais algumas opções. Outras opções são explicadas quando apropriado.
Exemplo 27. Exemplo de uso de opções de campo
```cpp
#include <form.h>

#define STARTX 15
#define STARTY 4
#define WIDTH 25

#define N_FIELDS 3

int main(){
  FIELD *field[N_FIELDS];
  FORM  *my_form;
  int ch, i;

  // Inicializa curses 
  initscr();
  cbreak();
  noecho();
  keypad(stdscr, TRUE);

  // Initialize the fields 
  for(i = 0; i < N_FIELDS - 1; ++i)
    field[i] = new_field(1, WIDTH, STARTY + i * 2, STARTX, 0, 0);
  field[N_FIELDS - 1] = NULL;

  // Define opções de campo 
  set_field_back (campo [1], A_UNDERLINE);  // Imprime uma linha para a opção  

  field_opts_off (campo [0], O_ACTIVE); // Este campo é um rótulo estático 
  field_opts_off (campo [1], O_PUBLIC); // Este campo é como um campo de senha 
  field_opts_off (campo [1], O_AUTOSKIP); // Para evitar inserir o mesmo campo 
  // após o último caractere ser inserido 

  // Cria o formulário e o publica 
  my_form = new_form(field);
  post_form(my_form);
  refresh();

  set_field_just (campo [0], JUSTIFY_CENTER); // Justificado ao centro 
  set_field_buffer (field [0], 0, "Este é um campo estático");
  // Inicializa o campo  
  mvprintw(STARTY, STARTX - 10, "Field 1:");
  mvprintw(STARTY + 2, STARTX - 10, "Field 2:");
  refresh();

  // Loop para obter as solicitações do usuário 
  while((ch = getch()) != KEY_F(1)){
    switch(ch){
      case KEY_DOWN:
      // Vai para o próximo campo 
      form_driver(my_form, REQ_NEXT_FIELD);
      // Vai para o final do buffer presente 
      // Sai bem no último caractere 
      form_driver(my_form, REQ_END_LINE);
      break;
      case KEY_UP:
      // Vai para o campo anterior 
      form_driver(my_form, REQ_PREV_FIELD);
      form_driver(my_form, REQ_END_LINE);
      break;
      default:
      // Se este for um caractere normal, ele é 
      // Impresso                                   
      form_driver(my_form, ch);
      break;
    }
  }

  // Retire o formulário de postagem e libere a memória 
  unpost_form(my_form);
  free_form(my_form);
  free_field(field[0]);
  free_field(field[1]); 

  endwin();
  return 0;
}
```

Este exemplo, embora inútil, mostra o uso de opções. Se usados corretamente, eles podem apresentar informações de forma muito eficaz em um formulário. O segundo campo não sendo `O_PUBLIC`, não mostra os caracteres que você está digitando.

### 18.3.6. Campo Status
O status do campo especifica se o campo foi editado ou não. É inicialmente definido como `FALSE` e quando o usuário insere algo e o buffer de dados é modificado, ele se torna `TRUE`. Assim, o status de um campo pode ser consultado para descobrir se ele foi modificado ou não. As funções a seguir podem ajudar nessas operações.

```cpp
int set_field_status(FIELD *field,      // campo para alterar 
    status int);         // status para definir 

int field_status (FIELD *field);         // buscar status do campo 
```

É melhor verificar o status do campo somente após sair do campo, pois o buffer de dados pode não ter sido atualizado ainda porque a validação ainda está vencida. Para garantir que o status correto seja retornado, chame `field_status` `()` ou `(1)` na rotina de verificação de validação de saída do campo, `(2)` nos ganchos de inicialização ou finalização do campo ou formulário, ou `(3)` logo após uma solicitação` REQ_VALIDATION` ter sido processada por o driver de formulários.
### 18.3.7. Ponteiro de usuário de campo
Cada estrutura de campo contém um ponteiro que pode ser usado pelo usuário para vários fins. Não é tocado pela biblioteca de formulários e pode ser usado para qualquer finalidade pelo usuário. As funções a seguir definem e buscam o ponteiro do usuário.
```cpp
int set_field_userptr(FIELD *field,   
    char * userptr);      // o ponteiro do usuário que você deseja associar 
// com o campo    

char * field_userptr (FIELD *field);      // busca o ponteiro do usuário do campo 
```

### 18.3.8. Campos de tamanho variável
Se você quer um campo que muda dinamicamente com largura variável, este é o recurso que você quer colocar em uso total. Isso permitirá que o usuário insira mais dados do que o tamanho original do campo e deixe o campo crescer.

De acordo com a orientação do campo, ele rolará horizontalmente ou verticalmente para incorporar os novos dados.

Para fazer um campo crescer dinamicamente, a opção O_STATIC deve ser desligada. Isso pode ser feito com um: `field_opts_off(field_pointer, O_STATIC);`

Mas geralmente não é aconselhável permitir que um campo cresça infinitamente. Você pode definir um limite máximo para o crescimento do campo com:
```cpp
int set_max_field(FIELD *field,    // Campo no qual operar 
    int max_growth); // crescimento máximo permitido para o campo 
```

As informações de campo para um campo que pode crescer dinamicamente podem ser recuperadas por
```cpp
int dynamic_field_info( FIELD *field,     // Campo no qual operar 
    int   * proa,     // o número de linhas será preenchido neste 
    int <s0></s0> *pcols, <s1></s1> // número de colunas será preenchido neste
    int   * pmax)      // o crescimento máximo permitido será preenchido 
```

Embora `field_info` funcione normalmente, é aconselhável usar esta função para obter os atributos apropriados de um campo que pode crescer dinamicamente.

Relembre a rotina da biblioteca `new_field`; um novo campo criado com altura definida para um será definido como um campo de uma linha. Um novo campo criado com altura maior que um será definido como um campo multilinha.

Um campo de uma linha com `O_STATIC` desligado (campo dinamicamente crescevel) conterá uma única linha fixa, mas o número de colunas pode aumentar se o usuário digitar mais dados do que o campo inicial irá conter. O número de colunas exibidas permanecerá fixo e os dados adicionais irão rolar horizontalmente.

Um campo multilinha com `O_STATIC` desativado (campo que pode ser ampliado dinamicamente) conterá um número fixo de colunas, mas o número de linhas pode aumentar se o usuário inserir mais dados do que o campo inicial pode conter. O número de linhas exibidas permanecerá fixo e os dados adicionais rolarão verticalmente.

Os dois parágrafos acima descrevem muito bem o comportamento de um campo que pode crescer dinamicamente. A forma como outras partes da biblioteca de formulários se comportam é descrita abaixo:
1. A opção de campo `O_AUTOSKIP` será ignorada se a opção `O_STATIC` estiver desligada e não houver crescimento máximo especificado para o campo. Atualmente, `O_AUTOSKI`P gera uma solicitação automática de driver de formulário `REQ_NEXT_FIELD` quando o usuário digita a última posição de caractere de um campo. Em um campo que pode ser ampliado sem nenhum crescimento máximo especificado, não há posição do último caractere. Se um crescimento máximo for especificado, a opção `O_AUTOSKIP` funcionará normalmente se o campo tiver crescido ao seu tamanho máximo.
1. A justificativa de campo será ignorada se a opção `O_STATIC` estiver desligada. Atualmente, `set_field_just` pode ser usado para `JUSTIFY_LEFT`, `JUSTIFY_RIGHT`, `JUSTIFY_CENTER` o conteúdo de um campo de linha única. Um campo de uma linha que pode crescer, por definição, vai crescer e rolar horizontalmente e pode conter mais dados do que pode ser justificado. O retorno de `field_just` será inalterado. CONTINUACAO
1. A solicitação de driver de formulário sobrecarregado `REQ_NEW_LINE` operará da mesma maneira, independentemente da opção de formulário `O_NL_OVERLOAD`, se a opção de campo `O_STATIC` estiver desativada e não houver crescimento máximo especificado para o campo. Atualmente, se a opção de formulário `O_NL_OVERLOAD` estiver ligado, `REQ_NEW_LINE` gera implicitamente uma `REQ_NEXT_FIELD` se chamada da última linha de um campo. Se um campo pode crescer sem limites, não há última linha, então `REQ_NEW_LINE` nunca gerará implicitamente um `REQ_NEXT_FIELD`. Se um limite máximo de crescimento for especificado e a opção de formulário `O_NL_OVERLOAD` estiver, `REQ_NEW_LINE` só gerará implicitamente `REQ_NEXT_FIELD` se o campo tiver crescido ao seu tamanho máximo e o usuário estiver na última linha.
1. A chamada da biblioteca `dup_field` funcionará normalmente; ele duplicará o campo, incluindo o tamanho do buffer atual e o conteúdo do campo que está sendo duplicado. Qualquer crescimento máximo especificado também será duplicado.
1. A chamada da biblioteca `link_field` funcionará normalmente; duplicará todos os atributos de campo e compartilhará buffers com o campo sendo vinculado. Se a opção de campo `O_STATIC` for posteriormente alterada por um buffer de compartilhamento de campo, como o sistema reage a uma tentativa de inserir mais dados no campo do que o buffer será atualmente conter dependerá da definição da opção no campo atual.
1. A chamada da biblioteca `field_info` funcionará normalmente; a variável nrow conterá o valor da chamada original para `new_field`. O usuário deve usar `dynamic_field_info`, descrita acima, para consultar o tamanho atual do buffer.
Alguns dos pontos acima só fazem sentido depois de explicar o driver de formulário. Vamos investigar isso nas próximas seções.

## 16.4. Formulário de Janelas
O conceito de formulário de janelas é praticamente semelhante às janelas do menu. Cada forma está associada a uma janela principal e uma subjanela. A janela principal do formulário exibe qualquer título ou borda associada ou o que o usuário desejar. Em seguida, a subjanela contém todos os campos e os exibe de acordo com sua posição. Isso dá a flexibilidade de manipular a exibição de formas sofisticadas com muita facilidade.
Uma vez que isso é muito semelhante às janelas do menu, estou fornecendo um exemplo com muita explicação. As funções são semelhantes e funcionam da mesma maneira.

> Exemplo 28. Exemplo de Formulário de Janelas
```cpp
#include <form.h>

void print_in_middle(WINDOW *win, int starty, int startx, int width, char *string, chtype color);

int main()
{
        FIELD *field[3];
        FORM  *my_form;
        WINDOW *my_form_win;
        int ch, rows, cols;
        
        // Inicializa curses 
        initscr();
        start_color();
        cbreak();
        noecho();
        keypad(stdscr, TRUE);

        // Inicializa alguns pares de cores 
        init_pair(1, COLOR_RED, COLOR_BLACK);

        // Initialize the fields 
        field[0] = new_field(1, 10, 6, 1, 0, 0);
        field[1] = new_field(1, 10, 8, 1, 0, 0);
        field[2] = NULL;

        // Define opções de campo 
        set_field_back(field[0], A_UNDERLINE);
        field_opts_off(campo[0], O_AUTOSKIP); Não vá para o próximo campo quando esse 
                                              // campo estiver preenchido             
        set_field_back(field[1], A_UNDERLINE); 
        field_opts_off(field[1], O_AUTOSKIP);
        
        // Cria o formulário e o publica 
        my_form = new_form(field);
        
        // Calcula a área necessária para o formulário 
        scale_form(my_form, &rows, &cols);

        // Cria a janela a ser associada ao formulário 
        my_form_win = newwin(rows + 4, cols + 4, 4, 4);
        keypad(my_form_win, TRUE);

        // Define a janela principal e a subjanela 
        set_form_win(my_form, my_form_win);
        set_form_sub(my_form, derwin(my_form_win, rows, cols, 2, 2));

        // Imprime uma borda ao redor da janela principal e imprime um título 
        box(my_form_win, 0, 0);
        print_in_middle(my_form_win, 1, 0, cols + 4, "My Form", COLOR_PAIR(1));
        
        post_form(my_form);
        wrefresh(my_form_win);

        mvprintw (LINHAS - 2, 0, "Use as teclas de seta PARA CIMA e PARA BAIXO para alternar entre os campos");
        refresh();

        // Loop para obter as solicitações do usuário 
        while((ch = wgetch(my_form_win)) != KEY_F(1))
        {       switch(ch)
                {       case KEY_DOWN:
                                // Vai para o próximo campo 
                                form_driver(my_form, REQ_NEXT_FIELD);
                                // Vai para o final do buffer presente 
                                // Sai bem no último caractere 
                                form_driver(my_form, REQ_END_LINE);
                                break;
                        case KEY_UP:
                                // Vai para o campo anterior 
                                form_driver(my_form, REQ_PREV_FIELD);
                                form_driver(my_form, REQ_END_LINE);
                                break;
                        default:
                                // Se este for um caractere normal, ele é 
                                // Impresso                                   
                                form_driver(my_form, ch);
                                break;
                }
        }

        // Retire o formulário de postagem e libere a memória 
        unpost_form(my_form);
        free_form(my_form);
        free_field(field[0]);
        free_field(field[1]); 

        endwin();
        return 0;
}

void print_in_middle(WINDOW *win, int starty, int startx, int width, char *string, chtype color)
{       int length, x, y;
        float temp;

        if(win == NULL)
                win = stdscr;
        getyx(win, y, x);
        if(startx != 0)
                x = startx;
        if(starty != 0)
                y = starty;
        if(width == 0)
                width = 80;

        length = strlen(string);
        temp = (width - length)/ 2;
        x = startx + (int)temp;
        wattron(win, color);
        mvwprintw(win, y, x, "%s", string);
        wattroff(win, color);
        refresh();
}
```


## 16.5. Validação de Campo
Por padrão, um campo aceitará qualquer entrada de dados pelo usuário. É possível anexar validação ao campo. Então, qualquer tentativa do usuário de deixar o campo, enquanto ele contém dados que não correspondem ao tipo de validação falhará. Alguns tipos de validação também têm uma verificação de validade de caractere para cada vez que um caractere é inserido no campo.
A validação pode ser anexada a um campo com a seguinte função.

```cpp
int set_field_type(FIELD *field,          // campo para alterar 
                   FIELDTYPE *ftype, <s0></s0> // tipo para associar 
                   ...); <s0></s0>// argumentos adicionais
```

Uma vez definido, o tipo de validação de um campo pode ser consultado com

`FIELDTYPE *field_type(FIELD *field);      // campo para consultar` 

O driver de formulário valida os dados em um campo somente quando os dados são inseridos pelo usuário final. A validação não ocorre quando
+ • o programa de aplicação altera o valor do campo chamando set_field_buffer.
+ • valores de campo ligados são alterados indiretamente - mudando o campo ao qual eles estão ligados

A seguir, os tipos de validação pré-definidos. Você também pode especificar validação personalizada, embora seja um pouco complicado e complicado.

+ `TYPE_ALPHA`
Este tipo de campo aceita dados alfabéticos; sem espaços em branco, sem dígitos, sem caracteres especiais (isso é verificado na hora da entrada do personagem). Ele é configurado com:
```cpp
int set_field_type(FIELD *field,          // campo para alterar 
                   TYPE_ALPHA,            // tipo para associar 
                   largura interna);            // largura máxima do campo 
```

O argumento de largura define uma largura mínima de dados. O usuário deve inserir pelo menos um número de largura de caracteres antes de poder deixar o campo. Normalmente você deseja definir isso para a largura do campo; se for maior que a largura do campo, a verificação de validação sempre falhará. Uma largura mínima de zero torna o preenchimento do campo opcional.

+ `TYPE_ALNUM`
Este tipo de campo aceita dados alfabéticos e dígitos; sem espaços em branco, sem caracteres especiais (isso é verificado no momento da entrada do caractere). Ele é configurado com:
```cpp
int set_field_type(FIELD *field,          // campo para alterar 
                   TYPE_ALNUM,            // tipo para associar 
                   largura interna);            // largura máxima do campo 
```

O argumento de largura define uma largura mínima de dados. Tal como acontece com `TYPE_ALPHA`, normalmente você deseja definir isso para a largura do campo; se for maior que a largura do campo, a verificação de validação sempre falhará. Uma largura mínima de zero torna o preenchimento do campo opcional.

+ `TYPE_ENUM`
Este tipo permite que você restrinja os valores de um campo a um conjunto especificado de valores de string (por exemplo, os códigos postais de duas letras para os EUA ) Ele é configurado com:
```cpp
int set_field_type(FIELD *field,          // campo para alterar 
                   TYPE_ENUM,             // tipo para associar 
                   char ** valuelist;      // lista de valores possíveis 
                   int checkcase;         // maiúsculas e minúsculas? 
                   int checkunique);      // deve especificar exclusivamente? 
```

O parâmetro valuelist deve apontar para uma lista terminada em `NULL` de strings válidas. O argumento checkcase, se true, faz a comparação com a string com distinção entre maiúsculas e minúsculas.

Quando o usuário sai de um campo `TYPE_ENUM`, o procedimento de validação tenta completar os dados no buffer para uma entrada válida. Se uma string de escolha completa foi inserida, é claro que é válida. Mas também é possível inserir um prefixo de uma string válida e preenchê-la para você.

Por padrão, se você inserir esse prefixo e ele corresponder a mais de um valor na lista de strings, o prefixo será completado com o primeiro valor correspondente. Mas o argumento checkunique, se verdadeiro, requer que as correspondências de prefixo sejam exclusivas para serem válidas.

As solicitações de entrada REQ_NEXT_CHOICE e REQ_PREV_CHOICE podem ser particularmente úteis com esses campos.

+ `TYPE_INTEGER`
Este tipo de campo aceita um número inteiro. É configurado da seguinte forma:
```cpp
int set_field_type(FIELD *field,          // campo para alterar 
                   TYPE_INTEGER,          // tipo para associar 
                   int padding,           // # coloca para zero 
                   int vmin, int vmax);   // intervalo válido 
```

Os caracteres válidos consistem em um sinal de menos e dígitos iniciais opcionais. A verificação de alcance é realizada na saída. Se o intervalo máximo for menor ou igual ao mínimo, o intervalo será ignorado.

Se o valor passar na verificação de intervalo, ele será preenchido com tantos dígitos de zero à esquerda quantos forem necessários para atender ao argumento de preenchimento.
Um buffer de valor` TYPE_INTEGER` pode ser convenientemente interpretado com a função de biblioteca C `atoi` .

+ `TYPE_NUMERIC`
Este tipo de campo aceita um número decimal. É configurado da seguinte forma:
```cpp
int set_field_type(FIELD *field,          // campo para alterar 
                   TYPE_NUMERIC,          // tipo para associar 
                   int padding,           // # locais de precisão 
                   int vmin, int vmax);   // intervalo válido 
```

Os caracteres válidos consistem em um sinal de menos e dígitos iniciais opcionais. possivelmente incluindo um ponto decimal. A verificação de alcance é realizada na saída. Se o intervalo máximo for menor ou igual ao mínimo, o intervalo será ignorado.

Se o valor passar na verificação de intervalo, ele será preenchido com tantos dígitos de zero à direita quantos forem necessários para atender ao argumento de preenchimento.
Um buffer de valor `TYPE_NUMERIC` pode ser convenientemente interpretado com a função de biblioteca C .

+ `TYPE_REGEXP`
Este tipo de campo aceita dados que correspondem a uma expressão regular. É configurado da seguinte forma:
```cpp
int set_field_type(FIELD *field,          // campo para alterar 
                   TYPE_REGEXP,           // tipo para associar 
                   char * regexp);         // expressão para corresponder 
```

A sintaxe para expressões regulares é a de `regcomp`. A verificação de correspondência de expressão regular é executada na saída.

## 16.6. Driver de formulário: o cavalo de trabalho do sistema de formulários
Como no sistema de menu, `form_driver()` desempenha um papel muito importante no sistema de formulários. Todos os tipos de solicitações ao sistema de formulários devem ser canalizados por `form_driver()`.
```cpp
int form_driver (FORM *form,     // formulário no qual operar     
                int request)    // código de pedido do formulário         
```

Como você viu alguns dos exemplos acima, você deve estar em um loop procurando a entrada do usuário e então decidir se é um campo de dados ou uma solicitação de formulário. Os pedidos de formulário são então passados para `form_driver()` para fazer o trabalho.

As solicitações podem ser divididas aproximadamente nas seguintes categorias. Os diferentes pedidos e seu uso são explicados abaixo:

## 16.6.1. Solicitações de navegação de página
Essas solicitações causam movimentações no nível da página pelo formulário, disparando a exibição de uma nova tela do formulário. Um formulário pode ter várias páginas. Se você tiver um formulário grande com muitos campos e seções lógicas, poderá dividir o formulário em páginas. A função `set_new_page()` para definir uma nova página no campo especificado.
```cpp
int set_new_page (FIELD *field, // Campo no qual a quebra de página deve ser definida ou removida 
         bool new_page_flag); // deve ser TRUE para colocar uma pausa 
```

As seguintes solicitações permitem que você vá para páginas diferentes
+ `REQ_NEXT_PAGE` Vai para a próxima página do formulário.
+ `REQ_PREV_PAGE` Vai para a página anterior do formulário.
+ `REQ_FIRST_PAGE` Vai para a primeira página do formulário.
+ `REQ_LAST_PAGE` Vai para a última página do formulário.
Essas solicitações tratam a lista como cíclica; ou seja, `REQ_NEXT_PAGE` da última página vai para a primeira e `REQ_PREV_PAGE` da primeira página vai para a última.

## 16.6.2. Solicitações de navegação entre campos
Essas solicitações lidam com a navegação entre campos na mesma página.
+ `REQ_NEXT_FIELD` Vai para o próximo campo.
+ `REQ_PREV_FIELD` Vai para o campo anterior.
+ `REQ_FIRST_FIELD` Vai para o primeiro campo.
+ `REQ_LAST_FIELD` Vai para o último campo.
+ `REQ_SNEXT_FIELD` Vai para o próximo campo selecionado.
+ `REQ_SPREV_FIELD` Vai para o campo anterior selecionado.
+ `REQ_SFIRST_FIELD` Vai para o primeiro campo selecionado.
+ `REQ_SLAST_FIELD` Vai para o último campo selecionado.
+ `REQ_LEFT_FIELD` Vai para o campo à esquerda .
+ `REQ_RIGHT_FIELD` Vai para o campo à direita. 
+ `REQ_UP_FIELD` Vai para o campo acima.
+ `REQ_DOWN_FIELD` Vai para o campo abaixo.

Essas solicitações tratam a lista de campos em uma página como cíclica; isto é,`REQ_NEXT_FIELD` do último campo vai para o primeiro e`REQ_PREV_FIELD` do primeiro campo vai para o último. A ordem dos campos para estes (e as solicitações`REQ_FIRST_FIELD` e`REQ_LAST_FIELD`) é simplesmente a ordem dos ponteiros de campo na matriz do formulário (conforme configurado por `new_form()` ou `set_form_fields()`

Também é possível percorrer os campos como se eles tivessem sido classificados na ordem da posição da tela, de modo que a sequência vai da esquerda para a direita e de cima para baixo. Para fazer isso, use o segundo grupo de quatro solicitações de movimento ordenado.

Finalmente, é possível mover-se entre os campos usando direções visuais para cima, para baixo, para a direita e para a esquerda. Para fazer isso, use o terceiro grupo de quatro solicitações. Observe, no entanto, que a posição de um formulário para fins dessas solicitações é seu canto superior esquerdo.

Por exemplo, suponha que você tenha um campo B de várias linhas e dois campos A e C de uma linha na mesma linha de B, com A à esquerda de B e C à direita de B. A`REQ_MOVE_RIGHT` de A irá para B apenas se A, B e C compartilham a mesma primeira linha; caso contrário, ele irá pular de B para C.

## 16.6.3. Solicitações de navegação intracampo
Essas solicitações conduzem ao movimento do cursor de edição dentro do campo atualmente selecionado.
+ `REQ_NEXT_CHAR` Vai para o próximo caractere.
+ `REQ_PREV_CHAR` Vai para o caractere anterior.
+ `REQ_NEXT_LINE` Vai para a próxima linha.
+ `REQ_PREV_LINE` Vai para a linha anterior.
+ `REQ_NEXT_WORD` Vai para a próxima palavra.
+ `REQ_PREV_WORD` Vai para a palavra anterior.
+ `REQ_BEG_FIELD` Vai para o início do campo.
+ `REQ_END_FIELD` Vai para o final do campo.
+ `REQ_BEG_LINE` Vai para o início da linha.
+ `REQ_END_LINE` Vai para o final da linha.
+ `REQ_LEFT_CHAR` Vai para a esquerda no campo.
+ `REQ_RIGHT_CHAR` Vai para a direita no campo.
+ `REQ_UP_CHAR` Vai para cima no campo.
+ `REQ_DOWN_CHAR` Vai para baixo no campo.

Cada palavra é separada dos caracteres anteriores e posteriores por um espaço em branco. Os comandos para mover para o início e o fim da linha ou campo procuram o primeiro ou o último caractere que não seja de teclado em seus intervalos.

## 16.6.4. Solicitações de rolagem
Os campos que são dinâmicos e cresceram e os campos explicitamente criados com linhas fora da tela podem ser rolados. Os campos de uma linha rolam horizontalmente; campos multilinhas rolam verticalmente. A maior parte da rolagem é acionada pela edição e pelo movimento dentro do campo (a biblioteca rola o campo para manter o cursor visível).

É possível solicitar explicitamente a rolagem com as seguintes solicitações:

+ `REQ_SCR_FLINE` Rola verticalmente para frente uma linha.
+ `REQ_SCR_BLINE` Rola uma linha verticalmente para trás.
+ `REQ_SCR_FPAGE` Rola verticalmente para a frente uma página.
+ `REQ_SCR_BPAGE` Rola uma página verticalmente para trás.
+ `REQ_SCR_FHPAGE` Rola verticalmente para frente meia página.
+ `REQ_SCR_BHPAGE` Rola meia página verticalmente para trás.
+ `REQ_SCR_FCHAR` Rola horizontalmente para frente um caractere.
+ `REQ_SCR_BCHAR` Rola um caractere horizontalmente para trás.
+ `REQ_SCR_HFLINE` Rola horizontalmente uma largura de campo para a frente.
+ `REQ_SCR_HBLINE` Rola horizontalmente uma largura de campo para trás.
+ `REQ_SCR_HFHALF` Rola horizontalmente metade da largura do campo para frente.
+ `REQ_SCR_HBHALF` Rola horizontalmente metade da largura do campo para trás.
Para fins de rolagem, a página de um campo tem a altura de sua parte visível.

## 16.6.5. Solicitações de Edição
Quando você passa um caractere ASCII ao driver de formulários, ele é tratado como uma solicitação para adicionar o caractere ao buffer de dados do campo. Se esta é uma inserção ou substituição depende do modo de edição do campo (a inserção é o padrão.

As seguintes solicitações suportam a edição do campo e a alteração do modo de edição:
+ `REQ_INS_MODE` Define o modo de inserção.
+ `REQ_OVL_MODE` Define o modo de sobreposição.
+ `REQ_NEW_LINE` Solicitação de nova linha (veja a explicação abaixo).
+ `REQ_INS_CHAR` Insere um espaço no local do caractere.
+ `REQ_INS_LINE` Insere uma linha em branco no local do caractere.
+ `REQ_DEL_CHAR` Exclui o caractere no cursor.
+ `REQ_DEL_PREV` Exclui a palavra anterior no cursor.
+ `REQ_DEL_LINE` Exclui a linha no cursor.
+ `REQ_DEL_WORD` Exclui a palavra no cursor.
+ `REQ_CLR_EOL` Apaga até o fim da linha.
+ `REQ_CLR_EOF` Apaga até o final do campo.
+ `REQ_CLR_FIELD` Apaga o campo inteiro.
O comportamento das solicitações`REQ_NEW_LINE` e`REQ_DEL_PREV` é complicado e parcialmente controlado por um par de opções de formulários. Os casos especiais são acionados quando o cursor está no início de um campo, ou na última linha do campo.

Primeiro, vamos considerar`REQ_NEW_LINE`:
+ O comportamento normal de`REQ_NEW_LINE` no modo de inserção é quebrar a linha atual na posição do cursor de edição, inserindo a parte da linha atual após o cursor como uma nova linha seguindo a atual e movendo o cursor para o início dessa nova linha (você pode pensar nisso como inserir uma nova linha no buffer de campo).
+ O comportamento normal de`REQ_NEW_LINE` no modo de sobreposição é limpar a linha atual da posição do cursor de edição até o final da linha. O cursor é então movido para o início da próxima linha.

No entanto,`REQ_NEW_LINE` no início de um campo, ou na última linha de um campo, em vez disso, faz um`REQ_NEXT_FIELD`. A opção `O_NL_OVERLOAD` está desativada, esta ação especial está desativada.

Agora, vamos considerar`REQ_DEL_PREV`:
+ O comportamento normal de`REQ_DEL_PREV` é excluir o caractere anterior. Se o modo de inserção estiver ativado e o cursor estiver no início de uma linha, e o texto nessa linha couber na anterior, em vez disso, ele anexa o conteúdo da linha atual à anterior e exclui a linha atual (você pode pensar nisso como excluir uma nova linha do buffer de campo).

No entanto,`REQ_DEL_PREV` no início de um campo é tratado como`REQ_PREV_FIELD`.

Se a opção `O_BS_OVERLOAD` estiver desligada, esta ação especial é desabilitada e o driver de formulários apenas retorna `E_REQUEST_DENIED`.

## 16.6.6. Solicitações de Pedido
Se o tipo do seu campo for ordenado e tiver funções associadas para obter os valores próximos e anteriores do tipo de um determinado valor, há solicitações que podem buscar esse valor no buffer do campo:
+ `REQ_NEXT_CHOICE` Coloque o valor sucessor do valor atual no buffer.
+ `REQ_PREV_CHOICE` Coloque o valor predecessor do valor atual no buffer.

Dos tipos de campo integrados, apenas `TYPE_ENUM` possui funções de sucessor e predecessor integradas. Ao definir um tipo de campo próprio (consulte Tipos de validação personalizados), você pode associar nossas próprias funções de pedido.

## 16.6.7. Comandos de aplicativos
As solicitações de formulário são representadas como inteiros acima do valor do curses maior que `KEY_MAX` e menor ou igual à constante `MAX_COMMAND`. Um valor dentro deste intervalo é ignorado por `form_driver()`. Portanto, isso pode ser usado para qualquer finalidade pelo aplicativo. Ela pode ser tratada como uma ação específica do aplicativo e executar a ação correspondente.

---

# 17. Ferramentas e bibliotecas de widgets
Agora que você viu os recursos do ncurses e de suas bibliotecas irmãs, você está arregaçando as mangas e se preparando para um projeto que manipula fortemente a tela. Mas espere. Pode ser muito difícil escrever e manter widgets GUI complexos em ncurses puro ou mesmo com as bibliotecas adicionais.

Existem algumas ferramentas e bibliotecas de widgets prontas para usar que podem ser usadas em vez de escrever seus próprios widgets. Você pode usar alguns deles, obter ideias do código ou até mesmo estendê-los.

## 17.1. CDK (Kit de Desenvolvimento do Curses)
Nas palavras do autor
CDK significa 'Curses Development Kit' e atualmente contém 21 widgets prontos para usar que facilitam o desenvolvimento rápido de programas de curses em tela cheia.
O kit fornece alguns widgets úteis, que podem ser usados diretamente em seus programas. Está muito bem escrito e a documentação é muito boa. Os exemplos no diretório de exemplos podem ser um bom ponto de partida para iniciantes. O CDK pode ser baixado de http://invisible-island.net/cdk/ . Siga as instruções no arquivo README para instalá-lo.

## 17.1.1. Lista de Widget
A seguir está a lista de widgets fornecidos com cdk e suas descrições.

| Tipo de widget | Descrição Rápida |
|---|---|
| Buttonbox       | Isso cria um widget de vários botões. |
| Calendar        | Cria um pequeno widget de calendário simples. |
| Dialog          | Avisa o usuário com uma mensagem e o usuário |
| Entry           | Permite que o usuário insira vários tipos de informações. |
| File Selector   | Um seletor de arquivo criado a partir de widgets de base |
| Graph           | Desenha um gráfico. |
| Histogram       | Desenha um histograma. |
| Item List       | Cria um campo pop-up que permite ao usuário selecionar |
| Label           | Exibe mensagens em uma caixa pop-up ou o marcador pode ser |
| Marquee         | Exibe uma mensagem em uma marca de rolagem. |
| Matrix          | Cria uma matriz complexa com muitas opções. |
| Menu            | Cria uma interface de menu suspenso. |
| Multiple Line Entry  | Um campo de entrada de várias linhas. Muito úteis |
| Radio List      | Cria uma lista de botões de opção. |
| Scale           | Cria uma escala numérica. Usado para permitir que um usuário |
| Scrolling List  | Cria uma lista de rolagem/lista de menus. |
| Scrolling Window  | Cria um visualizador de arquivo de log de rolagem. Pode adicionar |
| Selection List  | Cria uma lista de seleção de várias opções. |
| Slider List     | Semelhante ao widget de escala, este widget fornece um |
| Template        | Cria um campo de entrada com caracteres sensíveis |
| Viewer          | Este é um visualizador de arquivos/informações. Muito úteis! |


Alguns dos widgets foram modificados por Thomas Dickey em versões recentes.

## 17.1.2. Alguns recursos atraentes
Além de tornar nossa vida mais fácil com widgets prontamente utilizáveis, o cdk resolve um problema frustrante com a impressão de strings multicoloridas, strings justificadas com elegância. Tags de formatação especial podem ser embutidas nas strings que são passadas para funções CDK. Por exemplo
Se a string:
```sh
"</B/1> Esta linha deve ter um primeiro plano amarelo e um plano de fundo
azul.<!1>"
```

fornecido como parâmetro para `newCDKLabel()`, ele imprime a linha com o primeiro plano amarelo e o fundo azul. Existem outras tags disponíveis para justificar string, incorporar caracteres especiais de desenho etc. Por favor, consulte ao manual página `cdk_display` (3X) para detalhes. A página do manual explica o uso com bons exemplos.

## 17.1.3. Conclusão
Resumindo, o CDK é um pacote bem escrito de widgets que, se usado corretamente, pode formar uma estrutura robusta para o desenvolvimento de interfaces gráficas complexas.

## 17.2. O `dialog`
Muito tempo atrás, em setembro de 1994, quando poucas pessoas conheciam o [Linux](https://terminalroot.com.br/linux), Jeff Tranter escreveu um artigo na caixa de diálogo do Linux Journal. Ele começa o artigo com estas palavras...

> "O Linux é baseado no sistema operacional [Unix](https://terminalroot.com.br/tags#unix), mas também apresenta uma série de recursos de kernel exclusivos e úteis e programas de aplicativos que geralmente vão além do que está disponível no Unix. Uma joia pouco conhecida é o "dialog", um utilitário para criar caixas de diálogo com aparência profissional a partir de scripts de shell. Este artigo apresenta um tutorial de introdução ao utilitário dialog e mostra exemplos de como e onde ele pode ser usado"

Como ele explica, dialog é uma verdadeira joia na criação de caixas de diálogo com aparência profissional com facilidade. Ele cria uma variedade de caixas de diálogo, menus, listas de verificação etc. Geralmente é instalado por padrão. Se não, você pode baixá-lo no site de Thomas Dickey .

O artigo mencionado acima oferece uma visão geral muito boa de seus usos e capacidades. A página do manual tem mais detalhes. Pode ser usado em várias situações. Um bom exemplo é a construção do kernel do Linux em modo texto. O kernel Linux usa uma versão modificada do diálogo feito sob medida para suas necessidades.

dialog foi inicialmente projetado para ser usado com scripts de [shell](https://terminalroot.com.br/shell). Se você deseja usar sua funcionalidade em um programa em [C](https://terminalroot.com.br/tags#linguagemc), então você pode usar libdialog.

A documentação a respeito disso é esparsa. A referência definitiva é o arquivo de cabeçalho dialog.h que vem com a biblioteca. Você pode precisar hackear aqui e ali para obter a saída necessária. A fonte é facilmente personalizável.

## 17.3. Módulos Perl Curses `CURSES::FORM` e `CURSES::WIDGETS`
Os módulos perl Curses, `Curses::Form` e `Curses::Widgets` dão acesso aos curses do perl. Se você tiver curses e o perl básico estiver instalado, você pode obter esses módulos em Página de todos os módulos do `CPAN` .

Obtenha os três módulos compactados na categoria Curses. Uma vez instalado, você pode usar esses módulos de scripts perl como qualquer outro módulo. Para obter mais informações sobre os módulos perl, consulte a página de manual do perlmod.

Os módulos acima vêm com uma boa documentação e alguns scripts de demonstração para testar a funcionalidade. Embora os widgets fornecidos sejam muito rudimentares, esses módulos fornecem um bom acesso à biblioteca de curses do perl.

Alguns dos meus exemplos de código foram convertidos para perl por Anuradha Ratnaweera e estão disponíveis no perl diretório.

Para obter mais informações, consulte as páginas de manual `Curses (3)`, `Curses::Form (3)` e `Curses::Widgets (3)`. Essas páginas são instaladas apenas quando os módulos acima são adquiridos e instalados.

---

# 18. Apenas por diversão!!!
Esta seção contém alguns programas feitos com NCURSES e podem ser acessados nessa página no capítulo e secção: [3. Onde Conseguir](https://terminalroot.com.br/ncurses#3-onde-conseguir)

---

# 19. Referências
+ <https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/>
+ Traduzido por **Jovane Rocha** e **Marcos Oliveira**

---

# 20. CHEAT SHEET NCURSES
## Funções de inicialização

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


| Funções | Descrição |
| ------------- | ------------- |
| **`initscr()`** | Inicializa o terminal no modo cursor. Ele deve ser chamado primeiro para fazer qualquer manipulação com o pacote ncurses. |
| **`refresh()`** | Diz ao sistema curses para descarregar o conteúdo da tela. Ele verifica a janela e atualiza apenas a parte que foi alterada. |
| **`wrefresh()`** | Diz ao sistema curses para descarregar o conteúdo da janela fornecida. Ele verifica a janela fornecida e atualiza apenas a parte que foi alterada. |
| **`endwin()`** | Termina o modo de cursor do terminal. |
| **`raw()`** | Desativar buffer embutido. Os caracteres de controle são passados diretamente para o programa sem gerar um sinal. |
| **`cbreak()`** | Desativa o buffer embutido. Os caracteres de controle são interpretados como qualquer outro caractere pelo driver de terminal. |
| **`echo()`** | Ligue o eco. |
| **`noecho()`** | Desative o eco. |
| **`keypad(stdscr, TRUE)`** | Habilita a leitura das teclas de função. |
| **`halfdelay()`** | Habilita o modo de meio-retardo, ele espera por 'X' décimos de segundo pela entrada e retorna **`ERR`**, se nenhuma entrada estiver disponível |

---

## Funções diversas

| Funções | Descrição |
| ------------- | ------------- |
| **`clear()`** | Limpa a janela stdscr. |
| **`wclear()`** | Limpa a janela fornecida. |
| **`move(y, x)`** | Mova o cursor para a posição **x**, **y** na janela. |
| **`wmove(win, y, x)`** | Mova o cursor para a posição **x**, **y** na janela fornecida. |
| **`getmaxyx(stdscr, y, x)`** | Obter os limites da tela, ou seja, o número de linhas e colunas |
| **`getyx(stdscr, y, x)`** | Obtenha a posição atual do cusor |


---

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## Funções de saída

| Funções | Descrição |
| ------------- | ------------- |
| **`addch()`** | Imprime um caractere com os atributos fornecidos na posição atual do cursor e avança a posição do cursor. |
| **`mvaddch()`** | Mova o cursor para uma determinada posição e imprima como por **`addch()`** . |
| **`waddch()`** | Imprime um caractere como por **`addch()`**, mas na janela fornecida. |
| **`mvwaddch()`** | Mova o cursor para uma determinada posição e, em seguida, imprima como por **`addch()`**, mas na janela fornecida. |
| **`printw()`** | Imprime semelhante a **`printf()`**, mas em qualquer posição na janela, ou seja, a posição atual do cursor e avança a posição do cursor. |
| **`mvprintw()`** | Mova o cursor para uma determinada posição e depois imprima como por **`printw()`** . |
| **`wprintw()`** | Imprime como em **`printw()`**, mas na janela fornecida. |
| **`mvwprintw()`** | Mova o cursor para uma determinada posição e, em seguida, imprima como por **`printw()`**, mas para a janela fornecida. |
| **`addstr()`** | Imprime uma cadeia de caracteres com os atributos fornecidos na posição atual do cursor e avança a posição do cursor. |
| **`mvaddstr()`** | Mova o cursor para uma determinada posição e imprima como por **`addstr()`** . |
| **`waddstr()`** | Imprime uma cadeia de caracteres como em **`addstr()`**, mas na janela fornecida. |
| **`mvwaddstr()`** | Mova o cursor para uma determinada posição e, em seguida, imprima como por **`addstr()`**, mas na janela fornecida. |


---


## Funções de entrada

| Funções | Descrição |
| ------------- | ------------- |
| **`getch()`** | Insira um caractere com os atributos fornecidos da posição atual do cursor e avance a posição do cursor. |
| **`mvgetch()`** | Mova o cursor para uma determinada posição e insira como por **`getch()`** . |
| **`whetch()`** | Insira um caractere como **`getch()`**, mas a partir da janela fornecida. |
| **`mvwgetch()`** | Mova o cursor para uma determinada posição e, em seguida, insira como por **`getch()`**, mas na janela fornecida. |
| **`scanw()`** | Recebe entrada semelhante a **`scanf()`**, mas de qualquer posição na janela, ou seja, a posição atual do cursor e avança a posição do cursor. |
| **`mvscanw()`** | Mova o cursor para uma determinada posição e insira como por **`scanw()`** . |
| **`wscanw()`** | Recebe entrada como por **`scanw()`**, mas da janela fornecida. |
| **`mvwscanw()`** | Mova o cursor para uma determinada posição e, em seguida, insira como por **`scanw()`**, mas a partir da janela fornecida. |
| **`getstr()`** | Insira uma cadeia de caracteres com os atributos fornecidos a partir da posição atual do cursor e avance a posição do cursor. |
| **`mvgetstr()`** | Mova o cursor para uma determinada posição e insira como por **`getstr()`** . |
| **`wgetstr()`** | Insira uma cadeia de caracteres como em **`getstr()`**, mas a partir da janela fornecida. |
| **`mvwgetstr()`** | Mova o cursor para uma determinada posição e insira como por **`getstr()`** mas a partir da janela fornecida. |


---


## Funções de Atributo

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

| Funções | Descrição |
| ------------- | ------------- |
| **`attron()`** | Alterna os atributos dados a ele. |
| **`wattron()`** | Ativa **o(s)** **atributo(s)** **fornecido(s)** a ele, na janela fornecida. |
| **`attrset()`** | Sobrescreve totalmente quaisquer atributos que a janela tinha anteriormente e os define para os novos atributos. |
| **`wattrset()`** | Substitui totalmente quaisquer atributos que a janela fornecida tinha anteriormente e os define como os novos atributos. |
| **`attroff()`** | Desativa os atributos dados a ele. |
| **`wattroff()`** | Desativa o(s) **atributo(s)** fornecido(s) a ele, na janela fornecida. |
| **`standend()`** | Desativa todos os atributos e leva você ao modo normal. |
| **`attr_get()`** | Obtém os atributos atuais e o par de cores da janela. |
| **`wattr_get()`** | Obtém os atributos atuais e o par de cores da janela fornecida. |
| **`chgat()`** | Altere **atributo(s)** para caracteres que já estão na tela. |
| **`mvchgat()`** | Mova o cursor para a posição fornecida e, em seguida, execute o trabalho como por **`chgat()`** . |
| **`wchgat()`** | Realiza o trabalho feito por **`chgat()`** na janela fornecida. |
| **`mvwchgat()`** | Mova o cursor para a posição fornecida e execute o trabalho como por **`chgat()`** na janela fornecida. |

---

## Lista de Atributos

Podemos **`OR`**(`|`) qualquer número dos atributos acima para obter um efeito combinado.

| Funções | Descrição |
| ------------- | ------------- |
| **`A_NORMAL`** | Exibição **normal(sem destaque)** . |
| **`A_STANDOUT`** | Melhor modo de destaque do terminal. |
| **`A_UNDERLINE`** | Sublinhado. |
| **`A_REVERSE`** | Vídeo reverso. |
| **`A_BLINK`** | Piscando. |
| **`A_DIM`** | Meio brilhante. |
| **`A_BOLD`** | Extra brilhante ou negrito. |
| **`A_PROTECT`** | Modo protegido. |
| **`A_INVIS`** | Modo invisível ou em branco. |
| **`A_ALTCHARSET`** | Conjunto de caracteres alternativos. |
| **`A_CHARTEXT`** | Máscara de bits para extrair um caractere. |
| **`COLOR_PAIR`**(n) | Número do par de cores n. |

---

## Funções de cor

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

| Funções | Descrição |
| ------------- | ------------- |
| **`start_color()`** | Precisa ser chamado antes de usar cores. |
| **`has_colors()`** | Verifique se o terminal tem recursos de cores. |
| **`init_pair()`** | Inicie um número de par de cores n com cor de primeiro e segundo plano, que pode ser usado em **`COLOR_PAIR`**(n). |
| **`init_color()`** | Altere os valores rgb para as cores definidas por curses inicialmente. |
| **`can_change_color()`** | Verifique se o terminal tem capacidade de mudar de cor. |

---

## Colors

As seguintes cores são definidas em curses.h. Você pode usá-los como parâmetros para várias funções de cores.

| Cores | Código |
| ------------- | ------------- |
| **`COLOR_BLACK`** | 0 |
| **`COLOR_RED`** | 1 |
| **`COLOR_GREEN`** | 2 |
| **`COLOR_YELLOW`** | 3 |
| **`COLOR_BLUE`** | 4
| **`COLOR_MAGENTA`** | 5 |
| **`COLOR_CYAN`** | 6
| **`COLOR_WHITE`** | 7

---

## Funções de Janelas

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

| Funções | Descrição |
| ------------- | ------------- |
| **`box()`** | Desenhe uma borda ao redor das janelas. |
| **`newwin()`** | Cria uma nova janela. |
| **`create_newwin()`** | Cria uma nova janela com **`newwin()`** e exibe uma borda ao redor com **`box()`** .
| **`delwin()`** | Desalocar memória relacionada à janela. |
| **`destroy_win()`** | Apaga a janela da tela a dn e a exclui chamando **`delwin()`** |
| **`wborder()`** | Desenha uma borda ao redor da janela pelos caracteres fornecidos a ela. |

---

<style>
div.pagina p { text-align: left; }
hr {border: 1px solid #333; margin-top: 10px; }
</style>
