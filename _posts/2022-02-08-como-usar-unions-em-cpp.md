---
layout: post
title: "Como usar Unions em C++ ?"
date: 2022-02-08 10:37:19
image: '/assets/img/cpp/unions-vs-structs.jpg'
description: 'Economizar espaço na memória nunca é demais! 😃'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

# O que é uma Union?
Um `union` é parecida com uma `struct`, a diferença é que a Union reaproveita o espaço para o próximo tipo dado dentro dela, já a Struct adiciona à um novo bloco.

Declaração de uma Union:
{% highlight cpp %}
union Nome {
  // conteúdo
};
{% endhighlight %}

Ela também é similar às classes, mas além da diferença de reaproveitamento, assim como as Structs, a Union não precisa de `public` para acessar os dados, já nas classes se você não informar serão `private` por padrão.

---

# Exemplos
Vamos supôr que você possui esse código que armazena dados de um determinado produto:
{% highlight cpp %}
#include <iostream>

union Produto {
  int id;
  double value;
};

int main( int argc , char **argv ){
  Produto p;
  p.id = 9;
  std::cout << p.id << '\n';
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

Se você compilar o código acima, perceba que a saída será justamente o `id` que atribuímos: `9` .

Mas agora vamos também atribuir dado para o `value` e imprimir:
{% highlight cpp %}
#include <iostream>

union Produto {
  int id;
  double value;
};

int main( int argc , char **argv ){
  Produto p;
  p.id = 9;
  p.value = 1.542;
  std::cout << p.id << '\n';
  std::cout << p.value << '\n';
  return 0;
}
{% endhighlight %}
> Saída:
{% highlight sh %}
824633721
1.542
{% endhighlight %}

Perceba que o `value` a saída foi correta, mas o `id` se transformou em um número estranho.

Note também que se você usar esse mesmo código com `struct` isso não ocorrerá, exemplo:
{% highlight cpp %}
#include <iostream>

struct Produto { // alteramos para struct
  int id;
  double value;
};

int main( int argc , char **argv ){
  Produto p;
  p.id = 9;
  p.value = 1.542;
  std::cout << p.id << '\n';
  std::cout << p.value << '\n';
  return 0;
}
{% endhighlight %}
> Saída:
{% highlight sh %}
9
1.542
{% endhighlight %}

Por quê ???

Como havía dito o `union` reaproveita o espaço, ou seja, o `int`(4 bytes) é menor que o `double`(8 bytes), logo, aquele espaço reaproveitado vira um *Lixo de Memória* .

Vamos ilustar somente por fins didáticos:

---

Em um `union` o espaço do `int` é reaproveitado e ele escreve o `double`:
![Union](/assets/img/cpp/union.jpg) 


---

Já numa `struct` ele mantém aquele espaço do `int` e cria um novo para o `double`
![Struct](/assets/img/cpp/struct.jpg) 


---

Se você inverter as ordens de definição isso não ocorrerá porque o `int` é menor que o `double` .

Unions foram criados justamente para economizar espaço na memória, mas os programadores obtiveram um *vício de escrita* e usam mais comumente as Structs.

No então, em código de alguns programadores que se preocupam muito com otimização você encontrará mais Unions que Structs .

Quer aprender C++? Então, acesse: <https://terminalroot.com.br/cpp> . 

---

# Links Úteis
+ <https://en.cppreference.com/w/cpp/language/union>
+ <https://docs.microsoft.com/en-us/cpp/cpp/unions?view=msvc-170>
+ <https://stackoverflow.com/questions/2310483/purpose-of-unions-in-c-and-c>

