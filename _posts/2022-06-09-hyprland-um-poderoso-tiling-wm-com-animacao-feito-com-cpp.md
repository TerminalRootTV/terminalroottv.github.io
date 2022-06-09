---
layout: post
title: "Hyprland - Um poderoso Tiling WM com Animação feito com C++"
date: 2022-06-09 09:17:38
image: '/assets/img/wm/hyprland.png'
description: ' Um compositor para Wayland que lembra de forma moderna o famoso Compiz.'
icon: 'ion:terminal-sharp'
iconname: 'WM'
tags:
- wm
- unixporn
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Hyprland** é um Wayland Compositor que possui animações simples e é configurável de forma fácil por arquivo dinâmico.

Possui diversos recursos específicos, tais como:
+ Particionamento de espaço binário
+ Mosaico dinâmico
+ Scratchpad
+ Baixo uso de CPU
+ Utilização fácil
+ Suporte para múltiplos monitores
+ Bordas arredondadas
E entre outros.

Veja abaixo um vídeo exemplo do Hyprland funcionando:

<link rel="stylesheet" href="/assets/css/plyr.css" />
<style>
#plyr-main { width: 800px;}
</style>

<div id="plyr-main">
  <video id="player" playsinline controls data-poster="/assets/img/wm/hyprland.png">
    <source src="/assets/img/wm/hyprland.mp4" type="video/mp4" />
  </video>
</div>

<script src="/assets/js/plyr.js"></script>
<script>
  const player = new Plyr('#player');
</script>

---

# Instalação
Você pode construir o Hyprland do zero, para isso você vai precisar das dependências de construção:
+ [Git](https://terminalroot.com.br/tags#git)
+ [g++](https://terminalroot.com.br/tags#gcc)
+ [GNU Make](https://terminalroot.com.br/tags#make)

E em seguida, basta clonar, compilar e instalar:

{% highlight sh %}
git clone --recursive https://github.com/vaxerski/Hyprland
cd Hyprland
sudo make install
{% endhighlight %}

Existe pacotes binários para o [Arch](https://terminalroot.com.br/2020/12/como-instalar-pacotes-do-aur-via-yay-no-arch-linux.html) e [NixOS](https://terminalroot.com.br/2021/12/nixos-um-sistema-operacional-para-programadores.html) veja [aqui](https://github.com/vaxerski/Hyprland/wiki/Installation) mais detalhes.

---

# Configuração
O arquivo de configuração segue os padrões e fica no seu diretório pessoal em `~/.config` , logo, use o exemplo do projeto clonado para criar um:

{% highlight sh %}
mkdir -p ~/.config/hypr
cp examples/hyprland.conf ~/.config/hypr/
{% endhighlight %}
> Altere as configurações do arquivo conforme desejar, para mais detalhes veja [aqui](https://github.com/vaxerski/Hyprland/wiki/Configuring-Hyprland) e para os primeiros passos acesse [esse](https://github.com/vaxerski/Hyprland/wiki/Quick-start) link.

Acesse o repositório oficial do Hyprland no GitHub:
+ <https://github.com/vaxerski/Hyprland>

