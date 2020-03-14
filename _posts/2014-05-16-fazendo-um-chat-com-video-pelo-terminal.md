---
layout: post
title: "Fazendo um Chat com Vídeo pelo Terminal"
date: '2014-05-16T18:04:00.000-07:00'
image: '/assets/img/shell-script/terminal-video-chat.gif'
description: "Entre os mais populares aplicativos de vídeo do bate-papo aparece p2pvc"
tags:
- multimidia
- noticias
- terminal
---
 
![Fazendo um Chat com Vídeo pelo Terminal](/assets/img/shell-script/terminal-video-chat.gif "Fazendo um Chat com Vídeo pelo Terminal")

Entre os mais populares aplicativos de vídeo do bate-papo aparece [p2pvc](https://github.com/mofarrell/p2pvc) (ponto a ponto do bate-papo de vídeo), um programa muito simples  que nos permite iniciar conversas de vídeo em um terminal.

O que define p2pvc de outros é que o vídeo é exibido no próprio  terminal, usando caracteres ASCII e 256 cores possíveis no terminal.
Como a qualidade do vídeo deixa muito a desejar, com suporte para  áudio, e até mesmo pode simplesmente usá-lo para fazer chamadas de voz  sem software adicional.

Para fazer as chamadas que temos de colocar o endereço IP do computador que você deseja se conectar.

### ☛ Dependências

+ ✔ OpenCV
+ ✔ PortAudio
+ ✔ ncurses

### ☛ Download
{% highlight bash %}
wget https://github.com/mofarrell/p2pvc/archive/master.zip
{% endhighlight %}

### ☛ Compilação
{% highlight bash %}
make
./p2pvc 127.0.0.1 -v
{% endhighlight %}

Endereço do projeto: <https://github.com/mofarrell/p2pvc>

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

