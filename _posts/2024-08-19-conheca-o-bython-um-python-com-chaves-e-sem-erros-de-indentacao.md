---
layout: post
title: "Conheça o Bython, um Python com chaves e sem erros de indentação"
date: 2024-08-19 10:19:35
image: '/assets/img/python/bython.jpg'
description: "🐍 Um Python para os haters de Python! 😃"
icon: 'ion:terminal-sharp'
iconname: 'Python'
tags:
- python
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Se você é daquele que gosta de [Python](https://terminalroot.com.br/tags#python), mas acha chato os *erros de indentação* e falta do [C-style](https://terminalroot.com.br/tags#linguagemc) com uso de *chaves*(`{ }`), então o **Bython** é pra você.

Ou seja, Bython é um **B**rackets Python, um Python com chaves!


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
Para instalar você pode usar o [Pip](https://pypi.org/project/pip/): `pip3 install bython`. Se seu sistema emitiu *falha*, então você precisa criar um `venv`:
{% highlight bash %}
mkdir -p ~/.local/bin
python -m venv ~/.local/bin/venv
. ~/.local/bin/venv/bin/activate
pip install bython
{% endhighlight %}

Após isso é só testar com um arquivo `.py`, exemplo: `main.py`:
{% highlight python %}
def cout(str){
  print(str)
}

cout("Olá, Bython")

{% endhighlight %}

E rodar via linha de comando:
{% highlight bash %}
bython main.py
{% endhighlight %}
> Para sair do `venv` digite: `deactivate`.

Ou se não estiver na `venv`, use o caminho completo:
{% highlight bash %}
~/.local/bin/venv/bin/bython main.py
{% endhighlight %}

Estranho e legal ao mesmo tempo, né?! 😃 

Para mais informações acesse: <https://github.com/mathialo/bython>.



