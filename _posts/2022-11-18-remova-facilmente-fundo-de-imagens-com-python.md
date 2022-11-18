---
layout: post
title: "Remova facilmente fundo de imagens com Python"
date: 2022-11-18 18:52:09
image: '/assets/img/python/bird.jpg'
description: 'Com somente 5 linhas de código!'
icon: 'ion:terminal-sharp'
iconname: 'Python'
tags:
- python
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

Eu gostaria de fazer um texto bem detalhado, mas essa ferramenta em [Python](https://terminalroot.com.br/tags#python) é muito simples e direta ao ponto!

Basta instalar o [pip](https://pypi.org/project/pip/) e com o `pip` instalar o pacote `remove`:

{% highlight bash %}
pip install remove --user
{% endhighlight %}
> O parâmetro `--user` deixará esse pacote/módulo/biblioteca disponível somente para seu usuário: `${HOME}` é necessário possuir o diretório `~/.local/bin` incluido na sua variável de ambiente `${PATH}`, se não estiver, rode o comando: 

{% highlight bash %}
echo 'export PATH="${PATH}:${HOME}/.local/bin"' >> ~/.bashrc
{% endhighlight %}
> Se quiser para todos usuários do sistema, rode: `sudo pip install remove`.


Agora é só criar um código básico, exemplo:

> `code.py`
{% highlight python %}
from rembg import remove
from PIL import Image
input = Image.open("bird.png")
output = remove(input)
output.save("output.png")
{% endhighlight %}
> A imagem sem fundo será salva no diretório que você executou o código e o nome dela será: `output.png`

Caso queria testar com a imagem desse exemplo, salve-a:

![bird.png](/assets/img/python/bird.png) 

Muito bom, né?!



