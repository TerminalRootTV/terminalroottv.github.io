---
layout: post
title: "Utilizando std::unordered_map e std::numeric_limits em C++"
date: 2021-08-16 09:19:13
image: '/assets/img/cppdaily/cpp-daily-episode43.jpg'
description: 'Duas ferramentas da STL de muita utilidade.'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
---

![Utilizando unordered_map e limits em C++](/assets/img/cppdaily/cpp-daily-episode43.jpg)

Nesse artigo do [cpp::daily](https://terminalroot.com.br/tags#cppdaily) de hoje vamos ver como utilizar o contêiner `std::unordered_map` e a classe de template `std::numeric_limits`.

# `std::unordered_map`
Seguindo o conceito similar de [std::map](https://terminalroot.com.br/2021/08/como-utilizar-map-em-cpp.html) que vimos anteriormente. `std::unordered_map` é um contêiner associado que armazena elementos formados pela combinação de um valor-chave e um valor mapeado. 

Algumas diferenças entre `std::map` e `std::unordered_map`
+ `std::map` entrega os dados de forma crescente, já `std::unordered_map` não há ordem;
+ `std::map` é mais utilizado para dados distantes na memória, já `std::unordered_map` para dados mais próximos;
+ `std::map` mais utilizado para tipos numéricos, já `std::unordered_map` para strings, por exemplo;
+ na maioria dos casos `std::unordered_map` é mais lento que `std::map`, mas não em todos.

![unordered_map vs map](/assets/img/cppdaily/map-vs-unordered_map.png)

A seguir vamos ver um exemplo básico de uso de `std::unordered_map`


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
#include <unordered_map>

int main(){
  std::unordered_map<int, int> umap;

  umap[11] = 2;
  umap[17] = 12;
  umap[8] = 4;

  for( auto i : umap ){
    std::cout << "Índice: " << i.first << " | Valor: " << i.second << '\n';
  }

  return 0;
}
{% endhighlight %}
A saída será:
{% highlight bash %}
Índice: 8  | Valor: 4
Índice: 17 | Valor: 12
Índice: 11 | Valor: 2
{% endhighlight %}

Perceba que os índices NÃO FORAM exibidos de forma crescente(a menos que adicionássemos na ordem, mas ainda assim seria decrescente), se alterarmos para `std::map` os índices aparecerão de forma crescente(independentemente da ordem que fossem adicionados): **8 11 17** . Uma das causas disso também está ferente ao cálculo feito para resgatar os dados da memória, o `std::unordered_map` usa **Hash Table** enquanto o `std::map` utiliza **BST** , para mais detalhes dessas implementações veja as referências ao final desse artigo.

---

# `std::numeric_limits`
O `std::numeric_limits` Fornece informações sobre as propriedades dos tipos aritméticos (integrais ou de ponto flutuante) na plataforma específica para a qual a biblioteca é compilada com uma forma padronizada de consultar várias propriedades de tipos aritméticos (por exemplo, o maior valor possível para o tipo `int` é `std::numeric_limits<int>::max() )` e entre outras funções.

O fato da compilação poder diferir de acordo com a plataforma e arquitetura, talvez o `int`, `double`, `float`, `long int`, ... que você esperava para o usuário não será atendido e poderá gerar problemas no seu sofware, logo, você pode criar condições para diversas plataformas e arquiteturas possíveis.

Vamos ver esse código de exemplo que mostra a saída, ao final veremos o resultado que foi compilado em um [Gentoo](https://terminalroot.com.br/tags#gentoo) [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/tags#linux) 64-bit.

{% highlight cpp %}
#include <iostream>
#include <limits>

int main(){
  std::cout << "Meu sistema suporta o máximo de 'int' de " << std::numeric_limits<int>::digits << " de dígitos." << '\n';
  std::cout << "O número máximo de 'int' é " << std::numeric_limits<int>::max() << '\n';
  std::cout << "-----------------------------------------" << '\n';

  std::cout << "Meu sistema suporta o máximo de 'float' de " << std::numeric_limits<float>::digits << " de dígitos." << '\n';
  std::cout << "O número máximo de 'float' é " << std::numeric_limits<float>::max() << '\n';
  std::cout << "-----------------------------------------" << '\n';


  std::cout << "Meu sistema suporta o máximo de 'double' de " << std::numeric_limits<double>::digits << " de dígitos." << '\n';
  std::cout << "O número máximo de 'double' é " << std::numeric_limits<double>::max() << '\n';
  std::cout << "-----------------------------------------" << '\n';


  std::cout << "Meu sistema suporta o máximo de 'long int' de " << std::numeric_limits<long int>::digits << " de dígitos." << '\n';
  std::cout << "O número máximo de 'long int' é " << std::numeric_limits<long int>::max() << '\n';
  std::cout << "-----------------------------------------" << '\n';


  return 0;
}
{% endhighlight %}

No meu caso a saída foi:
{% highlight bash %}
Meu sistema suporta o máximo de 'int' de 31 de dígitos.
O número máximo de 'int' é 2147483647
-----------------------------------------
Meu sistema suporta o máximo de 'float' de 24 de dígitos.
O número máximo de 'float' é 3.40282e+38
-----------------------------------------
Meu sistema suporta o máximo de 'double' de 53 de dígitos.
O número máximo de 'double' é 1.79769e+308
-----------------------------------------
Meu sistema suporta o máximo de 'long int' de 63 de dígitos.
O número máximo de 'long int' é 9223372036854775807
-----------------------------------------
{% endhighlight %}

Pode e deve ser útil para muitos casos!

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

# Referências
+ <https://en.cppreference.com/w/cpp/container/unordered_map>
+ <https://www.cplusplus.com/reference/unordered_map/unordered_map/>
+ <https://en.cppreference.com/w/cpp/types/numeric_limits>
+ <http://www.cplusplus.com/reference/limits/numeric_limits/>

<!--
- <https://www.geeksforgeeks.org/map-vs-unordered_map-c/>
- <https://www.geeksforgeeks.org/unordered_map-in-cpp-stl/>
-->
