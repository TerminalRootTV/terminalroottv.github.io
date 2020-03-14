---
layout: post
title: "Script para imprimir cores em Shell Script (Bash)"
date: '2013-10-03T18:42:00.000-07:00'
image: '/assets/img/shell-script/prompt.jpg'
description: "Atalho pra exibir cores pelo terminal"
tags:
- shellscript
---

![Script para imprimir cores em Shell Script (Bash)](/assets/img/shell-script/prompt.jpg "Script para imprimir cores em Shell Script (Bash)")

> Olá galera esse SCRIPT é igual ao '__echo__' só com cor e em português ou inglês e abreviações dos atributos. Serve pra quando você criar um script, ao invés de de você usar o comando '__echo__' utilizar o comando '__cor__' pré disponibilizado no seu __.bashrc__ , para isso veja como incluí-lo no seu __.bashrc__ e não se esqueça de ler o cabeçalho do __SCRIPT__ .

#### COMO INCLUIR NO SEU .bashrc

+ 1 - Salve o arquivo no local desejado;

+ 2 - Dê a permissssão de execução;
{% highlight bash %}
chmod +x cor.sh
{% endhighlight %}

+ 3 - Abra se __.bashrc__ ;
{% highlight bash %}
vi /home/$USER/.bashrc
{% endhighlight %}

+ 4 - crie uma nova linha no final do arquivo, com o seguinte código;
{% highlight bash %}
alias cor="/home/$USER/cor.sh"
{% endhighlight %}

+ 5 - Salve, feche e abra o terminal(se já tiver aberto, abra um novo terminal) e teste;
{% highlight bash %}
cor "Teste imprimindo em cores" azul negrito
{% endhighlight %}

## Script

{% highlight bash %}
#!/bin/bash
# --------------------------------------
# ./cor.sh
#
# Script para imprimir cores em Shell Script (Bash)
#
# Uso:  ./cor.sh 'Texto' [cor] [ atributo]
#
# Ex.:  ./cor.sh 'Texto'
#    ./cor.sh 'Texto' amarelo
#    ./cor.sh 'Texto' amarelo negrito
#
# Observações:
#
#   1 - use o Texto somente entre aspas ''
#   2 - use a ordem: [1° texto] [2° cor] [3° atributo]
# 3 - se você não informar a cor, será branca
# 4 - se você não informar o atributo, será normal
#   5 - use o nome das cores (vermelho, verde, amarelo, azul, rosa, branco e preto), ou em inglês
#   6 - use os atributos (normal ou nor, negrito ou neg, sublinhado ou sub e reverso ou rev)
#
# Autor: Marcos da B. M. Oliveira , www.terminalroot.com.br
# Desde: Qui 03 Out 2013 21:56:14 BRT 
# Licença: GPL
# --------------------------------------
##############--COR--###############
if [ "$2" ]; then
 case "$2" in
  vermelho | red)
   cor="31m"
  ;;
  verde | green)
   cor="32m"
  ;;
  amarelo | yellow)
   cor="33m"
  ;;
  azul | blue)
   cor="34m"
  ;;
  rosa | pink)
   cor="35m"
  ;;
  cinza | gray)
   cor="36m"
  ;;
  branco | white)
   cor="37m"
  ;;
  preto | black)
   cor="30m"
  ;;
  *)
   cor="37m"
  ;;
 esac
else
  cor="37m";
fi
  
##############--ATRIBUTO--###############
if [ "$3" ]; then
 case "$3" in
  normal | nor)
   atributo="0"
  ;;
  negrito | neg | bold)
   atributo="1"
  ;;
  sublinhado | sub | underline)
   atributo="4"
  ;;
  reverso | rev)
   atributo="7"
  ;;
 esac
else
  atributo="0";
fi
##############--TEXTO--###############
texto="$1"
echo -e "\033[$atributo;$cor$texto\033[0m"
{% endhighlight %}

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

