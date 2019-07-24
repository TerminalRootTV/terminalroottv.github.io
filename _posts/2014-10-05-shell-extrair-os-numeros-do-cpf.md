---
layout: post
title: 'Extrair os números do CPF formatado por Comando'
date: '2014-10-05T06:13:00.002-07:00'
image: '/assets/img/shell-script/tr.jpg'
description: 'O tr é um comando muito versátil, especialmente útil para apagar caracteres indesejados.'
main-class: 'misc'
tags: 
- comandos
---
![Extrair os números do CPF formatado por Comando](/assets/img/shell-script/tr.jpg "Extrair os números do CPF formatado por Comando")

> O __tr__ é um comando muito versátil, especialmente útil para apagar caracteres indesejados.

Digamos que você peça ao usuário para digitar o número do __CPF__. Esse  número poderá vir das mais diferentes formas, com espaços, __hífens,  pontos, ponto-e-vírgula__ e sabe mais o que que a criatividade da pessoa  pode produzir.Para preservar sua sanidade, tudo o que você quer são os números,ignorando toda a pontuação, espaços e outros caracteres. Com o tr é fácil.

{% highlight bash %}
echo 123.456.789-00 | tr -d 0-9 ..-
{% endhighlight %}

A opção __-d__ apaga coisas e o __0-9__ representa os números de zero a nove.  Ah, note que não é necessário o uso de colchetes ao redor __[0-9]__, como  muita gente costuma fazer.

Mas este comando apagou os números e deixou a pontuação, quando o  desejado é o justamente o contrário. Então basta usar a opção __-c__, que  inverte o sentido da expressão, fazendo o tr apagar tudo exceto os números

{% highlight bash %}
echo 123.456.789-00 | tr -c -d 0-9 12345678900
{% endhighlight %}

Via: Codare

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

