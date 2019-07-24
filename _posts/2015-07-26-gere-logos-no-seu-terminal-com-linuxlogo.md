---
layout: post
title: "Gere logos no seu terminal com LinuxLogo"
date: '2015-07-26T17:38:00.001-07:00'
image: '/assets/img/terminal/linuxlogo.jpg'
description: "LinuxLogo é um pequeno utilitário que exibe um logotipo ANSI ou ASCII do pinguim Linux, juntamente com algumas informações do sistema ou não, ou seja, é opcional."
main-class: 'linux'
tags:
- Linux
- Dicas
- GNU
- Imagens
- Terminal
- Comandos
---

![Gere logos no seu terminal com LinuxLogo](/assets/img/terminal/linuxlogo.jpg "Gere logos no seu terminal com LinuxLogo")

[LinuxLogo](https://packages.debian.org/linuxlogo) é um pequeno utilitário que exibe um logotipo [ANSI](https://pt.wikipedia.org/wiki/Código_escape_ANSI) ou [ASCII](https://pt.wikipedia.org/wiki/ASCII) do pinguim Linux, juntamente com algumas informações do sistema ou não, ou seja, é opcional.

Para instalá-lo em __Distros GNU/Linux Debian__, basta usar o __apt-get__, lógico, precisa ser __root #__, se não possuir o __sudo__, e em outras distros, ou baixe o __linuxlogo__, ou tente com seu gerenciador de pacotes correspondente
{% highlight bash %}
su
apt-get install linuxlogo
{% endhighlight %}

Após terminada a instalação pode chamá-lo e aparecerá por padrão o logo da sua distribuição
{% highlight bash %}
linuxlogo
{% endhighlight %}

Com o comando abaixo, ele gerará a próxima imagem abaixo do logo __Linux__, no entanto , cada número representa uma __Distro (Slackware, OpenSUSE, Ubuntu,...,Tux retrô,...)__

{% highlight bash %}
linuxlogo -L 9
{% endhighlight %}
  
![Gere logos no seu terminal com LinuxLogo](/assets/img/terminal/linuxlogo2.jpg "Gere logos no seu terminal com LinuxLogo")
{% highlight bash %}
linuxlogo -L 18
{% endhighlight %}
    
A opção __-ascii -a__ gera a logo __sem cores__
{% highlight bash %}
linuxlogo -ascii -a
{% endhighlight %}
    
![Gere logos no seu terminal com LinuxLogo](/assets/img/terminal/linuxlogo3.jpg "Gere logos no seu terminal com LinuxLogo")

A opção __-D [arquivo.ascii]__ gera a imagem __ASCII__ que você indicar, exemplo
{% highlight bash %}
linuxlogo -D ascii-stallman.txt
{% endhighlight %}
  
Para mais informações das opções do comando, utilize o __-h__ ou o __man linuxlogo__
{% highlight bash %}
man linuxlogo
{% endhighlight %}

{% highlight bash %}
linuxlogo -h
{% endhighlight %}

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

