---
layout: post
title: 'Como fazer ScreenCasts e Conversões de Video e Audio'
date: '2011-12-14T06:46:00.000-08:00'
image: '/assets/img/multimidia/multimidia.gif'
description: 'Para executar estas façanhas você pode utilizar alguns aplicativos, como: FFmpeg, XvidCap, Mencoder entre outros.'
tags:
- linux
- dicas
---

![Como fazer ScreenCasts e Conversões de Video e Audio](/assets/img/multimidia/multimidia.gif "Como fazer ScreenCasts e Conversões de Video e Audio")

Para executar estas façanhas você pode utilizar alguns aplicativos, como: __FFmpeg, XvidCap, Mencoder__...

Primeiramente você deve instalar o FFmpeg. O exemplo abaixo mostra no [Gentoo](http://www.terminalroot.com.br/tags#gentoo), mas use o gerenciador de pacotes da sua distribuição

{% highlight bash %}
emerge ffmpeg
{% endhighlight %}

Para converão de video, o comando é , supondo que você vai transformar de __OGV__ para __AVI__
{% highlight bash %}
ffmpeg -i entrada.ogv saida.avi
{% endhighlight %}

Outra possibilidade entre várias é dividir um video em varias partes, exmplo, você quer dividir um video de __20:45s__ em dois videos, primeiro você cria a primeira parte do video que você quer que tenha __10:45s__ (__10 x 60 + 45 = 645__)

{% highlight bash %}
ffmpeg -i video.avi -ss 00:00:00 -t 645 video_1.avi
{% endhighlight %}

O corte começa do minuto, segundo e hora __ZERO__ e corta __645__ segundos e depois cria outro com __600s__
{% highlight bash %}
ffmpeg -i video.avi -ss 00:10:45 -t 600 video_1.avi
{% endhighlight %}

Onde __-t__ é o tempo é o tempo e 0 -ss é o inicio de onde será gerado.
Para juntar arquivos você pode utilizar o mencoder
{% highlight bash %}
emerge mencoder
{% endhighlight %}

E para juntar basta executar o comando, supondo que você tenha __5 partes__ do video
{% highlight bash %}
mencoder -ovc lavc -oac lavc 1.avi 2.avi 3.avi 4.avi 5.avi 6.avi -o all.avi
{% endhighlight %}

Outra dica pra ScreenCast também sugiro o __RecordMyDesktop, Gtk-RecordMyDesktop e o XvidCap__, para instalá-los, respectivamente
{% highlight bash %}
emerge recordmydesktop
emerge gtk-recordmydesktop
emerge xvidcap
{% endhighlight %}

O __XvidCap__ é o melhor, porém ele utiliza api de audio __OSS__ e não __Alsa__, tem de fazer alguns manobras pra conseguir, porém você pode iniciar o record de audio separado e depois juntar o audio e o vídeo com o __PiTiVi__, para criar uma gravação de audio, execute o comando pelo terminal

{% highlight bash %}
rec audio.wav
{% endhighlight %}

Para especificar a resolução do video, você pode usar o comando

{% highlight bash %}
ffmpeg -i entrada.ogv -s 1360×768 saida.flv
{% endhighlight %}

Onde o __-s__ é a resolução do video que será __1360x768__.
É possível também fazer screencast (Captura da Tela) com o FFmpeg, o comando é
{% highlight bash %}
ffmpeg -f x11grab -s 1360x768 -r 30 -i :0.0 video_capturado.mpeg
{% endhighlight %}

Você pode converter muitos formatos tais como: __flv, mp4, mpeg, ogv, yum__, ...entre outros.
Para conversão de audio, por exemplo, de __FLV__ para __MP3__, o comando é

{% highlight bash %}
ffmpeg -i video.flv -ab 128k -ac 2 -ar 44100 musica.mp3
{% endhighlight %}

Os itens __-ab__ é a taxa de transferência(o bitrate), __-ac__ é a qualidade de canais, e o __-ar__ é a frequência.

É com essa ferramentas que eu gravo video-tutoriais entre outras coisas!

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

