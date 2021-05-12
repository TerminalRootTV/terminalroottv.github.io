---
layout: post
title: "Crie Janelas para HTML5 com Javascript"
date: 2021-05-12 11:52:08
image: '/assets/img/js/winbox.jpg'
description: 'Um recurso moderno e muito interessante!'
icon: 'ion:terminal-sharp'
iconname: 'Javascript'
tags:
- javascript
- html
- desenvolvimentoweb
---

![Crie Janelas para HTML5 com Javascript](/assets/img/js/winbox.jpg)

Criar "Janelas" no DOM é algo sensacional, principalmente para desejar criar sistemas online, terminal online ou até mesmo um protótipo de sistema operacional! 😃 

E fazer isso agora ficou mais simples ainda com **Winbox.js** .

![Winbox.js](/assets/img/js/winbox.png)

**WinBox** é um gerenciador de janelas HTML5 moderno para a web. Desempenho leve e excelente, sem dependências, totalmente personalizável, gratuito e de código aberto!

Para utilizá-lo existem inúmeras formas, como:

Via [npm](https://terminalroot.com.br/2019/11/como-instalar-nodejs-no-linux-e-primeiros-passos.html)
{% highlight bash %}
npm install winbox
{% endhighlight %}

Importando o módulo via CDN:
{% highlight html %}
<script type="module">
  import WinBox from "https://unpkg.com/winbox@0.1.8/src/js/winbox.js";
</script>
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


Ou fazendo download no [site](https://nextapps-de.github.io/winbox/).

Falando em site, lá você encontrará diversos exemplos de uso e demo de janelas!

# E qual a forma mais básica de implementar?
Simples! Eu fiz um exemplo bem básico de utilização e basta você copiar o código, abrir um arquivo [html]: `vim index.html` e colar!

Abra o arquivo no [navegador](): `gio open index.html` e pronto!

## Exemplo de código:
{% highlight html %}
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Janelas com Javascript</title>
  <script src="https://rawcdn.githack.com/nextapps-de/winbox/0.1.8/dist/winbox.bundle.js"></script>
<style> #content { display:none; padding: 10px; }</style>
</head>
<body>
 <div id="content">
    <h1>Terminal Root</h1>
    <h3>Um pouco de muito sobre C++, Sistemas Operacionais, Programação e Desenvolvimento Web.</h3>
    <p>Consectetur nulla sequi distinctio enim accusantium? Architecto incidunt accusantium aut fugit commodi Autem et saepe aliquid alias hic. Atque in neque tempore animi earum? At maiores ullam quaerat aliquam mollitia</p>
    <p>Elit non vel non quisquam repellendus, consectetur Perspiciatis laboriosam nulla dolor optio vero? Odit placeat nisi pariatur incidunt est Architecto nisi libero sit fugit vitae iusto? Ut quas necessitatibus non</p>
    <h3>Acesse: <a href="https://terminalroot.com.br/">https://terminalroot.com.br/</a></h3>
</div>

<button onclick="OpenWindow()">Abrir janela</button>
<script>

  function OpenWindow(){
    document.getElementById("content").style.display = "block"; 
    var node = document.getElementById("content");

    new WinBox("Mount DOM", {
        mount: node.cloneNode(true)
    });
    document.getElementById("content").style.display = "none"; 
  }

</script>
</body>
</html>
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


Show, né?!

Visite o site do Winbox.js: <https://nextapps-de.github.io/winbox/>

E o GitHub: <https://github.com/nextapps-de/winbox>








