---
layout: post
title: "Conheça o C++ Ortodoxo"
date: 2023-07-04 10:59:42
image: '/assets/img/cpp/ortodoxo.jpg'
description: 'Um C++ anti-moderno!'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Quem nunca teve o (des)prazer de ler em alguma *mídia social* algum "idoso" dizer: **Na minha época...**.
> Mas, na época dele, os idosos não ficavam nas mídias sociais! 😃 

Pois é! O **Ortodoxo C++** é uma forma de escrever que diz que "*antigamente era melhor*"! 😮 , ou quase isso. Trata-se de *ignorar* todos os novos recursos do [C++](https://terminalroot.com.br/tags#cpp) e escrevê-lo de forma: NEANDERTAL!

O C++ como todos nós sabem é um *super conjunto* da [Linguagem C](https://terminalroot.com.br/tags#linguagemc), mas isso só antigamente! Pois, nos dias atuais, nem tudo que é do C funciona em C++.

Mas, na maioria dos casos(99,5% das vezes) se você escrever um código em C e usar o compilar do C++, funcionará normalmente!

Em resumo, isso é um C++ Ortodoxo:
{% highlight cpp %}
#include <stdio.h>
#define TAM 4

int main(){
  char * frutas[TAM] = {"Laranja", "Melão", "Maçã", "Banana"};
  for (int i = 0; i < TAM; ++i)
  {
    printf("%s\n", frutas[i]);
  }
  return 0;
}
{% endhighlight %}

O código equivalente ao de cima, mas com C++ Moderno, seria:
{% highlight cpp %}
#include <iostream>
#include <array>

auto main() -> int {
  std::array<std::string, 4> frutas {"Laranja", "Melão", "Maçã", "Banana"};
  for(auto &f : frutas){
    std::cout << f << '\n';
  }
  return EXIT_SUCCESS;
}
{% endhighlight %}

O problema é que o primeiro código, o ortodoxo, não compila mais sem *Warnings*, mesmo você usando o [C++ de 1998](https://www.wikidata.org/wiki/Q764453). A saída possívelmente será isso:
{% highlight bash %}
g++ -std=c++98 main.cpp
main.c: In function ‘int main()’:
main.c:5:25: warning: deprecated conversion from string constant to ‘char*’ [-Wwrite-strings]
    5 |   char * frutas[TAM] = {"Laranja", "Melão", "Maçã", "Banana"};
      |                         ^~~~~~~~~
main.c:5:36: warning: deprecated conversion from string constant to ‘char*’ [-Wwrite-strings]
    5 |   char * frutas[TAM] = {"Laranja", "Melão", "Maçã", "Banana"};
      |                                    ^~~~~~~
main.c:5:45: warning: deprecated conversion from string constant to ‘char*’ [-Wwrite-strings]
    5 |   char * frutas[TAM] = {"Laranja", "Melão", "Maçã", "Banana"};
      |                                             ^~~~~~
main.c:5:53: warning: deprecated conversion from string constant to ‘char*’ [-Wwrite-strings]
    5 |   char * frutas[TAM] = {"Laranja", "Melão", "Maçã", "Banana"};

{% endhighlight %}
> Ainda que você utilize a extensão `.c`!

Mas, mesmo assim, existe a (re)volta dos que não foram!

---

# O que é C++ Ortodoxo?
Em outras palavras, o C++ Ortodoxo, em resumo é escrever C++ como C antigo. Ou pela própria definição dos seus seguidores seria:

> O C++ ortodoxo (às vezes referido como **C+**, um + só) é um subconjunto mínimo do C++ que melhora o C, mas evita todas as coisas desnecessárias do chamado [C++ Moderno](https://terminalroot.com.br/2023/05/como-fazer-parser-de-csv-com-cpp-moderno.html). É exatamente o oposto do que o C++ moderno supõe ser.

---

# Por que ser contra o C++ Moderno?
Segundo seus próprios seguidores:

> No final de 1990, também éramos hipsters C++ modernos e usávamos os recursos mais recentes. Dissemos a todos que também deveriam usar esses recursos. Com o tempo, aprendemos que é desnecessário usar alguns recursos de linguagem apenas porque eles estão lá, ou recursos que usamos provaram ser ruins (como RTTI, exceções e fluxos), ou saiu pela culatra por complexidade de código desnecessária. Se você acha que isso é um absurdo, espere mais alguns anos e você vai odiar o Modern C++ também ("Por que não passo mais tempo com o Modern C++" artigo arquivado do LinkedIn).
> 
> *Por que usar C++ ortodoxo?*
> 
> A base de código escrita com as limitações do C++ ortodoxo será mais fácil de entender, mais simples e será construída com compiladores mais antigos. Os projetos escritos no subconjunto C++ ortodoxo serão mais aceitáveis por outros projetos C++ porque é improvável que o subconjunto usado pelo C++ ortodoxo viole as preferências do subconjunto C++ do adotante.

---

# O que você deve usar?
Você pode ter muitas críticas às "novas linguagens de programação"(a maioria são front-end para C/C++), mas deixar de usar os novos recursos das linguagens já consolidadas no mercado é no mínimo: loucura!

Usar esses conceitos como "filosofia" ou diversão é um ponto válido sim, mas usar e compartilhar o obsoleto é um tipo de insanidade!

Eu recomendo você criar seu código de forma mais moderna possível. Nem o C de hoje é mais o mesmo de antes, o **C Moderno** tem diversas atualizações e muitas delas foram herdadas do C++.

Para mais informações veja mais detalhes [aqui](https://gist.github.com/bkaradzic/2e39896bc7d8c34e042b).

Fui!



