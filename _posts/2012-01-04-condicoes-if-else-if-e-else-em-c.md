---
layout: post
title: 'Condições IF, ELSE IF e ELSE em C'
date: '2012-01-04T08:06:00.000-08:00'
image: '/assets/img/c/c.jpg'
description: 'Segue um exemplo simples para entendimento das condições na Linguagem C, leia os comentários para entender linha por linha.'
main-class: 'misc'
tags:
- Linguagem C
---

> Segue um exemplo simples para entendimento das condições na __Linguagem C__, leia os comentários para entender linha por linha.

{% highlight c %}
#include <stdio.h> /* inclusão do cabeçalho I/0 */
int main() /* chamamos a função main() para manipulação */
{
 int num; /* definimos a variável num como inteira, a saída será %d */
/*
	Código Significado
	%d Inteiro
	%f Float
	%c Caractere
	%s String
	%% Coloca na tela um %
*/
	 printf("Digite um número: \n"); /* imprimimos na tela a frase e pulamos uma linha com \n */
	 scanf("%d", &num); /* Lêmos o número digitado e armazenamos na variável num */
	 if(num==0){ /* começamos a condição se o número for ZERO */
     printf("O número é NULO\n"); /* executamos o comando, nesse somente imprimimos uma mensagem na tela e pulamos um linha */
	 }else if(num<8){
     printf("O número é Menor que 8\n"); /* proxima condição */
   }else if(num<11){
     printf("O número é maior que 7\n"); /* mais uma condição */
   }else{
     printf("O número está fora das condições criadas\n"); /* então finalizamos o bloco */
   }
  return(0); /* finalizamos */
/*  */
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

