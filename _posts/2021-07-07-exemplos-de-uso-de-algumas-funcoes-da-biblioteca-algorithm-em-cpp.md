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
 <ol>
   <li><kbd>accumulate</kbd></li>
   <li><kbd>adjacent_difference</kbd></li>
   <li><kbd>adjacent_find</kbd></li>
   <li><kbd>all_of</kbd></li>
   <li><kbd>any_of</kbd></li>
   <li><kbd>binary_search</kbd></li>
   <li><kbd>clamp</kbd></li>
   <li><kbd>copy</kbd></li>
   <li><kbd>copy_backward</kbd></li>
   <li><kbd>copy_if</kbd></li>
   <li><kbd>copy_n</kbd></li>
   <li><kbd>count</kbd></li>
   <li><kbd>count_if</kbd></li>
   <li><kbd>equal</kbd></li>
   <li><kbd>equal_range</kbd></li>
   <li><kbd>fill</kbd></li>
   <li><kbd>fill_n</kbd></li>
   <li><kbd>find</kbd></li>
   <li><kbd>find_first_of</kbd></li>
   <li><kbd>find_if</kbd></li>
   <li><kbd>find_if_not</kbd></li>
   <li><kbd>for_each</kbd></li>
   <li><kbd>for_each_n</kbd></li>
   <li><kbd>generate</kbd></li>
   <li><kbd>includes</kbd></li>
   <li><kbd>iota</kbd></li>
   <li><kbd>is_heap</kbd></li>
   <li><kbd>is_permutation</kbd></li>
   <li><kbd>is_sorted</kbd></li>
   <li><kbd>iter_swap</kbd></li>
   <li><kbd>lexicographical_compare</kbd></li>
   <li><kbd>linear_search</kbd></li>
   <li><kbd>lower_bound</kbd></li>
   <li><kbd>make_heap</kbd></li>
   <li><kbd>max</kbd></li>
   <li><kbd>max_element</kbd></li>
   <li><kbd>merge</kbd></li>
   <li><kbd>min</kbd></li>
   <li><kbd>min_element</kbd></li>
   <li><kbd>minimax_element</kbd></li>
   <li><kbd>minmax</kbd></li>
   <li><kbd>minmax_element</kbd></li>
   <li><kbd>mismatch</kbd></li>
   <li><kbd>move</kbd></li>
   <li><kbd>next_permutation</kbd></li>
   <li><kbd>none_of</kbd></li>
   <li><kbd>nth_element</kbd></li>
   <li><kbd>partition</kbd></li>
   <li><kbd>pop_heap</kbd></li>
   <li><kbd>prev_permutation</kbd></li>
   <li><kbd>push_heap</kbd></li>
   <li><kbd>random_shuffle</kbd></li>
   <li><kbd>remove</kbd></li>
   <li><kbd>remove_copy</kbd></li>
   <li><kbd>remove_copy_if</kbd></li>
   <li><kbd>remove_if</kbd></li>
   <li><kbd>replace</kbd></li>
   <li><kbd>replace_copy</kbd></li>
   <li><kbd>replace_copy_if</kbd></li>
   <li><kbd>replace_if</kbd></li>
   <li><kbd>reverse</kbd></li>
   <li><kbd>reverse_copy</kbd></li>
   <li><kbd>rotate</kbd></li>
   <li><kbd>search</kbd></li>
   <li><kbd>search_n</kbd></li>
   <li><kbd>set_difference</kbd></li>
   <li><kbd>set_intersection</kbd></li>
   <li><kbd>set_union</kbd></li>
   <li><kbd>shuffle</kbd></li>
   <li><kbd>sort</kbd></li>
   <li><kbd>stable_sort</kbd></li>
   <li><kbd>swap</kbd></li>
   <li><kbd>transform</kbd></li>
   <li><kbd>transform_reduce</kbd></li>
   <li><kbd>unique</kbd></li>
   <li><kbd>upper_bound</kbd></li>
 </ol>
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

  std::cout << "mylist contém:";
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

