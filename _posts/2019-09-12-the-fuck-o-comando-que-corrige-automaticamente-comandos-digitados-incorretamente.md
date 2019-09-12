---
layout: post
title: "The Fuck, O Comando que CORRIGE Comandos Digitados Incorretamente"
date: 2019-09-12 12:15:37
image: '/assets/img/comandos/thefuck.jpg'
description: 'Linus Torvalds curtiu esse comando! =) '
main-class: 'shell'
tags:
- comandos
- shell
- shellscript
---

![The Fuck, O Comando que CORRIGE Automáticamente Comandos Digitados Incorretamente](/assets/img/comandos/thefuck.jpg "Comando Shell The Fuck")


Que não se lembra da [loquacidade](https://www.dicionarioinformal.com.br/papagaiada/) do [Linus Torvalds](https://www.youtube.com/watch?v=yR-oM4xN1D0) sobre a [NVidia](https://youtu.be/iYWzMvlj2RQ?t=29) ? 😱 !!!

Mas como tudo no mundo [Linux](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Linux) se transforma em "*font de inspiração*", isso inspirou o modelo [Fuck ╭∩╮](https://pt.wikipedia.org/wiki/Fuck_(g%C3%ADria)) 😃! 

## Introdução

O comando/programa [TheFuck](https://github.com/nvbn/thefuck) é um comando que corrige comandos que você digitou incorretamente, por exemplo:
Supondo que você escreveu `aptget install vim` , e depois você digitar `fuck` , ele corrige automáticamente seu comando digitando corretamente, de acordo com os exemplos apresentados no *gif* abaixo:

![Exemplo de uso do comando fuck](https://raw.githubusercontent.com/nvbn/thefuck/master/example.gif)

O comando `fuck` foi inspirado num tweet que o usuário da conta fez um [meme](https://www.pngfind.com/pngs/m/27-276154_black-mirror-meme-face-png-download-transparent-png.png), veja o tweet abaixo:

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

<div class="text-center">
  <blockquote class="twitter-tweet" data-lang="pt"><p lang="en" dir="ltr">Favourite thing in my .bashrc remains: <br>alias fuck=&#39;sudo $(history -p \!\!)&#39; <a href="http://t.co/gCRF9RLvHL">pic.twitter.com/gCRF9RLvHL</a></p>&mdash; Liam O 🦆 (@liamosaur) <a href="https://twitter.com/liamosaur/status/506975850596536320?ref_src=twsrc%5Etfw">3 de setembro de 2014</a></blockquote>
  <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
</div>

## Como INSTALAR essa bagaça ?

Tente procurar com o [gerenciador de pacotes da sua distro](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=gerenciador%20de%20pacotes%20da%20sua%20distro) , por exemplo no [Gentoo](https://terminalroot.com.br/2017/05/como-instalar-o-gentoo.html) eu pesquisei e há no [Portage](https://wiki.gentoo.org/wiki/Portage) , logo pra instalar basta rodar:

{% highlight bash %}
sudo emerge thefuck
{% endhighlight  %}

Use a ferramenta de pesquisa da sua distro!

![emerge --search thefuck](/assets/img/comandos/emerge-search-thefuck.png)

Mas caso não tenha, instale via o [GitHub do TheFuck](https://github.com/nvbn/thefuck).

## Rodando o fuck!

Bom, para usar vocês já viram que é bem simples, mas caso tenha alguma dúvida ou queira verificar opções e/ou customizações, utilize a ajuda do [programinha]() para mais informações: `fuck --help`.

No meu caso eu tentei abrir um arquivo com o [Nano](https://terminalroot.com.br/2015/10/o-editor-de-texto-nano.html) , mas aí uma mensagem foi gerada e eu usei o **fuck** e ele corrigiu atomáticamente! 😜

{% highlight bash %}
nano arquivo.txt
Editor de texto Nutella detectado. Comando não pode ser executado
fuck
vim arquivo.txt
{% endhighlight  %}

E então ele corrigiu [da melhor forma possível](https://terminalroot.com.br/vim) !!!

Curtiu o ~~fuck~~, me refiro ao software =) , conte-nos utilizando o campo de comentários!

Valeu e até a próxima!

    
