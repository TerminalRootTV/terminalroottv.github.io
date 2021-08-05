---
layout: post
title: "Conheça o Monotty Desktopio - Um ambiente desktop no seu Terminal"
date: 2021-08-05 10:00:23
image: '/assets/img/terminal/monotty-desktopio.webp'
description: 'Multiplexador de terminal com gerenciador de janela TUI e compartilhamento de sessão.'
icon: 'ion:terminal-sharp'
iconname: 'Terminal'
tags:
- terminal
---

![Conheça o Monotty Desktopio - Um ambiente desktop no seu Terminal](/assets/img/terminal/monotty-desktopio.webp)

[Monotty Desktopio](https://vtm.netxs.online/) é um Ambiente de trabalho baseado em texto dentro do seu terminal.

Para funcionar no seu terminal ele precisa possuir os seguintes recursos:
+ [Unicode/UTF-8](https://www.cl.cam.ac.uk/~mgk25/unicode.html)
+ [Grapheme Clustering](https://unicode.org/reports/tr29/#Grapheme_Cluster_Boundaries)
+ [24-bit True Color](https://github.com//termstandard/colors) ou superior.
+ [xterm-style Mouse Reporting](https://invisible-island.net/xterm/ctlseqs/ctlseqs.html#h2-Mouse-Tracking)

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


Para testar basta rodar o comando:
{% highlight bash %}
ssh vtm@netxs.online
{% endhighlight %}

Você verá algo do tipo:

![Demo](https://user-images.githubusercontent.com/11535558/127660289-25e71ef1-d17d-42d1-b79e-00e570056fe4.gif)

Se quiser construir na sua máquina instale o [git](https://terminalroot.com.br/git), [cmake](https://terminalroot.com.br/2019/12/como-compilar-seus-programas-com-cmake.html) e o [gcc](https://terminalroot.com.br/2019/12/gcc-vs-llvm-qual-e-o-melhor-compilador.html) e rode os comandos:

{% highlight bash %}
git clone https://github.com/netxs-group/VTM.git && cd ./VTM
cmake ./src -DCMAKE_BUILD_TYPE=Release
cmake --build .
cmake --install .
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

No [Windows](https://terminalroot.com.br/tags#windows) substitua o gcc pelo [Visual Studio 2019](https://visualstudio.microsoft.com/pt-br/downloads/) e rode os comandos:
{% highlight bash %}
git clone https://github.com/netxs-group/VTM.git && cd ./VTM
cmake ./src -DCMAKE_BUILD_TYPE=Release "-GVisual Studio 16 2019"
cmake --build . --config Release
cd ./Release
powershell ../src/install/install.ps1
{% endhighlight %}

Para mais informações visite o site: <https://vtm.netxs.online/> .


