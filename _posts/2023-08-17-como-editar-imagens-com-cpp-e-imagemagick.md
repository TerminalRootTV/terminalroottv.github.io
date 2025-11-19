---
layout: post
title: "Como editar imagens com C++ e ImageMagick"
date: 2023-08-17 20:06:52
image: '/assets/img/cpp/magick.jpg'
description: 'A API Magick++ é a API C++ orientada a objetos para a biblioteca de processamento de imagem ImageMagick.'
icon: 'ion:terminal-sharp'
iconname: 'C++/Multimídia'
tags:
- cpp
- multimidia
- imagemagick
- magick
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

🔊 A API **Magick++** é a API [C++](https://terminalroot.com.br/tags#cpp) orientada a objetos para a biblioteca de processamento de imagem *ImageMagick*.

**Magick++** suporta um modelo de objeto inspirado em *PerlMagick* . As imagens oferecem suporte à contagem de referência implícita para que os construtores de cópia e a atribuição incorram em quase nenhum custo. 

O custo de copiar uma imagem (se necessário) é feito logo antes da modificação e esta cópia é gerenciada automagicamente pelo **Magick++**. As cópias *desreferenciadas* são excluídas automaticamente. Os objetos de imagem oferecem suporte à semântica de valor (em vez de ponteiro), portanto, é trivial oferecer suporte a várias gerações de uma imagem na memória ao mesmo tempo.

---

# Assista ao Vídeo
<iframe width="1253" height="705" src="https://www.youtube.com/embed/zuukk0eK1Gs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Códigos utilizados no vídeo

Instalação no Ubuntu:
{% highlight bash %}
sudo apt install imagemagick libmagick++-dev graphicsmagick-libmagick-dev-compat
{% endhighlight %}

Para Instalar no [Windows](https://terminalroot.com.br/tags#windows) ou outras distros e sistemas operacionais, veja os links abaixo:
+ <https://imagemagick.org/script/advanced-windows-installation.php>
+ <https://imagemagick.org/script/download.php>

---

## Exemplo 01 - Criar uma imagem e desenhar e pintar um círculo no centro

{% highlight cpp %}
#include <Magick++.h>

int main(){
  Magick::InitializeMagick("");

  Magick::Image image(Magick::Geometry(800, 600), Magick::Color("white"));

  Magick::DrawableCircle circle(400, 300, 500, 300);
  image.fillColor("green");
  image.draw(circle);
  image.write("circulo_verde.png");

  return 0;
}
{% endhighlight %}

Para compilar e rodar:
{% highlight bash %}
g++ `Magick++-config --cxxflags --cppflags` -O2 -o 01 main.cpp `Magick++-config --ldflags --libs`)
./01
{% endhighlight %}

---

## Exemplo 02 - Recortar região de uma imagem
Imagem utilizada nesse exemplo 02: [langs.png](/assets/img/cpp/magick/langs.png)


{% highlight cpp %}
#include <Magick++.h>

int main(){
  Magick::InitializeMagick("");

  Magick::Image image;

  image.read("./langs.png");

  image.crop(Magick::Geometry(219, 147, 409, 272));

  image.write("php.jpg");

  return 0;
}
{% endhighlight %}

---


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## Exemplo 03 - Converter imagem WEBP para JPG
Imagem utilizada nesse exemplo 03: [The-man-image.webp](/assets/img/cpp/magick/The-man-image.webp)

{% highlight cpp %}
#include <Magick++.h>

int main(){
  Magick::InitializeMagick("");

  Magick::Image image;

  image.read("./The-man-image.webp");

  image.write("Bjarne Stroustrup.jpg");

  return 0;
}
{% endhighlight %}

---

## Exemplo 04 - Desenhando texto na imagem
Fonte utilizada: [font.ttf](/assets/img/cpp/magick/font.ttf)

{% highlight cpp %}
#include <Magick++.h>

int main(){
  Magick::InitializeMagick("");

  Magick::Image image;

  image.read("./Bjarne Stroustrup.jpg");
  image.font("./font.ttf");
  image.fillColor(Magick::Color("yellow"));
  image.strokeColor(Magick::Color("black"));
  image.fontPointsize(30);

  image.draw(Magick::DrawableText(50, 300, "Bjarne Stroustrup"));

  image.write("image_com_texto.png");

  return 0;
}
{% endhighlight %}

---

# Links úteis e documentação
+ [Documentação da API](https://imagemagick.org/script/magick++.php)
+ [Site oficial](https://imagemagick.org/)



