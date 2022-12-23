---
layout: post
title: "3 Formas de Criar Sua Árvore de Natal com C++ 🎄"
date: 2022-12-23 13:31:45
image: '/assets/img/pixelart/christmas-tree-cpp.png'
description: 'Incluindo formas no terminal e também com SFML e OpenGL.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- pixelart
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')
> Não julgue a imagem! =) Essa foi uma das primeiras Pixel Art que eu fiz com [LibreSprite](https://terminalroot.com.br/2021/12/instale-o-libresprite-uma-alternativa-ao-aseprite.html) ! 😃 

---

[Então, é Natal!](https://www.youtube.com/watch?v=kcGM-aASglU) Que tal aproveitarmos essa data ímpar do ano para treinarmos mais um pouquinho do nosso conhecimento em [C++](https://terminalroot.com.br/tags#cpp)?

Nesse artigo vamos ver três formas de criarmos nossa Árvore de Natal com C++, incluindo formas no terminal e também com [OpenGL](https://terminalroot.com.br/tags#opengl) e [SFML](https://terminalroot.com.br/tags#sfml). 🎄

---

# 1º Forma, a mais básica possível
Se criarmos um *loop aninhado* podemos desenhar diversas formas geométricas, no entanto, a mais treinada é um triângulo. No código abaixo, conseguimos fazer um triângulo reto, ou seja, para nossa solução, seria metade do problema resolvido.

Note que pus a função separada para que possamos customizar o tamanho do triângulo que queiramos

> `vim 01-christmas-tree.cpp`
{% highlight cpp %}
#include <iostream>

void drawTree(int min, int max){
  for (int i = min; i <= max; ++i){
    for (int x = 0; x < i; ++x){
      std::cout << "*";
    }
    std::cout << '\n';
  }
}

int main(){
  drawTree(1,4);
  return 0;
}
{% endhighlight %}

Após compilar e rodar teremos a possível saída abaixo:
{% highlight bash %}
g++ 01-christmas-tree.cpp && ./a.out 

*
**
***
****
{% endhighlight %}

Ou seja, somente algums básicas linhas! Se quiser um pouco maior, basta alterar a função `drawTree()` para `1,10` ou qualquer número que você queira:

{% highlight cpp %}
...
drawTree(1, 10);
....
{% endhighlight %}

E então, teremos um tamanho ligeiramente maior:

{% highlight bash %}
*
**
***
****
*****
******
*******
********
*********
**********
{% endhighlight %}

Mas, queremos mesmo ter um triâgulo equilátero, logo, adicionaremos mais dois *loops* dentro do *loop principal* com cálculos que crie a parte esquerda do triângulo e dê espaço à esquerda, além de remover o parâmetro `min` para que possamos mostrar todo o triângulo, veja o código para notar a diferença:

{% highlight cpp %}
#include <iostream>

void drawTree(int max){
  for (int i {}; i < max; ++i){
    for (int x {}; x < max; ++x){
      std::cout << " ";
    }
    for (int j = max - i; j > 0; j--){
      std::cout << " ";
    }
    for (int k {}; k < 2 * i + 1; ++k){
      std::cout << "*";
    }
    std::cout << '\n';
  }
}

int main(){
  drawTree(10);
  return 0;
}
{% endhighlight %}

Agora ficou legal! Podemos ainda customizar o tamanho via `argc` e `argv`, mas isso aí fica com você! 😃 

{% highlight bash %}
                    *
                   ***
                  *****
                 *******
                *********
               ***********
              *************
             ***************
            *****************
           *******************
{% endhighlight %}

---

# 2º Forma - Uma Árvore de Natal mais estilosa e com animação!
Nessa outra forma vamos incrementar mais alguns caracteres **ASCII** para ficar mais legal, também vamos usar a biblioteca [unistd.h](https://terminalroot.com.br/2021/08/quatro-formas-diferentes-de-usar-sleep-em-cpp.html) para obtermos um *lag*(`sleep`) de 1 segundo na troca da aniimação, para mais detalhes veja o artigo: [4 Formas diferentes de usar sleep() em C++](https://terminalroot.com.br/2021/08/quatro-formas-diferentes-de-usar-sleep-em-cpp.html) .

Além também de adicioarmos CORES! Para isso vamos usar uma *biblioteca* que criamos aqui mesmo no blog, para mais detalhes veja o artigo: [Crie sua própria biblioteca de cores para C++](https://terminalroot.com.br/2021/05/crie-sua-propria-biblioteca-de-cores-para-cpp.html) . O legal dessa biblioteca é que ela é simples e funciona legal no LSP, veja o gif abaixo ele informando cada `string`, note que ele informa: **sublinhado**, **itálico**, **normal**, **background** e entre outros:

![LSP Color Lib](/assets/img/pixelart/gif-color-lsp.webp) 


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

Ou seja, copie o código da postagem e salve em um arquivo de nome `colors.hpp` e deixe no mesmo diretório do código abaixo!

O código em resumo será:
> `vim 02-christmas-tree.cpp`

{% highlight cpp %}
#include <iostream>
#include <unistd.h>
#include "colors.hpp" // inclui as cores

int main(){
  srand(time(NULL));
  for (;;) {
    for (int x = 0; x < 20; x++) {
      for (int y = 0; y < 22 - x; y++)
        std::cout << " ";

      for (int i = 0; i <= x * 2; i++) {
        int randm = rand() % 40;
        if (randm ==i)
        {
          std::cout << hey::white << "O";
        }
        else if (randm + i % 2 == 0) {
          std::cout << hey::red << "@";
        }
        else {
          std::cout << hey::green << "*";
        }
      }
      std::cout.put('\n');
    }

    for (int t = 0; t < 3; t++) {
      for (int o = 0; o < 19; o++) {
        std::cout << hey::white << " ";
      }
      std::cout << hey::white << "|  |\n";
    }
    sleep(1);
    system("clear");
  }
}
{% endhighlight %}
> Compile e rode: `g++ 02-christmas-tree.cpp && ./a.out`

A árvore possívelmente aparecerá assim:

![02-christmas-tree.cpp running...](/assets/img/pixelart/gif-tree-cpp.webp) 

---


<!-- RECTANGLE LARGE -->
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

---

# 3º Forma - Usando C++ com SFML e OpenGL
E por final temos com [SFML](https://terminalroot.com.br/tags#sfml) e [OpenGL](https://terminalroot.com.br/tags#opengl), esse exemplo eu encontrei na internet, só fiz algumas *modificaçãozinhas*!

Leia o código para mais detalhes, mas antes prepare um diretório para os arquivos:

{% highlight bash %}
mkdir christmas-tree
cd christmas-tree
vim tree.{hpp,cpp} main.cpp Makefile
{% endhighlight %}

> `tree.hpp`
{% highlight cpp %}
#pragma once

#include <SFML/Graphics.hpp>
#include <SFML/OpenGL.hpp>
#include <unistd.h>
#include <cmath>
#include <memory>

class ChristmasTree {

  std::shared_ptr<sf::RenderWindow> window;

  public:
    ChristmasTree();
    void events();
    void draw();
    void run();

    void lineto(float,float,float,float);
    void tree(float,float,float,float);
};
{% endhighlight %}

> `tree.cpp`
{% highlight cpp %}
#include "tree.hpp"

ChristmasTree::ChristmasTree(){
  window = std::make_shared<sf::RenderWindow>(
    sf::VideoMode(400, 600),
    "Christmas Tree: C++, OpenGL and SFML",
    sf::Style::Titlebar | sf::Style::Close
  );
  window->setPosition(sf::Vector2i(0, 0));
  window->setFramerateLimit(30);
  glOrtho(0.0, window->getSize().x, window->getSize().y, 0.0, 1.0, -1.0);
}

void ChristmasTree::events(){
  auto e = std::make_shared<sf::Event>();
  while( window->pollEvent( *e ) ){
    if( e->type == sf::Event::Closed){
      window->close();
    }
  }
}

void ChristmasTree::draw(){
  window->clear(sf::Color::Black);
  glColor3f(0.0, 1.0, 0.0);
  lineto(210.0, 400.0, 160.0, M_PI/2.0);
  tree(210.0, 400.0, 75.0, -M_PI/2.0);
  window->display();
  usleep(10000);
}

void ChristmasTree::run(){
  while( window->isOpen() ){
    events();
    draw();
  }
}

void ChristmasTree::lineto(float x, float y, float len, float angle) {
  glBegin(GL_LINES);
  glVertex2f(x, y);
  glVertex2f(x+len*cos(angle), y+len*sin(angle));
  glEnd();
}

void ChristmasTree::tree(float x, float y, float len, float angle){
  const float strange_angle = M_PI/24.0;
  lineto(x, y, len, angle+strange_angle);
  lineto(x, y, -len, angle);
  lineto(x, y, len, angle+2*M_PI/3.0+strange_angle);
  lineto(x, y, len, angle-2*M_PI/3.0+strange_angle);

  const float len_min = 2.0;
  if(len > len_min){
    const float len_div = 0.4;

    tree(x+len*cos(angle+strange_angle), 
        y+len*sin(angle+strange_angle),
        2*len*len_div, angle+strange_angle);
    tree(x+len*cos(angle+2*M_PI/3.0+strange_angle), 
        y+len*sin(angle+2*M_PI/3.0+strange_angle), 
        len*len_div, angle+2*M_PI/3.0+strange_angle);
    tree(x+len*cos(angle-2*M_PI/3.0+strange_angle), 
        y+len*sin(angle-2*M_PI/3.0+strange_angle), 
        len*len_div, angle-2*M_PI/3.0+strange_angle);
  }
}
{% endhighlight %}

> `main.cpp`
{% highlight cpp %}
#include "tree.hpp"

int main( int argc , char **argv ){
  auto cmas = std::make_shared<ChristmasTree>();
  cmas->run();
  return 0;
}
{% endhighlight %}

> `Makefile`
{% highlight makefile %}
TARGET=a.out
CXX=g++
DEBUG=-g
OPT=-O0
WARN=-Wall
SFML=-lsfml-graphics -lsfml-window -lsfml-system -lGL
CXXFLAGS=$(DEBUG) $(OPT) $(WARN) $(SFML)
LD=g++
OBJS= main.o tree.o
all: $(OBJS)
	$(LD) -o $(TARGET) $(OBJS) $(CXXFLAGS)
	@rm *.o
	@./$(TARGET)

main.o: main.cpp
	$(CXX) -c $(CXXFLAGS) main.cpp -o main.o

tree.o: tree.cpp
	$(CXX) -c $(CXXFLAGS) tree.cpp -o tree.o
{% endhighlight %}

Agora é só compilar e rodar:
{% highlight bash %}
make
{% endhighlight %}

Saída:

![Christmas Tree C++ SFML OpenGL](/assets/img/pixelart/cmas-cpp-sfml-opengl.png) 

Show de bola, né?!

Queria desejar Boas Festas e um Feliz Natal para tod@s vocês!

---


<!-- RECTANGLE 2 - OnParagragraph -->
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

---

# Links úteis
+ <https://github.com/codeMyDay/christmas_tree>

<!--
https://www.google.com/search?q=christmas+tree+in+c%2B%2B
https://www.google.com/search?q=christmas+tree+in+c%2B%2B&tbm=isch
https://codevisionz.com/lessons/c-code-example-christmas-tree-pattern/
-->

