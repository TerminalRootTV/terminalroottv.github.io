---
layout: post
title: "C++ - Utilitários std::pair e std::tuple"
date: 2021-08-05 11:13:32
image: '/assets/img/cppdaily/cpp-daily-episode41.jpg'
description: 'Trabalhando com tipos diferentes com um único tipo com uma ferramenta já existente da STL.'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
- cpp
---

![C++ - Utilitários std::pair e std::tuple](/assets/img/cppdaily/cpp-daily-episode41.jpg)

# `std::pair` e `std::make_pair`
`std::pair` é um contêiner simples definido no cabeçalho `<utility>` que consiste em dois elementos de dados ou objetos.

O primeiro elemento é referido como `first` e o segundo elemento como `second` e a ordem é fixa `(first, second)`.

É usado para combinar dois valores que podem ser de tipos diferentes. O par fornece uma maneira de armazenar dois objetos heterogêneos como uma única unidade.

Exemplo simples de uso:
{% highlight cpp %}
#include <iostream>
#include <utility>

int main(){

  std::pair<int, const char*> par;

  par.first = 936;
  par.second = "Terminal Root";

  std::cout << "Primeiro: " << par.first << '\n';
  std::cout << "Segundo: " << par.second << '\n';
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


Podemos também iniciálizá-los com os valores que desejamos, exemplo:
{% highlight cpp %}
#include <iostream>
#include <utility>

int main(){

  std::pair<int, const char*> par( 52, "Marcos Oliveira" );

  std::cout << "Primeiro: " << par.first << '\n';
  std::cout << "Segundo: " << par.second << '\n';
  return 0;
}
{% endhighlight %}

Ainda podemos alterar/definir valores utilizando o `std::make_pair`
{% highlight cpp %}
#include <iostream>
#include <utility>

int main(){

  std::pair<int, const char*> par;

  par = std::make_pair( 43, "Valeu, meu bródi!" );

  std::cout << "Primeiro: " << par.first << '\n';
  std::cout << "Segundo: " << par.second << '\n';
  return 0;
}
{% endhighlight %}

A menos que você inicialize o `std::pair` como `auto`, não é possível modificar os valores, e também só é possível utilizar 2 valores, no entanto para isso é indicado o uso de `std::tuple` que aceita tipos diferentes e quantidades maiores.

---

# `std::tuple`
Uma tupla é um objeto que pode conter vários elementos. Os elementos podem ser de diferentes tipos de dados.

Os elementos das tuplas são inicializados como argumentos na ordem em que serão acessados.

Nesse primeiro exemplo podemos notar que:
+ precisamos incluir o cabeçalho `<tuple>`
+ não inicializamos nossa tupla `terroo`;
+ utilizamos `std::make_tuple` para definir os valores baseados nos tipos;
+ obtemos os valores utilizando `std::get<N>(terroo)`
{% highlight cpp %}
#include <iostream>
#include <tuple>

int main(){
  std::tuple<int, const char*, bool> terroo;

  terroo = std::make_tuple( 18, "É isso aê, manoo!", true );
  
  std::cout << "Primero: " << std::get<0>(terroo) << '\n';
  std::cout << "Segundo: " << std::get<1>(terroo) << '\n';
  std::cout << "Terceiro: " << std::get<2>(terroo) << '\n';
  
  return 0;
}
{% endhighlight %}
> Para esse caso o tipo `bool`, lógico, imprimirá **1**.

Você também podia declarar a tupla já inicializando os tipos:
{% highlight cpp %}
std::tuple<int, const char*, bool> terroo( 18, "É isso aê, manoo!", true );
{% endhighlight %}

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


Para obter o tamanho(número de elementos) da tupla, basta usar: `tuple_size`:
{% highlight cpp %}
std::cout << "O tamanho da tupla 'terroo' é: " << 
            std::tuple_size<decltype(terroo)>::value << '\n';
{% endhighlight %}

É possível alterar o valor de um determinado elemento da tupla, exemplo: alterar o segundo elemento que é um `const char*`:
{% highlight cpp %}
#include <iostream>
#include <tuple>

int main(){
  std::tuple<int, const char*, bool> terroo( 18, "É isso aê, manoo!", true );

  std::cout << "Segundo(ANTES): " << std::get<1>(terroo) << '\n';
  std::get<1>(terroo) = "Agora eu mudei hehe";
  std::cout << "Segundo(DEPOIS): " << std::get<1>(terroo) << '\n';

  return 0;
}
{% endhighlight %}

Além de ser possível também concatenar tuplas com `std::tuple_cat(tupla1, tupla2)` entre outras funções, para isso recomendo ver o [C++ Reference](https://en.cppreference.com/w/cpp/utility/tuple).

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

