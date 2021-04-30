---
layout: post
title: "cpp::daily - std::set, std::multiset e std::move"
date: 2021-04-30 11:10:12
image: '/assets/img/cppdaily/cpp-daily-episode19.jpg'
description: 'Episódio 019 .'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cppdaily
---

![cpp-daily-std-set-multiset-move](/assets/img/cppdaily/cpp-daily-episode19.jpg)

# `std::set`
É um tipo de contêiner associativo em que cada elemento deve ser único. O valor do elemento não pode ser modificado depois de adicionado ao conjunto, embora seja possível remover e adicionar o valor modificado desse elemento.

Exemplo:
{% highlight cpp %}
#include <iostream>
#include <set>

int main(){
  std::set<int> s;

  // adicionando elementos ao set
  s.insert( 11 );
  s.insert( 13 );
  s.insert( 17 );
  s.insert( 8 );

  // Imprime todos elementos do set
  // Vai imprimir do maior para o menor por padrão
  for( auto z : s ){
    std::cout << z << ' ';
  }
  std::cout << '\n';

  // remove elementos do set
  s.erase( 8 );
  s.erase( 13 );

  // Imprime todos elementos do set após remoção de alguns
  for( auto z : s ){
    std::cout << z << ' ';
  }

  std::cout << '\n';
  return 0;
}
{% endhighlight %}

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

# `std::multiset`
É similar ao `std::set`, mas armazena elementos duplicados, exemplo:
> Com `std::set` se duplicarmos os números assim:
{% highlight cpp %}
#include <iostream>
#include <set>

int main(){
  std::set<int> s;

  s.insert( 11 );
  s.insert( 13 );
  s.insert( 17 );
  s.insert( 8 );
  s.insert( 11 );
  s.insert( 13 );
  s.insert( 17 );
  s.insert( 8 );


  for( auto z : s ){
    std::cout << z << ' ';
  }
  std::cout << '\n';

  return 0;
}
{% endhighlight %}
> A saída será: `8 11 13 17` , ou seja, não sairá duplicada.

Mas se usarmos `std::multiset`, assim:
{% highlight cpp %}
#include <iostream>
#include <set>

int main(){
  std::multiset<int> m;

  m.insert( 11 );
  m.insert( 13 );
  m.insert( 17 );
  m.insert( 8 );
  m.insert( 11 );
  m.insert( 13 );
  m.insert( 17 );
  m.insert( 8 );


  for( auto z : m ){
    std::cout << z << ' ';
  }
  std::cout << '\n';

  return 0;
}
{% endhighlight %}
> A saída será: `8 8 11 11 13 13 17 17`

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


# `std::move`
Para entender `std::move` vamos lembrar daquele **cpp::daily** que [trocamos os valores das variáveis](https://terminalroot.com.br/2021/04/std-swap-std-greater-std-sort.html) com [std::swap](https://terminalroot.com.br/2021/04/std-swap-std-greater-std-sort.html) .

Na verdade aquilo foi possível usando uma variável temporária, então aquilo teve cópia na memória do valor. Já com `std::move` a troca é realmente feita sem fazer cópia, exemplo baseado naquele:
{% highlight cpp %}
T tmp(std::move(a));
a = std::move(b);   
b = std::move(tmp);
{% endhighlight %}

Isso tem um melhor desempenho que aquele exemplo.

---

Por hoje é só, são pequenas doses diárias que farão sempre nos manter antenado com o [C++](https://terminalroot.com.br/cpp/) !

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


