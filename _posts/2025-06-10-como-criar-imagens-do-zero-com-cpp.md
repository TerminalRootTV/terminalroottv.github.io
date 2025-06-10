---
layout: post
title: "Como Criar Imagens do Zero com C++"
date: 2025-06-10 20:08:53
image: '/assets/img/multimidia/ppm-cpp.jpg'
description: "👧 Nesse vídeo criamos imagens .ppm do zero com C++ sem bibliotecas!"
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nesse vídeo criamos imagens do zero com [C++](https://terminalroot.com.br/tags#cpp) sem bibliotecas!

Links da Wikipedia sobre formato de imagens:
+ [JPEG](https://en.wikipedia.org/wiki/JPEG#JPEG_codec_example)
+ [PNG](https://en.wikipedia.org/wiki/PNG#File_format)
+ [Bitmap](https://en.wikipedia.org/wiki/BMP_file_format)
+ [Netpbm]() formato que usamos!

---

## 🎥 Assista ao Vídeo

<iframe width="1280" height="720" src="https://www.youtube.com/embed/u5UDSo6J4rk" title="Como Criar Imagens do Zero com C++" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


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

## 📰 Códigos criado no vídeo
> `color.cpp`    

{% highlight cpp %}
#include <iostream>
#include <fstream>

int main(){
  std::ofstream image("image.ppm");
  const int width = 800, height = 450;

  if(image.is_open()){
    image << "P3\n";
    image << width << " " << height << '\n';
    image << "255\n";

    for(int y = 0; y < height; ++y){
      for(int x = 0; x < width; ++x){
        image << "214 5 175 ";
      }
      image << '\n';
    }

    image.close();
  }
}
{% endhighlight %}

> `rect.cpp` 

{% highlight cpp %}
#include <iostream>
#include <fstream>

int main(){
  std::ofstream image("image.ppm");
  const int width = 800, height = 450;
  const int rectX = 45, rectY = 45, rectW = width - 100, rectH = height - 100;

  if(image.is_open()){
    image << "P3\n";
    image << width << " " << height << '\n';
    image << "255\n";

    for(int y = 0; y < height; ++y){
      for(int x = 0; x < width; ++x){
        if(x >= rectX && x < rectX + rectW && 
           y >= rectY && y < rectY + rectH){
          image << "214 5 175 ";
        }else{
          image << "253 204 59 ";
        }
      }
      image << '\n';
    }

    image.close();
  }
}
{% endhighlight %}

> `circle.cpp`

{% highlight cpp %}
#include <iostream>
#include <fstream>

int main(){
  std::ofstream image("image.ppm");
  const int width = 800, height = 450;

  const int centerX = width / 2;
  const int centerY = height / 2;
  const int radius = 80;

  if(image.is_open()){
    image << "P3\n";
    image << width << " " << height << '\n';
    image << "255\n";

    for(int y = 0; y < height; ++y){
      for(int x = 0; x < width; ++x){
        const int dx = x - centerX;
        const int dy = y - centerY;

        if(dx * dx + dy * dy <= radius * radius){
          image << "214 5 175 ";
        }else{
          image << "253 204 59 ";
        }

      }
      image << '\n';
    }

    image.close();
  }
}
{% endhighlight %}

> `gradiente.cpp`                                                                                                                                                    

{% highlight cpp %}
#include <iostream>
#include <fstream>

int main(){
  std::ofstream image("image.ppm");
  const int width = 800, height = 450;

  if(image.is_open()){
    image << "P3\n";
    image << width << " " << height << '\n';
    image << "255\n";

    for(int y = 0; y < height; ++y){
      for(int x = 0; x < width; ++x){
        const int r = (255 * x) / (width - 1);
        const int g = 0;
        const int b = 255;
        image << r << " " << g << " " << b << " ";
      }
      image << '\n';
    }

    image.close();
  }
}
{% endhighlight %}

> `lenna.cpp` → `convert $1 -compress none -depth 8 -colorspace RGB -define pgm:format=plain $2`

{% highlight cpp %}
#include <iostream>
#include <fstream>

int main(){
  std::ifstream input("./lenna.ppm");
  std::ofstream output("./lenna_bw.ppm");

  std::string format;
  int width, height, maxval;
  input >> format >> width >> height >> maxval;

  output << format << '\n' << width << " " << height << '\n' << maxval << '\n';

  for(int i = 0; i < width * height; ++i){
    int r, g, b;
    input >> r >> g >> b;

    int gray = static_cast<int>(0.9f * r + 0.8f * g + 0.7f * b);
    //int bw = (gray > 100) ? maxval : 0;
    //output << bw << " " << bw << " " << bw << " ";
    output << gray << " " << gray << " " << gray << " ";
  }
}
{% endhighlight %}

---

## 👀 Veja também:

+ [👑 Aprenda a criar sua própria linguagem de programação](https://terminalroot.com.br/mylang)
+ [✅ Aprenda Criação de Games com C++ e SFML](https://terminalroot.com.br/games)
+ [✅ Pacote Promocional C++](https://terminalroot.com.br/promo)
+ [✅ Aprenda C++ e Qt](https://terminalroot.com.br/cpp)
+ [✅ Conheça nossos Cursos](https://bit.ly/CursosTerminalRoot)
+ [🎁 Todos os Cursos na Udemy](https://bit.ly/UdemyTerminalRoot)

---

## 🔌 Mais
+ [🔗 Como Instalar e Primeiros Passos com Google Test](https://terminalroot.com.br/2025/06/como-instalar-e-primeiros-passos-com-google-test.html)
+ [🔗 Aprenda Matrizes e Determinantes com C++](https://terminalroot.com.br/2025/06/aprenda-matrizes-e-determinantes-com-cpp.html)
+ [🔗 Como Executar Comandos da Shell com Go](https://terminalroot.com.br/2025/06/como-executar-comandos-da-shell-com-go.html)
+ [🔗 Conheça um Ambiente Desktop para o Terminal](https://terminalroot.com.br/2025/06/conheca-um-ambiente-desktop-para-o-terminal.html)
+ [🔗 Os 12 Melhores Entity Component System para C++](https://terminalroot.com.br/2025/06/os-12-melhores-entity-component-system-para-cpp.html)
+ [🔗 Série Go - RegEx, CRUD de Arquivo](https://terminalroot.com.br/2025/06/serie-go-regex-crud-de-arquivo.html)
+ [🔗 Zig Série - Parte II](https://terminalroot.com.br/2025/06/zig-serie-parte-ii.html)
+ [🔗 Conheça o Ecode](Um Editor Leve, Multiplaforma e Moderno](https://terminalroot.com.br/2025/06/conheca-o-ecode-um-editor-leve-multiplaforma-e-moderno.html)


