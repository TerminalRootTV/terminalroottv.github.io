---
layout: post
title: "Como Fazer Acesso Remoto Gráfico no Linux via VNC"
date: '2016-11-11T18:12:00.000-07:00'
image: '/assets/img/tv/blog-linux-ssh-x-window.jpg'
description: "Não é TeamViewer, é VNC"
main-class: 'tv'
color: '#cc181e'
tags:
- TerminalRootTV
twitter_text: "Como Fazer Acesso Remoto Gráfico no Linux via VNC"
introduction: "Não é TeamViewer, é VNC"
---

![Blog Linux NFS](/assets/img/tv/blog-linux-ssh-x-window.jpg)


# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=wI7ek1ZHUxQ)


Instalar:
{% highlight bash %}
apt-get install tightvncserver tightvnc-java xtightvncviewer
{% endhighlight %}

Configura a senha:
{% highlight bash %}
vncpasswd
{% endhighlight %}

Iniciar o VNC no servidor:
{% highlight bash %}
vncserver
{% endhighlight %}

Caso preciso, usar o nmap:
{% highlight bash %}
nmap [IP]
{% endhighlight %}

Iniciar sessão:
{% highlight bash %}
vncviewer [IP]:[porta]
{% endhighlight %}
