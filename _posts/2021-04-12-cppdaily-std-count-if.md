---
layout: post
title: "C++ Diário - Número de Elementos em um intervalo."
date: 2021-04-12 13:04:00
image: '/assets/img/cppdaily/cpp-daily-episode6.jpg'
description: 'cpp::daily Episódio 006'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
---

![cpp::daily-std-count-if](/assets/img/cppdaily/cpp-daily-episode6.jpg)

O `std::count_if` retorna o número de elementos no intervalo [primeiro, último) atendendo a critérios específicos, ou seja, número de elementos que satisfazem a condição.
Exceções

## Sintaxe
![std::count_if sintaxe](/assets/img/cppdaily/count_if.jpg)

### Exemplo
> Saber quantos elementos no vector `vec` tem resto zero quando dividido por 2!

{% highlight cpp %}
#include <iostream>
#include <vector>
#include <algorithm>

bool resto_zero( int &i ){
  return ( i % 2 == 0 );
}

int main( int argc, char ** argv ){

  std::vector<int> vec {  11, 20, 9, 36, 88, 54, 55 };
  int pares = std::count_if( vec.begin(), vec.end(), resto_zero );
  std::cout << pares << '\n'; // 4

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


### Outro exemplo
> Quantas palavras do nosso conjunto existem na frase: *"Aquele dia estava tudo muito tranquilo ."*

{% highlight cpp %}
#include <iostream>
#include <vector>
#include <algorithm>

bool grep( const std::string &palavra ){
  const std::string frase {"Aquele dia estava tudo muito tranquilo ."};
  int pos = frase.find( palavra );
  return ( pos >= 0 );
}

int main( int argc, char ** argv ){

  std::vector<std::string> word {"muito", "nada", "legal", "dia", "tudo", "valeu"};
  int send = std::count_if( word.begin(), word.end(), grep );
  std::cout << send << '\n'; // 3 => 'muito', 'dia' e 'tudo'

  return 0;
}
{% endhighlight %}

Simples, né ?!

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

# Referência
+ <https://en.cppreference.com/w/cpp/algorithm/count>


