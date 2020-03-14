---
layout: post
title: "Como Optimizar Imagens Pelo Terminal"
date: 2017-11-02 20:08:42
image: '/assets/img/dicas/otimizar-imagens-pelo-terminal.jpg'
description: "Otimizar múltiplas imagens via linha de comando sem perder a qualidade da mesma."
tags:
- dicas
- linux
---

> Otimizar múltiplas imagens via linha de comando sem perder a qualidade da mesma.

O utilitário que utilizamos para este feito é o [jpegoptim](https://github.com/tjko/jpegoptim). Lógico que como o próprio nome diz é para imagens __JPG__.

## Para instalar

+ No [Gentoo](http://terminalroot.com.br/tags/#gentoo)
{% highlight bash %}
emerge --ask media-gfx/jpegoptim
{% endhighlight %}

+ No [CentOS](http://terminalroot.com.br/tags/#centos), Fedora e derivados
{% highlight bash %}
yum install jpegoptim
{% endhighlight %}

+ No [Debian](http://terminalroot.com.br/tags/#debian), [Ubuntu](http://terminalroot.com.br/tags/#ubuntu) e derivados
{% highlight bash %}
apt-get install jpegoptim
{% endhighlight %}

## Uso
Exitem vários parâmetros que podem ser usados via linha de comando, no entanto, o que recomendamos é o __-f__ e o __--size=valor%__ lembrando que o valor da porcentagem não pode ser um valor muito baixo, pois é posível perder a qualidade da imagem. Exemplo:
{% highlight bash %}
jpegoptim -f --size=42% imagem.jpg
{% endhighlight %}

Você ainda pode transformar a imagens __PNG__ em jpg ou usar o aplicativo similar para imagens PNG OPTIPNG(http://optipng.sourceforge.net/)

### Instale-o
{% highlight bash %}
emerge --ask media-gfx/optipng
{% endhighlight %}

### Ou converta múltiplas imagens em JPG
{% highlight bash %}
for i in *.jpg; do F=$(echo $i | rev | cut -d. -f2 | rev); convert $i $F.jpg; done
{% endhighlight %}

## Otimizar múltiplas imagens JPG
{% highlight bash %}
jpegoptim -f --size=42% *.jpg
{% endhighlight %}

## Assita ao vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=Zv3684wQ3tg)


## Endereço do JPEGOPTIM
<https://github.com/tjko/jpegoptim>

## Endereço do OPTIPNG
<http://optipng.sourceforge.net/>

## Comente!

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

