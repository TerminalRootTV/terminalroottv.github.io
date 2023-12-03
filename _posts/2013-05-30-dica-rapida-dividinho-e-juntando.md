---
layout: post
title: 'Dica rápida: Dividinho e juntando arquivos'
date: '2013-05-30T14:49:00.001-07:00'
image: '/assets/img/linux/Screenshot.jpg'
description: 'O comando split'
tags:
- gnulinux
- dicas
---

![Dica rápida: Dividinho e juntando arquivos](/assets/img/linux/Screenshot.jpg "O comando split")


### 1.0 - Dividinho com o comando split (divide um arquivo em partes)

+ -b ou --bytes » divide em quantidade de bytes(se a divisão não for exata, o último arquivo terá a quantidade restante)
+ -l ou --lines » cada arquivo com 50 linhas(se a divisão não for exata, o último arquivo terá a quantidade restante)
+ 10k » para 10 kilobytes
+ 10m » para 10 megabytes

Dividir em 10k um arquivo (usei exemplo mpeg, mas serve para qualquer extensão e até mesmo sem extensão)
{% highlight bash %}
split -b 10k arquivo.mpeg PARTE
{% endhighlight %}

Resultará em
{% highlight bash %}
PARTEab PARTEac PARTEad PARTEae PARTEaf PARTEag PARTEah PARTEai PARTEaj PARTEak PARTEal PARTEam
{% endhighlight %}

Caso não use o prefixo PARTE(ou qualquer outro nome que vc deseja), resultará em
{% highlight bash %}
ab ac ad ae af ag ah ai aj ak al am
{% endhighlight %}

Também pode-se usar outros caracteres, exemplo
{% highlight bash %}
split -b 10k arquivo.mpeg PARTE-
{% endhighlight %}

Resultará em
{% highlight bash %}
PARTE-ab PARTE-ac PARTE-ad PARTE-ae PARTE-af PARTE-ag PARTE-ah PARTE-ai PARTE-aj PARTE-ak PARTE-al PARTE-am
{% endhighlight %}

-l » divide em quantidade de linhas
Exemplo(pode-se usar também prefixo com ou sem caracteres)
{% highlight bash %}
split -l 10 /etc/passwd pas-
{% endhighlight %}

Resultará em
{% highlight bash %}
pas-aa pas-ab pas-ac pas-ad pas-ae pas-af pas-ag pas-ah
{% endhighlight %}

### 2.0 - Juntando com o comando cat
Se houver prefixo:
{% highlight bash %}
cat PARTE* > arquivo.mpeg
{% endhighlight %}

Se NÃO houver prefixo
{% highlight bash %}
cat * > arquivo.mpeg
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



