---
layout: post
title: "Como criar um SLIDE de IMAGENS ou VÍDEOS pelo TERMINAL"
date: '2016-02-27T09:31:00.001-08:00'
image: '/assets/img/dicas/slide.jpg'
description: "Automatize criação de múltiplos Slides"
main-class: 'linux'
color: '#3b5998'
author: Terminal Root
tags:
- linux
- multimidia
- terminal
twitter_text: "Como criar um SLIDE de IMAGENS ou VÍDEOS pelo TERMINAL"
introduction: "Automatize criação de múltiplos Slides"
---

![Blog Linux Terminal Root](/assets/img/dicas/slide.jpg)

Vou mostrar uma forma de criar SLIDE pelo terminal utilizando o ffmpeg , lógico , precisaremos dele instalado. Verifique se o mesmo está instalado , caso não esteja , instale-o! Após instalado , você precisa estar no diretório onde estão as imagens ( $ cd SEU_DIR/ ) ou no comando apontar para a pasta que as contém. 

Para criar um SLIDE de imagens JPG sendo cada imagem com duração na tela de 2 segundos , use 

> ffmpeg [argumentos/opções] vídeo_de_slides.mp4
 

<blockquote class="tr_bq"><b>  <i><span style="color: #444444;"><span style="color: black;">-framerate</span> : Informa o tempo de duração de cada imagem [1/2] , 2 segundos.</span></i></b>
<p><i><span style="color: #444444;">  <span style="color: black;">-pattern_type glob -i</span> : Informa que não usaremos imagens pré numeradas , usaremos o glob *.jpg , o -i informa a entrada.</span></i></p>
<p><i><span style="color: #444444;">  <span style="color: black;">-c:v libx264</span> : Fundamental , pois usaremos o encoder libx264</span></i></p>
<b><i><span style="color: #444444;">  <span style="color: black;">-r</span> : O fluxo de vídeo terá uma taxa de quadros de 30 fps, duplicando os quadros de acordo:</span></i></b></blockquote>

{% highlight bash %}
ffmpeg -framerate 1/2 -pattern_type glob -i '*.jpg' -c:v libx264 -r 30 slide.mp4
{% endhighlight %}

### Para imagens no formato PNG , note que usamos mais argumentos -pix_fmt yuv420p , que gera compatibilidade para players que utilizam espaço de cor YUV com 4:2:0 subsampling chroma:

{% highlight bash %}
ffmpeg -framerate 1/2 -pattern_type glob -i '*.jpg' -c:v libx264 -pix_fmt yuv420p out.mp4
{% endhighlight %}

### Caso você quiser enumerá-las , em caso de erro , use sem o glob , lembrando que as imagens devem estar enumeradas como:

> img001.jpg, img002.jpg, img003.jpg, etc.



{% highlight bash %}
ffmpeg -framerate 1/5 -i img%03d.jpg -c:v libx264 -r 30 -pix_fmt yuv420p out.mp4
{% endhighlight %}


### Você ainda pode incluir música nos seus SLIDES, exemplo de PNG com Música:

{% highlight bash %}
ffmpeg -framerate 1/2 -pattern_type glob -i '*.jpg' -i audio.mp3 -c:v libx264 -c:a aac -strict experimental -b:a 192k -shortest out.mp4
{% endhighlight %}

Agora se em vez de IMAGENS você queira <span style="font-size: large;">juntar/concatenar</span> vídeos num só, então:
 
### Converter os vídeos para o formato MPEG com os mesmos bit rates, codecs, resoluções, números de quadros, etc.

{% highlight bash %}
ffmpeg -i arquivo_original -s vga -target ntsc-dvd -aspect 4:3 arquivo_novo.mpg
{% endhighlight %}
 
Depois você concatena todos os arquivos mpeg e joga a saída para um arquivo mpeg novo

{% highlight bash %}
cat *.mpg > novo.mpg
{% endhighlight %}
 
### Se o índice ficar bagunçado, o que será bem provável , para corrigir basta passar o arquivo pelo ffmpeg novamente

{% highlight bash %}
ffmpeg -i teste.mpg -sameq arquivo_final.mpg
{% endhighlight %}
 
### Se você quiser pôr áudio nos vídeos concatenados , pode alterar o áudio com o próprio FFMPEG! :)
 
Mais em: [https://ffmpeg.org/](https://ffmpeg.org/)



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

