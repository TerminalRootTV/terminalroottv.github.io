---
layout: post
title: "Como solucionar o problema NO_PUBKEY"
date: '2014-12-14T09:08:00.000-08:00'
image: '/assets/img/debian/key.jpg'
description: "Modo bem simples e funcional."
tags:
- debian
- dicas
- debian
---

![Como solucionar o problema NO_PUBKEY](/assets/img/debian/key.jpg "Como solucionar o problema NO_PUBKEY")

## Problema
{% highlight bash %}
W: GPG error: http://www.debian-multimedia.org squeeze Release:
The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 07DC563D1F41B907
{% endhighlight %}

## Solução

- Adicione a linha do repositório no final do arquivo do __source.list__ (__>>__)
{% highlight bash %}
echo 'deb http://www.las.ic.unicamp.br/pub/debian-multimedia/ stable main' >> /etc/apt/sources.list
{% endhighlight %}

- Depois instale o __debian-keyring package__
{% highlight bash %}
apt-get install debian-keyring
{% endhighlight %}

- Depois execute esse comando, onde [__numero-da-chave__] é o __número que vc obteve do erro__
{% highlight bash %}
gpg --keyring /usr/share/keyrings/debian-keyring.gpg -a --export [numero-da-chave] |apt-key add -
{% endhighlight %}

- Agora rode novamente o __update__ e o erro não existirá mais
{% highlight bash %}
apt-get update
{% endhighlight %}

## Comente!

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



