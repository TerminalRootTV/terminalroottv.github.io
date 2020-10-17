---
layout: post
title: Como gerar desenhos de nomes pelo terminal
date: '2015-03-04T18:27:00.000-08:00'
image: '/assets/img/shell-script/figlet.jpg'
description: "Um programa para fazer grandes letras de texto comum."
tags:
- terminal
- comandos
---

![Blog Linux](/assets/img/shell-script/figlet.jpg "Blog Linux")


[FIGlet](http://www.figlet.org/) é um programa para fazer grandes letras de texto comum. Basta vc  instalá-lo em seu computador e abrir um novo terminal e executar o  comando com a palavra que você deseja
{% highlight bash %}
figlet Terminal Root
{% endhighlight %}

A saída será justamente a imagem desse post!
Para instalar, se for Debian e debian-likes (Ubuntu, Mint,…), basta executar:
{% highlight bash %}
su
{% endhighlight %}

{% highlight bash %}
apt-get install figlet
{% endhighlight %}

Se vc possuir o sudo instalado, execute com o sudo
Caso seja outra distro, baixe:
{% highlight bash %}
wget ftp://ftp.figlet.org/pub/figlet/program/unix/figlet-2.2.5.tar.gz
{% endhighlight %}

Descompacte
{% highlight bash %}
tar -xzvf figlet-2.2.5.tar.gz
{% endhighlight %}

e compile o código de acordo com as informações no arquivo (em inglês)

> __figlet-2.2.5/README__

Site Oficial do Projeto: <http://www.figlet.org/>

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



