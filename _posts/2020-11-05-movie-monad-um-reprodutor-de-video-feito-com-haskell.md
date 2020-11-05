---
layout: post
title: "Movie Monad - Um Reprodutor de Vídeo feito com Haskell"
date: 2020-11-05 12:22:34
image: '/assets/img/multimidia/moviemonad.gif'
description: 'Um software moderno, leve e simples.'
icon: 'mdi:language-haskell'
iconname: 'haskell'
tags:
- multimidia
- haskell
---

![Movie Monad - Um Reprodutor de Vídeo feito com Haskell](/assets/img/multimidia/moviemonad.gif)

O **Movie Monad** é um reprodutor de vídeo gratuito e simples de usar feito com [Haskell](https://www.haskell.org/). Originalmente, era somente um conceito de reprodução de vídeo para o [Gifcurry](https://lettier.github.io/gifcurry/) (outro ótimo aplicativo - dê uma olhada). Hoje em dia é um reprodutor de mídia leve, mas poderoso, usado em todo o mundo todos os dias.

O Movie Monad é multiplataforma. Assista à vídeos da web ou reproduza os arquivos armazenados em seu computador.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Instalação
No [Linux](https://terminalroot.com.br/tags#linux) há diversas maneiras de instalar. Uma delas e a mais fácil é usando um [AppImage](https://github.com/lettier/movie-monad/releases), alternativamente você pode usar o [app-get](https://github.com/terroo/app-get) para gerenciar e instalar seus [AppImages](https://www.youtube.com/watch?v=F0rsjX7xoOQ), da seguinte forma:

Se ainda não tiver o app-get instalado, rode esses comandos:
{% highlight bash %}
git clone https://github.com/terroo/app-get up-app-get
cd up-app-get
./INSTALL && source ~/.bashrc
cd .. && rm -rf up-app-get/
{% endhighlight %}

E então, instale o [Movie Monad](https://lettier.github.io/movie-monad/)
{% highlight bash %}
app-get moviemonad
{% endhighlight %}

Se você usa [Fedora](https://terminalroot.com.br/tags#fedora), SUSE, [CentOS](https://terminalroot.com.br/tags#centos), [Red Hat](https://terminalroot.com.br/tags#redhat), Flatpak, Flathub ou [GNOME](https://terminalroot.com.br/2018/02/como-customizar-a-aparencia-do-gnome.html). E deseja instalar via [Flatpak](https://flathub.org/apps/details/com.lettier.movie-monad), rode:
{% highlight bash %}
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.lettier.movie-monad
{% endhighlight %}

Se prefere instalar via [snap](https://snapcraft.io/) no [Ubuntu](https://terminalroot.com.br/tags#ubuntu), [Mint](https://terminalroot.com.br/tags#mint), [Debian](https://terminalroot.com.br/tags#debian), Deepin,... rode:
{% highlight bash %}
snap install movie-monad
sudo snap connect movie-monad:removable-media
movie-monad
{% endhighlight %}

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

Se você já está familiarizado com [Haskell](https://terminalroot.com.br/2020/09/conheca-o-projeto-hash-linux-com-xmonad-review.html), rode:
{% highlight bash %}
cd "$HOME/Downloads"
git clone https://github.com/lettier/movie-monad.git
cd movie-monad
stack update
stack setup
stack install alex happy
stack install haskell-gi
stack install
stack exec -- movie-monad
{% endhighlight %}

lembre-se, que para instalação via [stack]() Haskell você precisará das dependências:
+ [GTK+ >= 3.10](https://www.gtk.org/download/index.php)
+ [GStreamer >= 1.0](https://gstreamer.freedesktop.org/download/)
    - [GStreamer Base Plug-ins](https://gstreamer.freedesktop.org/modules/gst-plugins-base.html)
    - [GStreamer Good Plug-ins](https://gstreamer.freedesktop.org/modules/gst-plugins-good.html)
    - [GStreamer Bad Plug-ins >= 1.8](https://gstreamer.freedesktop.org/modules/gst-plugins-bad.html)

# Utilizando
Bom, o Movie Monad funciona igual a qualquer outro [reprodutor de vídeo](https://terminalroot.com.br/2016/05/os-6-melhores-reprodutores-de-video.html) e é muito intuitivo, mas se por algum motivo você não entender o funcionamento, basta dar uma olhada na [documentação do projeto](https://github.com/lettier/movie-monad).

Para mais informações acesse o site oficial: <https://lettier.github.io/movie-monad/>

# Fui

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
