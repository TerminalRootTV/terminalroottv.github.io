---
layout: post
title: 'Criando uma simples função de soma em Linguagem C'
date: '2011-10-30T13:50:00.000-07:00'
description: 'Bom, esse é o básico do entendimento, para quem já trabalha com PHP encontrará diversas similiaridades.'
tags:
- linguagem c
---

> Bom, esse é o básico do entendimento, para quem já trabalha com PHP encontrará diversas similiaridades.

Uma simples função de soma para entendimento, um pouco mais acima do código da postagem anterior. Eu comentei as linhas para tentar explicar mais ou menos o que cada linha faz.

{% highlight c %}
#include <stdio.h>//inclusao do cabeçalho standart I/O
 //criamos a função soma() e definimos as variaveis com inteiras(int)
 int soma(int x,int y)
 {
    //efetuamos a operação
    return (x+y);
 }
 //chamamos a função main() para a execução e impressão
 int main()
 {
     //definimos a variável saida
     int saida;
     //setamos os valores que queremos
     saida=soma(4,8);
     //imprimimos na tela o resultado
     printf ("O resultado da soma e: %d\n",saida);
     //finalizamos o código
     return(0);
 }
{% endhighlight %}

## Por enquanto é só, até a próxima!

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

