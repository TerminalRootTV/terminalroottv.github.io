---
layout: post
title: "Instale e Configure o ncmpcpp e mpd no seu Linux"
date: 2019-07-30 18:40:02
image: '/assets/img/multimidia/mpd-ncmpcpp-min.jpg'
description: 'Uma das melhores opções no quesito leveza, funcionalidade e velocidade .'
main-class: 'unix'
tags:
- mpd
- ncmpcpp
- multimidia
---

![Instale e Configurar o ncmpcpp e mpd no seu Linux](/assets/img/multimidia/mpd-ncmpcpp-min.jpg "Instale e Configurar o ncmpcpp e mpd no seu Linux")

#### ESCUTAR MÚSICAS É UM DOS HOBBYS PREFERIDOS DA MAIORIA DAS PESSOAS. NESSE TUTORIAL DE HOJE, VAMOS MOSTRAR UMA DAS MELHORES OPÇÕES NO QUESTÃO LEVEZA, FUNCIONALIDADE E VELOCIDADE .

## Introdução

[Music Player Daemon (MPD)](https://www.musicpd.org/) é um servidor de reprodução de música livre e aberto. Ele reproduz arquivos de áudio, organiza listas de reprodução e mantém um banco de dados de músicas. A fim de interagir com ele, um software cliente é necessário. A distribuição do MPD inclui mpc, um simples cliente de linha de comando.

O [ncmpcpp (Cliente de Player de Música NCurses Plus Plus)](https://rybczak.net/ncmpcpp/) é um cliente MPD (Music Player Daemon) baseado em *ncurses* similar ao ncmpc, com alguns recursos novos e aprimorados.

Existe também o [MPC](https://github.com/MusicPlayerDaemon/mpc) que pode ser útil para debug ou até mesmo para você customizar suas reproduções. O mpc é um cliente de linha de comando para o MPD.

## Instalação

Tanto o *mpd* quanto o *ncmpcpp* estão disponíveis na maioria dos repositórios das distribuições [Linux](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Linux), incluindo [BSD](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=BSD) e versões para Windows e Mac. Ou seja, para instalá-los:

{% highlight bash %}
sudo emerge -a mpd ncmpcpp media-sound/mpc # Gentoo, Funtoo ... **
sudo apt install mpd ncmpcpp mpc # Debian, Ubuntu, Linux Mint ...
sudo pacman -S mpd ncmpcpp mpc # Arch Linux, Manjaro, ...
sudo yum install mpd ncmpcpp mpc # Red Hat, CentOS, ...
sudo dnf install mpd ncmpcpp mpc # Fedora
{% endhighlight %}

No [Gentoo](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Gentoo) e similares eu recomendo você adicionar a compilação dos módulos listados abaixo: sudo vim `/etc/portage/package.use/zz-autounmask` e adicione essa linha:

{% highlight bash %}
>=media-sound/ncmpcpp-0.8.2-r1 clock icu outputs taglib visualizer
{% endhighlight %}

E depois é só instalar

{% highlight bash %}
sudo emerge -a ncmpcpp mpd media-sound/mpc
{% endhighlight %}

## Configuração

Crie os diretórios e arquivos necessários para o funcionamento do *mpd*

{% highlight bash %}
mkdir -p ~/.config/mpd && cd ~/.config/mpd
touch database  mpd.conf  mpd.fifo  mpd.log   mpdstate
{% endhighlight %}

Você pode usar as configurações padrão que fica em `/etc/mpd.conf` copiando para seu usuário e editando: `cp /etc/mpd.conf ~/.config/mpd/mpd.conf`, por exemplo o meu está assim:

{% highlight bash %}
db_file            "~/.config/mpd/database"
log_file	   "~/.config/mpd/mpd.log"
music_directory    "~/Música"
pid_file           "~/.config/mpd/mpd.pid"
state_file         "~/.config/mpd/mpdstate"
audio_output {
        type            "pulse"
        name            "pulse audio"
}
audio_output {
    type		"fifo"
    name		"FIFO"
    path		"/tmp/mpd.fifo"
    format		"44100:16:2"
}
{% endhighlight %}

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

Crie também o arquivo de configuração do `mkdir ~/.ncmpcpp && touch ~/.ncmpcpp/config`, meu exemplo:

{% highlight bash %}
ncmpcpp_directory =         "~/.ncmpcpp"
mpd_host =                  "127.0.0.1"
mpd_port =                  "6600"
mpd_music_dir =	            "~/Música"
mpd_crossfade_time = 5
visualizer_fifo_path = "/tmp/mpd.fifo"
visualizer_output_name = "FIFO"
visualizer_in_stereo = "yes"
visualizer_sync_interval = "30"
visualizer_type = "spectrum"
visualizer_look = "◆▋"
message_delay_time = "3"
playlist_shorten_total_times = "yes"
playlist_display_mode = "columns"
browser_display_mode = "columns"
search_engine_display_mode = "columns"
playlist_editor_display_mode = "columns"
autocenter_mode = "yes"
centered_cursor = "yes"
user_interface = "alternative"
follow_now_playing_lyrics = "yes"
locked_screen_width_part = "60"
display_bitrate = "yes"
external_editor = "vim"
use_console_editor = "yes"
header_window_color = "cyan"
volume_color = "yellow"
state_line_color = "yellow"
state_flags_color = "cyan"
progressbar_color = "yellow"
statusbar_color = "cyan"
visualizer_color = "cyan"
mouse_list_scroll_whole_page = "yes"
lines_scrolled = "1"
enable_window_title = "yes"
song_columns_list_format = "(25)[cyan]{a} (40)[]{f} (30)[red]{b} (7f)[green]{l}"
{% endhighlight %}

Depois de tudo configurado, rode o `mpd` e depois o `ncmpcpp` . Para utilizar o ncmpcpp sem dificuldades, veja as hotkeys nesse link:
<https://pkgbuild.com/~jelle/ncmpcpp/>

> Dica, não *inicie* o **MPD** com ~~`sudo`~~ e nem como ~~`root`~~ , se houver um processo dele (`pidof mpd` ou  `ps -A | grep mpd`) , *mate* o processo `sudo killall mpd` e rode com seu usuário normal: `mpd`, ou até mesmo crie um arquivo de inicialização do *mpd* durante sessão do seu usuário de acordo com sua Interface Gráfica ou Gerenciador de Janelas.

### Ficou alguma dúvida ? Então veja o vídeo:

<iframe width="920" height="400" src="https://www.youtube.com/embed/tholV10zDi0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Links úteis

+ <https://www.musicpd.org/>
+ <https://rybczak.net/ncmpcpp/>
+ <https://pt.wikipedia.org/wiki/Music_Player_Daemon>


## Tem algo pra perguntar ou acrescentar ? Comente!    
