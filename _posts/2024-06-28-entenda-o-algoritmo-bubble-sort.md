---
layout: post
title: "Entenda o Algoritmo Bubble Sort"
date: 2024-06-28 23:07:11
image: '/assets/img/bubble-sort.jpg'
description: "🫧 O Bubble Sort compara cada par de elementos adjacentes e os troca se estiverem fora de ordem."
icon: 'ion:terminal-sharp'
iconname: 'Programação'
tags:
- programacao
- desenvolvimento
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Os algoritmos de ordenação possuem diversas utilidades na Ciência da Computação, dentre elas:
+ Organização e Busca Eficiente;
+ Agilidade para Visualizar e gerar Relatórios;
+ Melhoria do Desempenho
+ E entre outras!

Classificar algoritmos de ordenação por ordem de velocidade é complexo, pois a eficiência de cada algoritmo pode variar dependendo da estrutura dos dados de entrada.

No entanto, um dos mais simples é o Bubble Sort.

O **Bubble Sort**, ou ordenação por flutuação (literalmente "por bolha"), compara elementos adjacentes e os troca se estiverem na ordem errada. Ele repete este processo até que toda a lista esteja ordenada, é um dos mais fáceis algoritmos para implementar.

Ele possui complexidade `O(n²)`. O termo "`O(n²)`" refere-se à notação Big O(Big O Notation, em inglês), que é uma forma de descrever a complexidade de tempo de um algoritmo. 

A notação Big O fornece uma estimativa do tempo de execução de um algoritmo em função do tamanho da entrada, denotado por "n".
> O(n²) significa que o tempo de execução do algoritmo aumenta proporcionalmente ao quadrado do tamanho da entrada. Em outras palavras, se o tamanho da entrada (`n`) dobrar, o tempo de execução será aproximadamente quatro vezes maior.

O **Bubble Sort** compara cada par de elementos adjacentes e os troca se estiverem fora de ordem. Isso é feito repetidamente para todos os elementos na lista, resultando em muitas comparações e trocas.
+ No primeiro passe, ele faz `(n-1`) comparações.
+ No segundo passe, faz (`n-2`) comparações, e assim por diante.
+ No total, o número de comparações é aproximadamente `(n-1) + (n-2) + ... + 1 = n(n-1)/2`.
> Isso se traduz em uma complexidade de tempo de O(n²), indicando que o tempo de execução cresce quadraticamente com o aumento do tamanho da entrada.

A notação Big O é útil porque permite comparar a eficiência de diferentes algoritmos sem se preocupar com detalhes específicos da implementação ou do hardware. Outros exemplos comuns de complexidade incluem:
+ O(1): Tempo constante, independente do tamanho da entrada.
+ O(log n): Tempo logarítmico, cresce lentamente em relação ao tamanho da entrada.
+ O(n): Tempo linear, cresce diretamente proporcional ao tamanho da entrada.
+ O(n log n): Tempo linearítmico, comum em algoritmos de ordenação eficientes como *Merge Sort* e *Quick Sort*.
+ O(n³): Tempo cúbico, cresce proporcionalmente ao cubo do tamanho da entrada.

Essas expressões ajudam a entender como a performance de um algoritmo escala à medida que o tamanho dos dados de entrada aumenta.

---

## Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/ZG_L4MhWzBM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


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

## Código criado no vídeo

{% highlight cpp %}
#include <iostream>
#include <vector>

auto bubble_sort = [](std::vector<int>& v){
  for (size_t i {}; i < v.size() - 1; ++i){
    for (size_t j {}; j < v.size() - (i + 1); ++j){
      if(v[j] > v[j + 1]){
        std::swap(v[j], v[j + 1]);
      } 
    }
  }
};

int main(){
  std::vector<int> v {11, 2, 13, 17, 12, 8, 4};
  bubble_sort(v);
  for(auto &var : v){
    std::cout << var << ' ';
  }
  std::cout.put('\n');
  return EXIT_SUCCESS;
}
{% endhighlight %}


