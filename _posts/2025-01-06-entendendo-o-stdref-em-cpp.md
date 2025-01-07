---
layout: post
title: "Entendendo o std::ref em C++"
date: 2025-01-06 21:01:24
image: '/assets/img/cppdaily/stdref.jpg'
description: "🚀 Referências like a boss!"
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O `std::ref` é uma funcionalidade poderosa e flexível presente na biblioteca padrão do [C++](https://terminalroot.com.br/tags#cpp)([STL](https://terminalroot.com.br/tags#cppdaily)), introduzida no **C++11**. 

Ele é usado para criar objetos que agem como referências, permitindo que valores sejam passados por referência em cenários onde o comportamento padrão é criar cópias. Essa funcionalidade é especialmente útil em contextos como multithreading, algoritmos da STL e lambdas.


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

## Por que usar std::ref?
Em C++, quando passamos argumentos para funções ou funções de ordem superior (como [lambdas](https://terminalroot.com.br/2021/04/10-exemplos-de-uso-de-funcoes-lambda-em-cpp.html) ou `std::bind`), os valores geralmente são copiados. No entanto, em muitas situações, pode ser desejável que o argumento seja passado por referência para evitar cópias desnecessárias ou para modificar a variável original.

O `std::ref` resolve isso ao criar uma "referência encapsulada" que garante que a variável seja tratada como referência e não como uma cópia.

---

## Sintaxe e funcionamento
O `std::ref` retorna um objeto do tipo `std::reference_wrapper`, que age como um contêiner para a referência ao objeto original. Esse contêiner é compatível com os requisitos de argumentos de função e pode ser usado de forma transparente em várias situações.

O cabeçalho necessário para usar o `std::ref` é:

{% highlight cpp %}
#include <functional>
{% endhighlight %}

---

## Exemplos práticos

### Exemplo 1: Passando por referência em lambdas

{% highlight cpp %}
#include <iostream>
#include <functional>

void increment(int& value){
    value++;
}

int main(){
    int x = 10;

    // Usando std::ref para passar x por referência
    auto lambda = [&](){
        increment(std::ref(x));
    };

    lambda();
    std::cout << "Valor de x: " << x << std::endl; // Saída: Valor de x: 11

    return EXIT_SUCCESS;
}
{% endhighlight %}

### Exemplo 2: Usando `std::ref` com [std::bind](https://terminalroot.com.br/2021/04/stdbind-e-stdplaceholders.html)
O `std::bind` é uma função de ordem superior que permite criar funções parcialmente aplicadas. Por padrão, ele copia os argumentos fornecidos. No entanto, podemos usar `std::ref` para evitar isso.

{% highlight cpp %}
#include <iostream>
#include <functional>

void print_and_increment(int& value){
    std::cout << "Valor: " << value << '\n';
    ++value;
}

int main(){
    int x = 5;

    auto bound_function = std::bind(print_and_increment, std::ref(x));
    bound_function();

    std::cout << "Novo valor de x: " << x << '\n'; // Saída: Novo valor de x: 6

    return EXIT_SUCCESS;
}
{% endhighlight %}

### Exemplo 3: std::ref com containers STL
O `std::ref` é útil ao trabalhar com containers da STL que exigem cópias dos elementos, como `std::vector`.

{% highlight cpp %}
#include <iostream>
#include <vector>
#include <functional>

int main(){
    int x = 1, y = 2, z = 3;

    // Criando um vector de referências
    std::vector<std::reference_wrapper<int>> refs = {std::ref(x), std::ref(y), std::ref(z)};

    for(auto& ref : refs){
        ref.get() += 10; // Modifica os valores originais
    }

    std::cout << "x: " << x << ", y: " << y << ", z: " << z << '\n';
    // Saída: x: 11, y: 12, z: 13

    return EXIT_SUCCESS;
}
{% endhighlight %}


<!-- RECTANGLE LARGE -->
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

---

## Considerações importantes
1. **Uso com tipos temporários:**
   - O `std::ref` não deve ser usado com tipos temporários, pois o objeto referenciado precisa sobreviver durante o tempo de vida da referência encapsulada.
2. **std::cref:**
   - Para criar referências constantes, existe o `std::cref`, que funciona de forma semelhante ao `std::ref`, mas garante que o objeto referenciado seja tratado como `const`.
3. **Interoperabilidade:**
   - O `std::reference_wrapper` pode ser convertido de volta para uma referência normal usando o método `get()`.

{% highlight cpp %}
int a = 42;
std::reference_wrapper<int> ref = std::ref(a);
ref.get() = 50; // Modifica o valor original
auto b = ref.get();
{% endhighlight %}

---

O `std::ref` é uma ferramenta poderosa para manipular referências de forma flexível em [C++](https://terminalroot.com.br/cpp). Ele ajuda a <u>evitar cópias desnecessárias e é essencial em cenários que exigem o uso de argumentos por referência</u>. A compreensão de seu uso pode melhorar significativamente a eficiência e a clareza do código.


