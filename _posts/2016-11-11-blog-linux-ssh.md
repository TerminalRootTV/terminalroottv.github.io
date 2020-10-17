---
layout: post
title: "Como Fazer Acesso Remoto Gráfico no Linux via VNC"
date: '2016-11-11T18:12:00.000-07:00'
image: '/assets/img/tv/blog-linux-ssh-x-window.jpg'
description: "Não é TeamViewer, é VNC"
color: '#cc181e'
tags:
- terminalroottv
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



