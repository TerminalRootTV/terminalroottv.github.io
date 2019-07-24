---
layout: post
title: "Conheça o PacBSD - O Arch Linux com Kernel FreeBSD"
date: 2019-07-21 12:45:12
image: '/assets/img/pacbsd/pacbsd.png'
description: 'Possui o gerenciador de pacotes PacMan e o sistema init OpenRC'
main-class: 'bsd'
tags:
- pacbsd
- bsd
- freebsd
---

![PacBSD](/assets/img/pacbsd/pacbsd.png)

O [PacBSD](https://pacbsd.org/) ( antigamente chamado de **ArchBSD** ) é um sistema operacional baseado no [Arch Linux](https://terminalroot.com.br/2018/08/como-fazer-facilmente-dual-boot-com-windows-7-e-arch-linux.html) , mas usa o kernel do [FreeBSD](https://terminalroot.com.br/2017/09/como-instalar-o-freebsd-11-1.html) ao invés do kernel do [Linux](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Linux) e um ambiente [GNU](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=GNU). O projeto PacBSD começou em um tópico de fórum Arch Linux em abril de 2012. O objetivo é fornecer um ambiente de usuário semelhante ao do Arch, utilizando o sistema init do [OpenRC](https://wiki.gentoo.org/wiki/OpenRC) , o gerenciador de pacotes pacman e um sistema roling release .

O Endereço oficial do PacBSD pode ser acessado pelo link: <https://pacbsd.org/> , onde você pode fazer download do disco de inicialização, notícias e demais informações.

## Alteração do nome do projeto

Inicialmente o projeto tinha o logo e nome do Arch Linux com algumas alterações. No entanto, depararam-se com problemas com a marca registrada e o logo, então precisaram alterar o nome e o logo . O aviso de da mudança de nome pode ser consultado no link: <https://pacbsd.org/news/2015/05/10/project-name-change/> . Veja abaixo a antiga forma de apresentação:

![ArchBSD para PacBSD](/assets/img/pacbsd/archbsd.gif)


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


## Instalação

Após fazer o download do disco de inicialização no link: <https://pacbsd.org/download/> basta seguir o guia de instalação conforme o link: <https://wiki.pacbsd.org/index.php/Official_PacBSD_Install_Guide>, o processo é semelhante ao do Arch Linux, no entanto possui algumas diferenças. Eu de cara me esbarrei com alguns problemas, mas você pode se direcionar com um arquivo `install.txt` que fica na raiz do documento, use `less install.txt` para seguí-lo.

Veja alguns screenshot abaixo do disco de instalação, perceba que eu consegui pingar no site <https://terminalroot.com.br> , ou seja, a rede funcionando, no entanto, não testei em máquina física e muito menos com wi-fi, na documentação não encontrei algo que explicitasse essa parte. O PacBSD utiliza o [Shell](https://terminalroot.com.br/shell) [CSH , C Shell](http://bxr.su/NetBSD/bin/csh/) por padrão.

![PacBSD](/assets/img/pacbsd/pacbsd0.png)
![PacBSD](/assets/img/pacbsd/pacbsd2.png)


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


![PacBSD](/assets/img/pacbsd/pacbsd1.png)

## Conclusão

Eu particularmente gostei do Projeto. Pra quem gosta do [pacman , Package Manager](https://wiki.archlinux.org/index.php/Pacman_(Português)) , não gosta do [SystemD](https://terminalroot.com.br/2019/07/por-que-systemd.html) e é fã de [FreeBSD](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=FreeBSD) é uma boa alternativa para unir os gostos particulares unidos em um só projeto. No momento que escrevi esse artigo estava inciando a instalação na VM, mas vou testar via ethernet numa máquina física e futuramente, se der, vou fazer um vídeo mais detalhado!

E você gostou da ideia do projeto ? Conte-nos nos comentários!

Veja também:

+ [Conheça o NomadBSD uma alternativa ao Tails](https://terminalroot.com.br/2019/06/conheca-o-nomadbsd-uma-alternativa-ao-tailos.html)
+ [Conheça o GhostBSD - Um Sistema Simples, Rápido e Elegante](https://terminalroot.com.br/2019/04/ghostbsd-simples-rapido-elegante.html)
+ [DragonFlyBSD + HerbstluftWM + Lemonbar](https://terminalroot.com.br/2019/02/dragonflybsd-herbstluftwm-lemonbar.html)
+ [NetBSD + ZSH + Oh My ZSH + LXDE c/ Openbox](https://terminalroot.com.br/2018/09/netbsd.html)
+ [OpenBSD - O Sistema mais Seguro do Mundo - Instalação e Configuração](https://terminalroot.com.br/2018/07/openbsd-o-sistema-mais-seguro-do-mundo-instalacao-e-configuracao.html)
+ [Como Compilar Programas no FreeBSD via Ports](https://terminalroot.com.br/2018/02/como-compilar-programas-no-freebsd-via-ports.html)
+ [Como Customizar a Aparencia do LXDE](https://terminalroot.com.br/2017/12/como-customizar-a-aparencia-do-lxde.html)
+ [Como Instalar o Lumina Desktop no FreeBSD](https://terminalroot.com.br/2017/12/como-instalar-o-lumina-desktop-no-freebsd.html)

Abraços!
    

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

