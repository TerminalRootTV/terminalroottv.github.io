---
layout: post
title: "Gere Circuitos Lógicos com Python"
date: 2026-03-25 10:56:19
image: '/assets/img/python/python-tip-02.jpg'
description: "Desenhe e conecte portas: AND, OR, NOT, NAND, etc"
icon: 'ion:terminal-sharp'
iconname: 'Python'
tags:
- python
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

## Dependências
+ Windows, instale o [PIP](https://pip.pypa.io/en/stable/installation/) e depois instale o Schemdraw com o PIP:
{% highlight bash %}
pip install schemdraw
{% endhighlight %}

+ Em GNU, Linux e UNIX, crie um ambiente virtual e instale com o PIP:
{% highlight bash %}
pip install schemdraw
{% endhighlight %}

Código Python:

{% highlight python %}
import schemdraw
import schemdraw.logic as logic

with schemdraw.Drawing() as d:
    d += logic.And(inputs=2).color('blue')
    d += logic.Or().right().color('green')
    d += logic.Not().right().color('red')
    d.draw()
{% endhighlight %}

---

## [Aprenda Python](https://terminalroot.com.br/python)
### <https://terminalroot.com.br/python>

