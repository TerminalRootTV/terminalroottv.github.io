---
layout: post
title: "Grave o áudio pelo Terminal Linux"
date: '2016-05-25T14:01:00.004-07:00'
description: "Você pode usar o ALSAMIXER e o ARECORD!"
main-class: 'linux'
tags:
- Linux
- Multimídia
- Terminal
- Comandos
---

![Grave o áudio pelo Terminal Linux](/assets/img/shell-script/alsamixer.jpg "Grave o áudio pelo Terminal Linux")

Você pode usar o [ALSAMIXER](https://pt.wikipedia.org/wiki/Alsamixer) e o [ARECORD](https://linux.die.net/man/1/arecord) , ambos já vem instalados em todas as distribuições, mas se por algum motivo vc não tiver, você pode instalá-los via APT no Debian.

{% highlight bash %}
apt-get install alsamixer
{% endhighlight %}

{% highlight bash %}
apt-get install arecord
{% endhighlight %}

## Para iniciar gravações rode o comando e/ou consulte os manuais

{% highlight bash %}
man alsamixer
{% endhighlight %}

{% highlight bash %}
man arecord
{% endhighlight %}

## Dica rápida! 
