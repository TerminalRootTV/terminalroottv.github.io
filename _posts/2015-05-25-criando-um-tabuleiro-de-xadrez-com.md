---
layout: post
title: "Criando um tabuleiro de xadrez com Shell Script"
date: '2015-05-25T18:21:00.000-07:00'
image: '/assets/img/shell-script/chess-shell.jpg'
description: "Programação Shell Script de muita diversão. O script a seguir imprime um tabuleiro de xadrez com 8 × 8 quadrados intercalação preto e branco."
main-class: 'bash'
tags:
- Shell Script
---
![Criando um tabuleiro de xadrez com Shell Script](/assets/img/shell-script/chess-shell.jpg "Criando um tabuleiro de xadrez com Shell Script")

Programação [Shell Script](http://www.terminalroot.com.br/shell/) de muita diversão. O script a seguir imprime um __tabuleiro de xadrez__ com __8 × 8__ quadrados intercalação preto e branco. Usando simples loops de __O (n ^ 2)__ e uma matemática simples produz a impressão de tabuleiro de xadrez.

## Código

{% highlight bash %}
#!/bin/sh
# Criando um tabuleiro de xadrez com Shell Script
# http://www.terminalroot.com.br/ 
for i in $(seq 1 8)
do
 for j in $(seq 1 8)
 do
 S=$(((i+j)%2))
 if [ $S -eq 0 ]
 then
 echo -n "33[47m " # white
 else
 echo -n "33[40m " # black
 fi
 done
 echo -n "33[40m" # black, ensure it exists normally
 echo "" # new line
done
{% endhighlight %}


Via: https://helloacm.com/

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

