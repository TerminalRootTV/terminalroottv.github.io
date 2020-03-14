---
layout: post
title: "Jogos para o Terminal"
date: '2014-10-27T16:19:00.000-07:00'
image: '/assets/img/shell-script/games-terminal-bash-linux.jpg'
description: "10 dicas de jogos para o terminal"
tags:
- shellscript
- games
- terminal
---

![Jogos para o Terminal](/assets/img/shell-script/games-terminal-bash-linux.jpg "Jogos para o Terminal")

## MyMan


![Jogos para o Terminal](/assets/img/shell-script/13863751363_dc7e225bfa_z.jpg "Jogos para o Terminal")

O clone do Pac-Man, famoso arcade dos anos 80, <a href="http://myman.sourceforge.net/" target="_blank">MyMan</a>.

Para instalar, você precisa de <tt>ncurses</tt> e <tt>groff</tt> presentes na sua máquina.

No Ubuntu ou Debian
{% highlight bash %}
sudo apt-get install libncurses5-dev groff
wget http://downloads.sourceforge.net/project/myman/myman-cvs/myman-cvs-2009-10-30/myman-wip-2009-10-30.tar.gz
tar xvfvz myman-wip-2009-10-30.tar.gz
./configure
make
sudo make install
myman
{% endhighlight %}

No Archlinux, o game é avaliável em <a href="https://aur.archlinux.org/packages/myman/" target="_blank">AUR</a>.


## nInvaders


![Jogos para o Terminal](/assets/img/shell-script/13863722405_e14bbc91c8_z.jpg "Jogos para o Terminal")


O Famoso Space Invaders, o clone <a href="http://ninvaders.sourceforge.net/" target="_blank">nInvaders</a>
{% highlight bash %}
sudo apt-get install
{% endhighlight %}

No Archlinux, o game é avaliável <a href="https://aur.archlinux.org/packages/ninvaders/" target="_blank">AUR</a> .

## Moon-buggy

![Jogos para o Terminal](/assets/img/shell-script/13863751423_be17b73ace_z.jpg "Jogos para o Terminal")


<a href="http://www.seehuhn.de/pages/moon-buggy" target="_blank">moon-buggy</a>.Inspirado em Moon Patrol de 1982.

{% highlight bash %}
sudo apt-get install
moon-buggy
{% endhighlight %}

no <a href="https://aur.archlinux.org/packages/moon-buggy/" target="_blank">AUR</a> para Archlinux .  

## Bastet

![Jogos para o Terminal](/assets/img/shell-script/13863751683_d5f35204a0_z.jpg "Jogos para o Terminal")


Clone do Tetris <a href="http://fph.altervista.org/prog/bastet.html" target="_blank">Bastet</a>
{% highlight bash %}
sudo apt-get install 
bastet
{% endhighlight %}

ou <a href="https://aur.archlinux.org/packages/bastet/" target="_blank">AUR</a>.

## 2048.c


![Jogos para o Terminal](/assets/img/shell-script/13863722885_640bf7d0a5_z.jpg "Jogos para o Terminal")


<a href="http://gabrielecirulli.github.io/2048/" target="_blank">2048</a>


{% highlight bash %}
wget https://raw.githubusercontent.com/mevdschee/2048.c/master/2048.c
gcc -o 2048 2048.c
./2048
{% endhighlight %}

Para Archlinux <a href="https://aur.archlinux.org/packages/2048.c/" target="_blank">AUR package</a> .

## Greed

![Jogos para o Terminal](/assets/img/shell-script/13863722645_b5b131bae0_z.jpg "Jogos para o Terminal")


{% highlight bash %}
sudo apt-get install greed
{% endhighlight %}

ou <a href="https://aur.archlinux.org/packages/greed/" target="_blank">AUR</a> para Archlinux. 

## Ski

![Jogos para o Terminal](/assets/img/shell-script/13863751173_40fb357866_z.jpg "Jogos para o Terminal")


<a href="http://www.catb.org/esr/ski/" target="_blank">Ski</a> 

Para Ubuntu/Debian, baixe <a href="http://www.catb.org/esr/ski/" target="_blank">aqui</a>, extraia e rode

> __./ski__

Para Archlinux, instale de <a href="https://aur.archlinux.org/packages/ski/" target="_blank">AUR</a>.

## NetHack

![Jogos para o Terminal](/assets/img/shell-script/13863751533_035ef21704_z.jpg "Jogos para o Terminal")


<a href="http://www.nethack.org/" target="_blank">NetHack</a>
{% highlight bash %}
sudo apt-get install nethack-console
{% endhighlight %}

{% highlight bash %}
sudo pacman -S nethack
{% endhighlight %}

## cgames

![Jogos para o Terminal](/assets/img/shell-script/13863751553_d1f3d9e634_z.jpg "Jogos para o Terminal")


<a href="http://www.muppetlabs.com/%7Ebreadbox/software/cgames.html" target="_blank">cgames</a> contém <tt>csokoban</tt>, <tt>cmines</tt>, e <tt>cblocks</tt>.


{% highlight bash %}
sudo apt-get install libgpm-dev libncurses5-dev
./configure --with-ncurses
make
sudo make install
csokoban
{% endhighlight %}

ou 

<a href="https://aur.archlinux.org/packages/cgames/" target="_blank">AUR</a> para Archlinux. 

## BSD-Games

![Jogos para o Terminal](/assets/img/shell-script/13863722545_ec4cf17da5_z.jpg "Jogos para o Terminal")


<http://wiki.linuxquestions.org/wiki/BSD_games>

__instale e rode__

{% highlight bash %}
sudo apt-get install bsdgames
{% endhighlight %}

{% highlight bash %}
sudo pacman -S bsd-games
{% endhighlight %}

## Congratulações para o blog

<http://ttygames.wordpress.com/>

*Via: <http://xmodulo.com>*


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

