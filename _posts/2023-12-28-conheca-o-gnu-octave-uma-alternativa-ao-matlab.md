---
layout: post
title: "Conheça o GNU Octave, uma alternativa ao MATLAB"
date: 2023-12-28 22:40:09
image: '/assets/img/gnu/octave/octave.jpg'
description: 'Possui uma linguagem de programação própria destinado à realização de cálculos numéricos e simulações.'
icon: 'ion:terminal-sharp'
iconname: 'GNU'
tags:
- gnu
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O [GNU Octave](https://octave.org/) é um [software livre](https://terminalroot.com.br/tags#freesoftware) escrito com [C++](https://terminalroot.com.br/tags#cpp) destinado à realização de cálculos numéricos e simulações. 

Ele é frequentemente usado como uma alternativa de código aberto ao [MATLAB](https://en.wikipedia.org/wiki/MATLAB), sendo compatível com a linguagem de programação MATLAB e fornecendo uma ampla gama de funcionalidades para análise numérica e computação científica.

Possui diversas ferramentas integradas para plotagem e visualização 2D/3D. Está disponível para [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos), [GNU/Linux](https://terminalroot.com.br/tags#gnulinux) e [BSD](https://terminalroot.com.br/tags#bsd).

---

# Instalação
Para instalar o GNU Octave você pode usar o gerenciador de pacotes do seu sistema operacional ou fazer download do binário e executá-lo, ou instalar, manualmente.

Exemplo para versões recentes do [Ubuntu](https://terminalroot.com.br/tags#ubuntu):
{% highlight bash %}
sudo apt install octave
{% endhighlight %}

Para outros sistemas ou distribuições veja na [página de downloads do GNU Octave](https://octave.org/download). Além de poder compilar do zero!


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
Após instalar, você pode abrir o octave graficamente ou via [linha de comando](https://terminalroot.com.br/tags#comandos). Ao rodar somente o comando abaixo, será iniciada uma subshell que interpretará os comandos do GNU Octave após digitá-lo e pressionar enter:
{% highlight bash %}
octave
{% endhighlight %}

Se quiser usar de forma gráfica basta procurar pelo nome **Octave** no dashboard do seu sistema, ou rodar via linha de comando também:
{% highlight bash %}
octave --gui
{% endhighlight %}

Ao abrir pela primeira vez pode ser que ele solicite alguns dados de configuração tais como os listados abaixo:
[![GNU Octave init config](/assets/img/gnu/octave/start-octave.jpg)](/assets/img/gnu/octave/start-octave.jpg)
> Clique na imagem para abrir em uma nova guia e ampliá-la!

[![GNU Octave open](/assets/img/gnu/octave/octave-open.png)](/assets/img/gnu/octave/octave-open.png)
> Clique na imagem para abrir em uma nova guia e ampliá-la!

A interface é bem intuitiva e você pode usar as abas do canto inferior direito para escolher entre:
+ **Janela de comandos** - A subshell de forma gráfica
+ **Documentação** - Incluindo exemplos
+ **Editor de variáveis**
+ **Editor**

Um exemplo básico de uso seria criar um gráfico que exibirá `y` em função de `x`, use a *Janela de Comandos* ou diretamente na subshell do [terminal](https://terminalroot.com.br/tags#terminal):
{% highlight python %}
x = linspace(0, 2*pi, 100);
y = sin(x);
plot(x, y);
{% endhighlight %}

> Isso irá exibir a figura:
[![GNU Octave plot example](/assets/img/gnu/octave/plot-subshell.jpg)](/assets/img/gnu/octave/plot-subshell.jpg)
> Clique na imagem para abrir em uma nova guia e ampliá-la!

E se for graficamente:
[![GNU Octave plot GUI](/assets/img/gnu/octave/plot-gui.jpg)](/assets/img/gnu/octave/plot-gui.jpg)
> Clique na imagem para abrir em uma nova guia e ampliá-la!

---

Para mais informações visite o [repositório no GitHub](https://github.com/gnu-octave/octave), [site oficial](https://octave.org/) e a [wiki](https://en.wikibooks.org/wiki/Octave_Programming_Tutorial/Getting_started).



