---
layout: post
title: "Como Verificar Qual o Sistema Operacional com C++"
date: 2022-07-19 09:41:03
image: '/assets/img/cppdaily/check-os-cpp.jpg'
description: 'Torne seus programas portáveis e de fácil implementação .'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cplusplus
- windows
- gcc
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Diversas vezes estamos desenvolvendo programas portáveis com [C++](https://terminalroot.com.br/tags#cpp) que precisamos criar um único código que funcione em diversas plataformas .

E para isso precisamos usar **DIRETIVAS DE PRÉ PROCESSAMENTO**: `#ifdef`, `#if defined()`, ...

Nesse caso existem `MACROS` específicas para cada sistema operacional, por exemplo:
+ Se quiser detectar se o sistema é Linux, basta usar a macro: `__linux__`;
+ Se quiser verificar se é [Windows](https://terminalroot.com.br/tags#windows), pode usar: `_WIN32` .

# Verificando se é Linux ou Windows
Abaixo um exemplo de um código C++ que roda em ambos sistemas operacionais e emite um "[Hello, World!](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html)" conforme o sistema operacional:

{% highlight cpp %}
#include <iostream>

int main(){

#if defined(__linux__) // Ou #if __linux__
  std::cout << "Olá, GNU/Linux!" << '\n';
#elif _WIN32
  std::cout << "Olá, Windows!" << '\n';
#else
  std::cout << "Olá, Other!" << '\n';
#endif

}
{% endhighlight %}

No caso do Windows, você ainda pode criar outro `#if` dentro para detectar se: 
+ `_WIN64` , esse Windows é só 64-bit;
+ `_WIN32` , ambos tanto 64-bit quanto 32-bit
+ `__CYGWIN__` outra alternativa mais moderna.

Exemplo:

{% highlight cpp %}
#include <iostream>

int main(){

#if __linux__
  std::cout << "Olá, GNU/Linux!" << '\n';
#elif _WIN32
  #if defined(_WIN64)
    std::cout << "Olá, Windows 64-bit!" << '\n';
  #else
    std::cout << "Olá, Windows!" << '\n';
  #endif
#else
  std::cout << "Olá, Other!" << '\n';
#endif

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

# Verificando diversos sistemas operacionais
Você ainda pode detectar todos os sistema operacionais. Abaixo um outro exemplo que detecta, além de Linux e Windows, verifica também se é: [macOS](https://terminalroot.com.br/tags#macOS), [FreeBSD](https://terminalroot.com.br/tags#freebsd), [Android](https://terminalroot.com.br/tags#android):

{% highlight cpp %}
#include <iostream>

int main(){

#if defined(__ANDROID__)
  std::cout << "Olá, Android!" << '\n';
#elif __FreeBSD__
  std::cout << "Olá, FreeBSD!" << '\n';
#elif __linux__
  std::cout << "Olá, GNU/Linux!" << '\n';
#elif __APPLE__
  std::cout << "Olá, macOS!" << '\n';
#elif _WIN32
  std::cout << "Olá, Windows!" << '\n';
#else
  std::cout << "Olá, Other!" << '\n';
#endif

}
{% endhighlight %}

Você ainda pode verificar se é do tipo [UNIX](https://terminalroot.com.br/tags#unix) (Linux ou BSD, macOS NÃO): `unix`, `__unix` ou `__unix__` .

Para uma lista completa de todas as macros para sistemas operacionais que você pode ver [aqui](https://sourceforge.net/p/predef/wiki/OperatingSystems/) .

---

# Usando o [gcc](https://terminalroot.com.br/tags#gcc) para detectar nomes de macros
Para ter uma lista de macros que você pode detectar, use o `gcc` ou `g++`:
> Pode ser que o `clang` e `clang++` também tenha essas opções, mas eu ainda não os reinstalei para testar.

+ No GNU/Linux:
{% highlight bash %}
g++ -dM -E - </dev/null
# Ou
gcc -dM -E - </dev/null
{% endhighlight %}

+ No MS/Windows:
{% highlight bash %}
g++ -dM -E - <NUL:
# Ou
gcc -dM -E - <NUL:
{% endhighlight %}

A saída será extensa:
> Pequeno trecho abaixo.

{% highlight bash %}
#define __SSP_STRONG__ 3
#define __DBL_MIN_EXP__ (-1021)
#define __UINT_LEAST16_MAX__ 0xffff
#define __FLT16_HAS_QUIET_NAN__ 1
#define __ATOMIC_ACQUIRE 2
#define __FLT128_MAX_10_EXP__ 4932
#define __FLT_MIN__ 1.17549435082228750796873653722224568e-38F
#define __GCC_IEC_559_COMPLEX 2
#define __UINT_LEAST8_TYPE__ unsigned char
#define __SIZEOF_FLOAT80__ 16
#define __INTMAX_C(c) c ## L
#define __CHAR_BIT__ 8
#define __UINT8_MAX__ 0xff
#define __SCHAR_WIDTH__ 8
#define __WINT_MAX__ 0xffffffffU
#define __FLT32_MIN_EXP__ (-125)
#define __ORDER_LITTLE_ENDIAN__ 1234
#define __SIZE_MAX__ 0xffffffffffffffffUL
#define __WCHAR_MAX__ 0x7fffffff
#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1
....
{% endhighlight %}

---

# Referências
+ <https://stackoverflow.com/questions/142508/how-do-i-check-os-with-a-preprocessor-directive>
+ <https://stackoverflow.com/questions/5919996/how-to-detect-reliably-mac-os-x-ios-linux-windows-in-c-preprocessor>
+ <https://sourceforge.net/p/predef/wiki/OperatingSystems/>



