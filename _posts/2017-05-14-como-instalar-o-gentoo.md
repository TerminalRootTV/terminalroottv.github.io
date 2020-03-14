---
layout: post
title: "Como Instalar o Gentoo"
date: 2017-05-14 15:58:22
image: '/assets/img/gentoo/gentoo-install.jpg'
description: "O Gentoo é uma distribuição veloz e moderna com um projeto limpo e flexível."
tags:
- gentoo
- linux
---

> O [Gentoo](https://www.gentoo.org/) é uma [distribuição](https://pt.wikipedia.org/wiki/Distribui%C3%A7%C3%A3o_Linux) veloz e moderna com um projeto limpo e flexível. O Gentoo é construído em torno de um ecossistema de [software livre](https://www.gnu.org/philosophy/free-sw.pt-br.html) e não esconde de seus usuários o que está "sob o capô do motor". O [Portage](https://pt.wikipedia.org/wiki/Portage), o sistema de gerenciamento de pacotes utilizado pelo Gentoo, é escrito em [Python](http://www.terminalroot.com.br/tags#python), o que significa que o usuário pode facilmente ver e modificar o código fonte. O sistema de pacotes do Gentoo usa código fonte (mas o suporte para pacotes pré-compilados também é incluído) e a configuração do Gentoo é feita através de arquivos texto comuns. Em outras palavras, __tudo acontece de forma muito clara e aberta__.

### Abaixo do vídeo há a linha e ordem de todos os comandos utilizados durante a instalação, bem como os links úteis!

> __Observação:__ A instalação foi feita para [32-bit](https://pt.wikipedia.org/wiki/32_bits).

## Assista o vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=BD1wIoX0E2c)


# Todos os Comandos Utilizados

- __1__ - Faça o download do arquivos: [minimal-cd](http://distfiles.gentoo.org/releases/x86/autobuilds/current-install-x86-minimal/install-x86-minimal-20170411.iso), [DIGEST do minimal-cd](http://distfiles.gentoo.org/releases/x86/autobuilds/current-install-x86-minimal/install-x86-minimal-20170411.iso.DIGESTS), [Stage3](http://distfiles.gentoo.org/releases/x86/autobuilds/current-install-x86-minimal/stage3-i686-20170411.tar.bz2) e [DIGEST do Stage3](http://distfiles.gentoo.org/releases/x86/autobuilds/current-install-x86-minimal/stage3-i686-20170411.tar.bz2.DIGESTS).
{% highlight bash %}
wget http://distfiles.gentoo.org/releases/x86/autobuilds/current-install-x86-minimal/install-x86-minimal-20170411.iso
wget http://distfiles.gentoo.org/releases/x86/autobuilds/current-install-x86-minimal/install-x86-minimal-20170411.iso.DIGESTS
wget http://distfiles.gentoo.org/releases/x86/autobuilds/current-install-x86-minimal/stage3-i686-20170411.tar.bz2
wget http://distfiles.gentoo.org/releases/x86/autobuilds/current-install-x86-minimal/stage3-i686-20170411.tar.bz2.DIGESTS
{% endhighlight %}

- __2__ - Teste a conexão com a internet
{% highlight bash %}
ifconfig
ping -c3 www.terminalroot.com.br
{% endhighlight %}

> Se a rede não funcionar, [tente conectar manualmente](https://www.youtube.com/watch?v=q3oaZ4SIbkA).

- __3__ - Particionando os Discos
{% highlight bash %}
fdisk /dev/[dispositivo]
# p - mostra as partições, se houverem
# n - cria uma nova partição
# w - escreve as mudanças
# t - altera o tipo de partição, 82 é pra swap
{% endhighlight %}

- __4__ - Formatar as partições(ext4) e Criar e Ativar a Swap
{% highlight bash %}
mkfs.ext4 /dev/[dispositivo][n°]
mkswap /dev/[swap]
swapon
{% endhighlight %}

- __5__ - Montando as partições
{% highlight bash %}
mount /sda/[dispositivo-root] /mnt/gentoo
mkdir /mnt/gentoo/boot
mount /sda/[dispositivo-boot] /mnt/gentoo/boot
{% endhighlight %}

- __6__ - Ajustando a data e a hora
{% highlight bash %}
date [MesDiaHoraMinutoAno]
{% endhighlight %}

- __7__ - Baixando e Descompactando o Stage3
{% highlight bash %}
cd /mnt/gentoo/
wget http://distfiles.gentoo.org/releases/x86/autobuilds/current-install-x86-minimal/stage3-i686-20170411.tar.bz2
tar xvjpf stage3-*.tar.bz2 --xattrs --numeric-owner
{% endhighlight %}

- __8__ - Configurando o espelho do repositório
{% highlight bash %}
mirrorselect -i -o >> /mnt/gentoo/etc/portage/make.conf
mkdir /mnt/gentoo/etc/portage/repos.conf
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
cp -L /etc/resolv.conf /mnt/gentoo/etc/
{% endhighlight %}

- __9__ - Clonando diretórios do sistema (para o [OpenRC](https://wiki.gentoo.org/wiki/OpenRC), se usar o systemd, use o *--make-rslave* para __/dev__ e __/sys__)
{% highlight bash %}
mount -t proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
{% endhighlight %}

- __10__ - Entrando no novo ambiente
{% highlight bash %}
chroot /mnt/gentoo /bin/bash
source /etc/profile
export PS1="(chroot) $PS1"
{% endhighlight %}

- __11__ -  Atualizando o repositório do Portage
{% highlight bash %}
emerge --sync
{% endhighlight %}

- __12__ - Atualizando o conjunto @world
{% highlight bash %}
emerge --ask --update --deep --newuse @world
{% endhighlight %}

- __13__ - Escolhendo um perfil (tipo de instalação)
{% highlight bash %}
eselect profile list
eselect profile set 1
{% endhighlight %}

- __14__ - Configurando Fuso Horário e Localização
{% highlight bash %}
ls /usr/share/zoneinfo
# Para que está no lado oeste do Brasil
echo "Brazil/West" > /etc/timezone
emerge --config sys-libs/timezone-data
echo "pt_BR UTF-8" >> /etc/locale.gen
locale-gen
eselect locale set 617
# Recarregar o novo perfil
env-update && source /etc/profile && export PS1="(chroot) $PS1"
{% endhighlight %}

<div id="simulacao"></div>
<br />

***

> __A PARTIR DESSA PARTE FICOU EDITADO/SIMULADO/ALTERADO NO VÍDEO, POR CONTA DO CONGELAMENTO DO VIRTUALBOX, MAS SEGUE O QUE FOI FEITO__

- __15__ - Download, extração e compilação do [Kernel Linux](https://www.kernel.org/)

> Houve __demora excessiva__ ao baixar o __Kernel__ pelo __emerge__, então cancelei o processo e baixe o kernel pelo <https://www.kernel.org/>. Depois extrai e depois instalei o genkernel e rodei a compilação padrão.

{% highlight bash %}
cd /usr/src/
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.9.28.tar.xz
tar -Jxvf linux-*.tar.xz
ln -s linux-*/ linux
emerge --ask sys-kernel/genkernel
genkernel all
{% endhighlight %}

- __16__ - Configurando a rede
{% highlight bash %}
emerge --ask --noreplace net-misc/netifrc
emerge --ask net-misc/dhcpcd
nano /etc/conf.d/hostname
# hostname="terminalroot"
nano /etc/conf.d/net
# dns_domain_lo="gentoolinux"
nano /etc/conf.d/net
# config_[dispositivo-de-rede]="dhcp"
{% endhighlight %}

- __17__ - Instalando e Configurando o bootloader
{% highlight bash %}
emerge --ask --verbose sys-boot/grub:2
grub-install /dev/[dispositivo] # exemplo: /dev/sda (sem nenhum número)
grub-mkconfig -o /boot/grub/grub.cfg
{% endhighlight %}

- __18__ - Criando senha de __root__ e Rebootando o Sistema
{% highlight bash %}
passwd
reboot
# rezar =)
{% endhighlight %}



## Links Úteis

<https://www.gentoo.org/>

<https://wiki.gentoo.org/wiki/Handbook:X86/Installation/About/pt-br>

<https://www.gentoo.org/downloads/>


# Faça nosso curso gratuito de Shell Bash e adquira todo conteúdo nesse link
<http://www.terminalroot.com.br/shell/>

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

