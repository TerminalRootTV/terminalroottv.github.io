---
layout: post
title: "Como Instalar o Mac OS X em VirtualBox no Linux"
date: 2018-03-13 21:09:47
image: '/assets/img/mac/mac-os-x-em-virtualbox-no-linux.jpg'
description: 'Nesse vídeo instalamos o Mac OS X - Sierra na VirtualBox dentro do Gentoo.Existe toda uma configuração própria para essa façanha, além de um script pelo comando VBoxManage.'
main-class: 'gnu'
tags:
- gentoo
- linux
- macos
---

Nesse vídeo instalamos o [Mac OS X - Sierra](https://www.apple.com/br/macos/high-sierra/) na [VirtualBox](https://www.virtualbox.org/) dentro do [Gentoo](http://terminalroot.com.br/tags#gentoo) . Existe toda uma configuração própria para essa façanha, além de um script em [Shell](http://terminalroot.com.br/shell) pelo comando <kbd>VBoxManage</kbd> .

# Assista ao Vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=2B8Q6IWvVa8)


## Download do Mac OS X Sierra
<https://goo.gl/79UDuT>

## Rode o script em Shell Bash abaixo
{% highlight bash %}
#!/bin/bash
# Script pra fazer funcinar o Mac OS X Sierra na Máquina Virtual no Linux
VBoxManage modifyvm "MacOsSierra" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage setextradata "MacOsSierra" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
VBoxManage setextradata "MacOsSierra" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "MacOsSierra" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage setextradata "MacOsSierra" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "MacOsSierra" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
{% endhighlight %}

# Comente !
