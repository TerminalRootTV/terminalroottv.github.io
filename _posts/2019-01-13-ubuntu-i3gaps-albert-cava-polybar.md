---
layout: post
title: "Ubuntu + i3-gaps + Albert + Cava + Polybar"
date: 2019-01-13 16:42:04
image: '/assets/img/dicas/ubuntu-i3gaps-albert-cava-polybar.png'
description: 'Veja como instalar e configurar o i3-gaps, Albert, Cava e Polybar no Ubuntu 18.04'
tags:
- ubuntu
- i3wm
- audio
---

![Ubuntu + i3-gaps + Albert + Cava + Polybar](/assets/img/dicas/ubuntu-i3gaps-albert-cava-polybar.png "Ubuntu + i3-gaps + Albert + Cava + Polybar")


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


Siga o passo a passo abaixo

## 1 - Instalar o i3-gaps

{% highlight bash %}
sudo apt install git libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev -y && git clone https://www.github.com/Airblader/i3 i3-gaps && cd i3-gaps && autoreconf --force --install && rm -rf build/ && mkdir -p build && cd build/ && ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers && make && sudo make install
{% endhighlight %}

> Deslogar, alterar o display manager pra iniciar com o i3, e pressionar 2x enter pra criar os arquivos de configuração do i3 (se não conseguir deslogar via i3, deslogue via terminal).

## 2 - Instalar o Polybar


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


{% highlight bash %}
sudo apt-get install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2 -y && git clone https://github.com/jaagr/polybar.git && cd polybar && sudo ./build.sh
{% endhighlight %}

## 3 - Criar e configurar arquivos necessários

{% highlight bash %}
sudo chown -R $USER:$USER ~/.config/polybar && wget https://gitlab.com/terminalroot/popy/raw/master/launch.sh -O ~/.config/polybar/launch.sh && chmod +x ~/.config/polybar/launch.sh && echo -e 'for_window [class="^.*"] border pixel 0\ngaps inner 10\ngaps outer 2\nexec_always --no-startup-id $HOME/.config/polybar/launch.sh' >> ~/.config/i3/config
{% endhighlight %}

> Deslogar e logar novamente.

## 4 - Instalar o Albert

{% highlight bash %}
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list" && wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_18.04/Release.key -O Release.key && sudo apt-key add - < Release.key && sudo apt-get update && sudo apt-get install albert -y
{% endhighlight %}

+ Rode no terminal <kbd>albert</kbd> *Configure o Hotkey, aplicativos, temas, ...*;
+ Abra o arquivo de configuração do i3 e comente a linha que contém dmenu: <kbd>vi ~/.config/i3/config</kbd>;
+ Adicione a linha <kbd>albert &</kbd> no final do arquivo: <kbd>vi ~/.config/polybar/launch.sh</kbd>;
+ Remova o alsa do painel do Polybar: <kbd>vi ~/.config/polybar/config</kbd>;
+ Reinicie o i3: <kbd>Super + shift + r</kbd>.

## 5 - Instalar o Cava


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


{% highlight bash %}
sudo apt-get install libfftw3-dev libasound2-dev libncursesw5-dev libpulse-dev libtool -y && wget http://ppa.launchpad.net/tehtotalpwnage/ppa/ubuntu/pool/main/c/cava/cava_0.6.0-0ubuntu3_amd64.deb && sudo dpkg -i cava*
{% endhighlight %}

> Toque qualquer música (Youtube, por exemplo) e rode o cava: <kbd>cava</kbd> . Aplicativos recomendados: *neofetch* , *scrot* e *mpg123*. Você pode criar um aplicativo com **Shell Script** no seu Polybar e tocar as músicas que deseja, ex. (ao lado do volume): <kbd>        </kbd> .

# [Clique Aqui Para Assistir o Vídeo](https://youtu.be/uJCgh3nIL84)
 
## Conheça nosso Treinamentos de Shell Script, Vim, Expressões Regulares e Sed
# <http://terminalroot.com.br/cursos>

## Crie Sua Promoção
# <http://terminalroot.com.br/promo>

## Acompanhe todos os vídeos da **Série Shell Script Profissional** 
# [#ShellPro](http://bit.ly/shell-pro-root)

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



