---
layout: post
title: "Use o MS Paint diretamente no Terminal"
date: 2023-08-25 19:16:04
image: '/assets/img/python/textual-paint.jpg'
description: 'O famoso editor de imagens em forma de TUI!'
icon: 'ion:terminal-sharp'
iconname: 'Python'
tags:
- python
- tui
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Textual Paint** é um editor de imagens [TUI (Text User Interface)](https://terminalroot.com.br/tags#tui), inspirado no [MS Paint](https://apps.microsoft.com/store/detail/paint/9PCFS5B6T72H), escrito em [Python](https://terminalroot.com.br/tags#python) com a biblioteca [Textual](https://textual.textualize.io/).

Que tal testar e usar essa belezura?!

Para instalar é bem simples, basta uma o [Pip](https://pip.pypa.io/en/stable/):
{% highlight bash %}
pip install textual-paint
{% endhighlight %}

Se seu sistema apresentar alguma crítica durante a instalação é porque provavelmente ele adota algumas políticas de segurança e você precisa instalar em um **ambiente virtual**.

Para isso rode os comando na ordem:

+ Crie um ambiente e ative-o:
{% highlight bash %}
mkdir -p .local/bin/venv
python -m venv ${HOME}/.local/bin/venv
. .local/bin/venv/bin/activate

{% endhighlight %}

+ Agora instale o `textual-paint`:
{% highlight bash %}
(venv) pip install textual-paint
textual-paint
deactivate
{% endhighlight %}

+ E para rodar, use o comando:
{% highlight bash %}
exec ~/.local/bin/venv/bin/textual-paint
{% endhighlight %}

Se quiser adicionar como um comando rápido, crie um alias:
{% highlight bash %}
echo 'alias textual-paint="${HOME}/.local/bin/venv/bin/textual-paint"' >> ~/.bashrc
exec $SHELL
{% endhighlight %}

Agora é só usar o comando:
{% highlight bash %}
textual-paint
{% endhighlight %}

Para mais informações acesseo repositório oficial do Textual Paint: <https://github.com/1j01/textual-paint>.



