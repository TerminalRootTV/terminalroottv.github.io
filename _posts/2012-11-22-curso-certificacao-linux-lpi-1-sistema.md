---
layout: post
title: "Curso Certificação Linux LPI-1: Sistema de Boot, Shutdown e Runlevels"
date: '2012-11-22T13:17:00.000-08:00'
image: '/assets/img/lpi/400-boot-process-chart-terminalroot.jpg'
description: "Em informática, boot é o termo em inglês para o processo de iniciação do computador que carrega o sistema operacional quando a máquina é ligada."
main-class: 'linux'
tags:
- Linux
- LPI
- linux
- lpi
---

![Curso Certificação Linux LPI-1: Sistema de Boot, Shutdown e Runlevels](/assets/img/lpi/400-boot-process-chart-terminalroot.jpg "Curso Certificação Linux LPI-1: Sistema de Boot, Shutdown e Runlevels")

> Em informática, __boot__ é o termo em inglês para o processo de iniciação do computador que carrega o sistema operacional quando a máquina é ligada.A solução para o paradoxo está na utilização de um pequeno e especial programa, chamado sistema de iniciação, __boot loader__ ou __bootstrap__.O pequeno programa normalmente não é o sistema operacional, mas apenas um segundo estágio do sistema de inicialização, assim como o __Lilo__ ou o __Grub__. Ele será então capaz de carregar o [sistema operacional](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=Linux) apropriado, e finalmente transferir a execução para ele.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


![Blog Linux](/assets/img/lpi/fig1.gif "Blog Linux")

Quando um sistema efetua boot pela primeira vez, o processador executa um código em um local conhecido. Em um Computador Pessoal (PC), esse local é o Sistema Básico de __Entrada/Saída (BIOS)__, que está armazenado na memória flash, na placa-mãe.O estágio de inicialização do sistema depende do hardware no qual o [Linux](http://www.terminalroot.com.br/tags#linux) está efetuando boot. Em uma plataforma integrada, um ambiente de autoinicialização é utilizado quando o sistema é ligado ou reconfigurado.O loader de boot primário, que reside no __MBR__, é uma imagem de 512 bytes contendo o código do programa e uma pequena tabela de partição.

![Blog Linux](/assets/img/lpi/fig2.gif "Blog Linux")

O __loader de boot secundário__, ou de segundo estágio, pode ser chamado de __loader de kernel__. Neste estágio, sua tarefa é carregar o kernel [Linux](http://www.terminalroot.com.br/tags#linux) e o disco __RAM__ inicial opcional.Com a imagem de kernel na memória e o controle fornecido no loader de __boot__ de estágio 2, o estágio do kernel começa. A imagem do kernel não é bem um kernel executável, mas uma imagem de kernel compactada. Em geral é uma __zImage (imagem compactada, com menos de 512KB)__ ou uma __bzImag__e (imagem compactada grande, com mais de 512KB)__, previamente compactada com __zlib__.

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
 
![Blog Linux](/assets/img/lpi/fig3.gif "Blog Linux")

Após executar boot e inicializado, o __kernel__ inicia o aplicativo do primeiro espaço do usuário. Ele é o primeiro programa chamado, compilado com a biblioteca [C](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=linguagem c) padrão. Até este momento no processo, nenhum aplicativo [C](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=linguagem c) padrão foi executado.

## Runlevels (Níveis de Execução)

Níveis de execução definem quais tarefas podem ser realizadas no estado (ou nível de execução) atual de um sistema [Linux](http://www.terminalroot.com.br/tags#linux). Além do básico, o uso de níveis de execução pode ser diferentes nas distribuições.

### Níveis de execução básicos do Linux
> Nível Propósito

* __0__ Encerrar (ou parar) o sistema
* __1__ Modo de usuário único; geralmente com os alias __s__ ou __S__
* __2__  Modo de multiusuário sem rede
* __3__ Modo de multiusuário com rede
* __4__ Não Utilizado
* __5__ Modo de multiusuário com rede e com o __X Window System__
* __6__ Reinicializar o sistema

<!-- RETANGULO LARGO 2 -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:block; text-align:center;"
data-ad-layout="in-article"
data-ad-format="fluid"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="8549252987"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

A distribuição [Slackware](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=Slackware) usa o nível de execução __4__ em vez do __5__ para um sistema completo executando __X Window system__. [Debian](http://terminalroot.com.br/tags#debian) e derivados, como [Ubuntu](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=ubuntu), usam um único nível de execução para o modo de multiusuário, geralmente o nível __2__. Consulte a documentação para sua [distribuição](http://terminalroot.com.br/tags#distros).
Para alterar o __Runlevel__ de inicialização do seu [Linux](http://www.terminalroot.com.br/tags#linux), vc pode alterar o arquivo __/etc/inittab__

{% highlight bash %}
vi /etc/inittab
{% endhighlight %}

Exemplo abaixo, o número 2 é o definido

{% highlight bash %}
# /etc/inittab: init(8) configuration.
# $Id: inittab,v 1.91 2002/01/25 13:35:21 miquels Exp $
# The default runlevel.
id:2:initdefault:
# Boot-time system configuration/initialization script.
# This is run first except when booting in emergency (-b) mode.
si::sysinit:/etc/init.d/rcS
# What to do in single-user mode.
~~:S:wait:/sbin/sulogin
# /etc/init.d executes the S and K scripts upon change
# of runlevel.
#
# Runlevel 0 is halt.
# Runlevel 1 is single-user.
# Runlevels 2-5 are multi-user.
# Runlevel 6 is reboot.
l0:0:wait:/etc/init.d/rc 0
l1:1:wait:/etc/init.d/rc 1
{% endhighlight %}

<!-- RETANGULO LARGO -->
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

Ou usando um dos comando abaixo(lembrando que para todos esses procedimentos deverá ser o [super-usuário](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=root))

{% highlight bash %}
init 5
{% endhighlight %}

Ou

{% highlight bash %}
telinit 5
{% endhighlight %}

## Personalizando o processo de inicialização

O [Debian](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=debian) não utiliza o diretório __rc.local__ no estilo [BSD](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=BSD) para personalizar o processo de inicialização; ao invés disso ele fornece o seguinte mecanismo de personalização.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Suponha que um sistema precisa executar o script __foo__ na inicialização da máquina ou ao entrar em um nível de execução (__System V__) em especifíco. O administrador do sistema deverá então colocar o script foo dentro do diretório __/etc/init.d/__.

Executar o comando no Debian __update-rc.d__ com os argumentos apropriados para criar as ligações entre os diretórios (especificados na linha de comando) __rc?.d__ e __/etc/init.d/foo__. Aqui, __?__ é um número de __0__ a __6__ que corresponde a um dos níveis de execução __System V__.

# Reiniciar o sistema
 
> O comando __update-rc.d__ criará as ligações entre os arquivos nos diretórios __rc?.d__ e o script em __/etc/init.d/__. Cada ligação iniciará com um "__S__' ou um "__K__', seguido por um número, seguido pelo nome do script. Quando o sistema entra em um nível de execução __N__, scripts que iniciam com "__K__' em __/etc/rcN.d/__ são executados com __stop__ como seu argumento, seguido por aqueles começando com "__S__' em __/etc/rcN.d__ com start como seu argumento.

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Alguém poderia, por exemplo, fazer com que o script __foo__ seja executado na inicialização do sistema colocando-o em __/etc/init.d/__ e instalando as ligações com o comando __update-rc.d foo defaults 19__. O argumento __defaults__ se refere aos níveis de execução padrões, que são do nível __2__ até o nível __5__. O argumento __19__ assegura que __foo__ seja chamado antes de quaisquer scripts contendo números __20__ ou superiores.
 
## O Comando Shutdown

__Desliga/reinicia__ o computador imediatamente ou após determinado tempo (programável) de forma segura. Todos os usuários do sistema são avisados que o computador será desligado . Este comando somente pode ser executado pelo usuário root ou quando é usada a opção -a pelos usuários cadastrados no arquivo __/etc/shutdown.allow__ que estejam logados no console virtual do sistema.

> shutdown [opções] [hora] [mensagem]

* __hora__ - Momento que o computador será desligado. Você pode usar __HH:MM__ para definir a hora e minuto, __MM__ para definir minutos, __SS__ para definir após quantos segundos, ou __now__ para imediatamente (equivalente a __0__).

O __shutdown__ criará o arquivo __/etc/nologin__ para não permitir que novos usuários façam login no sistema (com excessão do __root__). Este arquivo é removido caso a execução do shutdown seja cancelada (opção __-c__) ou após o sistema ser reiniciado.
* __mensagem__ - Mensagem que será mostrada a todos os usuários alertando sobre o __reinicio/desligamento__ do sistema.

* __opções__

***

+ __-h__  Inicia o processo para desligamento do computador.
+ __-r__  Reinicia o sistema
+ __-c__  Cancela a execução do __shutdown__. Você pode acrescentar uma mensagem avisando aos usuários sobre o fato.
+ __-a__  Permite que os nomes de usuários contidos no arquivo __/etc/shutdown__.__allow__ possam utilizar o shutdown para reinicializar/desligar o sistema. Deve ser colocado um nome de usuário por linha. O limite máximo de usuários neste arquivo é de __32__. Este arquivo é útil quando o shutdown é usado para controlar o pressionamento das teclas __CTRL ALT DEL__ no __/etc/inittab__.
+ __-k__  Simula o desligamento/reinicio do sistema, enviando mensagem aos usuários.
+ __-f__  Não executa a checagem do sistema de arquivos durante a inicialização do sistema. Este processo é feito gravando-se um arquivo __/fastboot__ que é interpretado pelos scripts responsáveis pela execução do __fsck__ durante a inicialização do sistema.
+ __-F__ 

<!-- RETANGULO LARGO -->
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
