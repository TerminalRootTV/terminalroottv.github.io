---
layout: post
title: "Como Criar Uma Imagem .iso Pelo Terminal"
date: 2017-10-07 16:32:53
image: '/assets/img/comandos/imagem-iso-pelo-terminal-linux.jpg'
description: "Para esse feito utilizamos novamente o comando dd, com alguns parâmetros adicionais."
main-class: 'bash'
tags:
- comandos
---

> Para esse feito utilizamos novamente o comando __dd__, com alguns parâmetros adicionais.

## Comando utilizado
{% highlight bash %}
dd if=/dev/cdrom of=/home/$USER/imagem.iso bs=2048 status=progress
{% endhighlight %}

## Assista o Vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=5_PnqRjB0sw)


## Links Úteis

<https://pt.wikipedia.org/wiki/Dd_(Unix)>

## Comente!
