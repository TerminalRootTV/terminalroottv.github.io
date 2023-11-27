---
layout: post
title: "Como Rodar Assembly dentro do código C++"
date: 2023-11-27 11:07:42
image: '/assets/img/assembly/asm-cpp.jpg'
description: 'Um recursos útil para situações extremas.'
icon: 'ion:terminal-sharp'
iconname: 'Assembly/C++'
tags:
- cpp
- assembly
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

C++ é uma linguagem de programação abrangente e poderosa, mas existem poucas situações altamente especializadas que ela não consegue resolver. 

Para essas situações, [C++](https://terminalroot.com.br/tags#cpp) oferece uma opção que permite descartar um código [Assembly](https://terminalroot.com.br/tags#assembly) a qualquer momento. 

Esta opção é o uso da instrução `__asm__()` ou somente `asm()`. Ou seja, a linguagem Assembly pode ser incorporada diretamente no programa C++. 

---

# Exemplo básico de uso
Nesse exemplo nota-se que através do código Assembly:
+ Move o valor imediato `3` para o registrador `eax`
+ Move o valor imediato 6 para registrar `ebx`
+ O valor adicionado é armazenado em `sum` para saída

> `asm.cpp`
{% highlight cpp %}
#include <iostream>

int main() { 
  int sum; 
  __asm__ ( "movl $3, %%eax;"
      "movl $6, %%ebx;"
      "addl %%ebx, %%eax ":"=a"(sum)); 
  std::cout << sum << '\n'; 
  return 0; 
} 
{% endhighlight %}

Após compilar e rodar:
{% highlight bash %}
g++ asm.cpp
./a.out
{% endhighlight %}
> A saída será a soma: `9`.

Caso queira evitar o uso dos *underlines* funcionará do mesmo jeito:
{% highlight cpp %}
#include <iostream>

int main() { 
  int sum; 
  asm("movl $3, %%eax;"
      "movl $6, %%ebx;"
      "addl %%ebx, %%eax ":"=a"(sum)); 
  std::cout << sum << '\n'; 
  return 0; 
} 
{% endhighlight %}

O fato de usar assim `__asm__` é que o programador tem um maior controle dos recursos nativos do [C++](https://terminalroot.com.br/cpp).

Para mais informações acesse: <https://en.cppreference.com/w/cpp/language/asm>.

