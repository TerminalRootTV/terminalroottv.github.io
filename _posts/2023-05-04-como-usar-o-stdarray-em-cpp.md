---
layout: post
title: "Como usar o std::array em C++"
date: 2023-05-04 08:48:58
image: '/assets/img/cppdaily/std-array.jpg'
description: 'Uma opção atraente para o armazenamento de um número fixo de elementos em um programa C++.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O `std::array` é um container da biblioteca padrão do [C++](https://terminalroot.com.br/tags#cpp) que armazena um número fixo de elementos do mesmo tipo em uma única estrutura de dados contígua na memória. Ele é semelhante a um array nativo do [C++](https://terminalroot.com.br/tags#cpp), mas com recursos adicionais e maior segurança.

O ideal é abandonar o estilo [C](https://terminalroot.com.br/tags#linguagemc) de criar *arrays* e usar o `std::array`.
{% highlight cpp %}
// Mal ideia
int arr[4] = {1, 2, 3, 4};
{% endhighlight %}

---

# Benefícios do `std::array`

O `std::array` é uma opção atraente para o armazenamento de um número fixo de elementos em um programa C++. Alguns benefícios do uso do `std::array` em relação a outros containers incluem:

+ Tamanho fixo: O tamanho do array é determinado em tempo de compilação e não pode ser alterado em tempo de execução. Isso permite a alocação contígua de memória para os elementos do array, o que pode resultar em melhor desempenho e eficiência de memória.
+ Maior segurança: O `std::array` fornece verificação de limites de índice em tempo de execução, o que significa que um erro será lançado se você tentar acessar um elemento fora dos limites do array. Isso ajuda a evitar erros comuns de programação, como acesso indevido à memória.
+ Compatibilidade com a interface de outros recursos.


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

# Como usar o `std::array`
Para usar o `std::array` em um programa C++, você deve incluir a biblioteca `<array>` e definir um objeto do tipo `std::array` com seu tamanho e tipo de elemento especificados. Por exemplo:

{% highlight cpp %}
std::array<int, 4> arr = {1, 2, 3, 4};
{% endhighlight %}
> Similar ao *array* criado acima em C.

Para imprimir os elementos, exemplo:
{% highlight cpp %}
for(auto &var : arr){
    std::cout << var << '\n';
}
{% endhighlight %}
> Ou usar o `loop` tradicional.

Você também pode inicializar os elementos posteriormente, exemplo:
{% highlight cpp %}
// Automaticamente todos elementos são inicializados com valor ZERO
std::array<int, 4> arr;

// Pode ser assim, ao elemento zero nesse caso
arr[0] = 1;

// Ou assim, ao elemento 1 nesse caso
arr.at(1) = 2;
{% endhighlight %}
> Ao imprimir todos os demais elementos que não foram definido valor, terão valor igual a ZERO: `0`.

---

# Recursos
O `std::array` dispões de diversas funções-membro e iteradores para facilitar a sua utilização, exemplo:

Verificar se o array está vazio com `.empty()`:
{% highlight cpp %}
std::cout << "O array está vazio? " << 
  ( arr.empty() ? "Sim" : "Não") << '\n';
{% endhighlight %}

> Entre outros conforme imagem abaixo:

![std::array LSP](/assets/img/cppdaily/std-array.png) 

---

Para mais informações [veja esse link](https://en.cppreference.com/w/cpp/container/array).

