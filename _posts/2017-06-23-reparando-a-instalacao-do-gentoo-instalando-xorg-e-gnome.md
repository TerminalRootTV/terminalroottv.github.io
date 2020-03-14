---
layout: post
title: "Reparando a Instalação do Gentoo, instalando Xorg e GNOME"
date: 2017-06-23 23:47:33
image: '/assets/img/gentoo/reparando-instalacao-gentoo-com-xorg-gnome-eselect.jpg'
description: "Alterando o tipo de instalação do Gentoo, instalando o sistema com Xorg e Interface Gráfica"
tags:
- feature
- linux
---

Esse vídeo serve somente pra informar que devido as possíveis complicações que poderiam ocorrer no screencast, eu alterei o tipo de instalação do Gentoo pra um sistema completo com Xorg e Interface Gráfica. Na parte do vídeo [Como Instalar o Gentoo](https://www.youtube.com/watch?v=BD1wIoX0E2c) onde precisa selecionar o tipo de profile, usei a opção __4__ com OpenRC (não é a opção que contém o ~~systemd~~), com o comando

{% highlight bash %}
eselect profile set 4 # em vez do 1
{% endhighlight %}

E depois de selecionar o tipo de instalação, fiz um update no emerge, como o comando
{% highlight bash %}
emerge --ask --update --deep --newuse @world
{% endhighlight %}

Para a compreensão total do processo via postagem veja o link [Como Instalar o Gentoo](http://terminalroot.com.br/2017/05/como-instalar-o-gentoo.html).

> No próximo vídeo, já estaremos com a interface gráfica rodando e iremos compilar o MATE Desktop Enviroment, aguardem!

## Assista o vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=-oYbGfIcqJw)


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

