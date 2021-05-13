---
layout: post
title: "O Jogo Racha-Cuca feito com C++ e NCURSES"
date: 2021-05-13 10:01:50
image: '/assets/img/games/racha-cuca-cpp-ncurses.jpg'
description: 'Para treinar e se divertir!'
icon: 'ion:terminal-sharp'
iconname: 'Ncurses'
tags:
- cppdaily
- cpp
---

![O Jogo Racha-Cuca feito com C++ e NCURSES](/assets/img/games/racha-cuca-cpp-ncurses.jpg)

Quem já tem 30 anos ou mais vai lembrar desse joguinho de raciocínio que literalmente rachava a cuca:

![Racha-Cuca](/assets/img/games/racha-cuca.jpg)

Ele também era conhecido como [O jogo do 15](https://pt.wikipedia.org/wiki/O_jogo_do_15), o objetivo do jogo é ordenar os quadrados, da esquerda para a direita e de cima para baixo, isto é, obter a disposição original dos contadores depois de terem sido aleatoriamente deslocados. 

![Racha-Cuca](/assets/img/games/racha-cuca-2.jpg)

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


Pra quem deseja treinar raciocínio essa é uma boa dica! Mas falando em treinar, você também pode treinar seus conhecimentos em [C++](https://terminalroot.com.br/cpp) e [NCURSES](https://terminalroot.com.br/ncurses), pois essa dica de hoje do [cpp::daily](https://terminalroot.com.br/tags#cppdaily) vai ser sobre ele.

Lembrando que o **Jovane Rocha** tem contribuído com a tradução da nossa página sobre NCURSES: <https://terminalroot.com.br/ncurses> e já estamos com a documentação quase completa e esse joguinho também faz parte da coleção de games!

Assim como há na documentação, para compilar, primeiramente você precisa da biblioteca NCURSES instalada no seu sistema(geralmente ela já está em todos os [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/linux)), mas você precisará da versão `dev` e o [g++](https://terminalroot.com.br/cpp).

Para sistemas que utilizam APT, seria mais ou menos:
{% highlight bash %}
sudo apt install libncurses5 libncurses5-dev
{% endhighlight %}
> Observação: A versão 6, se estiver disponível, é melhor ainda!

Então criar seu binário:
{% highlight bash %}
g++ racha-cuca.cpp -o racha-cuca -lncurses -ltinfo
{% endhighlight %}

Ao executá-lo você precisará informar o número de "casas", pois ele vai além de 15 pastilhas. É possível começar com 3,4,5,6... e assim por diante!
> Menos que 3 é fácil demais e lhe trará problemas! 😃 

Exemplo com **5**
{% highlight bash %}
./racha-cuca 5
{% endhighlight %}

![Racha-Cuca C++ e NCURSES](/assets/img/games/racha-cuca.gif)

Para sair do game tecle **F1**.

Código do Racha-Cuca: `vim racha-cuca.cpp`

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

{% highlight cpp %}
#include <ncurses.h>
#include <iostream>

#define STARTX 9
#define STARTY 3
#define WIDTH  6
#define HEIGHT 4

#define BLANK 0

typedef struct _tile {
  int x;
  int y;
}tile;

void init_board(int **board, int n, tile *blank);
void board(WINDOW *win, int starty, int startx, int lines, int cols, 
    int tile_width, int tile_height);
void shuffle_board(int **board, int n);
void move_blank(int direction, int **s_board, int n, tile *blank);
int check_win(int **s_board, int n, tile *blank);

enum { LEFT, RIGHT, UP, DOWN };

int main(int argc, char *argv[]){
  int **s_board;
  int n, i, ch;
  tile blank;

  if(argc != 2){
    //printf("Usage: %s <shuffle board order>\n", argv[0]);
    std::cout << "Usage: " << argv[0] << "<shuffle board order>\n";
    exit(1);
  }
  n = atoi(argv[1]);

  s_board = (int **)calloc(n, sizeof(int *));

  for(i = 0;i < n; ++i){
    s_board[i] = (int *)calloc(n, sizeof(int));
  }

  init_board(s_board, n, &blank);
  initscr();
  keypad(stdscr, TRUE);
  cbreak();
  shuffle_board(s_board, n);
  while((ch = getch()) != KEY_F(1)){
    switch(ch){
      case KEY_LEFT:
        move_blank(RIGHT, s_board, n, &blank);
        break;
      case KEY_RIGHT:
        move_blank(LEFT, s_board, n, &blank);
        break;
      case KEY_UP:
        move_blank(DOWN, s_board, n, &blank);
        break;
      case KEY_DOWN:
        move_blank(UP, s_board, n, &blank);
        break;
    }
    shuffle_board(s_board, n);
    if(check_win(s_board, n, &blank) == TRUE){
      mvprintw(24, 0, "You Win !!!\n");
      refresh();
      break;
    }
  }
  endwin();
  return 0;	
}

void move_blank(int direction, int **s_board, int n, tile *blank){
  int temp;

  switch(direction){
    case LEFT:
      {	if(blank->x != 0){
                           --blank->x;
                           temp = s_board[blank->x][blank->y];
                           s_board[blank->x + 1][blank->y] = temp;
                           s_board[blank->x][blank->y] = BLANK;
                         }
      }
      break;
    case RIGHT:
      {	if(blank->x != n - 1)
        {	++blank->x;
          temp = s_board[blank->x][blank->y];
          s_board[blank->x - 1][blank->y] = temp;
          s_board[blank->x][blank->y] = BLANK;
        }
      }
      break;
    case UP:
      {	if(blank->y != 0)
        {	--blank->y;
          temp = s_board[blank->x][blank->y];
          s_board[blank->x][blank->y + 1] = temp;
          s_board[blank->x][blank->y] = BLANK;
        }
      }
      break;
    case DOWN:
      {	if(blank->y != n - 1)
        {	++blank->y;
          temp = s_board[blank->x][blank->y];
          s_board[blank->x][blank->y - 1] = temp;
          s_board[blank->x][blank->y] = BLANK;
        }
      }
      break;			
  }
}

int check_win(int **s_board, int n, tile *blank){
  int i, j;

  s_board[blank->x][blank->y] = n * n;
  for(i = 0;i < n; ++i)
    for(j = 0;j < n; ++j)
      if(s_board[i][j] != j * n + i + 1)
      {	s_board[blank->x][blank->y] = BLANK;
        return FALSE;
      }

  s_board[blank->x][blank->y] = BLANK;
  return TRUE;	
}

void init_board(int **s_board, int n, tile *blank){
  int i, j, k;
  int *temp_board;

  temp_board = (int *)calloc(n * n, sizeof(int));
  srand(time(NULL));
  for(i = 0;i < n * n; ++i)
  {    
repeat :
    k = rand() % (n * n);
    for(j = 0;j <= i - 1; ++j)
      if (k == temp_board[j])
        goto repeat;
      else
        temp_board[i] = k;
  }
  k = 0;
  for (i = 0;i < n;++i)
    for(j = 0;j < n; ++j,++k)
    {	if(temp_board[k] == 0)
      {	blank->x = i;
        blank->y = j;
      }
      s_board[i][j] = temp_board[k];
    }
  free(temp_board);
}

void board(WINDOW *win, int starty, int startx, int lines, int cols, 
    int tile_width, int tile_height){
  int endy, endx, i, j;

  endy = starty + lines * tile_height;
  endx = startx + cols  * tile_width;

  for(j = starty; j <= endy; j += tile_height)
    for(i = startx; i <= endx; ++i)
      mvwaddch(win, j, i, ACS_HLINE);
  for(i = startx; i <= endx; i += tile_width)
    for(j = starty; j <= endy; ++j)
      mvwaddch(win, j, i, ACS_VLINE);
  mvwaddch(win, starty, startx, ACS_ULCORNER);
  mvwaddch(win, endy, startx, ACS_LLCORNER);
  mvwaddch(win, starty, endx, ACS_URCORNER);
  mvwaddch(win, 	endy, endx, ACS_LRCORNER);
  for(j = starty + tile_height; j <= endy - tile_height; j += tile_height)
  {	mvwaddch(win, j, startx, ACS_LTEE);
    mvwaddch(win, j, endx, ACS_RTEE);	
    for(i = startx + tile_width; i <= endx - tile_width; i += tile_width)
      mvwaddch(win, j, i, ACS_PLUS);
  }
  for(i = startx + tile_width; i <= endx - tile_width; i += tile_width)
  {	mvwaddch(win, starty, i, ACS_TTEE);
    mvwaddch(win, endy, i, ACS_BTEE);
  }
  wrefresh(win);
}

void shuffle_board(int **s_board, int n){
  int i,j, deltax, deltay;
  int startx, starty;

  starty = (LINES - n * HEIGHT) / 2;
  startx = (COLS  - n * WIDTH) / 2;
  clear();
  mvprintw(24, 0, "Press F1 to Exit");
  board(stdscr, starty, startx, n, n, WIDTH, HEIGHT);
  deltay = HEIGHT / 2;
  deltax = WIDTH  / 2;
  for(j = 0; j < n; ++j)
    for(i = 0;i < n; ++i)
      if(s_board[i][j] != BLANK)
        mvprintw(starty + j * HEIGHT + deltay,
            startx + i * WIDTH  + deltax,
            "%-2d", s_board[i][j]);
  refresh();
}
{% endhighlight %}

Por hoje é só, são pequenas doses diárias que farão sempre nos manter antenado com o [C++](https://terminalroot.com.br/cpp/) !

## Acompanhe o [cpp::daily](https://terminalroot.com.br/tags#cppdaily)

# Deseja aprender [C++](https://terminalroot.com.br/cpp/) e criar seus programas Gráficos e para Terminal com portabilidade para Linux e Windows?
Então se inscreva nos nossos [Cursos de C++ Moderno](https://terminalroot.com.br/cpp/) . Você aprender criar:
- [Games](https://terminalroot.com.br/tags#games)
- [Ncurses](https://terminalroot.com.br/2021/02/crie-programas-graficos-no-terminal-com-cpp-e-ncurses.html)
- Interface Gráfica: [GTK+](https://terminalroot.com.br/2020/08/anjuta-o-melhor-ide-para-c-com-gtkmm.html) e [Qt](https://terminalroot.com.br/2021/02/gerencie-suas-contas-financeiras-pessoais-com-terminal-finances.html)
- Acesso à Banco de Dados([MySQL](https://terminalroot.com.br/mysql/) e SQLite) via [C++](https://terminalroot.com.br/cpp/)
- Padronização
- E muito mais!

Acesse o endereço:
# <https://terminalroot.com.br/cpp/> e saiba mais!

