---
layout: post
title: "Termgraph - desenhe gráficos no terminal"
date: 2021-01-24 12:51:34
image: '/assets/img/python/termgraph.jpg'
description: 'Uma ferramenta de linha de comando que desenha gráficos básicos no terminal, escrita em Python.'
icon: 'ion:terminal-sharp'
iconname: 'python'
tags:
- python
- terminal
---

![Termgraph - desenhe gráficos no terminal](/assets/img/python/termgraph.jpg)

Diversas [linguagens de programação](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html) existem softwares para criação de gráficos e [visualizações de dados](https://pt.wikipedia.org/wiki/Visualiza%C3%A7%C3%A3o_de_dados). [Python](https://terminalroot.com.br/tags#python) é uma das mais "ricas" de bibliotecas nesse sentido, o [matplotlib](https://terminalroot.com.br/2019/12/as-30-melhores-bibliotecas-e-pacotes-python-para-iniciantes.html) é um dos mais utilizados. A [linguagem de programação R](https://www.r-project.org/) também é uma das melhores nesse quesito e podemos citar a **ggplot2**.

Mas e se você estiver procurando por uma maneira ainda mais rápida e fácil de visualizar os dados armazenados em um arquivo de texto simples. E talvez você não queira sair do conforto do terminal, você pode estar interessado no **Termgraph**.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Instalação do Termgraph
Você deve usar o [pip](https://pypi.org/project/termgraph/) para instalá-lo, exemplo:
{% highlight bash %}
python -m pip install termgraph
{% endhighlight %}

Alternativamente você pode usar o [pipx](https://github.com/pipxproject/pipx):
{% highlight bash %}
pipx install termgraph
{% endhighlight %}

# Tipos de gráficos suportados
+ Bar Graphs
+ Color charts
+ Multi-variable
+ Stacked charts
+ Histograms
+ Horizontal or Vertical
+ Emoji!

# Exemplos de uso
+ Ler dados do arquivo `data/ex1.dat`

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

{% highlight bash %}
termgraph data/ex1.dat

2007: ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 183.32
2008: ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 231.23
2009: ▇ 16.43
2010: ▇▇▇▇ 50.21
2011: ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 508.97
2012: ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 212.05
2014: ▏ 1.00
{% endhighlight %}

+ Usando cores personalizadas
![Termgraph example 2](/assets/img/python/termgraph-ex2.jpg)

Para mais formas de uso, rode:
{% highlight bash %}
termgraph -h
{% endhighlight %}

E você ainda pode contribuir com o projeto, GitHub do Termgraph: <https://github.com/mkaz/termgraph>.

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
