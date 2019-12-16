---
layout: post
title: "Acertando data e hora no Linux"
date: '2013-02-14T15:23:00.000-08:00'
image: '/assets/img/linux/date.jpg'
description: "Pra não esquecer mais."
main-class: 'linux'
tags:
- Linux
- Dicas
---

![Acertando data e hora no Linux](/assets/img/linux/date.jpg "Acertando data e hora no Linux")

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Para acertar data/hora no Linux, basta
{% highlight bash %}
date MMddhhmmyyyy
{% endhighlight %}

## As letras significam
- __MM__: mês
- __dd__: dia
- __hh__: hora
- __mm__: minuto
- __yyyy__: ano

Depois
> hwclock -w

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Para maiores informações deve-sempre usar o __man__ ou o __help__
{% highlight bash %}
man date
date --help
{% endhighlight %}
