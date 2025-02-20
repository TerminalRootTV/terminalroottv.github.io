---
layout: post
title: "Conheça o comando kat"
date: 2025-02-20 08:05:59
image: '/assets/img/comandos/kat-thumb-800.png'
description: "🚀 Um cat com syntax highlight"
icon: 'ion:terminal-sharp'
iconname: 'Comando/Terminal'
tags:
- cpp
- comandos
- terminal
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Eu criei esse comando: `kat` baseado no [GNU cat](https://www.gnu.org/software/coreutils/manual/html_node/cat-invocation.html#cat-invocation), mas com destaque de sintaxe. Ele foi feito com [C++](https://terminalroot.com.br/tags#cpp).

Classifiquei ele como:
 
"**Um comando cat, mas quase com gosto de chocolate**"(slogan)
> Uma referência ao chocolate *KitKat*! E *quase* porque não tem o ~~Kit~~ 😃 

O comando `kat` ainda está em desenvolvimento, logo, nem todas as sintaxes estão disponíveis, ao final desse artigo há as que já estão e as que ainda serão implementadas, além de outros recursos que desejo implementar.

Já faz tempo que eu criei, mas agora eu decidi disponbilizar para quem quiser usar. Ele é baseado em outros comandos similares que eu havia visto, mas não me agradavam tanto e eu precisava que fossse:
+ **Simples**
+ **Veloz**
+ **Bonito**
+ e **básico**.

Os outros comandos similares faltavam alguma coisa, tais como: [source-highlight](https://www.gnu.org/software/src-highlite/)(*também feito com C++, mas visual não muito agradável*), `Theldus/kat`(feito em [C](https://terminalroot.com.br/tags#linguagemc), mas o visual também não me agradava), *bat*(no início feito com [Go/Golang](https://terminalroot.com.br/tags#go), antigamente ele era até veloz, mas depois foi reescrito em outra linguagem e ficou muito lento, além de ter recursos demais para um comando cat), [highlight](https://gitlab.com/saalen/highlight)(*feito com [Lua](https://terminalroot.com.br/tags#lua) e [C++](https://terminalroot.com.br/tags#cpp), também está além de um simples comando cat, tem muitos outros recursos*).

O `Theldus/kat` também já fez uma comparação com o `bat`(muito lento) e `cat`. O `terroo/kat` está na mesma linha de desempenho, ou seja, como se trata de um utilitário imediato, precisa ser rápido:

![performance kat](https://camo.githubusercontent.com/9bc88617aaf09024725e6bd1c11858844d75508774fe3123d343b604c9281fc9/68747470733a2f2f692e696d6775722e636f6d2f484a48465250642e706e67) 

Enfim, me restou criar minha própria solução!


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

## Como instalar o `kat`?
O `kat`, no momento, só está disponível para sistemas [estilo UNIX](https://terminalroot.com.br/tags#unix). Então, para compilar antes você precisa de alguns dependências, que são:

+ Um compilador C++: [GNU GCC](https://gcc.gnu.org/) ou [Clang LLVM](https://clang.llvm.org/)
+ [Boost.Regex](https://www.boost.org/doc/libs/1_87_0/libs/regex/)
+ [CMake](https://cmake.org/)

Você pode usar o gerenciador de pacotes do seu sistema e instalar, por exemplo, no [Ubuntu](https://terminalroot.com.br/tags#ubuntu):
{% highlight bash %}
sudo apt update
sudo apt install build-essential cmake libboost-regex-dev
{% endhighlight %}

Depois é só clonar, construir e instalar:
{% highlight bash %}
git clone http://github.com/terroo/kat build-kat
cd build-kat
cmake -B build .
cmake --build build
sudo cmake --install build
{% endhighlight %}
> Após instalado já pode remover o diretório clonado: `cd .. && rm -rf build-kat`.

---

## Como utilizar o `kat`?
Assim como você utiliza o `cat`, a diferença é que ele já possui numeração das linhas, logo, nem precisa de um parâmetro adicional, exemplos:

{% highlight bash %}
kat main.cpp # C++
kat main.c # C
kat MyClass.java # Java
kat script.py # Python
kat index.js # JavaScript
kat Main.cs # C#
kat.txt # Text
{% endhighlight %}

A saída similar será como na imagem abaixo:

![kat C++ example](/assets/img/comandos/kat-command-example.png) 

Como eu havia dito, não há muitos parâmetros disponíveis, quem usa todos os parâmetros do `cat`, por exemplo? Acho que o máximo que eu usei na minha vida foi o `-n` pra ver o número das linhas.. 😃 

Logo, para ver o `help` do `kat`, basta rodar:
{% highlight bash %}
kat --help
{% endhighlight %}
> Você vai se impressionar com a quantidade de parâmetros!!! 🤣 

---

Como eu havia dito, ainda está em desenvolvimento, então, as linguagens e formatos que possuem o **✔** estão disponíveis e as que possuem o **✖**  ainda serão implementadas.

Mas, caso você queira agilizar a implementação de alguma, envie um [issueis](https://github.com/terroo/kat/issues) no [repositório do kat](https://github.com/terroo/kat).



+ ✔ [C++](https://terminalroot.com.br/tags#cpp)
+ ✔ [C](https://terminalroot.com.br/tags#linguagemc)
+ ✔ [Java](https://terminalroot.com.br/tags#java)
+ ✔ [Python](https://terminalroot.com.br/tags#python)
+ ✔ [JavaScript](https://terminalroot.com.br/tags#javascript)
+ ✔ [C#](https://terminalroot.com.br/tags#csharp)
+ ✖ HTML
+ ✖ Markdown
+ ✖ CSS
+ ✖ JSON
+ ✖ YAML
+ ✖ XML
+ ✖ Go
+ ✖ Swift
+ ✖ Lua
+ ✖ GNU Assembler
+ ✖ Assembly Intel(NASM)
+ ✖ GNU Bash
+ ✖ Power Shell
> Além de implementar também no futuro: Ruby, PHP, Elixir, Perl, Zig, Rust, Erlang, Haskell e entre outros.

Espero que você goste do `kat`, ahhh... deixa um **✰** lá no repositório! 😎 


