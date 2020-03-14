---
layout: post
title: "Transformando múltiplos arquivos FLV para MP3 com Shell Script"
date: '2014-09-06T21:40:00.000-07:00'
image: '/assets/img/shell-script/flv-to-mp3-converter.jpg'
description: "Script em Bash pra transformar vários arquivos FLV para MP3 de uma só vez."
tags:
- shellscript
---
![Transformando múltiplos arquivos FLV para MP3 com Shell Script](/assets/img/shell-script/flv-to-mp3-converter.jpg "Transformando múltiplos arquivos FLV para MP3 com Shell Script")

> Script em Bash pra transformar vários arquivos FLV para MP3 de uma só vez.

## Código
{% highlight bash %}
#!/bin/bash
# --------------------------------------
# ./flv2mp3.sh
#
# Transformando múltiplos arquivos FLV para MP3 com Shell Script
#
# Uso: ./flv2mp3.sh
#
#
# Autor: Marcos da B. M. Oliveira , http://www.terminalroot.com.br/
# Desde: Dom 20 Out 2013 12:08:04 BRST 
# Licença: GPL
# --------------------------------------
preparando(){
 reset
 echo
 printf "\33[1;31m[+]Preparando para transformar: \33[0m" &amp;&amp;
 a=1;
 sp="/-\|";
 echo -n ' ';
 while [ $a -le 50000 ];
 do
  printf "\b${sp:a++%${#sp}:1}"     
 done 
 echo
 echo
 
}
transformando(){
for i in *.flv; do 
 printf "\33[1;33m[+]Transformando...: \33[4;34m$i\33[0m";
 echo
 NOVA=$(echo "$i" | rev | cut -c5- | rev)
 ffmpeg -i "$i" -acodec libmp3lame -ar 44100 -ac 2 -ab 128 -vn -y "$NOVA".mp3 2>/dev/null
done;
}
final(){
if [ "$(ls *.flv | wc -l)" -le "$(ls *.mp3 2>/dev/null | wc -l)" ]; then
 echo
 printf "\33[1;32m[+]Transformadas! :)\33[0m";
 echo
 echo
else
 echo
 printf "\33[1;31m[-]Alguma coisa deu errada.\n:(\33[0m";
 echo
fi
 
 
}
preparando
transformando
final
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

