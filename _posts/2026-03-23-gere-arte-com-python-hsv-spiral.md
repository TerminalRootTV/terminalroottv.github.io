---
layout: post
title: "Gere Arte com Python (HSV Spiral)"
date: 2026-03-23 12:09:11
image: '/assets/img/python/python-tip-01.jpg'
description: "⭕ A cada iteração, o ângulo muda e a cor avança no espectro HSV, criando esse efeito de espiral com gradiente arco-íris."
icon: 'ion:terminal-sharp'
iconname: 'Python'
tags:
- python
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Usando `turtle` e `colorsys` para gerar um padrão geométrico colorido.

---

## Dependências
+ No [Windows](https://terminalroot.com.br/tags#windows) com [WinGet](https://winstall.app/apps/CarlWenrich.PythonTkGuiBuilder):
{% highlight bash %}
winget install -e --id CarlWenrich.PythonTkGuiBuilder
{% endhighlight %}

+ Em [distros GNU/Linux com APT](https://terminalroot.com.br/tags#gnulinux):
{% highlight bash %}
sudo apt install python3-tk
{% endhighlight %}

---

## Código Python
> `main.py`

{% highlight python %}
import colorsys
import turtle

t = turtle.Turtle()
s = turtle.Screen()

s.bgcolor('black')
t.speed(0)

n = 36
h = 0

for i in range(460):

    c = colorsys.hsv_to_rgb(h, 1, 0.8)
    h += 1/n
    t.color(c)
    t.left(145)

    for j in range(5):
        t.forward(300)
        t.left(150)
{% endhighlight %}

Depois basta rodar:

{% highlight bash %}
python main.py
{% endhighlight %}

---

## [Aprenda Python](https://terminalroot.com.br/python)
### <https://terminalroot.com.br/python>



