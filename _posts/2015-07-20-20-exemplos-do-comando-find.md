---
layout: post
title: "20 exemplos do comando find"
date: '2015-07-20T16:54:00.000-07:00'
image: '/assets/img/bash/find.jpg'
description: "find é um aplicativo para linha de comando de busca de arquivos utilizado em sistemas operativos Unix-like e derivados. "
color: '#c2003a'
tags:
- terminal
- comandos
categories:
---

![Comando find blog linux](/assets/img/bash/find.jpg "Comando find blog linux")

## 20 EXEMPLOS DO COMANDO FIND

## 1 - Procura simples
{% highlight bash %}
find . -name arquivo.txt
./arquivo.txt
{% endhighlight %}


* find   comando
* /    significa que vai procurar em todo o diretório raíz, se você não for root, ele ignorará os diretórios com permissão.
* .    significa que vai procurar em todo o diretório que você está e nos sub-diretórios.
* -name  vai procurar exatamente esse nome, se um caracter for diferente ou maiúsculo ou minúsculo, ele ignorará.
* arquivo.txt nome do arquivo 

## 2 - Procura ignorando case sensitive
{% highlight bash %}
find /home/ -iname arquivo.txt
./arquivo.txt
./Arquivo.txt
{% endhighlight %}


* /home/  só vai procurar nesse diretório recursivamente (sub-diretórios)
* iname  com maiúsculo ou minúsculo

## 3 - Procura diretórios
{% highlight bash %}
find / -type -d -name Fotos arquivo.txt
/home/user/Fotos
{% endhighlight %}

## 4 - Procura com coringas
{% highlight bash %}
find /home/ -name *rquivo*
./home/arquivo.txt
./home/Arquivo.txt
./home/Meus_Arquivo-NOVOS.txt
./home/arquivo.sh
{% endhighlight %}



* *rquivo* encontra todos os arquivos que possuirem a palavra "rquivo" no início, meio ou fim

## 5 - Procura por tipo de arquivos
{% highlight bash %}
find / -type -f -name Fotos *.odt
./arquivo.odt
./terminalroot.odt
{% endhighlight %}

* -f   só o arquivos com extensão odt, nesse caso, mesmo sem o -f também encontraria

## 6 - Procura por permissão e encontra todos os arquivos que possuem permissão 777
{% highlight bash %}
find . -type f -perm 0777 -print
{% endhighlight %}

## 7 - Procura diferente de permissão encontra todos arquivos que não possuem a permissão 777
{% highlight bash %}
find / -type f ! -perm 777
{% endhighlight %}

## 8 - Procura arquivos os diretórios vazis sem dizer se é __-type__ d ou __-type f__ ele procura ambos

{% highlight bash %}
find MinhaPasta/ -empty
MinhaPasta/DirVazio
MinhaPasta/arquivoVazio.txt
{% endhighlight %}

* -type d  procura só diretórios

{% highlight bash %}
find MinhaPasta/ -type d -empty
MinhaPasta/DirVazio
{% endhighlight %}


* -type f  procura só arquivos

{% highlight bash %}
find MinhaPasta/ -type f -empty
MinhaPasta/arquivoVazio.txt
{% endhighlight %}

## 9 - Procura pastas ocultas

{% highlight bash %}
find /tmp -type f -name ".*"
{% endhighlight %}


## 10 - Procura por tamanho vai encontrar todos os arquivos maiores que 10 MB

{% highlight bash %}
find . -type f -size +10M
{% endhighlight %}

Vai encontrar todos os arquivos menores que 10 MB

{% highlight bash %}
find . -type f -size -10M
{% endhighlight %}


## 11 - Procura e remove com __-exec__

{% highlight bash %}
find . -type f -name arquivoVazio.txt -exec rm -f {} \;
{% endhighlight %}



Ou com xargs

{% highlight bash %}
find . -type f -name arquivoVazio.txt | xargs rm -f
{% endhighlight %}


## 12 - Procura por nome dentro do arquivo
{% highlight bash %}
find MeusArquivos/ -name "*.*" -exec grep -Hin "Anomalias" {} \;
MeusArquivos/arquivo.txt:1:Anomalias
{% endhighlight %}

## 13 - Procura arquivos ACESSADOS (__atime__) nas últimas 24 horas (para mais de 3 dias , use +3)

{% highlight bash %}
find . -type f -atime -1 -exec ls -l {} \;
{% endhighlight %}


## 14 - Procura arquivos ACESSADOS (__amin__) nos últimos 5 minutos
{% highlight bash %}
find . -type f -amin -5
{% endhighlight %}


## 15 - Procura arquivos CRIADOS (__ctime__) nas últimas 12 horas
{% highlight bash %}
find . -type f -ctime -0.5 -exec ls -l {} \;
{% endhighlight %}

## 16 - Procura arquivos MODIFICADOS (__mtime__) nas últimas 6 horas
{% highlight bash %}
find . -type f -mtime -0.25
{% endhighlight %}


## 17 - Procura arquivos do tipo Sticky Bit com permissão 551
{% highlight bash %}
find / -perm 1551
{% endhighlight %}

## 18 - Procura arquivos SUID
{% highlight bash %}
find / -perm /u=s
{% endhighlight %}

## 19 - Procura arquivos SGID
{% highlight bash %}
find / -perm /g+s
{% endhighlight %}


## 20 - Procura arquivos executáveis
{% highlight bash %}
find / -perm /a=x
{% endhighlight %}

ou só para Leitura

{% highlight bash %}
find / -perm /u=r
{% endhighlight %}

Existem mais possibilidades, você pode ver todas no manual do comando:

{% highlight bash %}
man find
{% endhighlight %}


Ou com o comando __-help__ , que faz um resumo da utilização do comando __find__.

Fonte: __$ man find__ e [DuckDuckGo](https://duckduckgo.com/ "DuckDuckGo Blog Linux")

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

