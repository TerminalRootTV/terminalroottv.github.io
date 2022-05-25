---
layout: post
title: "Conheça o consteval do C++ 20"
date: 2022-05-25 11:40:37
image: '/assets/img/cppdaily/consteval.jpg'
description: 'E um pequena introdução sobre o constexpr .'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

`constexpr` é similar ao especificador `const`, a diferença é que ela é aplicável a mais tipos , como por exemplo, também em *funções-membro estáticas* e entre outros.

Logicamente, assim como `const` e `auto`, ela requer inicialização no momento da declaração. No [Curso de C++ Moderno Avançado](https://terminalroot.com.br/cpp)
abordamos de forma mais detalhada sobre `constexpr`. Mas em resumo é: 

> O cálculo é feito em tempo de compilação ganhando um desempenho muito superior do que se não usasse `constexpr`.
Exemplo de uso:

{% highlight cpp %}
constexpr int x = (9 + 3) / ( 2 * 2 ) - 1;
{% endhighlight %}

Para obter dados da execução você pode usar o comando: [time](https://manpages.debian.org/stretch/time/time.1.en.html).

Para mais informações sobre `constexpr` veja [aqui](https://en.cppreference.com/w/cpp/language/constexpr) .
<!-- Mais em: https://stackoverflow.com/questions/14116003/whats-the-difference-between-constexpr-and-const --> 


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

# E o `consteval` ?
`consteval` pode ser resumido como uma *melhoria* do `constexpr` . Conceitualmente falando, de acordo com o [cppreference](https://en.cppreference.com/w/cpp/language/consteval) , é um especificador que declara uma função ou modelo para ser uma **função imediata** .

Isso acima soou um pouco difícil de entender, mas em resumo é que a documentação se refere à ordem de execução.

O `constexpr` deixava "*dúvidas*" de qual seria o resultado após **múltiplas utilizações para funções**, o programadores tinham aquela sensação de que rodou em tempo de execução, logo, o `consteval` foi implementado a partir do [C++20](https://en.wikipedia.org/wiki/C++20) para resolver essas *discrepâncias*.

Abaixo segue alguns exemplos de uso do consteval
> Note que ela é **usada para FUNÇÕES** e **só compila com `-std=c++20`** ou superior, avise isso à seu LSP! 😃 

{% highlight cpp %}
#include <iostream>

consteval unsigned ret_calc(int first_num){
  return (first_num + 3) / ( 2 * 2 ) - 1;
}

consteval int make_double(unsigned x){
  return 2 * x;
}

consteval auto self_mult(auto num){
  return num * num;
}

consteval static int increment(double x){
  return ++x;
}

int main(){
  // consteval int y = (9 + 3) / ( 2 * 2 ) - 1; // diferente de constexpr, isso não compila
  std::cout << ret_calc(9) << '\n';
  std::cout << make_double(3) << '\n';
  std::cout << self_mult(39.6f) << '\n';
  std::cout << increment(6) << '\n';
}
{% endhighlight %}

---

# Links úteis:
+ <https://en.cppreference.com/w/cpp/language/consteval>
+ <https://stackoverflow.com/questions/53347298/what-is-consteval>
+ <https://en.cppreference.com/w/cpp/algorithm>


