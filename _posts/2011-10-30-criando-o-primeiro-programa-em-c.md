---
layout: post
title: Criando o primeiro programa em C
date: '2011-10-30T13:27:00.000-07:00'
description: Criando o primeiro programa em C
color: '#3465a4'
author: The Bang Bash
tags:
- linguagem c
modified_time: '2014-10-21t18:35:26.381-07:00'
---



<b>Certifique-se de que o GCC tá instalado para compilá-lo, caso não esteja, basta instalar via apt-get:</b>

{% highlight bash %}

apt-get install gcc
{% endhighlight %}

Escreva o código abaixo no seu editor preferido, salve como 

{% highlight bash %}
arquivo.c
{% endhighlight %}

e compile-o com o seguinte comando

{% highlight c %}
gcc arquivo.c -o arquivo
{% endhighlight %}

<b>Depois é só executar com o comando</b>
{% highlight bash %}
./arquivo
{% endhighlight %}



{% highlight c %}

#include <stdio.h> 

int main() 
{ 
 printf("Terminal Root\n"); 
 return 0;
} 
{% endhighlight %}



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

