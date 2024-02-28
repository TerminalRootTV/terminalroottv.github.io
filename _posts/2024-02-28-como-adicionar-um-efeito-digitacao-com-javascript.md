---
layout: post
title: "Como adicionar um efeito Digitação com JavaScript"
date: 2024-02-28 11:20:37
image: '/assets/img/js/typedjs.jpg'
description: 'Para você deixar seu site com aspecto de terminal!'
icon: 'ion:terminal-sharp'
iconname: 'JavaScript'
tags:
- javascript
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Um efeito de digitação, também conhecido como "efeito console/[terminal](https://terminalroot.com.br/tags#terminal)", é uma técnica de animação em que o texto aparece na tela como se estivesse sendo digitado, caracter por caractere, em vez de aparecer instantaneamente. 

Esse efeito é comumente usado em aplicativos, sites e apresentações para criar uma sensação de interação ou para chamar a atenção do espectador para o texto sendo exibido.

Para adicionar esse efeito ao seus projetos usando [JavaScript](https://terminalroot.com.br/tags#javascript) é muito simples usando uma biblioteca pronta: **Typed.js**!

---

# Instalação
Você pode instalar via [NPM](https://terminalroot.com.br/tags#npm), Yarn ou Bower:
{% highlight bash %}
# Com NPM
npm install typed.js

# Com Yarn
yarn add typed.js

# Com Bower
bower install typed.js
{% endhighlight %}

Após isso basta usar esse código para chamar o Typed.js:
{% highlight js %}
var typed = new Typed('.element', {
  strings: ["First sentence.", "Second sentence."],
  typeSpeed: 30
});
{% endhighlight %}


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

# Exemplo via CDN
Nesse exemplo básico veremos como implementar de forma bem fácil e rápida o Typed.js via CDN.

Basta criar um arquivo exemplo: `index.html` e adicionar o conteúdo abaixo:

{% highlight html %}
<!DOCTYPE html>
<html lang="en">
  <head>
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://unpkg.com/typed.js@2.1.0/dist/typed.umd.js"></script>
  </head>
  <body>
    <span id="element"></span>
    <script>
      var typed = new Typed('#element', {
        strings: ['<i>Esse é meu efeito</i> DIGITAÇÃO.', 'Isso é bacana! =)'],
        typeSpeed: 50,
      });
    </script>
  </body> 
  </body>
</html>
{% endhighlight %}

Depois abra no seu navegador preferido esse arquivo e veja o efeito funcionando!

---

Para mais informações acesse o [Site oficial do Typed.js](https://mattboldt.com/demos/typed-js/).



