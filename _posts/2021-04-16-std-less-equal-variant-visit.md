---
layout: post
title: "cpp::daily - Conceitos e Exemplos sobre: std::less_equal, std::variant e std::visit"
date: 2021-04-16 12:58:51
image: '/assets/img/cppdaily/cpp-daily-episode10.jpg'
description: 'C++ Diário - Episódio 010 .'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
---

![std less equal variant visit](/assets/img/cppdaily/cpp-daily-episode10.jpg)

No [capítulo anterior](https://terminalroot.com.br/2021/04/std-swap-std-greater-std-sort.html) vimos conceitos de [std::sort](https://terminalroot.com.br/2021/04/std-swap-std-greater-std-sort.html) e [std::greater](https://terminalroot.com.br/2021/04/std-swap-std-greater-std-sort.html) . Vamos trabalhar aquele exemplo do `std::sort` que usamos sem o terceiro parâmetro com `std::less_equal` para obtermos um array em ordem crescente.

+ O `std::less_equals` é uma classe de objeto de função usada para realizar comparações. É definido como uma classe de objeto de função para comparação inferior a igualdade que retorna um valor booleano dependendo da condição. 

Ou seja, basta usar o mesmo exemplo para ordenarmos de forma crescente:
> Exemplo:

{% highlight cpp %}
#include <iostream>
#include <algorithm>

int main(){
    int array[] = {11, 2, 9, 17, 12, 89, 13, 2, 52, 8, 4, 79},
          length = sizeof( array ) / sizeof( array[0] );

    std::sort( array, array + length, std::less_equal<int>() );

    for ( auto nums : array ) {
      std::cout << nums << ' ';
    }
    std::cout << '\n';

    return 0;
}
{% endhighlight %}
> Saída: `2 4 8 9 11 12 13 17 52 79 89`

Simples de entender, né?! Ou seja coloca em ordem do menor ou igual

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# `std::variant` e `std::visit`

O `std::variant` é como o próprio nome supõe, o tipo pode variar, não é igual à usar `auto`(precisa inicializar e não é possível alterar o tipo). Ou seja, com `std::variant` você pode dizer que a variável `var` poder ser: `int`, `std::string`, `char *`,... 

Já o `std::visit` é a forma que vamos manipular esse dado entregue pela `std::variant`, ou seja, quando você cria uma função ela tem um tipo de retorno, logo, o `std::visit` quase a mesma ideia diretamente ligada ao polimosfismo. Ela é geralmente usada em conjunto com [expressões lambda](https://terminalroot.com.br/cpp) .

> Exemplo: Criar uma variável e passar o valor dela para uma função, nesse caso: lambda.

{% highlight cpp %}
#include <iostream>
#include <variant> // para usar o std::variant

int main(){
  std::variant<int, std::string, char *> var;

  var = "Eu sou uma string!";

  std::visit( []( auto &e ) {
      std::cout << e << '\n';
      }, var );

  var = 936;

  visit( []( auto &e ) {
      std::cout << e << '\n';
      }, var );

  var = "Agora eu sou um char ponteiro.";

  visit( []( auto &e ) {
      std::cout << e << '\n';
      }, var );

  return 0;
}
{% endhighlight %}

Algumas coisas para analisar no código acima:
+ Necessário incluir a lib **variant**: `std::variant`;
+ Escolhi 3 tipos diferente para minha variável `var`: `int`, `std::string` e `char *`;
+ A resolução de escopo em `std::visit` pode ser opcional: ora usei: `std::visit` e outrora somente: `visit`;
+ E por último, você só conseguirá compilar esse código com **C++17**.

<!-- RETANGULO LARGO 2 -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:block; text-align:center;"
data-ad-layout="in-article"
data-ad-format="fluid"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="8549252987"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Bom, para uma análise rápida e de fácil compreensão é isso! Caso queira se aprofundar ainda mais sugiro esses links: [std::less_equal](https://en.cppreference.com/w/cpp/utility/functional/less_equal), [std::variant](https://en.cppreference.com/w/cpp/utility/variant) e [std::visit](https://en.cppreference.com/w/cpp/utility/variant/visit) .

Por hoje é só, são pequenas doses diárias que farão sempre nos manter antenado com o [C++](https://terminalroot.com.br/cpp/) !

## Acompanhe o [cpp::daily](https://terminalroot.com.br/tags#cppdaily)


