---
layout: post
title: "Criando arquivos .tar.gz com senha"
date: '2014-12-20T04:05:00.002-08:00'
image: '/assets/img/linux/gpg.jpg'
description: "Aqui vai uma dica para deixar seus arquivos compactados em tar.gz com senha, na verdade o arquivo será transformado num .gpg"
tags:
- linux
- dicas
- gnu
---
![Criando arquivos .tar.gz com senha](/assets/img/linux/gpg.jpg "Criando arquivos .tar.gz com senha")

> Aqui vai uma dica para deixar seus arquivos compactados em __tar.gz com senha__, na verdade o arquivo será transformado num __.gpg__, segue

## Para compactar
Cria o __tar__(__-cf__, __C__ de __C__reate) e (__f__ de __F__iles), logo (__-cf C__reate __F__iles, serve pra memorizar)
{% highlight bash %}
tar -cf nome_que_vc_escolher.tar arquivo_ou_pasta
{% endhighlight %}

Agora transforma ele em __tar.gz__
{% highlight bash %}
gzip -9 arquivo_que_vc_criou.tar
{% endhighlight %}

e agora usa-se o __gpg__ para pôr senha
{% highlight bash %}
$ gpg -c arquivo.tar.gz
{% endhighlight %}

Descompactando, é preciso pôr a senha pré criada, quando ele solicitar
{% highlight bash %}
$ gpg arquivo.tar.gz.gpg
{% endhighlight %}

Agora extrair(__-xf X__ de e__X__tract e __F__ de __F__iles, e__X__tract __F__iles)
{% highlight bash %}
$ tar -xf arquivo.tar.gz
{% endhighlight %}

## Pronto!

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



