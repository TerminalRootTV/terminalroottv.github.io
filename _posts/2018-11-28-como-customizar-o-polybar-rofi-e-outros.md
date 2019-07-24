---
layout: post
title: "Como Customizar o Polybar, Rofi e Outros"
date: 2018-11-28 16:59:21
image: '/assets/img/funtoo/funtoo3.jpg'
description: 'Nesse vídeo finalizamos a série sobre o Funtoo Linux e customizamos e configuramos aplicativos.'
main-class: 'misc'
tags:
- funtoo
- shellscript
- bash
---

Nesse vídeo finalizamos a série sobre [Funtoo Linux](http://bit.ly/play-list-funtoo) e mostramos como customizar o [Polybar](https://github.com/jaagr/polybar) , [Rofi](https://github.com/DaveDavenport/rofi) e outros aplicativos e configurações.

![Como Customizar o Polybar, Rofi e Outros](/assets/img/funtoo/funtoo3.jpg "Como Customizar o Polybar, Rofi e Outros")

Logo no início do vídeo (após logarmos com nosso usuário normal) configuramos o [bspwm](https://github.com/baskerville/bspwm) para iniciar setando configurações do [rxvt-unicode](http://software.schmorp.de/pkg/rxvt-unicode.html), wallpaper e carregar o Polybar automaticamente com os seguintes comandos:

{% highlight bash %}
sed '1a $HOME/.Xresources' $HOME/.config/bspwm/bspwmrc
sed '2a $HOME/.fehbg' $HOME/.config/bspwm/bspwmrc
sed '3a $HOME/.config/polybar/launch.sh' $HOME/.config/bspwm/bspwmrc
{% endhighlight %}

Para o <kbd>launch.sh</kbd> rodar, precisamos tê-lo no nosso diretório, logo os comandos abaixo resolvem:

{% highlight bash %}
wget "https://gitlab.com/terminalroot/arch/raw/master/launch.sh" -O $HOME/.config/polybar/launch.sh
chmod +x $HOME/.config/polybar/launch.sh
{% endhighlight %}

E então *startamos* o [X](https://www.x.org/) : `startx`

Customizamos o arquivo `$HOME/.config/sxhkd/sxhkdrc` para *recarregar* o Polybar junto com o bspwm e também alteramos a linha referente ao Rofi para possuir ícones, tema diferenciado e rodar tanto o *run* quanto o *drun* (Obs.: Se quiser um tema diferente elimine o parâmentro referente a `-theme solarized` e use o comando `rofi-theme-selector` , como demonstrado no vídeo.) , com as linhas:

+ <kbd>pkill -USR1 -x sxhkd && $HOME/.config/polybar/launch.sh</kbd>
+ <kbd>rofi -modi run,drun -show drun -show-icons -drun-icon-theme Adwaita -scroll-method 1 -sidebar-mode -theme solarized -font "hack 10"</kbd>

Além disso também **instalamos** os aplicativos listados no comando abaixo e os **configuramos**:

{% highlight bash %}
emerge -a lightdm lightdm-gtk-greeter bash-completion lilyterm gucharmap sudo
{% endhighlight %}

E ainda clonamos e instalamos *fonts* e um app em Bash [youtube.sh](youtube.sh)

{% highlight bash %}
git clone https://github.com/terroo/youtube
git clone https://github.com/terroo/fonts
mkdir $HOME/.config/polybar/scripts
mv youtube/youtube.sh $HOME/.config/polybar/scripts/
su
mv fonts/fonts/*.ttf /usr/share/fonts/TTF/
mv fonts/fonts/*.otf /usr/share/fonts/OTF/
{% endhighlight %}

E finalizamos o vídeo explicando como customizar o arquivo `config` do Polybar do tipo `dosini` e após isso alteramos o `launch.sh` e colocamos mais um *bar* que criamos no arquivo, ficando assim:

{% highlight bash %}
...
polybar example &
polybar terminalroot &
...
{% endhighlight %}

Segue os Dotfiles do Polybar, bspwm e sxhkd final que utilizamos <https://github.com/terroo/dots>

Dica adicional que não foi citada no vídeo. Se quiser que as bordas das janelas do bspwm fiquem coloridas (nesse caso com as cores Azul e Roxo), use o código abaixo, se quiser alterar as cores, modifique o hexadecimal das mesmas. Coloque no final do arquivo `bspwmrc`:

{% highlight bash %}
bspc config normal_border_color "#D358F7"
bspc config active_border_color "#2E64FE"
bspc config focused_border_color "#2E64FE"
bspc config presel_border_color "#2E64FE"
bspc config urgent_border_color "#2E64FE"
bspc config presel_feedback_color "#2E64FE"
{% endhighlight %}

Elimine todas as dúvidas assistindo o vídeo abaixo que efetua todos os processos acima relatados, além de dicas adicionais.

# [Clique Aqui Para Assistir ao Vídeo](https://youtu.be/vAfJr9AddAQ)

## Conheça nosso Treinamentos de Shell Script, Vim, Expressões Regulares e Sed
# <http://terminalroot.com.br/cursos>

## Crie Sua Promoção
# <http://terminalroot.com.br/promo>

## Se você não assitiu os vídeos anteriores dessa série [clique aqui para assistí-los](http://bit.ly/play-list-funtoo)

# Links Úteis

+ Funtoo: <http://funtoo.org/>
+ Gentoo: <https://gentoo.org>
+ Portage: <https://pt.wikipedia.org/wiki/Portage_(software)>
+ X.Org: <https://www.x.org/>
+ Polybar: <https://github.com/jaagr/polybar>
+ bspwm: <https://github.com/baskerville/bspwm>
+ Rofi: <https://github.com/DaveDavenport/rofi>
+ rxvt-unicode: <http://software.schmorp.de/pkg/rxvt-unicode.html>
+ URXVTConfig: <https://github.com/daedreth/URXVTConfig>
+ Feh: <https://feh.finalrewind.org>
+ Vim: <https://vim.org>
+ LilyTerm: <https://lilyterm.luna.com.tw/>
+ Gucharmap: <http://gucharmap.sourceforge.net/>
+ Gitlab Terminal Root: <https://gitlab.com/terminalroot>
+ Terroo: <https://github.com/terroo> && <https://terroo.github.io/>
+ Fonts: <https://github.com/terroo/fonts>
+ Shell Youtube: <https://github.com/terroo/youtube>
+ Dotfiles Terroo: <https://github.com/terroo/dots>
+ TerminalRootTV: <https://youtube.com/TerminalRootTV>

# Aplicatvos úteis para também serem instalados (minha opinião)

+ NPM: <https://www.npmjs.com/>
+ Pywal: <https://github.com/dylanaraps/pywal>
+ ScreenFetch: <https://github.com/KittyKatt/screenFetch>
+ Ranger: <https://ranger.github.io/>
+ Scrot: <https://phab.enlightenment.org/diffusion/ESVN/browse/trunk/misc/scrot;35502>
+ Mutt: <http://mutt.org/>
+ Elinks: <http://elinks.or.cz/>
+ Netifrc: <https://wiki.gentoo.org/wiki/Netifrc>
+ WPA Supplicant: <https://w1.fi/wpa_supplicant/>
+ MPV: <https://mpv.io/>
+ MuPDF: <https://mupdf.com/>
+ MOC: <https://moc.daper.net/>
+ FFMPEG: <https://www.ffmpeg.org/>
+ cURL: <https://curl.haxx.se/>
+ PulseAudio: <https://www.freedesktop.org/wiki/Software/PulseAudio/>
+ Apache: <http://www.apache.org/dist/httpd>
+ Youtube-DL: <https://rg3.github.io/youtube-dl/>
+ TaskBook: <https://github.com/klaussinani/taskbook>
+ Htop: <http://hisham.hm/htop/>
+ Grive2: <https://github.com/vitalif/grive2>
+ qBitTorrent: <http://www.qbittorrent.org/>
+ UNetbooting: <https://unetbootin.github.io/>
+ Liferea: <https://lzone.de/liferea/>
+ Remmina: <http://www.remmina.org/>
+ PCmanFM LXDE: <https://lxde.org/>
+ Nautilus GNOME: <https://gnome.org/>
+ LibreOffice: <https://pt-br.libreoffice.org/>
+ GIMP: <https://gimp.org/>

Veja mais em:

<https://wiki.archlinux.org/index.php/list_of_applications> 

ou 

<https://wiki.gentoo.org/wiki/Recommended_applications>

# Abraços!

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

