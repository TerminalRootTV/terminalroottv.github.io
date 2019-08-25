---
layout: post
title: "Como criar um Bloqueio de Tela no i3 ou bspwm"
date: 2019-08-25 18:37:25
image: '/assets/img/wm/lock.jpg'
description: 'Existem diversos bloqueadores, mas nesse caso vamos utilizar um específico e bem conhecido pela galera.'
main-class: 'linux'
tags:
- i3lock
- bloqueio
- imagens
---

![Como criar um Bloqueio Tela no i3 ou bspwm](/assets/img/wm/lock.jpg)

Existem diversos bloqueadores, mas nesse caso vamos utilizar um específico e bem conhecido pela galera que é o [i3lock-color](https://github.com/PandorasFox/i3lock-color), nesse caso o do [PandorasFox](https://github.com/PandorasFox/i3lock-color), mas no final vamos citar outros pra você pesquisar.

## Instalação

Vamos compilar o **i3lock-color** , mas como envolve diversas dependências, então sugiro você instalar o [i3lock](https://i3wm.org/i3lock/) , pois o i3lock-color é um fork do i3lock , então todas as dependências serão instaladas via seu gerenciador de pacotes, logo ficará mais fácil.

Lembrando que ainda vamos instalar o [xdpyinfo](https://gitlab.freedesktop.org/xorg/app/xdpyinfo) , para evitar falta se houver. Alguns repositórios não incluem ele e pode ser que precisamos em alguns outros casos.

No meu caso no [Gentoo](https://terminalroot.com.br/2017/05/como-instalar-o-gentoo.html) utilizo o [Portage](https://wiki.gentoo.org/wiki/Portage):

{% highlight bash %}
emerge i3lock xdpyinfo
{% endhighlight  %}

Após instalados agora vamos clonar e compilar o i3lock-color:

{% highlight bash %}
git clone https://github.com/PandorasFox/i3lock-color.git
cd i3lock-color
autoreconf -i && ./configure && make
{% endhighlight  %}

Após construir o binário que ficará pronto no no caminho: `./x86_64-pc-linux-gnu/i3lock` , você pode instalar com `sudo make install` , mas isso irá sobrescrever o *i3lock* original instalado. Então, sugiro que você faça como eu fiz e como o tutorial irá seguir, instale assim:

{% highlight bash %}
sudo mv ./x86_64-pc-linux-gnu/i3lock /usr/local/bin/i3lock-color
{% endhighlight  %}

Ou seja, movemos renomeando, logo temos o i3lock e o i3lock-color!

Se você rodar eles puramente agora, a tela já bloqueia , mas não ficará tão legal, ficará branca e pra desbloquear é só inserir sua senha e pronto.

Mas vamos fazer customizado que fica igual a imagem de chamada desse post. Se sua variável **PATH** não tiver o o diretório `~/.local/bin` inclusa nela, sugiro que inclua, se não souber é porque não está. E para incluir rode esses comandos na ordem (nesse caso é pra quem usa BASH):

{% highlight bash %}
mkdir -p ~/.local/bin
mkdir -p ~/.config/i3lock
wget -q http://bit.ly/wallpapertr -O ~/.config/i3lock/wallpaper.jpg
echo 'PATH="${PATH}:$HOME/.local/bin/"' >> ~/.bashrc
source ~/.bashrc
{% endhighlight  %}

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

Agora vamos criar um comando dentro do novo local da *PATH* . Crie e abra um arquivo com o nome `vim ~/.loca/bin/lockscreen` e insira esse conteúdo:

{% highlight bash %}
#!/bin/sh

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#f1f1f1cc'  # default
T='#FFFFFFFF'  # text
W='#73d216bb'  # wrong
V='#FFFFFFFF'  # verifying

#./x86_64-pc-linux-gnu/i3lock \
i3lock-color \
-i ~/.config/i3lock/wallpaper.jpg \
--insidevercolor=$C   \
--ringvercolor=$V     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--insidecolor=$B      \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
\
--verifcolor=$T        \
--wrongcolor=$T        \
--timecolor=$T        \
--datecolor=$T        \
--layoutcolor=$T      \
--keyhlcolor=$W       \
--bshlcolor=$W        \
\
--screen 1            \
--blur 5              \
--clock               \
--indicator           \
--timestr="%H:%M:%S"  \
--datestr="%A, %m %Y" \
--keylayout 2  2>/dev/null    \
{% endhighlight  %}

Customize o arquivo acima com as cores que deseja, mas note que as cores possuem 8 algarismos em vez de 6 para as cores Hexadecimais. Note que há um caminho da imagem e vamos precisar salvar uma imagem naquele diretório com o nome e extensão iguais.

> Se quiser que bloquei com a imagem de fundo que você está remova essa linha, ou até mesmo insira a imagem que deseja.

Nesse caso o bloqueio será com essa imagem: <http://bit.ly/wallpapertr>

Tudo pronto agora rode o comando: `lockscreen` e pra desbloquear use sua senha, não precisa pressionar ENTER antes, basta inserir a senha.

## Inserindo no seu i3 ou bspwm

Edite seu `~/.config/i3/config` ou o seu `~/.config/sxhkd/sxhkdrc` e crie um comando de bloqueio, exemplos para o [bspwm](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=bspwm), `vim ~/.config/sxhkd/sxhkdrc`

> Nesse caso a combinação de tecla: **Super + X** irá bloquear a tela.

{% highlight bash %}
super + x
	lockscreen
{% endhighlight  %}

O resultado será similar ou igual ao da imagem do início desse artigo. Fácil, né não ? Sugiro você conhecer outras alternativas e customizar suas opções se quiser que fique mais com sua cara!

Se quiser customizar sua imagem com *blur* e/ou *dim* , você pode usar o [ImageMagick](https://terminalroot.com.br/2015/03/tratamento-de-imagens-com-imagemagick.html) ou o [GIMP](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=GIMP), exemplo para o ImageMagick:

{% highlight bash %}
convert -blur 0x30 sua-imagem.jpg com-blur.jpg
{% endhighlight  %}

## Links úteis:

+ <https://github.com/PandorasFox/i3lock-color>
+ <https://i3wm.org/i3lock/>

Outras opções ou complementares:

+ <https://github.com/pavanjadhaw/betterlockscreen/>
+ <https://github.com/benruijl/sflock>
+ <https://github.com/muennich/physlock>

Mais em <https://wiki.archlinux.org/index.php/List_of_applications#Screen_lockers>

Espero que tenham gostado! Ajude compartilhando esse artigo!

Abraços!
    
