---
layout: post
title: "Conheça um Awk em Javascript online"
date: 2020-02-12 19:37:05
image: '/assets/img/awk/awk.js.jpg'
description: 'Útil para quem não está em um sistema que não possui o Awk por padrão.'
tags:
- awk
- javascript
- code
- sed
---

![Conheça um Awk em Javascript online](/assets/img/awk/awk.js.jpg)

Pra quem curte e usa [Awk](https://terminalroot.com.br/2014/12/tutorial-basico-de-awk.html) com frequência para resolver os mais variados problemas relacionados à filtragem e manipulação de dados, o Mawk é mais uma solução, completa e o mais legal é que funciona online e é compilada em JavaScript.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

A linguagem [AWK](https://terminalroot.com.br/2014/12/tutorial-basico-de-awk.html) é útil para manipulação de arquivos de dados, recuperação e processamento de texto para prototipagem e experimentação de algoritmos. Mawk está em conformidade com o POSIX 1003.2 .

Para utilizar o [Awk.js](https://awk.js.org/help.html) basta acessar [esse](https://awk.js.org/help.html) endereço e na coluna à sua esquerda digitar o texto que deseja e no campo superior, inserir o comando correspondente para manipular o texto como deseja.

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

Já por padrão existe um exemplo para filtragem do texto também já disponível:
{% highlight bash %}
-F "[, ]+" '/George|^John/{print $NF ":", $1, $(NF-1)}'
{% endhighlight %}

E o resultado aparece na coluna à sua direita já pós formatado. Pra quem não está no PC em casa, e se num sistema que não há o [Awk](https://terminalroot.com.br/2014/12/tutorial-basico-de-awk.html) disponível, é uma boa.

Para mais informações use o comando `--help` ou até mesmo clique em [📘 help](https://awk.js.org/help.html), além de diversas opções de parâmetros: <https://awk.js.org/>.

Espero que tenha gostado dessa *dica rápida*.

Fui!


