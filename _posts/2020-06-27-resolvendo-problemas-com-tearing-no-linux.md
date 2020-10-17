---
layout: post
title: "Resolvendo problemas com Tearing no Linux"
date: 2020-06-27 16:49:12
image: '/assets/img/dicas/tearing.jpg'
description: 'Dica para sua tela não ficar "cortada" ao meio.'
icon: 'bx:bxs-video-off'
iconname: 'video'
tags:
- dicas
- video
- linux
---

![Imagem Exemplo de Tearing](/assets/img/dicas/tearing.jpg)


> Primeiramente você precisa instalar os pacotes: `linux-firmware` e `xf86-video-intel` com o devido nome da sua distro , adicione seu usuário ao grupo video, se ainda não estiver:
Verifique os grupos que vc faz parte:

{% highlight bash %}
groups $USER
{% endhighlight %}

Se não fizer, adicione com o comando:
> exemplo:
{% highlight bash %}
gpasswd -a marcos video
{% endhighlight %}

Se usar Gentoo, habilite esses drivers/módulos no kernel de acordo com [esse link](https://wiki.gentoo.org/wiki/Intel#Firmware) , depois adicione a variável `VIDEO_CARDS` com o número da geração do seu processador(para saber qual geração do seu processador [veja aqui](https://wiki.gentoo.org/wiki/Intel#Feature_support) ) ao seu `/etc/portage/make.conf`. O meu, por exemplo, é *Gen4*, logo seu número é **i965** , então minha variável fica:
{% highlight bash %}
VIDEO_CARDS="intel i965"
{% endhighlight %}

e também possuir esse arquivo e com essa configuração:
{% highlight bash %}
sudo mkdir -p /etc/X11/xorg.conf.d
vim /etc/X11/xorg.conf.d/20-intel.conf
{% endhighlight %}

Insira esse conteúdo abaixo:
{% highlight bash %}
Section "Device"
    Identifier  "Intel Graphics"
    Driver      "intel"
    Option      "AccelMethod"    "uxa"
    Option     	"TearFree" 	"true" 
EndSection
{% endhighlight %}

Reinicie seu computador

Depois abra o Firefox e digite na barra de navegação: `about:config` e em seguida aceite **Usar com cautela** aff! :( e procure esse termo no campo de pesquisa:

**layers.acceleration.force-enabled** , clique no mesmo para deixá-lo com **true**, reinicie o Firefox(feche e abra novamente) e teste se está tudo certo.

Caso algo dê errado, mas só se der errado, use essa linha também no seu `20-intel.conf`: *`Option  	"TripleBuffer" "true"`*. 

Muito provavelmente, resolverá!

Links úteis:
+ https://wiki.gentoo.org/wiki/Intel
+ https://wiki.archlinux.org/index.php/Intel_graphics_(Português)#X_trava_com_o_driver_intel
+ https://www.reddit.com/r/archlinux/comments/8w8jxi/video_tearing_in_firefox_only/
+ https://forums.linuxmint.com/viewtopic.php?t=226953





