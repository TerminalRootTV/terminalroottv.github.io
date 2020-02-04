---
layout: post
title: "Customize o Alert do seu Javascript"
date: 2020-02-04 15:22:22
image: '/assets/img/js/sweetalert.jpg'
description: 'Torna as mensagens pop-up fáceis e bonitas.'
tags:
- javascript
- js
- reactjs
- vuejs
- angularjs
- sweetalert
- html
- css
---

![Customize o Alert do seu Javascript](/assets/img/js/sweetalert.jpg)

A maioria das aplicações web precisam, em algum momento retornar um **feedback** para o usuário, ou solicitar alguma informação através de janelas de **alerta** ou janelas **pop-up**. O javascript puro oferece as funções `alert`, `confirm` e `prompt` para tal propósito, mas além de bloquear o navegador, o layout dessas janelas não é configurável, variando de acordo com o navegador.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Devido a esses problemas, a maioria das pessoas preferem desenvolver suas próprias janelas **pop-up** com o uso de **div** e [CSS](https://terminalroot.com.br/css). Essa solução funciona bem, se você tiver bastante paciência para definir a janela, manipular a interação através do javascript, tratar incompatibilidades de browser etc.

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Para quem não quer ter todo esse trabalho, existem APIs específicas para exibição de janelas que já vem com um layout padrão, mas que pode ser alterado via [CSS](https://terminalroot.com.br/css), e já trata da interação da janela de forma simples.

Nesse post vou descrever uma dessas APIs, o SweetAlert, que fornece alertas bastante agradáveis, e que podem ser utilizadas de forma bem simples.

# Instalação e Uso

Você pode usar diretamente pelo link do [SweetAlert](https://sweetalert.js.org/), exemplo:
> Use a função `swal`, **sw** eet **al** ert

{% highlight js %}
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<a href="#" onclick="swal('Testanto o SweetAlert.');">Clique aqui</a>
{% endhighlight %}

Após clicar vai surgir a mensagem assim:
[SweetAlert usando online](/assets/img/js/sweetalert-1.png)

Ou baixando e linkando localmente, exemplo:

{% highlight bash %}
wget https://unpkg.com/sweetalert/dist/sweetalert.min.js
{% endhighlight %}

{% highlight js %}
<script src="sweetalert.min.js"></script>
<a href="#" onclick="swal('Testanto o SweetAlert.');">Clique aqui</a>
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

Ainda pode usar com combinado NPM/Yarn com uma ferramenta como o [Browserify](http://browserify.org/) ou [Webpack](https://webpack.js.org/) que é a maneira mais correta de uso e você pode customizar diversos outros tipos de mensagens: .
{% highlight bash %}
npm install sweetalert --save
{% endhighlight %}

Em seguida, basta importá-lo para o seu aplicativo:
{% highlight js %}
import swal from 'sweetalert';
{% endhighlight %}

Para mais informações de uso como exemplos para [React.js](https://reactjs.org/) e [Vue.js](https://vuejs.org/) consulte o guia completo: <https://sweetalert.js.org/guides/>

Conheça também o [sweetalert2](https://sweetalert2.github.io/) que há outras formas de implementações, como por exemplo com o [Angular.js](https://angularjs.org/).

Ainda não aprender [Javascript](https://terminalroot.com.br/2020/01/javascript.html)? Assista o vídeo abaixo e entre para esse vasto mundo!
<iframe width="920" height="400" src="https://www.youtube.com/embed/HI6YZJxoaIQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Até mais!

<!-- RETANGULO LARGO -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Informat -->
<ins class="adsbygoogle"
style="display:block"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="2327980059"
data-ad-format="auto"
data-full-width-responsive="true"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

### Links úteis
+ <https://sweetalert.js.org/>
+ <https://sweetalert2.github.io/>
+ <http://browserify.org/>
+ <https://reactjs.org/>
+ <http://www.matera.com/blog/post/alertas-amigaveis-com-a-api-sweetalert>
+ <https://terminalroot.com.br/css>
+ <https://terminalroot.com.br/html>
