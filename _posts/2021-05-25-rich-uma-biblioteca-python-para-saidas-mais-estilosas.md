---
layout: post
title: "Rich, uma biblioteca Python para saídas mais estilosas"
date: 2021-05-25 08:14:05
image: '/assets/img/python/rich-python.jpg'
description: 'Exiba tabelas, HTML e muito mais pelo terminal.'
icon: 'ion:terminal-sharp'
iconname: 'Python'
tags:
- python
---

![Rich, uma biblioteca Python para saídas mais estilosas](/assets/img/python/rich-python.jpg)

Tornar as saídas do contexto mais elegantes é o desafio de quase todos seja onde for: console, web, mobile ou gráfico.

A biblioteca **Rich** é o que há de mais inovador nesse quesito e seus aplicativos TUI ficarão ainda mais profissionais!

Essa API facilita a adição de cor e estilo para saída do terminal. Também pode renderizar tabelas bonitas, barras de progresso, markdown, código-fonte destacado por sintaxe, tracebacks e muito mais - prontos para uso.

# Instalação
Para instalar é muito simples, basta utilizar p [pip](https://pypi.org/project/pip/), você pode instalar somente para seu usuário:
{% highlight bash %}
pip install rich --user
{% endhighlight %}

Ou para todo seu sistema:
{% highlight bash %}
sudo pip install rich
{% endhighlight %}

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


# Utilização
À princípio você já pode ver todas as possibilidades de formatação rodando o comando:
{% highlight bash %}
python -m rich
{% endhighlight %}

A saída será algo do tipo:

![Python Rich](/assets/img/python/rich.png)

Outro exemplo básico de uso, utilizando style e cores hexadecimais: `vim hello.py`
{% highlight python %}
from rich.console import Console

console = Console()
console.print("Terminal", "Root", style="#ccc010 bold")
{% endhighlight %}
Rode: `python hello.py`, saída:

![Rich 2](/assets/img/python/hello-rich.png)

É possível até usar tags [HTML](https://terminalroot.com.br/2020/01/desenvolvimento-web.html), exemplo:
{% highlight python %}
from rich.console import Console

console = Console()
console.print("[bold]Acesse o site[/bold]: [bold cyan]Terminal Root[/bold cyan] [u]Linux[/u] [i]e[/i] [bold yellow]Desenvolvimento[/bold yellow].")
{% endhighlight %}
![Rich 3](/assets/img/python/html-rich.png)

Além de tabelas, veja esse gif:

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


![Rich 4](/assets/img/python/rich-table.gif)

Além de muito mais!

Acesse o repositório no GitHub e saiba mais:
### <https://github.com/willmcgugan/rich>
