---
layout: post
title: "Como Instalar o Funtoo pelo Ubuntu ou Linux Mint"
date: 2018-10-30 00:00:40
image: '/assets/img/funtoo/funtoo.jpg'
description: 'Funtoo é um Sistema Operacional livre com o kernel Linux, baseado no Gentoo.'
main-class: 'misc'
tags:
- funtoo
- shellscript
- bash
---

> [Funtoo](https://www.funtoo.org/) é um Sistema Operacional livre, baseado em [Linux](https://cse.google.com/cse?q=linux&cx=004473188612396442360:qs2ekmnkweq), baseado no [Gentoo](https://cse.google.com/cse?q=gentoo&cx=004473188612396442360:qs2ekmnkweq) e iniciado em torno de 2008 por Daniel Robbins. [+ Saiba Mais](https://pt.wikipedia.org/wiki/Funtoo)

![Como Instalar o Funtoo pelo Ubuntu ou Linux Mint](/assets/img/funtoo/funtoo.jpg "Como Instalar o Funtoo pelo Ubuntu ou Linux Mint")

Através do Ubuntu configuramos nossa tabela de partição utilizando o [Gparted](http://terminalroot.com.br/2017/09/como-utilizar-o-gparted.html) criando as seguintes partições dentro de uma partição extendida:

![Tabela Dual Boot Gparted](/assets/img/funtoo/tabela-dualboot-gparted.jpg "Tabela Dual Boot Gparted")

Após isso, montamos as partições de root e boot e baixamos o stage3 para instalação do Funtoo 64-bit para dentro do diretório montado a partição de root e logo após isso já o descompactamos:

{% highlight bash %}
mkdir /mnt/funtoo
mount /dev/sda7 /mnt/funtoo
mkdir /mnt/boot
mount /dev/sda5 /mnt/funtoo/boot
cd /mnt/funtoo
wget https://build.funtoo.org/funtoo-current/x86-64bit/generic_64/stage3-latest.tar.xz
tar xvpf stage3-latest.tar.xz
{% endhighlight %}

Depois montamos os dispositivos necessários para efetuarmos o `chroot` e o fazemos em seguida;

{% highlight bash %}
mount -t proc /proc /mnt/funtoo/proc
mount --rbind /sys /mnt/funtoo/sys
mount --rbind /dev /mnt/funtoo/dev
cp /etc/resolv.conf /mnt/funtoo/etc/resolv.conf
chroot /mnt/funtoo /bin/bash
{% endhighlight %}

> Caso seu teclado esteja desconfigurado rode o comando: `loadkeys br-abnt2`

E então sincronizamos a àrvore de diretório do Portage com a oficial do Funtoo utilizando o comando `ego` e logo depois alteramos a fstab (mudamos o número das partições e alteramos o boot de noauto para defaults) e em seguida atualizamos os aplicativos do Portage:

{% highlight bash %}
vi fstab
ego sync
emerge -auDN @world # demora um pouquinho :)
{% endhighlight %}

Tratamos erros, adicionamos serviços para iniciar com o OpenRC e instalamos e configuramos o grub:

{% highlight bash %}
echo 'funtoo' >> /etc/hostname
etc-update --automode -5
rc-update add dhcpcd default
emerge -a grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
{% endhighlight %}

Com tudo finalizado, saimos do chroot e desmontamos os dispositivos e reiniciamos a máquina para conferir

{% highlight bash %}
exit
cd && umount -Rl /mnt/funtoo
reboot # ou sudo reboot
{% endhighlight %}

## Assista o vídeo completo da instalação
# [Clique Aqui Para Assistir ao Vídeo](https://youtu.be/DPcFPj8snwM)

## Links Adicionais e Citados no vídeo

+ [Como Instalar o Gentoo](http://terminalroot.com.br/2017/05/como-instalar-o-gentoo.html)
+ [Como Instalar Facilmente o Arch Linux](http://terminalroot.com.br/2018/07/como-instalar-facilmente-o-arch-linux.html)
+ [Como Utilizar o GParted](http://terminalroot.com.br/2017/09/como-utilizar-o-gparted.html)
+ [Como fazer FACILMENTE Dual Boot com Windows 7 e Arch Linux](http://terminalroot.com.br/2018/08/como-fazer-facilmente-dual-boot-com-windows-7-e-arch-linux.html)

## Conheça nosso Treinamentos de Shell Script, Vim e Expressões Regulares
# <http://terminalroot.com.br/cursos>

## Crie Sua Promoção
# <http://terminalroot.com.br/promo>

## Acompanhe todos os vídeos da **Série Shell Script Profissional** [#ShellPro](http://bit.ly/shell-pro-root)
