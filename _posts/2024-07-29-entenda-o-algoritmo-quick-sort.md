---
layout: post
title: "Entenda o Algoritmo Quick Sort"
date: 2024-07-29 08:43:39
image: '/assets/img/programacao/quick-sort.jpg'
description: "⚡️ O Quick Sort é um algoritmo de ordenação eficiente e amplamente utilizado, que segue a abordagem de: dividir para conquistar."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- algoritmos
- cpp
- cppdaily
- programacao
- desenvolvimento
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O **Quick Sort** é um algoritmo de ordenação eficiente e amplamente utilizado, que segue a abordagem de "dividir para conquistar". Ele funciona da seguinte maneira:
+ **1.** Faz escolha de um elemento como pivô do array. Existem várias estratégias para escolher o pivô, como o primeiro elemento, o último elemento, o elemento do meio, ou uma média de três.
+ **2.** Depois ele reorganiza o array de tal forma que todos os elementos menores que o pivô ficam à esquerda e todos os elementos maiores que o pivô ficam à direita. O pivô é então colocado em sua posição final.
+ **3.** O processo é repetido recursivamente para os subarrays à esquerda e à direita do pivô, até que todos os subarrays estejam ordenados.

Para o algoritmo Quick Sort, a complexidade é `O(n²)`, no pior caso, mas em outras situações, dependendo do *pivô* escolhido, sua complexidade pode ser: `O(n log n)` quando o *pivô* escolhido é consistentemente o menor ou o maior elemento em cada partição.

Vamos ver na prática como implementar o **Quick Sort** com [C++ Moderno](https://terminalroot.com.br/tags#cpp)!

---

## 🎥 Assista ao vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/iNkNlIPjiDI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

## 📄 Código desenvolvido no vídeo
{% highlight cpp %}
#include <iostream>
#include <vector>
#include <functional>

auto partition = [](std::vector<int>& v, int low, int high){
  int pivot = v[high];
  int i = low - 1;
  for (int j = low; j < high; ++j){
    if(v[j] <= pivot){
      ++i;
      std::swap(v[i], v[j]);
    }
  }
  std::swap(v[i + 1], v[high]);
  return i + 1;
};

std::function<void(std::vector<int>&, int, int)> 
quick_sort = [](std::vector<int>& v, int low, int high){
  if(low < high){
    int p = partition(v, low, high);
    quick_sort(v, low, p - 1);
    quick_sort(v, p + 1, high);
  }
};


int main(){
  std::vector<int> v {11, 2, 13, 17, 12, 8, 4};
  quick_sort(v, 0, v.size() - 1);
  for(auto &var : v){
    std::cout << var << ' ';
  }
  std::cout.put('\n');
  return EXIT_SUCCESS;
}
{% endhighlight %}

---

## Links úteis
+ [Como Usar std::function em C++](https://terminalroot.com.br/2023/05/como-usar-stdfunction-em-cpp.html)
+ [Como usar e pra que serve a biblioteca magic_enum](https://terminalroot.com.br/2024/07/como-usar-e-pra-que-serve-a-biblioteca-magicenum.html)
+ [Conceitos sobre new e delete em C++](https://terminalroot.com.br/2024/07/conceitos-sobre-new-e-delete-em-cpp.html)
+ [Funções Variádicas em C++](https://terminalroot.com.br/2024/07/funcoes-variadicas-em-cpp.html)
