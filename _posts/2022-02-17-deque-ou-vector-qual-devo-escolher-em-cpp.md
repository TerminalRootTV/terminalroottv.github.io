---
layout: post
title: "Deque ou Vector, qual devo escolher em C++ ?"
date: 2022-02-17 11:34:06
image: '/assets/img/cpp/deque.jpg'
description: 'Muitas vezes um pequeno detalhe faz muita diferença.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

# Deque `std::deque`

Deque (geralmente pronunciado como "deck") é um acrônimo irregular: **D**ouble **e**nded **que**ue, em português significa: **Fila dupla**, e é justamente isso que ele faz. 

As filas de extremidade dupla são contêineres de sequência com tamanhos dinâmicos que podem ser expandidos ou contraídos em ambas as extremidades (na frente ou no verso), diferentemente do [Vector](https://terminalroot.com.br/2021/04/cpp-vector-bidimensional.html) que possui fila única, no `std::deque` você pode inserir dados tanto no final, com `push_back()` igual nos vetores, quanto no início: `front_back()` função-membro inexistente em vetores.

---

# Exemplo de uso do `std::deque`
Suponhamos que você possua uma classe que armazena diferentes tipos de dados e você deseja incluir os elementos na ordem que lhe seja apresentadas, e o primeiro à entrar deve ser o primeiro à sair, com deque você pode usar o `push_back` e em seguida o `push_front`:

{% highlight cpp %}
#include <iostream>
#include <deque>

class Content {
  public:
    int xyz;
    std::string something;
    double price;
    Content(int x, const std::string &s, double p)
            : xyz(x), something(s), price(p) { 
    }
};

int main( int argc , char **argv ){
  Content c1(42, "Terminal Root", 9.36);
  Content c2(24, "Marcos Oliveira", 8.04);

  std::deque<Content> con;

  con.push_back(c1);
  con.push_front(c2);

  for( auto i : con){
    std::cout << i.xyz << ' ';
    std::cout << i.something << ' ';
    std::cout << i.price << '\n';
  }

  return 0;
}
{% endhighlight %}
> Saída:
{% highlight sh %}
24 Marcos Oliveira 8.04
42 Terminal Root 9.36
{% endhighlight %}


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

Se substituíssemos o `deque` pelo `vector` precisaríamos inverter a ordem para que o resultado pudesse ser o esperado, pois só teríamos o `push_back`:

> Mesmo código, mas utilizando `std::vector`.
{% highlight cpp %}
#include <iostream>
#include <vector>

class Content {
  public:
    int xyz;
    std::string something;
    double price;
    Content(int x, const std::string &s, double p)
            : xyz(x), something(s), price(p) { 
    }
};

int main( int argc , char **argv ){
  Content c1(42, "Terminal Root", 9.36);
  Content c2(24, "Marcos Oliveira", 8.04);

  std::vector<Content> con;

  con.push_back(c2); // Invertemos a ordem, primeiro adicionamos o segundo para podermos obter o mesmo resultado
  con.push_back(c1);

  for( auto i : con){
    std::cout << i.xyz << ' ';
    std::cout << i.something << ' ';
    std::cout << i.price << '\n';
  }

  return 0;
}
{% endhighlight %}

# Diferenças entre Deque e Vector
+ **Vector** fornece inserção e exclusão apenas no meio e no final. Considerando que, deque fornece operações para inserção na frente, meio e fim. Ou seja, além das APIs `push_back()` e `pop_back()` assim como vector, o deque também possui a API `push_front()` e `pop_front()` para adicionar e deletar elementos do front.
+ **Vector** fornece bom desempenho para inserção e exclusão apenas no final e desempenho ruim para inserção e exclusão no meio.
+ Deque fornece o mesmo tipo de desempenho como no **Vector** para inserção e exclusão no final e no meio. Além disso, o deque oferece bom desempenho para inserção e exclusão na frente também.
+ O armazenamento de um **Deque** é automaticamente expandido e contraído conforme necessário. A expansão de um **Deque** é mais barata do que a expansão de um **Vector** porque não envolve a cópia dos elementos existentes para um novo local de memória.

---

# Qual você deve escolher ?
+ Deve-se escolher `std::deque` quando deseja adicionar ou excluir de ambas as extremidades.
+ Deve-se escolher o `std::vetor` se a inserção ou exclusões forem necessárias principalmente no final.

# Onde `deque` tem suas maiores vantagens:
+ Ao aumentar ou diminuir a coleção de qualquer extremidade
+ Quando você está lidando com tamanhos de coleção muito grandes.

# Onde `deque` tem suas maiores desvantagens:
+ Algumas operações podem custar mais caro que o `std::vector`, dependendo do tipo de solicitação de dados que seu programa venha fazer com mais frequência.
+ Exportar os dados para a [Linguagem C](https://terminalroot.com.br/tags#linguagemc) usando [extern](https://terminalroot.com.br/2021/04/significado-de-extern-em-cpp.html) possui incompatibilidade.

Quer aprender C++? Então, acesse: <https://terminalroot.com.br/cpp> . 

---

# Links Úteis
+ <https://en.cppreference.com/w/cpp/container/deque>
+ <https://www.cplusplus.com/reference/deque/deque/>

