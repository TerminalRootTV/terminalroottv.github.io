---
layout: post
title: "Como Criar um Jogo estilo Pong com C++ e SFML"
date: 2022-07-09 10:26:44
image: '/assets/img/gamedev/pong-min.jpg'
description: 'O famoso jogo Pong do Atari com jogabilidade similar e temática de futebol .'
icon: 'ion:terminal-sharp'
iconname: 'GameDev'
tags:
- gamedev
- cpp
- sfml
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

🔊 Nesse vídeo criamos um game estilo o famoso [Pong do Atari](https://en.wikipedia.org/wiki/Pong), mas com a jogabilidade diferente e uma temática de futebol . 

Separamos por partes como: Desenhar as imagens na tela, Movimentação dos jogadores e da bola. Lógica da colisão e adição da pontuação. além de adicionar movimento do Computador (estilo *Inteligência Artificial*) e um Menu básico de única escolha.

---

# Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/cruLikMNhP0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Como jogar no seu sistema

---

# Dependências
+ [SFML](https://github.com/SFML/SFML)
+ [gcc/g++](https://gcc.gnu.org/)
+ [Fazer](https://www.gnu.org/software/make/)

Exemplo de instalação de dependências no Ubuntu
> Use o gerenciador de pacotes do seu sistema operacional `search` para encontrar o nome dos pacotes correspondentes

{% highlight bash %}
sudo apt install g++ make sfml-dev
{% endhighlight %}

---

# Construir e executar

{% highlight bash %}
git clone https://github.com/terroo/pong
cd pong
make
{% endhighlight %}

---

# Como jogar
Pressione:

+ `w`(para cima) ou `s`(para baixo) - Para mover o jogador à ESQUERDA
+ `↑`(para cima) ou `↓`(para baixo) - Para mover o jogador à DIREITA

> Se você quiser jogar com o **computador**, remova os comentários `//` das linhas `30` a `35` do arquivo [logic.cpp](https://github.com/terroo/pong/blob/main/logic.cpp) .

---

