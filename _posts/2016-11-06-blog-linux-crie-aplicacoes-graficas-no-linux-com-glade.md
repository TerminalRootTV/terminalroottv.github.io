---
layout: post
title: "Crie aplicações gráficas no Linux com Glade"
date: '2016-11-06T08:48:00.000-08:00'
image: '/assets/img/dev/glade.jpg'
description: "Glade é um construtor de interface gráfica para GTK+ que facilita a criação de programas que se integram ao GNOME e outras GUIs."
main-class: 'gnu'
tags:
- Dicas
twitter_text: "Crie aplicações gráficas no Linux com Glade"
introduction: "Glade é um construtor de interface gráfica para GTK+ que facilita a criação de programas que se integram ao GNOME e outras GUIs."
---


![Blog Linux Glade](/assets/img/dev/glade.jpg)

__Glade__ é um construtor de interface gráfica para __GTK+__ que facilita a criação de programas que se integram ao __GNOME__ e outras GUIs. O Glade é independente de linguagem de programação, e normalmente não produz código; produz um arquivo XML no formato __GladeXML__, que pode ser usado para gerar a interface gráfica em diversas linguagens, através da biblioteca libglade. A habilidade do Glade de produzir código C já esteve presente, mas foi removida a partir da versão Glade-3, pois a geração automática de código é deprecada. O Glade vem em duas versões, uma para a versão 1 da biblioteca GTK+ e outra para a versão 2.O Glade é software livre, distribuída sob a licença __GPL__.

## Instalação

Para Debian e distribuições baseadas nele, use o APT:
{% highlight bash %}
apt-get install glade -y
{% endhighlight %}

[Download](https://glade.gnome.org/sources.html)

[Página Oficial](https://glade.gnome.org/)
