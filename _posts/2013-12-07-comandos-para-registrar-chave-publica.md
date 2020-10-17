---
layout: post
title: 'Comandos para registrar chave pública do APT'
date: '2013-12-07T05:42:00.000-08:00'
image: '/assets/img/debian/chave.jpg'
description: 'Aprenda a resolver isso!'
tags:
- debian
- linux
- dicas
---

![Comandos para registrar chave pública do APT](/assets/img/debian/chave.jpg "Aprenda a resolver isso!")

### O erro é assim

> W: GPG error: http://ftp.br.debian.org etch Release:  The following signatures couldn't be verified  because the public key is not available:  NO_PUBKEY 9AA38DCD55BE302B  W: There is no public key available for the following key IDs: 9AA38DCD55BE302B W: You may want to run apt-get update to correct these problems

### Estes são os comandos p/ registrar a chave pública do apt

{% highlight bash %}
gpg --keyserver pgpkeys.mit.edu --recv-key 
gpg -a --export  | sudo apt-key add - Onde  é o id que aparece na hora de instalar um pacote. Exemplo:  9AA38DCD55BE302B.
{% endhighlight %}

Fonte: http://blog.marceloakira.com/?p=73

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



