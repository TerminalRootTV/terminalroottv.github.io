---
layout: post
title: "Como Instalar o MATE no Slackware Linux 14.2"
date: 2017-05-05 10:18:08
image: '/assets/img/slackware/slackware-mate-desktop.jpg'
description: "Procedimento feito utilizando arquivos já empacotados para Slackware."
tags:
- slackware
- mate
---

> [MATE](https://mate-desktop.org/pt/) é um ambiente de desktop derivado do [GNOME](https://www.gnome.org/). Foi criado devido a mudança "__agressiva__" de visual do seu sucessor, __GNOME 3, que não agradou todos__. Pode ser descrito como a continuação do [GNOME 2](https://pt.wikipedia.org/wiki/GNOME), com os recursos do __GNOME 3__, mas com o visual intuitivo e tradicional de sua versão anterior.

### Comandos utilizados
{% highlight bash %}
mkdir mate-desktop
cd mate-desktop/
lftp -c "open http://slackware.org.uk/msb/14.2/1.16/; mirror x86"
cd x86/
su
upgradepkg --install-new deps/*.t?z
upgradepkg --install-new base/*.t?z
upgradepkg --install-new extra/*.t?z
exit
xwmconfig
{% endhighlight %}

## Veja o Vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=0BqmT2GbtPM)


> Esse vídeo faz parte da Série [#VamosUsarSlack](https://www.youtube.com/playlist?list=PLUJBQEDDLNcm7ofcijCwxjwcnODFhP6HD) !!!

# Faça nosso curso gratuito de Shell Bash e adquira todo conteúdo nesse link
<http://www.terminalroot.com.br/shell/>

Dica extraída do [Blog Mundo GNU](https://goo.gl/IHcojK)

## Deixe seu comentário!

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



