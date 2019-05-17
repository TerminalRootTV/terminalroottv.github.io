---
layout: post
title: "Instalando Aplicativos e Customizando o FreeBSD"
date: 2017-09-30 08:47:35
image: '/assets/img/freebsd/freebsd-print.jpg'
description: "Nesse vídeo finalizamos a Série #PorqueFreeBSD, instalamos aplicativos, alteramos a shell, adicionamos o usuário ao grupo wheel, alteramos o tema do SLiM e customizamos o MATE DE."
main-class: 'tv'
tags:
- freebsd
---

Nesse vídeo finalizamos a Série [#PorqueFreeBSD](https://goo.gl/fEJTzk)

+ instalamos aplicativos;
+ alteramos a shell;
+ adicionamos o usuário ao grupo wheel;
+ alteramos o tema do SLiM e customizamos o MATE DE;
+ entre outros.

### Instalação de aplicativos
{% highlight bash %}
pkg install firefox libreoffice gnome-mplayer gimp shotwell p7zip p7zip-codec-rar rar
{% endhighlight %}

### Alteramos a shell
{% highlight bash %}
chsh -s /bin/csh
{% endhighlight %}

### Adicionamos o _user normal_ ao grupo wheel (para usar o comando _su_)
{% highlight bash %}
pw groupmod wheel -m marcos
{% endhighlight %}

### Baixamos e descompactamos o tema do SLiM pro FreeBSD
{% highlight bash %}
cd /usr/local/share/slim/themes
fetch http://terminalroot.com.br/downs/slim-freebsd.tar.bz2
tar jxvf slim-freebsd.tar.bz2
{% endhighlight %}

### Alteramos o _slim.conf_
{% highlight bash %}
sed -i 's/current_theme.*/current_theme	freebsd-1680x1050/' /usr/local/etc/slim.conf
{% endhighlight %}

### Baixamos, decompactamos e usamos o tema de ícones pro FreeBSD no MATE
{% highlight bash %}
cd ~/
fetch http://terminalroot.com.br/downs/icons-freebsd.tar.xz
tar Jxvf icons-freebsd.tar.xz
{% endhighlight %}

## Assista o Vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=AyaS3xl-cQo)


## Esse vídeo faz parte da Série [#PorqueFreeBSD](https://goo.gl/fEJTzk)

## Links Úteis

<https://www.freebsd.org/>

<https://www.slideshare.net/spjuliano/por-que-freebsd>

<http://www.bsdcan.org>

<http://www.eurobsdcon.org>

<http://www.asiabsdcon.org>

<http://mundofreebsd.com.br/o-mascote-do-freebsd-e-um-demonio/>

<https://pt.wikipedia.org/wiki/FreeBSD>

<https://www.freebsd.org/where.html>

<https://www.x.org/>

<https://mate-desktop.org/pt/>

<https://www.freebsd.org/cgi/man.cgi?query=slim>

<https://www.freebsd.org/cgi/man.cgi?query=ee>

<https://www.gnu.org/software/grub/manual/grub/>

## Comente

