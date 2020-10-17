---
layout: post
title: "Como Instalar o Mac OS X em VirtualBox no Linux"
date: 2018-03-13 21:09:47
image: '/assets/img/mac/mac-os-x-em-virtualbox-no-linux.jpg'
description: 'Nesse vídeo instalamos o Mac OS X - Sierra na VirtualBox dentro do Gentoo.Existe toda uma configuração própria para essa façanha, além de um script pelo comando VBoxManage.'
tags:
- macos
- macos
- virtualbox
- apple
- virtual
- gentoo
- linux
---

Nesse vídeo instalamos o [Mac OS X - Sierra](https://www.apple.com/br/macos/high-sierra/) na [VirtualBox](https://www.virtualbox.org/) dentro do [Gentoo](http://terminalroot.com.br/tags#gentoo) . Existe toda uma configuração própria para essa façanha, além de um script em [Shell](http://terminalroot.com.br/shell) pelo comando <kbd>VBoxManage</kbd> .

# Assista ao Vídeo

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

<iframe width="920" height="400" src="https://www.youtube.com/embed/2B8Q6IWvVa8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## Download do Mac OS X Sierra
<https://goo.gl/79UDuT>

## Rode o script em Shell Bash abaixo

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

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



