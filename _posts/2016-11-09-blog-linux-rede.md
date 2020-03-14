---
layout: post
title: "Como Rodar Aplicativos Gráficos pela Rede no Linux"
date: '2016-11-09T16:06:00.000-08:00'
image: '/assets/img/tv/blog-linux-ssh.jpg'
description: "Vídeo demonstrando como rodar aplicativos gráficos pela rede no Linux"
color: '#cc181e'
tags:
- terminalroottv
---

![Blog Linux Rede](/assets/img/tv/blog-linux-ssh.jpg)

Edite esse arquivo:
{% highlight bash %}
nano /etc/ssh/sshd_config
{% endhighlight %}

E coloque isso dentro:
{% highlight bash %}
X11Forwarding yes
X11DisplayOffset 10
PrintMotd yes
PrintLastLog yes
TCPKeepAlive yes
UseLogin yes
{% endhighlight %}

E depois restart o ssh:
{% highlight bash %}
/etc/init.d/ssh restart
{% endhighlight %}


Logue:
{% highlight bash %}
ssh -X user@IP
{% endhighlight %}

# Veja o vídeo


# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=c42j3B8HRG0)


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

