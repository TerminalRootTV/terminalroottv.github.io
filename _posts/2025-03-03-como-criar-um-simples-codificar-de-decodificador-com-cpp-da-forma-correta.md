---
layout: post
title: "Como Criar um Simples Codificar de Decodificador com C++ da forma correta"
date: 2025-03-03 13:29:40
image: '/assets/img/cppdaily/encode-decode-cpp.jpg'
description: "🚀 Melhorando o código mostrado nos vídeos curtos."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Há um tempo atrás eu havia postado no [Shorts](https://www.youtube.com/shorts/AIp14SlwrPQ), [Reels](https://www.instagram.com/p/DDvS9cRS8O8/) e [Tik Tok](https://www.tiktok.com/@terminalroot/video/7449902173179088133) um código que criava uma forma simples e rápida de codificar e decodificar *strings* que pode ser usado para inúmeras situações onde as pessoas só esperam codificadores como: [base64](https://terminalroot.com.br/2021/04/funcoes-para-gerar-base64-encode-e-decode-no-cpp.html), por exemplo.

Logo, essa maneira, dificulta um pouco mais saber qual o algoritmo para decodificar. O código [C++](https://terminalroot.com.br/tags#cpp) se resumia ao conteúdo abaixo:


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

{% highlight cpp %}
#include <iostream>

constexpr auto encode = [](auto S){
  while((*S++)++);
};

constexpr auto decode = [](auto S){
  while(--(*S++));
};

int main(int argc, char **argv){
  std::string str {};
  if(argc > 1){
    str = argv[1];
  }else{ return EXIT_FAILURE;}

  encode(str.data());
  std::cout << "Encode: " << str << '\n';
  
  decode(str.data());
  std::cout << "Decode: " << str << '\n';

  return EXIT_SUCCESS;
}
{% endhighlight %}

Apesar de funcionar, **esse código possui alguns problemas**:
+ O ideal não é usar `constexpr`, estamos modificando o [ponteiro](https://terminalroot.com.br/2022/08/entenda-ponteiros-inteligentes-em-cpp-smart-pointers.html) da *string*, tornar a função do tipo `void` é o mais lógico;
+ A função `encode` não faz verificação de *final de linha* e isso resulta em um problema grave que causa corrupção de memória.

Eu percebi isso quando fui implementar em uma solução que estava criando, onde eu só copiei o código gerado pela função `encode` e fui usar em um aplicativo e quando tentei rodar apareceu a seguinte falha:
{% highlight txt %}
*** stack smashing detected ***: terminated
Abortado (imagem do núcleo gravada)
{% endhighlight %}

Logo, o código corrigido fica assim:

{% highlight cpp %}
#include <iostream>
#include <string>

void encode(char * s) {
  while (*s != '\0') {   // Verifica o fim da string
    ++(*s);              // Incrementa o caractere atual
    ++s;                 // Avança para o próximo caractere
  }
}

void decode(char * s) {
  while (*s != '\0') {   // Verifica o fim da string
    --(*s);              // Decrementa o caractere atual
    ++s;                 // Avança para o próximo caractere
  }
}

int main(int argc, char **argv) {
  if (argc > 1) {
    std::string str = argv[1];

    encode(str.data());
    std::cout << "Encode: " << str << '\n';

    decode(str.data());
    std::cout << "Decode: " << str << '\n';
  }

  return EXIT_SUCCESS;
}
{% endhighlight %}
Agora se você copiar o resultado codificado poderá usá-lo para decodificar em outra implementação sem chance de ter um *stack smashing*.

Para confirmar isso você pode usar [flags](https://terminalroot.com.br/2023/08/10-dicas-de-flags-e-parametros-para-gnu-gcc.html) que verificam se houve violação de memória, exemplo:
{% highlight bash %}
g++ -g -Wpedantic -Wall -Werror -fsanitize=address encode.cpp
{% endhighlight %}

Após rodar, exemplo:
{% highlight bash %}
./a.out "Terminal Root"
Encode: Ufsnjobm!Sppu
Decode: Terminal Root
{% endhighlight %}

---

Se quiser dificultar ainda mais, você pode usar `loops` para rodar a função quantas vezes você quiser e usar o mesmo número de vezes para decodificar, exemplo do que estou falando sem *loops*:

Isso, modifica 4 vezes a string e usamos 4 vezes novamente para retonar a string original:

{% highlight cpp %}
encode(str.data());
encode(str.data());
encode(str.data());
encode(str.data());
std::cout << "Encode: " << str << '\n';

decode(str.data());
decode(str.data());
decode(str.data());
decode(str.data());
std::cout << "Decode: " << str << '\n';
{% endhighlight %}

Ou usando o um *loop* `for`:
{% highlight cpp %}
for(int i = {}; i < 4; ++i){
  encode(str.data());
}
std::cout << "Encode: " << str << '\n';

for(int i = {}; i < 4; ++i){
  decode(str.data());
}
std::cout << "Decode: " << str << '\n';
{% endhighlight %}

Em ambos os casos a saída será a mesma:
{% highlight bash %}
./a.out "Terminal Root"
Encode: Xivqmrep$Vssx
Decode: Terminal Root
{% endhighlight %}

---

Como funciona?
- **Encode**: Cada caractere da string é incrementado em **1**. Por exemplo:
  - 'T' -> 'U'
  - 'e' -> 'f'
  - 'r' -> 's'
  - etc.
- **Decode**: Cada caractere da string é decrementado em **1**, revertendo a operação do `encode`. Por exemplo:
  - 'U' -> 'T'
  - 'f' -> 'e'
  - 's' -> 'r'
  - etc.

---

Para mais informações sugiro os links:
+ <https://cplusplus.com/reference/string/string/>
+ <https://learn.microsoft.com/en-us/cpp/cpp/lambda-expressions-in-cpp?view=msvc-170>
+ <https://github.com/isocpp/CppCoreGuidelines>

