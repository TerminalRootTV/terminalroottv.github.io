---
layout: post
title: "Mudar extensões de múltiplos arquivos com Shell Script"
date: '2013-08-18T18:37:00.000-07:00'
image: '/assets/img/shell-script/terminal14.jpg'
description: "Altera o formato de várias extensões de uma só vez"
main-class: 'bash'
tags:
- Shell Script
---

![Mudar extensões de múltiplos arquivos com Shell Script](/assets/img/shell-script/terminal14.jpg "Mudar extensões de múltiplos arquivos com Shell Script")

> Olá galera, eu tentei usar o comando rename, mas tive alguns problemas.Esse comando consiste em renomear as extensões nos arquivos, não testei com o exemplo abaixo, mas em outros formatos, não obtive êxito, exemplo do rename: __rename .htm .html *.htm__

 
## chgtxt.sh
 
{% highlight bash %} 
#!/bin/bash
# ----------------------------------------------------------------------------
# Shell Scripiting(Bash): Mudar extensões de múltiplos arquivos
# Altera o formato de várias extensões de uma só vez
# Uso: ./chgext.sh [formato-antigo] [formato-novo]
# Ex.:(alterar todos as extensões .jpeg para .jpg)
#
#./chgext.sh jpeg jpg
#
# Autor: Marcos da Boa Morte , www.terminalroot.com.br
# Desde: Dom 18 Ago 2013 22:19:26 BRT 
# Versão: 1
# Licença: GPL
# ----------------------------------------------------------------------------
for file in *.$1; do
 mv "$file" "${file/$1/$2}"
done
{% endhighlight %}
 
 
## Documentação do comando rename:
[http://linuxcommand.org/man_pages/rename1.html](http://linuxcommand.org/man_pages/rename1.html)
