---
layout: post
title: "cpp::daily #Episódio002 - Ligações e Marcadores de Posição"
date: 2021-04-06 09:04:23
image: '/assets/img/cppdaily/cpp-daily-episode1.jpg'
description: 'std::bind e std::placeholders, 10 exemplos!'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cppdaily
- cpp
---

![std::bind e std::placeholders](/assets/img/cppdaily/cpp-daily-episode1.jpg)

Muitas vezes precisamos implementar uma função sob demanda, ou seja, passar parâmetros de acordo com a necessidade do nosso aplicativo. E o `std::placeholders` servem para isso.

O **namespace** `std::placeholders` trabalha juntamente com a função `std::bind` e precisamos incluir o cabeçalho `<funcional>` para poder utilizarmos. Eles contém os objetos de placeholder [`_1,..._N`] onde **N** é um número máximo definido pela implementação.

O template de função `std::bind` retorna um objeto de função com base em *fn*, mas com seus argumentos vinculados a *args*.

Quando usado como um argumento em uma expressão `std::bind`, os objetos de espaço reservado são armazenados no **objeto de função** gerado e quando esse objeto de função é chamado com argumentos *não acoplados*, cada espaço reservado `_N` é substituído pelo *enésimo* argumento não acoplado correspondente.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Características das Ligações e marcadores de posição
+ Cada espaço reservado é declarado como : `extern /* não especificada */ _1; // até o c++17`;
+ As implementações são estimuladas a declarar os marcadores de posição como: `inline constexpr /* não especificada */ _1;`
+ Embora os declare por: `extern /* não especificada */ _1;` , ainda é permitido pelo padrão;
+ Os tipos de objetos de espaço reservado são `DefaultConstructible` e `CopyConstructible`
+ Seus construtores de cópia/movimentação padrão não lançam exceções;
+ Para qualquer espaço reservado `_N`, o tipo `std::is_placeholder<decltype(_N)>`;
+ É definido e é derivado de `std::integral_constant<int, N>`.

# Exemplos
### 01. Usando o básico com parâmetro `_1`
Dada a função `soma_sub(int, int, int)` que retorna a soma e subtração dos parâmetros, respectivamente, se quisermos que um parâmetro seja dinâmico:
> Terceiro parâmetro dinâmico

{% highlight cpp %}
#include <iostream>
#include <functional> // para std::placeholders e std::bind

using namespace std::placeholders;

int soma_sub( int x, int y, int z ){
  return x + y - z;
}

int main( int argc , char **argv ){
  // substitui o  z
  auto fn = std::bind( soma_sub, 9, 1, _1 );
  std::cout << fn( 2 ) << '\n'; // equivale soma_sub( 9, 1, 2 ) = 8
  std::cout << fn( 3 ) << '\n'; // equivale soma_sub( 9, 1, 3 ) = 7

  return 0;
}
{% endhighlight %}

---

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


### 02. Segundo parâmetro dinâmico
> Substitui o `y`

{% highlight cpp %}
auto f2 = std::bind( soma_sub, 9, _1, 1 );
std::cout << f2( 2 ) << '\n'; // equivale soma_sub( 9, 2, 1 ) = 10
std::cout << f2( 3 ) << '\n'; // equivale soma_sub( 9, 3, 1 ) = 11
{% endhighlight %}

---

### 03. Primeiro parâmetro dinâmico
> Substitui o `x`

{% highlight cpp %}
auto f3 = std::bind( soma_sub, _1, 9, 1 );
std::cout << f3( 2 ) << '\n'; // equivale soma_sub( 2, 9, 1 ) = 10
std::cout << f3( 3 ) << '\n'; // equivale soma_sub( 3, 9, 2 ) = 11
{% endhighlight %}

---

### 04. Substituindo 2 parâmetros
> Substitui o `y` e o `z`, respectivamente `_1` e `_2` . Como estamos usando o parâmetro `_2`, precisamos passar **2** parâmetros, caso contrário gera erro ao compilar.

{% highlight cpp %}
auto f4 = std::bind( soma_sub, 1, _1, _2 );
std::cout << f4( 1, 2 ) << '\n'; // equivale soma_sub( 1, 1, 2 ) = 1 + 1 - 2 = 0
std::cout << f4( 3, 10 ) << '\n'; // equivale soma_sub( 1, 3, 10 ) = 1 + 3 - 10 = -6
{% endhighlight %}

---

### 05. Substituindo 2 parâmetros com alteração na ordem
> Substitui o `z` e o `y`, respectivamente `_2` e `_1`

{% highlight cpp %}
auto f5 = std::bind( soma_sub, 1, _2, _1 );
std::cout << f5( 1, 2 ) << '\n'; // equivale soma_sub( 1, 2, 1 ) = 1 + 2 - 1 = 2
std::cout << f5( 3, 10 ) << '\n'; // equivale soma_sub( 1, 10, 3 ) = 1 + 10 - 3 = 8
{% endhighlight %}

---

### 06. Substituindo 2 parâmetros, mas alterando só o segundo
> `_2 = y` , `x = 1`, `z = 3` . Tem que passar 2 parâmetros(senão não compila), mas o 1º será ignorado!

{% highlight cpp %}
auto f6 = std::bind( soma_sub, 1, _2, 3 );
//                             |      |_________________________________
//                             |                                       |
//                             |__________________________________     |
//                                                               |     |
//            ignorado                                           |     | 
//               ↓                                               |     |
std::cout << f6( 897, 0/* _2 */ ) << '\n'; // equivale soma_sub( 1, 0, 3 ) = 1 + 0 - 3 = -2

//            ignorado   
//               ↓
std::cout << f6( 800, 2/* _2 */ ) << '\n';// equivale soma_sub( 1, 2, 0 ) = 1 + 2 - 0 = 2
{% endhighlight %}

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

### 07. Substituindo só o 3º parâmetro
> Pra entender de vez! `x = _3`, precisa informar **3 parâmetros**(senão não compila), pois está  usando o `_3`, mas os dois primeiros serão ignorados.
{% highlight cpp %}
auto f7 = std::bind( soma_sub, _3, 1, 3 );
std::cout << f7( 0, 0, 30 ) << '\n'; // z = 8 , equivale soma_sub( 1, 3, 8 ) = 30 + 1 - 3 = 28
{% endhighlight %}

---

### 08. Usando *alias*
> Nova função de nome `show_name( std::string & )`

{% highlight cpp %}
#include <iostream>
#include <functional>

namespace pl = std::placeholders;

void show_name( std::string &name ){
  std::cout << name << '\n';
}

int main( int argc , char **argv ){

  std::string name("Olá, marcadores de posição");
  auto fn1 = std::bind( show_name, pl::_1 );
  fn1( name );

  return 0;
}
{% endhighlight %}

---

### 09. Sem usar o `auto`
{% highlight cpp %}
std::function<void( std::string & )> fn2 = std::bind( show_name , pl::_1 );
name = "Like, a boss!"; // declarada e inicializada no exemplo anterior!
fn2( name );
{% endhighlight %}

---

### 10. Sem indicar `namespace`
> Exemplo final sem explicações, exercício!

{% highlight cpp %}
#include <iostream>
#include <functional>

int add3(int x1, int x2, int x3) {
  return x1 + x2 + x3;
}

int main( int argc , char **argv ){
  auto fadd3 = std::bind(add3, 11, std::placeholders::_1, std::placeholders::_2);
  std::cout << fadd3(22, 33) << '\n';
  return 0;
}

{% endhighlight %}

> Curiosidades: Se você o `std::bind` puro, ele pode lhe dar um resultado incorreto. Outra coisa também é se você usa o `bind` da lib `boost`: `boost::bind` não é compatível com a `std::bind`.

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


<!-- RETANGULO LARGO -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Informat -->
<ins class="adsbygoogle"
style="display:block"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="2327980059"
data-ad-format="auto"
data-full-width-responsive="true"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>



# Links úteis
+ <https://en.cppreference.com/w/cpp/utility/functional/placeholders>
+ <https://stackoverflow.com/questions/22422147/why-is-stdbind-not-working-without-placeholders-in-this-example-member-functi>
+ <http://gcc.gnu.org/onlinedocs/gcc-4.6.2/libstdc++/api/a01150.html>


