---
layout: post
title: "Como usar e pra que serve a biblioteca magic_enum"
date: 2024-07-21 10:36:52
image: '/assets/img/cppdaily/magic_enum.jpg'
description: "🪄 Ela fornece funcionalidades avançadas que não são oferecidas nativamente pela linguagem."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

No artigo sobre [std::any](https://terminalroot.com.br/2024/06/utilize-stdany-do-cpp-moderno-nos-seus-projetos.html) nós mostramos, além de outras informações, o quão pode ser complicado converter `enum` para `std::string` e entre outros tipos de operações. Nesse artigo conheceremos uma *header-only*: **magic_enum**, que pode facilitar, e muito, operações com `enum`

A biblioteca `magic_enum` é uma ferramenta útil para trabalhar com enums em [C++](https://terminalroot.com.br/tags#cpp). Ela fornece funcionalidades avançadas que não são oferecidas nativamente pela linguagem. Aqui estão alguns dos principais recursos que `magic_enum` oferece veremos nos exemplos.

---

## Implementação
Faça o download do arquivo `.hpp`:

+ Usando o [cURL](https://terminalroot.com.br/tags#curl):
{% highlight bash %}
curl -LO https://github.com/Neargye/magic_enum/raw/master/include/magic_enum/magic_enum.hpp
{% endhighlight %}
> Instale o [cURL](https://terminalroot.com.br/tags#curl), ex.: `sudo apt install curl`

+ Usando o [GNU wget](https://terminalroot.com.br/tags#wget), precisa forçar o IPv4:
{% highlight bash %}
wget -4 https://github.com/Neargye/magic_enum/raw/master/include/magic_enum/magic_enum.hpp
{% endhighlight %}

+ Ou usando [PowerShell](https://terminalroot.com.br/tags#powershell) no [Windows](https://terminalroot.com.br/tags#windows)
{% highlight bash %}
Invoke-WebRequest -Uri "https://github.com/Neargye/magic_enum/raw/master/include/magic_enum/magic_enum.hpp" -OutFile "magic_enum.hpp"
{% endhighlight %}

Adicione o `magic_enum.hpp` ao seu código:
{% highlight bash %}
#include "./magic_enum.hpp"
{% endhighlight %}

---

## Exemplos
Para nossos exemplos vamos utilizar esse `enum`:
{% highlight cpp %}
enum Color { 
  RED, 
  GREEN, 
  BLUE
};
{% endhighlight %}

1. **Conversão de Enum para String**: Permite converter valores de enum para suas representações de string correspondentes.
{% highlight cpp %}
std::string str = magic_enum::enum_name(Color::GREEN).data();
{% endhighlight %}

---

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

2. **Conversão de String para Enum**: Permite converter strings para valores de enum, se a string corresponder a um nome de valor de enum.
{% highlight cpp %}
auto color = magic_enum::enum_cast<Color>("GREEN"); 
if(color.has_value()){
 // color.value() é Color::GREEN 
}
{% endhighlight %}

3. **Iteração sobre Valores de Enum**: Permite iterar sobre todos os valores de um enum.
{% highlight cpp %}
for(auto color : magic_enum::enum_values<Color>()){
  std::cout << magic_enum::enum_name(color) << '\n';
}
{% endhighlight %}

4. **Obter Informações sobre o Enum**: Fornece funcionalidades para obter o número de valores de um enum, verificar se um valor está dentro do intervalo válido, etc.
{% highlight cpp %}
constexpr std::size_t color_count = magic_enum::enum_count<Color>(); // 3 
bool is_valid = magic_enum::enum_contains<Color>(2); // true
{% endhighlight %}

5. **Enum Indexação**: Permite obter o índice de um valor de enum e vice-versa.
{% highlight cpp %}
auto index = magic_enum::enum_index(Color::BLUE); // 2 
auto color = magic_enum::enum_value<Color>(index.value()); // Color::BLUE
{% endhighlight %}

---

A biblioteca `magic_enum` é especialmente útil quando você precisa de introspecção em enums, como para serialização, *debug*, ou geração de código onde é necessário trabalhar com os nomes dos valores dos *enums* e suas representações de string. Ela simplifica o código e elimina a necessidade de manutenção manual de mapas de `enum` para `std::string` e vice-versa.

Para mais informações acesse o [repositório no GitHub](https://github.com/Neargye/magic_enum).


