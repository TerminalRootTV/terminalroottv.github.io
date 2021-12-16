---
layout: post
title: "10 Exemplos de uso de string_view em C++"
date: 2021-12-16 17:21:07
image: '/assets/img/cpp/string_view.jpg'
description: 'E mais 2 exemplos de códigos prontos como implementação.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![10 Exemplos de uso de string_view em C++](/assets/img/cpp/string_view.jpg)

---

`std::string_view` é uma classe de nome `basic_string_view` que utiliza char e `std::char_traits` , ambos como template.

Ela está disponível somente a partir do C++17 e precisa incluir o cabeçalho `string_view` . Pode ser implementada também para letras acentudas(`std::wstring_view`), unicode 8(`std::u8string_view`), 16(`std::u16string_view`, C++20) e 32(`std::u32string_view`) .  

Ela praticamente cria um vector de caracteres para uma string .
> Cada caractere é um índice:

| T | e | r | m | i | n | a | l |   | R | o | o | t |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 |


É muito utilizada em códigos que fazem parser. 

Vamos ver 10 exemplos de utilizá-la!


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

# 01. Uso básico, declarando, inicializando e imprimindo uma `string_view`
{% highlight cpp %}
std::string_view sv {"Terminal Root"};
std::cout << sv << '\n';
{% endhighlight %}

# 02. Imprimir somente o 3º(terceiro caractere)
{% highlight cpp %}
std::cout << sv[3] << '\n'; // m
{% endhighlight %}

# 03. Obter o tamanho da `string_view`
{% highlight cpp %}
std::cout << sv.size() << '\n'; // 13
{% endhighlight %}

# 04. Imprimir o último caractere
{% highlight cpp %}
std::cout << sv.back() << '\n'; // t
{% endhighlight %}

# 05. Saber a posição do caractere `'a'`
{% highlight cpp %}
std::cout << sv.find("i") << '\n'; // 4
{% endhighlight %}

# 06. Saber a posição de trás para frente
{% highlight cpp %}
std::cout << sv.rfind("o") << '\n'; // 11
{% endhighlight %}
> Seria o 1º 'o' de trás para frente, o `find()` daria 10 . Outra observação é se você informar um caractere que não existe, dará *garbage*(`string::npos`, um número *esquisito*).

# 07. Verificar se existe o caractere `'X'`
{% highlight cpp %}
std::cout << sv.find("X") << '\n'; // 11
{% endhighlight %}

# 08. Imprimir do 9º ao 13º caractere
{% highlight cpp %}
std::cout << sv.substr(9, 13) << '\n'; // Root
{% endhighlight %}

# 09. Remover os 4 últimos caracteres
{% highlight cpp %}
sv.remove_suffix(4);
std::cout << sv << '\n'; // Terminal
{% endhighlight %}

# 10. Remover os 8 primeiros caracteres
{% highlight cpp %}
sv.remove_prefix(8);
std::cout << sv << '\n'; // ' Root'
{% endhighlight %}

---

# Bônus
É possível também usar `string_view_literals` adicionando o termo `sv` ao final, exemplo de código com *literal*:
{% highlight cpp %}
#include <iostream>
#include <string_view>

using namespace std::string_view_literals;

int main(){
  auto literal = "Terminal Root"sv;
  std::cout << literal << '\n';
  return 0;
}
{% endhighlight %}


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

---

Exemplo de um código pronto:
{% highlight cpp %}
#include <iostream>
#include <string_view>
 
int main() {
    constexpr std::string_view unicode[] {
        "▀▄─", "▄▀─", "▀─▄", "▄─▀"
    };
 
    for (int y{}, p{}; y != 6; ++y, p = ((p + 1) % 4)) {
        for (int x{}; x != 16; ++x)
            std::cout << unicode[p];
        std::cout << '\n';
    }
}
{% endhighlight %}
> Saída:

{% highlight sh %}
▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─
▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─
▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄
▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀
▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─▀▄─
▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─▄▀─
{% endhighlight %}

Algumas outras funções só estão disponíveis no **C++20** ou **C++23**, exemplos: `contains()`, `starts_with()` e outros.

Para mais informações acesse: <https://en.cppreference.com/w/cpp/string/basic_string_view> .



