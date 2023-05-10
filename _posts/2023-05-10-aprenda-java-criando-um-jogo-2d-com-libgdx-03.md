---
layout: post
title: "Criando um Bullet e Movendo Inimigos - LibGDX Java #03"
date: 2023-05-10 18:49:14
image: '/assets/img/java/libgdx-03.jpg'
description: '🎮 Nesse vídeo vamos criar a rotina dos tiros e dos inimigos! ☕'
icon: 'ion:terminal-sharp'
iconname: 'GameDev'
tags:
- java
- gamedev
- libgdx
- javagdx
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

Nesse vídeo vamos criar a *rotina do "tiro"*, ou seja, quando pressionar uma tecla a nave irá disparar o tiro. Essa talvez não seja a melhor maneira de fazer isso, mas com certeza **é a forma mais didática**. O certo seria usarmos a classe *Bullet* oferecida pela *LibGDX*, mas podemos modificar essa rotina depois caso quisermos. 

E também vamos desenvolver  a rotina de "aparecer os inimigos": 
+ Criar um array de retângulos e adicionar a nossa textura a cada retângulo do array; 
+ Criar o número de retângulos de acordo com o tempo; 
+ E criar um iterador para "soltar"(spawn) os retângulos movendo da direita para a esquerda.

---

# Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/5k-2TAy8JUA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# [Série: Aprenda Java Criando um Mini Jogo 2D com LibGDX](https://terminalroot.com.br/tags#javagdx)
## [Código no GitHub](https://github.com/terroo/spaceship)
### [Aprenda Desenvolvimento de Games](https://terminalroot.com.br/games)


