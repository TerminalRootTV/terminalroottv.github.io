---
layout: post
title: "Deixar o VI colorido e com numeracao de linhas"
date: '2016-08-21T10:17:00.000-07:00'
image: '/assets/img/editores/vim_console.jpg'
description: "Dica rápida!"
main-class: 'misc'
tags:
- Dicas
- VIM
---

![Deixar o VI colorido e com numeracao de linhas](/assets/img/editores/vim_console.jpg "Deixar o VI colorido e com numeracao de linhas")

### Dica rápida
{% highlight bash %}
vi /etc/vim/vimrc
{% endhighlight %}

### Com o arquivo aberto, corra com o cursor até abaixo da linha set ruler, pressione "i" sem as aspas e digite as linhas
{% highlight bash %}
set nu
syntax on 
{% endhighlight %}

### Só!
