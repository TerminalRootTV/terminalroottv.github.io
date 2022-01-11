---
layout: post
title: "Conheça o Pico CSS o Framework mais direto ao assunto"
date: 2022-01-11 11:59:19
image: '/assets/img/css/picocss.jpg'
description: 'Elegante e fácil de usar!'
icon: 'ion:terminal-sharp'
iconname: 'CSS'
tags:
- css
- desenvolvimentoweb
---

![Conheça o Pico CSS o Framework mais direto ao assunto](/assets/img/css/picocss.jpg)

---

Nós possuímos um artigo que apresenta os [Os 41 Melhores Frameworks CSS](https://terminalroot.com.br/2020/10/os-41-melhores-frameworks-css.html), mas naquela lista não há o **Pico.CSS** que trata-se de um framework [CSS](https://terminalroot.com.br/css) simples e muito fácil de usar e implementar.

Esqueça aqueles diversos nomes de *classes* que você precisa lembrar! Com **Pico.CSS** é praticamente, na maioria dos casos, só usar o elemento [HTML](https://terminalroot.com.br/html) e ele trata de fazer automaticamente toda a estilização para você usando apenas 10kB em um arquivo você consegue ter uma página elegante e alterar para *dark* ou *light* sem muito esforço.

---

# Como instalar ?
Há 3 formas de você implementar o Pico.CSS. A primeira seria você usar ele localmente, para isso basta fazer o download, descompactar e linkar no arquivo HTML:

{% highlight sh %}
wget -q https://github.com/picocss/pico/archive/refs/heads/master.zip
unzip master.zip
cd pico-master
{% endhighlight %}
> E depois linkar no seu documento HTML: `<link href="./css/pico.css" rel="stylesheet">`


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


A outra forma é usar o CDN:

{% highlight html %}
<link rel="stylesheet" href="https://unpkg.com/@picocss/pico@latest/css/pico.min.css">
{% endhighlight %}

Ou até mesmo utilizando o [NPM](https://terminalroot.com.br/2019/11/como-instalar-nodejs-no-linux-e-primeiros-passos.html):
{% highlight sh %}
npm install @picocss/pico
{% endhighlight %}

---

# Utilização
O uso é bem simples, mas por exemplo, se você está acostumado a usar o [Bootstrap](https://terminalroot.com.br/2020/02/aprenda-bootstrap-4-curso-de-desenvolvimento-web-03.html), aqui vai uma página bem básica para início do desenvolvimento:
{% highlight html %}
<!doctype html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://unpkg.com/@picocss/pico@latest/css/pico.min.css">
    <title>Olá, Pico.CSS!</title>
  </head>
  <body>
    <main class="container">
      <h1>Olá, Pico.CSS!</h1>
    </main>
  </body>
</html>
{% endhighlight %}

É possível alterar para modo dark somente adicionando a classe `data-theme="dark"` à tag `html`, exemplo:
{% highlight html %}
<!DOCTYPE html>
<html lang="en" data-theme="dark">
{% endhighlight %}

Para mais exemplos, veja esse mini vídeo:

<iframe width="910" height="390" src="https://user-images.githubusercontent.com/23470684/126863110-94061cf1-36ea-4697-94bd-2e1071a95a2f.mp4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


<!-- RECTANGLE 2 - OnParagragraph -->
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

Bem fácil, né?!

Para mais informações consulte os links abaixo:
+ Página oficial: <https://picocss.com/>
+ Documentação: <https://picocss.com/docs/>
+ Exemplos: <https://picocss.com/#examples>
+ Repositório no GitHub: <https://github.com/picocss/pico>



