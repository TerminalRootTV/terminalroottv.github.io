---
layout: post
title: "Como Instalar e Primeiros Passos com Google Test"
date: 2025-06-02 10:10:37
image: '/assets/img/cppdaily/googletest.jpg'
description: "🚀 Um framework C++ para testes unitários para Windows e Unix-like"
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[Google Test](https://github.com/google/googletest) é um framework [C++](https://terminalroot.com.br/tags#cpp) para testes unitários, desenvolvido pelo Google. Ele permite escrever testes automatizados, verificar condições, agrupar testes, fixtures, etc.


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
**Dependências**: Compilador: [Clang](https://terminalroot.com.br/2025/05/como-instalar-a-nova-versao-do-clang-llvm-no-windows.html), [GNU GCC](https://terminalroot.com.br/2025/05/como-instalar-a-nova-versao-do-gcc-mingw-no-windows.html) ou [MSVC](https://terminalroot.com.br/2023/06/como-compilar-com-msvc-via-linha-de-comando.html).

### No [Windows](https://terminalroot.com.br/tags#windows)
> Via [WinGet](https://winstall.app/apps/Google.GoogleDrive)

{% highlight bash %}
winget install --id=Google.GoogleDrive  -e
{% endhighlight %}

### No [Ubuntu](https://terminalroot.com.br/tags#gnulinux)

{% highlight bash %}
sudo apt install googletest libgtest-dev
{% endhighlight %}

### No [Arch](https://terminalroot.com.br/2022/02/conheca-o-arch-hurd.html)

{% highlight bash %}
sudo pacman -S googletest
{% endhighlight %}

---

### Exemplo básico

{% highlight cpp %}
#include <gtest/gtest.h>

constexpr auto sum = [](int a, int b){ 
  return a + b;
};

TEST(sum_test, sum_positive) {
  EXPECT_EQ(sum(2, 3), 5);
}

TEST(sum_test, sum_negative) {
  EXPECT_EQ(sum(-2, -3), -5);
}

int main(int argc, char **argv){
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
{% endhighlight %}

Compile:
{% highlight bash %}
g++ test.cpp -lgtest
{% endhighlight %}

Após rodar: `./a.out`:
{% highlight bash %}
[==========] Running 2 tests from 1 test suite.
[----------] Global test environment set-up.
[----------] 2 tests from sum_test
[ RUN      ] sum_test.sum_positive
[       OK ] sum_test.sum_positive (0 ms)
[ RUN      ] sum_test.sum_negative
[       OK ] sum_test.sum_negative (0 ms)
[----------] 2 tests from sum_test (0 ms total)

[----------] Global test environment tear-down
[==========] 2 tests from 1 test suite ran. (0 ms total)
[  PASSED  ] 2 tests.
{% endhighlight %}

---

+ `EXPECT_EQ(x, y)` – Verifica igualdade
+ `ASSERT_TRUE(cond)` – Para execução se falhar
+ `TEST_F` – Usa fixtures (setup/teardown)

Se alterarmos a linha do `sum_positive` para um `float` e um número negativo: `EXPECT_EQ(sum(2.f, -3), 5);`

As falhas são emitidas:
{% highlight bash %}
[==========] Running 2 tests from 1 test suite.
[----------] Global test environment set-up.
[----------] 2 tests from sum_test
[ RUN      ] sum_test.sum_positive
test.cpp:8: Failure
Expected equality of these values:
  sum(2.f, -3)
    Which is: -1
  5

[  FAILED  ] sum_test.sum_positive (0 ms)
[ RUN      ] sum_test.sum_negative
[       OK ] sum_test.sum_negative (0 ms)
[----------] 2 tests from sum_test (0 ms total)

[----------] Global test environment tear-down
[==========] 2 tests from 1 test suite ran. (0 ms total)
[  PASSED  ] 1 test.
[  FAILED  ] 1 test, listed below:
[  FAILED  ] sum_test.sum_positive

 1 FAILED TEST
{% endhighlight %}

---

Você pode testar todas as suas funções, classes, structs de qualquer projeto, ex.: [SFML](https://terminalroot.com.br/sfml), [SDL](https://terminalroot.com.br/sdl), ... e qualquer outro tipo de projeto.

Para mais informações acesse o repositório: <https://github.com/google/googletest>.


