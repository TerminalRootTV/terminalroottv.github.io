---
layout: post
title: "Dica rápida: Como Configurar o teclado ABNT2 no Debian"
date: 2017-01-13 17:40:35
image: '/assets/img/teclado/configura-teclado-abnt2-debian-linux.jpg'
description: "Para configurar um teclado ABNT2 no Linux via linha de comando."
main-class: 'debian'
color: '#de4508'
tags:
categories:
- dicas
- debian
twitter_text: "Dica rápida: Como Configurar o teclado ABNT2 no Debian"
introduction: "Para configurar um teclado ABNT2 no Linux via linha de comando."
---

![Configurar teclado Debian Linux](/assets/img/teclado/configura-teclado-abnt2-debian-linux.jpg)

Para configurar um teclado ABNT2 (ou qualquer outro mapa de teclado) no Linux via linha de comando, basta usar o comando setxkbmap, que faz parte do pacote zsh-common. Este comando possui diversas opções, mas no caso da configuração específica do layout ABNT2, usaremos as seguintes opções:

{% highlight c %}
setxkbmap -model pc105 -layout br -variant abnt2
{% endhighlight %}

Caso queira configurar no Gnome, veja como [clicando neste link](http://devblog.drall.com.br/?p=4146)

Via: devblog
