---
layout: post
title: "Customize sua página com visual do Windows 98 com esse CSS"
date: 2021-06-01 17:19:37
image: '/assets/img/css/98css.jpg'
description: 'Curta a nostalgia e criar um Windows 98 online!'
icon: 'ion:terminal-sharp'
iconname: 'Desenvolvimento Web'
tags:
- css
- html
---

![Customize sua página com visual do Windows 98 com esse CSS](/assets/img/css/98css.jpg)

Dia desse nós postamos esse [javascript](https://terminalroot.com.br/2021/05/crie-janelas-para-html5-com-javascript.html) que cria janelas para o documento [HTML4](https://terminalroot.com.br/2020/01/desenvolvimento-web.html).

Agora imagine unir ao **98.css** e fazer um [Windows 98](https://terminalroot.com.br/2020/05/utilize-online-o-windows-93-o-sistema-que-a-microsoft-nao-lancou.html) online ? Seria um bom exercício!

Ou até mesmo deixar seu site ou blog com o visual do **Windows 98** .

---

# 98.css
Trata-se de uma biblioteca [CSS](https://terminalroot.com.br/css/) para você viajar na nostalgia!

Com essa biblioteca é possível criar botões, fieldsets,... somente usando elementos do HTML. 

Esta biblioteca não contém JavaScript, ela apenas estiliza seu HTML com algum CSS. Isso significa que 98.css é compatível com a estrutura de front-end de sua escolha.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Como utilizar?
Você pode incluir ela no seu HTML com a tag `<link>`:
{% highlight html %}
<link
  rel="stylesheet"
  href="https://unpkg.com/98.css"
>
{% endhighlight %}

Ou instalar via [npm](https://terminalroot.com.br/2019/11/como-instalar-nodejs-no-linux-e-primeiros-passos.html):
{% highlight bash %}
npm install 98.css
{% endhighlight %}

Para implementá-la basta seguir [esses exemplo](https://jdan.github.io/98.css/). Mas se quiser um exemplo já prontinho, eu mesmo elaborei um e você pode copiar o código abaixo, salvar em um arquivo de qualquer nome, exemplo: `exemplo.html` e abrir com seu navegador.

> Código do `exemplo.html`

Ahhh! Quase ia esquecendo...

Quando abrir no navegador, não esqueça de clicar em **Clique aqui para abrir uma janela** e em seguida clique em **Sim** para lembrar justamente dessa época! 😃 

{% highlight html %}
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <title>Windows 98 por 98.css</title>
      <link rel="Shortcut Icon" type="image/x-icon" href="https://bit.ly/3fDbJ5A">
      <link rel="stylesheet" href="https://unpkg.com/98.css" >
      <script>
         function abreJanela(){
           document.getElementById("janela").style.display = "block";
         }
         
         function fechaJanela(){
           document.getElementById("janela").style.display = "none";
           document.getElementById("bsod").style.display = "none";
         }
         
         function bsod(){
           document.getElementById("bsod").style.display = "block";
         }
      </script>
      <style>
         #all {
         /*background: silver;*/
         box-shadow: inset -1px -1px #0a0a0a,inset 1px 1px #dfdfdf,inset -2px -2px grey,inset 2px 2px #fff;
         padding: 10px;
         width: 1024px;
         height: 600px;
         float: right;
         margin-right:800px;
         } 
         #bsod {
         background: url('TerminalRoot/terminalroottv.github.io/assets/img/windows/bsod.jpg');
         width: 400px;
         height: 222px;
         float: right;
         margin-right:20%;
         margin-top:-20%;
         display: none;
         }
         #janela {
         /*background: silver;*/
         box-shadow: inset -1px -1px #0a0a0a,inset 1px 1px #dfdfdf,inset -2px -2px grey,inset 2px 2px #fff;
         padding: 3px;
         width: 200px;
         float: right;
         margin-right:50%;
         display: none;
         }
      </style>
   </head>
   <body style="background-color: #c0c0c0;">
      <div id="all">
         <div class="title-bar">
            <div class="title-bar-text">
               Exemplo de Uso do 98.css por Marcos Oliveira - terminalroot.com.br
            </div>
            <div class="title-bar-controls" >
               <button aria-label="Minimize"></button>
               <button aria-label="Maximize"></button>
               <button aria-label="Close" onclick="fechaJanela()"></button>
            </div>
         </div>
         <p>Ipsum nostrum magni aspernatur cum odit sed Sapiente consequuntur deleniti animi neque expedita debitis Adipisci incidunt fuga tempora dolor adipisci Dolores nulla ipsa aliquid et voluptates Rerum magnam voluptate dignissimos.</p>
         <hr>
         <p>Dolor dicta necessitatibus cumque autem possimus corrupti! Omnis veniam maiores provident sequi doloremque? Cum saepe in soluta ad enim itaque. Eum natus mollitia optio expedita suscipit amet beatae Aliquid ratione!</p>
         <hr>
         <p><button onclick="abreJanela()">Clique aqui para abrir uma janela</button></p>
         <p><button disabled>Aqui você não pode clicar</button></p>
         <div id="janela">
            <div class="title-bar">
               <div class="title-bar-text">
                  Janelinha das antiga
               </div>
               <div class="title-bar-controls" >
                  <button aria-label="Minimize"></button>
                  <button aria-label="Maximize"></button>
                  <button aria-label="Close" onclick="fechaJanela()"></button>
               </div>
            </div>
            <div class="window-body">
               <p>Deseja instalar o window ?</p>
               <section class="field-row" style="justify-content: flex-end">
                  <button onclick="bsod()">Sim</button>
                  <button onclick="fechaJanela()">Não</button>
               </section>
            </div>
         </div>
         <br>
         <div class="field-row">
            <input checked type="checkbox" id="example2">
            <label for="example2">Estou disponível!</label>
         </div>
         <div class="field-row">
            <input disabled type="checkbox" id="example3">
            <label for="example3">Eu indisponível.</label>
         </div>
         <div class="field-row">
            <input checked disabled type="checkbox" id="example4">
            <label for="example4">Estou inativo, mas quem sabe talvez ...</label>
         </div>
         <br>
         <fieldset style="width: 200px;">
            <legend>Today's mood</legend>
            <div class="field-row">
               <input id="radio13" type="radio" name="fieldset-example2">
               <label for="radio13">Bjarne Stroustroup</label>
            </div>
            <div class="field-row">
               <input id="radio14" type="radio" name="fieldset-example2">
               <label for="radio14">Mark Kerninghan</label>
            </div>
            <div class="field-row">
               <input id="radio15" type="radio" name="fieldset-example2">
               <label for="radio15">Dennis Ritchie</label>
            </div>
            <div class="field-row">
               <input id="radio16" type="radio" name="fieldset-example2">
               <label for="radio16">Bill Gates</label>
            </div>
         </fieldset>
         <br>
         <div class="field-row-stacked" style="width: 200px">
            <label for="text18">Informe o serial do Windows</label>
            <input id="text18" type="text" />
         </div>
         <div class="field-row-stacked" style="width: 200px">
            <label for="text19">Informe o código de ativação</label>
            <input id="text19" type="text" />
         </div>
         <br>
         <div class="field-row" style="width: 300px">
            <label for="range22">Volume:</label>
            <label for="range23">Low</label>
            <input id="range23" type="range" min="1" max="11" value="5" />
            <label for="range24">High</label>
         </div>
         <p>O que achou desse artigo ?</p>
         <select>
            <option>5 - Incrível!</option>
         </select>
         <br>
         <div id="bsod"></div>
      </div>
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

Show, né?! Para mais informações visite o [site do 98.css](https://jdan.github.io/98.css/) .


