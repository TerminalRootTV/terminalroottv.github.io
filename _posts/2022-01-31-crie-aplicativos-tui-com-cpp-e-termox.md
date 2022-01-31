---
layout: post
title: "Crie aplicativos TUI com C++ e TermOx"
date: 2022-01-31 13:14:53
image: '/assets/img/cpp/termox.jpg'
description: 'Para criar programas gráficos no Terminal de maneira mais fácil.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- ncurses
- terminal
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Antigamente esse projeto se chamava **CPPurses**, mas o nome foi mudado para **TermOx**.

Trata-se de um framework baseado em [NCURSES](https://terminalroot.com.br/ncurses) para criar aplicações que rodam no [terminal](https://terminalroot.com.br/tags#terminal) .

---

# Instalação
Certifique de possuir os seguintes softwares e bibliotecas instaladas no seu sistema:
+ [Git](https://terminalroot.com.br/tags#git)
+ [GCC](https://terminalroot.com.br/tags#gcc)
+ [GNU Make](https://terminalroot.com.br/tags#make)
+ [CMake](https://terminalroot.com.br/tags#cmake)
+ [NCURSES](https://terminalroot.com.br/ncurses)

Em seguida clone o projeto e construa:
{% highlight sh %}
git clone --recurse-submodules https://github.com/a-n-t-h-o-n-y/TermOx
cd TermOx
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make
{% endhighlight %}

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

> Antes de instalar construa também os **demos**.

Se seu sistema está em **Português Brasileiro** rode esse comando antes:
{% highlight sh %}
sed -i 's/en_US/pt_BR/g' ../external/Escape/src/terminal.cpp
{% endhighlight %}

Agora construa os demos:
{% highlight sh %}
make demos
{% endhighlight %}

Teste os **demos**
{% highlight sh %}
./demos/demos
{% endhighlight %}

Abrirá um menu com os exemplos, navegue usando as teclas direcionais para cima e para baixo e selecione pressionando **Enter**. Para voltar pro menu tecle **ESC** e para fechar os **demos** tecle **Ctrl + c** .

E finalmente instale no seu sistema:
{% highlight sh %}
cd ../..
sudo mv TermOx /opt/
{% endhighlight %}


<!-- RECTANGLE 2 - OnParagragraph -->
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

# Criando um Hello, World
Crie um diretório do projeto entre no mesmo, exemplo: `mkdir myapp && cd myapp`.

Agora também crie um arquivo de exemplo `main.cpp` e insira o conteúdo abaixo:
{% highlight cpp %}
#include <termox/termox.hpp>

int main(){
    return ox::System{}.run<ox::Textbox>("Hello, World!");
}
{% endhighlight %}

E para construir use o CMake e crie um `nvim CMakeLists.txt` e insira o conteúdo abaixo:
{% highlight cmake %}
cmake_minimum_required(VERSION 3.9)
project(MyApp)
add_subdirectory(TermOx)
add_executable(hello-world main.cpp)
target_link_libraries(hello-world PRIVATE TermOx)
{% endhighlight %}

Agora copie o TermOx para seu projeto:
{% highlight sh %}
cp -r /opt/TermOx .
{% endhighlight %}

Crie um diretório de construção e construa:
{% highlight sh %}
mkdir build && cd build
cmake ..
make
{% endhighlight %}

E teste seu *Hello, World*:
> Ele é tipo um mini editor de texto, fique à vontade para usá-lo:
{% highlight sh %}
./hello-world
{% endhighlight %}
> Tecle **Ctrl +c** para sair.

---

Para mais informações documentação acesse o [repositório](https://github.com/a-n-t-h-o-n-y/TermOx) .

