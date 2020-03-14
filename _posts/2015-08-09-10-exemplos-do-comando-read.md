---
layout: post
title: "10 exemplos do comando read"
date: '2015-08-09T08:10:00.000-07:00'
image: '/assets/img/shell-script/read.jpg'
description: "O comando read faz a leitura a partir de uma interação do usuário."
tags:
- shell script
- comandos
---

![10 exemplos do comando read](/assets/img/shell-script/read.jpg "10 exemplos do comando read")

+ 1 - Ler e criar uma variável com os dados interagidos
{% highlight bash %}
echo "Informe seu nome: " ; read Nome
{% endhighlight %}

{% highlight bash %}
echo -e "Seu nome é: $Nome"
{% endhighlight %}

+ 2 - Ler na mesma linha com a opção -p
{% highlight bash %}
read -p "Terminal "; read user
Terminal Root
{% endhighlight %}

+ 3 - Ler __2__ caracteres com a opção __-n__ , não precisa apertar __[ENTER]__
{% highlight bash %}
read -n2 Idade; echo
{% endhighlight %}

+ 4 - Ler telefone com o DDD
{% highlight bash %}
read -n2 -p"(" DDD; read -n4 -p") " Prefix; read -n4 -p- Sufix; echo
{% endhighlight %}

+ 5 - Ler com tempo determinado
{% highlight bash %}
read -t2 -p "Responda em 2 segundos.Qual a capital do Brasil?" Resp || echo "Tempo esgotado."
{% endhighlight %}

+ 6 - Ler senha sem exibir na tela
{% highlight bash %}
read -s Senha
{% endhighlight %}

Ou

{% highlight bash %}
read -sp "Senha: "; echo
{% endhighlight %}

{% highlight bash %}
echo $REPLY
{% endhighlight %}

+ 7 - Para Leitura quando o caracter __?(interrogação)__ for digitado
{% highlight bash %}
read -p "Faça uma pergunta: " -d'?' PERGUNTA; echo
{% endhighlight %}

{% highlight bash %}
echo $PERGUNTA
{% endhighlight %}

+ 8 - Ler um array com __-a__
{% highlight bash %}
read -a MinhaArray
Debian Trisquel RedHat
echo ${MinhaArray[0]}
Debian
echo ${MinhaArray[1]}
Trisquel
echo ${MinhaArray[2]}
RedHat
{% endhighlight %}

+ 9 - Ler n variáveis de uma Vez só
{% highlight bash %}
read var1 var2 var3
Bash Ksh Csh
{% endhighlight %}

{% highlight bash %}
echo "$var1 $var2 $var3"
Bash Ksh Csh
{% endhighlight %}

+ 10 - Ler a quebra de linha de um arquivo com __-r__

> __arquivo.txt__

> __Atenção:\nTodos os dados foram recebidos.\nAtt,\nDiretoria.__

{% highlight bash %}
read -r DADOS < arquivo.txt
{% endhighlight %}
>

{% highlight bash %}
echo -e $DADOS
Atenção:
Todos os dados foram recebidos.
Att,
Diretoria.
{% endhighlight %}

Se não tivesse lido com __-r__, a barra seria ignorada, mas o "__n__" imprimiria, ficaria assim

{% highlight bash %}
Atenção:nTodos os dados foram recebidos.nAtt,nDiretoria.
{% endhighlight %}

## Para mais informações sobre o comando read

> __read --help__

> __man read__

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

