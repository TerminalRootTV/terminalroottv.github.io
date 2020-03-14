---
layout: post
title: "Como Instalar o Lumina Desktop no FreeBSD"
date: 2017-12-06 17:32:13
image: '/assets/img/freebsd/lumina-freebsd.jpg'
description: "O Lumina Desktop Environment é um ambiente de desktop. Ele foi projetado para TrueOS e sistemas derivados do BSD em geral, mas foi portado para várias distribuições Linux."
tags:
- freebsd
---

O [Lumina Desktop Environment](http://lumina-desktop.org/) é um ambiente de desktop. Ele foi projetado para [TrueOS](https://www.trueos.org/) e sistemas derivados do [BSD](http://terminalroot.com.br/tags/#bsd) em geral, mas foi portado para várias [distribuições](http://terminalroot.com.br/tags/#distros) [Linux](http://terminalroot.com.br/tags/#linux).

## Instalação
{% highlight bash %}
pkg install lumina
{% endhighlight  %}

## Pós instalação

> Com o __usuário normal__, não é o __root__

{% highlight bash %}
ee ~/.xinitrc
{% endhighlight  %}

Ao abrir o arquivo, insira o conteúdo abaixo

{% highlight bash %}
export LC_ALL=pt_BR.UTF-8
export LANGUAGE=pt_BR.UTF-8
export LANG=pt_BR.UTF-8
setxkbmap -model abnt2 -layout br
exec start-lumina-desktop
{% endhighlight  %}

Após isso, levante o __Xorg__ com o __Lumina__, novamente com o __usuário normal__

{% highlight bash %}
startx
{% endhighlight  %}

# Assista o Vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=mktFYXY5O5U)


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

