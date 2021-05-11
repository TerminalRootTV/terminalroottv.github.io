---
layout: post
title: "Crie Barras de Progresso facilmente em Python"
date: 2021-05-11 10:31:12
image: '/assets/img/python/tqdm.png'
description: 'Rápido, fácil e elegante!'
icon: 'ion:terminal-sharp'
iconname: 'Python'
tags:
- python
---

![Crie Barras de Progresso facilmente em Python](/assets/img/python/tqdm.png)

Após a postagem sobre [como criar barras de progresso com C++](https://terminalroot.com.br/2021/05/crie-barras-de-progresso-facilmente-em-cpp.html), algumas pessoas me perguntaram se havia alguma ferramenta para [Python](https://terminalroot.com.br/tags#python), e lógico que há várias!

A mais simples e fácil de usar é a **tqdm** .

**tqdm** deriva da palavra árabe taqaddum (تقدّم ), que pode significar "progresso" e é uma abreviação de "Eu te amo tanto" em espanhol (te quiero demasiado).

Com ela é possível criar rapidamente barras de progresso inteligente - basta envolver qualquer iterável com tqdm e pronto!

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


# Instalação
Para instar é bem simples, basta tero [pip](https://pypi.org/project/pip/)

E então usá-lo, exemplo:
{% highlight bash %}
pip install tqdm
{% endhighlight %}

Se tiver problema com a instalação, tente somente para seu usuário, exemplo:
{% highlight bash %}
pip install tqdm --user
{% endhighlight %}

Há ainda a possibilidade de instalar pela [branch](https://terminalroot.com.br/git) de desenvolvimento
{% highlight bash %}
pip install "git+https://github.com/tqdm/tqdm.git@devel#egg=tqdm"
{% endhighlight %}

# Exemplo básico
Agora basta importar o `tqdm` no seu código e implementar
> `vim progresso.py`

{% highlight python %}
from tqdm import tqdm
from time import sleep
for i in tqdm(range(10000)):
    sleep(0.001)
{% endhighlight %}

E testar:
{% highlight bash %}
python progresso.py
{% endhighlight %}

A saída será animada, veja parte da animação simplificada:
{% highlight bash %}
63%|████████████████████████████████████████████▎                         | 3034/10000 [00:03<00:08, 815.13it/s]
{% endhighlight %}

E ainda existem várias formas de implementar, como por exemplo, direto pelo prompt:
{% highlight bash %}
seq 9999999 | tqdm --bytes | wc -l
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


Ou ainda com os parametros: `--unit_scale` e `--total [N]` combinados:
{% highlight bash %}
seq 9999999 | tqdm --unit_scale --total 999999 | wc -l
{% endhighlight %}

Show, né?!

Para mais informações, rode:
{% highlight bash %}
tqdm --help
{% endhighlight %}

E visite o site oficial: <https://tqdm.github.io/>



