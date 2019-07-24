---
layout: post
title: 20 exemplos do comando tput
date: '2015-08-18T09:43:00.000-07:00'
image: '/assets/img/shell-script/tput.jpg'
description: "tput é um comando do sistema operacional Unix que faz uso de capacidades do terminal."
main-class: 'bash'
tags:
- Shell Script
- Comandos
---

![20 exemplos do comando tput](/assets/img/shell-script/tput.jpg "20 exemplos do comando tput")

[tput](http://www.gnu.org/software/termutils/manual/termutils-2.0/html_chapter/tput_1.html) é um comando do sistema operacional __Unix__ que faz uso de capacidades do __terminal__. Dependendo do sistema, __tput__ usa o __terminfo__ ou __termcap__.


+ __Mostrar quantidade de linhas do terminal(altera o resultado ao redimensionar o tamanho da janela do terminal)__
{% highlight bash %}
tput lines
{% endhighlight %}


+ __Mostrar quantidade de colunas do terminal(altera o resultado ao redimensionar o tamanho da janela do terminal)__
{% highlight bash %}
tput cols
{% endhighlight %}


+ __Posicionar o Cursor na linha 9 na coluna 6 (tput cup linha coluna) (cup = CUrsor Pointer)__
{% highlight bash %}
tput cup 6 9
{% endhighlight %}

+ __Posicionar o cursor no meio da tela__
{% highlight bash %}
Linhas=$(($(tput lines) / 2)); Colunas=$(($(tput cols) / 2)) ; tput cup $Linhas $Colunas
{% endhighlight %}

+ __Reseta as configurações do terminal (após usar: bold, rev,...)__
{% highlight bash %}
tput reset
{% endhighlight %}

+ __Mostrar o terminal em negrito__
{% highlight bash %}
tput bold
{% endhighlight %}

+ __Inverter as cores do terminal (se o fundo for preto e a cor for ver, inverte)__
{% highlight bash %}
tput rev
{% endhighlight %}

+ __Escrever com sublinhado__
{% highlight bash %}
tput smul
{% endhighlight %}

+ __Desligar sublinhado__
{% highlight bash %}
tput rmul
{% endhighlight %}

> Obs.: O comando __tput smso__ também sublinha e para desligar(voltar ao normal), usa-se o __tput rmso__


+ __Voltar uma linha (Erase Line)__
{% highlight bash %}
tput el
{% endhighlight %}

+ __Apaga a tela a partir da posição do cursor (Erase Display)__
{% highlight bash %}
tput ed
{% endhighlight %}
Obs.: Os caracteres teclados aparecerão piscando
tput blink

+ __Apagar n caracteres (Erase CHaracter) , exemplo (apaga 1 caracter)__
{% highlight bash %}
tput ech 1
{% endhighlight %}

> __Obs.:__ Há também os comandos tput cub N ; tput cuf N ; tput cub1 ; tput cuf1 ; tput ll ; tput cuu1

+ __Salvar posicao do cursor (Save Cursor)__
{% highlight bash %}
tput sc
{% endhighlight %}

+ __Restaurar a posicao normal do cursor (Restore Cursor)__
{% highlight bash %}
tput rc
{% endhighlight %}

> __Obs__.: Restaura o video ao normal

{% highlight bash %}
tput sgr0
{% endhighlight %}

__exemplo1__
      

+ __Mudar a cor FOREGROUND para vermelho (1=vermelho; 2=verde; 3=amarelo; 4=azul; 5=roxo; 6=azul claro; 7=branco; 9=limpa)__
{% highlight bash %}
tput setaf 1
{% endhighlight %}

+ __Mudar a cor BACKGROUND para vermelho (1=vermelho; 2=verde; 3=amarelo; 4=azul; 5=roxo; 6=azul claro; 7=branco; 9=limpa)__
{% highlight bash %}
tput setab 1
{% endhighlight %}

+ __Alterar o brilho__
{% highlight bash %}
tput dim
{% endhighlight %}

+ __Limpar a tela__
{% highlight bash %}
tput clear
{% endhighlight %}

+ __Deixar o cursor invisível__
{% highlight bash %}
tput civis
{% endhighlight %}

> Obs.: o tput cnorm deixa o cursor visível

+ __Toca o alarme__
{% highlight bash %}
tput bel
{% endhighlight %}
    
## Mais

> [http://linux.about.com/library/cmd/blcmdl1_setterm.htm](http://linux.about.com/library/cmd/blcmdl1_setterm.htm)

> [http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x405.html](http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x405.html)

> [http://www.bashguru.com/2010/04/how-to-handle-cursor-movement-in-shell.html](http://www.bashguru.com/2010/04/how-to-handle-cursor-movement-in-shell.html)

> [https://www.ibm.com/developerworks/aix/library/au-learningtput/](https://www.ibm.com/developerworks/aix/library/au-learningtput/)

> [http://www.gnu.org/software/termutils/manual/termutils-2.0/html_chapter/tput_1.html](http://www.gnu.org/software/termutils/manual/termutils-2.0/html_chapter/tput_1.html)

> [https://en.wikipedia.org/wiki/Tput](https://en.wikipedia.org/wiki/Tput)

> [http://linuxcommand.org/lc3_adv_tput.php](http://linuxcommand.org/lc3_adv_tput.php)

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

