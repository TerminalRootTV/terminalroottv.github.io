---
layout: post
title: "Como Compilar Programas no FreeBSD via Ports"
date: 2018-02-20 16:13:04
image: '/assets/img/freebsd/ports.jpg'
description: 'O Sistema de Ports, também chamado de Coleção de Ports ou simplesmente Ports, é um "sistema de instalação" de pacotes prático e eficiente utilizado pelo FreeBSD.'
tags:
- freebsd
---

> O [Sistema de Ports](https://www.freebsd.org/ports/), também chamado de Coleção de Ports ou simplesmente Ports, é um "sistema de instalação" de pacotes prático e eficiente utilizado pelo [FreeBSD](http://www.terminalroot.com.br/tags#freebsd). 

É considerado o melhor esquema de instalação para Sistemas Operacionais, ele foi rapidamente adotado por outros __BSDs__: __OpenBSD__, __NetBSD__, ... no [Linux](http://www.terminalroot.com.br/tags#linux) só o [Gentoo](http://www.terminalroot.com.br/tags#gentoo) que adotou com o nome de Portage, além do __Arch__ tb, mas opcional.

A coleção fica no diretório

{% highlight bash %}
ls /usr/ports
{% endhighlight %}

Cada software está separado por categoria. Na categoria __ports-mgmt__ , você verá diversos aplicativos da coleção: __pkg__, __portmaster__, __portupgrade__...entre outros.

> Nota: No __pkg__ os 'ports' são chamados de __packages__, ou seja, você não instala __ports__ com o pkg e sim packages.

Antes de mais nada, pra você compilar um programa pelo Ports, é necessário atualizar o esquema do Ports. Para isso a gente vai usar o __portsnap__ . Para baixar as atualizações é o comando __portsnap fetch__ e para atualizar __portsnap update__ . Combinando os dois comandos e economizando tempo, rode:
{% highlight bash %}
portsnap fetch update
{% endhighlight %}

Você também pode usar o __svn__ (controle de versão, outra opção ao [git](http://www.terminalroot.com.br/git) ) para atualizar o _ports_. Cada subdiretório de aplicativos contém um conjunto de arquivos que informa o [FreeBSD](http://www.terminalroot.com.br/tags#freebsd) como compilar e instalar esse programa, chamado de esqueleto de portas . Cada esqueleto de porta inclui esses arquivos e diretórios:

+ __Makefile__ : _contém instruções que especificam como o aplicativo deve ser compilado e onde seus componentes devem ser instalados_.
+ __distinfo__ : _contém os nomes e checksums dos arquivos que devem ser baixados para construir a porta_.
+ __files/__ : _este diretório contém todos os patches necessários para que o programa compile e instale no FreeBSD. Este diretório também pode conter outros arquivos usados ​​para construir a port_.
+ __pkg-descr__ : _fornece uma descrição mais detalhada do programa_.
+ __pkg-plist__ : _uma lista de todos os arquivos que serão instalados pela porta. Ele também informa o sistema de portas que os arquivos devem ser removidos após a desinstalação_. 


Como exemplo vamos instalar o [Vim](http://www.terminalroot.com.br/vim) que por padrão não vem instalado no FreeBSD

__1°__ Procuramos a localização do _vim_ e já entramos no diretório dele com o comando
{% highlight bash %}
cd `find /usr/ports -type d -name 'vim'`
{% endhighlight %}

Para instalar basta voce rodar o comando __make installl__ e depois é bom rodar o __make clean__ para limpar o conteúdo criado em _/usr/ports/*/*/work_, você ainda pode customizar esse diretório rodando o comando junto com a variavel _WRKSRCPREFIX=/path-for-compile/_ e _PREFIX=/local-da-instalação/_ , combinando os comandos, rode
{% highlight bash %}
make install clean
{% endhighlight %}

Se der erro:
+ __make showconfig__ (MOSTRA AS CONFIGURAÇÕES)
+ __make config-recursive__ (HABILITA UMA POR UMA OPÇÂO)
+ __make rmconfig__ (LIMPA TUDO)

Depois é só rodar de novo <kbd>make install clean</kbd>

E se você quiser desintalar, rode
{% highlight bash %}
make deinstall clean
{% endhighlight %}

Foi feito exemplo com o __nano__ também!

# Assista o Vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=7xMBH-WwY3Y)


# Comentem !!!

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

