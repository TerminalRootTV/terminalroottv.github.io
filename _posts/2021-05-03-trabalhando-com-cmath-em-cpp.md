---
layout: post
title: "Trabalhando com cmath em C++"
date: 2021-05-03 10:07:14
image: '/assets/img/cppdaily/cmath.png'
description: 'Tornando os cálculos Matemáticos mais simples de obter os resultados.'
icon: 'ion:terminal-sharp'
iconname: 'cpp::daily'
tags:
- cppdaily
- cpp
---

![Trabalhando com cmath em C++](/assets/img/cppdaily/cmath.png)

A biblioteca `cmath` do [C++](https://terminalroot.com.br/cpp) é a mesma que a `math.h` do [C](https://terminalroot.com.br/tags#linguagemc) e ela oferece suporte a um grande número de funções matemáticas úteis, a lista completa de todas as funções você pode ver [aqui](https://en.cppreference.com/w/cpp/numeric/math) .

Para utilizá-las, basta incluí-la no cabeçalho: `#include <cmath>`

Nesse [cpp::daily](https://terminalroot.com.br/tags#cppdaily) de hoje vamos ver descrição e como utilizar algumas delas.

+ `abs( int )` - Informa o número absoluto:

{% highlight cpp %}
signed int x = -936;
std::cout << "valor absoluto de x: " << abs( x ) << '\n';
// valor absoluto de x: 936
{% endhighlight %}

---

+ `pow( double, double )` - É a potênciação de dois números:

{% highlight cpp %}
std::cout << "9 elevado ao quadrado é: " << pow( 9, 2 ) << '\n';
// 9 elevado ao quadrado é: 81
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

+ `sin( double * pi / 180  )` - informa o [seno](https://pt.wikipedia.org/wiki/Seno) de um ângulo;
+ `cos( double * pi / 180 )` - informa o [cosseno](https://pt.wikipedia.org/wiki/Cosseno) de um ângulo;
+ `tan( double * pi / 180 )` - informa a [tangente](https://pt.wikipedia.org/wiki/Tangente) de um ângulo; 
  - Nesse exemplo incluímos também a [iomanip](https://terminalroot.com.br/2021/05/utilizando-a-biblioteca-iomanip-cpp.html) para usar o `std::setprecision( int )`
  - Usamos também parametro via linha de comando para obtermos resultado em tempo de execução
  - Captamos o `argv[1]` como string e convertemos posteriormente em `long double` com `std::stold( std::string )`;
  - Lembrando que [PI](https://pt.wikipedia.org/wiki/Pi) é um número infinito, logo, atribuímos *13* [dígitos(algarismos) significativos](https://pt.wikipedia.org/wiki/Algarismo_significativo) para uma maior precisão do resultado, pois somente *3.14* pode haver resultados menos precisos.

{% highlight cpp %}
#include <iostream>
#include <cmath>
#include <iomanip>

int main( int argc, char ** argv ){

  if( argc <= 1 ){
    std::cerr << "Informe o angulo. Exemplo: " << argv[0] << " 35\n";
    return 1;
  }

  std::string str = argv[1];
  const long double PI = 3.1415926535897;
  long double angulo = std::stold( str );
  std::cout << "seno: " << std::setprecision( 3 ) << sin( angulo * PI / 180 ) << '\n';
  std::cout << "cosseno: " << std::setprecision( 3 ) << cos( angulo * PI / 180 ) << '\n';
  std::cout << "tangente: " << std::setprecision( 4 ) << tan( angulo * PI / 180 ) << '\n';

  return 0;
}
{% endhighlight %}
> Saída:

![Exemplo cmath](/assets/img/cppdaily/exemplo-cmath.png "Exemplo cmath")

> Para constatação dos resultados você pode usar [esse](https://www.mathepower.com/pt/sencostan.php) serviço online, basta preencher o valor do ângulo e clicar em [calcular]:

![Como calcular online e o resultado](/assets/img/cppdaily/como-calcular-e-resultado.png "Como calcular online e o resultado")

---

+ `sqrt( double )` - Informa a raiz quadrada de um número:
  - Para esse exemplo(mini programa) além de usar parametros, também utilizamos saídas coloridas para ficar mais destacada.

{% highlight cpp %}
#include <iostream>
#include <cmath>

int main( int argc, char ** argv ){

  if( argc <= 1 ){
    std::cerr << "Informe o número. Exemplo: " << argv[0] << " 35\n";
    return 1;
  }

  std::string str = argv[1];
  long double numero = std::stold( str );

  std::cout << "A raiz quadrada de \e[31;1m" << str << 
               "\e[m é: \e[33;1m" << sqrt( numero ) << "\e[m\n";

  return 0;
}
{% endhighlight %}
> Saída:

![Saída do mini programa que calcula a raiz quadrada](/assets/img/cppdaily/raiz-quadrada.png "Saída do mini programa que calcula a raiz quadrada")

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

E entre outras como:
+ `ceil( T )` - Arrendonda um número para cima: `ceil( 2.1f ); // 3` ;
+ `cbrt( T )` - Informa a raiz cúbica de um número: `cbrt( 27 ); // 3`;
+ `log( double )`  - Calcula o [logaritmo](https://pt.wikipedia.org/wiki/Logaritmo).

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

Para mais informações consulte:
+ <https://en.cppreference.com/w/cpp/numeric/math>
+ <https://www.cplusplus.com/reference/cmath/>


