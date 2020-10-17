---
layout: post
title: "Como Instalar o MATE Desktop no FreeBSD 11.1"
date: 2017-09-22 16:28:10
image: '/assets/img/freebsd/freebsd03.jpg'
description: "Como instalar o Xorg, MATE Desktop, SLiM e configurar o rc.conf utilizando o Easy Editor."
tags:
- freebsd
- video
---

## Nesse vídeo foram instados os pacotes

* [Xorg](https://www.x.org/)
* [MATE Desktop Environment](https://mate-desktop.org/pt/)
* [SLiM](https://www.freebsd.org/cgi/man.cgi?query=slim)

{% highlight bash %}
pkg install xorg mate mate-desktop slim
{% endhighlight %}

> Efetuadas configurações no __/etc/rc.conf__ com o [Easy Editor (ee)](https://www.freebsd.org/cgi/man.cgi?query=ee)
{% highlight bash %}
ee /etc/rc.conf
{% endhighlight %}

> Adicionado ao final do arquivo os comandos
{% highlight bash %}
hald_enable="YES"
dbus_enable="YES"
slim_enable="YES"
{% endhighlight %}

> Configuramos o _$USER_ para aceitar o comando __su__ e poder logar como __root__
{% highlight bash %}
pw groupmod wheel -m marcos
{% endhighlight %}

> Criação do _.xinitrc_
{% highlight bash %}
ee ~/.xinitrc
{% endhighlight %}

E editamos o arquivo com os comandos
{% highlight bash %}
export LC_ALL=pt_BR.UTF-8
export LANGUAGE=pt_BR.UTF-8
export LANG=pt_BR.UTF-8
exec mate-session
{% endhighlight %}


Depois de dar um _reboot_ no sistema __shutdown -r now__ levantamos a interface gráfica(GUI) MATE Desktop com o comando __startx__

## Assista o Vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=kVgkcIyEQbg)


## Links Úteis

<https://www.x.org/>

<https://mate-desktop.org/pt/>

<https://www.freebsd.org/cgi/man.cgi?query=slim>

<https://www.freebsd.org/cgi/man.cgi?query=ee>

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



