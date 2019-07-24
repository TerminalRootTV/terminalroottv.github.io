---
layout: post
title: "Twitando via Shell Script"
date: '2014-09-07T20:47:00.000-07:00'
image: '/assets/img/shell-script/shell-scripting-bash-twitter.jpg'
description: "Ele usa o comando curl."
main-class: 'bash'
tags:
- Shell Script
---

![Twitando via Shell Script](/assets/img/shell-script/shell-scripting-bash-twitter.jpg "Twitando via Shell Script")

Galera adaptei esse script que vi na internet no site [360 percents](http://360percents.com/) para __Twittar via Shell Script__. Ele usa o comando curl, segue o código abaixo , vejam utilização no cabeçalho do script , como não criei , só adaptei , não vou explicar , pois ainda estou estudando CURL. 

> __Precisa alterar o nome de usuário e senha no arquivo para poder utilizá-lo e funcionar__.


## Código
{% highlight bash %}
#!/bin/bash
# ---------------------------------------------------------------
# ./tweet.sh
#
# Twitando via Shell Script
#
# Uso: troque no arquivo a palavra 'user' por seu usuario no Twitter
#   troque no arquivo a palavra 'pass' por sua senha no Twitter
# ./tweet.sh [post]
#
# Ex.: ./tweet.sh Fui ao banheiro
#
# Autor: Marcos da B. M. Oliveira, http://www.terminalroot.com.br/
# Desde: Seg 08 Set 2014 00:30:34 BRT
# Versão: adaptado de http://360percents.com/
# Licença: GPL
# ----------------------------------------------------------------
usuario="user"
senha="pass"
cookie="/tmp/cookie.txt"
useragent="Mozilla/5.0"
tweet="$*"
# Buscando twitter
echo "⌚ Entrando no Twitter..."
paginainicial=$(curl -s -b "$cookie" -c "$cookie" -L --sslv3 -A "$useragent" "https://mobile.twitter.com/session/new")
token=$(echo "$paginainicial" | grep "authenticity_token" | sed -e 's/.*value="//' | sed -e 's/" \/>.*//')
# Logando no twitter
echo "⌚ Logando..."
paginadelogin=$(curl -s -b "$cookie" -c "$cookie" -L --sslv3 -A "$useragent" -d "authenticity_token=$token&amp;username=$usuario&amp;password=$senha" "https://mobile.twitter.com/session")
# Pagina de tweetar
echo "⌚ Indo para página de composição..."
paginacompose=$(curl -s -b "$cookie" -c "$cookie" -L -A "$useragent" "https://mobile.twitter.com/compose/tweet")
# Twitando
echo "⌚ Twitando: $tweet "
tweettoken=$(echo "$paginacompose" | grep "authenticity_token" | sed -e 's/.*value="//' | sed -e 's/" \/>.*//' | tail -n 1)
update=$(curl -s -b "$cookie" -c "$cookie" -L --sslv3 -A "$useragent" -d "authenticity_token=$tweettoken&amp;tweet[text]=$tweet&amp;tweet[display_coordinates]=false" "https://mobile.twitter.com/")
# Indo pra página de deslogar
deslogarpage=$(curl -s -b "$cookie" -c "$cookie" -L --sslv3 -A "$useragent" "https://mobile.twitter.com/account")
# Deslogando
echo "⌚ deslogando..."
deslogartoken=$(echo "$deslogarpage" | grep "authenticity_token" | sed -e 's/.*value="//' | sed -e 's/" \/>.*//' | tail -n 1)
deslogar=$(curl -s -b "$cookie" -c "$cookie" -L --sslv3 -A "$useragent" -d "authenticity_token=$deslogartoken" "https://mobile.twitter.com/session/destroy")
rm "$cookie"
{% endhighlight %}

Fonte: [360 percents](http://360percents.com/[)

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

