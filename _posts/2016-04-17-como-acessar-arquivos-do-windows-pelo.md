---
layout: post
title: "Como Acessar arquivos do Windows pelo Linux e vice-versa"
date: '2016-04-17T05:09:00.000-07:00'
image: '/assets/img/servidor/como-acessar-windows-pelo-linux-video-youtube.jpg'
description: "Vídeo e Arquivo MODELO do smb.conf"
tags:
- linux
- servidores
- terminalroottv
- redes
---

![Como Acessar arquivos do Windows pelo Linux e vice-versa](/assets/img/servidor/como-acessar-windows-pelo-linux-video-youtube.jpg "Como Acessar arquivos do Windows pelo Linux e vice-versa")


# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=WGTbBfdEgJ0)


## Arquivo MODELO do smb.conf

{% highlight bash %}
[global]
	netbios name = NOME_QUE_APARECERÀ_PARA_O_WINDOWS
	server string = Servidor público
	map to guest = Bad User
	guest account = NOME_DO_USUÀRIO
	os level = 100
	preferred master = Yes
	wins support = Yes
	idmap config * : backend = tdb


[arquivos]
	path = /mnt
	read only = No
	guest ok = Yes


[backups]
	path = /mnt
	read only = No
	guest ok = Yes


[Public]
	comment = Diretorio do Linux
	path = DIRETÒRIO_A_SER_COMPARTILHADO
	read only = No
	create mask = 0755
	guest ok = Yes
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

