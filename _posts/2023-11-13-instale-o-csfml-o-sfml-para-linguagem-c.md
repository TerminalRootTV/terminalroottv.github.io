---
layout: post
title: "Instale o CSFML, o SFML para Linguagem C"
date: 2023-11-13 12:08:02
image: '/assets/img/c/csfml.jpg'
description: 'Crie jogos 2D de forma fácil e rápida!'
icon: 'ion:terminal-sharp'
iconname: 'Linguagem C/SFML'
tags:
- linguagemc
- sfml
- gamedev
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O **CSFML** é uma *interface* do [SFML](https://terminalroot.com.br/games) para a [Linguagem C](https://terminalroot.com.br/tags#linguagemc), pois o [SFML](https://terminalroot.com.br/tags#sfml) só funciona nativamente em [C++](https://terminalroot.com.br/cpp).

Está disponível para [Windows](https://terminalroot.com.br/tags#windows), [GNU/Linux](https://terminalroot.com.br/tags#gnu) e [macOS](https://terminalroot.com.br/tags#macos).

O bom de ter o **CSFML** também instalado em seu sistema é que diversas outras linguagens de programação que possuem *bindings* para o SFML, usam o CSFML como *wrapper* em vez do próprio **SFML**.


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

# Instalação
Exemplo no Ubuntu:
{% highlight bash %}
sudo apt install libcsfml-graphics2.5 libcsfml-audio2.5 libcsfml-dev libcsfml-doc libcsfml-network2.5 libcsfml-system2.5 libcsfml-window2.5
{% endhighlight %}

Se quiser instalar tudo de uma única vez:
{% highlight bash %}
sudo apt install libcsfml-*
{% endhighlight %}
> [Veja aqui para Arch Linux](https://archlinux.org/packages/extra/x86_64/csfml/) e [aqui para Fedora](https://src.fedoraproject.org/rpms/CSFML). Para outras distros use a pesquisa do gerenciador de pacotes do seu sistema!

Para Windows você deve fazer o download [nesse link](https://www.sfml-dev.org/download/csfml/), descompactar e mover para a unidade `C:\`, outra alternativa também é usar o [NuGet](https://www.nuget.org/packages/CSFML/2.5.1):
{% highlight bash %}
dotnet add package CSFML --version 2.5.1
{% endhighlight %}

Há também o download para o macOS, no entanto, você também pode usar o [Brew](https://formulae.brew.sh/formula/csfml), para isso basta rodar o comando:
{% highlight bash %}
brew install csfml
{% endhighlight %}

Você também pode compilar do zero, mas lembre-se que antes precisa ter o SFML instalado como dependência. Para isso rode os comandos abaixo:
{% highlight bash %}
git clone https://github.com/SFML/CSFML
cd CSFML
cmake -B build .
cd build && make
sudo make install
cd ../..
rm -rf CSFML
{% endhighlight %}

<details>
 <summary>Clique aqui para ver os locais onde os arquivos são instalados</summary>

{% highlight bash %}
Install the project...
-- Install configuration: "Release"
-- Installing: /usr/local/pkgconfig/csfml-all.pc
-- Installing: /usr/local/pkgconfig/csfml-system.pc
-- Installing: /usr/local/pkgconfig/csfml-window.pc
-- Installing: /usr/local/pkgconfig/csfml-graphics.pc
-- Installing: /usr/local/pkgconfig/csfml-audio.pc
-- Installing: /usr/local/pkgconfig/csfml-network.pc

-- Up-to-date: /usr/local/./include
-- Installing: /usr/local/./include/SFML
...

-- Installing: /usr/local/share/CSFML/license.md
-- Installing: /usr/local/share/CSFML/readme.md
-- Installing: /usr/local/lib/libcsfml-system.so.2.5.2
-- Installing: /usr/local/lib/libcsfml-system.so.2.5
-- Installing: /usr/local/lib/libcsfml-system.so
-- Installing: /usr/local/lib/libcsfml-window.so.2.5.2
-- Installing: /usr/local/lib/libcsfml-window.so.2.5
-- Installing: /usr/local/lib/libcsfml-window.so
-- Installing: /usr/local/lib/libcsfml-network.so.2.5.2
-- Installing: /usr/local/lib/libcsfml-network.so.2.5
-- Installing: /usr/local/lib/libcsfml-network.so
-- Installing: /usr/local/lib/libcsfml-graphics.so.2.5.2
-- Installing: /usr/local/lib/libcsfml-graphics.so.2.5
-- Installing: /usr/local/lib/libcsfml-graphics.so
-- Installing: /usr/local/lib/libcsfml-audio.so.2.5.2
-- Installing: /usr/local/lib/libcsfml-audio.so.2.5
-- Installing: /usr/local/lib/libcsfml-audio.so
{% endhighlight %}

</details>


<!-- RECTANGLE LARGE -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Informat -->
<ins class="adsbygoogle"
style="display:block"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="2327980059"
data-ad-format="auto"
data-full-width-responsive="true"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# Código básico de exemplo

Crie um arquivo exemplo: `main.c`:
{% highlight c %}
#include <SFML/Graphics.h>

int main(int argc, char **argv) {
  sfVideoMode mode = {800, 450, 32};
  sfRenderWindow *window = sfRenderWindow_create(mode, "CSFML Example", sfResize | sfClose, NULL);

  sfRectangleShape *shape = sfRectangleShape_create();
  sfVector2f vf = {200, 200}, pos = {30, 30};
  sfRectangleShape_setSize(shape, vf);
  sfRectangleShape_setFillColor(shape, sfGreen);
  sfRectangleShape_setPosition(shape, pos);

  while (sfRenderWindow_isOpen(window)) {
    sfEvent event;
    while (sfRenderWindow_pollEvent(window, &event)) {
      if (event.type == sfEvtClosed) {
        sfRenderWindow_close(window);
      }
    }

    sfRenderWindow_clear(window, sfBlack);
    sfRenderWindow_drawRectangleShape(window, shape, NULL);
    sfRenderWindow_display(window);
  }

  sfRectangleShape_destroy(shape);
  sfRenderWindow_destroy(window);

  return 0;
}
{% endhighlight %}

Para compilar:
{% highlight bash %}
gcc main.c -lcsfml-window -lcsfml-system -lcsfml-graphics
{% endhighlight %}

**OBSERVAÇÃO**: Se você compilou do zero e encontrou erro ao rodar o binário que está procurando a biblioteca estática `.so`, então você precisará adicionar o caminho que foi instalado à sua variável `$LD_LIBRARY_PATH`:

{% highlight bash %}
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/lib"
{% endhighlight %}
> Você pode adicionar essa linha ao seu `~/.bashrc` para automatizar essa adição e não precisar ficar rodando esse comando toda vez que for rodar binários CSFML!


Os nomes das funções e a forma de uso são bem intuitivos, pois se você já conhece o [SFML](https://terminalroot.com.br/games) fica fácil de deduzir. Se ainda não conhece, recomendo fazer nosso: [Curso de Criação de Jogos com SFML](https://terminalroot.com.br/games): <https://terminalroot.com.br/games>.

Para mais informações acesse os links:
+ Repositório: <https://github.com/SFML/CSFML>
+ Página de downloads: <https://sfml-dev.org/download/csfml/>
+ Exemplo de uso: <https://26.customprotocol.com/csfml/index.htm>
+ Documentação alternativa: <https://epitech-2022-technical-documentation.readthedocs.io/en/latest/csfml.html>

