---
layout: post
title: "Conheça o Framework CSS que deixa seu site no estilo MS-DOS"
date: 2021-08-18 08:34:36
image: '/assets/img/css/tuicss.jpg'
description: 'Dá até pra criar um Turbo Vision online! 😃 '
icon: 'ion:terminal-sharp'
iconname: 'CSS'
tags:
- css
---

![Conheça o Framework CSS que deixa seu site no estilo MS-DOS](/assets/img/css/tuicss.jpg)

**TuiCss** é uma biblioteca voltada para a criação de aplicações web utilizando uma interface baseada em tabela ASCII, como os antigos aplicativos MS-DOS.

Este tipo de interface é muito elegível devido às cores de ultra-contraste usadas e aos efeitos reduzidos usados nos componentes da vista.

A base deste projeto é [Turbo Vision Framework](https://terminalroot.com.br/2021/05/instale-o-editor-turbo-para-c-cpp-e-mate-saudade-do-turbo-vision.html), mas alguns outros frameworks foram verificados também para introduzir alguns recursos ao TuiCss, como curses, ncurses, Newt, etc


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
Você pode usar o TuiCss via gerenciador de pacotes [javascript](https://terminalroot.com.br/tags#javascript), exemplo usando o [npm](https://terminalroot.com.br/2019/11/como-instalar-nodejs-no-linux-e-primeiros-passos.html):
{% highlight bash %}
sudo npm --global install tuicss
{% endhighlight %}

Ou fazer o download e *linkar* localmente:
{% highlight bash %}
wget https://codeload.github.com/vinibiavatti1/TuiCss/zip/refs/heads/master
unzip TuiCss-master.zip
cd unzip TuiCss-master
vim index.html
{% endhighlight %}

E adicionar o [css](https://terminalroot.com.br/tags#css) e o [javascript](https://terminalroot.com.br/tags#javascript):
{% highlight html %}
<link rel="stylesheet" href="dist/tuicss.min.css"/>
<script src="dist/tuicss.min.js"></script>
{% endhighlight %}

# Utilização
Salve esse exemplo `index.html` na sua máquina e veja alguns *widgets* que podem ser implementados:

{% highlight html %}
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <title>TUI.css</title>
      <link rel="stylesheet" href="dist/tuicss.min.css"/>
      <script src="dist/tuicss.min.js"></script>
      <style type="text/css" media="all">
         button, input { margin-top: 20px; } 
      </style>
   </head>
   <body class="tui-bg-blue-black">
      <nav class="tui-nav">
         <ul>
            <li class="tui-dropdown">
               <span class="red-168-text">F</span>ile
               <div class="tui-dropdown-content">
                  <ul>
                     <li><a href="#!"><span class="red-168-text">N</span>ew</a></li>
                  </ul>
               </div>
            </li>
         </ul>
      </nav>
      <br>
      <div class="buttons">
         <!-- Default -->
         <button class="tui-button">Button</button>
         <br>
         <!-- Input -->
         <input type="button" class="tui-button" value="Input" />
         <br><br>
         <!-- Anchor -->
         <a href="#!" class="tui-button">Anchor</a>
         <br>
         <!-- Custom Color -->
         <button class="tui-button orange-168 white-text">Custom</button>
         <br>
         <!-- Disabled -->
         <button class="tui-button red-168 white-text disabled" disabled>Disabled</button>
         <br>
         <!-- Focused -->
         <button class="tui-button" autofocus>Focused</button>
         <br>
      </div>
      <br>
      <div class="progress-bar">
         <div class="tui-window">
            <fieldset class="tui-fieldset tui-border-double">
               <legend>Carregando ...</legend>
               <!-- Indeterminate --> 
               <div class="tui-progress-bar">
                  <span class="tui-indeterminate"></span>
               </div>
            </fieldset>
         </div>
      </div>
   </body>
</html>
{% endhighlight %}
# Exemplos

### BIOS
![BIOS](https://camo.githubusercontent.com/fb5dc9c8a6f1a934667f002907ae17c0cc664688f8831cb0dd11326e0fb8d032/68747470733a2f2f692e6962622e636f2f504e4279524d312f7475696373732d62696f732e706e67)


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

### PC START
![PC START](https://camo.githubusercontent.com/2255f07ecfdde366ccb82b8a13aafa76db89e0a08b4e107521cc64c931c60162/68747470733a2f2f692e6962622e636f2f445244547642792f5475692d4373732d7063737461727475702e706e67)

### Turbo Vision
![Turbo Vision](https://camo.githubusercontent.com/d735bb2609dcd3b82891f35ca969ecc1a695ea49472a2722ed84f395147d036a/68747470733a2f2f692e6962622e636f2f584c396e6436322f5475692d4373732d547572626f2d566973696f6e2d4578616d706c652e706e67)

Para mais exemplos acesse [esse link](https://github.com/vinibiavatti1/TuiCss/wiki/Examples) .



