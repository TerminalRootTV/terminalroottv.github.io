---
layout: post
title: "Automatize Projetos SFML com Pro++"
date: 2025-04-09 13:02:13
image: '/assets/img/terlang/pro++.jpg'
description: "🚀 Da série C++ com Shell Script, um comando que economiza tempo."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
- sfml
- terlang
- cli
- comandos
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Já faz um tempo que fico fazendo muitas coisas com [SFML](https://terminalroot.com.br/sfml) como testes para o [game](https://terminalroot.com.br/tags#gamedev) que estou desenvolvendo, além de animações, testes, ... e entre outras coisas.

E cansado de criar projetos do zero, eu criei um [comando](https://terminalroot.com.br/tags#comandos) que automatiza a criação de projetos [SFML](https://terminalroot.com.br/tags#sfml) e [C++](https://terminalroot.com.br/tags#cpp).

Trata-se de um código básico que por enquanto só serve para SFML mesmo, mas futuramente pretendo ampliá-lo para vários tipos de bibliotecas, exemplos: [Raylib](https://terminalroot.com.br/tags#raylib), [OpenGL](https://terminalroot.com.br/tags#opengl)(com **GLFW**), [Dear ImGui](https://terminalroot.com.br/tags#imgui)(with *OpenGL* com *GLFW*), [SDL](https://terminalroot.com.br/tags#sdl)(`2` e `3`), [SFML3](https://www.reddit.com/r/sfml/comments/1hjhs2n/sfml_300_released/) e entre outras.


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

## Compilar e instalar
> A dependência opcional é [Terlang](https://github.com/terroo/terlang) para compilar e instalar, mas você pode compilar e instalar manualmente, se desejar.

Faça o download, descompacte, entre no `pro++/`, compile e instale:
{% highlight bash %}
wget https://terminalroot.com.br/downs/pro++.zip
unzip pro++.zip
cd pro++
ter build.ter
ter install.ter
{% endhighlight %}

---

## Uso
Para criar seu projeto, basta roda o comando e informar o nome do Projeto/Classe que você deseja como parâmetro(se Houver espaços no nome, use aspas para indicá-lo), e em seguida entre e compile com [Terlang](https::github.com/terroo/terlang):
{% highlight bash %}
pro++ "Meu Projeto"
cd MeuProjeto
ter build.ter
{% endhighlight %}

Nesse caso irá criar o diretório e arquivos:
{% highlight bash %}
MyProject
├── build.ter
├── main.cpp
├── meu-projeto.cpp
└── meu-projeto.hpp
{% endhighlight %}
> O projeto após compilado, rodará automáticamente o binário.

---

> Se desejar desinstalar: `sudo rm /usr/local/bin/pro++`.


