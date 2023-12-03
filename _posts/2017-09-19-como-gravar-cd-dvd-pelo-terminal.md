---
layout: post
title: "Como Gravar CD/DVD Pelo Terminal"
date: 2017-09-19 09:14:57
image: '/assets/img/comandos/growisofs.jpg'
description: "Programa para gravações de CD/DVD via linha de comando."
tags:
- comandos
- gnu
- gnulinux
---

[growisofs](https://en.wikipedia.org/wiki/Dvd%2Brw-tools) é um programa para gravações de CD/DVD via linha de comando. Veja no vídeo abaixo como instalá-lo e como usá-lo!

> O __growisofs__ foi originalmente projetado como um __frontend__ para __mkisofs__ para facilitar a anexação de dados. Suporte de gravação de __DVD__ de uso geral foi implementado e, a partir de agora, __growisofs__ suporta não apenas mídia de acesso aleatório, mas até mesmo masterização de mídia de DVD multisessão, como __DVD+R__ e __DVD-R/-RW__, bem como discos __Blu-ray__. __Todos os tipos de mídia de DVD são suportados__.

## Instalação
{% highlight bash %}
emerge app-cdr/cdrtools
emerge app-cdr/dvd+rw-tools
{% endhighlight %}

## Utilização

> Admitindo que irá gravar um _DVD_

{% highlight bash %}
growisofs -dvd-compat -speed=8 -Z /dev/cdrom=arquivo-ou-caminho.iso
{% endhighlight %}

## Assista o Vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=5o4X6OaAm4Y)


### Página Oficial
<http://fy.chalmers.se/~appro/linux/DVD+RW/>

## Deixe seu comentário!

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



