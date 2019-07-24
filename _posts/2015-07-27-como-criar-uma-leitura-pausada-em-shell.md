---
layout: post
title: "Como criar uma leitura pausada em Shell Script"
date: '2015-07-27T18:56:00.000-07:00'
image: '/assets/img/shell-script/leitura.jpg'
description: "Veja o código e leia os cometários para exercitar"
main-class: 'bash'
tags:
- Shell Script
---
![Como criar uma leitura pausada em Shell Script](/assets/img/shell-script/leitura.jpg "Como criar uma leitura pausada em Shell Script")
 

> Acabei de fazer esse script só pra estudar comandos e quis compartilhá-lo com vocês. Basicamente ele lê um texto como na imagem do GIF abaixo, serve como aprendizado e exercício.


No próprio script possui as explicações nos __#comentários__. Tente melhorar alguma coisa, ou adicionar mais funcionalidades. :)


{% highlight bash %}
#!/bin/bash
# Como criar uma leitura pausada em Shell Script
# http://www.terminalroot.com.br/
# limpamos a tela resetando os comandos
reset
# frase que iremos ler, pode usar tb: frase="$(cat texto.txt)" , para ler um arquivo .txt ou outro
frase="O primeiro shell Unix, o sh criado por Ken Thompson, foi modelado depois do shell Multics, em si modelado com base no programa RUNCOM de Louis Pouzin.";
# Contamos quantos caracteres tem a string/frase/texto
tam="${#frase}";
# desligamos o cursor
setterm -cursor off;
# escolhemos a posição de início da leitura na tela
tput cup 2 4;
# iniciamos o loop com seq de 0 até o máximo que é o tamanho da string
for i in $(seq 0 $tam)
do
 # lêmos 1 caracter na posição i da variável "frase"
 echo -en "${frase:$i:1}"
 
 # pausamos de acordo com o tempo q desejamos
 sleep 0.1
done
# só pulamos mais uma linha
echo -e "\n";
# religamos o cursor
setterm -cursor on;
exit 0
{% endhighlight %}


## Valeu!

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

