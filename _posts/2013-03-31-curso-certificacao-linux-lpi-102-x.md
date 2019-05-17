---
layout: post
title: "Curso Certificação Linux LPI-102: X Window System"
date: '2013-03-31T08:06:00.000-07:00'
image: '/assets/img/lpi/x-window-system.jpg'
description: "X Window System, X-Window, X11 ou simplesmente X é um software de sistema e um protocolo que fornece uma base para interfaces gráficas de usuário."
main-class: 'linux'
tags:
- Linux
- LPI
---

![X Window System](/assets/img/lpi/x-window-system.jpg "X Window System")

__X Window System__, __X-Window__, __X11__ ou simplesmente __X__ é um software de sistema e um protocolo que fornece uma base para interfaces gráficas de usuário (com o conceito de janelas) e funcionalidade rica de dispositivos de entrada para redes de computadores. Ele cria uma camada de abstração de hardware onde o software é escrito para usar um conjunto generalizado de comandos, permitindo a independência de dispositivo e reutilização programas em qualquer computador que implemente o __X__.

Originalmente chamado simplesmente de __X__, foi desenvolvido no __MIT__ em 1984. Atualmente está na versão 11, publicada em setembro de 1987, e por isso carrega no nome este número. __X-Window__ é o toolkit e protocolo padrão para __GUI__ nos sistemas __Unix__ e assemelhados, como o __Linux__, mas existem versões para outros sistemas operacionais, como o __Microsoft Windows__ e o __Mac OS__ , por exemplo.
 
## Configurando o X no Debian
{% highlight bash %}
dpkg-reconfigure xserver-xorg
{% endhighlight %}

## Iniciar o X (caso a inicialização seja em modo texto)
{% highlight bash %}
startx
{% endhighlight %}

## O script de arranque para os daemons de gestão de ecrã verifica o conteúdo do ficheiro
> mesmo antes de executar os próprios. Isto assegura que se tem apenas um programa daemon de gestor de ecrã X activado.
{% highlight bash %}
/etc/X11/default-display-manager
{% endhighlight %} 

 
Essencialmente, todos estes programas executam o script
{% highlight bash %}
/etc/X11/Xsession
{% endhighlight %}

Então o script "/etc/X11/Xsession" executa run-parts(8) como acção para executar os scripts no directório "/etc/X11/Xsession.d/". Isto é essencialmente uma execução de um primeiro programa o qual é encontrado na seguinte ordem com o comando embutido exec.

* O script especificado como o argumento de /etc/X11/Xsession" pelo gestor de display X, se estiver definido.
* O script "~/.xsession" ou "~/.Xsession", se estiver definido.

> Se estiverem definidos os comandos.
 O comando 
{% highlight bash %}
/usr/bin/x-session-manager
{% endhighlight %}

{% highlight bash %}
/usr/bin/x-window-manager
{% endhighlight %}

{% highlight bash %}
/usr/bin/x-terminal-emulator
{% endhighlight %}

### Veja um vídeo sobre X Window System

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=Q1x19Oc4IuU)

 
# Para mais informações sobre o X no Debian, consulte
[http://www.debian.org/doc/manuals/debian-reference/ch07.pt.html](http://www.debian.org/doc/manuals/debian-reference/ch07.pt.html)
