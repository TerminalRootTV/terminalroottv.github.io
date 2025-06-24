---
layout: post
title: "Conheça o terpkg"
date: 2025-06-24 12:11:10
image: '/assets/img/terlang/thumb-terpkg.jpg'
description: "🚀 Um gerenciador de projetos para Terlang feito em C."
icon: 'ion:terminal-sharp'
iconname: 'Terlang'
tags:
- terlang
- linguagemc
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Depois que eu lancei a versão incial da linguagem de programação [Terlang](https://terminalroot.com.br/2024/11/criei-minha-propria-linguagem-de-programacao.html), muitas pessoas tem contribuído para o projeto direto e indiretamente.

Entre algumas contribuíções há um **gerenciador de projetos** para a Terlang.

Trata-se de uma automatização feita em [C](https://terminalroot.com.br/c) para agilizar criação de projetos com Terlang.

Para instalar basta possuir:
+ [Git](https://terminalroot.com.br/tags#git)
+ [Compilador C](https://terminalroot.com.br/tags#gcc)
+ e o [Make](https://terminalroot.com.br/tags#make)

Após isso, só clonar o repositório, compilar e instalar:

{% highlight bash %}
git clone https://github.com/gatulindu/terpkg
cd terpkg
make
sudo make install
{% endhighlight %}

Para utilizar existe alguns parâmetros, tais como:

+ Inicia um projeto
{% highlight bash %}
terpkg --init
{% endhighlight %}

+ Após iniciado, o comando abaixo, roda o projeto:

{% highlight bash %}
terpkg --run
{% endhighlight %}

---

Parece simples, mas foi feito de coração e com certeza é uma forma de tentar contribuir e ajudar.

Parabéns ao *Gatoli* e obrigado!

Para mais informações acesse o repositório: <https://github.com/gatulindu/terpkg>.

