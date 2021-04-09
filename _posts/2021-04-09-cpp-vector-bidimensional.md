---
layout: post
title: "cpp::daily Vectores bidimensionais"
date: 2021-04-09 13:11:58
image: '/assets/img/cppdaily/cpp-daily-episode5.jpg'
description: 'Episódio 5 - Vector de vectores .'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
---

![cpp::daily Vectores bidimensionais](/assets/img/cppdaily/cpp-daily-episode5.jpg)

Sabemos que existe arrays bidimensionais, mas também existe os vectores bidimensionais e é sobre ele que iremos falar sobre esse [cpp::daily](https://terminalroot.com.br/tags#cppdaily) de hoje.

Vector de vectores é um vetor bidimensional com um número variável de linhas, onde cada linha é um vetor. Cada índice de vetor armazena um vetor que pode ser percorrido e acessado usando iteradores. É semelhante a uma matriz de vetores, mas com **propriedades dinâmicas**.

Futuramente iremos ter conteúdo sobre bibliotecas que fazem uso de conceitos avançados de *Matrizes e Determinantes* da Matemática que geralmente são muito utilizadas para mapear imagens, então vamos ver como que escrevemos um vector bidimensional agora.

Quando você deseja criar um array multidimensional você usa assim, por exemplo:
{% highlight cpp %}
int array[3][5] = {  { 11, 2, 9, 27, 89 },
                     { 20, 13, 52 },
                     { 8, 4, 79, 4 }
                  };
{% endhighlight %}
Logo, se você quiser imprimir o número **52**, seria: `std::cout << array[1][2]` .

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


Os vectores bidimensionais funciona quase da mesma forma só que o desempenho é superior. O mesmo código acima usando vectores, seria:
> `#include <vector>`

{% highlight cpp %}
std::vector<std::vector<int>> vec {  { 11, 2, 9, 27, 89 },
                                      { 20, 13, 52 },
                                      { 8, 4, 79, 4 }
                                  };
{% endhighlight %}

Isso é um vector bidimensional, então se você quiser imprimir também o número **52**, seria:
{% highlight cpp %}
std::cout << vec[1][2] << '\n';
{% endhighlight %}

Se você quiser imprimir todos os valores desse vector pode criar um loop aninhado, exemplo:
{% highlight cpp %}
for ( int i = 0; i < vec.size(); ++i ) {
 for (int j = 0;  j < vec[i].size(); ++j) {
   std::cout << vec[i][j] << ' ';
 }
 std::cout << '\n';
}
{% endhighlight %}
A saída será:
{% highlight bash %}
11 2 9 27 89 
20 13 52 
8 4 79 4 
{% endhighlight %}

Exibindo cada posição dos elementos:
{% highlight cpp %}
  for ( int i = 0; i < vec.size(); ++i ) {
    for (int j = 0;  j < vec[i].size(); ++j) {
      std::cout << "vec[" << i << "][" << j << "]: " << vec[i][j];
      if( j != 3 ){
        std::cout << ", ";
      }
    }
    std::cout << '\n';
  }
{% endhighlight %}

E se você quiser adicionar mais uma coordenada para esse vector? Basta usar o `push_back()`, exemplo:
> Antes da impressão dos elementos pelo loop `for`.

{% highlight cpp %}
vec.push_back( { 22, 33, 44 } );
{% endhighlight %}

E se quiser remover a última adicionada ou não, basta usar o `pop_back()`:
{% highlight cpp %}
vec.pop_back();
{% endhighlight %}

Código final:

{% highlight cpp %}
#include <iostream>
#include <vector>

int main( int argc, char ** argv ){
  std::vector<std::vector<int>> vec{  { 11, 2, 9, 27, 89 },
    { 20, 13, 52 },
    { 8, 4, 79, 4 }
  };

  vec.push_back( { 22, 33, 44 } );
  vec.pop_back();

  for ( int i = 0; i < vec.size(); ++i ) {
    for (int j = 0;  j < vec[i].size(); ++j) {
      std::cout << "vec[" << i << "][" << j << "]: " << vec[i][j];
      if( j != 3 ){
        std::cout << ", ";
      }
    }
    std::cout << '\n';
  }

  return 0;
}
{% endhighlight %}

Simple, né?!

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



