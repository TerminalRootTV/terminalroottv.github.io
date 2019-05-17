---
layout: post
title: 'Como mudar a imagem de fundo da tela de login(GDM3) no Debian'
date: '2013-02-11T16:45:00.000-08:00'
image: '/assets/img/linux/spacemachine-gdm-preview.jpg'
description: 'Dica rápida'
main-class: 'debian'
tags:
- Debian
---

![Como mudar a imagem de fundo da tela de login(GDM3)](/assets/img/linux/spacemachine-gdm-preview.jpg "Como mudar a imagem de fundo da tela de login(GDM3)")

+ 1- Abra o arquivo __/usr/share/gdm/greeter-config/20_debian__
{% highlight bash %}
vi /usr/share/gdm/greeter-config/20_debian
{% endhighlight %}

+ 2- Descomente (Tire o sinal de sustenido "__#__" da frente) das linhas que contém
{% highlight bash %}
/desktop/gnome/background/picture_filename /usr/share/images/desktop-base/login-background.svg
/desktop/gnome/interface/gtk_theme  Clearlooks
{% endhighlight %}

+ 3-Na linha "__/desktop/gnome/background/picture_filename /usr/share/images/desktop-base/login-background.svg__" já descomentada, informe o caminho da sua imagem
{% highlight bash %}
/desktop/gnome/background/picture_filename /usr/share/images/SUA_IMAGEM.jpg
{% endhighlight %}

+ 4-Pra deixar tudo dentro dos conformes, rode o comando abaixo
{% highlight bash %}
dpkg-reconfigure gdm3
{% endhighlight %}

Encerre a sessão e veja se tudo deu certo!
