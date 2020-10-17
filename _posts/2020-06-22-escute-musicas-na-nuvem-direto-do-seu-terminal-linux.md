---
layout: post
title: "Escute músicas na nuvem direto do seu Terminal Linux"
date: 2020-06-22 14:19:29
image: '/assets/img/audio/tizonia.jpg'
description: 'Spotify, Google Play Música, SoundCloud, YouTube, TuneIn, iHeartRadio, Plex e Chromecast.'
icon: 'bi:music-player-fill'
iconname: 'musica'
tags:
- audio
- terminal
- comandos
- multimidia
---

![Escute músicas na nuvem direto do seu Terminal Linux](/assets/img/audio/tizonia.jpg)

**Tizonia** é um poderoso [reprodutor de música](https://terminalroot.com.br/tags/#audio) na nuvem para o [terminal](https://terminalroot.com.br/tags/#terminal) [Linux](https://terminalroot.com.br/linux), com suporte para Spotify (Premium), Google Play Music (gratuito e pago), SoundCloud, YouTube, rádios TuneIn e iHeart, servidores Plex e dispositivos Chromecast. A primeira implementação do mundo do [OpenMAX IL 1.2](https://www.khronos.org/news/press/khronos-group-releases-openmax-il-1.2-provisional-specification). Tizonia é um [software livre](https://terminalroot.com.br/tags/#freesoftware) escrito em [C](https://terminalroot.com.br/tags/#linguagemc)/[C++](https://terminalroot.com.br/tags/#cpp).

# Instalação
O Tizonia está disponível no repositório da maioria das distros [Linux](https://terminalroot.com.br/tags/#linux) bem como [Ubuntu](https://terminalroot.com.br/tags/#ubuntu), [Debian](https://terminalroot.com.br/tags/#debian), [Linux Mint](https://terminalroot.com.br/tags/#linuxmint), [Arch Linux](https://terminalroot.com.br/tags/#archlinux) e entre outros, além também ser possível instalar via [snap](https://snapcraft.io/tizonia) e [Docker](https://terminalroot.com.br/2019/08/tutorial-definitivo-de-docker-para-iniciantes-ubuntu.html)

Se seu sistema é Debian ou Ubuntu, basta você rodar esse comando que utiliza o comando [curl](https://terminalroot.com.br/2019/10/12-dicas-para-voce-usar-o-comando-curl-como-um-ninja.html)
{% highlight bash %}
curl -kL https://goo.gl/Vu8qGR | bash
{% endhighlight %}
<!-- LISTA MIN -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Utilizando via Docker
> Esse passo assume que você já possui o [Docker]() instalado, caso não tenha, veja esse vídeo: [Tutorial Definitivo de Docker para INICIANTES](https://youtu.be/bsGkIKP1OZ4)

O Tizonia se conecta como cliente diretamente ao servidor host PulseAudio e usa sua configuração/dispositivos para emitir o som. Isso é possível mapeando o soquete UNIX usado pelo PulseAudio no host no contêiner e configurando seu uso.

Salve esse [script](https://terminalroot.com.br/shell) em um arquivo de nome [docker-tizonia](https://github.com/tizonia/docker-tizonia)
{% highlight bash %}
#!/bin/bash
USER_ID=$(id -u);
GROUP_ID=$(id -g);
if uname -s | grep -iq "Darwin" ; then
  pulse_server=docker.for.mac.localhost
  runtime_dir="$HOME"
else
  pulse_server=unix:"${XDG_RUNTIME_DIR}/pulse/native"
  runtime_dir="${XDG_RUNTIME_DIR}/pulse"
fi
docker run -it --rm \
    -e PULSE_SERVER="$pulse_server" \
    --volume="$runtime_dir":"$runtime_dir" \
    --volume="${HOME}/.config/tizonia":/home/tizonia/.config/tizonia \
    --volume="${HOME}/.config/pulse/cookie":/home/tizonia/.config/pulse/cookie \
    --volume="${HOME}/.cache":/home/tizonia/.cache \
    --name tizonia \
    tizonia/docker-tizonia "$@";
{% endhighlight %}

Dê permissão e instale:
{% highlight bash %}
chmod +x docker-tizonia
sudo install docker-tizonia /usr/local/bin
{% endhighlight %}

Exemplo de utilização:
{% highlight bash %}
docker-tizonia --youtube-audio-mix-search "Queen Official"
{% endhighlight %}

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

> Haverá um arquivo em `$HOME/.config/tizonia`, se não houver crie-o e dê permissões de gravação no mesmo: `chmod a+wrx $HOME/.config/tizonia`

# Uso geral
+ Google Play Music
{% highlight bash %}
tizonia --help googlemusic
{% endhighlight %}
+ YouTube
{% highlight bash %}
tizonia --help youtube
{% endhighlight %}

# Conclusão
Se você gosta da [linha de comando](https://terminalroot.com.br/tags/#comandos) e gosta de ouvir música *online*, provavelmente se apaixonará pela simplicidade e limpeza da Tizonia. Com a capacidade de transmitir música e reproduzir conteúdo local, este software de código aberto é um dos meus favoritos, embora a funcionalidade sem intervalos atualmente não funcione com o Spotify.

Uma das muitas vantagens do software de linha de comando é que eles geralmente são mais econômicos com os recursos do sistema. Ao reproduzir o áudio armazenado localmente, o Tizonia consome apenas 18 MB de RAM. O streaming do Spotify consumiu 34 MB de RAM, enquanto o streaming com o cliente oficial da GUI pesava 612 MB!

# Tizonia links
+ Endereço oficial: [tizonia.org](https://tizonia.org/)
+ Suporte: [Documentação](https://docs.tizonia.org/), [GitHub](https://github.com/tizonia/tizonia-openmax-il), [Gitter](https://gitter.im/tizonia/Lobby)
+ Desenvolvedor: Juan A. Rubio
+ Licença: GNU Lesser General Public License v3.0



