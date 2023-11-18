---
layout: post
title: "Gere Dados Fake facilmente para C++ com faker-cxx"
date: 2023-11-18 20:19:32
image: '/assets/img/cpp/faker-cxx.jpg'
description: 'Similar ao Factory do Laravel e o Faker.js, útil para ambientes de desenvolvimento.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**C++ Faker** é uma biblioteca moderna de código aberto que utiliza [C++20](https://terminalroot.com.br/cpp) para gerar dados falsos para testes durante o desenvolvimento das suas aplicações.

A biblioteca é fortemente inspirada em [Faker.js](https://fakerjs.dev/).

---

# Utilizando
Apesar de usar em conjunto com [LibFMT](https://terminalroot.com.br/2021/12/utilizando-a-fmtlib-para-saidas-formatadas-em-cpp.html) e [GoogleTest](https://github.com/google/googletest), ao mesmo tempo, possuí-las ainda sim é opcional. No caso da LibFMT será clonada automaticamente e o GoogleTest pode ser desativado durante a compilação.

## Pra você testar do zero:

### 01. crie um projeto, entre no mesmo e inicie um repositório [Git](https://terminalroot.com.br/tags#git):
{% highlight bash %}
mkdir myproject
cd myproject
git init
{% endhighlight %}

---

### 02. Clone recursivamente o Faker-cxx:
{% highlight bash %}
git submodule add https://github.com/cieslarmichal/faker-cxx.git
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

### 03. Agora crie um `CMakeLists.txt`
E adicione o conteúdo abaixo:
{% highlight cmake %}
cmake_minimum_required(VERSION 3.10)

project(TestFaker
  LANGUAGES CXX
  VERSION 0.0.1
)

set(BUILD_FAKER_TESTS OFF)

add_subdirectory(faker-cxx)

set (CMAKE_CXX_STANDARD 23)
add_executable(a.out main.cpp)

target_link_libraries(a.out faker-cxx)
{% endhighlight %}
> Note que na linha: `set(BUILD_FAKER_TESTS OFF)` nós desativamos o GoogleTest, e eu recomendo porque notei que tem um *array* que tá *bugado*. 😃 

---

### 04. Crie um arquivo C++ `main.cpp`
E adicione o conteúdo abaixo:

{% highlight cpp %}
#include <format>
#include <iostream>

#include "faker-cxx/include/faker-cxx/Datatype.h"
#include "faker-cxx/include/faker-cxx/Date.h"
#include "faker-cxx/include/faker-cxx/Internet.h"
#include "faker-cxx/include/faker-cxx/String.h"

auto main() -> int {
  const auto id = faker::String::uuid();
  const auto email = faker::Internet::email();
  const auto password = faker::Internet::password();
  const auto nickname = faker::Internet::username();
  const auto active = faker::Datatype::boolean();
  const auto email_check = faker::Datatype::boolean();
  const auto code_check = faker::String::numeric(8);
  const auto created_at = faker::Date::pastDate();
  const auto updated_at = faker::Date::recentDate();

  std::cout << std::format("id: {}", id) << '\n';
  std::cout << std::format("email: {}", email) << '\n';
  std::cout << std::format("password: {}", password) << '\n';
  std::cout << std::format("nickname: {}", nickname) << '\n';
  std::cout << std::format("active: {}", active) << '\n';
  std::cout << std::format("email_check: {}", email_check) << '\n';
  std::cout << std::format("code_check: {}", code_check) << '\n';
  std::cout << std::format("created_at: {}", created_at) << '\n';
  std::cout << std::format("updated_at: {}", updated_at) << '\n';

  return 0;
}
{% endhighlight %}
> Nesse exemplo há diversos *fakers* que você pode gerar, mas há mais exemplos como: *Nome de Empresas*, *Animais*, ... e entre outros!

----

### 05. Copile e rode
{% highlight bash %}
cmake . -B build
cd build && make
./a.out
{% endhighlight %}

Exemplo de saída similar:
{% highlight bash %}
id: 885c6f73-48e1-49c5-b718-cc099c26486c
email: WendyWest586@yahoo.com
password: Gy4.hX*=HA|OG?_
nickname: AltonKulas
active: true
email_check: true
code_check: 23567299
created_at: 2023-05-05T11:39:05Z
updated_at: 2023-11-16T13:07:05Z
{% endhighlight %}

Toda vez que você rodar o binários, novos dados serão gerados!

---

Para mais informações visite o repositório: <https://github.com/cieslarmichal/faker-cxx>.

---

<!-- RECTANGLE 2 - OnParagragraph -->
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

<!--

Se quiser compilar e instalar, será instalado só a libfmt e o gtest:

{% highlight bash %}
git clone --recursive https://github.com/cieslarmichal/faker-cxx
cd faker-cxx/
cmake -B build .
cd build && make
sudo make install
{% endhighlight %}

<details>
 <summary>Clique aqui <code>menu.hpp</code></summary>

{% highlight bash %}
[  3%] Built target fmt
[ 46%] Built target faker-cxx
[ 49%] Built target gtest
[ 51%] Built target gtest_main
[ 54%] Built target gmock
[ 56%] Built target gmock_main
[100%] Built target faker-cxx-UT
Install the project...
-- Install configuration: ""
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
-- Installing: /usr/local/lib64/cmake/fmt/fmt-targets.cmake
-- Installing: /usr/local/lib64/cmake/fmt/fmt-targets-noconfig.cmake
-- Installing: /usr/local/lib64/pkgconfig/fmt.pc
-- Up-to-date: /usr/local/include
-- Installing: /usr/local/include/gmock
-- Installing: /usr/local/include/gmock/gmock-more-actions.h
-- Installing: /usr/local/include/gmock/gmock-function-mocker.h
-- Installing: /usr/local/include/gmock/gmock-cardinalities.h
-- Installing: /usr/local/include/gmock/gmock.h
-- Installing: /usr/local/include/gmock/gmock-spec-builders.h
-- Installing: /usr/local/include/gmock/gmock-more-matchers.h
-- Installing: /usr/local/include/gmock/internal
-- Installing: /usr/local/include/gmock/internal/gmock-internal-utils.h
-- Installing: /usr/local/include/gmock/internal/gmock-pp.h
-- Installing: /usr/local/include/gmock/internal/custom
-- Installing: /usr/local/include/gmock/internal/custom/gmock-generated-actions.h
-- Installing: /usr/local/include/gmock/internal/custom/README.md
-- Installing: /usr/local/include/gmock/internal/custom/gmock-port.h
-- Installing: /usr/local/include/gmock/internal/custom/gmock-matchers.h
-- Installing: /usr/local/include/gmock/internal/gmock-port.h
-- Installing: /usr/local/include/gmock/gmock-actions.h
-- Installing: /usr/local/include/gmock/gmock-matchers.h
-- Installing: /usr/local/include/gmock/gmock-nice-strict.h
-- Installing: /usr/local/lib64/libgmock.a
-- Installing: /usr/local/lib64/libgmock_main.a
-- Installing: /usr/local/lib64/pkgconfig/gmock.pc
-- Installing: /usr/local/lib64/pkgconfig/gmock_main.pc
-- Installing: /usr/local/lib64/cmake/GTest/GTestTargets.cmake
-- Installing: /usr/local/lib64/cmake/GTest/GTestTargets-noconfig.cmake
-- Installing: /usr/local/lib64/cmake/GTest/GTestConfigVersion.cmake
-- Installing: /usr/local/lib64/cmake/GTest/GTestConfig.cmake
-- Up-to-date: /usr/local/include
-- Installing: /usr/local/include/gtest
-- Installing: /usr/local/include/gtest/gtest_pred_impl.h
-- Installing: /usr/local/include/gtest/gtest-death-test.h
-- Installing: /usr/local/include/gtest/gtest.h
-- Installing: /usr/local/include/gtest/gtest-test-part.h
-- Installing: /usr/local/include/gtest/gtest-spi.h
-- Installing: /usr/local/include/gtest/gtest-printers.h
-- Installing: /usr/local/include/gtest/gtest-param-test.h
-- Installing: /usr/local/include/gtest/gtest-assertion-result.h
-- Installing: /usr/local/include/gtest/gtest-matchers.h
-- Installing: /usr/local/include/gtest/gtest-message.h
-- Installing: /usr/local/include/gtest/internal
-- Installing: /usr/local/include/gtest/internal/gtest-internal.h
-- Installing: /usr/local/include/gtest/internal/gtest-param-util.h
-- Installing: /usr/local/include/gtest/internal/gtest-filepath.h
-- Installing: /usr/local/include/gtest/internal/gtest-type-util.h
-- Installing: /usr/local/include/gtest/internal/custom
-- Installing: /usr/local/include/gtest/internal/custom/gtest.h
-- Installing: /usr/local/include/gtest/internal/custom/gtest-printers.h
-- Installing: /usr/local/include/gtest/internal/custom/README.md
-- Installing: /usr/local/include/gtest/internal/custom/gtest-port.h
-- Installing: /usr/local/include/gtest/internal/gtest-string.h
-- Installing: /usr/local/include/gtest/internal/gtest-port-arch.h
-- Installing: /usr/local/include/gtest/internal/gtest-death-test-internal.h
-- Installing: /usr/local/include/gtest/internal/gtest-port.h
-- Installing: /usr/local/include/gtest/gtest_prod.h
-- Installing: /usr/local/include/gtest/gtest-typed-test.h
-- Installing: /usr/local/lib64/libgtest.a
-- Installing: /usr/local/lib64/libgtest_main.a
-- Installing: /usr/local/lib64/pkgconfig/gtest.pc
-- Installing: /usr/local/lib64/pkgconfig/gtest_main.pc
{% endhighlight %}

</details>


-->


