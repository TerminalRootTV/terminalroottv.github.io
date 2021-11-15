---
layout: post
title: "Primeiros Passos com a Biblioteca Cairo para C/C++"
date: 2021-11-15 08:31:25
image: '/assets/img/cpp/cairo.jpg'
description: 'Projetos como: Polybar, AmigaOS, Synfig e outros foram feitos com a biblioteca Cairo.'
icon: 'ion:terminal-sharp'
iconname: 'C/C++'
tags:
- cpp
- linguagemc
---

![Primeiros Passos com a Biblioteca Cairo para C/C++](/assets/img/cpp/cairo.jpg)

[Cairo](https://www.cairographics.org/) é uma biblioteca gráfica de código aberto que fornece uma [API](https://terminalroot.com.br/2021/04/como-criar-uma-api-com-laravel-8.html) independente de dispositivo baseada em gráficos vetoriais para desenvolvedores de software .

Ela fornece primitivas para desenho bidimensional em vários back-ends diferentes . Cairo usa aceleração de hardware quando disponível.

Apesar de ser mais utilizada por programadores [C](https://terminalroot.com.br/tags#linguagemc)/[C++](https://terminalroot.com.br/cpp) ela também pode ser aplicada em outras [linguagens de programação](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html), tais como:  C#, Delphi, Eiffel, Factor, Harbor, Haskell, Julia, [Lua](https://terminalroot.com.br/lua) , Perl , [PHP](https://terminalroot.com.br/php), [Python](https://terminalroot.com.br/tags#python), [Ruby](https://terminalroot.com.br/tags#ruby), [Rust](https://terminalroot.com.br/tags#rust), Scheme, Smalltalk e vários outros como [Gambas](https://terminalroot.com.br/2016/10/gambas-o-visual-basic-open-source-para.html) (Como o Visual Basic).

---

# Ligações com Toolkits 
Como o Cairo é apenas uma biblioteca de desenhos, pode ser bastante útil integrá-lo a um kit de ferramentas de interface gráfica do usuário, como:
+ [FLTK](https://terminalroot.com.br/2021/09/os-7-melhores-frameworks-cpp-para-criar-interface-grafica.html) tem suporte total para Cairo (através do switch de compilação "`--enable-cairo`").
+ [GTK](https://terminalroot.com.br/2021/09/os-7-melhores-frameworks-cpp-para-criar-interface-grafica.html) começou em 2005, com a versão 2.8, a usar Cairo para renderizar a maioria de seus elementos de controle gráfico , e desde a versão 3.0 toda a renderização é feita através do Cairo.

---

# Muitos projetos famosos utilizam o Cairo
Tais como:
+ [Polybar](https://terminalroot.com.br/tags#polybar);
+ [Synfig](https://www.synfig.org/);
+ [Gnuplot](http://www.gnuplot.info/);
+ [AmigaOS](https://www.amigaos.net/);
+ Entre muitos outros!


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# Instalação
Existe abiblioteca `cairo` para desenvolvimento em **C** e a `cairomm` que pode ser usado com POO para [C++](https://terminalroot.com.br/cpp), apesar de que ambas funcionam com **C++** .

Para instalar ambos pacotes na sua [distro](https://terminalroot.com.br/tagsddistro)/sistema veja de acordo com seu gerenciador de pacotes correspondente:
{% highlight sh %}
emerge x11-libs/cairo dev-cpp/cairomm # Gentoo, Funtoo,...
sudo apt-get install -y libcairo2-dev libcairomm-1.0-dev # Debian, Ubuntu, Mint, ...
sudo yum install cairo-devel # Fedora, Red Hat, ...
zypper install cairo-devel cairomm-devel # OpenSUSE
sudo port install cairo cairomm # macOS
sudo pacman -S cairo cairomm # Arch Linux, Artix, Manjaro, ...
{% endhighlight %}

Você também pode compilar o código fonte direto do [GitLab](https://gitlab.freedesktop.org/cairo/cairo) .

---

# Criando seus primeiroscódigos com Cairo

Criando uma imagem com cairo.
> `nvim main.cpp` . Leia oscomentários no código para uma maior entendimento.

{% highlight cpp %}
#include <iostream>
#include <cairommconfig.h>
#include <cairomm/context.h>
#include <cairomm/surface.h>
#include <cmath>

int main(){

    auto surface =
        Cairo::ImageSurface::create(Cairo::Surface::Format::ARGB32, 600, 400);
    auto cr = Cairo::Context::create(surface);

    cr->save(); // salva o estado do contexto
    cr->set_source_rgb(0.86, 0.85, 0.47);
    cr->paint();    // preenche a imagem com a cor
    cr->restore();  // retornar a cor para preto agora
    cr->save();

    // desenha uma borda ao redor da imagem
    cr->set_line_width(20.0);    // faz uma linha mais larga
    cr->rectangle(0.0, 0.0, surface->get_width(), surface->get_height());
    cr->stroke();
    cr->set_source_rgba(0.0, 0.0, 0.0, 0.7);

    // desenha um círculo no centro da imagem
    cr->arc(surface->get_width() / 2.0, surface->get_height() / 2.0, 
            surface->get_height() / 4.0, 0.0, 2.0 * M_PI);
    cr->stroke();

    // desenha uma linha diagonal
    cr->move_to(surface->get_width() / 4.0, surface->get_height() / 4.0);
    cr->line_to(surface->get_width() * 3.0 / 4.0, surface->get_height() * 3.0 / 4.0);
    cr->stroke();
    cr->restore();

#ifdef CAIRO_HAS_PNG_FUNCTIONS
    std::string filename = "imagem.png";
    surface->write_to_png(filename);
    std::cout << "O arquivo PNG: '" << filename << "' foi criado com sucesso!\n";
#else
    std::cout << "Você deve compilar Cairo com suporte PNG para este exemplo.\n";
#endif

}
{% endhighlight %}


<!-- RETANGULO LARGO 2 -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:block; text-align:center;"
data-ad-layout="in-article"
data-ad-format="fluid"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="8549252987"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

Para compilar com o [G++](https://terminalroot.com.br/cpp) rode:

{% highlight sh %}
g++ main.cpp `pkg-config --cflags --libs cairomm-1.16` -std=c++17
{% endhighlight %}

Esse código irá criar no diretório que você executá-lo essa imagem:

![Cairo Example](/assets/img/cpp/cairo-example.png) 

Você também pode usar o [Makefile](https://terminalroot.com.br/2019/12/como-criar-um-makefile.html), [CMake](https://terminalroot.com.br/2021/09/compile-para-c-cpp-com-xmake-baseado-em-lua.html), [Xmake](https://terminalroot.com.br/2021/09/compile-para-c-cpp-com-xmake-baseado-em-lua.html) ou qualquer outra ferramenta do seu *toolchain*.

Para mais exemplos, [clique aqui](https://www.cairographics.org/examples/) e [aqui](https://www.cairographics.org/samples/).

## Veja também:
+ [Como detectar rostos, formas e objetos com OpenCV](https://terminalroot.com.br/2021/10/como-detectar-rostos-formas-e-objetos-com-opencv.html)
+ [Os 7 Melhores Frameworks C++ para criar Interfaces Gráfica](https://terminalroot.com.br/2021/09/os-7-melhores-frameworks-cpp-para-criar-interface-grafica.html)
+ [Conheça o GENODE, um framework para criar Sistemas Operacionais](https://terminalroot.com.br/2021/10/conheca-o-genode-um-framework-para-criar-sistemas-operacionais.html)
+ [Mais artigos sobre C/C++](https://terminalroot.com.br/tags/#cpp)



