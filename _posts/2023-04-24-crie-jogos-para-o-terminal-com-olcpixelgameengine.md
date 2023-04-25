---
layout: post
title: "Crie Jogos para Terminal com olcPixelGameEngine"
date: 2023-04-24 20:39:52
image: '/assets/img/gamedev/olcpixelgameengine.jpg'
description: 'Disponível para Windows(Visual Studio, MinGW e Code::Blocks), macOS e GNU/Linux(via X11).'
icon: 'ion:terminal-sharp'
iconname: 'GameDev'
tags:
- cpp
- gamedev
- terminal
- windows
- macos
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

O **olcPixelGameEngine** é uma biblioteca de arquivo único para [desenvolvimento de jogos](https://terminalroot.com.br/games) criada em [C++](https://terminalroot.com.br/cpp). 

É multiplataforma, compilando no [Windows](https://terminalroot.com.br/tags#windows) via [Visual Studio](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html#23-visual-studio), [MinGW](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html) e [Code::Blocks](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html#09-codeblocks), e no [GNU/Linux](https://terminalroot.com.br/tags#gnu) com um [g++ moderno](https://terminalroot.com.br/tags#gcc).

O `olcPixelGameEngine` foi desenvolvido pelo lendário programador [C++](https://terminalroot.com.br/tags#cpp) e youtuber: [javidx9](http://youtube.com/javidx9).


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

# Como Utilizar

Em sistemas baseados em Linux precisará das seguintes dependências:
+ Compilador: [gcc/g++](https://terminalroot.com.br/tags#gcc) ou [clang](https://terminalroot.com.br/tags#clang);
+ [X11/Xorg](https://terminalroot.com.br/tags#xorg) e ter iniciado sessão com ele;
+ [OpenGL](https://terminalroot.com.br/tags#opengl)

Exemplo de instalação de dependências em algumas distros GNU/Linux:
{% highlight bash %}
# Debian, Ubuntu, Mint e similares
sudo apt install build-essential libglu1-mesa-dev libpng-dev

# Arch Linux, Manjaro e similares
sudo pacman -S gcc glibc libpng mesa

# Fedora e similares
sudo dnf groupinstall "Development Tools" "Development Libraries"
sudo dnf install gcc-c++ glew-devel glm-devel libpng-devel
{% endhighlight %}

Depois disso basta criar um código básico(para teste), copie o código exemplo abaixo:

> `main.cpp`

{% highlight cpp %}
#define OLC_PGE_APPLICATION
#include "olcPixelGameEngine.h"

class Example : public olc::PixelGameEngine {
  public:
    Example(){
      sAppName = "Example";
    }

  public:
    bool OnUserCreate() override {
      return true;
    }

    bool OnUserUpdate(float fElapsedTime) override {
      for (int x = 0; x < ScreenWidth(); x++){
        for (int y = 0; y < ScreenHeight(); y++){
          Draw(x, y, olc::Pixel(rand() % 255, rand() % 255, rand()% 255));	
        }
      }
      return true;
    }
};


int main() {
  Example demo;
  if (demo.Construct(100, 100, 4, 4)){
    demo.Start();
  }
  return EXIT_SUCCESS;
}
{% endhighlight %}

Agora faça o download do arquivo [olcPixelGameEngine.h](https://raw.githubusercontent.com/OneLoneCoder/olcPixelGameEngine/master/olcPixelGameEngine.h):
{% highlight bash %}
wget -q https://raw.githubusercontent.com/OneLoneCoder/olcPixelGameEngine/master/olcPixelGameEngine.h
{% endhighlight %}

E compile com o seguinte comando:
{% highlight bash %}
g++ main.cpp -lX11 -lGL -lpthread -lpng -lstdc++fs -std=c++17
{% endhighlight %}

Após rodar o `./a.out` se aparecer uma janela parecendo "*sem sintonia de canal em TVs antigas*" como a imagem abaixo, é porque está tudo certo!

![olcPixelGameEngine Running](/assets/img/gamedev/olc-running.png) 

---

Para rodar no [Windows](https://terminalroot.com.br/tags#windows) pelo Visual Studio veja o vídeo abaixo(Em inglês):
+ <https://www.youtube.com/watch?v=eTGSTTxR-Ss>

Para rodar no Windows com MinGW:
+ <https://www.youtube.com/watch?v=jnI1gMxtrB4>

Para rodar no Windows com Code::Blocks:
+ <https://www.youtube.com/watch?v=fLXkoR4p_G0>

## Acesse o [repositório](https://github.com/OneLoneCoder/olcPixelGameEngine) e [documentação oficial no GitHub](https://github.com/OneLoneCoder/olcPixelGameEngine/wiki).


