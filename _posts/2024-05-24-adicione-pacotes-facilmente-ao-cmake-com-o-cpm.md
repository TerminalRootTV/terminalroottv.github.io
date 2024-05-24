---
layout: post
title: "Adicione pacotes facilmente ao CMake com o CPM"
date: 2024-05-24 09:53:37
image: '/assets/img/cpp/cpm.jpg'
description: '📦 CPM(CMake Package Manager) é um Gerenciador de Pacotes para o CMake.'
icon: 'ion:terminal-sharp'
iconname: 'CMake'
tags:
- cmake
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Existem tantas bibliotecas e pra muita gente fica difícil saber o nome correto para adicionar ao CMake, ou ainda saber se possui instalada.

Para resolver esse problema existe o **CPM**.

📦 CPM significa: **CMake Package Manager**, ou seja, um Gerenciador de Pacotes para o CMake. É um Um pequeno script para gerenciamento de dependências, multiplataforma e sem configuração.


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

# Utilização
Suponhamos que você possui esse código [C++](https://terminalroot.com.br/tags#cpp):
{% highlight cpp %}
#include <fmt/format.h>

auto main() -> int {
  fmt::print("Olá, Mundo!\n");
}
{% endhighlight %}

Note que ele usa a biblioteca [fmt](https://terminalroot.com.br/2021/12/utilizando-a-fmtlib-para-saidas-formatadas-em-cpp.html), se tentarmos compilar da maneira via linha de comando, não funciona:
{% highlight bash %}
g++ main.cc

/usr/lib/gcc/x86_64-pc-linux-gnu/13/../../../../x86_64-pc-linux-gnu/bin/ld: /tmp/cc5yZimt.o: na função "main":
main.cc:(.text+0x7e): undefined reference to `fmt::v10::vprint(fmt::v10::basic_string_view<char>, fmt::v10::basic_format_args<fmt::v10::basic_format_context<fmt::v10::appender, char> >)'
collect2: error: ld returned 1 exit status
{% endhighlight %}

Se usarmos o CMake, o mesmo não irá procurar a biblioteca de forma automática:
> `CMakeLists.txt`
{% highlight bash %}
cmake_minimum_required(VERSION 3.10)
project(MeuExemplo)
add_executable(myexample main.cc)
{% endhighlight %}
Após compilarmos, também obteremos erro:
{% highlight bash %}
cmake -B build .
cd build && make

[ 50%] Building CXX object CMakeFiles/myexample.dir/main.cc.o
[100%] Linking CXX executable myexample
/usr/lib/gcc/x86_64-pc-linux-gnu/13/../../../../x86_64-pc-linux-gnu/bin/ld: CMakeFiles/myexample.dir/main.cc.o: na função "main":
main.cc:(.text+0x7e): undefined reference to `fmt::v10::vprint(fmt::v10::basic_string_view<char>, fmt::v10::basic_format_args<fmt::v10::basic_format_context<fmt::v10::appender, char> >)'
collect2: error: ld returned 1 exit status
make[2]: *** [CMakeFiles/myexample.dir/build.make:97: myexample] Error 1
make[1]: *** [CMakeFiles/Makefile2:83: CMakeFiles/myexample.dir/all] Error 2
make: *** [Makefile:91: all] Error 2
{% endhighlight %}

Agora vamos adicionar adicionar o CPM ao nosso `CMakeLists.txt`, basta essas duas declarações:
{% highlight make %}
file(
  DOWNLOAD
  https://github.com/cpm-cmake/CPM.cmake/releases/download/v0.38.3/CPM.cmake
  ${CMAKE_CURRENT_BINARY_DIR}/cmake/CPM.cmake
  EXPECTED_HASH SHA256=cc155ce02e7945e7b8967ddfaff0b050e958a723ef7aad3766d368940cb15494
)
include(${CMAKE_CURRENT_BINARY_DIR}/cmake/CPM.cmake)
{% endhighlight %}

E então linkar a biblioteca(usando o CPM) que a gente deseja a nosso binário:
{% highlight make %}
CPMAddPackage("gh:fmtlib/fmt#7.1.3")
target_link_libraries(myexample fmt::fmt)
{% endhighlight %}

Ao final, nosso `CMakeLists.txt` ficará assim:
{% highlight make %}
cmake_minimum_required(VERSION 3.10)
project(MeuExemplo)
add_executable(myexample main.cc)

file(
  DOWNLOAD
  https://github.com/cpm-cmake/CPM.cmake/releases/download/v0.38.3/CPM.cmake
  ${CMAKE_CURRENT_BINARY_DIR}/cmake/CPM.cmake
  EXPECTED_HASH SHA256=cc155ce02e7945e7b8967ddfaff0b050e958a723ef7aad3766d368940cb15494
)
include(${CMAKE_CURRENT_BINARY_DIR}/cmake/CPM.cmake)

CPMAddPackage("gh:fmtlib/fmt#7.1.3")
target_link_libraries(myexample fmt::fmt)
{% endhighlight %}

Agora é só compilar e correr pro abraço!

{% highlight bash %}
prompt> cmake -B build .
-- The C compiler identification is GNU 13.2.1
-- The CXX compiler identification is GNU 13.2.1
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- CPM: Adding package fmt@7.1.3 (7.1.3)
-- Version: 7.1.3
-- Build type: 
-- CXX_STANDARD: 11
-- Performing Test has_std_11_flag
-- Performing Test has_std_11_flag - Success
-- Performing Test has_std_0x_flag
-- Performing Test has_std_0x_flag - Success
-- Performing Test SUPPORTS_USER_DEFINED_LITERALS
-- Performing Test SUPPORTS_USER_DEFINED_LITERALS - Success
-- Performing Test FMT_HAS_VARIANT
-- Performing Test FMT_HAS_VARIANT - Success
-- Required features: cxx_variadic_templates
-- Looking for strtod_l
-- Looking for strtod_l - not found
-- Configuring done (11.4s)
-- Generating done (0.0s)
-- Build files have been written to: /home/marcos/CPM/build
prompt> cd build && make
[ 20%] Building CXX object _deps/fmt-build/CMakeFiles/fmt.dir/src/format.cc.o
[ 40%] Building CXX object _deps/fmt-build/CMakeFiles/fmt.dir/src/os.cc.o
[ 60%] Linking CXX static library libfmt.a
[ 60%] Built target fmt
[ 80%] Building CXX object CMakeFiles/myexample.dir/main.cc.o
[100%] Linking CXX executable myexample
[100%] Built target myexample
prompt> build $ ./myexample 
Olá, Mundo!
{% endhighlight %}

Show de bola, né?! E isso sem muito esforço e foi tudo muito rápido.

Lógico que esse é um exemplo básico e linkar a FMT no CMake não é difícil, mas existem vários casos que é um drama!!!

Espero que tenham gostado do CPM. Para mais informações [acesse o repositório do CPM no GitHub](https://github.com/cpm-cmake/CPM.cmake).

Compartilhe!!!


