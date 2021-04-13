---
layout: post
title: "cpp::daily - Adição e Concatenação dinâmica."
date: 2021-04-13 10:19:04
image: '/assets/img/cppdaily/cpp-daily-episode7.jpg'
description: 'std::plus e std::transform .'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
---

![cpp::daily std::plus std::transform](/assets/img/cppdaily/cpp-daily-episode7.jpg)

# `std::plus`
> `std::plus<informar o tipo ou nada>`
É um objeto Function para realizar a adição. A classe de objeto cuja chamada retorna o resultado da adição de seus dois argumentos (conforme retornado pelo operador +). 

+ Exemplo 1
> Somar x + y

{% highlight cpp %}
#include <iostream>

int main(){
  int x = 3, y = 6;
  std::cout << std::plus<int>{}( x, y ) << '\n'; // 9
  return 0;
}
{% endhighlight %}

---

+ Exemplo 2
> Concatenar duas strings

{% highlight cpp %}
std::string ola = "Olá, ", mundo = "Mundo!";
std::cout << std::plus<std::string>{}( ola, mundo ) << '\n'; // Olá, Mundo!
{% endhighlight %}

---

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>



+ Exemplo 3
> Concatenar tipos diferentes. Perceba que nesse caso não informamos o tipos para ele.

{% highlight cpp %}
std::string ter = "Terminal ";
char * roo = "Root";
std::cout << std::plus<>{}( ter, roo ) << '\n'; // Terminal Root
{% endhighlight %}

Ahhh! Mas serve só pra somar ou concatenar? Não, ele é utilizado quando você precisa obter resultados dinâmicos e geralmente em conjunto com o `std::transform`.

---

# `std::transform`
> `std::transform( input1, ultimo_input1, input2, operacao );`

Aplica a função dada a um intervalo e armazena o resultado em outro intervalo, mantendo a ordem dos elementos originais e começando do primeiro.

Suponhamos que você precisa somar todos os elementos do array1 com o array2, através da maneira genérica você faria:
{% highlight cpp %}
int array1[] {1, 2, 3},
    array2[] {4, 5, 6},
    total_elem = sizeof(array1) / sizeof(array1[0]),
    x[ total_elem ];

for (int i = 0; i < total_elem; i++) {
x[i] = array1[i] + array2[i];
}

for( auto y : x ){
  std::cout << y << ' ';
} // 5 7 9

std::cout << '\n';
{% endhighlight %}

Agora otimizando seu código com `std::transform` ficaria:
> O `std::plus` como estamos dentro do `std::transform` não devemos informar o operado: `{}`
{% highlight cpp %}
#include <iostream>
#include <algorithm> // para std::transform

int main(){
  int array1[] {1, 2, 3},
      array2[] {4, 5, 6},
      total_elem = sizeof(array1) / sizeof(array1[0]),
      x[ total_elem ];

  for (int i = 0; i < total_elem; i++) {
  x[i] = array1[i] + array2[i]; 
  } 

  std::transform( array1, array1 + total_elem, array2, x, std::plus<int>() );

  for( auto y : x ){
    std::cout << y << ' ';
  } // 5 7 9

  std::cout << '\n';
  return 0;
}
{% endhighlight %}

Like a Boss!


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



