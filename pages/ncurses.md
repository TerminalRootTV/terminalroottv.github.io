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

A diferença entre essas duas funções está na maneira como os caracteres de controle como suspender (CTRL-Z), interromper e sair (CTRL-C) são passados para o programa. No modo `raw()`, esses caracteres são passados diretamente para o programa sem gerar um sinal. No modo `cbreak()`, esses caracteres de controle são interpretados como qualquer outro caractere pelo driver do terminal. Eu pessoalmente prefiro usar `raw()` porque posso exercer maior controle sobre o que o usuário faz.

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
// Use example: 
// wget -q https://git.io/file.md
// ./a.out file.md
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

Exemplo 6. Usando `chgat`
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

Exemplo 7. Exemplo de Borda da janela
```cpp
#include <ncurses.h>

WINDOW *create_newwin(int height, int width, int starty, int startx);
void destroy_win(WINDOW *local_win);

int main(int argc, char *argv[]){
  WINDOW *my_win;
  int startx, starty, width, height;
  int ch;

  initscr();			/* Inicia o modo curses 		*/
  cbreak();				/* Buffer de linha desativado, passe 
                                         * tudo para mim 		*/
  keypad(stdscr, TRUE);		/* Eu preciso daquele F1 bacana 	*/

  height = 3;
  width = 10;
  starty = (LINES - height) / 2;	/* Calculando para um posicionamento central */
  startx = (COLS - width) / 2;	/* da janela		*/
  printw("Press F1 to exit");
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

  endwin();			/* Termina o modo curses		  */
  return 0;
}

WINDOW *create_newwin(int height, int width, int starty, int startx){
  WINDOW *local_win;

  local_win = newwin(height, width, starty, startx);
  box(local_win, 0 , 0);		/* 0, 0 dá caracteres padrão 
                                         * para as linhas verticais and horizontais	*/
  wrefresh(local_win);		/* Mostra aquela caixa 		*/

  return local_win;
}

void destroy_win(WINDOW *local_win){	
  / * box (local_win, '', ''); : Isso não produzirá o resultado
    *  desejado de apagar a janela. Vai deixar seus quatro cantos,
    * e uma lembrança feia da janela.
      * /
      wborder (local_win, '', '', '', '', '', '', '', '');
  / * Os parâmetros usados são
    * 1. win: a janela na qual operar
    * 2. ls: caractere a ser usado para o lado esquerdo da janela
    * 3. rs: caractere a ser usado para o lado direito da janela
    * 4. ts: caractere a ser usado na parte superior da janela
    * 5. bs: caractere a ser usado na parte inferior da janela
    * 6. tl: caractere a ser usado para o canto superior esquerdo da janela
    * 7. tr: caractere a ser usado no canto superior direito da janela
    * 8. bl: caractere a ser usado no canto inferior esquerdo da janela
    * 9. br: caractere a ser usado no canto inferior direito da janela
    * /
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

Exemplo 8. Mais funções de bordas
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

  initscr();					/* Começa o modo curses 		*/
  start_color();			/* Começa a funcionalidade das cores */
  cbreak();						/* Buffer de linha desativado, passe 
                                                         * tudo para mim * /
                                                         keypad(stdscr, TRUE);		/* Preciso daquele F1 bacana 	*/
  noecho();
  init_pair(1, COLOR_CYAN, COLOR_BLACK);

  /* Inicializa os parâmetros da janela */
  init_win_params(&win);
  print_win_params(&win);

  attron(COLOR_PAIR(1));
  printw("Press F1 to exit");
  refresh();
  attroff(COLOR_PAIR(1));

  create_box(&win, TRUE);
  while((ch = getch()) != KEY_F(1))
  {	switch(ch)
    {	case KEY_LEFT:
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
  endwin();			/* Termina o modo curses		  */
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

Exemplo 9. Um simples exemplo com  cores
```cpp
#include <ncurses.h>

void print_in_middle(WINDOW *win, int starty, int startx, int width, char *string);
int main(int argc, char *argv[]){
  initscr();                      /* Inicia o modo curses            */
  if(has_colors() == FALSE){
    endwin();
    printf("Your terminal does not support color\n");
    exit(1);
  }
  start_color();                  /* Inicia as cores                  */
  init_pair(1, COLOR_RED, COLOR_BLACK);

  attron(COLOR_PAIR(1));
  print_in_middle(stdscr, LINES / 2, 0, 0, "Viola !!! In color ...");
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

Isso pode parecer complicado no início. Mas esta solução elegante nos permite gerenciar pares de cores muito facilmente. Para apreciá-lo, você tem que olhar para o código fonte de "diálogo", um utilitário para exibir caixas de diálogo a partir de scripts [shell](https://terminalroot.com.br/shell). Os desenvolvedores definiram combinações de primeiro e segundo plano para todas as cores de que podem precisar e inicializaram no início. Isso torna muito fácil definir atributos apenas acessando um par que já definimos como uma constante. 

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
A função `init_color()`pode ser usada para alterar os valores rgb para as cores definidas por curses inicialmente. Digamos que você queira aumentar a intensidade da cor vermelha de uma forma ínfima. Então você pode usar esta função como
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

#define WIDTH 30
#define HEIGHT 10 

int startx = 0;
int starty = 0;

char *choices[] = { 
  "Choice 1",
  "Choice 2",
  "Choice 3",
  "Choice 4",
  "Exit",
};
int n_choices = sizeof(choices) / sizeof(char *);
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
  while( 1 ){
    c = wgetch(menu_win);
    switch(c){
      case KEY_UP:
        if(highlight == 1)
          highlight = n_choices;
        else
          --highlight;
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
        mvprintw(24, 0, "O caractere pressionado é =% 3d Com fé, será impresso como '%c'", c, c);
        refresh();
        break;
    }
    print_menu(menu_win, highlight);
    if(choice != 0) /* O usuário fez uma escolha que saiu do loop infinito */
      break;
  }

  mvprintw(23, 0, "Você escolheu a escolha %d com escolha de string %s\n", choice, choices[choice - 1]);
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
      mvwprintw(menu_win, y, x, "%s", choices[i]);
      wattroff(menu_win, A_REVERSE);
    }else{
      mvwprintw(menu_win, y, x, "%s", choices[i]);
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

Exemplo 11. Acesse o menu com mouse!!!
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

Depois, e ser re duas funções simples podem ser usadas de forma eficaz para manter um jogo em movimento rápido com cenários variáveis.

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
Algumas vezes você pode querer voltar ao modo cooked (modo de buffer de linha normal) temporariamente. Nesse caso, você primeiro precisa salvar os modos `tty` com uma chamada para `def_prog_mode()` e então chamar `endwin()` para encerrar o modo curses. Isso o deixará no modo `tty` original. Para voltar ao curses uma vez estiver pronto, chame `reset_prog_mode()`.

Esta função retorna o `tty` ao estado armazenado por `def_prog_mode()`. Depois, chame `refreh()`, e você está de volta ao modo curses. Aqui está um exemplo mostrando a sequência de coisas a serem feitas.

Exemplo 12. Saindo temporariamente do modo curses
```cpp
#include <ncurses.h>

int main(){	

  initscr();			/* Inicia o modo curses 		  */
  printw("Hello World !!!\n");	/* Imprime Hello World		  */
  refresh();			/* Imprime na tela real */
  def_prog_mode();		/* Salva o modo tty 		  */
  endwin();			/* Termina o modo curses temporariamente	  */
  system("/bin/sh");		/* Faça o que quiser no modo cooked */
  reset_prog_mode();		/* Retornar ao modo tty anterior */
  /* armazenado por def_prog_mode() 	  */
  refresh();			/* Faça refresh() para restaurar os	  */
  /* conteúdos da tela		  */
  printw("Another String\n");	/* De volta ao curses, use a capacidade    */
  refresh();			/*  completa do curses */
  endwin();			/* Termina o modo curses		  */

  return 0;
}
```

## 13.3. Variáveis `ACS`
Se você já programou no **DOS**, você sabe sobre esses caracteres bacanas no conjunto de caracteres estendidos. Eles podem ser impressos apenas em alguns terminais. Funções NCURSES como `box()` usam esses caracteres.

Todas essas variáveis começam com `ACS`, significando um conjunto de caracteres alternativos. Você deve ter me notado usando esses caracteres em alguns dos programas acima. Aqui está um exemplo mostrando todos os caracteres.

Exemplo 13. Exemplo de variáveis ACS
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




















---

# CHEAT SHEET NCURSES

---

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
# Essa página ainda está incompleta, demais ainda serão adicionados a partir [daqui]().
## TÓPICOS QUE AINDA FALTAM
```txt
15. Biblioteca do painel
    15.1. O básico
    15.2. Compilando com a biblioteca de painéis
    15.3. Navegação na janela do painel
    15.4. Usando ponteiros do usuário
    15.5. Movendo e redimensionando painéis
    15.6. Escondendo e mostrando painéis
    15.7. Funções `panel_above()` e `panel_below()`

16. Biblioteca de Menus
    16.1. O básico
    16.2. Compilando com a Biblioteca do Menu
    16.3. Menu Driver: O cavalo de trabalho do sistema de menu
    16.4. Janelas de menu
    16.5. Menus de rolagem
    16.6. Menus multi-colunas
    16.7. Menus de vários valores
    16.8. Opções do menu
    16.8. O útil ponteiro do usuário

17. Biblioteca de formulários
    17.1. O básico
    17.2. Compilando com a Biblioteca de Formulários
    17.3. Brincando com Campos
    17.4. Form Windows
    17.5. Validação de Campo
    17.6. Driver de formulário: O cavalo de trabalho do sistema de formulários

18. Ferramentas e bibliotecas de widgets
    18.1. CDK (kit de desenvolvimento de ncurses)
    18.2. O diálogo
    18.3. Módulos Perl Curses `CURSES::FORM` e `CURSES::WIDGETS`

19. Just For Fun !!!
    20.1. O jogo da vida
    20.2. Quadrado mágico
    20.3. Torres de Hanói
    20.4. Queens Puzzle
    20.5. Shuffle
    20.6. Tutor de Digitação
20. Referências
```
---


<style>
div.pagina p { text-align: left; }
hr {border: 1px solid #333; margin-top: 10px; }
</style>
