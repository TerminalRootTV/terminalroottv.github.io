---
layout: post
title: "Como Incorporar Funções C/C++ em Lua"
date: 2022-12-06 16:23:37
image: '/assets/img/cpp/cpp-bind-lua.jpg'
description: '🔊 Nesse vídeo veremos como é muito fácil de implementarmos a API do Lua para C e criarmos nossas funções em C e C++ para usar na linguagem de programação Lua.'
icon: 'ion:terminal-sharp'
iconname: 'C/C++/Lua'
tags:
- cpp
- linguagemc
- lua
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Atualmente, é muito comum desenvolvermos partes de uma aplicação utilizando uma [linguagem de script](https://terminalroot.com.br/tags#lua) e outra parte utilizando uma [linguagem de mais baixo nível](https://terminalroot.com.br/tags#cpp) que possua um melhor desempenho.

Em 90% dos casos, a linguagem de mais baixo nível escolhida é [C](https://terminalroot.com.br/tags#linguagemc), de modo que várias linguagens de script como [Python](https://terminalroot.com.br/tags#python), [Perl](https://terminalroot.com.br/tags#perl) e [Ruby](https://terminalroot.com.br/tags#ruby) possuem alguma forma de se comunicar com C.

[Lua](https://terminalroot.com.br/tags#lua) não é diferente e disponibiliza uma [API](https://www.lua.org/pil/24.html) para que o código Lua possa se comunicar com código C e vice-versa.

Lua é uma linguagem extensível pois podemos definir funções em C e usá-las em programas Lua. Ao mesmo tempo, Lua também é uma linguagem de extensão, uma vez que é possível embutir Lua em uma aplicação C. O modelo para se comunicar com código C oferecido por Lua é baseado em uma pilha virtual, onde tanto o código C como o código Lua podem colocar e retirar valores na pilha. 

As funções que manipulam a pilha virtual possuem como parâmetro uma estrutura lua State, que armazena informações sobre o estado do programa Lua. Nenhuma informação sobre o estado é armazenada em variáveis globais, de modo que podemos ter vários lua State independentes.

Nesse vídeo veremos como é muito fácil de implementarmos a API do Lua para C e criarmos nossas funções em C e C++ para usar na linguagem de programação Lua.

---

# Assista ao vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/twpxHv47OCA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Códigos criados no vídeo

Clone o repositório com [Git](https://terminalroot.com.br/tags#git):
{% highlight bash %}
git clone https://github.com/terroo/cpp-bind-lua
cd cpp-bind-lua
g++ lua-bind.cpp -shared -fpic -llua -o terroo.so
lua main.lua
{% endhighlight %}
 

Se estiver no [Windows]() veja [nesse artigo: Como instalar Lua no Windows 10]() e também esse: [Como Instalar GCC/G++ MinGW no Windows](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html).

A extensão das bibliotecas compartilhadas è `.dll`, logo o comando para compilar seria mais ou menos:
> Informe o caminho onde está instalado os arquivo da API do Lua.

{% highlight bash %}
g++ lua-bind.cpp -shared -fpic -L C:\caminho\para\lua.h -L C:\caminho\para\lauxlib.h -o terroo.dll
{% endhighlight %}

Para mais informações acesse os links:
+ ✨ [Lua API C](https://www.lua.org/pil/24.html)
+ ✨ [Significado de extern em C++](https://terminalroot.com.br/2021/04/significado-de-extern-em-cpp.html)
+ ✨ [Como Conectar ao SQLite com Lua](https://terminalroot.com.br/2022/01/como-conectar-ao-sqlite-com-lua.html)
+ ✨ [Como instalar Lua no Windows 10](https://terminalroot.com.br/2022/07/lua-windows.html)
+ ✨ [Como Instalar GCC/G++ MinGW no Windows](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html)
+ ✨ [Crie Jogos 2D com Lua e SFML](https://www.youtube.com/watch?v=rF7QXsIc3mo)
+ ✨ [Crie Jogos para Windows, Linux e Web com Raylib C/C++](https://www.youtube.com/watch?v=LZUMVdkWWrg)
