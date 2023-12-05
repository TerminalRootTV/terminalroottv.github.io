---
layout: post
title: "Como Copiar para área de transferência com C++"
date: 2023-12-05 14:39:00
image: '/assets/img/cpp/clip-cpp.jpg'
description: 'Excelente para criar aqueles botões GUI: ▣ Copy / ✔ Copied!'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Existem diversas bibliotecas [C++](https://terminalroot.com.br/tags#cpp) para fazer isso. Mas, cada uma com sua peculiaridade, no entanto, citaremos a maioria ao final desse artigo.

Nesse exemplo veremos como usar a **Clip**.

**Clip** é biblioteca [C++](https://terminalroot.com.br/cpp) multiplataforma([Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos) e [GNU/Linuxhttps://terminalroot.com.br/tags#gnulinux]()) para copiar/colar conteúdo da área de transferência.

---

# Utilização
A forma mais simples de usar é:

#### 1. Crie um projeto exemplo e entre no mesmo:
{% highlight bash %}
mkdir -p myproject
cd myproject
{% endhighlight %}

#### 2. Clone a Clip para seu projeto:
{% highlight bash %}
git clone https://github.com/dacap/clip
{% endhighlight %}

#### 3. Crie um arquivo C++ básico que após rodar o binário irá copiar a `string`:
> `main.cpp`
{% highlight cpp %}
#include "clip/clip.h"

int main(){
  clip::set_text("Esse texto será copiado para área de transferência");
  return 0;
}
{% endhighlight %}

#### 4. Crie um CMake para construir o binário:
> `CMakeLists.txt`
{% highlight cmake %}
cmake_minimum_required(VERSION 2.8)
project(Example)
add_executable(a.out main.cpp)
add_subdirectory(clip)
target_link_libraries(a.out clip)
{% endhighlight %}
> Altere a versão do CMake para a sua versão, essa versão eu pus por questão de compatibilidade, mas provavelmente haverá um *warning* ao rodá-lo, mas funcionará!


#### 5. Construa 
{% highlight bash %}
cmake . -B build
cd build && make
./a.out
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

Ao rodar o binário, tente teclar: `Ctrl + v` em outro lugar e note que o conteúdo foi copiado! 
> **OBSERVAÇÃO**: Talvez isso não funcione em gerenciadores de janelas, é necessário configurar arquivos para compatibilidade, apesar do comando [xclip](https://terminalroot.com.br/2020/10/copie-e-cole-via-linha-de-comando-do-linux-com-xclip.html) funcionar normalmente!

Mas, eu testei no GNOME e no Windows e funcionou perfeitamente!

Para mais informações acesse o [repositório da Clip](https://github.com/dacap/clip).

E como eu disse há muitas opções a ela, dentre elas:
+ [CopyQ](https://github.com/hluk/CopyQ)
+ [Clipboard](https://github.com/Slackadays/Clipboard)
+ [ClipboardXX](https://github.com/Arian8j2/ClipboardXX)
+ [ClipboardPlus](https://github.com/oormicreations/ClipboardPlus)
+ [wclip](https://github.com/palortoff/wclip)
+ [xclip](https://github.com/astrand/xclip)
+ E entre outras.

<!-- 
+ https://wiki.archlinux.org/title/clipboard
+ https://wiki.archlinux.org/title/clipboard
-->
