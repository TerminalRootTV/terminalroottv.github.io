---
layout: post
title: "Utilizando a fmtlib para saídas formatadas em C++"
date: 2021-12-03 12:06:18
image: '/assets/img/cpp/fmt.jpg'
description: 'Em testes realizados o fmt foi cerca de 35% mais rápido que o printf do C e o std::cout do C++ .'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- linguagemc
---

![Utilizando a fmtlib para saídas formatadas em C++](/assets/img/cpp/fmt.jpg)

[{fmt}](https://github.com/fmtlib/fmt) é uma biblioteca de formatação de código aberto que oferece uma alternativa rápida e segura para [C stdio](https://terminalroot.com.br/tags#linguagemc) e [C++ iostreams](https://terminalroot.com.br/cpp).

Recursos
+ API de formato simples com argumentos posicionais para localização
+ Implementação de **C++20** `std::format`
+ Sintaxe de string de formato semelhante ao formato do [Python](https://terminalroot.com.br/tags#python)
+ Formatador de ponto flutuante IEEE 754 rápido com arredondamento correto, curto e garantias de ida e volta
+ E entre diversos outros.


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

## Instalação 
Se seu sistema já possuir o `fmtlib` disponível no gerenciador de pacotes, então, basta usá-lo. Exemplo no [Ubuntu](https://terminalroot.com.br/tags#ubuntu):
```bash
sudo apt install libfmt-dev
```

Caso, contrário será necessário instalar as dependências, clonar e compilar:

### Dependências:
+ [g++](https://terminalroot.com.br/2019/12/gcc-vs-llvm-qual-e-o-melhor-compilador.html) ou [clang](https://terminalroot.com.br/2019/12/gcc-vs-llvm-qual-e-o-melhor-compilador.html)
+ [Git](https://terminalroot.com.br/git)
+ [CMake](https://terminalroot.com.br/2019/12/como-compilar-seus-programas-com-cmake.html)

Depois basta clonar, compilar e instalar com os comandos abaixo:
{% highlight sh %}
git clone https://github.com/fmtlib/fmt
cd fmt
cmake -B build .
cd build
make
sudo make install
{% endhighlight %}

<details>
 <summary>Caminho da instalação dos arquivos</summary>

```bash
Install the project...
-- Install configuration: "Release"
-- Installing: /usr/local/lib64/libfmt.a
-- Installing: /usr/local/include/fmt/args.h
-- Installing: /usr/local/include/fmt/chrono.h
-- Installing: /usr/local/include/fmt/color.h
-- Installing: /usr/local/include/fmt/compile.h
-- Installing: /usr/local/include/fmt/core.h
-- Installing: /usr/local/include/fmt/format.h
-- Installing: /usr/local/include/fmt/format-inl.h
-- Installing: /usr/local/include/fmt/os.h
-- Installing: /usr/local/include/fmt/ostream.h
-- Installing: /usr/local/include/fmt/printf.h
-- Installing: /usr/local/include/fmt/ranges.h
-- Installing: /usr/local/include/fmt/std.h
-- Installing: /usr/local/include/fmt/xchar.h
-- Installing: /usr/local/lib64/cmake/fmt/fmt-config.cmake
-- Installing: /usr/local/lib64/cmake/fmt/fmt-config-version.cmake
-- Old export file "/usr/local/lib64/cmake/fmt/fmt-targets.cmake" will be replaced.  Removing files [/usr/local/lib64/cmake/fmt/fmt-targets-release.cmake].
-- Installing: /usr/local/lib64/cmake/fmt/fmt-targets.cmake
-- Installing: /usr/local/lib64/cmake/fmt/fmt-targets-release.cmake
-- Installing: /usr/local/lib64/pkgconfig/fmt.pc
```
</details>

---

## Exemplos de uso

Uso básico:
{% highlight cpp %}
#include <fmt/core.h>

int main() {
  fmt::print("A resposta é {}.\n", 42);
}
{% endhighlight %}

Para compilar use a flag `-lfmt`:
{% highlight sh %}
g++ -I/usr/local/include/benchmark/ -lfmt main.cpp
{% endhighlight %}

Atribuindo saída formatada à uma string:
{% highlight cpp %}
#include <fmt/core.h>

int main() {
  std::string s = fmt::format("A resposta é {}.\n", 42);
  fmt::print("{}", s);
}
{% endhighlight %}

Utilizando argumentos posicionais:
{% highlight cpp %}
#include <fmt/core.h>

int main() {
  std::string s = fmt::format("Eu {1} amar {0} o {2}!\n", "demais", "\u2764", "C++");
  fmt::print("{}", s);
}
{% endhighlight %}

Imprimindo informações cronológicas:
{% highlight cpp %}
#include <fmt/chrono.h>

int main() {
  using namespace std::literals::chrono_literals;
  fmt::print("Saída padrão: {} {}\n", 42s, 100ms);
  fmt::print("Saída formatada: {:%H:%M:%S}\n", 3h + 15min + 30s);
}
{% endhighlight %}

Saída com cores:
{% highlight cpp %}
#include <fmt/color.h>

int main() {
  fmt::print(fg(fmt::color::crimson) | fmt::emphasis::bold,
             "Olá, {}!\n", "Mundo");
}
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

---

Para mais exemplos consulte a [documentação](https://fmt.dev/) e o [repositório](https://github.com/fmtlib/fmt) .

<!--
Install the project...
-- Install configuration: "Release"
-- Installing: /usr/local/lib64/libbenchmark.so.1.5.0
-- Installing: /usr/local/lib64/libbenchmark.so.1
-- Installing: /usr/local/lib64/libbenchmark.so
-- Installing: /usr/local/lib64/libbenchmark_main.so.1.5.0
-- Installing: /usr/local/lib64/libbenchmark_main.so.1
-- Set runtime path of "/usr/local/lib64/libbenchmark_main.so.1.5.0" to ""
-- Installing: /usr/local/lib64/libbenchmark_main.so
-- Installing: /usr/local/include/benchmark
-- Installing: /usr/local/include/benchmark/benchmark.h
-- Installing: /usr/local/lib64/cmake/benchmark/benchmarkConfig.cmake
-- Installing: /usr/local/lib64/cmake/benchmark/benchmarkConfigVersion.cmake
-- Installing: /usr/local/lib64/pkgconfig/benchmark.pc
-- Installing: /usr/local/lib64/cmake/benchmark/benchmarkTargets.cmake
-- Installing: /usr/local/lib64/cmake/benchmark/benchmarkTargets-release.cmake
-->



