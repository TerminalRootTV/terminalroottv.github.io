---
layout: post
title: "Mudar extensões de múltiplos arquivos com Shell Script"
date: '2013-08-18T18:37:00.000-07:00'
image: '/assets/img/shell-script/terminal14.jpg'
description: "Altera o formato de várias extensões de uma só vez"
tags:
- shellscript
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

