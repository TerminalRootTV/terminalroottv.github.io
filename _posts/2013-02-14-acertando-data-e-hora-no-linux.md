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
> clock -w

Para maiore informações deve-sempre usar o __man__ ou o __help__
{% highlight bash %}
man date
date --help
{% endhighlight %}
