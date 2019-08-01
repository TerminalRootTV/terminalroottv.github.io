---
layout: post
title: "Como Habilitar o Numlock Automáticamente no i3, bspwm e LightDM"
date: 2019-08-01 09:41:10
image: '/assets/img/dicas/numlock-linux.jpg'
description: 'Poupe sua paciência e veja como torná-lo padrão no seu Linux ou Unix-like.'
main-class: 'unix'
tags:
- numlock
- unix
- dicas
---

![Numlock](/assets/img/dicas/numlock-linux.jpg "Numlock")

Quando logamos no sistema às vezes nossa senha contém números e  usamos o numlock automaticamente para digitar a senha, mas em alguns casos ele não está habilitado por padrão, bem como quando logamos no sistema e ás vezes quando ele está desligado acabamos inserindo uma informação diferente e isso pode causar algumas dores de cabeça . Para que isso lhe poupe paciência, vamos ver como torná-lo padrão no seu Linux ou Unix-like.

# Introdução

Para realizar esse feito vamos usar um aplicativo de nome [Numlockx](https://home.kde.org/~seli/numlockx/) que é para uso com o X Window, mas vamos mostrar outras maneiras.

## Instalação

Utilize o gerenciador de pacotes da sua distribuição para instalá-lo:

{% highlight bash %}
sudo emerge x11-misc/numlockx # Gentoo, Funtoo,...
sudo pacman -S numlockx # Arch Linux, Manjaro, ...
sudo apt install numlockx # Debian, Ubuntu, Linux Mint, ...
sudo yum install numlockx # Red Hat, CentOS, ...
sudo dnf install numlockx # Fedora
{% endhighlight %}

## Habilitando

+ Para o LightDM habilitar automaticamente, abra o arquivo: `vim /etc/lightdm/lightdm.conf` com seu [editor de texto](https://terminalroot.com.br/vim) e altere a linha que começa com a palavra **greeter-setup-script** na tag **[Seat:*]** o conteúdo deixando assim:

{% highlight ini %}
[Seat:*]
greeter-setup-script=/usr/bin/numlockx on
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

Ou até mesmo no arquivo do seu diretório pessoal: `~/.xprofile` e insira esse conteúdo: `numlockx &`

+ No bspwm. Se você não utiliza LightDM e deseja que seja automaticamente habilitado no seu [bspwm](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=bspwm) , edite seu *bspwmrc*: `vim $HOME/.config/bspwm/bspwmrc` e insira uma linha com esse conteúdo: `/usr/bin/numlockx on` ou somente `numlockx on`

+ No i3, edite esse arquivo `vim $HOME/.config/i3/config` e insira uma linha com esse conteúdo: `/usr/bin/numlockx on` ou somente `exec numlockx on` .

## Links interessantes:

+ <https://home.kde.org/~seli/numlockx/>
+ <https://wiki.archlinux.org/index.php/Activating_Numlock_on_Bootup_(Português)>

Ficou alguma dúvida ? É só comentar!

Abraços!    
