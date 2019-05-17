---
layout: post
title: "Como Instalar o Compiz no Gentoo GNU/Linux"
date: 2017-10-29 17:38:26
image: '/assets/img/gentoo/gentoo-compiz.jpg'
description: "Passo a passo para instalar o Compiz no Gentoo."
main-class: 'gnu'
tags:
- compiz
---

+ __1.__ Primeiramente edite o arquivo <kbd>/etc/portage/package.accept_keywords</kbd> e insira o conteúdo abaixo no final do arquivo
{% highlight bash %}
x11-plugins/compiz-plugins-main
x11-libs/compiz-bcop
x11-wm/compiz-fusion
x11-plugins/compiz-plugins-extra
x11-libs/libcompizconfig
x11-wm/compiz
dev-python/compizconfig-python
x11-libs/compizconfig-backend-gconf
x11-wm/emerald
x11-themes/emerald-themes
x11-apps/fusion-icon
x11-misc/ccsm
{% endhighlight %}

+ __2.__ Depois edite o arquivo <kbd>/etc/portage/package.use</kbd> e insira o conteúdo abaixo no final do arquivo
{% highlight bash %}
x11-wm/compiz-fusion emerald
{% endhighlight %}

+ __3.__ Instale os backends
{% highlight bash %}
emerge --ask x11-libs/compizconfig-backend-gconf
{% endhighlight %}

+ __4.__ E por fim instale os pacotes para o Compiz
{% highlight bash %}
emerge --ask compiz-fusion fusion-icon ccsm simple-ccsm
{% endhighlight %}

> Obs.: Se pedir para atualizar o __/etc__ rode o comando abaixo e depois repita o item 4

{% highlight bash %}
etc-update --automode -5
{% endhighlight %}

> Se os controles de janela (minimizar, maximizar e fechar) não aparecerem, abra as configurações do __fusion-icon__ e habilite o __Decorador de Janelas__ que resolverá!

## Assista ao vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=ywhFwZDvsNg)


## Links Úteis

<http://wiki.compiz.org/CompizFusionIcon>

<http://wiki.mate-desktop.org/compiz>

<https://wiki.gentoo.org/wiki/Compiz>


## Comente!
