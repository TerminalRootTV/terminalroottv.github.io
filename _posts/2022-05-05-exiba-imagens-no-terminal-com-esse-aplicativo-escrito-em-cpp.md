---
layout: post
title: "Exiba imagens no Terminal com esse aplicativo escrito em C++"
date: 2022-05-05 11:46:14
image: '/assets/img/cppdaily/tiv.jpg'
description: 'Pode ser implementada em diversas ideias '
icon: 'ion:terminal-sharp'
iconname: 'Terminal'
tags:
- cpp
- cppdaily
- terminal
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Se você está com uma ideia na cabeça de algum app modo TUI que precisa exibir imagens no terminal, tais como similares: [Ranger](https://ranger.github.io/), plugin para o [Vim](https://terminalroot.com.br/vim)/[Neovim](https://terminalroot.com.br/tags#neovim),... o **TerminalImageViewer** pode ser uma boa alternativa.

**TerminalImageViewer** é um pequeno programa feito com [C++](https://terminalroot.com.br/tags#cpp) para exibir imagens em um terminal (moderno) usando códigos RGB ANSI e caracteres gráficos de bloco unicode .

---

# Instalação
Antes você precisará das seguintes dependências instaladas no seu sistema: [Git](https://terminalroot.com.br/tags#git), [gcc](https://terminalroot.com.br/tags#gcc), [GNU Make](https://terminalroot.com.br/tags#make) e o [Image Magick](https://terminalroot.com.br/2015/03/tratamento-de-imagens-com-imagemagick.html).

Após isso rode os comandos na ordem:

{% highlight sh %}
git clone https://github.com/stefanhaustein/TerminalImageViewer
cd TerminalImageViewer/src/main/cpp
make
sudo make install
{% endhighlight %}

Você também pode instalar via [Brew](https://terminalroot.com.br/2021/07/homebrew-o-gerenciador-de-pacotes-do-macos-no-gnu-linux.html) e [Snap](https://snapcraft.io/):

{% highlight sh %}
brew install tiv
sudo snap install --edge tiv
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

# Utilização
Se você rodar só o comando `tiv` haverá um *help* para todos os parâmetros disponíveis:
{% highlight sh %}
tiv 
Terminal Image Viewer v1.1.0

usage: tiv [options] <image> [<image>...]

  -0        : No block character adjustment, always use top half block char.
  -256      : Use 256 color mode.
  -c <num>  : Number of thumbnail columns in 'dir' mode (3).
  -d        : Force 'dir' mode. Automatially selected for more than one input.
  -f        : Force 'full' mode. Automatically selected for one input.
  -help     : Display this help text.
  -h <num>  : Set the maximum height to <num> lines.
  -w <num>  : Set the maximum width to <num> characters.
  -x        : Use new Unicode Teletext/legacy charactery (experimental)
{% endhighlight %}

A forma mais básica é rodar o comando `tiv` e indicar o caminho da imagem, exemplo:
{% highlight sh %}
tiv image.jpg
{% endhighlight %}

Outro exemplo, limitando a largura para *40px* e a altura será redimensionada proporcionalmente:

{% highlight sh %}
tiv -w 40 image.jpg
{% endhighlight %}

Exemplo:

![tiv -w 40](/assets/img/cppdaily/tiv-w40.png) 

Existe uma versão também em [Java](https://terminalroot.com.br/tags#java), mas está desatualizada e não está compilando.

Para mais informações acesse o [repositório](https://github.com/stefanhaustein/TerminalImageViewer) .



