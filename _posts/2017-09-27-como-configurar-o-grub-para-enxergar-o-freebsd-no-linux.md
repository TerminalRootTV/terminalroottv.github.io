---
layout: post
title: "Como Configurar o Grub Para Enxergar o FreeBSD no Linux"
date: 2017-09-27 07:21:26
image: '/assets/img/grub/grub-linux-freebsd.jpg'
description: "Caso você não consiga enxergar o FreeBSD no grub (no GNU/Linux), você precisa efetuar algumas modificações no grub pra enxergar o FreeBSD."
tags:
- freebsd
- linux
- grub
---

> Caso você não consiga enxergar o [FreeBSD](http://terminalroot.com.br/tags#freebsd) no grub (no [GNU](http://terminalroot.com.br/tags#gnu)/[Linux](http://terminalroot.com.br/tags#linux)), você precisa efetuar algumas modificações no grub pra enxergar o __FreeBSD__.

Edite o arquivo
{% highlight bash %}
sudo nano /etc/grub.d/40_custom
{% endhighlight %}

Dentro desse arquivo, insira o conteúdo abaixo, lembrando que o __hd0__ dependerá da ordem do seu __HD__ e o __3__ o número da __partição__.
{% highlight bash %}
menuentry "FreeBSD RELEASE 11.1" {
	insmod ufs2
	set root=(hd0,3)
	kfreebsd /boot/loader
}
{% endhighlight %}

Depois atualize o grub
{% highlight bash %}
update-grub
{% endhighlight %}

## Veja o vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=WLVKaJeKejU)


## Links Úteis
<https://www.gnu.org/software/grub/manual/grub/>

## Comente

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

