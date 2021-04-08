---
layout: post
title: "cpp::daily - Pare de usar std::endl"
date: 2021-04-08 11:09:09
image: '/assets/img/cppdaily/cpp-daily-episode4.jpg'
description: 'Episódio 004: Ganhando um pouco mais de desempenho!'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
---

![cpp::daily std::endl](/assets/img/cppdaily/cpp-daily-episode4.jpg)

> Não existe um único procedimento para obter mais desempenho. Desempenho é um pouco de cada um dos detalhes!

Geralmente quando você usa um [IDE](https://terminalroot.com.br/2020/08/anjuta-o-melhor-ide-para-c-com-gtkmm.html) eles costumam autocompletar seu `std::cout` com `std::endl` e isso não é uma boa ideia!

Usar `std::endl` pode ineficiente, pois na verdade ele faz duas tarefas: 
+ **1º** move o cursor para a próxima linha: `'\n'`;
+ **2º** e "esvazia" a saída: `std::flush`.

Ou seja, ao usar `std::endl` equivale a usar: `'\n' << std::flush`.

Ao escrever texto para o console usando `std::cout` geralmente limpa a saída de qualquer maneira (e se isso não acontecer, geralmente não importa), então ter `std::endl flush` raramente é importante.

Por causa disso, o uso do caractere `'\n'` é normalmente preferível. O caractere `'\n'` move o cursor para a próxima linha, mas não faz a descarga redundante, por isso tem um desempenho melhor. O caractere `'\n'` também tende a ser mais fácil de ler, pois é mais curto e pode ser incorporado ao texto existente.

O `std::endl` é tecnicamente desnecessário, uma vez que o programa termina imediatamente depois.

> O `std::endl` pode ser útil somente quando: primeiro, ajuda a indicar que a linha de saída é um "pensamento completo". Em segundo lugar, se mais tarde quisermos adicionar instruções de saída, não temos que modificar o código existente. Podemos apenas adicioná-los. Mas na maioria "esmagadora" dos casos você não precisará utilizá-lo.

Vamos analisar o tempo de execução do programa abaixo usando o `std::endl` e depois somente o `\n`:
> **Para isso vamos utilizar o comando** `time` **para nos informar o tempo de execução**

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## 1º Usando `std::endl`

{% highlight cpp %}
#include <iostream>
#include <fstream>

void writeln( std::ostream & os, const std::string & str ){
  os << str << std::endl; // USANDO std::endl
}

int main( int argc, char ** argv ){
  std::ofstream outfile( "output.txt", std::ios_base::trunc );
  for (int i = 0; i < 1000000; ++i ) {
   writeln( outfile, "Hello World!" ); 
  }
  std::cout << "Ok" << '\n' << std::flush;
  return 0;
}
{% endhighlight %}

Tempo de execução segundo o comando `time`:
{% highlight bash %}
real	0m3,512s
user	0m0,752s
sys	0m2,749s
{% endhighlight %}

## 2º O mesmo programa utilizando `'\n'`
{% highlight cpp %}
#include <iostream>
#include <fstream>

void writeln( std::ostream & os, const std::string & str ){
  os << str << '\n'; // USANDO \n
}

int main( int argc, char ** argv ){
  std::ofstream outfile( "output.txt", std::ios_base::trunc );
  for (int i = 0; i < 1000000; ++i ) {
   writeln( outfile, "Hello World!" ); 
  }
  std::cout << "Ok" << '\n' << std::flush;
  return 0;
}
{% endhighlight %}

Tempo de execução segundo o comando `time`:
{% highlight bash %}
real	0m0,141s
user	0m0,115s
sys	0m0,023s
{% endhighlight %}

Ou seja, tivemos um ganho de **3 segundos** a cada 1 milhão de ciclos, geralmente quando um programa fica aberto ele faz muito mais ciclos do que isso!

---

Caso deseje saber mais sobre o comando `time` use: `man time`!
> **DICA DE VÍDEO**: Esse vídeo mostra desempenho de linguagens de programação verificadas com o comando `time`:
## [Testei o Desempenho de 10 Linguagens de Programação com Ranking](https://www.youtube.com/watch?v=spLIBqiv2Og)

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

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


## Links Úteis
+ <https://en.cppreference.com/w/cpp/io/manip/endl>
+ <https://www.youtube.com/watch?v=GMqQOEZYVJQ>
