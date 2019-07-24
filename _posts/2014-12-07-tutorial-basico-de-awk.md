---
layout: post
title: "Tutorial básico de AWK"
date: '2014-12-07T05:38:00.003-08:00'
image: '/assets/img/awk/awk.jpg'
description: "AWK tem a mesma pronúncia de Auk, uma espécie de pássaro."
main-class: 'misc'
tags:
- AWK
---
![Tutorial básico de AWK](/assets/img/awk/awk.jpg "Tutorial básico de AWK")


## Introdução

[AWK](https://www.gnu.org/software/gawk/manual/gawk.html) é uma linguagem de programação interpretada que é, geralmente, usada para deixar os scripts de shell mais poderosos e com mais recursos. É usada mais para processar dados nos textos e operações com arquivos.

> O nome tem origem na primeira letra do sobrenome de cada um dos criadores: Alfred __A__ ho, Peter __W__ einberger e Brian __K__ ernighan.

Esta linguagem, é considerada por muitos, um importante marco para história da programação, tendo tido bastante influência na criação de outras linguagens de programação, como, por exemplo, Perl e Python.
 
## Variantes do AWK


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


+ BWK: conhecido também AWK ou NAWK se refere à versão por Brian Kernighan .
+ GAWK:(GNU AWK) é outra implementação do software livre (OPEN SOURCE)
+ MAWK:é uma versão muito mais rápida implementação AWK por Mike Brennan(...)

### Exemplo 1
{% highlight bash %}
awk '{ print "Hello, World" }'
awk -f hello.awk
{% endhighlight %}

A flag __-f__ diz que o comando a seguir é um programa a ser executado.

Para um programa executável, usar o __/usr/bin/awk__.

Exemplo, crie um arquivo __world.awk__ com o conteúdo
{% highlight bash %}
# !/usr/bin/awk -f
# My first awk script
{ print "Hello, World!" }
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


Tornando este arquivo executável
{% highlight bash %}
chmod +x world.awk
{% endhighlight %}

Executando
{% highlight bash %}
./world.awk
{% endhighlight %}

Variáveis da Linguagem

Salve o arquivo __caes.txt__

{% highlight bash %}
rex marelo calmo magro
branco branco zangado magro
lennon branco brincalhao gordo
fred branco zangado gordo
{% endhighlight %}

Imprime o arquivo inteiro
{% highlight bash %}
awk '{print $0}'
{% endhighlight %}

- $1 imprime o nome do cachorro,
- $2 a cor,
- $3 seu humor,
- $4 seu condicionamento físico. 


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


Podemos usar essas variáveis dentro do comando print. Nele, sempre que colocamos uma vírgula, estamos espaçando

{% highlight bash %}
awk '{print "O",$1,"é",$4}' caes.txt
{% endhighlight %}

Saída
{% highlight bash %}
 o rex é magro
 o branco é magro
 o lennon é gordo
 o fred é gordo
{% endhighlight %}

{% highlight bash %}
awk '{print "O"$1"é"$4}' caes.txt
{% endhighlight %}

Saída
{% highlight bash %}
 o rexémagro
 o brancoémagro
 o lennonégordo
 o fredégordo
{% endhighlight %}

## BEGIN
Com o begin, o AWK não espera por uma entrada (como digitar ENTER duas vezes), ele executa tudo daquele bloco
{% highlight bash %}
awk 'BEGIN {print "Vai ser tudo \n imprimido \n de uma vez só\n"}'
{% endhighlight %}

Saída
{% highlight bash %}
 Vai ser tudo
 imprimido
 de uma vez só
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


## Dicas
 
- Usamos a flag __-F__ pra informar ao __AWK__ que iremos usar a __CSV (comma separeted values, valores separados por vírgula)__.
- Assim como na __linguagem C__, AWK também possui o comado __printf__, que é bem mais flexível que o __print__. 
> A única coisa que o print faz que o printf não faz, é colocar automaticamente uma nova linha ao final da string __\n__.
{% highlight bash %}
awk '{ printf "Cor do cachorro %s: %s\n", $1, $2}' caes.txt 
{% endhighlight %}
- __sprintf__: Ela age e tem a mesma sintaxe da __printf__. A diferença é que sua saída é armazenada em uma variável, ao invés de ser exibida na tela.

## Variáveis definidas pelo usuário
Não pode começar variáveis por dígitos, elas são case sensitivo, não devem ter o mesmo nome das variáveis do AWK, nem de outros comandos e não precisam ser inicializadas ou declaradas.

Ao usar pela primeira uma variável, ela é tanto uma string vazia("") como "0", mas não é muito bom confiar seu script nesses valores iniciais.

AWK é fracamente tipado, ou seja, você pode atribuir um número a uma variável e sem seguida atribuir uma string, por exemplo.

> Ex.: Salvar como "__caes2.awk__"

{% highlight bash %}
BEGIN { nomecor="%-15s %20s\n"; printf nomecor, "Nome", "Cor\n"}
 { printf nomecor, $1, $2}
{% endhighlight %}

## if e operadores de comparação


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


São as instruções de controle que controlam o fluxo da execução dos programas em AWK. Em AWK, elas são similares as de C, além de possuírem os mesmos loopings e interações do padrão Shell.

> Elas são: __if, while, for, do e similares__.

Arquivo: __gnu.txt__
{% highlight bash %}
Eric    59 3 2112
Linus    30 5 578
Richard   40 3 2789
Marcos   24 1 134
{% endhighlight %}

{% highlight bash %}
awk '{ if($4 > 2000) print $1 }' gnu.txt
{% endhighlight %}

Direcionando a saída
{% highlight bash %}
awk 'BEGIN {print 1+1 > "resultado" }'
{% endhighlight %}

## else e else if

{% highlight bash %}
#!/usr/bin/awk -f
{
 if( $1 == "Eric" )
 printf "O primeiro\n"
 else if( $1 == "Linus" )
 printf "o segundo\n"
 else
 printf "Ouro cara\n"
}
{% endhighlight %}

## Referências


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


https://pt.wikipedia.org/wiki/Awk

http://www.vivaolinux.com.br/artigo/AWK-Introducao

## Outros links

http://www.zago.eti.br/script/awk.html

http://www.lpic.com.br/shell/comandos/awk/print/print.pdf

http://www.staff.science.uu.nl/~oostr102/docs/nawk/nawkA4.pdf

http://www.faqs.org/faqs/computer-lang/awk/faq/

http://www.gnu.org/software/gawk/manual/gawk.html


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

