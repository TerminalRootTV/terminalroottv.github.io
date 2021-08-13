---
layout: post
title: "Diferenças entre std::list e std::vector na STL do C++"
date: 2021-08-12 08:57:30
image: '/assets/img/cpp/list/list-vs-vector.jpg'
description: 'Uso de ambos dependerá da sua aplicação, mas saber como utilizar é tão importante quanto como.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![Diferenças entre list e vector na STL do C++](/assets/img/cpp/list/list-vs-vector.jpg)

A forma como os dados são guardados na memória influencia muito na escolha de qual ferramenta você deve usar. Lógico que eu, assim como a maioria, sempre prefere o [std::vector](https://terminalroot.com.br/2021/04/cpp-vector-bidimensional.html) pelo fato de ser o mais rápido para a maioria dos casos, sim "..para a maioria dos casos...", mas não para todos.

![std::list vs std::vector](/assets/img/cpp/list/list-vector-cpp-1.jpg)

É a partir daí que entram outras ferramentas como por exemplo a `std::list`. Nesse [cpp::daily](https://terminalroot.com.br/tags#cppdaily) de hoje vamos ver como utilizar o `std::list` e um mesmo exemplo usando tanto o `std::list` como o `std::vector`.

# `std::list`
As listas são recipientes de sequência que permitem a alocação de memória não contígua( quando os dados não estão tão próximos um dos outros na memóri ). Em comparação com o `std::vector`, o `std::list` tem um percurso lento, mas uma vez que uma posição foi encontrada, a inserção e exclusão são rápidas. Normalmente, quando dizemos uma lista, falamos sobre uma lista duplamente vinculada. Para implementar uma lista vinculada individualmente, usamos a lista de encaminhamento.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


![std::list](/assets/img/cpp/list/list-vector-cpp-0.jpg)

Para usar as listas precisamos incluir o cabeçalho:
{% highlight cpp %}
#include <list>
{% endhighlight %}

Uma forma de uso das listas, similar ao vector:
{% highlight cpp %}
#include <iostream>
#include <list>

int main(){
  std::list<const char*> minha_lista = {"Marcos", "Oliveira", "Terminal", "Root"};
  for( auto lista : minha_lista ){
    std::cout << lista << ' ';
  }
  std::cout << '\n';
  return 0;
}
{% endhighlight %}
> Saída: `Marcos Oliveira Terminal Root`

Até aí tudo bem, criamos uma lista com itens do tipo `const char*`, mas nem tudo são flores, há algumas diferenças cruciais quando comparada ao vector, vamos ver agora!

![Lists C++](/assets/img/cpp/list/range-rbegin-rend.jpg)

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

---

![Lists draw](/assets/img/cpp/list/list-vs-vector-cpp.jpg)

Suponha que você deseja inserir a palavra **C++**: **em um posição específica**(no centro, nesse exemplo), **no início** e **no final** do vector, seria mais ou menos assim(o mais portável possível):
> Leia os comentários para uma maior compreensão do código.

{% highlight cpp %}
#include <iostream>
#include <vector>

// Para imprimir os valores
template<typename T>
void print_content( T lista ){
  for( auto i : lista ){
    std::cout << i << ' ';
  }
  std::cout << '\n';
}

// Inserir um elemento em determinada posição
template<typename T>
void matriz_first_way( T v, const int& pos, const char* elem ){

  // alternativamente você podia substituir as duas linhas abaixo por:
  // auto it = v.insert( v.begin() + pos, elem );
  std::vector<const char*>::iterator it = v.begin() + pos;
  v.insert( it, elem ); 

  print_content( v );
}

int main(){
  std::vector<const char*> v = {"Marcos", "Oliveira", "Terminal", "Root"};
  const char* new_elem = {"C++"};

  // Na segunda posição (no centro)
  matriz_first_way( v, 2, new_elem );

  // No início
  matriz_first_way( v, 0, new_elem );

  // No final
  v.push_back( new_elem );
  print_content( v );

  return 0;
}
{% endhighlight %}
> A saída será:
{% highlight bash %}
Marcos Oliveira C++ Terminal Root
C++ Marcos Oliveira Terminal Root
Marcos Oliveira Terminal Root C++
{% endhighlight %}

Note que para escolher a posição específica usamos: `v.begin() + pos`, muito fácil e simples! Mas se fôssemos portar o vector para listas, o uso desse operador(+) de soma não seria possível!

Nossa função `matriz_first_way` deveria ser dessa forma usando `´std::list`:

{% highlight cpp %}
template<typename T>
void matriz_first_way( T lista, const int& pos, const char* elem ){
  //auto it = lista.begin();
  std::list<const char*>::iterator it = lista.begin();

  std::advance( it, pos );
  lista.insert( it, elem );
  print_content( lista );
}
{% endhighlight %}

Perceba que tivemos que "apelar" para o `std::advance` para avançar posições no nosso iterador.

Só que por outro lado não precisaríamos, necessariamente, da função `matriz_first_way` para inserir no início, bastava usar uma função não existente no vector que é a `push_front()`, logo, usando listas para inserir no início seria somente:

{% highlight cpp %}
lista.push_front( new_elem );
{% endhighlight %}

Só que se estivermos no mesmo escopo, que é nesse caso do exemplo, quando fôssemos adicionar ao final, obrigatoriamente teríamos antes que remover o elemento, caso contrário na terceira "impressão" do conteúdo ele apareceria também no início, então para imprimir no final, seria:

{% highlight cpp %}
// Isso porque usamos push_front anteriormente, senão, não precisaria
lista.remove( new_elem ); 
lista.push_back( new_elem );
print_content( lista );
{% endhighlight %}

Agora basta você analisar todo esse código usando `std::list` e compará-lo com o de lá de cima:

{% highlight cpp %}
#include <iostream>
#include <list>

// Para imprimir os valores
template<typename T>
void print_content( T lista ){
  for( auto i : lista ){
    std::cout << i << ' ';
  }
  std::cout << '\n';
}

// Inserir um elemento em determinada posição
template<typename T>
void matriz_first_way( T lista, const int& pos, const char* elem ){
  //auto it = lista.begin();
  std::list<const char*>::iterator it = lista.begin();

  std::advance( it, pos );
  lista.insert( it, elem );
  print_content( lista );
}

int main(){
  std::list<const char*> lista = {"Marcos", "Oliveira", "Terminal", "Root"};
  const char* new_elem = {"C++"};

  // Na segunda posição (no centro)
  matriz_first_way( lista, 2, new_elem );

  // No início
  lista.push_front( new_elem );
  print_content( lista );

  // No final
  lista.remove( new_elem ); // Isso porque usamos push_front anteriormente, senão, não precisaria
  lista.push_back( new_elem );
  print_content( lista );

  return 0;
}
{% endhighlight %}

Tá, legal! Mas e o desempenho? Como havia dito no início, isso vai depender da sua aplicação, a melhor forma de descobrir isso é sempre a mesma: através de testes! 😃 

Mas para início de entendimento está muito bom, para mais informações veja a [referência](https://en.cppreference.com/w/cpp/container/list) .

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


<!--
https://www.geeksforgeeks.org/list-insert-in-c-stl/
-->
