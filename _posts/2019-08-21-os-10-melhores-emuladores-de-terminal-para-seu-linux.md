---
layout: post
title: "Os 10 Melhores Emuladores de Terminal para seu Linux"
date: 2019-08-21 10:23:18
image: '/assets/img/terminal/terminal.jpg'
description: 'Ranking baseado nas minha experiências.'
main-class: 'bash'
tags:
- terminal
- linux
- unix
---

![Os 10 Melhores Emuladores de Terminal para seu Linux](/assets/img/terminal/terminal.jpg)

## Apresentação

Geralmente quando você instala uma [distribuição](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Distro), [interface gráfica](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Interface) ou até mesmo um [WM](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=WM) , por padrão já vem com um emulador de terminal incluso para você utilizar, mas nem sempre é aquele que você deseja.

E em alguns momentos você também sente vontade de testar (experimentar) um outro emulador, às vezes por questão de utilidade ou até mesmo por vontade e gosto pessoal. E aí começam as pesquisas para saber o que cada um oferece de melhor. 

Provavelmente esse seja o motivo que você chegou até aqui e é justamente pensando nisso que eu vou descrever cada um dos emuladores citados aqui para que você não saia com que dúvida e além de fazer um ranking na ordem decrescente que vai do 10º até o 1º , além de citar outros que não estão nesse ranking, mas caso você tenha interesse em pesquisar posteriormente.

Vale ressaltar que esse ranking é baseado nos meus gostos pessoais, lógico que eu já testei cada um deles e talvez essa minha análise venha lhe ajudar também na sua escolha.

## Introdução

Embora um [emulador de terminal](https://en.m.wikipedia.org/wiki/Terminal_emulator) seja sinônimo de um [terminal shell](https://terminalroot.com.br/shell) ou de [texto](https://terminalroot.com.br/vim) , o terminal todos os terminais remotos, incluindo as interfaces gráficas. 

Um emulador de terminal dentro de uma interface gráfica de usuário é geralmente chamado de janela de terminal .

## Ranking

Agora vamos ao ranking que eu criei com um resumo de cada um!

### 10º Termite

![Termite](/assets/img/terminal/termite.png)

Termite é um emulador de terminal baseado em [VTE](https://wiki.gnome.org/Apps/Terminal/VTE) mínimo. É uma aplicação modal , semelhante ao Vim , com um modo de inserção e modo de seleção, onde as combinações de teclas têm diferentes funções.

O arquivo de configuração permite alterar as cores e definir algumas opções. Suporta transparência juntamente com as paletas de 256 cores e cores reais (16 milhões de cores).

+ Instalação

{% highlight bash %}
git clone --recursive https://github.com/thestinger/termite.git
cd termite && make
sudo make install
{% endhighlight %}

Consulte o GitHub dele para saber como utilizar e atalhos e teclas mágicas: 
#### <https://github.com/thestinger/termite>

### 9º Tmux

O [tmux](https://github.com/tmux/tmux) é um software que serve para multiplexar vários terminais , permitindo que um usuário acesse várias sessões de terminal separadas dentro de uma única janela de terminal ou sessão de terminal remoto. É útil para lidar com vários programas. Existem alguns aplicativos similares como: GNU Screen, Byobu, Wemux, entre outros.

Aqui no blog já existe um artigo e um vídeo sobre o tmux, para saber como instalar e configurar acesse esse link: [Como Instalar E Utlizar O Tmux](https://terminalroot.com.br/2018/01/como-instalar-e-utlizar-o-tmux.html) . Ou Assista ao vídeo abaixo:

<iframe width="1246" height="701" src="https://www.youtube.com/embed/Z7YcXTMMhEQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### 8ª Guake

![Guake](/assets/img/terminal/guake.jpg)

O Guake é um terminal top-down para o Gnome, e é altamente inspirado pelo famoso terminal usado no Quake.

Você pode instantaneamente mostrar e ocultar seu terminal com um único toque de tecla, executar um comando e voltar à sua tarefa anterior sem interromper seu fluxo de trabalho.

A maioria das distribuições já possuem o Guake no repositório, mas se quiser instalar através do código fonte, acesse o github deles:
<https://github.com/Guake/guake/>


### 7º Deepin Terminal

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

![Deepin](/assets/img/terminal/deepin.jpg)

Este é o terminal para o Deepin, mas você pode instalá-lo separadamente na sua distro via repositório. 

O endereço oficial do Deepin Terminal é: <https://github.com/linuxdeepin/deepin-terminal>

### 6º Terminology

![Terminology](/assets/img/funtoo/terminology.png)

Terminology é um emulador de terminal para sistemas Linux/BSD/UNIX que usa a biblioteca EFL. Ele faz parte do Desktop Environment Enlightenment o qual nós possuímos um vídeo detalhando essa interface e pode ser assistido através do vídeo abaixo: 

[Enlightenment Desktop - Uma Luz pro Linux](https://www.youtube.com/watch?v=Xl6liAsr_uc)

<iframe width="1246" height="701" src="https://www.youtube.com/embed/Xl6liAsr_uc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Endereço oficial do Terminology: <https://www.enlightenment.org/about-terminology.md>

### 5º Hyper

<iframe style="border:none;" src="https://hyper.is/static/hyperapp.mp4" width="550" height="400"></iframe>

[Hyper](https://hyper.is/) é uma proposta moderna para emuladores de terminais.

Você pode instalá-lo via AppImage , ou seja, basta fazer download do arquivo dar permissão de execução e clicar duas vezes sobre o mesmo que ele irá rodar.

### 4º LilyTerm

![LilyTerm](/assets/img/funtoo/funtoo3.jpg)

[LilyTerm](https://github.com/Tetralet/LilyTerm) é uma opção muito leve, prática e funcional . Atualmente uso ele junto com o [bspwm](https://terminalroot.com.br/2018/11/como-customizar-o-polybar-rofi-e-outros.html) . Em um dos vídeos do [Canal Terminal Root](https://youtube.com/TerminalRootTV) instalamos e configuramos ele no [Funtoo](https://youtu.be/vAfJr9AddAQ).

Para instalá-lo é o mesmo procedimento: use o gerenciador de pacotes da sua distribuição, exemplos:

{% highlight bash %}
emerge lilyterm # Gentoo, Funtoo e derivados
sudo apt install lilyterm # Debian, Ubuntu, Mint e derivados
sudo pacman -S lilyterm # Arch Linux, Manjaro e derivados
{% endhighlight  %}

### 3º Rxvt

![Rxvt](/assets/img/terminal/Rxvt.png)

O [rxvt](http://rxvt.sourceforge.net/) é um dos mais eficientes quando o assunto é velocidade . É um emulador para usuários avançados e sua customização é via arquivo, mas você pode instalar o Urxvt-Config e configurá-lo via interface gráfica: <https://github.com/daedreth/URXVTConfig> . Se você estiver usando [Gentoo](https://terminalroot.com.br/2017/05/como-instalar-o-gentoo.html) ou [Funtoo](https://terminalroot.com.br/2018/10/como-instalar-o-funtoo-pelo-ubuntu-ou-linux-mint.html) basta usar o [Portage] para instalá-lo: `emerge urxvtconfig` .

Em diversos vídeos que nós criamos, usamos e configuramos o rxvt-unicode (como também pode ser chamado) , dentre eles, podemos citar esse da Instalação do Gentoo:

<iframe width="1246" height="701" src="https://www.youtube.com/embed/tLDXUsSUEeA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### 2º Gnome Terminal

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

![Gnome Terminal](/assets/img/terminal/gnome-terminal.png)

É um emulador de terminal para o ambiente de área de trabalho [GNOME](https://terminalroot.com.br/.../como-customizar-a-aparencia-do-gnome.html) escrito por Havoc Pennington e outros. É muito completo e fácil de usar!

Quando você instala o GNOME automáticamente o [Gnome Terminal](https://wiki.gnome.org/Apps/Terminal) já está disponível, mas se você estiver usando outro Desktop Environment , você pode instalá-lo separadamente através do repositório da sua distribuição, exemplo: `sudo apt install gnome-terminal` .

### 1º Xterm

![Xterm](/assets/img/terminal/xterm.gif)

E na primeiríssima colocação temos o [Xterm](https://invisible-island.net/xterm/) . Ele é base para quase todos os emuladores de terminais citados nesse artigo, incluíndo o 2º e 3º colocado, ou seja, o GNOME Terminal e RXVT são baseados no Xterm . Na verdade, através das configurações do Xterm , você consegue transformá-lo em quase todos os emuladores que você desejar! =)

No nosso [Curso Intensivo de Shell Script Avançado](https://terminalroot.com.br/shell) ensinamos como configurar do zero o Xterm, além de mostrar como utilizá-lo facilmente!

Há também um vídeo de [Pós Instalção do Arch Linux](https://terminalroot.com.br/2018/08/pos-install-arch-linux-i3-polybar-pywal.html) , onde configuramos automáticamente via [Shell Script](https://terminalroot.com.br/bash) o Xterm .

Com certeza é a melhor opção pra quem quer aprender a mexer no Terminal e ter mais intimidade com a Tela Preta!

A instalação do Xterm é muito simples, basta usar o gerenciador de pacotes da sua distribuição, exemplos:

{% highlight bash %}
emerge xterm # Gentoo, Funtoo e similares
sudo apt install xterm # Debian, Ubuntu, Linux Mint e similares
sudo pacman -S xterm # Arch Linux, Manjaro e similares
sudo yum install xterm # Red Hat, CentOS, Fedora e similares
{% endhighlight  %}

#### Bônus - st

![Simple Terminal st](/assets/img/terminal/st.png)

E de bônus você também pode tentar o [**S**imple**T**erminal](https://st.suckless.org/) ou simplesmente **st** . Atualmente uso ele no [FreeBSD](https://terminalroot.com.br/2017/09/como-instalar-o-freebsd-11-1.html) , pois o mesmo já está disponível para o [Gerenciador de Janelas](https://terminalroot.com.br/2019/04/5-ferramentas-para-voce-usar-no-seu-wm.html) [dwm](https://dwm.suckless.org/) , é bem legal e fácil de configurá-lo e é ainda mais leve que o rxvt.

## Conclusão

Como você notaram, existem diversas opções para usar o Terminal, fora os que não foram citados, porque eu nunca usei, ou achei que não era tão interessante assim. Independente da sua escolha, o importante mesmo é se adapatar ao terminal, porque a quantidade de coisas que você pode fazer no terminal está [anos-luz](https://www.youtube.com/watch?v=m226f2reF28) da interface gráfica. Sério!

Espero que vocês tenham gostado do artigo e se puderem para ajudar, compartilhem nas suas redes sociais!

Até a próxima, um forte abraço!
    
