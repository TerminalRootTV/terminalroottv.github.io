---
layout: post
title: "Como criar uma galeria de fotos pelo Terminal"
date: '2015-08-19T05:09:00.000-07:00'
image: '/assets/img/shell-script/galeria.jpg'
description: "Para você criar uma galeria estilo a da imagem dessa postagem é necessário que você possua o totem-video-thumbnailer."
tags:
- shell script
- multimídia
- terminal
- comandos
---

![Como criar uma galeria de fotos pelo Terminal](/assets/img/shell-script/galeria.jpg "Como criar uma galeria de fotos pelo Terminal")

> Para você criar uma galeria estilo a da imagem dessa postagem é necessário que você possua o [totem-video-thumbnailer](https://github.com/GNOME/totem/blob/master/data/totem-video-thumbnailer.1). __totem-video-thumbnailer__ é usado internamente por aplicações do [GNOME](https://www.gnome.org/) tais como [Nautilus](https://pt.wikipedia.org/wiki/Nautilus_(informática)) para gerar miniaturas __PNG__ de arquivos de vídeo. Embora seja possível invocá-lo manualmente, geralmente é feito automaticamente pelo Nautilus. Com ele também é possível gerar Galerias de imagens, essas podem ser geradas pelo próprio modo gráfico, no entanto, se você tiver uma série de vídeos que você deseja criar galerias de todos vídeos, a melhor forma é criar um script, que será mostrado aqui.

Copie esse código e cole no Terminal , se a resposta for '__Está instalado__' , então precisa instalar, se não, pule a próxima etapa que é de instalação

{% highlight bash %}
[ $(which totem-video-thumbnailer) ] && echo 'Está instalado' || 'Não tem instalado e precisa instalar'
{% endhighlight %}

Se '__Não tem instalado e precisa instalar__' for a resposta, então instale, use seu gerenciador de pacotes para instalar, ele está na maioria dos repositórios da Distros:

{% highlight bash %}
apt-get install totem
{% endhighlight %}

Como podem ver ele é instalado junto com [TOTEM](https://gnome.org/projects/totem/).

> __Totem__ é um media player livre para o ambiente desktop __GNOME__. Totem é o padrão media player no __GNOME__ desde a versão 2.10. O programa usa __GStreamer__ media para a reprodução, embora o __xine__ também seja possível. O Totem é capaz de reproduzir muitos formatos, embora por vezes mais codecs são necessários.

## Se você quiser criar só uma thumbnail de um vídeo seu, basta executar este comando:

{% highlight bash %}
totem-video-thumbnailer -j video.mp4 imagem.jpg
{% endhighlight %}

## Mas se você quiser criar uma Galeria, que é propósito dessa postagem, você deverá executar este código
+ __-l__ , não limitar a 30 segundos, o padrão é 30 segundos.
+ __-j__ , a saída será uma imagem, em jpg
+ __-s__ , tamanho dos quadros da galeria, pixels.
+ __-g__ , quantidade de quadros da galeria

{% highlight bash %}
totem-video-thumbnailer -l -j -s 500 -g 9 video.mp4 galeria.jpg
{% endhighlight %}

Agora se você quiser gerar galeria de vários videos, rode esse Script

__Troque__ a palavra __DIRETORIO__ pelo nome do seu diretório! As imagens aparecerão no diretório que está o script, a não ser que você mude.

> Obs.: Rode script fora do diretório dos vídeos e informe o caminho no script

> Obs.: Se você gerar uma __Galeria com tamanho dos quadros x quantidade de quadros__ , muito grande, o __totem-video-thumbnailer__ irá matar o processo: __Morto__.
  
Você ainda pode melhorar esse script adicionando algumas informações do vídeo a ele, nesse caso é necessário possuir o o [ffmpeg](https://ffmpeg.org/) instalado:

## Descobrir a duração do Vídeo

{% highlight bash %}
ffmpeg -i video.mp4 2>&1 | grep "Duration" | cut -d ' ' -f4 | tr -d ',' | cut -d '.' -f1
{% endhighlight %}

#### Você pode enviar esses dados para uma variável e resgatar a variável depois, se for no script, crie a variável dentro do loop:

{% highlight bash %}
DURACAO=$(ffmpeg -i "$MOVIE" 2>&1 | grep "Duration" | cut -d ' ' -f4 | tr -d ',' | cut -d '.' -f1)
echo $DURACAO
{% endhighlight %}


## Resolução do vídeo

{% highlight bash %}
ffmpeg -i DIRETORIO/"$MOVIE" 2>&1 | grep 'fps' | cut -d' ' -f14 | tr -d ','
{% endhighlight %}

## Largura do vídeo

{% highlight bash %}
ffmpeg -i DIRETORIO/"$MOVIE" 2>&1 | grep 'fps' | cut -d' ' -f14 | tr -d ',' | cut -d'x' -f1
{% endhighlight %}

## Frames por segundo

{% highlight bash %}
ffmpeg -i DIRETORIO/"$MOVIE" 2>&1 | grep 'fps' | cut -d ',' -f5 | tr -d ' '
{% endhighlight %}

Se for pôr tudo no Script, alteraria a variável __GALERIA__ deixando-a, assim

{% highlight bash %}
GALERIA=$(totem-video-thumbnailer -l -j -s 500 -g 18 "$MOVIE" "$MOVIE"-"Duracao:$DURACAO-Resolucao:$RESOLUCAO-Frames:$FRAMES".jpg 2>/dev/null)
{% endhighlight %}

## Consequentemente o Script, ficaria assim
  
#### A saída ficaria mais ou menos assim:
> __Video-Duracao:00:08:55-Resolucao:500x400-Frames:25.jpg__

Legal, dá pra ver as informações do vídeo pelo nome do arquivo!!!

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

