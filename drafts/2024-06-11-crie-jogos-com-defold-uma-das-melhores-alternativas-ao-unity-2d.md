---
layout: post
title: "Crie Jogos com Defold, uma das melhores Alternativas ao Unity 2D"
date: 2024-06-11 18:26:56
image: '/assets/img/defold/defold.jpg'
description: "🎮 Defold é um Motor de Jogos, gratuito e Open Source. Disponível para Windows, macOS e Linux"
icon: 'ion:terminal-sharp'
iconname: 'GameDev'
tags:
- defold
- gamedev
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[Defold](https://defold.com/) é um [Motor de Jogos](https://terminalroot.com.br/tags#gamedev), gratuito e [Open Source](https://terminalroot.com.br/tags#opensource). 

Disponível para [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos) e [GNU/Linux](https://terminalroot.com.br/tags#gnulinux) e você pode renderizar seus jogos também para esses [sistemas operacionais](https://terminalroot.com.br/tags#sistemasoperacionais), além de também poder disponibilizar para [Android](https://terminalroot.com.br/tags#android), [iOS](https://terminalroot.com.br/tags#swift), Nintendo Switch, PlayStation 4, PlayStation 5 e também para [Web](https://terminalroot.com.br/tags#web).

**Defold** foi desenvolvido com [C++](https://terminalroot.com.br/tags#cpp), como linguagem de programação principal, mas também possui código em [Linguagem C](https://terminalroot.com.br/tags#linguagemc), [Java](https://terminalroot.com.br/tags#java), [Clojure](https://terminalroot.com.br/tags#clojure) e entre outras.

A linguagem de script para desenvolver seus jogos é [Lua](https://terminalroot.com.br/lua), ela é executada incorporada ao [C++](https://terminalroot.com.br/cpp). Além de também poder usar [TypeScript](https://terminalroot.com.br/tags#typescript) ou [Haxe](https://terminalroot.com.br/tags#haxe). 

O pipeline de renderização pode ser personalizado através de uma API de script de renderização, que pode ser traduzida em [OpenGL](https://terminalroot.com.br/tags#opengl), OpenGL ES, Vulkan e Metal. Disponibiliza um [IDE](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html) integrado com auto-complete e [LSP](https://terminalroot.com.br/2022/06/como-instalar-lua-lsp-no-neovim.html), mas você pode optar em usar o [VSCode](https://terminalroot.com.br/tags#vscode) integrado ao Defold.

Possui suporte integrado ao [Git](https://terminalroot.com.br/tags#git), além de muitos outros recursos. Seu repositório no [GitHub](https://terminalroot.com.br/tags#github) é: <https://github.com/defold/defold>.

---

# Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/ofcgP3CBpVQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Códigos utilizados no vídeo

Download e comando para instalação em distros GNU/Linux:
{% highlight bash %}
wget -q https://d.defold.com/archive/editor-alpha/034cafc6c4b5db7da125202ce8cc77db711fc4f0/editor-alpha/editor2/Defold-x86_64-linux.tar.gz
tar zxvf Defold-x86_64-linux.tar.gz
sudo mv Defold /opt/defold
sudo rm Defold-x86_64-linux.tar.gz
sudo wget https://defold.com/images/logo/defold/logo/logo-ver-classic-white-160.png -O /usr/share/pixmaps/defold.png
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

---

Criar comando:
{% highlight bash %}
sudo vim /usr/local/bin/defold
{% endhighlight %}

Conteúdo:
{% highlight bash %}
#!/bin/bash
/opt/defold/Defold $@
{% endhighlight %}
> Rode após criar para funcionar: `sudo chmod +x /usr/local/bin/defold`


Código para Desktop: `sudo vim /usr/share/applications/defold.desktop`
{% highlight bash %}
[Desktop Entry]
Version=1.9.0
Encoding=UTF-8
Exec=defold %F
Icon=defold
Name=Defold
GenericName=Defold :: The game engine for high-performance cross-platform games
Type=Application
Terminal=false
StartupNotify=true
Categories=Development
MimeType=application/x-defold;application/x-defold;
{% endhighlight %}

---

# Jogo que foi feito no GitHub
## <https://github.com/terroo/defold-game-2d>
