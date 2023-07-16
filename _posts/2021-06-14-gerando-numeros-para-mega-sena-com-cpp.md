---
layout: post
title: "Gerando números para Mega-Sena com C++"
date: 2021-06-14 13:01:05
image: '/assets/img/cppdaily/mega-sena-cpp.jpg'
description: 'Uma forma mais moderna e profissional de fazer com C++ .'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![Gerando números para Mega-Sena com C++](/assets/img/cppdaily/mega-sena-cpp.jpg)

Nesse [cpp::daily](https://terminalroot.com.br/tags#cppdaily) de hoje vamos mostrar uma forma mais moderna e profissional de fazer isso com [C++](https://terminalroot.com.br/cpp).

Nós já fizemos isso em outras situações com: [C](https://terminalroot.com.br/2012/12/gerando-numeros-para-mega-sena-em.html) e também com [Shell Script](https://terminalroot.com.br/2015/01/gerando-numeros-para-mega-sena-com.html), mas além daqueles códigos estarem defasados, vamos atualizar isso com [C++](https://terminalroot.com.br/cpp), e se você jogar e ganhar, lembre-se de me dar pelo menos 1% do seu ganho! 😃 

O processo é bem simples quando usamos as ferramentas certas e elas são:
+ [std::sort](https://terminalroot.com.br/2021/04/std-swap-std-greater-std-sort.html)
+ [std::srand](https://terminalroot.com.br/2021/06/gerando-numeros-randomicos-com-cpp.html)
+ [std::experimental/random](https://terminalroot.com.br/2021/06/gerando-numeros-randomicos-com-cpp.html)
+ [std::vector](https://terminalroot.com.br/2021/04/cpp-vector-bidimensional.html)
+ [std::find](https://terminalroot.com.br/2021/04/cppdaily-std-count-if.html)


Primeira coisa é criar os 6 números randômicos. Basta criar um `vector` vazio, fazer um loop `while` onde a condição é adicionar o número randômico gerado por `randint` na faixa de 1 à 60 que são os números máximos da Mega-Sena e nos mostrar fazendo um loop para exibir, e pode ser feito com esse código inicial:

<!-- QUADRADO -->
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
#include <ctime>
#include <experimental/random>
#include <vector>

int main(){
  std::srand(std::time(nullptr));

  std::vector<int> nums;

  // geramos os números
  while( nums.size() < 6 ){
    nums.push_back( std::experimental::randint(1,60) );
  }

  // exibimos os números
  for( auto &y : nums ){
    std::cout << y << ' ';
  }

  std::cout << '\n';
  return 0;
}
{% endhighlight %}

Mas o problema desse código é que números poderão ser repetidos e isso não é legal. Então, pra resolver isso vamos verificar se o número está no nosso `vector` e se não estiver incluímos, senão repete até não encontrar, para isso usaremos o `std::find` da biblioteca `algorithm` e agora armazenaremos o número randômico na variável `x`:

{% highlight cpp %}
#include <iostream>
#include <ctime>
#include <experimental/random>
#include <vector>
#include <algorithm>

int main(){
  std::srand(std::time(nullptr));
  int x;
  std::vector<int> nums;

  while( nums.size() < 6 ){
    x = std::experimental::randint(1,60);
    if( std::find( nums.begin(), nums.end(), x ) != nums.end() ){
      continue;
    }else{
      nums.push_back( x );
    }
  }

  for( auto &y : nums ){
    std::cout << y << ' ';
  }


  std::cout << '\n';
  return 0;
}
{% endhighlight %}

Quase perfeito, a única coisa que precisamos alterar é exibir os números em ordem crescente pra ficar mais profissa mesmo, né não?! Então vamos de [std::sort](https://terminalroot.com.br/2021/04/std-swap-std-greater-std-sort.html) → `std::sort( nums.begin(), nums.end() );` :

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

{% highlight cpp %}
#include <iostream>
#include <ctime>
#include <experimental/random>
#include <vector>
#include <algorithm>

int main(){
  std::srand(std::time(nullptr));
  int x;
  std::vector<int> nums;

  while( nums.size() < 6 ){
    x = std::experimental::randint(1,60);
    if( std::find( nums.begin(), nums.end(), x ) != nums.end() ){
      continue;
    }else{
      nums.push_back( x );
    }
  }

  std::sort( nums.begin(), nums.end() );

  for( auto &y : nums ){
    std::cout << y << ' ';
  }

  std::cout << '\n';
  return 0;
}
{% endhighlight %}

Agora sim está tudo completo, show né?! Se quiser ainda deixe a condição do `if else` como ternária pra ficar **like a boss!**.

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



