---
layout: post
title: "GNvim: Um NeoVim Gráfico"
date: 2021-04-06 09:25:19
image: '/assets/img/neovim/gnvim.jpg'
description: 'NeoVim meio estranho, mas funcional.'
icon: 'ion:terminal-sharp'
iconname: 'Neovim'
tags:
- neovim
- vim
---

![GNvim: Um NeoVim Gráfico escrito em Rust](/assets/img/neovim/gnvim.jpg)

Para aqueles que são fãs de [Vim/Neovim](https://terminalroot.com.br/vim) e também são fãs de [Rust](https://terminalroot.com.br/tags#rust), eis um editor de texto interessante para você usar no dia-a-dia.

# Instalação
Para instalar, lógico, antes que qualquer coisa você precisa possuir o [Rust](https://rustup.rs/) instalado, além do [Gtk](https://terminalroot.com.br/tags#gtkmm) e Neovim também!

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Exemplo de no [Ubuntu](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=ubuntu)
{% highlight bash %}
sudo apt install libgtk-3-dev libwebkit2gtk-4.0-dev
# Run (unoptimized version) without installing
GNVIM_RUNTIME_PATH=/path/to/gnvim/runtime cargo run
# Install
make && sudo make install
{% endhighlight %}

# Recursos
+ Sem Electron(!), Baseado em GTK.
+ Ligatures
+ Cursor animado
+ Muitos dos recursos externos Neovim
+ Menu popup
+ Tabline
+ Cmdline
+ Wildmenu

Para mais informações acesse o GitHub do projeto: <https://github.com/vhakulinen/gnvim>

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


