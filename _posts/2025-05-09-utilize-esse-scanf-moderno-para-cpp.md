---
layout: post
title: "Utilize esse scanf Moderno para C++"
date: 2025-05-09 17:11:44
image: '/assets/img/cppdaily/scnlib.jpg'
description: "🚀 É mais rápida que `iostream` e tipada, ao contrário de `scanf`."
icon: 'ion:terminal-sharp'
iconname: 'C++23'
tags:
- cppdaily
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

`scnlib` é uma biblioteca C++ moderna para substituir `scanf` e `std::istream`. Esta biblioteca tenta nos aproximar ainda mais da substituição completa de `iostream`
e `stdio` em [C](https://terminalroot.com.br/c).

É mais rápida que `iostream` e tipada, ao contrário de `scanf`. Pense em [{fmt}](https://terminalroot.com.br/2021/12/utilizando-a-fmtlib-para-saidas-formatadas-em-cpp.html) ou em `std::format` em [C++20](https://terminalroot.com.br/cpp), mas em outra direção.

Esta biblioteca é a implementação de referência da proposta de padrões ISO C++ [P1729 "Análise de Texto"](https://wg21.link/p1729).

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

## Instalação
Para compilar basta clonar com [git](https://terminalroot.com.br/tags#git) e usar o [CMake](https://terminalroot.com.br/tags#cmake) e instalar:

{% highlight bash %}
git clone https://github.com/eliaskosunen/scnlib
cd scnlib
cmake -B build .
cmake --build build
sudo cmake --install build
{% endhighlight %}
> Após isso, já pode sair do repositório e removê-lo: `cd .. && rm -rf scnlib`.


<details>
 <summary>Caminho da instação dos arquivos</summary>

{% highlight bash %}
$ sudo cmake --install build/
[sudo]: 
-- Install configuration: "Release"
-- Installing: /usr/local/lib/libscn.a
-- Up-to-date: /usr/local/include
-- Installing: /usr/local/include/scn
-- Installing: /usr/local/include/scn/xchar.h
-- Installing: /usr/local/include/scn/regex.h
-- Installing: /usr/local/include/scn/chrono.h
-- Installing: /usr/local/include/scn/istream.h
-- Installing: /usr/local/include/scn/fwd.h
-- Installing: /usr/local/include/scn/ranges.h
-- Installing: /usr/local/include/scn/scan.h
-- Installing: /usr/local/lib/cmake/scn/scn-targets.cmake
-- Installing: /usr/local/lib/cmake/scn/scn-targets-release.cmake
-- Installing: /usr/local/lib/cmake/scn/scn-config.cmake
-- Installing: /usr/local/lib/cmake/scn/scn-config-version.cmake
{% endhighlight %}

</details>

---

## Exemplo básico
Nesse exemplo, além da `scnlib` também há o uso o [`println` do C++23](https://terminalroot.com.br/2025/04/como-instalar-o-gcc-14-e-usar-o-cpp23.html), vamos ler 2 números via prompt e automaticamente será exibida a soma deles:

> `main.cpp`

{% highlight cpp %}
#include <scn/scan.h>
#include <print> 

constexpr auto sum = [](int x, int y){
  return x + y;
};

int main(){
  if(auto result =
      scn::prompt<int, int>("Informe 2 números para somar? ", "{} {}")) {
    auto [a, b] = result->values();
    std::println("A soma de {} mais {} é: {}", a, b, sum(a, b));
  }else{
    std::println(stderr, "Error: {}", result.error().msg());
  }
}
{% endhighlight %}

Para compilar use a *flag*: `-lscn`:
{% highlight bash %}
g++ main.cpp -lscn
{% endhighlight %}

E então, rode o binário e teste, exemplo:
{% highlight bash %}
./a.out
Informe 2 números para somar? 3 6
A soma de 3 mais 6 é: 9
{% endhighlight %}

---

Para mais informações acesse [o repositório oficial](https://github.com/eliaskosunen/scnlib) e o endereço: <https://scnlib.dev/>.


