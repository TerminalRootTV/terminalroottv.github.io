---
layout: post
title: "Conheça 4 Games e Animação para Terminal feito com C++"
date: 2022-03-23 14:11:02
image: '/assets/img/cppdaily/2048.jpg'
description: 'Diversão, aprendizado e referência de estudos.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
- terminal
---


Aqui no [blog](https://terminalroot.com.br/) o que mais tem é conteúdo sobre [gráficos para terminal](https://terminalroot.com.br/tags#terminal)(TUI, **T**erminal **U**ser **I**nterface) e [linha de comando](https://terminalroot.com.br/tags#comandos), esse blog faz jus ao nome 😎 . 

E hoje vamos dar uma incrementada nesse conteúdo indicando alguns [games](https://terminalroot.com.br/tags#games) e [animações](https://terminalroot.com.br/tags#unixporn) no terminal que servem para propostas como: diversão, aprender e estudar o código fonte.

E nesse caso, vamos indicar 4 softwares escritos em [C++](https://terminalroot.com.br/cpp) que possuem um código de fácil entendimento.

Vamos à essas 4 dicas!

---

# 2048.cpp
![2048.cpp](/assets/img/cppdaily/2048.jpg) 

---

[2048](https://en.wikipedia.org/wiki/2048_(video_game)) é um game de raciocínio criado em março de 2014 pelo desenvolvedor italiano Gabriele Cirulli, em que o objetivo é deslizar peças numeradas em uma grade, combiná-las e criar um azulejo com o número 2048.

**2048.cpp** é a versão desse game escrita em [C++](https://terminalroot.com.br/tags#cpp) . Para compilar você precisará das seguintes ferramentas:
+ [Git](https://terminalroot.com.br/tags#git)
+ [g++](https://terminalroot.com.br/tags#gcc) ou [clang++](https://terminalroot.com.br/tags#clang)
+ [cmake](https://terminalroot.com.br/tags#cmake)
+ e [GNU Makefile](https://terminalroot.com.br/tags#make)

Após possuir as dependências em tempo de compilação, agora basta clonar, construir e instalar com os seguintes comandos:
{% highlight cpp %}
git clone https://github.com/plibither8/2048.cpp
cd 2048.cpp
mkdir build && cd build
cmake ..
make
{% endhighlight %}

Após gerado o binário, você já pode jogá-lo! Basta rodar:
{% highlight sh %}
./2048
{% endhighlight %}

Na primeira tela exibida escolha a opção desejada, ou seja, para um novo game tecle o número **1** e em seguida pressione **Enter** .
{% highlight sh %}

   /\\\\\\\\\          /\\\\\\\                /\\\         /\\\\\\\\\
  /\\\///////\\\      /\\\/////\\\            /\\\\\       /\\\///////\\\
  \///      \//\\\    /\\\    \//\\\         /\\\/\\\      \/\\\     \/\\\
             /\\\/    \/\\\     \/\\\       /\\\/\/\\\      \///\\\\\\\\\/
           /\\\//      \/\\\     \/\\\     /\\\/  \/\\\       /\\\///////\\\
         /\\\//         \/\\\     \/\\\   /\\\\\\\\\\\\\\\\   /\\\      \//\\\
        /\\\/            \//\\\    /\\\   \///////////\\\//   \//\\\      /\\\
        /\\\\\\\\\\\\\\\   \///\\\\\\\/              \/\\\      \///\\\\\\\\\/
        \///////////////      \///////                \///         \/////////
  


  Welcome to 2048!

        1. Play a New Game
        2. Continue Previous Game
        3. View Highscores and Statistics
        4. Exit

  Enter Choice: 
{% endhighlight %}

Em seguida defina a quantidade de linhas e colunas do game que representa, de alguma forma, o nível de dificuldade, o valor mínimo é **3**(três) . Por exemplo, tecle **4**(zero) e em seguida pressione **Enter** e o jogo iniciará:


{% highlight sh %}
  (NOTE: Scores and statistics will be saved only for the 4x4 gameboard)
  Enter gameboard size - (Enter '0' to go back): 
{% endhighlight %}

O mini tutorial de uso se encontra na própria tela do games:

{% highlight sh %}
  ┌───────────────────────────┐
  │ SCORE:                 96 │
  │ BEST SCORE:            96 │
  │ MOVES:                 20 │
  └───────────────────────────┘
 
  ┌──────┬──────┬──────┬──────┐
  │    2 │   16 │    4 │      │
  ├──────┼──────┼──────┼──────┤
  │   16 │    4 │      │      │
  ├──────┼──────┼──────┼──────┤
  │    4 │      │    2 │      │
  ├──────┼──────┼──────┼──────┤
  │    2 │      │      │      │
  └──────┴──────┴──────┴──────┘

  W or K or ↑ => Up
  A or H or ← => Left
  S or J or ↓ => Down
  D or L or → => Right
  Z or P => Save
  
  Press the keys to start and continue.
{% endhighlight %}

Se quiser sair do game tecle **Ctrl + C** .

Para instalar basta mover esse binário para algum caminho contido na sua variável `$PATH`, exemplo:
{% highlight sh %}
sudo install -v 2048 /usr/local/bin
{% endhighlight %}

Depois remova o diretório clonado:
{% highlight sh %}
cd ../.. # Se ainda estiver dentro de build/
rm -rf 2048.cpp
{% endhighlight %}
E em seguida quando quiser jogá-lo só rodar o comando `2048` no terminal .

> Há uma opçaõ de compilar com o [Meson](https://terminalroot.com.br/tags#meson) para mais informações consulte o [repositório](https://github.com/plibither8/2048.cpp) .

Conheça também outra alternativa ao *2048.cpp* um *2048* feito em [C](https://terminalroot.com.br/tags#linguagemc): [2048-in-terminal](https://github.com/alewmoose/2048-in-terminal) .


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# Ascii Bird
[Flappy Bird](https://en.wikipedia.org/wiki/Flappy_Bird) é um jogo que inicialmente desenvolvido para celular feito pelo programador vietnamita Dong Nguyen.

![Ascii Bird](/assets/img/cppdaily/flap.jpg) 

O game é um *side-scroller* onde o jogador controla um pássaro, tentando voar entre colunas de canos verdes sem bater neles. 

**Ascii Bird** é um game baseado em Flappy Bird feito com a biblioteca [NCURSES](https://terminalroot.com.br/ncurses) criado usando somente os caracteres da tabela [ASCII](https://en.wikipedia.org/wiki/ASCII) .

Você precisará das seguintes ferramentas para conseguir construir no seu sistema:
+ [NCURSES](https://terminalroot.com.br/ncurses)
+ [Git](https://terminalroot.com.br/tags#git)
+ [g++](https://terminalroot.com.br/tags#gcc) ou [clang++](https://terminalroot.com.br/tags#clang)
+ e [GNU Makefile](https://terminalroot.com.br/tags#make)

Após isso rode os comandos:
{% highlight sh %}
git clone https://github.com/hamikm/AsciiBird.git
cd AsciiBird
make
{% endhighlight %}

E para testar, basta rodar: `./flap` .

O jogo será carregado automaticamente após a animação similiar abaixo:
{% highlight sh %}
                   ___ _                       ___ _        _
                  | __| |__ _ _ __ _ __ _  _  | _ |_)_ _ __| |
                  | _|| / _` | '_ \ '_ \ || | | _ \ | '_/ _` |
                  |_| |_\__,_| .__/ .__/\_, | |___/_|_| \__,_|
                             |_|  |_|   |__/


                              Press <up> to flap!


 [==============================================================         ]
{% endhighlight %}

Após isso será automaticamente iniciado, use as teclas direcionais para cima **↑** e para baixo **↓** para movimentar o player.

Para instalar basta mover esse binário para algum caminho contido na sua variável `$PATH`, exemplo:
{% highlight sh %}
sudo install -v flap /usr/local/bin
{% endhighlight %}
> E quando quiser jogar rode: `flap` no terminal . Para mais informações consulte o [repositório](https://github.com/hamikm/AsciiBird) .

---

# Pong
[Pong](https://en.wikipedia.org/wiki/Pong) é um jogo esportivo bidimensional que simula o tênis de mesa . O jogador controla uma raquete no jogo movendo-a verticalmente na tela. 

Eles podem competir contra outro jogador controlando uma segunda raquete no lado oposto. Os jogadores usam as pás para bater uma bola para frente e para trás. O objetivo é que cada jogador alcance onze pontos antes do adversário; pontos são ganhos quando um não consegue devolver a bola para o outro.

Pong foi fabricado pela Atari e lançado originalmente em 1972. Foi um dos primeiros videogames de arcade de sucesso no mundo.

Existem diversos *remakes* de Pong, um deles é o Pong escrito em [C++](https://terminalroot.com.br/cpp) e [NCURSES](https://terminalroot.com.br/ncurses) .

Para instalar, lembre-se de ter as dependências de construção: [Git](https://terminalroot.com.br/tags#git), [g++](https://terminalroot.com.br/tags#g++) e [GNU Make](https://terminalroot.com.br/tags#makefile) .

Para instalar, rode:
{% highlight cpp %}
git clone https://github.com/zacharyvincze/Pong
cd Pong
sed -i 's/-lncurses/-lncurses -ltinfo/g' Makefile
make
{% endhighlight %}

Após compilado, rode: `./pong` e utilize as teclas **w**, **a**, **s** e **d** para o player 1 e **↑**, **→**, **↓** e **←** para o player 2 para jogar . Para mais informações acesse o [repositório](https://github.com/zacharyvincze/Pong) .

![Pong C++](https://github.com/zacharyvincze/Pong/raw/master/screenshots/pong.png) 

Uma alternativa à esse Pong é o **PongC** feito em [C](https://terminalroot.com.br/tags#linguagemc) que pode acessado [aqui](https://github.com/Entalpi/PongC) .

---

# ASCII Rain
**ASCII Rain** é uma animação de chuva no terminal. 

Você irá perguntar: 
> *— Pra que diabos eu quero ficar vendo chuva no terminal ?*

Bom, realmente essa é uma questão legítima, mas existe uma cultura chamada: [unixporn](https://terminalroot.com.br/tags#unixporn) que gostam de utilizar esses recursos para melhorar seu *rice*(termo utilizado para representar a combinação de customizações do ambiente desktop de forma diferenciada).

Nós possuímos [alguns artigos](https://terminalroot.com.br/tags#unixporn) nesse sentido e para mais informações [clique nesse link](https://terminalroot.com.br/tags#unixporn) . 

Se você quiser reproduzir essa chuva no terminal, instale as dependências(`git`,`gcc` e `make`). E depois clone:
{% highlight sh %}
git clone https://github.com/nkleemann/ascii-rain
{% endhighlight %}

Compile:
{% highlight sh %}
gcc rain.c -o rain -lncurses -ltinfo
{% endhighlight %}

Rode e/ou instale:
{% highlight sh %}
./rain
sudo install -v rain /usr/local/bin
{% endhighlight %}

Resultado:

![ASCII Rain](https://github.com/nkleemann/ascii-rain/raw/master/demo/rain.gif) 


Para mais informações acesse o [repositório](https://github.com/nkleemann/ascii-rain) .

---

# Dicas de instalação
Vocês notaram que quase todos os aplicativos instalamos no diretório do sistema: `/usr/local/bin` e para isso precisamos usar o `sudo` . 

Apesar de haver isso em diversos tutoriais nesse blog incluindo esse artigo, eu particularmente não recomendo isso por questões de segurança e organização .

Instale-os somente para seu usuário, ou seja, isolando um pouco mais. 

Para todos os casos faça o seguinte:
+ Crie um sub diretório no seu diretório local:
{% highlight sh %}
mkdir -p ~/.local/bin
{% endhighlight %}

Em seguida inclua esse diretório na sua variável `$PATH`:
> Para [Bash](https://terminalroot.com.br/shell)
{% highlight sh %}
echo '${HOME}/.local/bin:${PATH}' >> ~/.bashrc
{% endhighlight %}

Feche e depois abra seu terminal ou somente rode os comandos abaixo:
{% highlight sh %}
source ~/.bashrc
exec $SHELL
{% endhighlight %}

E toda vez que precisar instalar um aplicativo de terceiros use esse diretório, exemplo:
{% highlight sh %}
install -v app ~/.local/bin
{% endhighlight %}

E instantaneamente o comando já estrá disponível no seu terminal.

Melhor, né não? 😃 

---

