---
layout: post
title: "Exemplos de uso de algumas funções da biblioteca algorithm em C++"
date: 2021-07-07 13:57:04
image: '/assets/img/cppdaily/algorithm.png'
description: 'Ela possui uma variedade de propósitos como por exemplo: pesquisa, classificação, contagem e manipulação de dados.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cppdaily
- cpp
---

![Exemplos de uso de algumas funções da biblioteca algorithm em C++](/assets/img/cppdaily/algorithm.png)

Na Biblioteca Padrão do [C++](https://terminalroot.com.br/cpp) , algoritmos são componentes que executam operações algorítmicas em contêineres e outras sequências.

O padrão [C++](https://terminalroot.com.br/cpp) fornece alguns algoritmos padrão coletados no cabeçalho padrão: `<algorithm>`. Vários algoritmos também estão no cabeçalho: `<numeric>`. Todos os algoritmos estão no namespace `std`.

São quase 100 funções disponíveis entre elas há essa lista:

<div class="wrapper">
 <details>
  <summary>Clique aqui para ver a lista</summary>

1. `accumulate`
1. `adjacent_difference`
1. `adjacent_find`
1. `all_of`
1. `any_of`
1. `binary_search`
1. `clamp`
1. `copy`
1. `copy_backward`
1. `copy_if`
1. `copy_n`
1. `count`
1. `count_if`
1. `equal`
1. `equal_range`
1. `fill`
1. `fill_n`
1. `find`
1. `find_first_of`
1. `find_if`
1. `find_if_not`
1. `for_each`
1. `for_each_n`
1. `generate`
1. `includes`
1. `iota`
1. `is_heap`
1. `is_permutation`
1. `is_sorted`
1. `iter_swap`
1. `lexicographical_compare`
1. `linear_search`
1. `lower_bound`
1. `make_heap`
1. `max`
1. `max_element`
1. `merge`
1. `min`
1. `min_element`
1. `minimax_element`
1. `minmax`
1. `minmax_element`
1. `mismatch`
1. `move`
1. `next_permutation`
1. `none_of`
1. `nth_element`
1. `partition`
1. `pop_heap`
1. `prev_permutation`
1. `push_heap`
1. `random_shuffle`
1. `remove`
1. `remove_copy`
1. `remove_copy_if`
1. `remove_if`
1. `replace`
1. `replace_copy`
1. `replace_copy_if`
1. `replace_if`
1. `reverse`
1. `reverse_copy`
1. `rotate`
1. `search`
1. `search_n`
1. `set_difference`
1. `set_intersection`
1. `set_union`
1. `shuffle`
1. `sort`
1. `stable_sort`
1. `swap`
1. `transform`
1. `transform_reduce`
1. `unique`
1. `upper_bound`

 </details>
</div>

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Alguns exemplos de uso
### `none_of`
Esta função opera em toda a gama de elementos do array e verifica se há uma determinada propriedade em cada elemento e retorna true quando nenhum elemento no intervalo satisfaz a propriedade especificada, caso contrário, retorna false.

{% highlight cpp %}
#include <vector> 
#include <algorithm> 
#include <iostream> 

int main() {
    std::vector<int> v {1, 3, 5, 7, 9, 11, 13, 15, 17, 19};
	
    if (std::none_of(v.begin(), v.end(), [](int i){ return i % 2 == 0; })){ 
        std::cout << "Não há nenhum número par nesse vector.\n"; 
    }else{
        std::cout << "Nesse vetor há pelo menos 1 número PAR.\n";
    }

    return 0;
}
{% endhighlight %}

---

### `remove_if`
Remove os elementos do intervalo (primeiro, último) que satisfaçam uma condição e retorne um novo iterador passado para o novo final do intervalo.

{% highlight cpp %}
#include <vector> 
#include <algorithm> 
#include <iostream> 

int main() {
    auto isOdd = [](int i) {
        return (( i % 2 ) == 1);
    };

    std::vector<int> v {1, 2, 3, 4, 5};

    // Remove todos os elementos que é verdadeiro de acordo com isOdd
    auto newEndIt = std::remove_if(v.begin(), v.end(), isOdd);
    
    // Limpa os elementos
    v.erase(newEndIt, v.end());

    // v agora é: 2 e 4
    for (auto value : v) { 
        std::cout << value << " "; 
    }
    std::cout << '\n';

    return 0;
}
{% endhighlight %}

---

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


### `random_shuffle`
Ele reorganiza aleatoriamente os elementos no intervalo [primeiro, último]. A função troca o valor de cada elemento por algum outro elemento escolhido aleatoriamente. Quando fornecida, a função determina qual elemento é selecionado em cada caso. Caso contrário, a função usa alguma fonte não especificada de aleatoriedade.

{% highlight cpp %}
#include <iostream> 
#include <vector> 
#include <algorithm> 
#include <ctime>

int myrandom (int);

int main() {

  std::srand(unsigned(time(0)));
  std::vector<int> mylist;

  for (int j = 1; j < 10; ++j){
    mylist.push_back(j);
  }

  std::random_shuffle(mylist.begin(), mylist.end());

  std::random_shuffle(mylist.begin(), mylist.end(), myrandom);

  std::cout << "mylist contains:";
  for (auto i = mylist.begin(); i != mylist.end(); ++i){
    std::cout << ' ' << *i;
  }

  std::cout << "\n";

  return 0;
} 

int myrandom (int i) {
  return std::rand() % i;
}
{% endhighlight %}

---

Algumas outras funções dessa biblioteca já falamos no [cpp::daily](https://terminalroot.com.br/tags#cppdaily) e mais informações você pode obter [aqui](https://en.cppreference.com/w/cpp/algorithm). <!-- https://github.com/Bhupesh-V/30-seconds-of-cpp/ -->

---

Por hoje é só!

## Acompanhe o [cpp::daily](https://terminalroot.com.br/tags#cppdaily)

# Deseja aprender [C++](https://terminalroot.com.br/cpp/) e criar seus programas Gráficos e para Terminal com portabilidade para Linux e Windows?
Então se inscreva nos nossos [Cursos de C++ Moderno](https://terminalroot.com.br/cpp/) . Você aprender criar:
- [Games](https://terminalroot.com.br/tags#games)
- [Ncurses](https://terminalroot.com.br/2021/02/crie-programas-graficos-no-terminal-com-cpp-e-ncurses.html)
- Interface Gráfica: [GTK+](https://terminalroot.com.br/2020/08/anjuta-o-melhor-ide-para-c-com-gtkmm.html) e [Qt](https://terminalroot.com.br/2021/02/gerencie-suas-contas-financeiras-pessoais-com-terminal-finances.html)
- Acesso à Banco de Dados([MySQL](https://terminalroot.com.br/mysql/) e SQLite) via [C++](https://terminalroot.com.br/cpp/)
- Padronização
- E muito mais!

Acesse o endereço:
# <https://terminalroot.com.br/cpp/> e saiba mais!

