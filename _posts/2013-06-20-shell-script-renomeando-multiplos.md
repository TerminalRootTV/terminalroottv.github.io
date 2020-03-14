---
layout: post
title: 'Renomear múltiplos arquivos com Shell Script'
date: '2013-06-20T18:38:00.001-07:00'
image: '/assets/img/shell-script/terminal70.jpg'
description: "Renomeia arquivos, sem alterar a extensão do mesmo."
tags:
- shell script
---

![Renomear múltiplos arquivos com Shell Script](/assets/img/shell-script/terminal70.jpg "Renomear múltiplos arquivos com Shell Script")

## Segue abaixo um Script para renomear múltiplos arquivos de uma vez só!


{% highlight bash %}
#!/bin/bash
#----------------------------------------------------------------------------
# renomear.sh
# http://www.terminalroot.com.br/
# Renomeia arquivos, sem alterar a extensão do mesmo.
# Se não passar parametro, renomeará todos com números, ex.: (1).jpg, (2).odt, ...
# Passar parametro: ./renomear WebImagens
# Se usado o parametro, resultará, ex: WebImagens(1).jpg, WebImagens(2).jpg,...
# Uso: ./renomear.sh [opcional/nome]
# Ex.: ./renomear.sh MeusArquivos
#
# Autor: Marcos Oliveira
# Desde: Qui 20 Jun 2013 19:25:28 BRT 
# Versão: 3
# Licença: GPL
# ----------------------------------------------------------------------------
[ -e $1 ] && param="" || param=$1
count=0
	for file in $(ls)
		do
			count=$((count+1))
			ext=$(echo $file | cut -d"." -f2)	
			[ [!-e] ] && mv -b $file "$param($count).$ext"		
	done
echo "Foram renomeados: "$(ls | wc -l) "arquivos $param($count) !"
{% endhighlight %}

## Comente!

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

