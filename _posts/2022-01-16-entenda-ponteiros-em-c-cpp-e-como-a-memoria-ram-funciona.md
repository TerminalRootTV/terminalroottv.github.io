---
layout: post
title: "Entenda Ponteiros em C/C++ e como a Memória RAM funciona"
date: 2022-01-16 15:35:21
image: '/assets/img/cpp/ponteiros.jpg'
description: 'Em Computação mais precisamente em Linguagens de Programação, ponteiro é um objeto que armazena endereço de memória.'
tags:
- cpp
- cppdaily
- linguagemc
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

Em Computação mais precisamente em [Linguagens de Programação](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html), ponteiro é um objeto que armazena endereço de memória. Um objeto pode ser qualquer coisa: uma variável, uma função ou uma estrutura de dados .

Um ponteiro faz referência à uma localização e quando você obtém o valor armazenado naquele endereço é chamado de: desreferência .

---

# Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/8ecXNd4Cv3U" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 

---

# Código usado no vídeo 


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

{% highlight cpp %}
#include <iostream>

int main (){
  int x = 2049;
  int *px = &x;
  printf("O tamanho de x   : %d bytes\n", sizeof(int));
  printf("O valor de x   : %d\n", x);
  printf("O endereço de x: %d\n", px);
  printf("O ponteiro de x: %d\n", *px);
  printf("Soma de x + 1: %d\n", px + 1);
  printf("Soma de px + 1: %d\n", *(px + 1));
  
  char *y = (char*)px;
  printf("O tamanho de y   : %d byte(s)\n", sizeof(char));
  printf("O endereço de y: %d\n", y);
  printf("O valor de y   : %d\n", *y);
  printf("Soma de y + 1: %d\n", y + 1);
  printf("Soma de *(y + 1): %d\n", *(y + 1));
  return 0;
}
{% endhighlight %}

---

# Referências
+ <http://www.buthowdoitknow.com/>
+ <https://en.wikipedia.org/wiki/Pointer_(computer_programming)>
+ <https://terminalroot.com.br/tags#cpp>
