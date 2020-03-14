---
layout: post
title: "OpenBSD - Instalação pelo Disco USB (pendrive)"
date: 2019-05-30 15:30:41
image: '/assets/img/openbsd/openbsd-usb.jpg'
description: 'Esse vídeo é uma compilação de 3 vídeos que mostra o processo completo.'
tags:
- openbsd
- pendrive
- unix
---

![OpenBSD - Instalação pelo Disco U](/assets/img/openbsd/openbsd-usb.jpg)

A instalação do [OpenBSD](https://openbsd.org/) é bem simples quando você usa os métodos *default* , mas algumas pessoas se atrapalham quando vão instalar via disco USB (pendrive). Nesse vídeo/artigo vamos mostrar como fazer.

Nos artigos/vídeos anteriores mostramos

+ [Como Instalar o OpenBSD](http://terminalroot.com.br/2018/07/openbsd-o-sistema-mais-seguro-do-mundo-instalacao-e-configuracao.html)
+ [Como gerenciar seus downloads com wget](https://terminalroot.com.br/2019/05/aprenda-a-explorar-o-comando-wget.html)
+ [O que é uma Função Hash ? Como fazer ?](https://terminalroot.com.br/2019/05/o-que-e-e-como-gerar-uma-hash.html)

Após dar o boot pelo *pendrive* o processo de instalação é o mesmo, diferindo somente em algumas partes durante a instalação.

Durante o processo de instalação é necessário se atentar ao seguinte passo:

## Onde instalar os conjuntos ?

Quando aparecer essa pergunta

{% highlight bash %}
Lets install the sets!
Location of sets? (cd0 disk http or 'done') [cd0]
{% endhighlight %}

Nesse caso é necessário você informar a palavra **disk** , pois VAMOS INSTALAR VIA DISCO USB (PENDRIVE) , escreva **disk** e depois pressione [ENTER]

{% highlight bash %}
Lets install the sets!
Location of sets? (cd0 disk http or 'done') [cd0] disk
{% endhighlight %}

## Caso haja alguma dúvida veja o vídeo abaixo

<iframe width="920" height="400" src="https://www.youtube.com/embed/EWWD56ZPVoQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Quer ficar fera no Terminal e em comandos Linux ?

Conheça nossos cursos de [Shell Script](http://terminalroot.com.br/shell) e [entre outros](http://terminalroot.com.br/cursos).

## Comandos e links úteis

+ `sudo VBoxManage internalcommands createrawvmdk -rawdisk /dev/sdb -filename USB-Boot-Disk.vmdk`
+ `sudo chown $USER:$USER USB-Boot-Disk.vmdk`
+ `sudo usermod -a -G disk [nome_do_usuário]`
+ `sudo dd if=install65.fs of=/dev/sdb status=progress`
+ `growisofs -dvd-compat -speed=8 -Z /dev/cdrom=install65.iso`
+ `cdrecord -v speed=8 dev=1,0,0 -eject -data install65.iso`
+ `lsblk`
+ `df -h`
+ `sudo mkfs.fat /dev/sdbX -n OPENBSD || man 8 mkfs`
+ <http://bit.ly/2HLkvxt>
+ <https://terminalroot.com.br/2019/05/openbsd-instalacao-pelo-disco-usb.html>
+ <http://openbsd.org/>
+ <https://ftp.openbsd.org/pub/OpenBSD/songs/song30.mp3>
+ <https://www.openbsd.org/images/poster33.jpg>

## Comente!

### Valeu!


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

