---
layout: post
title: "Rode Python dentro do seu HTML"
date: 2022-05-04 08:03:50
image: '/assets/img/python/pyscript.jpg'
description: 'Feito com JavaScript!'
icon: 'ion:terminal-sharp'
iconname: 'Python'
tags:
- python
- html
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**PyScript** é um framework que permite aos usuários criar rodar [Python](https://terminalroot.com.br/tags#python) no navegador usando a interface do HTML. 

O PyScript visa fornecer aos usuários uma linguagem de programação de primeira classe que tenha regras de estilo consistentes, seja mais expressiva e mais fácil de aprender.

---

# Instalação
Para implementar é bem fácil, basta incluir o CDN do [CSS](https://terminalroot.com.br/tags#css) e do [JavaScript](https://terminalroot.com.br/tags#javascript) em seu código [HTML](https://terminalroot.com.br/tags#html), exemplo:

{% highlight html %}
<link rel="stylesheet" href="https://pyscript.net/alpha/pyscript.css" />
<script defer src="https://pyscript.net/alpha/pyscript.js"></script>
{% endhighlight %}

E depois só usar entre as tag `<py-script>` o código Python, exemplo:

{% highlight html %}
<py-script> print('Olá, Python!') </py-script>
{% endhighlight %}

Talvez você note alguma lentidão, se quiser que fique um pouco mais rápido, faça o download dos arquivos e link localmente:

{% highlight sh %}
wget https://pyscript.net/alpha/pyscript.js https://pyscript.net/alpha/pyscript.css
{% endhighlight %}

E o código HTML completo aqui:


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

{% highlight html %}
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>PyScript</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="./pyscript.css" />
  </head>
  <body>
    <py-script> print('Olá, PyScript!') </py-script>
    <script defer src="./pyscript.js"></script>
  </body>
</html>
{% endhighlight %}

Para mais informações acesse o [site oficial do PyScript](https://pyscript.net/) .

