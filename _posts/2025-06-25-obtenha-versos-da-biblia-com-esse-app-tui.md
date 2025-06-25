---
layout: post
title: "Obtenha Versos da Bíblia com esse App TUI"
date: 2025-06-25 19:57:59
image: '/assets/img/tui/bible-tui-thumb.png'
description: "🙏 `bible-tui` é um utilitário via linha de comando feito com C++"
icon: 'ion:terminal-sharp'
iconname: 'C++/TUI'
tags:
- cpp
- tui
- cli
- terminal
- comandos
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

`bible-tui` é um utilitário de linha de comando que exibe versículos dinâmicos ou selecionados da Bíblia com diferentes molduras e temas de cores. 

Feito com [C++20](https://terminalroot.com.br/tags#cpp) e disponível para os idiomas: Inglês e **Português**.


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

## 📥 Instalação 
📦 Dependências
+ C++ Compiler: [GCC](https://gcc.gnu.org/) or [Clang](https://clang.llvm.org/)
+ [CMake](https://cmake.org/)
+ [cURL++](https://www.curlpp.org/)

Example no Ubuntu:
{% highlight sh %}
sudo apt install build-essential cmake libcurlpp-dev
{% endhighlight %}

🚧 Construa e instale
{% highlight bash %}
git clone https://github.com/terroo/bible-tui
cd bible-tui
cmake . -B build
cmake --build build
sudo cmake --install build
{% endhighlight %}

---

## 💼 Exemplos de uso

As saídas dos exemplos das imagens estão em inglês, mas o `bible-tui` detecta automaticamente o idioma do seu sistema, além de você também poder usar o argumento:
+ `bible-tui --lang=pt` para Português

![Examples](/assets/img/tui/en-blible-tui.png) 

---

Para mais informações use: `bible-tui --help`

{% highlight bash %}
Usage:
bible-tui [options]

Options:
  --lang=pt|en                        Set the language.
  --theme=real|lolcat|atom|style      Set the color theme.
  --mold=default|double|rounded|empty Set the border style.
  --book=name:num-num                 Set the book and verse.
                                         Examples:
                                           [EN]psalms:23-1 | [PT]salmos:23-1
  --help, -h                          Show this message.
  --version, -v                       Show version info.

{% endhighlight %}

---

Visite o repositório e deixe sua estrela ⭐: <https://github.com/terroo/bible-tui>


![Bible TUI](/assets/img/tui/bible-tui.jpg) 


