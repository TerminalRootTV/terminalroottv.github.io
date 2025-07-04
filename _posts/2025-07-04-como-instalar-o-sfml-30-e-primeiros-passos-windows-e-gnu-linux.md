---
layout: post
title: "Como Instalar o SFML 3.0 e Primeiros Passos (Windows e GNU/Linux)"
date: 2025-07-04 08:43:44
image: '/assets/img/sfml/sfml3.jpg'
description: "☕ Nesse vídeo mostramos todas as novidades do SFML 3 bem como instalar e utilizar no Windows e no Ubuntu."
icon: 'ion:terminal-sharp'
iconname: 'SFML'
tags:
- sfml
- gamedev
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

☕ Nesse vídeo mostramos todas as novidades do **[SFML](https://terminalroot.com.br/sfml) 3** bem como instalar e utilizar no [Windows](https://terminalroot.com.br/tags#windows) e no Ubuntu.


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

## ▶️ Assista ao Vídeo

<iframe width="1271" height="715" src="https://www.youtube.com/embed/UTbMIE5Qrlg" title="Como Instalar o SFML 3.0 e Primeiros Passos (Windows e GNU/Linux)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

---

## ✳️ Códigos e links citados no vídeo

### Lançamento do SFML 3.0.0
#### <https://github.com/SFML/SFML/releases/tag/3.0.0>

+ Download: <https://www.sfml-dev.org/download/sfml/3.0.0/>
+ Atualizar o Visual Studio: <https://learn.microsoft.com/en-us/visualstudio/install/update-visual-studio?view=vs-2022>

### Código básico SFML 3.0

{% highlight cpp %}
#include <SFML/Graphics.hpp>

int main(){
  sf::RenderWindow window(sf::VideoMode({800, 450}, 24), "SFML 3.0");

  while(window.isOpen()){
    while(const std::optional event = window.pollEvent()){
      if(event->is<sf::Event::Closed>()){
        window.close();
      }else if (const auto* keyPressed = event->getIf<sf::Event::KeyPressed>()){
        if(keyPressed->scancode == sf::Keyboard::Scancode::Escape)
          window.close();
      }
    }

    window.clear(sf::Color::Red);
    window.display();
  }
}
{% endhighlight %}

Compilar:

{% highlight bash %}
g++ -std=c++20 -DSFML_STATIC -I SFML-3.0.0/include -L SFML-3.0.0/lib main-sfml3.cpp -lsfml-graphics-s -lsfml-window-s -lsfml-system-s -lX11 -lXrandr -lXcursor -lXrender -lXext -lGL -lfreetype -ludev -lpthread -ldl -lm -lXi
{% endhighlight %}


Dependências caso você queira compilar da fonte: em distros GNU/Linux
> Exemplo no Arch

{% highlight bash %}
sudo pacman -S \
  freetype2 \
  libx11 \
  libxrandr \
  libxcursor \
  libxi \
  libudev \
  mesa \
  flac \
  libvorbis \
  libogg \
  openal \
  glew \
  pthreads
{% endhighlight %}
> Em outras distros procure nomes de pacotes similares, no Ubuntu mesmo geralmente só possui o -dev no final do nome do pacote.

### Utilizar com `pkg-config`

Include:
{% highlight bash %}
cd SFML-3.0.0
sudo mv SFML /usr/local/include/SFML3
{% endhighlight %}

> `sfml3.pc`

{% highlight pc %}
prefix=/usr/local/include/SFML3
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: sfml3
Description: SFML 3 static
Version: 3.0.0
Cflags: -I${includedir} -DSFML_STATIC
Libs: -L${libdir} -lsfml-graphics-s -lsfml-window-s -lsfml-system-s -lX11 -lXrandr -lXcursor -lXrender -lXext -lGL -lfreetype -ludev -lpthread -ldl -lm -lXi
{% endhighlight %}

Compilar:

{% highlight bash %}
g++ -std=c++20 main.cpp $(pkg-config --cflags --libs sfml3)
{% endhighlight %}

LSP:
{% highlight bash %}
-I/usr/local/include/SFML3/include
{% endhighlight %}

---

## Links Úteis
+ 👑 Aprenda a criar sua própria linguagem de programação: <https://terminalroot.com.br/mylang>
+ ✅ Aprenda Criação de Games com C++ e SFML: <https://terminalroot.com.br/sfml>
+ ✅ Pacote Promocional C++: <https://terminalroot.com.br/promo>
+ ✅ Aprenda C++ e Qt: <https://terminalroot.com.br/cpp>
+ ✅ Conheça nossos Cursos: <https://bit.ly/CursosTerminalRoot>
+ 🎁 Todos os Cursos na Udemy: <https://bit.ly/UdemyTerminalRoot>


