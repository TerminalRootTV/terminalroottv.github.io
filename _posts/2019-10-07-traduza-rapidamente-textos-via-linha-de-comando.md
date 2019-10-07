---
layout: post
title: "Traduza Rapidamente Textos e Documentos via Linha de Comando"
date: 2019-10-07 10:42:26
image: '/assets/img/comandos/trans.jpg'
description: 'Uma ferramenta que traduz sem precisar usar o navegador.'
tags:
- translate
- shell
- comandos
---

![Traduza Rapidamente Textos e Documentos via Linha de Comando](/assets/img/comandos/trans.jpg "Traduza Rapidamente Textos e Documentos via Linha de Comando")

Muitas vezes quando estamos lendo algum conteúdo, seja no manual ou qualquer outro documento, e quando não possuímos um conhecimento avançado em inglês, precisamos recorrer a algum tradutor online (Google Tradutor, Bing Tradutor,...) e isso é meio estranho porque ás vezes você nem está com o navegador aberto.

Então, para que você possa traduzir mais facilmente e rapidamente pelo terminal, há uma ferramenta que faz essa consulta sem precisar usar o navegador, estou me referindo ao [Translate Shell](https://www.soimort.org/translate-shell/) .

## Translate Shell

O [Translate Shell](https://www.soimort.org/translate-shell/) é um tradutor de linha de comando escrito em [Awk](https://terminalroot.com.br/2014/12/tutorial-basico-de-awk.html) que efetua a tradução pelo Google Translate (padrão), mas você pode alterar a API (com parâmetro via linha de comando, ou alteração de variável local) para o Bing Translator ou Yandex Translate ou ainda o Apertium.

## Instalação

O Translate Shell está disponível na maioria dos repositórios dos gerenciadores de pacotes do Linux e dos BSD o nome do pacote geralmente é [translate-shell](https://packages.gentoo.org/packages/app-i18n/translate-shell) , mas para confirmar você pode pesquisar utilizando o parâmetro de pesquisa da sua distro, exemplos:

{% highlight bash %}
emerge --search translate-shell # Gentoo, Funtoo e similares
apt search translate-shell # Debian, Ubuntu e Linux Mint
pkg search translate-shell # FreeBSD
pacman -Ss translate-shell # Arch Linux, Manjaro e similares
yum search translate-shell # Red Hat, CentOS, Fedora(dnf tb)
{% endhighlight %}

E então instalá-lo, exemplos:

{% highlight bash %}
emerge translate-shell # Gentoo, Funtoo e similares
apt install translate-shell # Debian, Ubuntu e Linux Mint
pkg install translate-shell # FreeBSD
pacman -S translate-shell # Arch Linux, Manjaro e similares
yum install translate-shell # Red Hat, CentOS, Fedora(dnf tb)
{% endhighlight %}

Caso não esteja disponível para sua distro, use a documentação: <https://www.soimort.org/translate-shell/#installation>

## Utilização

Após instalá-lo, o programa (com o comando `trans`) já vai identificar qual a sua linguagem de ambiente, logo, qualquer texto que você passar pra ele, o mesmo irá automaticamente traduzir para seu idioma, exemplo:
> Lembre de usar as frases entre aspas, exemplo:
{% highlight bash %}
marcos@gentoo ~ $ trans "The Books On The Table"
The Books On The Table

Os livros em cima da mesa

Traduções de The Books On The Table
[ English -> Português ]

The Books On The Table
    Os livros em cima da mesa, Os livros sobre a mesa
marcos@gentoo ~ $ 
{% endhighlight %}

No exemplo acima, ele descreveu bastante as possibilidades de interpretação, no entanto, se quiser que a informação seja mais ainda resumida e direta, você pode usar o parâmetro `-b` e depois informar de qual idioma para seu idioma **DE:PARA** , exemplo de Inglês `en` para português brasileiro `pt-br` ou simplesmente `pt`, separados por dois pontos `:`

{% highlight bash %}
trans -b "The Books On The Table"
Os livros em cima da mesa
{% endhighlight %}

Indicando a linguagem origem e destino específica

{% highlight bash %}
trans -b en:pt-br "The Books On The Table"
Os livros em cima da mesa
{% endhighlight %}

Ou somente

{% highlight bash %}
trans -b en:pt "The Books On The Table"
Os livros em cima da mesa
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

### Traduzindo arquivos

Se você quiser traduzir um arquivo, também é possível utilizando o parâmetro `-i`, suponhamos que você tenha o seguinte aquivo exemplo `hello-world.txt`:

{% highlight bash %}
cat hello-world.txt

A "Hello, World!" program generally is a computer program that outputs or displays the message "Hello, World!". Such a program is very simple in most programming languages, and is often used to illustrate the basic syntax of a programming language. It is often the first program written by people learning to code.
{% endhighlight %}

E deseja traduzí-lo, se quiser uma saída enxuta, você pode usar em conjunto com o o parâmetro `-b`, exemplo:

{% highlight bash %}
trans -b -i hello-world.txt

Um "Olá, mundo!" O programa geralmente é um programa de computador que exibe ou exibe a mensagem "Olá, mundo!". Esse programa é muito simples na maioria das linguagens de programação e costuma ser usado para ilustrar a sintaxe básica de uma linguagem de programação. Geralmente, é o primeiro programa escrito por pessoas aprendendo a codificar.
{% endhighlight %}

### Modo interativo

Você ainda pode usar a ferramenta de forma interativa com o o parâmetro `-shell` , ou até mesmo em conjunto com o `-b`:
> Para sair do modo interativo, rode dois pontos q (`:q`)

{% highlight bash %}
marcos@gentoo ~ $ trans -shell -b
Translate Shell
(:q to quit)
> Do you want learning English ?
Você quer aprender inglês?
> Yes, i want
Sim eu quero
> :q
marcos@gentoo ~ $
{% endhighlight %}

E entre diversas outras opções que podem ser consultada utilizando o comando:
> Muitos parâmetros disponíveis, fique à vontade! =)
{% highlight bash %}
man trans
{% endhighlight %}

Se fica difícil de entender em inglês, use o próprio `trans` =)

{% highlight bash %}
man trans > manual-trans.txt
trans -b -i manual-trans.txt
{% endhighlight %}

## Mudando a engine

Por padrão o *translate-shell* traduz a partir do [Google Tradutor](https://translate.google.com/) , mas você pode, se quiser, alterar a engine da seguinte forma;

+ **1**. Liste as engines disponíveis com o parâmetro `-S`:
{% highlight bash %}
trans -S

  aspell
* google
  bing
  spell
  hunspell
  apertium
  yandex
{% endhighlight %}

Note que o *google* está com um asterisco, logo ele é o padrão, mas se você quiser traduzir pelo [Bing](https://www.bing.com/), por exemplo, use assim:
{% highlight bash %}
trans -e bing "The books on the table"
{% endhighlight %}

## Diversas opções de parâmetros

Existem muitas opções, dicas de parâmetros para você testar, rode os exemplos:
{% highlight bash %}
trans -R # Lista os idiomas
trans -L # Detalhes do idioma
trans -6 # Conecta via IPv6 e -4 via IPv4
trans -U # Verifica atualizações
trans -d # Um DICIONÁRIO !!! =)
# Entre diversas outras
trans --help
{% endhighlight %}

E a opção bem legal `-p` ou `-play` você pode escutar a tradução !!! E ainda alterar o player para escutar com o parâmetro `-player [PROGRAMA]`. Que legal, ne!? =)

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

## Relação de Features/Bugs/Issues

Pode ser que você tenha algum problema de saída vazia, eu recomendo você alterar a saída para *apertium*, assim:
{% highlight bash %}
trans -e apertium "The books on the table"
The books on the table

[ English -> Português ]
{% endhighlight %}

Mas não deixe de consultar a lista de problemas conhecidos e relacionar algum que você encontrou contribuindo com o projeto no link:
### <https://github.com/soimort/translate-shell/issues>

## Conclusão

Eu particularmente, uso diariamente essa ferramenta, até porque eu ainda não sou tão avançado em inglês, mas também aprendi muito depois que passei a utilizá-lo e tem facilitado muito para eu ler manuais . No vídeo abaixo mesmo, que é um trecho de um capítulo do [Curso Intensivo de Shell Script Avançado](https://terminalroot.com.br/shell) , nós mostramos como traduzir o manual (uma das formas)

<iframe width="920" height="400" src="https://www.youtube.com/embed/m6zvPJGGtEA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

E você curtiu ? Vai instalar ? Já está utilizando ? O que achou ??? Comente!

Abraços!

## Links úteis
+ <https://www.soimort.org/translate-shell/>
+ <https://github.com/soimort/translate-shell>
+ <https://github.com/soimort/translate-shell/issues>

