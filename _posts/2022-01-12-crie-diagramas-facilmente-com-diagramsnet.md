---
layout: post
title: "Crie diagramas facilmente com DIAGRAMS.NET"
date: 2022-01-12 12:00:17
image: '/assets/img/dicas/diagrams.png'
description: 'Disponível online e offline para Linux, Windows e macOS'
icon: 'ion:terminal-sharp'
iconname: 'Diagramas'
tags:
- dicas
---

![Crie diagramas facilmente com DIAGRAMS.NET](/assets/img/dicas/diagrams.png)

---

**diagrams.net**, antigamente conhecido com **draw.io** é um software de desenho gráfico de plataforma cruzada gratuito e de [código aberto](https://terminalroot.com.br/tags#opensource) desenvolvido em [HTML5](https://terminalroot.com.br/2020/01/desenvolvimento-web.html) e [JavaScript](https://terminalroot.com.br/2020/01/javascript.html) . 

Sua interface pode ser usada para criar diagramas como:
+ Fluxogramas
+ Wireframes
+ Diagramas UML
+ Organogramas 
+ e Diagramas de [Rede](https://terminalroot.com.br/tags#redes) .

[diagrams.net](https://diagrams.net/) está disponível online como um aplicativo da web para vários navegadores e como um aplicativo de desktop offline para [Linux](https://terminalroot.com.br/linux), [macOS](https://terminalroot.com.br/tags#macos) e [Windows](https://terminalroot.com.br/tags#windows). 

Sua versão offline é construída usando a estrutura [Electron](https://terminalroot.com.br/2019/11/conheca-e-instale-o-veonim-um-editor-baseado-no-vim-e-neovim.html) . O aplicativo da web não requer login ou registro online e pode ser aberto e salvo no disco rígido local . 

Os formatos de armazenamento e exportação suportados para download incluem **PNG**, **JPEG**, **XML**, **SVG** e **PDF**.


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

Se tiver no Linux você ainda pode usar um AppImage, para isso rode:

{% highlight sh %}
wget -q https://github.com/jgraph/drawio-desktop/releases/download/v16.1.2/drawio-x86_64-16.1.2.AppImage
chmod +x drawio-x86_64-16.1.2.AppImage
./drawio-x86_64-16.1.2.AppImage
{% endhighlight %}

Para Windows e pacotes específicos para distros veja [a página de releases](https://github.com/jgraph/drawio-desktop/releases) .

O Uso dele é muito intuitivo, veja abaixo um exemplo de um Fluxograma que eu estou criando de um [game](https://terminalroot.com.br/tags#games) com [C++](https://terminalroot.com.br/cpp) para conseguir implementar de maneira padronizada a estrutura ECS:

![ECS Game C++ diagrams.net](/assets/img/dicas/ecs-game-cpp.png) 

Isso faz você ter uma visão melhor do projeto que você está criando.

Para mais informações consulte os links abaixo:
+ <https://diagrams.net/>
+ <https://github.com/jgraph/drawio-desktop/>


