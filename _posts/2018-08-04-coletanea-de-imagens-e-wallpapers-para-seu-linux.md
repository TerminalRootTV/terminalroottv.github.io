---
layout: post
title: "Uma Coletânea de Imagens e Wallpapers para seu Linux"
date: 2018-08-04 16:39:36
image: '/assets/img/dicas/coletanea-imagens-wallpapers-linux.jpg'
description: 'Você pode usar os designs fornecidos para quaisquer fins, como a criação camisetas, cartazes, canecas, adesivos e entre outros.'
main-class: 'misc'
tags:
- bash
- dicas
- imagens
- wallpapers
---

Todas as imagens são distribuídas sob licença _idgaf_. Significa que você pode usar os designs fornecidos para quaisquer fins ~~não comerciais~~, como a criação de materiais para conferências e encontros, impressão de cartazes para casa e escritório e assim por diante, mas se você violar a licença, provavelmente não faremos nada, porque nós(eles) não damos a mínima, [veja](https://linux.pictures/about).

> __Observações__ : Eles falam sobre fins _não comerciais_, mas ao mesmo tempo dizem que se você quiser comercializar não haverá problema, [veja](https://linux.pictures/about).__😕__

### Site
## [linux.pictures](https://linux.pictures/ "https://linux.pictures/")

### Baixar todas as imagens

> Você também pode baixar pela ferramenta de Download do [GitLab](https://gitlab.com/jstpcs/lnxpcs "https://gitlab.com/jstpcs/lnxpcs")

Ou clonar com o Git

{% highlight bash %}
git clone https://gitlab.com/jstpcs/lnxpcs
{% endhighlight %}

### Transforma uma imagem que ainda não está com resolução 1920x1080 em wallpaper

> Exemplo, via comando <kbd>convert</kbd> , [clique aqui para saber mais sobre o comando convert](http://terminalroot.com.br/2015/03/tratamento-de-imagens-com-imagemagick.html)

{% highlight bash %}
convert [imagem-que-deseja] -gravity center -resize 700 -extent 1920x1080 [nova-imagem-customizada]
{% endhighlight %}

### Transformar uma única imagem com o bash script deles

{% highlight bash %}
ls [imagem-que-deseja] | ./makemywall 1920 1080
{% endhighlight %}

### Transformar todas as imagens

> Nesse caso é necessário estar dentro do diretório

{% highlight bash %}
find . -type f -name '*.png' | ./makemywall.sh 1080 1920
{% endhighlight %}

# [Clique Aqui Para Assistir o Vídeo](https://youtu.be/p0FNLzBDlnE)

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

