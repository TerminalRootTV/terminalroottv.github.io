---
layout: post
title: "NumCpp, o Numpy para C++"
date: 2022-01-13 13:16:26
image: '/assets/img/cpp/numcpp.png'
description: 'Indicado para programadores Python que querem usar C++, mas manter a forma como fazem seus projetos.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
- python
---

![NumCpp, o Numpy para C++](/assets/img/cpp/numcpp.png)

---

**NumCpp** é uma implementação para [C++](https://terminalroot.com.br/cpp) da biblioteca Numpy do [Python](https://terminalroot.com.br/tags#python) que é para trabalhar com arrays multidimensionais largamente utilizado em [Machine Learning](https://terminalroot.com.br/tags#machinelearning) .

---

# Instalação
Para poder usar o NumCpp no seu sistema é necessário clonar e compilar(As dependências [CMake](https://terminalroot.com.br/2019/12/como-compilar-seus-programas-com-cmake.html), [Make](https://terminalroot.com.br/2019/12/como-criar-um-makefile.html) e [g++](https://terminalroot.com.br/2019/12/gcc-vs-llvm-qual-e-o-melhor-compilador.html) são necessárias):
{% highlight sh %}
git clone https://github.com/dpilger26/NumCpp
cd NumCpp
mkdir build && cd build
cmake ..
sudo cmake --build . --target install
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

# Testando e compilando um projeto
Quando você estiver desenvolvendo com a bilbioteca você pode compilar com esses procedimentos. Exemplo de um projeto fictício: `meu-projeto`:
{% highlight sh %}
mkdir meu-projeto
cd meu-projeto
{% endhighlight %}

Crie um arquivo `main.cpp`:
> `vim main.cpp`
{% highlight cpp %}
#include <NumCpp.hpp>

int main(){
  auto a = nc::random::randInt<int>({10, 10}, 0, 100);
  std::cout << a;
  return EXIT_SUCCESS;
}
{% endhighlight %}

Crie o `CMakeLists.txt`
> `vim CMakeLists.txt`
{% highlight cmake %}
cmake_minimum_required(VERSION 3.14)
 
project("HelloWorld" CXX)
 
add_executable(${PROJECT_NAME} main.cpp)
 
find_package(NumCpp 2.6.2 REQUIRED)
target_link_libraries(${PROJECT_NAME}
    NumCpp::NumCpp
)
{% endhighlight %}

Compile:
{% highlight sh %}
mkdir build && cd build
cmake ..
cmake --build . --config Release
./HelloWorld
{% endhighlight %}

Para mais informações acesse:
+ <https://dpilger26.github.io/NumCpp>
+ <https://github.com/dpilger26/NumCpp>



