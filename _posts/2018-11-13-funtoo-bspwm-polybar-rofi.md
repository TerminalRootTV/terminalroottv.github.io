---
layout: post
title: "Funtoo + Bspwm + Polybar + Rofi"
date: 2018-11-13 01:24:08
image: '/assets/img/funtoo/funtoo2.jpg'
description: 'Nesse video ajustamos algumas configurações e instalamos o bspwm,polybar,rofi e outros no Funtoo.'
tags:
- funtoo
- shellscript
- bash
---

> Nesse video ajustamos algumas configurações e instalamos o bspwm,polybar,rofi e outros no Funtoo.

![Funtoo + Bspwm + Polybar + Rofi](/assets/img/funtoo/funtoo2.jpg "Funtoo + Bspwm + Polybar + Rofi")

### Além de soluções de problemas, instalamos da seguinte forma:

{% highlight bash %}
sed 's/\"us\"/\"br-abnt2\"/g' /etc/conf.d/keymaps # para não ficar precisando usar o loadkeys toda hora
USE="examples" emerge -a xorg-server xorg-x11 xf86-video-vesa bspwm xorg-drivers rxvt-unicode urxvtconfig
{% endhighlight %}

Criamos um usuário normal e em seguida definimos uma senha pro mesmo, logo em seguida saímos do root e entramos com o mesmo:

{% highlight bash %}
useradd -m -G users,wheel,audio,video -s /bin/bash nome_do_seu_usuario
passwd nome_do_seu_usuario
{% endhighlight %}

### Com usuário normal
{% highlight bash %}
mkdir -p ~/.config/{bspwm,sxhkd}
cp /usr/share/doc/bspwm-*/examples/bspwmrc ~/.config/bspwm/
cp /usr/share/doc/bspwm-*/examples/sxhkdrc ~/.config/sxhkd/
chmod +x ~/.config/bspwm/bspwmrc ~/.config/sxhkd/sxhkdrc
echo 'exec bspwm' > ~/.xinitrc
startx
# Super + Enter
{% endhighlight %}

Depois usamos o [URXVTConfig](https://github.com/daedreth/URXVTConfig) para customizar o [rxvt-unicode](http://software.schmorp.de/pkg/rxvt-unicode.html)

e instalamos o [Polybar](https://github.com/jaagr/polybar) e criamos seu arquivo de configuração

{% highlight bash %}
emerge -a polybar
mkdir $HOME/.config/polybar # com o usuário normal
cp /usr/share/doc/polybar/config.bz2 $HOME/.config/polybar/
cd $HOME/.config/polybar/
bzip -d config.bz2
{% endhighlight %}

Instalamos o [Vim](https://vim.org), [Firefox](https://www.mozilla.org/pt-BR/firefox/new/), [Rofi](https://github.com/DaveDavenport/rofi) e [Feh](https://feh.finalrewind.org) e configuramos o X para ficar em pt-BR e instalamos tema no Rofi
{% highlight bash %}
su
emerge -a vim firefox-bin rofi feh
wget "https://gitlab.com/terminalroot/arch/raw/master/key" -O /etc/X11/xorg.conf.d/10-evdev.conf
exit
# baixamos uma imagem da internet e usamos o feh para definir o papel de parede
feh --bg-scale Downloads/wallpaper.jpg
vim .config/sxhkd/sxhkdrc # adicionamos a tecla super + d para abrir o rofi -show run
mkdir ~/.config/rofi
rofi -dump-config > ~/.config/rofi/config.rasi
wget https://raw.githubusercontent.com/ricwtk/rofi-themes/master/input-emph-topbar.rasi -O 
~/.config/rofi/input-emph-topbar.rasi
sed -i '/configuration {/a theme:  "input-emph-topbar";' ~/.config/rofi/config.rasi
{% endhighlight %}

### Depois ajustamos as configurações conforme o vídeo abaixo
# [Clique Aqui Para Assistir ao Vídeo](https://youtu.be/o62vOYSnPVk)

## Conheça nosso Treinamentos de Shell Script, Vim e Expressões Regulares
# <http://terminalroot.com.br/cursos>

## Crie Sua Promoção
# <http://terminalroot.com.br/promo>

## Acompanhe todos os vídeos da **Série Shell Script Profissional** [#ShellPro](http://bit.ly/shell-pro-root)

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



