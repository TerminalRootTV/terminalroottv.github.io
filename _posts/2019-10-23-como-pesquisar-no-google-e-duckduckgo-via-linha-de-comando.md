---
layout: post
title: "Como pesquisar no Google e DuckDuckGo via Linha de Comando"
date: 2019-10-23 13:02:39
image: '/assets/img/tips/google-duckduckgo.jpg'
description: 'Rápido, simples e eficaz.'
tags:
- google
- duckduckgo
- terminal
- comandos
---

[![Como pesquisar no Google e DuckDuckGo via Linha de Comando](/assets/img/tips/google-duckduckgo.jpg)](/assets/img/tips/google-duckduckgo.jpg)

Aqui no blog já uma postagem antiga e bem superficial sobre o [Googler](https://terminalroot.com.br/2017/02/como-pesquisar-no-google-pelo-terminal.html), mas nessa além de aprofundarmos , vamos também mostrar uma outra opção do mesmo criador para o [DuckDuckGo](https://duckduckgo.com/) .

## [Googler](https://github.com/jarun/googler)

O Googler , como o próprio nome sugere, faz pesquisas no [Google](https://www.google.com/) via linha de comando.

### Instalação

Ele está disponível na maioria dos repositórios da distriibuições, então use o gerenciador de pacotes da sua distro ou sistema.

> Exemplo geral

{% highlight bash %}
sudo {apt,dnf,pkg,snap,choco,yay,zypper} {install,-S} googler
{% endhighlight %}

Mas se não estiver para seu sistema, basta [clonar]() e usar o [make]():
{% highlight bash %}
cd /tmp && git clone https://github.com/jarun/googler
cd googler/ && sudo make install
{% endhighlight %}

<!-- RETANGULO LARGO -->
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

### Utilização

Para fazer suas pequisas, basta rodar o comando `googler` e o termo que deseja pesquisar, exemplo:
{% highlight bash %}
googler Terminal Root
{% endhighlight %}

A saída será similar a imagem abaixo:
[![Googler](/assets/img/tips/google-duckduckgo.jpg)](/assets/img/tips/google-duckduckgo.jpg)

> Os resulados como no Google são extensos e para sair basta teclar **q** e depois **Enter**

## [Ddgr](https://github.com/jarun/ddgr)

Ddgr faz pesquisas no [DuckDuckGo](https://duckduckgo.com/).

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

### Instalação

Assim como o `googler` ele também está disponível na maioria dos repositórios, então o procedimento pode ser o mesmo, mas com o nome **ddgr**:

> Exemplo geral

{% highlight bash %}
sudo {apt,dnf,pkg,snap,choco,yay,zypper} {install,-S} ddgr 
{% endhighlight %}

Para fazer suas pequisas, basta rodar o comando `googler` e o termo que deseja pesquisar, exemplo:
{% highlight bash %}
ddgr Terminal Root
{% endhighlight %}

Simples, né ?

Foi uma dica bem rápida, mas que pode ser muito interessante pra que gosta de pegar resultados rápidos e que a solução às vezes já aparece nas ocorrências do buscador.

Espero que tenha gostado, um forte abraço e até mais!

## Links úteis

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

+ <https://github.com/jarun/ddgr>
+ <https://github.com/jarun/googler>
