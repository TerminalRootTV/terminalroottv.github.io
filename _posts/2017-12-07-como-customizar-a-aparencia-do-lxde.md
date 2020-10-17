---
layout: post
title: 'Como Customizar a Aparencia do LXDE'
date: '2017-12-07 08:59:20'
image: '/assets/img/freebsd/lxde-custom.jpg'
description: 'LXDE é um ambiente de desktop open source para Unix e outras plataformas POSIX, como Linux e BSD. O nome LXDE significa "Lightweight X11 Desktop Environment.'
tags:
- freebsd
- lxde
---

[LXDE](http://lxde.org/) é um ambiente de desktop open source para [Unix](http://terminalroot.com.br/tags/#unix) e outras plataformas [POSIX](https://pt.wikipedia.org/wiki/POSIX), como [Linux](http://terminalroot.com.br/tags/#linux) e [BSD](http://terminalroot.com.br/tags/#bsd). O nome __LXDE__ significa "_Lightweight X11 Desktop Environment_"

## Instalação

> No [FreeBSD](http://terminalroot.com.br/tags/#freebsd)

{% highlight bash %}
pkg install lxde-meta
{% endhighlight  %}

Depois edite(ou crie se não existir) o arquivo <kbd>.xinit</kbd>

{% highlight bash %}
ee ~/.xinitrc
{% endhighlight  %}

E insira esse conteúdo dentro

{% highlight bash %}
export LC_ALL=pt_BR.UTF-8
export LANGUAGE=pt_BR.UTF-8
export LANG=pt_BR.UTF-8
setxkbmap -model abnt2 -layout br # muda pra abnt2
exec startlxde
{% endhighlight %}

## Customização

+ Banner de _logout_ (crie um banner de _352x125_) ou copie o original e edite no [GIMP](http://terminalroot.com.br/tags/#gimp)

> _faça um backup do original e copie seu novo banner pra lá_

{% highlight bash %}
cd /usr/local/share/lxde/images
cp logout-banner.jpg origin-logout-banner.jpg
cp ~/caminho-novo-banner.jpg logout-banner.jpg
Icone (criei um ícone com transparência 36x36 png) e faça o mesmo alterando somente os nomes:
cd /usr/local/share/lxde/images
cp lxde-icon.jpg origin-lxde-icon.jpg
cp ~/caminho-novo-icon.jpg lxde-icon.jpg
{% endhighlight  %}

+ No caso do ícone você pode deixar com o nome que vc quiser dentro do _diretório_ <kbd>/usr/local/share/lxde/images</kbd> e alterar só o nome no arquivo de conf

{% highlight bash %}
sed -i 's/lxde-icon\.jpg/nome-do-icon\.jpg/' ~/.config/lxpanel/LXDE/panels/panel
{% endhighlight  %}

_Depois é só reiniciar o painel!_

> __Bônus__: Se tiver um icone quadrado (_800x800, 200x200, ..._)

Use o __convert__ pra redimensionar pra _36x36_

{% highlight bash %}
convert -resize 36 icone.jpg icone-36.jpg # Instale o ImageMagick, dica logo abaixo
{% endhighlight  %}

+ Adicionar diretórios da __pasta pessoal__ automaticamente

{% highlight bash %}
pkg install xdg-user-dirs
xdg-user-dirs-update
{% endhighlight  %}

+ Configurar o Screenshot

{% highlight bash %}
pkg install ImageMagick
which import # verifica se instalou
vim /usr/local/bin/screenshot.sh
{% endhighlight  %}

Insira isso dentro do <kbd>screenshot.sh</kbd>

{% highlight bash %}
#!/usr/bin/env bash # cabeçalho correto
DATE=`date +%Y-%m-%d\ %H:%M:%S`
import -window root "$HOME/Desktop/screenshot-$DATE.jpg" # pode alterar o caminho onde salvar
chmod a+x /usr/local/bin/screenshot.sh
{% endhighlight  %}

Altere o arquivo <kbd>lxde-rc.xml</kbd>

{% highlight bash %}
vim ~/.config/openbox/lxde-rc.xml
{% endhighlight  %}

Procure a linha que tem a _tag_ com a _key_ __Print__, e deixe-a assim

{% highlight html %}
<keybind key="Print">
<action name="Execute">
<command>screenshot.sh</command>
</action>
</keybind>
{% endhighlight  %}

+ Reconfigure o [Openbox](http://openbox.org/wiki/Main_Page)

{% highlight bash %}
openbox --reconfigure
{% endhighlight  %}

+ Preferências

   - Aplicaitvos preferênciais;
   - Aplicaitvos de Sessão;padrão;
   - Proteção de Tela;
   - Cores no <kbd>lxterminal</kbd>;
   - Personalizar Visual
   - PCManFM &raquo; Ver &raquo; Path Bar &raquo; Buttons # deixar endereço das pastas com botões
   - PCManFM &raquo; Ver &raquo; Folder View Mode &raquo; Miniaturas # miniaturas dos arquivos nas pastas
   - [x] Preserve folder settings
 - Area de trabalho
   - Transparencia do Painel;
   - Papel de Parede;
   - ...

# Assista o Vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=nHt_LGUEtVo)


## Links úteis

<https://wiki.lxde.org/pt/LXPanel>

<https://wiki.archlinux.org/index.php/XDG_user_directories>

<https://forum.lxde.org/viewtopic.php?f=3&t=36730>

<https://unix.stackexchange.com/questions/77957/lxde-change-battery-icon-in-the-panel>

<https://wiki.lxde.org/en/How_to_take_screenshots>

<http://www.imagemagick.org/script/download.php>

<http://terminalroot.com.br/2017/12/como-customizar-a-aparencia-do-lxde.html>


# Comente!

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



