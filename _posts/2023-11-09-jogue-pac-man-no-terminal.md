---
layout: post
title: "Jogue Pac-Man no Terminal"
date: 2023-11-09 08:32:15
image: '/assets/img/games/myman.jpg'
description: 'Feito com C e Ncurses!'
icon: 'ion:terminal-sharp'
iconname: 'Games'
tags:
- games
- linguagemc
- ncurses
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**MyMan** é um clone não oficial e não licenciado do [Pac-Man original](https://en.wikipedia.org/wiki/Pac-Man) e Puckman e suas sequências e imitadores.

MyMan usa [Ncurses](https://terminalroot.com.br/ncurses) para *desenhar* o ambiente do jogo. É possível jogá-lo em [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/tags#linux), [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos) e entre outros.

No Windows você precisará da biblioteca [PDCurses](https://pdcurses.org/).

---

# Dependências
> Exemplo em sistemas que usam o APT como gerenciador de pacotes.

{% highlight bash %}
sudo apt install git build-essential make autotools-dev autoconf libncurses5-dev libncursesw5-dev
{% endhighlight %}
---

# Para compilar e instalar
Clonar, compilar e testar a versão:
{% highlight bash %}
git clone https://github.com/kragen/myman
cd myman
sed -i 's/-lcurses/-ltinfo -lncurses/g' Makefile
make
./myman --version
{% endhighlight %}

Para instalar:
{% highlight bash %}
sudo make install
{% endhighlight %}


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

<details>
 <summary>Clique aqui para ver onde os arquivos são instalados.</summary>

{% highlight bash %}
$ sudo make install 
Senha: 
creating directory /usr/local/share/man/man6
creating directory /usr/local/share/myman-0.6
creating directory /usr/local/share/doc/myman-0.6
creating directory /usr/local/share/myman-0.6/lvl
creating directory /usr/local/share/myman-0.6/chr
creating directory /usr/local/share/myman-0.6/spr
creating directory /usr/local/share/myman-0.6/gfx
installing program file /usr/local/bin/myman
installing data file /usr/local/share/myman-0.6/gfx/myman.png
installing data file /usr/local/share/myman-0.6/gfx/myman64.png
installing data file /usr/local/share/myman-0.6/gfx/myman48.png
installing data file /usr/local/share/myman-0.6/gfx/myman32.png
installing program file /usr/local/bin/myman-0.6
installing program file /usr/local/bin/myman.command
installing data file /usr/local/share/doc/myman-0.6/ChangeLog
installing data file /usr/local/share/doc/myman-0.6/AUTHORS
installing data file /usr/local/share/doc/myman-0.6/INSTALL
installing data file /usr/local/share/doc/myman-0.6/LICENSE
installing data file /usr/local/share/doc/myman-0.6/README
installing data file /usr/local/share/doc/myman-0.6/THANKS
installing data file /usr/local/share/doc/myman-0.6/TODO
installing data file /usr/local/share/doc/myman-0.6/NEWS
installing data file /usr/local/share/doc/myman-0.6/ONEWS
installing data file /usr/local/share/doc/myman-0.6/VERSION
installing data file /usr/local/share/doc/myman-0.6/COPYRIGHT
installing data file /usr/local/share/doc/myman-0.6/myman.txt
installing data file /usr/local/share/doc/myman-0.6/myman.ps
installing data file /usr/local/share/doc/myman-0.6/myman.dvi
installing data file /usr/local/share/doc/myman-0.6/myman.html
installing data file /usr/local/share/man/man6/myman-0.6.6
installing link to manpage man6/myman-0.6.6 as /usr/local/share/man/man6/myman.6
installing link to manpage man6/myman-0.6.6 as /usr/local/share/man/man6/myman.command.6
installing maze file /usr/local/share/myman-0.6/lvl/maze.txt
installing maze file /usr/local/share/myman-0.6/lvl/catchum.txt
installing maze file /usr/local/share/myman-0.6/lvl/chomp.txt
installing maze file /usr/local/share/myman-0.6/lvl/gobble.txt
installing maze file /usr/local/share/myman-0.6/lvl/munchkin.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacgal.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacmanic.txt
installing maze file /usr/local/share/myman-0.6/lvl/portable.txt
installing maze file /usr/local/share/myman-0.6/lvl/msport.txt
installing maze file /usr/local/share/myman-0.6/lvl/spear.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacman89.txt
installing maze file /usr/local/share/myman-0.6/lvl/quackman.txt
installing maze file /usr/local/share/myman-0.6/lvl/tinypac2.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacmania.txt
installing maze file /usr/local/share/myman-0.6/lvl/kpacman.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacjr.txt
installing maze file /usr/local/share/myman-0.6/lvl/mspp.txt
installing maze file /usr/local/share/myman-0.6/lvl/jrpac.txt
installing maze file /usr/local/share/myman-0.6/lvl/jrpac64.txt
installing maze file /usr/local/share/myman-0.6/lvl/jrpac26.txt
installing maze file /usr/local/share/myman-0.6/lvl/kasper.txt
installing maze file /usr/local/share/myman-0.6/lvl/scandal.txt
installing maze file /usr/local/share/myman-0.6/lvl/hangly.txt
installing maze file /usr/local/share/myman-0.6/lvl/pesco.txt
installing maze file /usr/local/share/myman-0.6/lvl/ebipac.txt
installing maze file /usr/local/share/myman-0.6/lvl/hackem.txt
installing maze file /usr/local/share/myman-0.6/lvl/pac64.txt
installing maze file /usr/local/share/myman-0.6/lvl/mspac26.txt
installing maze file /usr/local/share/myman-0.6/lvl/pac2600.txt
installing maze file /usr/local/share/myman-0.6/lvl/pac26.txt
installing maze file /usr/local/share/myman-0.6/lvl/mrpac26.txt
installing maze file /usr/local/share/myman-0.6/lvl/ipac.txt
installing maze file /usr/local/share/myman-0.6/lvl/nespac.txt
installing maze file /usr/local/share/myman-0.6/lvl/ghost.txt
installing maze file /usr/local/share/myman-0.6/lvl/dacman.txt
installing maze file /usr/local/share/myman-0.6/lvl/babypac.txt
installing maze file /usr/local/share/myman-0.6/lvl/paczx.txt
installing maze file /usr/local/share/myman-0.6/lvl/mspaczx.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacmsx.txt
installing maze file /usr/local/share/myman-0.6/lvl/pac4a.txt
installing maze file /usr/local/share/myman-0.6/lvl/pac20.txt
installing maze file /usr/local/share/myman-0.6/lvl/mspac78.txt
installing maze file /usr/local/share/myman-0.6/lvl/mspaclnx.txt
installing maze file /usr/local/share/myman-0.6/lvl/mspac20.txt
installing maze file /usr/local/share/myman-0.6/lvl/mspac4a.txt
installing maze file /usr/local/share/myman-0.6/lvl/mspacnes.txt
installing maze file /usr/local/share/myman-0.6/lvl/mspacgb.txt
installing maze file /usr/local/share/myman-0.6/lvl/mspaccdi.txt
installing maze file /usr/local/share/myman-0.6/lvl/jellymon.txt
installing maze file /usr/local/share/myman-0.6/lvl/gobbler.txt
installing maze file /usr/local/share/myman-0.6/lvl/ghostman.txt
installing maze file /usr/local/share/myman-0.6/lvl/demon.txt
installing maze file /usr/local/share/myman-0.6/lvl/nokiapac.txt
installing maze file /usr/local/share/myman-0.6/lvl/mspacgg.txt
installing maze file /usr/local/share/myman-0.6/lvl/snespac.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacjs.txt
installing maze file /usr/local/share/myman-0.6/lvl/pman2.txt
installing maze file /usr/local/share/myman-0.6/lvl/pman.txt
installing maze file /usr/local/share/myman-0.6/lvl/clsweep.txt
installing maze file /usr/local/share/myman-0.6/lvl/pcman.txt
installing maze file /usr/local/share/myman-0.6/lvl/zuckman.txt
installing maze file /usr/local/share/myman-0.6/lvl/paczx2.txt
installing maze file /usr/local/share/myman-0.6/lvl/mazeman.txt
installing maze file /usr/local/share/myman-0.6/lvl/glooper.txt
installing maze file /usr/local/share/myman-0.6/lvl/ghunt.txt
installing maze file /usr/local/share/myman-0.6/lvl/spooky.txt
installing maze file /usr/local/share/myman-0.6/lvl/ohno.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacgem.txt
installing maze file /usr/local/share/myman-0.6/lvl/munchman.txt
installing maze file /usr/local/share/myman-0.6/lvl/mmproto.txt
installing maze file /usr/local/share/myman-0.6/lvl/crush.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacbox.txt
installing maze file /usr/local/share/myman-0.6/lvl/tinypac.txt
installing maze file /usr/local/share/myman-0.6/lvl/hasewolf.txt
installing maze file /usr/local/share/myman-0.6/lvl/pac700.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacmanvs.txt
installing maze file /usr/local/share/myman-0.6/lvl/smartpac.txt
installing maze file /usr/local/share/myman-0.6/lvl/bugman.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacman2.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacman98.txt
installing maze file /usr/local/share/myman-0.6/lvl/snapper.txt
installing maze file /usr/local/share/myman-0.6/lvl/peerless.txt
installing maze file /usr/local/share/myman-0.6/lvl/psppac.txt
installing maze file /usr/local/share/myman-0.6/lvl/pac6001.txt
installing maze file /usr/local/share/myman-0.6/lvl/deluxe.txt
installing maze file /usr/local/share/myman-0.6/lvl/scarfman.txt
installing maze file /usr/local/share/myman-0.6/lvl/pac8bit.txt
installing maze file /usr/local/share/myman-0.6/lvl/mspacgt.txt
installing maze file /usr/local/share/myman-0.6/lvl/newpuc2.txt
installing maze file /usr/local/share/myman-0.6/lvl/arrange.txt
installing maze file /usr/local/share/myman-0.6/lvl/asciiman.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacpunk.txt
installing maze file /usr/local/share/myman-0.6/lvl/pactac.txt
installing maze file /usr/local/share/myman-0.6/lvl/mspaccpc.txt
installing maze file /usr/local/share/myman-0.6/lvl/spook.txt
installing maze file /usr/local/share/myman-0.6/lvl/cattrax.txt
installing maze file /usr/local/share/myman-0.6/lvl/jrpac52.txt
installing maze file /usr/local/share/myman-0.6/lvl/pcmania4.txt
installing maze file /usr/local/share/myman-0.6/lvl/nibble.txt
installing maze file /usr/local/share/myman-0.6/lvl/crazyg.txt
installing maze file /usr/local/share/myman-0.6/lvl/chicky.txt
installing maze file /usr/local/share/myman-0.6/lvl/monster.txt
installing maze file /usr/local/share/myman-0.6/lvl/tomyport.txt
installing maze file /usr/local/share/myman-0.6/lvl/packri.txt
installing maze file /usr/local/share/myman-0.6/lvl/puckpock.txt
installing maze file /usr/local/share/myman-0.6/lvl/blinky.txt
installing maze file /usr/local/share/myman-0.6/lvl/mania.txt
installing maze file /usr/local/share/myman-0.6/lvl/eatit.txt
installing maze file /usr/local/share/myman-0.6/lvl/greedy.txt
installing maze file /usr/local/share/myman-0.6/lvl/mschomp.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacpsion.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacxgs.txt
installing maze file /usr/local/share/myman-0.6/lvl/paccv.txt
installing maze file /usr/local/share/myman-0.6/lvl/muncher.txt
installing maze file /usr/local/share/myman-0.6/lvl/munchy.txt
installing maze file /usr/local/share/myman-0.6/lvl/xensrvng.txt
installing maze file /usr/local/share/myman-0.6/lvl/ultrapac.txt
installing maze file /usr/local/share/myman-0.6/lvl/fhmcpac.txt
installing maze file /usr/local/share/myman-0.6/lvl/mspacatk.txt
installing maze file /usr/local/share/myman-0.6/lvl/packman.txt
installing maze file /usr/local/share/myman-0.6/lvl/nascom.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacnstuf.txt
installing maze file /usr/local/share/myman-0.6/lvl/pakkman.txt
installing maze file /usr/local/share/myman-0.6/lvl/msblitz.txt
installing maze file /usr/local/share/myman-0.6/lvl/mshack.txt
installing maze file /usr/local/share/myman-0.6/lvl/lives.txt
installing maze file /usr/local/share/myman-0.6/lvl/gobbler2.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacmanpc.txt
installing maze file /usr/local/share/myman-0.6/lvl/ababa.txt
installing maze file /usr/local/share/myman-0.6/lvl/puckmon.txt
installing maze file /usr/local/share/myman-0.6/lvl/yoyopac.txt
installing maze file /usr/local/share/myman-0.6/lvl/gobble2.txt
installing maze file /usr/local/share/myman-0.6/lvl/mmpalm.txt
installing maze file /usr/local/share/myman-0.6/lvl/gobbler0.txt
installing maze file /usr/local/share/myman-0.6/lvl/perqman.txt
installing maze file /usr/local/share/myman-0.6/lvl/mazewar.txt
installing maze file /usr/local/share/myman-0.6/lvl/3demon.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacpdp11.txt
installing maze file /usr/local/share/myman-0.6/lvl/apollo.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacrt11.txt
installing maze file /usr/local/share/myman-0.6/lvl/sidtool.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacvms.txt
installing maze file /usr/local/share/myman-0.6/lvl/mspacln2.txt
installing maze file /usr/local/share/myman-0.6/lvl/mspwlnx.txt
installing maze file /usr/local/share/myman-0.6/lvl/mspwlnx2.txt
installing maze file /usr/local/share/myman-0.6/lvl/gobbler1.txt
installing maze file /usr/local/share/myman-0.6/lvl/gobbler3.txt
installing maze file /usr/local/share/myman-0.6/lvl/ghostma2.txt
installing maze file /usr/local/share/myman-0.6/lvl/strange.txt
installing maze file /usr/local/share/myman-0.6/lvl/mini.txt
installing maze file /usr/local/share/myman-0.6/lvl/mstiny.txt
installing maze file /usr/local/share/myman-0.6/lvl/alien.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacst.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacmen.txt
installing maze file /usr/local/share/myman-0.6/lvl/sympac.txt
installing maze file /usr/local/share/myman-0.6/lvl/tituspac.txt
installing maze file /usr/local/share/myman-0.6/lvl/classmun.txt
installing maze file /usr/local/share/myman-0.6/lvl/ascpac.txt
installing maze file /usr/local/share/myman-0.6/lvl/minipac.txt
installing maze file /usr/local/share/myman-0.6/lvl/ruckman.txt
installing maze file /usr/local/share/myman-0.6/lvl/guimp.txt
installing maze file /usr/local/share/myman-0.6/lvl/hannah.txt
installing maze file /usr/local/share/myman-0.6/lvl/chompman.txt
installing maze file /usr/local/share/myman-0.6/lvl/javapac.txt
installing maze file /usr/local/share/myman-0.6/lvl/titanman.txt
installing maze file /usr/local/share/myman-0.6/lvl/hatman.txt
installing maze file /usr/local/share/myman-0.6/lvl/xfred.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacgent.txt
installing maze file /usr/local/share/myman-0.6/lvl/hedges.txt
installing maze file /usr/local/share/myman-0.6/lvl/gnasher.txt
installing maze file /usr/local/share/myman-0.6/lvl/snail.txt
installing maze file /usr/local/share/myman-0.6/lvl/munchie.txt
installing maze file /usr/local/share/myman-0.6/lvl/revenge.txt
installing maze file /usr/local/share/myman-0.6/lvl/gobbleag.txt
installing maze file /usr/local/share/myman-0.6/lvl/thief.txt
installing maze file /usr/local/share/myman-0.6/lvl/plaque.txt
installing maze file /usr/local/share/myman-0.6/lvl/plaque2.txt
installing maze file /usr/local/share/myman-0.6/lvl/sir.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacmunch.txt
installing maze file /usr/local/share/myman-0.6/lvl/jrsmall.txt
installing maze file /usr/local/share/myman-0.6/lvl/jrtiny.txt
installing maze file /usr/local/share/myman-0.6/lvl/3dpac.txt
installing maze file /usr/local/share/myman-0.6/lvl/ackman.txt
installing maze file /usr/local/share/myman-0.6/lvl/paccdi.txt
installing maze file /usr/local/share/myman-0.6/lvl/gpac.txt
installing maze file /usr/local/share/myman-0.6/lvl/gsmall.txt
installing maze file /usr/local/share/myman-0.6/lvl/hackem2.txt
installing maze file /usr/local/share/myman-0.6/lvl/hangly26.txt
installing maze file /usr/local/share/myman-0.6/lvl/makman.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacclone.txt
installing maze file /usr/local/share/myman-0.6/lvl/scheme.txt
installing maze file /usr/local/share/myman-0.6/lvl/pcsmall.txt
installing maze file /usr/local/share/myman-0.6/lvl/pcman2.txt
installing maze file /usr/local/share/myman-0.6/lvl/qman.txt
installing maze file /usr/local/share/myman-0.6/lvl/tman.txt
installing maze file /usr/local/share/myman-0.6/lvl/toyman.txt
installing maze file /usr/local/share/myman-0.6/lvl/salomon.txt
installing maze file /usr/local/share/myman-0.6/lvl/byh.txt
installing maze file /usr/local/share/myman-0.6/lvl/ptmx.txt
installing maze file /usr/local/share/myman-0.6/lvl/smallpac.txt
installing maze file /usr/local/share/myman-0.6/lvl/mssmall.txt
installing maze file /usr/local/share/myman-0.6/lvl/baby2.txt
installing maze file /usr/local/share/myman-0.6/lvl/pac.txt
installing maze file /usr/local/share/myman-0.6/lvl/pac2.txt
installing maze file /usr/local/share/myman-0.6/lvl/small.txt
installing maze file /usr/local/share/myman-0.6/lvl/upacthin.txt
installing maze file /usr/local/share/myman-0.6/lvl/blobbo.txt
installing maze file /usr/local/share/myman-0.6/lvl/tiny.txt
installing maze file /usr/local/share/myman-0.6/lvl/mc10.txt
installing maze file /usr/local/share/myman-0.6/lvl/ghost2.txt
installing maze file /usr/local/share/myman-0.6/lvl/nopoint.txt
installing maze file /usr/local/share/myman-0.6/lvl/gobbler4.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacgalax.txt
installing maze file /usr/local/share/myman-0.6/lvl/kcm.txt
installing maze file /usr/local/share/myman-0.6/lvl/remake.txt
installing maze file /usr/local/share/myman-0.6/lvl/guppy.txt
installing maze file /usr/local/share/myman-0.6/lvl/pepperii.txt
installing maze file /usr/local/share/myman-0.6/lvl/p4c.txt
installing maze file /usr/local/share/myman-0.6/lvl/simplej.txt
installing maze file /usr/local/share/myman-0.6/lvl/3b1.txt
installing maze file /usr/local/share/myman-0.6/lvl/k3.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacmes.txt
installing maze file /usr/local/share/myman-0.6/lvl/cupcake.txt
installing maze file /usr/local/share/myman-0.6/lvl/iitpac.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacmanx.txt
installing maze file /usr/local/share/myman-0.6/lvl/pacex2.txt
installing maze file /usr/local/share/myman-0.6/lvl/armpac2.txt
installing maze file /usr/local/share/myman-0.6/lvl/deluxe2.txt
installing maze file /usr/local/share/myman-0.6/lvl/zaurus.txt
installing maze file /usr/local/share/myman-0.6/lvl/vermin.txt
installing maze file /usr/local/share/myman-0.6/lvl/cgkit.txt
installing maze file /usr/local/share/myman-0.6/lvl/misspac.txt
installing maze file /usr/local/share/myman-0.6/lvl/misstiny.txt
installing maze file /usr/local/share/myman-0.6/lvl/pac49.txt
installing maze file /usr/local/share/myman-0.6/lvl/pac188.txt
installing maze file /usr/local/share/myman-0.6/lvl/small188.txt
installing maze file /usr/local/share/myman-0.6/lvl/full188.txt
installing maze file /usr/local/share/myman-0.6/lvl/lim.txt
installing maze file /usr/local/share/myman-0.6/lvl/jobman.txt
installing tile file /usr/local/share/myman-0.6/chr/khr2h.txt
installing tile file /usr/local/share/myman-0.6/chr/chr5x2.txt
installing tile file /usr/local/share/myman-0.6/chr/chr5x3.txt
installing tile file /usr/local/share/myman-0.6/chr/khr1.txt
installing tile file /usr/local/share/myman-0.6/chr/khr2h.txt
installing tile file /usr/local/share/myman-0.6/chr/chr8.txt
installing tile file /usr/local/share/myman-0.6/chr/chr8h.txt
installing tile file /usr/local/share/myman-0.6/chr/chr6.txt
installing tile file /usr/local/share/myman-0.6/chr/chr6h.txt
installing tile file /usr/local/share/myman-0.6/chr/chr32.txt
installing tile file /usr/local/share/myman-0.6/chr/chr32h.txt
installing tile file /usr/local/share/myman-0.6/chr/chr4.txt
installing tile file /usr/local/share/myman-0.6/chr/chr4h.txt
installing tile file /usr/local/share/myman-0.6/chr/chr3.txt
installing tile file /usr/local/share/myman-0.6/chr/chr2.txt
installing tile file /usr/local/share/myman-0.6/chr/chr2hb.txt
installing tile file /usr/local/share/myman-0.6/chr/chr16.txt
installing tile file /usr/local/share/myman-0.6/chr/chr16h.txt
installing tile file /usr/local/share/myman-0.6/chr/prq28.txt
installing tile file /usr/local/share/myman-0.6/chr/prq28h.txt
installing tile file /usr/local/share/myman-0.6/chr/prq14.txt
installing tile file /usr/local/share/myman-0.6/chr/prq14h.txt
installing tile file /usr/local/share/myman-0.6/chr/prq7.txt
installing tile file /usr/local/share/myman-0.6/chr/khr8.txt
installing tile file /usr/local/share/myman-0.6/chr/khr8h.txt
installing tile file /usr/local/share/myman-0.6/chr/khr6.txt
installing tile file /usr/local/share/myman-0.6/chr/khr6h.txt
installing tile file /usr/local/share/myman-0.6/chr/khr8.txt
installing tile file /usr/local/share/myman-0.6/chr/khr8h.txt
installing tile file /usr/local/share/myman-0.6/chr/khr6.txt
installing tile file /usr/local/share/myman-0.6/chr/khr6h.txt
installing tile file /usr/local/share/myman-0.6/chr/khr1b.txt
installing tile file /usr/local/share/myman-0.6/chr/chr5.txt
installing tile file /usr/local/share/myman-0.6/chr/khr5.txt
installing tile file /usr/local/share/myman-0.6/chr/chr4b.txt
installing tile file /usr/local/share/myman-0.6/chr/khr4.txt
installing tile file /usr/local/share/myman-0.6/chr/chr4hb.txt
installing tile file /usr/local/share/myman-0.6/chr/khr4h.txt
installing tile file /usr/local/share/myman-0.6/chr/chr3b.txt
installing tile file /usr/local/share/myman-0.6/chr/khr3.txt
installing tile file /usr/local/share/myman-0.6/chr/chr2b.txt
installing tile file /usr/local/share/myman-0.6/chr/khr2.txt
installing tile file /usr/local/share/myman-0.6/chr/chr2hc.txt
installing tile file /usr/local/share/myman-0.6/chr/khr2hb.txt
installing tile file /usr/local/share/myman-0.6/chr/khr5.txt
installing tile file /usr/local/share/myman-0.6/chr/rogue.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr2h.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr7x3.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr10x6.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr1.txt
installing sprite file /usr/local/share/myman-0.6/spr/quack2h.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr16.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr16h.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr12.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr12h.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr64.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr64h.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr8.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr8h.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr6.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr4.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr4h.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr32.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr32h.txt
installing sprite file /usr/local/share/myman-0.6/spr/pqs48.txt
installing sprite file /usr/local/share/myman-0.6/spr/pqs48h.txt
installing sprite file /usr/local/share/myman-0.6/spr/pqs24.txt
installing sprite file /usr/local/share/myman-0.6/spr/pqs24h.txt
installing sprite file /usr/local/share/myman-0.6/spr/pqs12.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr16.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr16h.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr12.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr12h.txt
installing sprite file /usr/local/share/myman-0.6/spr/ott16.txt
installing sprite file /usr/local/share/myman-0.6/spr/ott16h.txt
installing sprite file /usr/local/share/myman-0.6/spr/ott12.txt
installing sprite file /usr/local/share/myman-0.6/spr/ott12h.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr3.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr10.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr10.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr8b.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr8b.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr8hb.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr8hb.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr6b.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr6b.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr4b.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr4b.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr4hb.txt
installing sprite file /usr/local/share/myman-0.6/spr/spr4hb.txt
installing sprite file /usr/local/share/myman-0.6/spr/ott10.txt
installing sprite file /usr/local/share/myman-0.6/spr/rogues.txt
updated whatis database for /usr/local/share/man
{% endhighlight %}

</details>

---

# Para jogar
Abra o jogo rodando somente:
{% highlight bash %}
myman
{% endhighlight %}
> Se você não instalou, rode: `./myman` dentro da pasta onde você compilou!

#### 1. Pressione [ESPAÇO]
#### 2. Pressione [ENTER], duas vezes
#### 3. Você(o Pac-Man) é a letra <code style="color:yellom;font-style:bold;">C</code>, basta presionar qualquer tecla direcional para iniciar
#### 4. Use as teclas direcionais para fugir das letras `A` e comer os pontos: `.`
#### 5. para sair tecle: `Ctrl + c`

Para mais informações acesse o repositório: <https://github.com/kragen/myman> e/ou use o `help`:
{% highlight bash %}
myman --help
{% endhighlight %}

---

Se quiser desintalar, dentro do diretório pós-compilado e instalado, rode:
{% highlight bash %}
sudo make clean uninstall
{% endhighlight %}



