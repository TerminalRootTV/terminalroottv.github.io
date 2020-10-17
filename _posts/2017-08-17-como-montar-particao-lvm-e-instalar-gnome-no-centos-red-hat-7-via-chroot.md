---
layout: post
title: "Como Montar Partição LVM e Instalar GNOME no CentOS-Red Hat 7 via chroot"
date: 2017-08-17 21:29:59
image: '/assets/img/redhat/serie-centos-redhat-2.jpg'
description: "LVM é um método de alocar espaço do disco rígido em volumes lógicos que podem ser facilmente redimensionados, ao contrário das partições."
tags:
- redhat
- centos
---

> Após instalar o sistema mínimo do [CentOS 7 Red Hat](https://www.youtube.com/playlist?list=PLUJBQEDDLNcnr4BziCur10Ot9EGzBCn4_), o próximo passo é necessário instalar o Ambiente Gráfico, nesse caso instalamos o GNOME via chroot, mas para isso foi necessário montar a partição LVM da seguinte forma.

### Instalação do LVM na sua distribuição
+ No [Gentoo](http://terminalroot.com.br/tag#gentoo) (Geralmente já é instalado por padrão, mas caso não esteja por algum motivo)
{% highlight bash %}
emerge --ask sys-fs/lvm2
{% endhighlight %}

+ No [Debian](http://terminalroot.com.br/tag#debian) e derivados (Ubuntu, Linux Mint,...)
{% highlight bash %}
sudo apt-get install lvm2
{% endhighlight %}

### Ativar os volumes lógicos
{% highlight bash %}
vgscan
vgchange -a y
{% endhighlight %}

### Listar Volumes Lógicos
{% highlight bash %}
pvs
lvdisplay
{% endhighlight %}

### Montar Volume
{% highlight bash %}
mkdir /mnt/linux
mount /dev/VOLUME/root /mnt/linux
{% endhighlight %}

> Detalhe, caso deseje, para não haver problema com o __D-bus__, monte também os dispositos __proc__ , __sys__ e __dev__
{% highlight bash %}
mount -t proc /proc /mnt/linux/proc
mount --rbind /sys /mnt/linux/sys
mount --rbind /dev /mnt/linux/dev
{% endhighlight %}

### Fazer chroot
{% highlight bash %}
cd /mnt/linux && chroot . /bin/bash
{% endhighlight %}

> Caso haja haja ~~erro~~ da variável do shell '__vte_prompt_command' , resolva com esse comando
{% highlight bash %}
__vte_prompt_command(){ true; }
{% endhighlight %}

### Atualize o Sistema
{% highlight bash %}
yum update
{% endhighlight %}

### Instale o GNOME
{% highlight bash %}
yum groupinstall "Desktop de GNOME"
{% endhighlight %}

### Tornar inicializável
{% highlight bash %}
systemctl set-default graphical.target
{% endhighlight %}

### Não esqueça de sair do chroot, sair do diretório e desmontar a partição
{% highlight bash %}
exit
cd
umount /mnt/linux
{% endhighlight %}

## Quando o sistema for inicializado, irá pedir para aceitar a LICENÇA, uma tela similiar a essa
![Aceitar Licença](/assets/img/redhat/aceitar-licensa.jpg "Aceitar Licença CentOS 7 Red Hat")

> Basta clicar na parte que está vermelha e depois marcar a opção "__Aceito 0s termos...__" e depois em FINALIZADO

> Caso tenha dificuldade, eu mesmo tive que fazer algumas _manobras_ , você pode instalar todo o sistema já com GNOME 3-bit no link abaixo

[CLIQUE AQUI PARA BAIXAR O CENTOS 7 RED HAT COM GNOME 32 BITS](http://mirror.centos.org/altarch/7/isos/i386/CentOS-7-i386-LiveGNOME-1611.iso)

## Assista o vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=QDEnR3ZfrXY)


## Esse vídeo faz parte da série
[#VamosUsarRedHat](https://www.youtube.com/playlist?list=PLUJBQEDDLNcnr4BziCur10Ot9EGzBCn4_) ou [#VamosUsarCentOS](https://www.youtube.com/playlist?list=PLUJBQEDDLNcnr4BziCur10Ot9EGzBCn4_)

## Links Úteis

<https://pt.wikipedia.org/wiki/Logical_Volume_Manager_(Linux)>

<http://web.mit.edu/rhel-doc/3/rhel-sag-pt_br-3/ch-lvm-intro.html>

<https://www.vivaolinux.com.br/dica/Criando-LVM-(Logical-Volume-Manager)>

<http://www.helviojunior.com.br/it/como-montar-um-volume-linux-lvm-no-linux/>

## Deixe seu comentário!

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



