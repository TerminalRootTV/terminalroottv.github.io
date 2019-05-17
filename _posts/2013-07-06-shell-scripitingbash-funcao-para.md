---
layout: post
title: "Shell Scripiting (Bash): Função para mostrar qual seu IP na internet"
date: '2013-07-06T18:51:00.001-07:00'
image: '/assets/img/shell-script/terminal110.jpg'
description: 'Analise o código e os comentários.'
main-class: 'bash'
tags:
- Shell Script
- SED
---

![Shell Scripiting (Bash): Função para mostrar qual seu IP na internet](/assets/img/shell-script/terminal110.jpg "Shell Scripiting (Bash): Função para mostrar qual seu IP na internet")

> Analise o código e os comentários. 

{% highlight bash %}
#!/bin/bash
# ----------------------------------------------------------------------------
# Shell Scripiting(Bash): Função para mostrar qual seu IP na internet
# Mostra o seu número IP (externo) na Internet.
# Uso: ./ip.sh
# Ex.: ./ip.sh
#
# Autor: Marcos Oliveira , www.terminalroot.com.br
# Desde: Sáb 06 Jul 2013 22:36:22 BRT 
# Versão: 1
# Licença: GPL
# ----------------------------------------------------------------------------
ip(){
	# define a url que mostra ip como a variável IP
	local IP='http://www.getip.com'
	# mostra o código fonte da página HTML
	lynx -source "$IP" | 
	# ordena as tags
	sed 's/>/>\n/' | 
	# subtitui a tag  por nada
	sed 's///p' | 
	# subtitui a tag  por nada
	sed 's///p' | 
	# subtitui a tag  por nada
	sed 's///p' | 
	# imprime a linha(-n) que começa com a palavra 'Current IP: ' e substitui por nada
	sed -n 's/^Current IP: //p' | 
	# Como printará todas as linhas relativas e repetidas, usamos o uniq pra printar só uma linha.
	uniq
}

# chamamos a função
ip

{% endhighlight %}
