---
layout: post
title: "Utilize C++ com Mustache"
date: 2023-11-03 17:24:57
image: '/assets/img/cpp/mustache.jpg'
description: 'Ideal para aplicativos C++ para Web!'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- web
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Mustache** é um sistema de templates web com implementações disponíveis para diversas [linguagens de programação](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html), inclusive [C++](https://terminalroot.com.br/tags#cpp).

O bigode é descrito como um sistema sem lógica porque não possui nenhuma instrução de fluxo de controle, entretanto, tanto o loop quanto a avaliação condicional podem ser obtidos usando listas de processamento de tags de seção e funções anônimas ([lambdas](https://terminalroot.com.br/2021/04/10-exemplos-de-uso-de-funcoes-lambda-em-cpp.html)).

## Recursos suportados
Esta biblioteca oferece suporte a todos os recursos atuais do Moustache:
+ Variáveis
+ Escape de HTML
+ Seções
+ Seções Invertidas
+ Verdadeiro ou Falso
+ Listas
+ Lambdas
+ Parciais
+ Comentários
+ Definir delimitador
+ Características adicionais:
> Função de escape personalizada para uso fora do HTML

---

# Instalação
A facilidade já começa na instalação, basta:
{% highlight bash %}
git clone https://github.com/kainjow/Mustache
sudo install -v Mustache/mustache.hpp /usr/local/include/
rm -rf Mustache/
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

# Utilização
Crie um arquivo: `main.cpp`:
{% highlight cpp %}
#include <iostream>
#include <mustache.hpp>

int main(){
  kainjow::mustache::mustache tmpl("Hello {{what}}!");
  std::cout << tmpl.render({"what", "World"}) << '\n';
}
{% endhighlight %}
> Alternativamente você pode usar: `using namespace kainjow::mustache;` =}

Compile:
{% highlight bash %}
g++ main.cpp
{% endhighlight %}

Rode:
{% highlight bash %}
./a.out
{% endhighlight %}
> Provável saída: `Hello World!`

Caso queira efetuar testes antes:
{% highlight bash %}
git clone https://github.com/kainjow/Mustache
cd Mustache
sed -i "s/VERSION.*/VERSION $(cmake --version | grep -o [0-9].*))/g" CMakeLists.txt
cmake -B build .
cd build && make
./tests/mustache-unit-tests
{% endhighlight %}

---

Para mais informações acesse: <https://github.com/kainjow/Mustache>.

---

Alternativas a esse Mustache:
+ <https://github.com/no1msd/mstch> ou <https://mustache.github.io/>
+ <https://pdimov.github.io/mustache/doc/html/mustache.html>
+ <https://crowcpp.org/master/guides/templating/>


