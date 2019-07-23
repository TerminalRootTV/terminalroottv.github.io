---
layout: post
title: "Conheça o Flameshot e Faça Capturas de Tela com Edição Rápida"
date: 2019-07-22 22:18:47
image: '/assets/img/dicas/flameshot.png'
description: 'Possui uma interface interativa com controles para selecionar a região de captura desejada.'
main-class: 'linux'
tags:
- flameshot
- linux
- scrot
---

![Flameshot](/assets/img/dicas/flameshot.png)

![Flameshot Gif](https://flameshot.js.org/_media/animatedUsage.gif)

[Flameshot](https://flameshot.js.org/) é um programa para Capturas de Tela (Screenshot). Possui uma interface interativa com controles para selecionar a região de captura desejada, mover e redimensionar a janela de captura, fazer edições com ferramentas de desenho comuns (lápis, linha, retângulo, círculo, desfoque, desfazer/refazer) e escolher o destino de saída para área de transferência, salve em disco, carregue para Imgur , abra com outro programa).

## Instalação

O Flameshot está disponível na maioria dos repositórios das [distribuições Linux](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Distro), logo é possível instalá-lo via o seu gerenciador de pacotes, veja os procedimentos abaixos para algumas distribuições.

{% highlight bash %}
sudo pacman -S flameshot # Arch Linux, Manjaro, ...
sudo apt install flameshot # Debian, Ubuntu, Mint, ...
xbps-install flameshot # Void
sudo dnf install flameshot # Fedora
{% endhighlight %}

Se não estiver disponível para sua distro, você pode compilar que é bem rápido, pois foi justamente o que eu fiz aqui no [Gentoo](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Gentoo)

> Lembre-se que antes vocẽ precisa instalar as dependências: `Qt >= 5.3 #Development tools e SVG` , `GCC >= 4.9.2` e opcionalmente `Git OpenSSL CA Certificates`.

{% highlight bash %}
git clone https://github.com/lupoDharkael/flameshot.git
cd flameshot/
mkdir build
cd build
qmake ../
make
sudo make install
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

Se quiser você ainda pode baixar a imagem do contêiner e rodar via *Docker*

{% highlight bash %}
KEY=$(xauth list | grep $(hostname) | awk '{ print $3 }' | head -n 1)
DCK_HOST=docker-flameshot
xauth add $DCK_HOST/unix:0 . $KEY

docker run -it --rm \
    -e DISPLAY=unix$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/.Xauthority:/root/.Xauthority \
    -e XAUTHORITY=/root/.Xauthority \
    -h $DCK_HOST \
    manuellr/flameshot
{% endhighlight %}

Ou até mesmo rodar como AppImage: <https://github.com/flameshotapp/packages/releases>

## Utilização

Após instalado, basta procurar no Dash e abrí-lo, ou usar via linha de comando, caso deseje: `flameshot gui` , veja mais opções utilizando o help e o manual.

Você também pode adaptá-lo ao seu Ambiente de trabalho:

+ Exemplo no [GNOME](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=GNOME): Pesquise a palavra **Atalho** no campo de pesquisa do GNOME e abrirá uma janela para criar/alterar atalhos, role até o final e crie um comando personalizado, por exemplo, para o atalho **Alt+Shift+p** (Ou até mesmo para a tecla Print Screen , escolha à seu gosto) conforme imagem abaixo:

![Atalho GNOME](/assets/img/dicas/atalho-gnome.jpg)

+ Exemplo no [bspwm](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=bspwm) , perceba que foi criado um atalho para o [scrot](https://github.com/dreamer/scrot) (Você poderia também usar o [maim]() que é uma melhoria do *scrot*) e um Print customizado com Shift para o Flameshot, essas linha devem ser adicionadas no arquivo `~/.config/sxhkd/sxhkdrc`

> Também foi adicionada uma [notificação](https://terminalroot.com.br/2019/07/monitorando-a-bateria-do-notebook-via-shell-script-no-i3-bspwm-ou-outros.html) para registrar a Captura, [clique aqui para saber mais sobre essa notificação](https://terminalroot.com.br/2019/07/monitorando-a-bateria-do-notebook-via-shell-script-no-i3-bspwm-ou-outros.html)

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
# Screenshot Print
Print
 	scrot '%Y-%m-%d-%H-%m-%S_$wx$h.png' -e 'mv $f ~/Imagens/capturas' && notify-send -t 4000 --icon=camera-photo "Screenshot realizado" "Gravado no diretório"

shift + Print
	flameshot gui
{% endhighlight %}

+ Exemplo no [i3]() , perceba que também foi criado um atalho para o [scrot](https://github.com/dreamer/scrot) (Você poderia também usar o [maim](https://github.com/naelstrof/maim) que é uma melhoria do *scrot*) e um Print customizado com Shift para o Flameshot, essas linha devem ser adicionadas no arquivo `~/.config/i3/config`

> Também foi adicionada uma [notificação](https://terminalroot.com.br/2019/07/monitorando-a-bateria-do-notebook-via-shell-script-no-i3-bspwm-ou-outros.html) para registrar a Captura, [clique aqui para saber mais sobre essa notificação](https://terminalroot.com.br/2019/07/monitorando-a-bateria-do-notebook-via-shell-script-no-i3-bspwm-ou-outros.html)

{% highlight bash %}
#interactive screenshot by pressing printscreen
bindsym Print exec scrot '%Y-%m-%d-%H-%m-%S_$wx$h.png' -e 'mv $f ~/Imagens/capturas' && notify-send -t 4000 --icon=camera-photo "Screenshot realizado" "Gravado no diretório" 
#crop-area screenshot by pressing Mod + printscreen
bindsym $mod+Print exec flameshot gui
{% endhighlight %}

Depois de fazer seleção e/ou edição, basta clicar no ícone de Salvar **👇️**

<h1 class="text-center">
    <i class="fas fa-save"></i>
</h1> 

E escolher o local para guardar o Print. 😀️

![Flameshot](/assets/img/dicas/flameshot-1.png)
![Flameshot](/assets/img/dicas/flameshot.png)

## Links úteis
+ <https://flameshot.js.org>
+ <https://github.com/lupoDharkael/flameshot>
+ <https://github.com/dreamer/scrot>
+ <https://github.com/naelstrof/maim>

    
