---
layout: post
title: "C++ Insights - Veja seu código com os olhos de um compilador"
date: 2022-02-10 12:58:44
image: '/assets/img/cppdaily/cppinsights.jpg'
description: 'Utiliza LLVM/Clang, Ninja e LLD para construir'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**C++ Insights** é uma ferramenta baseada em [clang](https://terminalroot.com.br/tags#clang) que faz uma transformação do seu código fonte no código fonte visto pelo compilador.

O objetivo é tornar visíveis as coisas, que normalmente e intencionalmente acontecem nos bastidores. É sobre a mágica que o compilador faz para que as coisas funcionem. Ou olhando através das classes de um compilador.

Por exemplo:

Suponhamos que você possui esse código:
{% highlight cpp %}
#include <iostream>

int main(){
  std::string hello {"Hello, World!"};
  std::cout << hello << '\n';
  return EXIT_SUCCESS;
}
{% endhighlight %}

Na verdade esse código é visto assim pelo seu compilador:
{% highlight cpp %}
#include <iostream>

int main()
{
  std::string hello = std::basic_string<char>{"Hello, World!", std::allocator<char>()};
  std::operator<<(std::operator<<(std::cout, hello), '\n');
  return 0;
}
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

# Instalação e Utilização
O **C++ Insights** está disponível online, mas se você quiser construir e instalar no seu sistema, há alguns detalhes . Você precisará das seguintes ferramentas de construção:
+ [CMake](https://terminalroot.com.br/tags#cmake)
+ [LLVM](https://terminalroot.com.br/tags#llvm)/[clang++](https://terminalroot.com.br/tags#clang), só compila com ele.
+ [Ninja](https://terminalroot.com.br/tags#ninja)
+ [lld](https://lld.llvm.org/) , essa é a mais importante de todas, o C++ Insights informa parâmetros para o linker que o [GNU ld](https://linux.die.net/man/1/ld) não é compatível. 😞 

Exemplo no [Ubuntu](https://terminalroot.com.br/tags#ubuntu):
{% highlight sh %}
sudo apt install clang++ lld ninja-build cmake
{% endhighlight %}

Depois é só clonar e construir com o seguinte comando:
{% highlight sh %}
git clone https://github.com/andreasfertig/cppinsights.git
mkdir build && cd build
cmake -G"Ninja" ../cppinsights
ninja
{% endhighlight %}

Se você não conseguir, tente assim:
> Perceba que o linker e o compilador são informados via parâmetro para o CMake, se quiser ainda reforçar, rode antes do `cmake` os comando: `export CXX=$(which clang++)` e para o linker: `env LD=$(which lld)` .
{% highlight sh %}
git clone https://github.com/andreasfertig/cppinsights
cd cppinsights
mkdir build && cd build

cmake -G"Ninja" -DCMAKE_LINKER=$(which lld) -DCMAKE_CXX_COMPILER=$(which clang++) -DCMAKE_PREFIX_PATH=$(which clang++ | sed 's/\/clang++//g') ..
ninja
{% endhighlight %}
> Você ainda pode tentar com o `make`: `cmake -G "Unix Makefiles" ..` e mais os outros parâmetros acima.

> Eu penei para compilar da forma: "somente com essas ferramentas",...  Enfim, boa sorte em compilar, você vai precisar!

Se você conseguiu compilar e instalar, a utilização é bem simples, exemplo para analisar um código:
{% highlight sh %}
insights <YOUR_CPP_FILE> -- -std=c++17
{% endhighlight %}

Se você NÃO conseguiu compilar e instalar, relaxe! Você pode usar online no endereço:
# <https://cppinsights.io/>
> Tenho certeza que é bem mais fácil! 😃 

Para mais informações acesse também o GitHub:
# <https://github.com/andreasfertig/cppinsights>

