---
layout: post
title: "Finalizando a Customização do Gentoo Linux"
date: 2017-07-29 18:58:52
image: '/assets/img/gentoo/gentoo-install-04.jpg'
description: "O Gentoo Linux pronto para uso!"
tags:
- gentoo
- gnulinux
---

> Nesse vídeo mostra o estado depois de instalados alguns aplicativos. Caso você ainda não tenha visto a série inteira, assista os demais vídeos da série clicando na hashtag/link [#VamosUsarGentoo](https://goo.gl/7PyqZe) e veja os vídeos anteriores. Para conectar a internet via linha de comando [clique aqui e assista esse vídeo](https://www.youtube.com/watch?v=q3oaZ4SIbkA). 

***

![genicon](/assets/img/gentoo/gentoo-linux-icon.jpg)
## Veja abaixo os aplicativos que foram instalados
{% highlight bash %}
emerge --ask app-arch/engrampa
emerge --ask app-editors/gvim
emerge --ask app-laptop/laptop-mode-tools
emerge --ask mate-extra/caja-extensions
emerge --ask mate-extra/mate-indicator-applet
emerge --ask mate-extra/mate-polkit
emerge --ask mate-extra/mate-power-manager
emerge --ask mate-extra/mate-screensaver
emerge --ask mate-extra/mate-sensors-applet
emerge --ask mate-extra/mate-utils
emerge --ask net-analyzer/mate-netspeed
emerge --ask net-misc/wicd
emerge --ask net-wireless/wireless-tools
{% endhighlight %}

***

![genicon](/assets/img/gentoo/gentoo-linux-icon.jpg)
## Instale o SLiM
{% highlight bash %}
emerge --ask x11-misc/slim
{% endhighlight %}

***

![genicon](/assets/img/gentoo/gentoo-linux-icon.jpg)
Depois de instalar o SLiM, rode esses comandos como __#root__
{% highlight bash %}
echo 'DISPLAYMANAGER="slim"' > /etc/conf.d/xdm
rc-update add xdm default
echo 'XSESSION="Mate"' > /etc/env.d/90xsession
env-update
{% endhighlight %}

***

![genicon](/assets/img/gentoo/gentoo-linux-icon.jpg)
E esses como usuário __$normal__ (_seu usuário_)
{% highlight bash %}
echo "/etc/X11/Sessions/mate" > ~/.xsession
{% endhighlight %}

## VEJA O VÍDEO PARA INFORMAÇÕES MAIS COMPLETAS
## Assista o vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=imi1g-aE7zc)


## Links Úteis

<https://wiki.gentoo.org/>

## Assista toda a Série do Gentoo #VamosUsarGentoo
[#VamosUsarGentoo](https://goo.gl/7PyqZe)

# Faça nosso curso gratuito de Shell Bash e adquira todo conteúdo nesse link
<http://www.terminalroot.com.br/shell/>

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



