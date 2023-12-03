---
layout: post
title: "Como Clonar Partição com o Comando dd"
date: 2017-09-09 21:18:35
image: '/assets/img/comandos/dd.jpg'
description: "dd é uma linha de comandos em sistemas operacionais unix-like. Seu objetivo principal é o de converter e copiar arquivos."
tags:
- comandos
- unix
- gnulinux
---

> [dd](https://pt.wikipedia.org/wiki/Dd_(Unix)) é uma linha de comandos em sistemas operacionais __unix-like__. Seu objetivo principal é o de converter e copiar arquivos. Ele também pode criar imagens em discos flexíveis, discos rígidos, mídias ópticas, arquivos de swap.

## Sintaxe
{% highlight bash %}
dd if=[ORIGEM] of=[DESTINO]
{% endhighlight %}

## Uso

> Onde o __X__ e o __Y__ de sdaX e sdaY, correspondem ao número das partições que você deseja manipular.

Copiar de partição para partição
{% highlight bash %}
dd if=/dev/sdaX of=/dev/sdaY
{% endhighlight %}

Cria imagem sem compactação
{% highlight bash %}
dd if=/dev/sdaX of=/mnt/devY.img
{% endhighlight %}

Cria imagem com compactada pelo 7zip
{% highlight bash %}
dd if=/dev/sdaX | 7z a -si /mnt/img.7z
{% endhighlight %}

Restaura imagem compactada pelo 7zip
{% highlight bash %}
7z x /mnt/img.7z -so | dd of=/dev/sdaY
{% endhighlight %}

Cria imagem compactada pelo gzip
{% highlight bash %}
dd if=/dev/sdaX | gzip -9f > /mnt/img.gz
{% endhighlight %}

Restaura imagem comprimida com o gzip
{% highlight bash %}
gzip --decompress --stdout img.gz | dd of=/dev/sdaY
{% endhighlight %}

## Assista um Vídeo Explicando na prática

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=_TnBJyx_q9k)


## Links Úteis

<https://pt.wikipedia.org/wiki/Dd_(Unix)>

<https://www.vivaolinux.com.br/dica/Clonando-particoes-HDs-com-o-dd>

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



