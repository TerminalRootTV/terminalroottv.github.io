---
layout: post
title: 'Criando um sistema de Captcha'
date: '2011-11-06T16:37:00.000-08:00'
image: '/assets/img/php/captcha.jpg'
description: 'Existem varias formas de se fazer isso, algumas formas tiveram problema acredito por causa da biblioteca GD, se vc não as tem instaladas.'
tags:
- php
---

![Criando um sistema de Captcha](/assets/img/php/captcha.jpg "Criando um sistema de Captcha")

> Existem varias formas de se fazer isso, algumas formas tiveram problema acredito por causa da __biblioteca GD__, se vc não as tem instaladas.

{% highlight bash %}
su
emerge php5-gd
{% endhighlight %}

O código abaixo está todo comentado para causar o entendimento.

{% highlight php %}
<?php

//INICIAR A SESSION
session_start();

//INICIAR O HEADER
header('Content-Type: image/png');

//puxar a imagem, vc deve ter essa imagem na pasta, pois ela servirá de base.
$image = imagecreatefrompng("captcha.jpg") or die ("Não foi possível iniciar a imagem.");

//carregar a fonte, tem de ser no formato gdf, neste caso, google-a
$fonte  = imageloadfont("anonymous.gdf");

//quantidade de caracteres, shuffle para embaralhar e 4 caracteres somente q eu escolhi
$texto  = substr(str_shuffle("AaBbCcDdEeFfGgHhIiJjKkLlMmNnPpQqRrSsTtUuVvYyXxWwZz23456789"),0,4);

//salvar a session
$_SESSION['capcad'] = $texto;

//indicar a cor da fonte
$cor = imagecolorallocate($image,0,0,0);

//junção da imagem com o texto, os numeros referenciam a posição da imagem
imagestring($image, $fonte, 50, 10, $texto, $cor);

//mostrar imagem
imagepng($image);

//liberar memória
imagedestroy($image);
?>
{% endhighlight %}

## Valeu!

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



