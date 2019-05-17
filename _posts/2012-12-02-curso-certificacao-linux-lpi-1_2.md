---
layout: post
title: "Curso Certificação Linux LPI-1: Instalando e Compilando Programas"
date: '2012-12-02T16:13:00.000-08:00'
image: '/assets/img/lpi/compilador.jpg'
description: "Os pacotes com código fonte são geralmente distribuídos na forma dos famosos pacotes .tar.gz ou .tar.bz2"
main-class: 'linux'
tags:
- Linux
- LPI
---
 
![Compilando](/assets/img/lpi/compilador.jpg "Compilando")

A [Free Software Foundation](https://www.fsf.org/pt-br) (__FSF__, Fundação para o [Software Livre](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=software livre)) é uma organização sem fins lucrativos, fundada em 04 de Outubro de 1985 por [Richard Stallman](http://stallman.org/) e que se dedica a eliminação de restrições sobre a cópia, redistribuição, estudo e modificação de programas de computadores – bandeiras do movimento do [software livre](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=software livre), em essência. Faz isso promovendo o desenvolvimento e o uso de software livre em todas as áreas da computação mas, particularmente, ajudando a desenvolver o sistema operacional [GNU](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=GNU) e suas ferramentas.
 
![Richard Stallman (RMS)](/assets/img/lpi/rms-min.jpg "Richard Stallman (RMS)")

> Os pacotes com código fonte, distribuídos na forma dos famosos pacotes __.tar.gz__ ou __.tar.bz2__, são os formatos mais universais, porém ao mesmo tempo o mais complicado de instalar, que você deixa como um último recurso a lançar mão quando não encontrar um pacote atualizado do programa desejado.

Para instalá-los, é necessário, em primeiro lugar, ter instalado um conjunto de compiladores, incluindo o [gcc](https://gcc.gnu.org/) e [g++](https://gcc.gnu.org/onlinedocs/gcc-3.3.6/gcc/G_002b_002b-and-GCC.html), ferramentas como o __make__, __autoconf__, __diff__ e __patch__, e bibliotecas, como o __binutils-dev__, __libc6-dev__. Este "__kit básico__" é instalado ao marcar a categoria "desenvolvimento" (ou development) durante a instalação de várias [distribuições](http://www.terminalroot.com.br/tags#distros). No caso do [Kurumin](https://pt.wikipedia.org/wiki/Kurumin), você tem pré-instalados os compiladores mais usados e você pode instalar outros necessários através do [Synaptic](https://pt.wikipedia.org/wiki/Synaptic), ou manualmente através do [apt-get](https://pt.wikipedia.org/wiki/Advanced_Packaging_Tool).

Uma dica é que todos os pacotes cujo nome termina com "__-dev__" são justamente bibliotecas de desenvolvimento, que podem ser necessárias ao compilar determinados programas. Quando o instalador reclama da falta de bibliotecas ou arquivos do __X__, provavelmente ele está dando falta do pacote "__xlibs-dev__", quando reclamar da falta de arquivos do KDE, provavelmente está pedindo o pacote "__libqt3-dev__" e assim por diante. A maior dificuldade em compilar programas complexos está justamente em localizar e instalar o conjunto de bibliotecas de que ele precisa.

Se os pré-requisitos estiverem em ordem, a compilação em si é feita descompactado o arquivo (usando o comando "__tar -zxvf pacote.tar.gz__" ou "__tar -jxvf pacote.tar.bz2__" ), acessando a pasta que será criada e rodando três comandos básicos


+ __./configure__
+ __make__
+ __make install__

O "__./configure__" executa um script (dentro da pasta do programa), que verifica o sistema, em busca dos componentes de que precisa. Ele avisa caso algo esteja faltando, como neste erro que apareceu ao tentar compilar o [Qemu](http://wiki.qemu-project.org/Main_Page).
{% highlight bash %}
ERROR: QEMU requires SDL or Cocoa for graphical output
To build QEMU with graphical output configure with --disable-gfx-check
Note that this will disable all output from the virtual graphics card.
{% endhighlight %}

Neste exemplo, está faltando a biblioteca de desenvolvimento do __SDL__. Quase sempre, os pacotes que contêm bibliotecas começam com "__lib__" e os pacotes de desenvolvimento terminam com "__-dev__". Procurando no http://www.debian.org por um pacote que comece com "__lib__", termine com "__-dev__" e tenha "__sdl__" no meio, você chega ao "__libsdl1.2-dev__", que é justamente o pacote que estava faltando neste caso :). Em casos onde a solução parecer mais difícil, a melhor opção é fazer uma busca no [Google](https://duckduckgo.com/), usando parte da mensagem de erro.

O "__make__" cuida do trabalho pesado, fazendo a compilação propriamente dita. Ele se baseia nas informações deixadas pelo "__./configure__" para encontrar os componentes de que precisa.

Finalmente, temos o "__make install__", que finalmente instala o programa, copiando os arquivos gerados pelo make para as pastas corretas do sistema. Ao contrário dos dois primeiros comandos, ele precisa ser executado como __root__, já que envolve fazer alterações no sistema.

Apesar destes três comandos serem um padrão adotado na maioria dos pacotes, eles não são necessariamente uma regra. Muitos programas usam sistemas simplificados de instalação ou mesmo scripts próprios, por isso é sempre bom dar uma olhada no arquivo "__INSTALL__" ou "__README__" dentro da pasta, que explica os passos necessários. Em geral, os programas instalados a partir dos fontes não criam os ícones no menu. Você precisa chamar o programa via linha de comando ou criar os ícones manualmente.

Nas distribuições derivadas do [Debian](http://www.terminalroot.com.br/tags#debian), uma dica com relação às dependências e bibliotecas é usar o [auto-apt](https://packages.debian.org/jessie/admin/auto-apt), um programa que verifica as mensagens de erro geradas durante a compilação e procura instalar via [apt-get](https://www.debian.org/doc/manuals/apt-howto/ch-apt-get.pt-br.html) os componentes necessários para concluir a compilação. Ele não é perfeito: muitas vezes se perde ou tenta instalar pacotes desnecessários, mas realmente ajuda em muitos casos. Você pode instalá-lo via [apt-get](https://www.debian.org/doc/manuals/apt-howto/ch-apt-get.pt-br.html).

{% highlight bash %}
apt-get install auto-apt
{% endhighlight %}

Depois de instalado, execute (nesta ordem) os comandos "__auto-apt update__", "__auto-apt updatedb__" e "__auto-apt update-local__", que geram a base de dados que ele usa para fazer seu trabalho. Depois de tudo pronto, você passa a executar os comandos de compilação dos pacotes através dele, usando o comando "__auto-apt run__" seguido pelo comando, como em

{% highlight bash %}
auto-apt run ./configure
{% endhighlight %}

{% highlight bash %}
auto-apt run make
{% endhighlight %}

## O comando ldconfig

Cria, atualiza e remove as ligações necessárias e cache (para uso pelo __linker__ de tempo de execução, __ld.so__) a mais recente compartilhada bibliotecas encontradas nos diretórios especificados na linha de comando, em o arquivo __/etc /ld.so.conf__, e nos diretórios confiáveis ​​(__/usr/lib e /lib__). __ldconfig__ verifica os nomes de cabeçalho e arquivo das bibliotecas que encontra ao determinar quais versões devem ter suas ligações atualizado. __ldconfig__ ignora __links simbólicos__ ao procurar por bibliotecas.


> ldconfig [OPTION...]

## O comando ldd

Imprime as bibliotecas compartilhadas necessárias por cada programa ou compartilha biblioteca especificada na linha de comando.
 
Extraído de:
* http://www.fsf.org/
* http://www.hardware.com.br
* http://www.linuxmanpages.com/
