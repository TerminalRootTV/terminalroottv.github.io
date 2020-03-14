---
layout: post
title: "Gerando Números para Mega-Sena em Linguagem C"
date: 2012-12-29 20:12:47
image: "/assets/img/c/megasenac.jpg"
description: "Função em Linguagem C para gerar 6 números aleatórios para a Mega-Sena."
color: '#3465a4'
tags:
- linguagem c
categories:
---

![Mega Sena Linguagem C](/assets/img/c/megasenac.jpg)

> Pra quem viu o post [Gerando Números para Mega-Sena com Shell Script](http://terminalroot.com.br/2015/01/gerando-numeros-para-mega-sena-com.html) viu como faz essa mesma coisa em Shell Script, aqui vou mostrar uma Função em __Linguagem C__ que eu criei para gerar 6 números aleatórios para a Mega-Sena. O código é simples, no entanto, precisa de alguns ajustes como: 

* 1- não gerar números repetidos; 
* 2 - não gerar o número 0. 

Quem tiver uma dica é só melhorar que eu "reblogo". Segue imagem e código.*Atenção para os comentários para entendimento*.

## Analise o Código abaixo

{% highlight c %}
//Gerar números para Mega-Sena em Linguagem C
#include <stdio.h>

int main(){ 
 int i, numero; //declaração de variáveis 
 srand(time(NULL)); //faz com que os números não se repitam 
 printf("\033[34m %s \033[0m", "Números gerados:\n");//cor azul  
 for(i=1; i<=6; i++){
  numero = rand() % 61;
  megasena(numero);
 } 
 printf("\n"); 
 return(0);  
}

int megasena(int num){ 
 printf("\033[42m \033[37m %d \033[0m | ",num);//cor fundo verde
}
{% endhighlight %}

# Comente!

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

