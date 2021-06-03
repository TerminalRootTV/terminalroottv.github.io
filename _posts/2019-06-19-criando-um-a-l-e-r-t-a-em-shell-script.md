---
layout: post
title: "Criando um A L E R T A em Shell Script"
date: 2019-06-19 02:49:43
image: '/assets/img/video/alerta.jpg'
description: 'Código pronto que faz a tela do monitor piscar.'
tags:
- comando
- shellscript
- terminal
---

![Criando um A L E R T A em Shell Script](/assets/img/video/alerta.jpg)

### Bateria do note acabando ?! 😦️

### Sistema reconheceu possível tentativa de ataque ?!! 😎️

### Feijão queimou ?!!! 😣️

### Crie um alerta pra te avisar e dar tempo de resolver,... espero! 😁️

{% highlight bash %}
while true; do
    echo -e "\e[?5h\e[33;5;1m A L E R T A $(date)"
    sleep 0.1
    printf \\e[?5l
    read -s -n1 -t1 && printf \\e[?5l && break
done
{% endhighlight %}

## Veja o vídeo

<!--
<div class="text-center">
    <video  controls>
      <source src="/assets/img/video/alerta.mp4" type="video/mp4">
      Seu navegador não suporta vídeos em HTML5.
    </video>
</div>
-->

<iframe width="910" height="390" src="/assets/img/video/alerta.mp4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

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



