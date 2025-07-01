---
layout: post
title: "Obtenha a Sintaxe de uma Cor Hexadecimal para o Terminal (ANSI RGB)"
date: 2025-07-01 12:36:57
image: '/assets/img/terminal/hexter-thumb.jpg'
description: "🎨 Para copiar facilmente a sintaxe e utilizar rapidamente."
icon: 'ion:terminal-sharp'
iconname: 'C++/Cli'
tags:
- cpp
- cli
- terminal
- comandos
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Eu tenho costume de criar vários aplicativos [cli](https://terminalroot.com.br/tags#cli) e [TUI](https://terminalroot.com.br/tags#tui) que usam bastante recursos de cores ANSI para o [terminal](https://terminalroot.com.br/tags#terminal). Geralmente preciso escolher a cor no [GIMP](https://terminalroot.com.br/tags#gimp) ou no [rgb-tui](https://terminalroot.com.br/2021/12/selecione-cores-no-terminal-com-rgb-tui-cpp.html) e depois montar e testar pra ver como ficará.

Pensando em automatizar essa etapa de um desenvolvimento, crie o `hexter`, pois com ele eu obtenha a sintaxe de uma cor hexadecimal para o terminal (ANSI RGB) de forma rápida e fácil.

E resolvi criar um utilitário via [linha de comando](https://terminalroot.com.br/tags#comandos) e também uma [API](https://terminalroot.com.br/tags#api) para integrar aos meus projetos. E decidi disponibiilizar para quem tiver interesse.


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
O `hexter` foi criado com [C++](https://terminalroot.com.br/tags#cpp), logo para construir e instalar você precisa ter instalado no seu sistema:
+ Um compilador C++: [GCC](https://terminalroot.com.br/tags#gcc) ou [Clang](https://terminalroot.com.br/tags#clang)
+ e também o [CMake](https://terminalroot.com.br/tags#cmake)

Depois é só clonar, construir e instalar:
{% highlight bash %}
git clone https://github.com/terroo/hexter
cd hexter
cmake . -B build
cmake --build build
sudo cmake --install build
{% endhighlight %}

---

## ⚙️ Utilização
O uso é simples e intuitivo, basta rodar o comando `hexter` e informar a cor em hexadecimal com os sem *tralha*(`#`):
> Quando usar com *tralha*, proteja a cor entre as duplas ou simples.

{% highlight bash %}
hexter '#a6e22e'
hexter fd6389
{% endhighlight %}

Se tiver um arquivo com seu [tema de cores](https://terminalroot.com.br/2024/06/top-8-melhores-temas-de-cores-para-seu-vim-neovim.html) basta fazer um loop e onter todas de uma só vez, exemplo:

{% highlight bash %}
cat theme.txt

#121212
#3a3b3f
#5f5f5f
#afafaf
#eeeeee
#ffffff
#d7d7ff
#7cdce7
#84afd7
#d7af87
#2ec27e
#fd6389

for i in $(cat theme.txt); do hexter "$i"; done
{% endhighlight %}

Saída:

![Todas as cores hexter](/assets/img/terminal/hexter-theme.jpg) 


> Esse é o [tema](https://sobrio.elvessousa.com.br/)

![sobrio](/assets/img/terminal/sobrio-theme.jpg) 

---

## 🔠 Use a API
Você também pode usar a [API](https://terminalroot.com.br/tags#api) facilmente para obter a cor hexadecimal basta incluir o cabeçalho e usar `hexter::color`, ainda há a `hexter::off` para *desligar* uma cor, exemplo:

{% highlight cpp %}
#include <print>
#include "hexter-color.hpp"

int main(){
  std::println("{}Hello, World!{}", hexter::color("#84afd7"), hexter::off);
}
{% endhighlight %}

Se quiser instalar a API para incluir mais facilmente direto no seu sistema, rode, por exemplo:
{% highlight bash %}
sudo wget -q \
  https://raw.githubusercontent.com/terroo/hexter/refs/heads/main/hexter-color.hpp \
  -O /usr/local/include/hexter-color.hpp
{% endhighlight %}
> E basta usar assim: `#include <hexter-color.hpp>`, pois é um *header-only*.

---

Para mais informações, enviar *PR* e/ou relatar *issues*, acesse o repositório: <https://github.com/terroo/hexter>.


