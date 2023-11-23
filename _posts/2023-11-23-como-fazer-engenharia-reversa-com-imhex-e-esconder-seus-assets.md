---
layout: post
title: "Como Fazer Engenharia Reversa com ImHex e esconder seus assets"
date: 2023-11-23 09:24:05
image: '/assets/img/cpp/imhex.jpg'
description: 'Esconda os assets dos seus Jogos e Projetos em geral transformando em Hex!'
icon: 'ion:terminal-sharp'
iconname: 'Engenharia Reversa'
tags:
- cpp
- webhacker
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[ImHex](https://imhex.werwolv.net/) é um editor hexadecimal, escrito em [C++](https://terminalroot.com.br/tags#cpp), para engenheiros reversos, programadores e *pessoas que valorizam suas retinas quando trabalham às 3 da manhã*. 😃 

Há uma infinidade de coisas que podem ser feitas com ImHex. Nesse vídeo veremos como ele pode ser útil, por exemplo, para "*esconder*" os assets(imagens, fonts, áudios, ...) dos seus games transformando em Hex!

Como exemplo mostraremos como implementar em [Desenvolvimento de Games](https://terminalroot.com.br/tags#gamedev) mais precisamente em [SFML](https://terminalroot.com.br/tags#sfml).

---

# 💾 Como instalar o ImHex
Você pode usar pacotes binários compactados disponíveis em [Releases no repositório no GitHub do ImHex](https://github.com/WerWolv/ImHex/releases).

Há pacotes para: [Windows](https://terminalroot.com.br/tags#windows) com MSYS2, [macOS](https://terminalroot.com.br/tags#macos), Debian(serve para Ubuntu, Mint e entre outros), Arch e Fedora.

Após baixado você pode exercutar o pacote. Exemplo no [Ubuntu](https://terminalroot.com.br/tags#ubuntu):
{% highlight bash %}
wget -q https://github.com/WerWolv/ImHex/releases/download/v1.31.0/imhex-1.31.0-Ubuntu-23.04-x86_64.deb
sudo apt install ./imhex-1.31.0-Ubuntu-23.04-x86_64.deb
{% endhighlight %}

Ou você também pode compilar o ImHex do zero, que foi como eu fiz...

---

# 🚀 Como Compilar e Instalar
Antes de tudo certifique-se de possuir as dependências: 
### No [Ubuntu](https://terminalroot.com.br/tags#ubuntu), Debian, Mint:
{% highlight bash %}
apt install -y build-essential gcc-12 g++-12 lld ${PKGCONF:-} cmake ccache \
    libglfw3-dev libglm-dev libmagic-dev libmbedtls-dev libfreetype-dev \
    libdbus-1-dev libcurl4-gnutls-dev libgtk-3-dev ninja-build
{% endhighlight %}

### No Arch:
{% highlight bash %}
pacman -S $@ --needed cmake gcc lld glfw file mbedtls freetype2 dbus gtk3 curl fmt \
    yara nlohmann-json ninja
{% endhighlight %}

### No Fedora:
{% highlight bash %}
dnf install -y cmake dbus-devel file-devel freetype-devel libcurl-devel gcc-c++ git \
    mesa-libGL-devel glfw-devel lld mbedtls-devel gtk3-devel
{% endhighlight %}

### No [Gentoo](https://terminalroot.com.br/gentoo):
{% highlight bash %}
emerge -n yara mbedtls ccache nlohmann-json glfw fmt gtk
{% endhighlight %}

### No [MSYS2](https://terminalroot.com.br/tags#windows)
{% highlight bash %}
pacman -S --needed --noconfirm  \
  mingw-w64-x86_64-gcc          \
  mingw-w64-x86_64-lld          \
  mingw-w64-x86_64-cmake        \
  mingw-w64-x86_64-ccache       \
  mingw-w64-x86_64-glfw         \
  mingw-w64-x86_64-file         \
  mingw-w64-x86_64-curl-winssl  \
  mingw-w64-x86_64-mbedtls      \
  mingw-w64-x86_64-freetype     \
  mingw-w64-x86_64-dlfcn        \
  mingw-w64-x86_64-ninja        \
  mingw-w64-x86_64-capstone
{% endhighlight %}

Agora clone o repositório de forma recursiva, compile e instale com os comandos abaixo:
{% highlight bash %}
git clone --recurse-submodules https://github.com/WerWolv/ImHex
cd ImHex
mkdir build && cd build

CC=gcc CXX=g++ cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" \
       -DCMAKE_C_COMPILER_LAUNCHER=ccache -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
       -DCMAKE_C_FLAGS="-fuse-ld=lld" -DCMAKE_CXX_FLAGS="-fuse-ld=lld" \
       -DCMAKE_OBJC_COMPILER_LAUNCHER=ccache -DCMAKE_OBJCXX_COMPILER_LAUNCHER=ccache ..

sudo make install
{% endhighlight %}
> [Clique aqui para ver o caminho onde os arquivos são instalados](https://gist.github.com/terroo/5bdc66e88777cfbac312154afb954560)


Após instalação, já pode remover o repositório clonado:
{% highlight bash %}
cd ../..
rm -rf ImHex/
{% endhighlight %}

---

# 🎥 Assista ao vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/H5medsOVNl8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


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

# Códigos criados no vídeo
### 💫 [Clique aqui para ver o `img.hpp`](https://gist.github.com/terroo/d1aee0a01fd7c55b1e7de111f951bf73)
### 💫 [Clique aqui para ver o `font.hpp`](https://gist.github.com/terroo/ba8d99fe1c695ef94690f21b7471da18)
### 💻 Código C++ SFML com os `data`:
{% highlight cpp %}
#include <SFML/Graphics.hpp>
#include <cstdint>
#include <array>
#include "img.hpp"
#include "font.hpp"

int main(){
  sf::RenderWindow window(sf::VideoMode(1280,720), "SFML::Terminal Root"); 

  sf::Image img;
  img.loadFromMemory(img_data.data(), img_data.size());

  sf::Texture texture;
  texture.loadFromImage(img);

  sf::Sprite sprite(texture);

  sf::Font font;
  font.loadFromMemory(data.data(), data.size());

  sf::Text text("Terminal Root", font, 100);
  text.setFillColor(sf::Color::White);
  text.setOutlineColor(sf::Color::Black);
  text.setOutlineThickness(4);
  text.setPosition(100.f, 10.f);


  while( window.isOpen() ){
    sf::Event event;
    while( window.pollEvent(event)){
      if( event.type == sf::Event::Closed ){
        window.close();
      }
    }

    window.clear(sf::Color(55, 44, 77));
    window.draw(text);
    window.draw(sprite);
    window.display();
  }

  return EXIT_SUCCESS;
}
// g++ main.cpp -lsfml-graphics -lsfml-window -lsfml-system
{% endhighlight %}

---

# 📌 Link úteis
+ <https://imhex.werwolv.net/>
+ <https://github.com/WerWolv/ImHex>

---

+ ✅ Aprenda com C++ Moderno: <https://terminalroot.com.br/cpp>
+ ✅ Aprenda Criação de Games com C++ e SFML: <https://terminalroot.com.br/games>
+ ✅ Pacote Promocional C++: <https://terminalroot.com.br/promo>
+ ✅ Aprenda C++ e Qt: <https://terminalroot.com.br/cpp>
+ ✅ Conheça nossos Cursos: <https://bit.ly/CursosTerminalRoot>
+ 🎁 Todos os Cursos na Udemy: <https://bit.ly/UdemyTerminalRoot>


