---
layout: post
title: "Lolcat C++, o comando lolcat só que mais veloz"
date: 2024-07-16 10:12:28
image: '/assets/img/comandos/lolcat-cc.jpg'
description: "🌈 Há um vídeo que é possível notar a grande diferença!"
icon: 'ion:terminal-sharp'
iconname: 'Comandos'
tags:
- comandos
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Com o comando [lolcat](https://terminalroot.com.br/2015/05/divirta-se-colorindo-seu-terminal.html) você pode colorir as saídas do seu terminal de forma divertida.

No entanto, o comando `lolcat` original é bem lento, mas a boa notícia é que há uma alternativa que é o: **Lolcat CC**!

Nesse vídeo é possível notar a diferença entre o `lolcat` e o `lolcat-cc`:

<iframe width="1253" height="705" src="https://www.youtube.com/embed/vGjqibfE2yE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


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

## Instalação
Para instalá-lo basta usar o [git](https://terminalroot.com.br/tags#git) para clonar e um compilador: [gcc](https://terminalroot.com.br/tags#gcc) ou [clang](https://terminalroot.com.br/tags#clang) para compilar, além do [GNU Make](https://terminalroot.com.br/tags#make):

{% highlight bash %}
https://github.com/n-ham/lolcat-cc
cd lolcat-cc
make
{% endhighlight %}

Após compilar instale no seu sistema, exemplo:
{% highlight bash %}
sudo install -v lolcat-cc /usr/local/bin/
{% endhighlight %}

E teste usando a saída de qualquer comando para ele, exemplos:
{% highlight bash %}
cat main.cpp | lolcat-cc
ls | lolcat-cc
ping -c 4 terminalroot.com | lolcat-cc
{% endhighlight %}

Para mais informações use a ajuda:
{% highlight bash %}
lolcat-cc -h
{% endhighlight %}

E também visite o [repositório no GitHub do Lolcat CC](https://github.com/n-ham/lolcat-cc)


