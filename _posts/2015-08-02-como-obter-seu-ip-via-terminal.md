---
layout: post
title: "Como obter seu IP via Terminal"
date: '2015-08-02T16:23:00.000-07:00'
image: '/assets/img/shell-script/obter-ip.jpg'
description: "Existem várias formas de obter seu IP via Terminal"
main-class: 'linux'
tags:
- Linux
- GNU
- Comandos
- Redes
---

![Como obter seu IP via Terminal](/assets/img/shell-script/obter-ip.jpg "Como obter seu IP via Terminal")


Vamos supor que a sua máquina Linux está atrás de um roteador __NAT__. Então, o que é visível para a sua máquina é apenas um endereço __IP__ da LAN atribuído a sua interface __LAN__. Então, como você pode detectar o público (__ou WAN__) endereço IP atribuído ao roteador NAT, de preferência a partir de linha de comando ?

Existem várias formas, primeiramente vamos mostrar usando o __curl__

Você precisa ter o __curl__ instalado, basta usar o gerenciador de pacotes __apt-get__ , mas caso você possua outra distro , tente com o seu gerenciador de pacotes correspondente

{% highlight bash %}
su
apt-get install curl
{% endhighlight %}

Uma lista de opções com o __curl__
{% highlight bash %}
curl ifconfig.me
curl icanhazip.com
curl ident.me
curl ipecho.net/plain
curl whatismyip.akamai.com
curl tnx.nl/ip
curl myip.dnsomatic.com
curl ip.appspot.com
curl ip.telize.com
curl curlmyip.com
curl -s checkip.dyndns.org | sed 's/.*IP Address: \([0-9\.]*\).*/\1/g'
{% endhighlight %}


Ou se for IP local
{% highlight bash %}
hostname -i
{% endhighlight %}

> Existem várias outras formas, só utilizar sua criatividade e as milhares de ferramentas __GNU/Linux__ e __UNIX__ (__sed, PIPE, cat, lynx, ifconfig ,...__)

# Valeu!

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

